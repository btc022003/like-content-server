class Api::V1::CommonController < ApiController
  # 多文件上传,参数名使用files[]的形式
  def upload_files
    files = params[:files]
    result = []
    files.each do |tmp|
      t = Time.now.to_i
      str_tem_file_name = t + rand(100)
      str_file_type = tmp.original_filename.split('.').last
      str_file_name = str_tem_file_name.to_s + '.' + str_file_type

      file_path = File.join('public/uploads', Time.now.strftime('%Y%m%d')) # 以当前时间命名文件夹
      # 如果文件夹不存在那么创建
      Dir.mkdir 'public/uploads' unless Dir.exist?('public/uploads')

      Dir.mkdir file_path unless Dir.exist?(file_path)
      file = File.join(file_path, str_file_name)
      FileUtils.cp tmp.path, file
      result << file.gsub('public', '')
    end
    render_json('y', 'file upload success', result.join(','))
  end
end
