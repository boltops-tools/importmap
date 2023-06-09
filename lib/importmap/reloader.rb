class Importmap::Reloader
  delegate :execute_if_updated, :execute, :updated?, to: :updater

  def reload!
    import_map_paths.each { |path| Importmap.framework.application.importmap.draw(path) }
  end

  private
    def updater
      @updater ||= config.file_watcher.new(import_map_paths) { reload! }
    end

    def import_map_paths
      config.importmap.paths
    end

    def config
      Importmap.framework.application.config
    end
end
