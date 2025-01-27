import 'dart:io';
import 'dart:ffi';

//region Init
DynamicLibrary initializeImGui(String path) { {
  var dll = switch (Platform.operatingSystem) {
    "windows" => "$path.dll",
    "macos" => "$path.dylib",
    "linux" => "$path.so",
    _ => throw Exception("Unsupported platform ${Platform.operatingSystem}"),
  };

  return DynamicLibrary.open(dll);
}

final _cimgui = initializeImGui();
//endregion

//region Functions
///```c
/// void hSV(
///   ImColor* pOut ,
///   float h ,
///   float s ,
///   float v ,
///   float a 
/// );
///```
void hSV(Pointer<ImColor> pOut, double h, double s, double v, double a) =>
  _ImColor_HSV(pOut, h, s, v, a);

late final _ImColor_HSV = _cimgui.lookupFunction<
  Void Function(Pointer<ImColor> pOut, Float h, Float s, Float v, Float a),
  void Function(Pointer<ImColor> pOut, double h, double s, double v, double a)>('ImColor_HSV');

///```c
/// ImColor* imColor(
/// );
///```
Pointer<ImColor> imColor() =>
  _ImColor_ImColorNil();

late final _ImColor_ImColorNil = _cimgui.lookupFunction<
  Pointer<ImColor> Function(),
  Pointer<ImColor> Function()>('ImColor_ImColorNil');

///```c
/// ImColor* imColor(
///   int r ,
///   int g ,
///   int b ,
///   int a 
/// );
///```
Pointer<ImColor> imColor(int r, int g, int b, int a) =>
  _ImColor_ImColorInt(r, g, b, a);

late final _ImColor_ImColorInt = _cimgui.lookupFunction<
  Pointer<ImColor> Function(Int32 r, Int32 g, Int32 b, Int32 a),
  Pointer<ImColor> Function(int r, int g, int b, int a)>('ImColor_ImColorInt');

///```c
/// ImColor* imColor(
///   uint rgba 
/// );
///```
Pointer<ImColor> imColor(int rgba) =>
  _ImColor_ImColorU32(rgba);

late final _ImColor_ImColorU32 = _cimgui.lookupFunction<
  Pointer<ImColor> Function(Uint32 rgba),
  Pointer<ImColor> Function(int rgba)>('ImColor_ImColorU32');

///```c
/// ImColor* imColor(
///   float r ,
///   float g ,
///   float b ,
///   float a 
/// );
///```
Pointer<ImColor> imColor(double r, double g, double b, double a) =>
  _ImColor_ImColorFloat(r, g, b, a);

late final _ImColor_ImColorFloat = _cimgui.lookupFunction<
  Pointer<ImColor> Function(Float r, Float g, Float b, Float a),
  Pointer<ImColor> Function(double r, double g, double b, double a)>('ImColor_ImColorFloat');

///```c
/// ImColor* imColor(
///   Vector4 col 
/// );
///```
Pointer<ImColor> imColor(Vector4 col) =>
  _ImColor_ImColorVec4(col);

late final _ImColor_ImColorVec4 = _cimgui.lookupFunction<
  Pointer<ImColor> Function(Vector4 col),
  Pointer<ImColor> Function(Vector4 col)>('ImColor_ImColorVec4');

///```c
/// void setHSV(
///   ImColor* self ,
///   float h ,
///   float s ,
///   float v ,
///   float a 
/// );
///```
void setHSV(Pointer<ImColor> self, double h, double s, double v, double a) =>
  _ImColor_SetHSV(self, h, s, v, a);

late final _ImColor_SetHSV = _cimgui.lookupFunction<
  Void Function(Pointer<ImColor> self, Float h, Float s, Float v, Float a),
  void Function(Pointer<ImColor> self, double h, double s, double v, double a)>('ImColor_SetHSV');

///```c
/// void destroy(
///   ImColor* self 
/// );
///```
void destroy(Pointer<ImColor> self) =>
  _ImColor_destroy(self);

late final _ImColor_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImColor> self),
  void Function(Pointer<ImColor> self)>('ImColor_destroy');

///```c
/// ImDrawCmd* imDrawCmd(
/// );
///```
Pointer<ImDrawCmd> imDrawCmd() =>
  _ImDrawCmd_ImDrawCmd();

late final _ImDrawCmd_ImDrawCmd = _cimgui.lookupFunction<
  Pointer<ImDrawCmd> Function(),
  Pointer<ImDrawCmd> Function()>('ImDrawCmd_ImDrawCmd');

///```c
/// void destroy(
///   ImDrawCmd* self 
/// );
///```
void destroy(Pointer<ImDrawCmd> self) =>
  _ImDrawCmd_destroy(self);

late final _ImDrawCmd_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawCmd> self),
  void Function(Pointer<ImDrawCmd> self)>('ImDrawCmd_destroy');

///```c
/// void clear(
///   ImDrawData* self 
/// );
///```
void clear(Pointer<ImDrawData> self) =>
  _ImDrawData_Clear(self);

late final _ImDrawData_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> self),
  void Function(Pointer<ImDrawData> self)>('ImDrawData_Clear');

///```c
/// void deIndexAllBuffers(
///   ImDrawData* self 
/// );
///```
void deIndexAllBuffers(Pointer<ImDrawData> self) =>
  _ImDrawData_DeIndexAllBuffers(self);

late final _ImDrawData_DeIndexAllBuffers = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> self),
  void Function(Pointer<ImDrawData> self)>('ImDrawData_DeIndexAllBuffers');

///```c
/// ImDrawData* imDrawData(
/// );
///```
Pointer<ImDrawData> imDrawData() =>
  _ImDrawData_ImDrawData();

late final _ImDrawData_ImDrawData = _cimgui.lookupFunction<
  Pointer<ImDrawData> Function(),
  Pointer<ImDrawData> Function()>('ImDrawData_ImDrawData');

///```c
/// void scaleClipRects(
///   ImDrawData* self ,
///   Vector2 fb_scale 
/// );
///```
void scaleClipRects(Pointer<ImDrawData> self, Vector2 fb_scale) =>
  _ImDrawData_ScaleClipRects(self, fb_scale);

late final _ImDrawData_ScaleClipRects = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> self, Vector2 fb_scale),
  void Function(Pointer<ImDrawData> self, Vector2 fb_scale)>('ImDrawData_ScaleClipRects');

///```c
/// void destroy(
///   ImDrawData* self 
/// );
///```
void destroy(Pointer<ImDrawData> self) =>
  _ImDrawData_destroy(self);

late final _ImDrawData_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> self),
  void Function(Pointer<ImDrawData> self)>('ImDrawData_destroy');

///```c
/// void clear(
///   ImDrawListSplitter* self 
/// );
///```
void clear(Pointer<ImDrawListSplitter> self) =>
  _ImDrawListSplitter_Clear(self);

late final _ImDrawListSplitter_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self),
  void Function(Pointer<ImDrawListSplitter> self)>('ImDrawListSplitter_Clear');

///```c
/// void clearFreeMemory(
///   ImDrawListSplitter* self 
/// );
///```
void clearFreeMemory(Pointer<ImDrawListSplitter> self) =>
  _ImDrawListSplitter_ClearFreeMemory(self);

late final _ImDrawListSplitter_ClearFreeMemory = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self),
  void Function(Pointer<ImDrawListSplitter> self)>('ImDrawListSplitter_ClearFreeMemory');

///```c
/// ImDrawListSplitter* imDrawListSplitter(
/// );
///```
Pointer<ImDrawListSplitter> imDrawListSplitter() =>
  _ImDrawListSplitter_ImDrawListSplitter();

late final _ImDrawListSplitter_ImDrawListSplitter = _cimgui.lookupFunction<
  Pointer<ImDrawListSplitter> Function(),
  Pointer<ImDrawListSplitter> Function()>('ImDrawListSplitter_ImDrawListSplitter');

///```c
/// void merge(
///   ImDrawListSplitter* self ,
///   ImDrawList* draw_list 
/// );
///```
void merge(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list) =>
  _ImDrawListSplitter_Merge(self, draw_list);

late final _ImDrawListSplitter_Merge = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list),
  void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list)>('ImDrawListSplitter_Merge');

///```c
/// void setCurrentChannel(
///   ImDrawListSplitter* self ,
///   ImDrawList* draw_list ,
///   int channel_idx 
/// );
///```
void setCurrentChannel(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, int channel_idx) =>
  _ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx);

late final _ImDrawListSplitter_SetCurrentChannel = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, Int32 channel_idx),
  void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, int channel_idx)>('ImDrawListSplitter_SetCurrentChannel');

///```c
/// void split(
///   ImDrawListSplitter* self ,
///   ImDrawList* draw_list ,
///   int count 
/// );
///```
void split(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, int count) =>
  _ImDrawListSplitter_Split(self, draw_list, count);

late final _ImDrawListSplitter_Split = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, Int32 count),
  void Function(Pointer<ImDrawListSplitter> self, Pointer<ImDrawList> draw_list, int count)>('ImDrawListSplitter_Split');

///```c
/// void destroy(
///   ImDrawListSplitter* self 
/// );
///```
void destroy(Pointer<ImDrawListSplitter> self) =>
  _ImDrawListSplitter_destroy(self);

late final _ImDrawListSplitter_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawListSplitter> self),
  void Function(Pointer<ImDrawListSplitter> self)>('ImDrawListSplitter_destroy');

///```c
/// void addBezierCubic(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   Vector2 p4 ,
///   uint col ,
///   float thickness ,
///   int num_segments 
/// );
///```
void addBezierCubic(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col, double thickness, int num_segments) =>
  _ImDrawList_AddBezierCubic(self, p1, p2, p3, p4, col, thickness, num_segments);

late final _ImDrawList_AddBezierCubic = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Uint32 col, Float thickness, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col, double thickness, int num_segments)>('ImDrawList_AddBezierCubic');

///```c
/// void addBezierQuadratic(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   uint col ,
///   float thickness ,
///   int num_segments 
/// );
///```
void addBezierQuadratic(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col, double thickness, int num_segments) =>
  _ImDrawList_AddBezierQuadratic(self, p1, p2, p3, col, thickness, num_segments);

late final _ImDrawList_AddBezierQuadratic = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Uint32 col, Float thickness, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col, double thickness, int num_segments)>('ImDrawList_AddBezierQuadratic');

///```c
/// void addCallback(
///   ImDrawList* self ,
///   IntPtr callback ,
///   void* callback_data 
/// );
///```
void addCallback(Pointer<ImDrawList> self, int callback, Pointer<Void> callback_data) =>
  _ImDrawList_AddCallback(self, callback, callback_data);

late final _ImDrawList_AddCallback = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, IntPtr callback, Pointer<Void> callback_data),
  void Function(Pointer<ImDrawList> self, int callback, Pointer<Void> callback_data)>('ImDrawList_AddCallback');

///```c
/// void addCircle(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   uint col ,
///   int num_segments ,
///   float thickness 
/// );
///```
void addCircle(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments, double thickness) =>
  _ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness);

late final _ImDrawList_AddCircle = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Uint32 col, Int32 num_segments, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments, double thickness)>('ImDrawList_AddCircle');

///```c
/// void addCircleFilled(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   uint col ,
///   int num_segments 
/// );
///```
void addCircleFilled(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments) =>
  _ImDrawList_AddCircleFilled(self, center, radius, col, num_segments);

late final _ImDrawList_AddCircleFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Uint32 col, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments)>('ImDrawList_AddCircleFilled');

///```c
/// void addConvexPolyFilled(
///   ImDrawList* self ,
///   Vector2* points ,
///   int num_points ,
///   uint col 
/// );
///```
void addConvexPolyFilled(Pointer<ImDrawList> self, Pointer<Vector2> points, int num_points, int col) =>
  _ImDrawList_AddConvexPolyFilled(self, points, num_points, col);

late final _ImDrawList_AddConvexPolyFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Pointer<Vector2> points, Int32 num_points, Uint32 col),
  void Function(Pointer<ImDrawList> self, Pointer<Vector2> points, int num_points, int col)>('ImDrawList_AddConvexPolyFilled');

///```c
/// void addDrawCmd(
///   ImDrawList* self 
/// );
///```
void addDrawCmd(Pointer<ImDrawList> self) =>
  _ImDrawList_AddDrawCmd(self);

late final _ImDrawList_AddDrawCmd = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_AddDrawCmd');

///```c
/// void addImage(
///   ImDrawList* self ,
///   IntPtr user_texture_id ,
///   Vector2 p_min ,
///   Vector2 p_max ,
///   Vector2 uv_min ,
///   Vector2 uv_max ,
///   uint col 
/// );
///```
void addImage(Pointer<ImDrawList> self, int user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, int col) =>
  _ImDrawList_AddImage(self, user_texture_id, p_min, p_max, uv_min, uv_max, col);

late final _ImDrawList_AddImage = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, IntPtr user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, Uint32 col),
  void Function(Pointer<ImDrawList> self, int user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, int col)>('ImDrawList_AddImage');

///```c
/// void addImageQuad(
///   ImDrawList* self ,
///   IntPtr user_texture_id ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   Vector2 p4 ,
///   Vector2 uv1 ,
///   Vector2 uv2 ,
///   Vector2 uv3 ,
///   Vector2 uv4 ,
///   uint col 
/// );
///```
void addImageQuad(Pointer<ImDrawList> self, int user_texture_id, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Vector2 uv1, Vector2 uv2, Vector2 uv3, Vector2 uv4, int col) =>
  _ImDrawList_AddImageQuad(self, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col);

late final _ImDrawList_AddImageQuad = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, IntPtr user_texture_id, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Vector2 uv1, Vector2 uv2, Vector2 uv3, Vector2 uv4, Uint32 col),
  void Function(Pointer<ImDrawList> self, int user_texture_id, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Vector2 uv1, Vector2 uv2, Vector2 uv3, Vector2 uv4, int col)>('ImDrawList_AddImageQuad');

///```c
/// void addImageRounded(
///   ImDrawList* self ,
///   IntPtr user_texture_id ,
///   Vector2 p_min ,
///   Vector2 p_max ,
///   Vector2 uv_min ,
///   Vector2 uv_max ,
///   uint col ,
///   float rounding ,
///   ImDrawFlags flags 
/// );
///```
void addImageRounded(Pointer<ImDrawList> self, int user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, int col, double rounding, int flags) =>
  _ImDrawList_AddImageRounded(self, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, flags);

late final _ImDrawList_AddImageRounded = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, IntPtr user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, Uint32 col, Float rounding, Uint32 flags),
  void Function(Pointer<ImDrawList> self, int user_texture_id, Vector2 p_min, Vector2 p_max, Vector2 uv_min, Vector2 uv_max, int col, double rounding, int flags)>('ImDrawList_AddImageRounded');

///```c
/// void addLine(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   uint col ,
///   float thickness 
/// );
///```
void addLine(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, int col, double thickness) =>
  _ImDrawList_AddLine(self, p1, p2, col, thickness);

late final _ImDrawList_AddLine = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Uint32 col, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, int col, double thickness)>('ImDrawList_AddLine');

///```c
/// void addNgon(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   uint col ,
///   int num_segments ,
///   float thickness 
/// );
///```
void addNgon(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments, double thickness) =>
  _ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness);

late final _ImDrawList_AddNgon = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Uint32 col, Int32 num_segments, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments, double thickness)>('ImDrawList_AddNgon');

///```c
/// void addNgonFilled(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   uint col ,
///   int num_segments 
/// );
///```
void addNgonFilled(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments) =>
  _ImDrawList_AddNgonFilled(self, center, radius, col, num_segments);

late final _ImDrawList_AddNgonFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Uint32 col, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int col, int num_segments)>('ImDrawList_AddNgonFilled');

///```c
/// void addPolyline(
///   ImDrawList* self ,
///   Vector2* points ,
///   int num_points ,
///   uint col ,
///   ImDrawFlags flags ,
///   float thickness 
/// );
///```
void addPolyline(Pointer<ImDrawList> self, Pointer<Vector2> points, int num_points, int col, int flags, double thickness) =>
  _ImDrawList_AddPolyline(self, points, num_points, col, flags, thickness);

late final _ImDrawList_AddPolyline = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Pointer<Vector2> points, Int32 num_points, Uint32 col, Uint32 flags, Float thickness),
  void Function(Pointer<ImDrawList> self, Pointer<Vector2> points, int num_points, int col, int flags, double thickness)>('ImDrawList_AddPolyline');

///```c
/// void addQuad(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   Vector2 p4 ,
///   uint col ,
///   float thickness 
/// );
///```
void addQuad(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col, double thickness) =>
  _ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness);

late final _ImDrawList_AddQuad = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Uint32 col, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col, double thickness)>('ImDrawList_AddQuad');

///```c
/// void addQuadFilled(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   Vector2 p4 ,
///   uint col 
/// );
///```
void addQuadFilled(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col) =>
  _ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col);

late final _ImDrawList_AddQuadFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, int col)>('ImDrawList_AddQuadFilled');

///```c
/// void addRect(
///   ImDrawList* self ,
///   Vector2 p_min ,
///   Vector2 p_max ,
///   uint col ,
///   float rounding ,
///   ImDrawFlags flags ,
///   float thickness 
/// );
///```
void addRect(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col, double rounding, int flags, double thickness) =>
  _ImDrawList_AddRect(self, p_min, p_max, col, rounding, flags, thickness);

late final _ImDrawList_AddRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, Uint32 col, Float rounding, Uint32 flags, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col, double rounding, int flags, double thickness)>('ImDrawList_AddRect');

///```c
/// void addRectFilled(
///   ImDrawList* self ,
///   Vector2 p_min ,
///   Vector2 p_max ,
///   uint col ,
///   float rounding ,
///   ImDrawFlags flags 
/// );
///```
void addRectFilled(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col, double rounding, int flags) =>
  _ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags);

late final _ImDrawList_AddRectFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, Uint32 col, Float rounding, Uint32 flags),
  void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col, double rounding, int flags)>('ImDrawList_AddRectFilled');

///```c
/// void addRectFilledMultiColor(
///   ImDrawList* self ,
///   Vector2 p_min ,
///   Vector2 p_max ,
///   uint col_upr_left ,
///   uint col_upr_right ,
///   uint col_bot_right ,
///   uint col_bot_left 
/// );
///```
void addRectFilledMultiColor(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col_upr_left, int col_upr_right, int col_bot_right, int col_bot_left) =>
  _ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left);

late final _ImDrawList_AddRectFilledMultiColor = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, Uint32 col_upr_left, Uint32 col_upr_right, Uint32 col_bot_right, Uint32 col_bot_left),
  void Function(Pointer<ImDrawList> self, Vector2 p_min, Vector2 p_max, int col_upr_left, int col_upr_right, int col_bot_right, int col_bot_left)>('ImDrawList_AddRectFilledMultiColor');

///```c
/// void addText(
///   ImDrawList* self ,
///   Vector2 pos ,
///   uint col ,
///   byte* text_begin ,
///   byte* text_end 
/// );
///```
void addText(Pointer<ImDrawList> self, Vector2 pos, int col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end) =>
  _ImDrawList_AddTextVec2(self, pos, col, text_begin, text_end);

late final _ImDrawList_AddTextVec2 = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 pos, Uint32 col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end),
  void Function(Pointer<ImDrawList> self, Vector2 pos, int col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end)>('ImDrawList_AddTextVec2');

///```c
/// void addText(
///   ImDrawList* self ,
///   ImFont* font ,
///   float font_size ,
///   Vector2 pos ,
///   uint col ,
///   byte* text_begin ,
///   byte* text_end ,
///   float wrap_width ,
///   Vector4* cpu_fine_clip_rect 
/// );
///```
void addText(Pointer<ImDrawList> self, Pointer<ImFont> font, double font_size, Vector2 pos, int col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, double wrap_width, Pointer<Vector4> cpu_fine_clip_rect) =>
  _ImDrawList_AddTextFontPtr(self, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect);

late final _ImDrawList_AddTextFontPtr = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Pointer<ImFont> font, Float font_size, Vector2 pos, Uint32 col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, Float wrap_width, Pointer<Vector4> cpu_fine_clip_rect),
  void Function(Pointer<ImDrawList> self, Pointer<ImFont> font, double font_size, Vector2 pos, int col, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, double wrap_width, Pointer<Vector4> cpu_fine_clip_rect)>('ImDrawList_AddTextFontPtr');

///```c
/// void addTriangle(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   uint col ,
///   float thickness 
/// );
///```
void addTriangle(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col, double thickness) =>
  _ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness);

late final _ImDrawList_AddTriangle = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Uint32 col, Float thickness),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col, double thickness)>('ImDrawList_AddTriangle');

///```c
/// void addTriangleFilled(
///   ImDrawList* self ,
///   Vector2 p1 ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   uint col 
/// );
///```
void addTriangleFilled(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col) =>
  _ImDrawList_AddTriangleFilled(self, p1, p2, p3, col);

late final _ImDrawList_AddTriangleFilled = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 p1, Vector2 p2, Vector2 p3, int col)>('ImDrawList_AddTriangleFilled');

///```c
/// void channelsMerge(
///   ImDrawList* self 
/// );
///```
void channelsMerge(Pointer<ImDrawList> self) =>
  _ImDrawList_ChannelsMerge(self);

late final _ImDrawList_ChannelsMerge = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_ChannelsMerge');

///```c
/// void channelsSetCurrent(
///   ImDrawList* self ,
///   int n 
/// );
///```
void channelsSetCurrent(Pointer<ImDrawList> self, int n) =>
  _ImDrawList_ChannelsSetCurrent(self, n);

late final _ImDrawList_ChannelsSetCurrent = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Int32 n),
  void Function(Pointer<ImDrawList> self, int n)>('ImDrawList_ChannelsSetCurrent');

///```c
/// void channelsSplit(
///   ImDrawList* self ,
///   int count 
/// );
///```
void channelsSplit(Pointer<ImDrawList> self, int count) =>
  _ImDrawList_ChannelsSplit(self, count);

late final _ImDrawList_ChannelsSplit = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Int32 count),
  void Function(Pointer<ImDrawList> self, int count)>('ImDrawList_ChannelsSplit');

///```c
/// ImDrawList* cloneOutput(
///   ImDrawList* self 
/// );
///```
Pointer<ImDrawList> cloneOutput(Pointer<ImDrawList> self) =>
  _ImDrawList_CloneOutput(self);

late final _ImDrawList_CloneOutput = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(Pointer<ImDrawList> self),
  Pointer<ImDrawList> Function(Pointer<ImDrawList> self)>('ImDrawList_CloneOutput');

///```c
/// void getClipRectMax(
///   Vector2* pOut ,
///   ImDrawList* self 
/// );
///```
void getClipRectMax(Pointer<Vector2> pOut, Pointer<ImDrawList> self) =>
  _ImDrawList_GetClipRectMax(pOut, self);

late final _ImDrawList_GetClipRectMax = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<ImDrawList> self),
  void Function(Pointer<Vector2> pOut, Pointer<ImDrawList> self)>('ImDrawList_GetClipRectMax');

///```c
/// void getClipRectMin(
///   Vector2* pOut ,
///   ImDrawList* self 
/// );
///```
void getClipRectMin(Pointer<Vector2> pOut, Pointer<ImDrawList> self) =>
  _ImDrawList_GetClipRectMin(pOut, self);

late final _ImDrawList_GetClipRectMin = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<ImDrawList> self),
  void Function(Pointer<Vector2> pOut, Pointer<ImDrawList> self)>('ImDrawList_GetClipRectMin');

///```c
/// ImDrawList* imDrawList(
///   IntPtr shared_data 
/// );
///```
Pointer<ImDrawList> imDrawList(int shared_data) =>
  _ImDrawList_ImDrawList(shared_data);

late final _ImDrawList_ImDrawList = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(IntPtr shared_data),
  Pointer<ImDrawList> Function(int shared_data)>('ImDrawList_ImDrawList');

///```c
/// void pathArcTo(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   float a_min ,
///   float a_max ,
///   int num_segments 
/// );
///```
void pathArcTo(Pointer<ImDrawList> self, Vector2 center, double radius, double a_min, double a_max, int num_segments) =>
  _ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments);

late final _ImDrawList_PathArcTo = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Float a_min, Float a_max, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, double a_min, double a_max, int num_segments)>('ImDrawList_PathArcTo');

///```c
/// void pathArcToFast(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   int a_min_of_12 ,
///   int a_max_of_12 
/// );
///```
void pathArcToFast(Pointer<ImDrawList> self, Vector2 center, double radius, int a_min_of_12, int a_max_of_12) =>
  _ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12);

late final _ImDrawList_PathArcToFast = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Int32 a_min_of_12, Int32 a_max_of_12),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int a_min_of_12, int a_max_of_12)>('ImDrawList_PathArcToFast');

///```c
/// void pathBezierCubicCurveTo(
///   ImDrawList* self ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   Vector2 p4 ,
///   int num_segments 
/// );
///```
void pathBezierCubicCurveTo(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, Vector2 p4, int num_segments) =>
  _ImDrawList_PathBezierCubicCurveTo(self, p2, p3, p4, num_segments);

late final _ImDrawList_PathBezierCubicCurveTo = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, Vector2 p4, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, Vector2 p4, int num_segments)>('ImDrawList_PathBezierCubicCurveTo');

///```c
/// void pathBezierQuadraticCurveTo(
///   ImDrawList* self ,
///   Vector2 p2 ,
///   Vector2 p3 ,
///   int num_segments 
/// );
///```
void pathBezierQuadraticCurveTo(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, int num_segments) =>
  _ImDrawList_PathBezierQuadraticCurveTo(self, p2, p3, num_segments);

late final _ImDrawList_PathBezierQuadraticCurveTo = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 p2, Vector2 p3, int num_segments)>('ImDrawList_PathBezierQuadraticCurveTo');

///```c
/// void pathClear(
///   ImDrawList* self 
/// );
///```
void pathClear(Pointer<ImDrawList> self) =>
  _ImDrawList_PathClear(self);

late final _ImDrawList_PathClear = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_PathClear');

///```c
/// void pathFillConvex(
///   ImDrawList* self ,
///   uint col 
/// );
///```
void pathFillConvex(Pointer<ImDrawList> self, int col) =>
  _ImDrawList_PathFillConvex(self, col);

late final _ImDrawList_PathFillConvex = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Uint32 col),
  void Function(Pointer<ImDrawList> self, int col)>('ImDrawList_PathFillConvex');

///```c
/// void pathLineTo(
///   ImDrawList* self ,
///   Vector2 pos 
/// );
///```
void pathLineTo(Pointer<ImDrawList> self, Vector2 pos) =>
  _ImDrawList_PathLineTo(self, pos);

late final _ImDrawList_PathLineTo = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 pos),
  void Function(Pointer<ImDrawList> self, Vector2 pos)>('ImDrawList_PathLineTo');

///```c
/// void pathLineToMergeDuplicate(
///   ImDrawList* self ,
///   Vector2 pos 
/// );
///```
void pathLineToMergeDuplicate(Pointer<ImDrawList> self, Vector2 pos) =>
  _ImDrawList_PathLineToMergeDuplicate(self, pos);

late final _ImDrawList_PathLineToMergeDuplicate = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 pos),
  void Function(Pointer<ImDrawList> self, Vector2 pos)>('ImDrawList_PathLineToMergeDuplicate');

///```c
/// void pathRect(
///   ImDrawList* self ,
///   Vector2 rect_min ,
///   Vector2 rect_max ,
///   float rounding ,
///   ImDrawFlags flags 
/// );
///```
void pathRect(Pointer<ImDrawList> self, Vector2 rect_min, Vector2 rect_max, double rounding, int flags) =>
  _ImDrawList_PathRect(self, rect_min, rect_max, rounding, flags);

late final _ImDrawList_PathRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 rect_min, Vector2 rect_max, Float rounding, Uint32 flags),
  void Function(Pointer<ImDrawList> self, Vector2 rect_min, Vector2 rect_max, double rounding, int flags)>('ImDrawList_PathRect');

///```c
/// void pathStroke(
///   ImDrawList* self ,
///   uint col ,
///   ImDrawFlags flags ,
///   float thickness 
/// );
///```
void pathStroke(Pointer<ImDrawList> self, int col, int flags, double thickness) =>
  _ImDrawList_PathStroke(self, col, flags, thickness);

late final _ImDrawList_PathStroke = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Uint32 col, Uint32 flags, Float thickness),
  void Function(Pointer<ImDrawList> self, int col, int flags, double thickness)>('ImDrawList_PathStroke');

///```c
/// void popClipRect(
///   ImDrawList* self 
/// );
///```
void popClipRect(Pointer<ImDrawList> self) =>
  _ImDrawList_PopClipRect(self);

late final _ImDrawList_PopClipRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_PopClipRect');

///```c
/// void popTextureID(
///   ImDrawList* self 
/// );
///```
void popTextureID(Pointer<ImDrawList> self) =>
  _ImDrawList_PopTextureID(self);

late final _ImDrawList_PopTextureID = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_PopTextureID');

///```c
/// void primQuadUV(
///   ImDrawList* self ,
///   Vector2 a ,
///   Vector2 b ,
///   Vector2 c ,
///   Vector2 d ,
///   Vector2 uv_a ,
///   Vector2 uv_b ,
///   Vector2 uv_c ,
///   Vector2 uv_d ,
///   uint col 
/// );
///```
void primQuadUV(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 c, Vector2 d, Vector2 uv_a, Vector2 uv_b, Vector2 uv_c, Vector2 uv_d, int col) =>
  _ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);

late final _ImDrawList_PrimQuadUV = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 c, Vector2 d, Vector2 uv_a, Vector2 uv_b, Vector2 uv_c, Vector2 uv_d, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 c, Vector2 d, Vector2 uv_a, Vector2 uv_b, Vector2 uv_c, Vector2 uv_d, int col)>('ImDrawList_PrimQuadUV');

///```c
/// void primRect(
///   ImDrawList* self ,
///   Vector2 a ,
///   Vector2 b ,
///   uint col 
/// );
///```
void primRect(Pointer<ImDrawList> self, Vector2 a, Vector2 b, int col) =>
  _ImDrawList_PrimRect(self, a, b, col);

late final _ImDrawList_PrimRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, int col)>('ImDrawList_PrimRect');

///```c
/// void primRectUV(
///   ImDrawList* self ,
///   Vector2 a ,
///   Vector2 b ,
///   Vector2 uv_a ,
///   Vector2 uv_b ,
///   uint col 
/// );
///```
void primRectUV(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 uv_a, Vector2 uv_b, int col) =>
  _ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col);

late final _ImDrawList_PrimRectUV = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 uv_a, Vector2 uv_b, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 a, Vector2 b, Vector2 uv_a, Vector2 uv_b, int col)>('ImDrawList_PrimRectUV');

///```c
/// void primReserve(
///   ImDrawList* self ,
///   int idx_count ,
///   int vtx_count 
/// );
///```
void primReserve(Pointer<ImDrawList> self, int idx_count, int vtx_count) =>
  _ImDrawList_PrimReserve(self, idx_count, vtx_count);

late final _ImDrawList_PrimReserve = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Int32 idx_count, Int32 vtx_count),
  void Function(Pointer<ImDrawList> self, int idx_count, int vtx_count)>('ImDrawList_PrimReserve');

///```c
/// void primUnreserve(
///   ImDrawList* self ,
///   int idx_count ,
///   int vtx_count 
/// );
///```
void primUnreserve(Pointer<ImDrawList> self, int idx_count, int vtx_count) =>
  _ImDrawList_PrimUnreserve(self, idx_count, vtx_count);

late final _ImDrawList_PrimUnreserve = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Int32 idx_count, Int32 vtx_count),
  void Function(Pointer<ImDrawList> self, int idx_count, int vtx_count)>('ImDrawList_PrimUnreserve');

///```c
/// void primVtx(
///   ImDrawList* self ,
///   Vector2 pos ,
///   Vector2 uv ,
///   uint col 
/// );
///```
void primVtx(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, int col) =>
  _ImDrawList_PrimVtx(self, pos, uv, col);

late final _ImDrawList_PrimVtx = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, int col)>('ImDrawList_PrimVtx');

///```c
/// void primWriteIdx(
///   ImDrawList* self ,
///   ushort idx 
/// );
///```
void primWriteIdx(Pointer<ImDrawList> self, int idx) =>
  _ImDrawList_PrimWriteIdx(self, idx);

late final _ImDrawList_PrimWriteIdx = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Uint16 idx),
  void Function(Pointer<ImDrawList> self, int idx)>('ImDrawList_PrimWriteIdx');

///```c
/// void primWriteVtx(
///   ImDrawList* self ,
///   Vector2 pos ,
///   Vector2 uv ,
///   uint col 
/// );
///```
void primWriteVtx(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, int col) =>
  _ImDrawList_PrimWriteVtx(self, pos, uv, col);

late final _ImDrawList_PrimWriteVtx = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, Uint32 col),
  void Function(Pointer<ImDrawList> self, Vector2 pos, Vector2 uv, int col)>('ImDrawList_PrimWriteVtx');

///```c
/// void pushClipRect(
///   ImDrawList* self ,
///   Vector2 clip_rect_min ,
///   Vector2 clip_rect_max ,
///   byte intersect_with_current_clip_rect 
/// );
///```
void pushClipRect(Pointer<ImDrawList> self, Vector2 clip_rect_min, Vector2 clip_rect_max, int intersect_with_current_clip_rect) =>
  _ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);

late final _ImDrawList_PushClipRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 clip_rect_min, Vector2 clip_rect_max, Uint8 intersect_with_current_clip_rect),
  void Function(Pointer<ImDrawList> self, Vector2 clip_rect_min, Vector2 clip_rect_max, int intersect_with_current_clip_rect)>('ImDrawList_PushClipRect');

///```c
/// void pushClipRectFullScreen(
///   ImDrawList* self 
/// );
///```
void pushClipRectFullScreen(Pointer<ImDrawList> self) =>
  _ImDrawList_PushClipRectFullScreen(self);

late final _ImDrawList_PushClipRectFullScreen = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_PushClipRectFullScreen');

///```c
/// void pushTextureID(
///   ImDrawList* self ,
///   IntPtr texture_id 
/// );
///```
void pushTextureID(Pointer<ImDrawList> self, int texture_id) =>
  _ImDrawList_PushTextureID(self, texture_id);

late final _ImDrawList_PushTextureID = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, IntPtr texture_id),
  void Function(Pointer<ImDrawList> self, int texture_id)>('ImDrawList_PushTextureID');

///```c
/// int _CalcCircleAutoSegmentCount(
///   ImDrawList* self ,
///   float radius 
/// );
///```
int _CalcCircleAutoSegmentCount(Pointer<ImDrawList> self, double radius) =>
  _ImDrawList__CalcCircleAutoSegmentCount(self, radius);

late final _ImDrawList__CalcCircleAutoSegmentCount = _cimgui.lookupFunction<
  Int32 Function(Pointer<ImDrawList> self, Float radius),
  int Function(Pointer<ImDrawList> self, double radius)>('ImDrawList__CalcCircleAutoSegmentCount');

///```c
/// void _ClearFreeMemory(
///   ImDrawList* self 
/// );
///```
void _ClearFreeMemory(Pointer<ImDrawList> self) =>
  _ImDrawList__ClearFreeMemory(self);

late final _ImDrawList__ClearFreeMemory = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__ClearFreeMemory');

///```c
/// void _OnChangedClipRect(
///   ImDrawList* self 
/// );
///```
void _OnChangedClipRect(Pointer<ImDrawList> self) =>
  _ImDrawList__OnChangedClipRect(self);

late final _ImDrawList__OnChangedClipRect = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__OnChangedClipRect');

///```c
/// void _OnChangedTextureID(
///   ImDrawList* self 
/// );
///```
void _OnChangedTextureID(Pointer<ImDrawList> self) =>
  _ImDrawList__OnChangedTextureID(self);

late final _ImDrawList__OnChangedTextureID = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__OnChangedTextureID');

///```c
/// void _OnChangedVtxOffset(
///   ImDrawList* self 
/// );
///```
void _OnChangedVtxOffset(Pointer<ImDrawList> self) =>
  _ImDrawList__OnChangedVtxOffset(self);

late final _ImDrawList__OnChangedVtxOffset = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__OnChangedVtxOffset');

///```c
/// void _PathArcToFastEx(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   int a_min_sample ,
///   int a_max_sample ,
///   int a_step 
/// );
///```
void _PathArcToFastEx(Pointer<ImDrawList> self, Vector2 center, double radius, int a_min_sample, int a_max_sample, int a_step) =>
  _ImDrawList__PathArcToFastEx(self, center, radius, a_min_sample, a_max_sample, a_step);

late final _ImDrawList__PathArcToFastEx = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Int32 a_min_sample, Int32 a_max_sample, Int32 a_step),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, int a_min_sample, int a_max_sample, int a_step)>('ImDrawList__PathArcToFastEx');

///```c
/// void _PathArcToN(
///   ImDrawList* self ,
///   Vector2 center ,
///   float radius ,
///   float a_min ,
///   float a_max ,
///   int num_segments 
/// );
///```
void _PathArcToN(Pointer<ImDrawList> self, Vector2 center, double radius, double a_min, double a_max, int num_segments) =>
  _ImDrawList__PathArcToN(self, center, radius, a_min, a_max, num_segments);

late final _ImDrawList__PathArcToN = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self, Vector2 center, Float radius, Float a_min, Float a_max, Int32 num_segments),
  void Function(Pointer<ImDrawList> self, Vector2 center, double radius, double a_min, double a_max, int num_segments)>('ImDrawList__PathArcToN');

///```c
/// void _PopUnusedDrawCmd(
///   ImDrawList* self 
/// );
///```
void _PopUnusedDrawCmd(Pointer<ImDrawList> self) =>
  _ImDrawList__PopUnusedDrawCmd(self);

late final _ImDrawList__PopUnusedDrawCmd = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__PopUnusedDrawCmd');

///```c
/// void _ResetForNewFrame(
///   ImDrawList* self 
/// );
///```
void _ResetForNewFrame(Pointer<ImDrawList> self) =>
  _ImDrawList__ResetForNewFrame(self);

late final _ImDrawList__ResetForNewFrame = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList__ResetForNewFrame');

///```c
/// void destroy(
///   ImDrawList* self 
/// );
///```
void destroy(Pointer<ImDrawList> self) =>
  _ImDrawList_destroy(self);

late final _ImDrawList_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawList> self),
  void Function(Pointer<ImDrawList> self)>('ImDrawList_destroy');

///```c
/// ImFontAtlasCustomRect* imFontAtlasCustomRect(
/// );
///```
Pointer<ImFontAtlasCustomRect> imFontAtlasCustomRect() =>
  _ImFontAtlasCustomRect_ImFontAtlasCustomRect();

late final _ImFontAtlasCustomRect_ImFontAtlasCustomRect = _cimgui.lookupFunction<
  Pointer<ImFontAtlasCustomRect> Function(),
  Pointer<ImFontAtlasCustomRect> Function()>('ImFontAtlasCustomRect_ImFontAtlasCustomRect');

///```c
/// byte isPacked(
///   ImFontAtlasCustomRect* self 
/// );
///```
int isPacked(Pointer<ImFontAtlasCustomRect> self) =>
  _ImFontAtlasCustomRect_IsPacked(self);

late final _ImFontAtlasCustomRect_IsPacked = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFontAtlasCustomRect> self),
  int Function(Pointer<ImFontAtlasCustomRect> self)>('ImFontAtlasCustomRect_IsPacked');

///```c
/// void destroy(
///   ImFontAtlasCustomRect* self 
/// );
///```
void destroy(Pointer<ImFontAtlasCustomRect> self) =>
  _ImFontAtlasCustomRect_destroy(self);

late final _ImFontAtlasCustomRect_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlasCustomRect> self),
  void Function(Pointer<ImFontAtlasCustomRect> self)>('ImFontAtlasCustomRect_destroy');

///```c
/// int addCustomRectFontGlyph(
///   ImFontAtlas* self ,
///   ImFont* font ,
///   ushort id ,
///   int width ,
///   int height ,
///   float advance_x ,
///   Vector2 offset 
/// );
///```
int addCustomRectFontGlyph(Pointer<ImFontAtlas> self, Pointer<ImFont> font, int id, int width, int height, double advance_x, Vector2 offset) =>
  _ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset);

late final _ImFontAtlas_AddCustomRectFontGlyph = _cimgui.lookupFunction<
  Int32 Function(Pointer<ImFontAtlas> self, Pointer<ImFont> font, Uint16 id, Int32 width, Int32 height, Float advance_x, Vector2 offset),
  int Function(Pointer<ImFontAtlas> self, Pointer<ImFont> font, int id, int width, int height, double advance_x, Vector2 offset)>('ImFontAtlas_AddCustomRectFontGlyph');

///```c
/// int addCustomRectRegular(
///   ImFontAtlas* self ,
///   int width ,
///   int height 
/// );
///```
int addCustomRectRegular(Pointer<ImFontAtlas> self, int width, int height) =>
  _ImFontAtlas_AddCustomRectRegular(self, width, height);

late final _ImFontAtlas_AddCustomRectRegular = _cimgui.lookupFunction<
  Int32 Function(Pointer<ImFontAtlas> self, Int32 width, Int32 height),
  int Function(Pointer<ImFontAtlas> self, int width, int height)>('ImFontAtlas_AddCustomRectRegular');

///```c
/// ImFont* addFont(
///   ImFontAtlas* self ,
///   ImFontConfig* font_cfg 
/// );
///```
Pointer<ImFont> addFont(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg) =>
  _ImFontAtlas_AddFont(self, font_cfg);

late final _ImFontAtlas_AddFont = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg)>('ImFontAtlas_AddFont');

///```c
/// ImFont* addFontDefault(
///   ImFontAtlas* self ,
///   ImFontConfig* font_cfg 
/// );
///```
Pointer<ImFont> addFontDefault(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg) =>
  _ImFontAtlas_AddFontDefault(self, font_cfg);

late final _ImFontAtlas_AddFontDefault = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<ImFontConfig> font_cfg)>('ImFontAtlas_AddFontDefault');

///```c
/// ImFont* addFontFromFileTTF(
///   ImFontAtlas* self ,
///   byte* filename ,
///   float size_pixels ,
///   ImFontConfig* font_cfg ,
///   ushort* glyph_ranges 
/// );
///```
Pointer<ImFont> addFontFromFileTTF(Pointer<ImFontAtlas> self, Pointer<Uint8> filename, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges) =>
  _ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges);

late final _ImFontAtlas_AddFontFromFileTTF = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Uint8> filename, Float size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Uint8> filename, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges)>('ImFontAtlas_AddFontFromFileTTF');

///```c
/// ImFont* addFontFromMemoryCompressedBase85TTF(
///   ImFontAtlas* self ,
///   byte* compressed_font_data_base85 ,
///   float size_pixels ,
///   ImFontConfig* font_cfg ,
///   ushort* glyph_ranges 
/// );
///```
Pointer<ImFont> addFontFromMemoryCompressedBase85TTF(Pointer<ImFontAtlas> self, Pointer<Uint8> compressed_font_data_base85, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges) =>
  _ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges);

late final _ImFontAtlas_AddFontFromMemoryCompressedBase85TTF = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Uint8> compressed_font_data_base85, Float size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Uint8> compressed_font_data_base85, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges)>('ImFontAtlas_AddFontFromMemoryCompressedBase85TTF');

///```c
/// ImFont* addFontFromMemoryCompressedTTF(
///   ImFontAtlas* self ,
///   void* compressed_font_data ,
///   int compressed_font_size ,
///   float size_pixels ,
///   ImFontConfig* font_cfg ,
///   ushort* glyph_ranges 
/// );
///```
Pointer<ImFont> addFontFromMemoryCompressedTTF(Pointer<ImFontAtlas> self, Pointer<Void> compressed_font_data, int compressed_font_size, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges) =>
  _ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges);

late final _ImFontAtlas_AddFontFromMemoryCompressedTTF = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Void> compressed_font_data, Int32 compressed_font_size, Float size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Void> compressed_font_data, int compressed_font_size, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges)>('ImFontAtlas_AddFontFromMemoryCompressedTTF');

///```c
/// ImFont* addFontFromMemoryTTF(
///   ImFontAtlas* self ,
///   void* font_data ,
///   int font_size ,
///   float size_pixels ,
///   ImFontConfig* font_cfg ,
///   ushort* glyph_ranges 
/// );
///```
Pointer<ImFont> addFontFromMemoryTTF(Pointer<ImFontAtlas> self, Pointer<Void> font_data, int font_size, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges) =>
  _ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_size, size_pixels, font_cfg, glyph_ranges);

late final _ImFontAtlas_AddFontFromMemoryTTF = _cimgui.lookupFunction<
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Void> font_data, Int32 font_size, Float size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges),
  Pointer<ImFont> Function(Pointer<ImFontAtlas> self, Pointer<Void> font_data, int font_size, double size_pixels, Pointer<ImFontConfig> font_cfg, Pointer<Uint16> glyph_ranges)>('ImFontAtlas_AddFontFromMemoryTTF');

///```c
/// byte build(
///   ImFontAtlas* self 
/// );
///```
int build(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_Build(self);

late final _ImFontAtlas_Build = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFontAtlas> self),
  int Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_Build');

///```c
/// void calcCustomRectUV(
///   ImFontAtlas* self ,
///   ImFontAtlasCustomRect* rect ,
///   Vector2* out_uv_min ,
///   Vector2* out_uv_max 
/// );
///```
void calcCustomRectUV(Pointer<ImFontAtlas> self, Pointer<ImFontAtlasCustomRect> rect, Pointer<Vector2> out_uv_min, Pointer<Vector2> out_uv_max) =>
  _ImFontAtlas_CalcCustomRectUV(self, rect, out_uv_min, out_uv_max);

late final _ImFontAtlas_CalcCustomRectUV = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self, Pointer<ImFontAtlasCustomRect> rect, Pointer<Vector2> out_uv_min, Pointer<Vector2> out_uv_max),
  void Function(Pointer<ImFontAtlas> self, Pointer<ImFontAtlasCustomRect> rect, Pointer<Vector2> out_uv_min, Pointer<Vector2> out_uv_max)>('ImFontAtlas_CalcCustomRectUV');

///```c
/// void clear(
///   ImFontAtlas* self 
/// );
///```
void clear(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_Clear(self);

late final _ImFontAtlas_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self),
  void Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_Clear');

///```c
/// void clearFonts(
///   ImFontAtlas* self 
/// );
///```
void clearFonts(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_ClearFonts(self);

late final _ImFontAtlas_ClearFonts = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self),
  void Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_ClearFonts');

///```c
/// void clearInputData(
///   ImFontAtlas* self 
/// );
///```
void clearInputData(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_ClearInputData(self);

late final _ImFontAtlas_ClearInputData = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self),
  void Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_ClearInputData');

///```c
/// void clearTexData(
///   ImFontAtlas* self 
/// );
///```
void clearTexData(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_ClearTexData(self);

late final _ImFontAtlas_ClearTexData = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self),
  void Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_ClearTexData');

///```c
/// ImFontAtlasCustomRect* getCustomRectByIndex(
///   ImFontAtlas* self ,
///   int index 
/// );
///```
Pointer<ImFontAtlasCustomRect> getCustomRectByIndex(Pointer<ImFontAtlas> self, int index) =>
  _ImFontAtlas_GetCustomRectByIndex(self, index);

late final _ImFontAtlas_GetCustomRectByIndex = _cimgui.lookupFunction<
  Pointer<ImFontAtlasCustomRect> Function(Pointer<ImFontAtlas> self, Int32 index),
  Pointer<ImFontAtlasCustomRect> Function(Pointer<ImFontAtlas> self, int index)>('ImFontAtlas_GetCustomRectByIndex');

///```c
/// ushort* getGlyphRangesChineseFull(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesChineseFull(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesChineseFull(self);

late final _ImFontAtlas_GetGlyphRangesChineseFull = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesChineseFull');

///```c
/// ushort* getGlyphRangesChineseSimplifiedCommon(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesChineseSimplifiedCommon(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self);

late final _ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon');

///```c
/// ushort* getGlyphRangesCyrillic(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesCyrillic(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesCyrillic(self);

late final _ImFontAtlas_GetGlyphRangesCyrillic = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesCyrillic');

///```c
/// ushort* getGlyphRangesDefault(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesDefault(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesDefault(self);

late final _ImFontAtlas_GetGlyphRangesDefault = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesDefault');

///```c
/// ushort* getGlyphRangesJapanese(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesJapanese(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesJapanese(self);

late final _ImFontAtlas_GetGlyphRangesJapanese = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesJapanese');

///```c
/// ushort* getGlyphRangesKorean(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesKorean(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesKorean(self);

late final _ImFontAtlas_GetGlyphRangesKorean = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesKorean');

///```c
/// ushort* getGlyphRangesThai(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesThai(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesThai(self);

late final _ImFontAtlas_GetGlyphRangesThai = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesThai');

///```c
/// ushort* getGlyphRangesVietnamese(
///   ImFontAtlas* self 
/// );
///```
Pointer<Uint16> getGlyphRangesVietnamese(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_GetGlyphRangesVietnamese(self);

late final _ImFontAtlas_GetGlyphRangesVietnamese = _cimgui.lookupFunction<
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self),
  Pointer<Uint16> Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_GetGlyphRangesVietnamese');

///```c
/// byte getMouseCursorTexData(
///   ImFontAtlas* self ,
///   ImGuiMouseCursor cursor ,
///   Vector2* out_offset ,
///   Vector2* out_size ,
///   Vector2* out_uv_border ,
///   Vector2* out_uv_fill 
/// );
///```
int getMouseCursorTexData(Pointer<ImFontAtlas> self, int cursor, Pointer<Vector2> out_offset, Pointer<Vector2> out_size, Pointer<Vector2> out_uv_border, Pointer<Vector2> out_uv_fill) =>
  _ImFontAtlas_GetMouseCursorTexData(self, cursor, out_offset, out_size, out_uv_border, out_uv_fill);

late final _ImFontAtlas_GetMouseCursorTexData = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFontAtlas> self, Uint32 cursor, Pointer<Vector2> out_offset, Pointer<Vector2> out_size, Pointer<Vector2> out_uv_border, Pointer<Vector2> out_uv_fill),
  int Function(Pointer<ImFontAtlas> self, int cursor, Pointer<Vector2> out_offset, Pointer<Vector2> out_size, Pointer<Vector2> out_uv_border, Pointer<Vector2> out_uv_fill)>('ImFontAtlas_GetMouseCursorTexData');

///```c
/// void getTexDataAsAlpha8(
///   ImFontAtlas* self ,
///   byte** out_pixels ,
///   int* out_width ,
///   int* out_height ,
///   int* out_bytes_per_pixel 
/// );
///```
void getTexDataAsAlpha8(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel) =>
  _ImFontAtlas_GetTexDataAsAlpha8(self, out_pixels, out_width, out_height, out_bytes_per_pixel);

late final _ImFontAtlas_GetTexDataAsAlpha8 = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel),
  void Function(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel)>('ImFontAtlas_GetTexDataAsAlpha8');

///```c
/// void getTexDataAsRGBA32(
///   ImFontAtlas* self ,
///   byte** out_pixels ,
///   int* out_width ,
///   int* out_height ,
///   int* out_bytes_per_pixel 
/// );
///```
void getTexDataAsRGBA32(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel) =>
  _ImFontAtlas_GetTexDataAsRGBA32(self, out_pixels, out_width, out_height, out_bytes_per_pixel);

late final _ImFontAtlas_GetTexDataAsRGBA32 = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel),
  void Function(Pointer<ImFontAtlas> self, Pointer<Pointer<Uint8>> out_pixels, Pointer<Int32> out_width, Pointer<Int32> out_height, Pointer<Int32> out_bytes_per_pixel)>('ImFontAtlas_GetTexDataAsRGBA32');

///```c
/// ImFontAtlas* imFontAtlas(
/// );
///```
Pointer<ImFontAtlas> imFontAtlas() =>
  _ImFontAtlas_ImFontAtlas();

late final _ImFontAtlas_ImFontAtlas = _cimgui.lookupFunction<
  Pointer<ImFontAtlas> Function(),
  Pointer<ImFontAtlas> Function()>('ImFontAtlas_ImFontAtlas');

///```c
/// byte isBuilt(
///   ImFontAtlas* self 
/// );
///```
int isBuilt(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_IsBuilt(self);

late final _ImFontAtlas_IsBuilt = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFontAtlas> self),
  int Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_IsBuilt');

///```c
/// void setTexID(
///   ImFontAtlas* self ,
///   IntPtr id 
/// );
///```
void setTexID(Pointer<ImFontAtlas> self, int id) =>
  _ImFontAtlas_SetTexID(self, id);

late final _ImFontAtlas_SetTexID = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self, IntPtr id),
  void Function(Pointer<ImFontAtlas> self, int id)>('ImFontAtlas_SetTexID');

///```c
/// void destroy(
///   ImFontAtlas* self 
/// );
///```
void destroy(Pointer<ImFontAtlas> self) =>
  _ImFontAtlas_destroy(self);

late final _ImFontAtlas_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontAtlas> self),
  void Function(Pointer<ImFontAtlas> self)>('ImFontAtlas_destroy');

///```c
/// ImFontConfig* imFontConfig(
/// );
///```
Pointer<ImFontConfig> imFontConfig() =>
  _ImFontConfig_ImFontConfig();

late final _ImFontConfig_ImFontConfig = _cimgui.lookupFunction<
  Pointer<ImFontConfig> Function(),
  Pointer<ImFontConfig> Function()>('ImFontConfig_ImFontConfig');

///```c
/// void destroy(
///   ImFontConfig* self 
/// );
///```
void destroy(Pointer<ImFontConfig> self) =>
  _ImFontConfig_destroy(self);

late final _ImFontConfig_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontConfig> self),
  void Function(Pointer<ImFontConfig> self)>('ImFontConfig_destroy');

///```c
/// void addChar(
///   ImFontGlyphRangesBuilder* self ,
///   ushort c 
/// );
///```
void addChar(Pointer<ImFontGlyphRangesBuilder> self, int c) =>
  _ImFontGlyphRangesBuilder_AddChar(self, c);

late final _ImFontGlyphRangesBuilder_AddChar = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self, Uint16 c),
  void Function(Pointer<ImFontGlyphRangesBuilder> self, int c)>('ImFontGlyphRangesBuilder_AddChar');

///```c
/// void addRanges(
///   ImFontGlyphRangesBuilder* self ,
///   ushort* ranges 
/// );
///```
void addRanges(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint16> ranges) =>
  _ImFontGlyphRangesBuilder_AddRanges(self, ranges);

late final _ImFontGlyphRangesBuilder_AddRanges = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint16> ranges),
  void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint16> ranges)>('ImFontGlyphRangesBuilder_AddRanges');

///```c
/// void addText(
///   ImFontGlyphRangesBuilder* self ,
///   byte* text ,
///   byte* text_end 
/// );
///```
void addText(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint8> text, Pointer<Uint8> text_end) =>
  _ImFontGlyphRangesBuilder_AddText(self, text, text_end);

late final _ImFontGlyphRangesBuilder_AddText = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint8> text, Pointer<Uint8> text_end),
  void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<Uint8> text, Pointer<Uint8> text_end)>('ImFontGlyphRangesBuilder_AddText');

///```c
/// void buildRanges(
///   ImFontGlyphRangesBuilder* self ,
///   ImVector* out_ranges 
/// );
///```
void buildRanges(Pointer<ImFontGlyphRangesBuilder> self, Pointer<ImVector> out_ranges) =>
  _ImFontGlyphRangesBuilder_BuildRanges(self, out_ranges);

late final _ImFontGlyphRangesBuilder_BuildRanges = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<ImVector> out_ranges),
  void Function(Pointer<ImFontGlyphRangesBuilder> self, Pointer<ImVector> out_ranges)>('ImFontGlyphRangesBuilder_BuildRanges');

///```c
/// void clear(
///   ImFontGlyphRangesBuilder* self 
/// );
///```
void clear(Pointer<ImFontGlyphRangesBuilder> self) =>
  _ImFontGlyphRangesBuilder_Clear(self);

late final _ImFontGlyphRangesBuilder_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self),
  void Function(Pointer<ImFontGlyphRangesBuilder> self)>('ImFontGlyphRangesBuilder_Clear');

///```c
/// byte getBit(
///   ImFontGlyphRangesBuilder* self ,
///   uint n 
/// );
///```
int getBit(Pointer<ImFontGlyphRangesBuilder> self, int n) =>
  _ImFontGlyphRangesBuilder_GetBit(self, n);

late final _ImFontGlyphRangesBuilder_GetBit = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFontGlyphRangesBuilder> self, Uint32 n),
  int Function(Pointer<ImFontGlyphRangesBuilder> self, int n)>('ImFontGlyphRangesBuilder_GetBit');

///```c
/// ImFontGlyphRangesBuilder* imFontGlyphRangesBuilder(
/// );
///```
Pointer<ImFontGlyphRangesBuilder> imFontGlyphRangesBuilder() =>
  _ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder();

late final _ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder = _cimgui.lookupFunction<
  Pointer<ImFontGlyphRangesBuilder> Function(),
  Pointer<ImFontGlyphRangesBuilder> Function()>('ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder');

///```c
/// void setBit(
///   ImFontGlyphRangesBuilder* self ,
///   uint n 
/// );
///```
void setBit(Pointer<ImFontGlyphRangesBuilder> self, int n) =>
  _ImFontGlyphRangesBuilder_SetBit(self, n);

late final _ImFontGlyphRangesBuilder_SetBit = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self, Uint32 n),
  void Function(Pointer<ImFontGlyphRangesBuilder> self, int n)>('ImFontGlyphRangesBuilder_SetBit');

///```c
/// void destroy(
///   ImFontGlyphRangesBuilder* self 
/// );
///```
void destroy(Pointer<ImFontGlyphRangesBuilder> self) =>
  _ImFontGlyphRangesBuilder_destroy(self);

late final _ImFontGlyphRangesBuilder_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImFontGlyphRangesBuilder> self),
  void Function(Pointer<ImFontGlyphRangesBuilder> self)>('ImFontGlyphRangesBuilder_destroy');

///```c
/// void addGlyph(
///   ImFont* self ,
///   ImFontConfig* src_cfg ,
///   ushort c ,
///   float x0 ,
///   float y0 ,
///   float x1 ,
///   float y1 ,
///   float u0 ,
///   float v0 ,
///   float u1 ,
///   float v1 ,
///   float advance_x 
/// );
///```
void addGlyph(Pointer<ImFont> self, Pointer<ImFontConfig> src_cfg, int c, double x0, double y0, double x1, double y1, double u0, double v0, double u1, double v1, double advance_x) =>
  _ImFont_AddGlyph(self, src_cfg, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x);

late final _ImFont_AddGlyph = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Pointer<ImFontConfig> src_cfg, Uint16 c, Float x0, Float y0, Float x1, Float y1, Float u0, Float v0, Float u1, Float v1, Float advance_x),
  void Function(Pointer<ImFont> self, Pointer<ImFontConfig> src_cfg, int c, double x0, double y0, double x1, double y1, double u0, double v0, double u1, double v1, double advance_x)>('ImFont_AddGlyph');

///```c
/// void addRemapChar(
///   ImFont* self ,
///   ushort dst ,
///   ushort src ,
///   byte overwrite_dst 
/// );
///```
void addRemapChar(Pointer<ImFont> self, int dst, int src, int overwrite_dst) =>
  _ImFont_AddRemapChar(self, dst, src, overwrite_dst);

late final _ImFont_AddRemapChar = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Uint16 dst, Uint16 src, Uint8 overwrite_dst),
  void Function(Pointer<ImFont> self, int dst, int src, int overwrite_dst)>('ImFont_AddRemapChar');

///```c
/// void buildLookupTable(
///   ImFont* self 
/// );
///```
void buildLookupTable(Pointer<ImFont> self) =>
  _ImFont_BuildLookupTable(self);

late final _ImFont_BuildLookupTable = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self),
  void Function(Pointer<ImFont> self)>('ImFont_BuildLookupTable');

///```c
/// void calcTextSizeA(
///   Vector2* pOut ,
///   ImFont* self ,
///   float size ,
///   float max_width ,
///   float wrap_width ,
///   byte* text_begin ,
///   byte* text_end ,
///   byte** remaining 
/// );
///```
void calcTextSizeA(Pointer<Vector2> pOut, Pointer<ImFont> self, double size, double max_width, double wrap_width, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, Pointer<Pointer<Uint8>> remaining) =>
  _ImFont_CalcTextSizeA(pOut, self, size, max_width, wrap_width, text_begin, text_end, remaining);

late final _ImFont_CalcTextSizeA = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<ImFont> self, Float size, Float max_width, Float wrap_width, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, Pointer<Pointer<Uint8>> remaining),
  void Function(Pointer<Vector2> pOut, Pointer<ImFont> self, double size, double max_width, double wrap_width, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, Pointer<Pointer<Uint8>> remaining)>('ImFont_CalcTextSizeA');

///```c
/// byte* calcWordWrapPositionA(
///   ImFont* self ,
///   float scale ,
///   byte* text ,
///   byte* text_end ,
///   float wrap_width 
/// );
///```
Pointer<Uint8> calcWordWrapPositionA(Pointer<ImFont> self, double scale, Pointer<Uint8> text, Pointer<Uint8> text_end, double wrap_width) =>
  _ImFont_CalcWordWrapPositionA(self, scale, text, text_end, wrap_width);

late final _ImFont_CalcWordWrapPositionA = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImFont> self, Float scale, Pointer<Uint8> text, Pointer<Uint8> text_end, Float wrap_width),
  Pointer<Uint8> Function(Pointer<ImFont> self, double scale, Pointer<Uint8> text, Pointer<Uint8> text_end, double wrap_width)>('ImFont_CalcWordWrapPositionA');

///```c
/// void clearOutputData(
///   ImFont* self 
/// );
///```
void clearOutputData(Pointer<ImFont> self) =>
  _ImFont_ClearOutputData(self);

late final _ImFont_ClearOutputData = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self),
  void Function(Pointer<ImFont> self)>('ImFont_ClearOutputData');

///```c
/// ImFontGlyph* findGlyph(
///   ImFont* self ,
///   ushort c 
/// );
///```
Pointer<ImFontGlyph> findGlyph(Pointer<ImFont> self, int c) =>
  _ImFont_FindGlyph(self, c);

late final _ImFont_FindGlyph = _cimgui.lookupFunction<
  Pointer<ImFontGlyph> Function(Pointer<ImFont> self, Uint16 c),
  Pointer<ImFontGlyph> Function(Pointer<ImFont> self, int c)>('ImFont_FindGlyph');

///```c
/// ImFontGlyph* findGlyphNoFallback(
///   ImFont* self ,
///   ushort c 
/// );
///```
Pointer<ImFontGlyph> findGlyphNoFallback(Pointer<ImFont> self, int c) =>
  _ImFont_FindGlyphNoFallback(self, c);

late final _ImFont_FindGlyphNoFallback = _cimgui.lookupFunction<
  Pointer<ImFontGlyph> Function(Pointer<ImFont> self, Uint16 c),
  Pointer<ImFontGlyph> Function(Pointer<ImFont> self, int c)>('ImFont_FindGlyphNoFallback');

///```c
/// float getCharAdvance(
///   ImFont* self ,
///   ushort c 
/// );
///```
double getCharAdvance(Pointer<ImFont> self, int c) =>
  _ImFont_GetCharAdvance(self, c);

late final _ImFont_GetCharAdvance = _cimgui.lookupFunction<
  Float Function(Pointer<ImFont> self, Uint16 c),
  double Function(Pointer<ImFont> self, int c)>('ImFont_GetCharAdvance');

///```c
/// byte* getDebugName(
///   ImFont* self 
/// );
///```
Pointer<Uint8> getDebugName(Pointer<ImFont> self) =>
  _ImFont_GetDebugName(self);

late final _ImFont_GetDebugName = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImFont> self),
  Pointer<Uint8> Function(Pointer<ImFont> self)>('ImFont_GetDebugName');

///```c
/// void growIndex(
///   ImFont* self ,
///   int new_size 
/// );
///```
void growIndex(Pointer<ImFont> self, int new_size) =>
  _ImFont_GrowIndex(self, new_size);

late final _ImFont_GrowIndex = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Int32 new_size),
  void Function(Pointer<ImFont> self, int new_size)>('ImFont_GrowIndex');

///```c
/// ImFont* imFont(
/// );
///```
Pointer<ImFont> imFont() =>
  _ImFont_ImFont();

late final _ImFont_ImFont = _cimgui.lookupFunction<
  Pointer<ImFont> Function(),
  Pointer<ImFont> Function()>('ImFont_ImFont');

///```c
/// byte isGlyphRangeUnused(
///   ImFont* self ,
///   uint c_begin ,
///   uint c_last 
/// );
///```
int isGlyphRangeUnused(Pointer<ImFont> self, int c_begin, int c_last) =>
  _ImFont_IsGlyphRangeUnused(self, c_begin, c_last);

late final _ImFont_IsGlyphRangeUnused = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFont> self, Uint32 c_begin, Uint32 c_last),
  int Function(Pointer<ImFont> self, int c_begin, int c_last)>('ImFont_IsGlyphRangeUnused');

///```c
/// byte isLoaded(
///   ImFont* self 
/// );
///```
int isLoaded(Pointer<ImFont> self) =>
  _ImFont_IsLoaded(self);

late final _ImFont_IsLoaded = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImFont> self),
  int Function(Pointer<ImFont> self)>('ImFont_IsLoaded');

///```c
/// void renderChar(
///   ImFont* self ,
///   ImDrawList* draw_list ,
///   float size ,
///   Vector2 pos ,
///   uint col ,
///   ushort c 
/// );
///```
void renderChar(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, double size, Vector2 pos, int col, int c) =>
  _ImFont_RenderChar(self, draw_list, size, pos, col, c);

late final _ImFont_RenderChar = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, Float size, Vector2 pos, Uint32 col, Uint16 c),
  void Function(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, double size, Vector2 pos, int col, int c)>('ImFont_RenderChar');

///```c
/// void renderText(
///   ImFont* self ,
///   ImDrawList* draw_list ,
///   float size ,
///   Vector2 pos ,
///   uint col ,
///   Vector4 clip_rect ,
///   byte* text_begin ,
///   byte* text_end ,
///   float wrap_width ,
///   byte cpu_fine_clip 
/// );
///```
void renderText(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, double size, Vector2 pos, int col, Vector4 clip_rect, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, double wrap_width, int cpu_fine_clip) =>
  _ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text_begin, text_end, wrap_width, cpu_fine_clip);

late final _ImFont_RenderText = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, Float size, Vector2 pos, Uint32 col, Vector4 clip_rect, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, Float wrap_width, Uint8 cpu_fine_clip),
  void Function(Pointer<ImFont> self, Pointer<ImDrawList> draw_list, double size, Vector2 pos, int col, Vector4 clip_rect, Pointer<Uint8> text_begin, Pointer<Uint8> text_end, double wrap_width, int cpu_fine_clip)>('ImFont_RenderText');

///```c
/// void setFallbackChar(
///   ImFont* self ,
///   ushort c 
/// );
///```
void setFallbackChar(Pointer<ImFont> self, int c) =>
  _ImFont_SetFallbackChar(self, c);

late final _ImFont_SetFallbackChar = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Uint16 c),
  void Function(Pointer<ImFont> self, int c)>('ImFont_SetFallbackChar');

///```c
/// void setGlyphVisible(
///   ImFont* self ,
///   ushort c ,
///   byte visible 
/// );
///```
void setGlyphVisible(Pointer<ImFont> self, int c, int visible) =>
  _ImFont_SetGlyphVisible(self, c, visible);

late final _ImFont_SetGlyphVisible = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self, Uint16 c, Uint8 visible),
  void Function(Pointer<ImFont> self, int c, int visible)>('ImFont_SetGlyphVisible');

///```c
/// void destroy(
///   ImFont* self 
/// );
///```
void destroy(Pointer<ImFont> self) =>
  _ImFont_destroy(self);

late final _ImFont_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> self),
  void Function(Pointer<ImFont> self)>('ImFont_destroy');

///```c
/// void addInputCharacter(
///   ImGuiIO* self ,
///   uint c 
/// );
///```
void addInputCharacter(Pointer<ImGuiIO> self, int c) =>
  _ImGuiIO_AddInputCharacter(self, c);

late final _ImGuiIO_AddInputCharacter = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiIO> self, Uint32 c),
  void Function(Pointer<ImGuiIO> self, int c)>('ImGuiIO_AddInputCharacter');

///```c
/// void addInputCharacterUTF16(
///   ImGuiIO* self ,
///   ushort c 
/// );
///```
void addInputCharacterUTF16(Pointer<ImGuiIO> self, int c) =>
  _ImGuiIO_AddInputCharacterUTF16(self, c);

late final _ImGuiIO_AddInputCharacterUTF16 = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiIO> self, Uint16 c),
  void Function(Pointer<ImGuiIO> self, int c)>('ImGuiIO_AddInputCharacterUTF16');

///```c
/// void addInputCharactersUTF8(
///   ImGuiIO* self ,
///   byte* str 
/// );
///```
void addInputCharactersUTF8(Pointer<ImGuiIO> self, Pointer<Uint8> str) =>
  _ImGuiIO_AddInputCharactersUTF8(self, str);

late final _ImGuiIO_AddInputCharactersUTF8 = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiIO> self, Pointer<Uint8> str),
  void Function(Pointer<ImGuiIO> self, Pointer<Uint8> str)>('ImGuiIO_AddInputCharactersUTF8');

///```c
/// void clearInputCharacters(
///   ImGuiIO* self 
/// );
///```
void clearInputCharacters(Pointer<ImGuiIO> self) =>
  _ImGuiIO_ClearInputCharacters(self);

late final _ImGuiIO_ClearInputCharacters = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiIO> self),
  void Function(Pointer<ImGuiIO> self)>('ImGuiIO_ClearInputCharacters');

///```c
/// ImGuiIO* imGuiIO(
/// );
///```
Pointer<ImGuiIO> imGuiIO() =>
  _ImGuiIO_ImGuiIO();

late final _ImGuiIO_ImGuiIO = _cimgui.lookupFunction<
  Pointer<ImGuiIO> Function(),
  Pointer<ImGuiIO> Function()>('ImGuiIO_ImGuiIO');

///```c
/// void destroy(
///   ImGuiIO* self 
/// );
///```
void destroy(Pointer<ImGuiIO> self) =>
  _ImGuiIO_destroy(self);

late final _ImGuiIO_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiIO> self),
  void Function(Pointer<ImGuiIO> self)>('ImGuiIO_destroy');

///```c
/// void clearSelection(
///   ImGuiInputTextCallbackData* self 
/// );
///```
void clearSelection(Pointer<Pointer> self) =>
  _ImGuiInputTextCallbackData_ClearSelection(self);

late final _ImGuiInputTextCallbackData_ClearSelection = _cimgui.lookupFunction<
  Void Function(Pointer<Pointer> self),
  void Function(Pointer<Pointer> self)>('ImGuiInputTextCallbackData_ClearSelection');

///```c
/// void deleteChars(
///   ImGuiInputTextCallbackData* self ,
///   int pos ,
///   int bytes_count 
/// );
///```
void deleteChars(Pointer<Pointer> self, int pos, int bytes_count) =>
  _ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count);

late final _ImGuiInputTextCallbackData_DeleteChars = _cimgui.lookupFunction<
  Void Function(Pointer<Pointer> self, Int32 pos, Int32 bytes_count),
  void Function(Pointer<Pointer> self, int pos, int bytes_count)>('ImGuiInputTextCallbackData_DeleteChars');

///```c
/// byte hasSelection(
///   ImGuiInputTextCallbackData* self 
/// );
///```
int hasSelection(Pointer<Pointer> self) =>
  _ImGuiInputTextCallbackData_HasSelection(self);

late final _ImGuiInputTextCallbackData_HasSelection = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Pointer> self),
  int Function(Pointer<Pointer> self)>('ImGuiInputTextCallbackData_HasSelection');

///```c
/// ImGuiInputTextCallbackData* imGuiInputTextCallbackData(
/// );
///```
Pointer<Pointer> imGuiInputTextCallbackData() =>
  _ImGuiInputTextCallbackData_ImGuiInputTextCallbackData();

late final _ImGuiInputTextCallbackData_ImGuiInputTextCallbackData = _cimgui.lookupFunction<
  Pointer<Pointer> Function(),
  Pointer<Pointer> Function()>('ImGuiInputTextCallbackData_ImGuiInputTextCallbackData');

///```c
/// void insertChars(
///   ImGuiInputTextCallbackData* self ,
///   int pos ,
///   byte* text ,
///   byte* text_end 
/// );
///```
void insertChars(Pointer<Pointer> self, int pos, Pointer<Uint8> text, Pointer<Uint8> text_end) =>
  _ImGuiInputTextCallbackData_InsertChars(self, pos, text, text_end);

late final _ImGuiInputTextCallbackData_InsertChars = _cimgui.lookupFunction<
  Void Function(Pointer<Pointer> self, Int32 pos, Pointer<Uint8> text, Pointer<Uint8> text_end),
  void Function(Pointer<Pointer> self, int pos, Pointer<Uint8> text, Pointer<Uint8> text_end)>('ImGuiInputTextCallbackData_InsertChars');

///```c
/// void selectAll(
///   ImGuiInputTextCallbackData* self 
/// );
///```
void selectAll(Pointer<Pointer> self) =>
  _ImGuiInputTextCallbackData_SelectAll(self);

late final _ImGuiInputTextCallbackData_SelectAll = _cimgui.lookupFunction<
  Void Function(Pointer<Pointer> self),
  void Function(Pointer<Pointer> self)>('ImGuiInputTextCallbackData_SelectAll');

///```c
/// void destroy(
///   ImGuiInputTextCallbackData* self 
/// );
///```
void destroy(Pointer<Pointer> self) =>
  _ImGuiInputTextCallbackData_destroy(self);

late final _ImGuiInputTextCallbackData_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<Pointer> self),
  void Function(Pointer<Pointer> self)>('ImGuiInputTextCallbackData_destroy');

///```c
/// void begin(
///   ImGuiListClipper* self ,
///   int items_count ,
///   float items_height 
/// );
///```
void begin(Pointer<ImGuiListClipper> self, int items_count, double items_height) =>
  _ImGuiListClipper_Begin(self, items_count, items_height);

late final _ImGuiListClipper_Begin = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiListClipper> self, Int32 items_count, Float items_height),
  void Function(Pointer<ImGuiListClipper> self, int items_count, double items_height)>('ImGuiListClipper_Begin');

///```c
/// void end(
///   ImGuiListClipper* self 
/// );
///```
void end(Pointer<ImGuiListClipper> self) =>
  _ImGuiListClipper_End(self);

late final _ImGuiListClipper_End = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiListClipper> self),
  void Function(Pointer<ImGuiListClipper> self)>('ImGuiListClipper_End');

///```c
/// ImGuiListClipper* imGuiListClipper(
/// );
///```
Pointer<ImGuiListClipper> imGuiListClipper() =>
  _ImGuiListClipper_ImGuiListClipper();

late final _ImGuiListClipper_ImGuiListClipper = _cimgui.lookupFunction<
  Pointer<ImGuiListClipper> Function(),
  Pointer<ImGuiListClipper> Function()>('ImGuiListClipper_ImGuiListClipper');

///```c
/// byte step(
///   ImGuiListClipper* self 
/// );
///```
int step(Pointer<ImGuiListClipper> self) =>
  _ImGuiListClipper_Step(self);

late final _ImGuiListClipper_Step = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiListClipper> self),
  int Function(Pointer<ImGuiListClipper> self)>('ImGuiListClipper_Step');

///```c
/// void destroy(
///   ImGuiListClipper* self 
/// );
///```
void destroy(Pointer<ImGuiListClipper> self) =>
  _ImGuiListClipper_destroy(self);

late final _ImGuiListClipper_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiListClipper> self),
  void Function(Pointer<ImGuiListClipper> self)>('ImGuiListClipper_destroy');

///```c
/// ImGuiOnceUponAFrame* imGuiOnceUponAFrame(
/// );
///```
Pointer<ImGuiOnceUponAFrame> imGuiOnceUponAFrame() =>
  _ImGuiOnceUponAFrame_ImGuiOnceUponAFrame();

late final _ImGuiOnceUponAFrame_ImGuiOnceUponAFrame = _cimgui.lookupFunction<
  Pointer<ImGuiOnceUponAFrame> Function(),
  Pointer<ImGuiOnceUponAFrame> Function()>('ImGuiOnceUponAFrame_ImGuiOnceUponAFrame');

///```c
/// void destroy(
///   ImGuiOnceUponAFrame* self 
/// );
///```
void destroy(Pointer<ImGuiOnceUponAFrame> self) =>
  _ImGuiOnceUponAFrame_destroy(self);

late final _ImGuiOnceUponAFrame_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiOnceUponAFrame> self),
  void Function(Pointer<ImGuiOnceUponAFrame> self)>('ImGuiOnceUponAFrame_destroy');

///```c
/// void clear(
///   ImGuiPayload* self 
/// );
///```
void clear(Pointer<ImGuiPayload> self) =>
  _ImGuiPayload_Clear(self);

late final _ImGuiPayload_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiPayload> self),
  void Function(Pointer<ImGuiPayload> self)>('ImGuiPayload_Clear');

///```c
/// ImGuiPayload* imGuiPayload(
/// );
///```
Pointer<ImGuiPayload> imGuiPayload() =>
  _ImGuiPayload_ImGuiPayload();

late final _ImGuiPayload_ImGuiPayload = _cimgui.lookupFunction<
  Pointer<ImGuiPayload> Function(),
  Pointer<ImGuiPayload> Function()>('ImGuiPayload_ImGuiPayload');

///```c
/// byte isDataType(
///   ImGuiPayload* self ,
///   byte* type 
/// );
///```
int isDataType(Pointer<ImGuiPayload> self, Pointer<Uint8> type) =>
  _ImGuiPayload_IsDataType(self, type);

late final _ImGuiPayload_IsDataType = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiPayload> self, Pointer<Uint8> type),
  int Function(Pointer<ImGuiPayload> self, Pointer<Uint8> type)>('ImGuiPayload_IsDataType');

///```c
/// byte isDelivery(
///   ImGuiPayload* self 
/// );
///```
int isDelivery(Pointer<ImGuiPayload> self) =>
  _ImGuiPayload_IsDelivery(self);

late final _ImGuiPayload_IsDelivery = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiPayload> self),
  int Function(Pointer<ImGuiPayload> self)>('ImGuiPayload_IsDelivery');

///```c
/// byte isPreview(
///   ImGuiPayload* self 
/// );
///```
int isPreview(Pointer<ImGuiPayload> self) =>
  _ImGuiPayload_IsPreview(self);

late final _ImGuiPayload_IsPreview = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiPayload> self),
  int Function(Pointer<ImGuiPayload> self)>('ImGuiPayload_IsPreview');

///```c
/// void destroy(
///   ImGuiPayload* self 
/// );
///```
void destroy(Pointer<ImGuiPayload> self) =>
  _ImGuiPayload_destroy(self);

late final _ImGuiPayload_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiPayload> self),
  void Function(Pointer<ImGuiPayload> self)>('ImGuiPayload_destroy');

///```c
/// ImGuiPlatformIO* imGuiPlatformIO(
/// );
///```
Pointer<ImGuiPlatformIO> imGuiPlatformIO() =>
  _ImGuiPlatformIO_ImGuiPlatformIO();

late final _ImGuiPlatformIO_ImGuiPlatformIO = _cimgui.lookupFunction<
  Pointer<ImGuiPlatformIO> Function(),
  Pointer<ImGuiPlatformIO> Function()>('ImGuiPlatformIO_ImGuiPlatformIO');

///```c
/// void destroy(
///   ImGuiPlatformIO* self 
/// );
///```
void destroy(Pointer<ImGuiPlatformIO> self) =>
  _ImGuiPlatformIO_destroy(self);

late final _ImGuiPlatformIO_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiPlatformIO> self),
  void Function(Pointer<ImGuiPlatformIO> self)>('ImGuiPlatformIO_destroy');

///```c
/// ImGuiPlatformMonitor* imGuiPlatformMonitor(
/// );
///```
Pointer<ImGuiPlatformMonitor> imGuiPlatformMonitor() =>
  _ImGuiPlatformMonitor_ImGuiPlatformMonitor();

late final _ImGuiPlatformMonitor_ImGuiPlatformMonitor = _cimgui.lookupFunction<
  Pointer<ImGuiPlatformMonitor> Function(),
  Pointer<ImGuiPlatformMonitor> Function()>('ImGuiPlatformMonitor_ImGuiPlatformMonitor');

///```c
/// void destroy(
///   ImGuiPlatformMonitor* self 
/// );
///```
void destroy(Pointer<ImGuiPlatformMonitor> self) =>
  _ImGuiPlatformMonitor_destroy(self);

late final _ImGuiPlatformMonitor_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiPlatformMonitor> self),
  void Function(Pointer<ImGuiPlatformMonitor> self)>('ImGuiPlatformMonitor_destroy');

///```c
/// ImGuiStoragePair* imGuiStoragePair(
///   uint _key ,
///   int _val_i 
/// );
///```
Pointer<ImGuiStoragePair> imGuiStoragePair(int _key, int _val_i) =>
  _ImGuiStoragePair_ImGuiStoragePairInt(_key, _val_i);

late final _ImGuiStoragePair_ImGuiStoragePairInt = _cimgui.lookupFunction<
  Pointer<ImGuiStoragePair> Function(Uint32 _key, Int32 _val_i),
  Pointer<ImGuiStoragePair> Function(int _key, int _val_i)>('ImGuiStoragePair_ImGuiStoragePairInt');

///```c
/// ImGuiStoragePair* imGuiStoragePair(
///   uint _key ,
///   float _val_f 
/// );
///```
Pointer<ImGuiStoragePair> imGuiStoragePair(int _key, double _val_f) =>
  _ImGuiStoragePair_ImGuiStoragePairFloat(_key, _val_f);

late final _ImGuiStoragePair_ImGuiStoragePairFloat = _cimgui.lookupFunction<
  Pointer<ImGuiStoragePair> Function(Uint32 _key, Float _val_f),
  Pointer<ImGuiStoragePair> Function(int _key, double _val_f)>('ImGuiStoragePair_ImGuiStoragePairFloat');

///```c
/// ImGuiStoragePair* imGuiStoragePair(
///   uint _key ,
///   void* _val_p 
/// );
///```
Pointer<ImGuiStoragePair> imGuiStoragePair(int _key, Pointer<Void> _val_p) =>
  _ImGuiStoragePair_ImGuiStoragePairPtr(_key, _val_p);

late final _ImGuiStoragePair_ImGuiStoragePairPtr = _cimgui.lookupFunction<
  Pointer<ImGuiStoragePair> Function(Uint32 _key, Pointer<Void> _val_p),
  Pointer<ImGuiStoragePair> Function(int _key, Pointer<Void> _val_p)>('ImGuiStoragePair_ImGuiStoragePairPtr');

///```c
/// void destroy(
///   ImGuiStoragePair* self 
/// );
///```
void destroy(Pointer<ImGuiStoragePair> self) =>
  _ImGuiStoragePair_destroy(self);

late final _ImGuiStoragePair_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStoragePair> self),
  void Function(Pointer<ImGuiStoragePair> self)>('ImGuiStoragePair_destroy');

///```c
/// void buildSortByKey(
///   ImGuiStorage* self 
/// );
///```
void buildSortByKey(Pointer<ImGuiStorage> self) =>
  _ImGuiStorage_BuildSortByKey(self);

late final _ImGuiStorage_BuildSortByKey = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self),
  void Function(Pointer<ImGuiStorage> self)>('ImGuiStorage_BuildSortByKey');

///```c
/// void clear(
///   ImGuiStorage* self 
/// );
///```
void clear(Pointer<ImGuiStorage> self) =>
  _ImGuiStorage_Clear(self);

late final _ImGuiStorage_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self),
  void Function(Pointer<ImGuiStorage> self)>('ImGuiStorage_Clear');

///```c
/// byte getBool(
///   ImGuiStorage* self ,
///   uint key ,
///   byte default_val 
/// );
///```
int getBool(Pointer<ImGuiStorage> self, int key, int default_val) =>
  _ImGuiStorage_GetBool(self, key, default_val);

late final _ImGuiStorage_GetBool = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiStorage> self, Uint32 key, Uint8 default_val),
  int Function(Pointer<ImGuiStorage> self, int key, int default_val)>('ImGuiStorage_GetBool');

///```c
/// byte* getBoolRef(
///   ImGuiStorage* self ,
///   uint key ,
///   byte default_val 
/// );
///```
Pointer<Uint8> getBoolRef(Pointer<ImGuiStorage> self, int key, int default_val) =>
  _ImGuiStorage_GetBoolRef(self, key, default_val);

late final _ImGuiStorage_GetBoolRef = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImGuiStorage> self, Uint32 key, Uint8 default_val),
  Pointer<Uint8> Function(Pointer<ImGuiStorage> self, int key, int default_val)>('ImGuiStorage_GetBoolRef');

///```c
/// float getFloat(
///   ImGuiStorage* self ,
///   uint key ,
///   float default_val 
/// );
///```
double getFloat(Pointer<ImGuiStorage> self, int key, double default_val) =>
  _ImGuiStorage_GetFloat(self, key, default_val);

late final _ImGuiStorage_GetFloat = _cimgui.lookupFunction<
  Float Function(Pointer<ImGuiStorage> self, Uint32 key, Float default_val),
  double Function(Pointer<ImGuiStorage> self, int key, double default_val)>('ImGuiStorage_GetFloat');

///```c
/// float* getFloatRef(
///   ImGuiStorage* self ,
///   uint key ,
///   float default_val 
/// );
///```
Pointer<Float> getFloatRef(Pointer<ImGuiStorage> self, int key, double default_val) =>
  _ImGuiStorage_GetFloatRef(self, key, default_val);

late final _ImGuiStorage_GetFloatRef = _cimgui.lookupFunction<
  Pointer<Float> Function(Pointer<ImGuiStorage> self, Uint32 key, Float default_val),
  Pointer<Float> Function(Pointer<ImGuiStorage> self, int key, double default_val)>('ImGuiStorage_GetFloatRef');

///```c
/// int getInt(
///   ImGuiStorage* self ,
///   uint key ,
///   int default_val 
/// );
///```
int getInt(Pointer<ImGuiStorage> self, int key, int default_val) =>
  _ImGuiStorage_GetInt(self, key, default_val);

late final _ImGuiStorage_GetInt = _cimgui.lookupFunction<
  Int32 Function(Pointer<ImGuiStorage> self, Uint32 key, Int32 default_val),
  int Function(Pointer<ImGuiStorage> self, int key, int default_val)>('ImGuiStorage_GetInt');

///```c
/// int* getIntRef(
///   ImGuiStorage* self ,
///   uint key ,
///   int default_val 
/// );
///```
Pointer<Int32> getIntRef(Pointer<ImGuiStorage> self, int key, int default_val) =>
  _ImGuiStorage_GetIntRef(self, key, default_val);

late final _ImGuiStorage_GetIntRef = _cimgui.lookupFunction<
  Pointer<Int32> Function(Pointer<ImGuiStorage> self, Uint32 key, Int32 default_val),
  Pointer<Int32> Function(Pointer<ImGuiStorage> self, int key, int default_val)>('ImGuiStorage_GetIntRef');

///```c
/// void* getVoidPtr(
///   ImGuiStorage* self ,
///   uint key 
/// );
///```
Pointer<Void> getVoidPtr(Pointer<ImGuiStorage> self, int key) =>
  _ImGuiStorage_GetVoidPtr(self, key);

late final _ImGuiStorage_GetVoidPtr = _cimgui.lookupFunction<
  Pointer<Void> Function(Pointer<ImGuiStorage> self, Uint32 key),
  Pointer<Void> Function(Pointer<ImGuiStorage> self, int key)>('ImGuiStorage_GetVoidPtr');

///```c
/// void** getVoidPtrRef(
///   ImGuiStorage* self ,
///   uint key ,
///   void* default_val 
/// );
///```
Pointer<Pointer<Void>> getVoidPtrRef(Pointer<ImGuiStorage> self, int key, Pointer<Void> default_val) =>
  _ImGuiStorage_GetVoidPtrRef(self, key, default_val);

late final _ImGuiStorage_GetVoidPtrRef = _cimgui.lookupFunction<
  Pointer<Pointer<Void>> Function(Pointer<ImGuiStorage> self, Uint32 key, Pointer<Void> default_val),
  Pointer<Pointer<Void>> Function(Pointer<ImGuiStorage> self, int key, Pointer<Void> default_val)>('ImGuiStorage_GetVoidPtrRef');

///```c
/// void setAllInt(
///   ImGuiStorage* self ,
///   int val 
/// );
///```
void setAllInt(Pointer<ImGuiStorage> self, int val) =>
  _ImGuiStorage_SetAllInt(self, val);

late final _ImGuiStorage_SetAllInt = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self, Int32 val),
  void Function(Pointer<ImGuiStorage> self, int val)>('ImGuiStorage_SetAllInt');

///```c
/// void setBool(
///   ImGuiStorage* self ,
///   uint key ,
///   byte val 
/// );
///```
void setBool(Pointer<ImGuiStorage> self, int key, int val) =>
  _ImGuiStorage_SetBool(self, key, val);

late final _ImGuiStorage_SetBool = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self, Uint32 key, Uint8 val),
  void Function(Pointer<ImGuiStorage> self, int key, int val)>('ImGuiStorage_SetBool');

///```c
/// void setFloat(
///   ImGuiStorage* self ,
///   uint key ,
///   float val 
/// );
///```
void setFloat(Pointer<ImGuiStorage> self, int key, double val) =>
  _ImGuiStorage_SetFloat(self, key, val);

late final _ImGuiStorage_SetFloat = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self, Uint32 key, Float val),
  void Function(Pointer<ImGuiStorage> self, int key, double val)>('ImGuiStorage_SetFloat');

///```c
/// void setInt(
///   ImGuiStorage* self ,
///   uint key ,
///   int val 
/// );
///```
void setInt(Pointer<ImGuiStorage> self, int key, int val) =>
  _ImGuiStorage_SetInt(self, key, val);

late final _ImGuiStorage_SetInt = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self, Uint32 key, Int32 val),
  void Function(Pointer<ImGuiStorage> self, int key, int val)>('ImGuiStorage_SetInt');

///```c
/// void setVoidPtr(
///   ImGuiStorage* self ,
///   uint key ,
///   void* val 
/// );
///```
void setVoidPtr(Pointer<ImGuiStorage> self, int key, Pointer<Void> val) =>
  _ImGuiStorage_SetVoidPtr(self, key, val);

late final _ImGuiStorage_SetVoidPtr = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> self, Uint32 key, Pointer<Void> val),
  void Function(Pointer<ImGuiStorage> self, int key, Pointer<Void> val)>('ImGuiStorage_SetVoidPtr');

///```c
/// ImGuiStyle* imGuiStyle(
/// );
///```
Pointer<ImGuiStyle> imGuiStyle() =>
  _ImGuiStyle_ImGuiStyle();

late final _ImGuiStyle_ImGuiStyle = _cimgui.lookupFunction<
  Pointer<ImGuiStyle> Function(),
  Pointer<ImGuiStyle> Function()>('ImGuiStyle_ImGuiStyle');

///```c
/// void scaleAllSizes(
///   ImGuiStyle* self ,
///   float scale_factor 
/// );
///```
void scaleAllSizes(Pointer<ImGuiStyle> self, double scale_factor) =>
  _ImGuiStyle_ScaleAllSizes(self, scale_factor);

late final _ImGuiStyle_ScaleAllSizes = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> self, Float scale_factor),
  void Function(Pointer<ImGuiStyle> self, double scale_factor)>('ImGuiStyle_ScaleAllSizes');

///```c
/// void destroy(
///   ImGuiStyle* self 
/// );
///```
void destroy(Pointer<ImGuiStyle> self) =>
  _ImGuiStyle_destroy(self);

late final _ImGuiStyle_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> self),
  void Function(Pointer<ImGuiStyle> self)>('ImGuiStyle_destroy');

///```c
/// ImGuiTableColumnSortSpecs* imGuiTableColumnSortSpecs(
/// );
///```
Pointer<ImGuiTableColumnSortSpecs> imGuiTableColumnSortSpecs() =>
  _ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs();

late final _ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs = _cimgui.lookupFunction<
  Pointer<ImGuiTableColumnSortSpecs> Function(),
  Pointer<ImGuiTableColumnSortSpecs> Function()>('ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs');

///```c
/// void destroy(
///   ImGuiTableColumnSortSpecs* self 
/// );
///```
void destroy(Pointer<ImGuiTableColumnSortSpecs> self) =>
  _ImGuiTableColumnSortSpecs_destroy(self);

late final _ImGuiTableColumnSortSpecs_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTableColumnSortSpecs> self),
  void Function(Pointer<ImGuiTableColumnSortSpecs> self)>('ImGuiTableColumnSortSpecs_destroy');

///```c
/// ImGuiTableSortSpecs* imGuiTableSortSpecs(
/// );
///```
Pointer<ImGuiTableSortSpecs> imGuiTableSortSpecs() =>
  _ImGuiTableSortSpecs_ImGuiTableSortSpecs();

late final _ImGuiTableSortSpecs_ImGuiTableSortSpecs = _cimgui.lookupFunction<
  Pointer<ImGuiTableSortSpecs> Function(),
  Pointer<ImGuiTableSortSpecs> Function()>('ImGuiTableSortSpecs_ImGuiTableSortSpecs');

///```c
/// void destroy(
///   ImGuiTableSortSpecs* self 
/// );
///```
void destroy(Pointer<ImGuiTableSortSpecs> self) =>
  _ImGuiTableSortSpecs_destroy(self);

late final _ImGuiTableSortSpecs_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTableSortSpecs> self),
  void Function(Pointer<ImGuiTableSortSpecs> self)>('ImGuiTableSortSpecs_destroy');

///```c
/// ImGuiTextBuffer* imGuiTextBuffer(
/// );
///```
Pointer<ImGuiTextBuffer> imGuiTextBuffer() =>
  _ImGuiTextBuffer_ImGuiTextBuffer();

late final _ImGuiTextBuffer_ImGuiTextBuffer = _cimgui.lookupFunction<
  Pointer<ImGuiTextBuffer> Function(),
  Pointer<ImGuiTextBuffer> Function()>('ImGuiTextBuffer_ImGuiTextBuffer');

///```c
/// void append(
///   ImGuiTextBuffer* self ,
///   byte* str ,
///   byte* str_end 
/// );
///```
void append(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> str, Pointer<Uint8> str_end) =>
  _ImGuiTextBuffer_append(self, str, str_end);

late final _ImGuiTextBuffer_append = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> str, Pointer<Uint8> str_end),
  void Function(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> str, Pointer<Uint8> str_end)>('ImGuiTextBuffer_append');

///```c
/// void appendf(
///   ImGuiTextBuffer* self ,
///   byte* fmt ,
///   ... ... 
/// );
///```
void appendf(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> fmt) =>
  _ImGuiTextBuffer_appendf(self, fmt);

late final _ImGuiTextBuffer_appendf = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> fmt),
  void Function(Pointer<ImGuiTextBuffer> self, Pointer<Uint8> fmt)>('ImGuiTextBuffer_appendf');

///```c
/// byte* begin(
///   ImGuiTextBuffer* self 
/// );
///```
Pointer<Uint8> begin(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_begin(self);

late final _ImGuiTextBuffer_begin = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self),
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_begin');

///```c
/// byte* c_str(
///   ImGuiTextBuffer* self 
/// );
///```
Pointer<Uint8> c_str(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_c_str(self);

late final _ImGuiTextBuffer_c_str = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self),
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_c_str');

///```c
/// void clear(
///   ImGuiTextBuffer* self 
/// );
///```
void clear(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_clear(self);

late final _ImGuiTextBuffer_clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextBuffer> self),
  void Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_clear');

///```c
/// void destroy(
///   ImGuiTextBuffer* self 
/// );
///```
void destroy(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_destroy(self);

late final _ImGuiTextBuffer_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextBuffer> self),
  void Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_destroy');

///```c
/// byte empty(
///   ImGuiTextBuffer* self 
/// );
///```
int empty(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_empty(self);

late final _ImGuiTextBuffer_empty = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiTextBuffer> self),
  int Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_empty');

///```c
/// byte* end(
///   ImGuiTextBuffer* self 
/// );
///```
Pointer<Uint8> end(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_end(self);

late final _ImGuiTextBuffer_end = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self),
  Pointer<Uint8> Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_end');

///```c
/// void reserve(
///   ImGuiTextBuffer* self ,
///   int capacity 
/// );
///```
void reserve(Pointer<ImGuiTextBuffer> self, int capacity) =>
  _ImGuiTextBuffer_reserve(self, capacity);

late final _ImGuiTextBuffer_reserve = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextBuffer> self, Int32 capacity),
  void Function(Pointer<ImGuiTextBuffer> self, int capacity)>('ImGuiTextBuffer_reserve');

///```c
/// int size(
///   ImGuiTextBuffer* self 
/// );
///```
int size(Pointer<ImGuiTextBuffer> self) =>
  _ImGuiTextBuffer_size(self);

late final _ImGuiTextBuffer_size = _cimgui.lookupFunction<
  Int32 Function(Pointer<ImGuiTextBuffer> self),
  int Function(Pointer<ImGuiTextBuffer> self)>('ImGuiTextBuffer_size');

///```c
/// void build(
///   ImGuiTextFilter* self 
/// );
///```
void build(Pointer<ImGuiTextFilter> self) =>
  _ImGuiTextFilter_Build(self);

late final _ImGuiTextFilter_Build = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextFilter> self),
  void Function(Pointer<ImGuiTextFilter> self)>('ImGuiTextFilter_Build');

///```c
/// void clear(
///   ImGuiTextFilter* self 
/// );
///```
void clear(Pointer<ImGuiTextFilter> self) =>
  _ImGuiTextFilter_Clear(self);

late final _ImGuiTextFilter_Clear = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextFilter> self),
  void Function(Pointer<ImGuiTextFilter> self)>('ImGuiTextFilter_Clear');

///```c
/// byte draw(
///   ImGuiTextFilter* self ,
///   byte* label ,
///   float width 
/// );
///```
int draw(Pointer<ImGuiTextFilter> self, Pointer<Uint8> label, double width) =>
  _ImGuiTextFilter_Draw(self, label, width);

late final _ImGuiTextFilter_Draw = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiTextFilter> self, Pointer<Uint8> label, Float width),
  int Function(Pointer<ImGuiTextFilter> self, Pointer<Uint8> label, double width)>('ImGuiTextFilter_Draw');

///```c
/// ImGuiTextFilter* imGuiTextFilter(
///   byte* default_filter 
/// );
///```
Pointer<ImGuiTextFilter> imGuiTextFilter(Pointer<Uint8> default_filter) =>
  _ImGuiTextFilter_ImGuiTextFilter(default_filter);

late final _ImGuiTextFilter_ImGuiTextFilter = _cimgui.lookupFunction<
  Pointer<ImGuiTextFilter> Function(Pointer<Uint8> default_filter),
  Pointer<ImGuiTextFilter> Function(Pointer<Uint8> default_filter)>('ImGuiTextFilter_ImGuiTextFilter');

///```c
/// byte isActive(
///   ImGuiTextFilter* self 
/// );
///```
int isActive(Pointer<ImGuiTextFilter> self) =>
  _ImGuiTextFilter_IsActive(self);

late final _ImGuiTextFilter_IsActive = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiTextFilter> self),
  int Function(Pointer<ImGuiTextFilter> self)>('ImGuiTextFilter_IsActive');

///```c
/// byte passFilter(
///   ImGuiTextFilter* self ,
///   byte* text ,
///   byte* text_end 
/// );
///```
int passFilter(Pointer<ImGuiTextFilter> self, Pointer<Uint8> text, Pointer<Uint8> text_end) =>
  _ImGuiTextFilter_PassFilter(self, text, text_end);

late final _ImGuiTextFilter_PassFilter = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiTextFilter> self, Pointer<Uint8> text, Pointer<Uint8> text_end),
  int Function(Pointer<ImGuiTextFilter> self, Pointer<Uint8> text, Pointer<Uint8> text_end)>('ImGuiTextFilter_PassFilter');

///```c
/// void destroy(
///   ImGuiTextFilter* self 
/// );
///```
void destroy(Pointer<ImGuiTextFilter> self) =>
  _ImGuiTextFilter_destroy(self);

late final _ImGuiTextFilter_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextFilter> self),
  void Function(Pointer<ImGuiTextFilter> self)>('ImGuiTextFilter_destroy');

///```c
/// ImGuiTextRange* imGuiTextRange(
/// );
///```
Pointer<ImGuiTextRange> imGuiTextRange() =>
  _ImGuiTextRange_ImGuiTextRangeNil();

late final _ImGuiTextRange_ImGuiTextRangeNil = _cimgui.lookupFunction<
  Pointer<ImGuiTextRange> Function(),
  Pointer<ImGuiTextRange> Function()>('ImGuiTextRange_ImGuiTextRangeNil');

///```c
/// ImGuiTextRange* imGuiTextRange(
///   byte* _b ,
///   byte* _e 
/// );
///```
Pointer<ImGuiTextRange> imGuiTextRange(Pointer<Uint8> _b, Pointer<Uint8> _e) =>
  _ImGuiTextRange_ImGuiTextRangeStr(_b, _e);

late final _ImGuiTextRange_ImGuiTextRangeStr = _cimgui.lookupFunction<
  Pointer<ImGuiTextRange> Function(Pointer<Uint8> _b, Pointer<Uint8> _e),
  Pointer<ImGuiTextRange> Function(Pointer<Uint8> _b, Pointer<Uint8> _e)>('ImGuiTextRange_ImGuiTextRangeStr');

///```c
/// void destroy(
///   ImGuiTextRange* self 
/// );
///```
void destroy(Pointer<ImGuiTextRange> self) =>
  _ImGuiTextRange_destroy(self);

late final _ImGuiTextRange_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextRange> self),
  void Function(Pointer<ImGuiTextRange> self)>('ImGuiTextRange_destroy');

///```c
/// byte empty(
///   ImGuiTextRange* self 
/// );
///```
int empty(Pointer<ImGuiTextRange> self) =>
  _ImGuiTextRange_empty(self);

late final _ImGuiTextRange_empty = _cimgui.lookupFunction<
  Uint8 Function(Pointer<ImGuiTextRange> self),
  int Function(Pointer<ImGuiTextRange> self)>('ImGuiTextRange_empty');

///```c
/// void split(
///   ImGuiTextRange* self ,
///   byte separator ,
///   ImVector* _out 
/// );
///```
void split(Pointer<ImGuiTextRange> self, int separator, Pointer<ImVector> _out) =>
  _ImGuiTextRange_split(self, separator, _out);

late final _ImGuiTextRange_split = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiTextRange> self, Uint8 separator, Pointer<ImVector> _out),
  void Function(Pointer<ImGuiTextRange> self, int separator, Pointer<ImVector> _out)>('ImGuiTextRange_split');

///```c
/// void getCenter(
///   Vector2* pOut ,
///   ImGuiViewport* self 
/// );
///```
void getCenter(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self) =>
  _ImGuiViewport_GetCenter(pOut, self);

late final _ImGuiViewport_GetCenter = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self),
  void Function(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self)>('ImGuiViewport_GetCenter');

///```c
/// void getWorkCenter(
///   Vector2* pOut ,
///   ImGuiViewport* self 
/// );
///```
void getWorkCenter(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self) =>
  _ImGuiViewport_GetWorkCenter(pOut, self);

late final _ImGuiViewport_GetWorkCenter = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self),
  void Function(Pointer<Vector2> pOut, Pointer<ImGuiViewport> self)>('ImGuiViewport_GetWorkCenter');

///```c
/// ImGuiViewport* imGuiViewport(
/// );
///```
Pointer<ImGuiViewport> imGuiViewport() =>
  _ImGuiViewport_ImGuiViewport();

late final _ImGuiViewport_ImGuiViewport = _cimgui.lookupFunction<
  Pointer<ImGuiViewport> Function(),
  Pointer<ImGuiViewport> Function()>('ImGuiViewport_ImGuiViewport');

///```c
/// void destroy(
///   ImGuiViewport* self 
/// );
///```
void destroy(Pointer<ImGuiViewport> self) =>
  _ImGuiViewport_destroy(self);

late final _ImGuiViewport_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiViewport> self),
  void Function(Pointer<ImGuiViewport> self)>('ImGuiViewport_destroy');

///```c
/// ImGuiWindowClass* imGuiWindowClass(
/// );
///```
Pointer<ImGuiWindowClass> imGuiWindowClass() =>
  _ImGuiWindowClass_ImGuiWindowClass();

late final _ImGuiWindowClass_ImGuiWindowClass = _cimgui.lookupFunction<
  Pointer<ImGuiWindowClass> Function(),
  Pointer<ImGuiWindowClass> Function()>('ImGuiWindowClass_ImGuiWindowClass');

///```c
/// void destroy(
///   ImGuiWindowClass* self 
/// );
///```
void destroy(Pointer<ImGuiWindowClass> self) =>
  _ImGuiWindowClass_destroy(self);

late final _ImGuiWindowClass_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiWindowClass> self),
  void Function(Pointer<ImGuiWindowClass> self)>('ImGuiWindowClass_destroy');

///```c
/// Vector2* imVec2(
/// );
///```
Pointer<Vector2> imVec2() =>
  _ImVec2_ImVec2Nil();

late final _ImVec2_ImVec2Nil = _cimgui.lookupFunction<
  Pointer<Vector2> Function(),
  Pointer<Vector2> Function()>('ImVec2_ImVec2Nil');

///```c
/// Vector2* imVec2(
///   float _x ,
///   float _y 
/// );
///```
Pointer<Vector2> imVec2(double _x, double _y) =>
  _ImVec2_ImVec2Float(_x, _y);

late final _ImVec2_ImVec2Float = _cimgui.lookupFunction<
  Pointer<Vector2> Function(Float _x, Float _y),
  Pointer<Vector2> Function(double _x, double _y)>('ImVec2_ImVec2Float');

///```c
/// void destroy(
///   Vector2* self 
/// );
///```
void destroy(Pointer<Vector2> self) =>
  _ImVec2_destroy(self);

late final _ImVec2_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> self),
  void Function(Pointer<Vector2> self)>('ImVec2_destroy');

///```c
/// Vector4* imVec4(
/// );
///```
Pointer<Vector4> imVec4() =>
  _ImVec4_ImVec4Nil();

late final _ImVec4_ImVec4Nil = _cimgui.lookupFunction<
  Pointer<Vector4> Function(),
  Pointer<Vector4> Function()>('ImVec4_ImVec4Nil');

///```c
/// Vector4* imVec4(
///   float _x ,
///   float _y ,
///   float _z ,
///   float _w 
/// );
///```
Pointer<Vector4> imVec4(double _x, double _y, double _z, double _w) =>
  _ImVec4_ImVec4Float(_x, _y, _z, _w);

late final _ImVec4_ImVec4Float = _cimgui.lookupFunction<
  Pointer<Vector4> Function(Float _x, Float _y, Float _z, Float _w),
  Pointer<Vector4> Function(double _x, double _y, double _z, double _w)>('ImVec4_ImVec4Float');

///```c
/// void destroy(
///   Vector4* self 
/// );
///```
void destroy(Pointer<Vector4> self) =>
  _ImVec4_destroy(self);

late final _ImVec4_destroy = _cimgui.lookupFunction<
  Void Function(Pointer<Vector4> self),
  void Function(Pointer<Vector4> self)>('ImVec4_destroy');

///```c
/// ImGuiPayload* acceptDragDropPayload(
///   byte* type ,
///   ImGuiDragDropFlags flags 
/// );
///```
Pointer<ImGuiPayload> acceptDragDropPayload(Pointer<Uint8> type, int flags) =>
  _igAcceptDragDropPayload(type, flags);

late final _igAcceptDragDropPayload = _cimgui.lookupFunction<
  Pointer<ImGuiPayload> Function(Pointer<Uint8> type, Uint32 flags),
  Pointer<ImGuiPayload> Function(Pointer<Uint8> type, int flags)>('igAcceptDragDropPayload');

///```c
/// void alignTextToFramePadding(
/// );
///```
void alignTextToFramePadding() =>
  _igAlignTextToFramePadding();

late final _igAlignTextToFramePadding = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igAlignTextToFramePadding');

///```c
/// byte arrowButton(
///   byte* str_id ,
///   ImGuiDir dir 
/// );
///```
int arrowButton(Pointer<Uint8> str_id, int dir) =>
  _igArrowButton(str_id, dir);

late final _igArrowButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 dir),
  int Function(Pointer<Uint8> str_id, int dir)>('igArrowButton');

///```c
/// byte begin(
///   byte* name ,
///   byte* p_open ,
///   ImGuiWindowFlags flags 
/// );
///```
int begin(Pointer<Uint8> name, Pointer<Uint8> p_open, int flags) =>
  _igBegin(name, p_open, flags);

late final _igBegin = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> name, Pointer<Uint8> p_open, Uint32 flags),
  int Function(Pointer<Uint8> name, Pointer<Uint8> p_open, int flags)>('igBegin');

///```c
/// byte beginChild(
///   byte* str_id ,
///   Vector2 size ,
///   byte border ,
///   ImGuiWindowFlags flags 
/// );
///```
int beginChild(Pointer<Uint8> str_id, Vector2 size, int border, int flags) =>
  _igBeginChildStr(str_id, size, border, flags);

late final _igBeginChildStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Vector2 size, Uint8 border, Uint32 flags),
  int Function(Pointer<Uint8> str_id, Vector2 size, int border, int flags)>('igBeginChildStr');

///```c
/// byte beginChild(
///   uint id ,
///   Vector2 size ,
///   byte border ,
///   ImGuiWindowFlags flags 
/// );
///```
int beginChild(int id, Vector2 size, int border, int flags) =>
  _igBeginChildID(id, size, border, flags);

late final _igBeginChildID = _cimgui.lookupFunction<
  Uint8 Function(Uint32 id, Vector2 size, Uint8 border, Uint32 flags),
  int Function(int id, Vector2 size, int border, int flags)>('igBeginChildID');

///```c
/// byte beginChildFrame(
///   uint id ,
///   Vector2 size ,
///   ImGuiWindowFlags flags 
/// );
///```
int beginChildFrame(int id, Vector2 size, int flags) =>
  _igBeginChildFrame(id, size, flags);

late final _igBeginChildFrame = _cimgui.lookupFunction<
  Uint8 Function(Uint32 id, Vector2 size, Uint32 flags),
  int Function(int id, Vector2 size, int flags)>('igBeginChildFrame');

///```c
/// byte beginCombo(
///   byte* label ,
///   byte* preview_value ,
///   ImGuiComboFlags flags 
/// );
///```
int beginCombo(Pointer<Uint8> label, Pointer<Uint8> preview_value, int flags) =>
  _igBeginCombo(label, preview_value, flags);

late final _igBeginCombo = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> preview_value, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Uint8> preview_value, int flags)>('igBeginCombo');

///```c
/// byte beginDragDropSource(
///   ImGuiDragDropFlags flags 
/// );
///```
int beginDragDropSource(int flags) =>
  _igBeginDragDropSource(flags);

late final _igBeginDragDropSource = _cimgui.lookupFunction<
  Uint8 Function(Uint32 flags),
  int Function(int flags)>('igBeginDragDropSource');

///```c
/// byte beginDragDropTarget(
/// );
///```
int beginDragDropTarget() =>
  _igBeginDragDropTarget();

late final _igBeginDragDropTarget = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igBeginDragDropTarget');

///```c
/// void beginGroup(
/// );
///```
void beginGroup() =>
  _igBeginGroup();

late final _igBeginGroup = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igBeginGroup');

///```c
/// byte beginListBox(
///   byte* label ,
///   Vector2 size 
/// );
///```
int beginListBox(Pointer<Uint8> label, Vector2 size) =>
  _igBeginListBox(label, size);

late final _igBeginListBox = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Vector2 size),
  int Function(Pointer<Uint8> label, Vector2 size)>('igBeginListBox');

///```c
/// byte beginMainMenuBar(
/// );
///```
int beginMainMenuBar() =>
  _igBeginMainMenuBar();

late final _igBeginMainMenuBar = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igBeginMainMenuBar');

///```c
/// byte beginMenu(
///   byte* label ,
///   byte enabled 
/// );
///```
int beginMenu(Pointer<Uint8> label, int enabled) =>
  _igBeginMenu(label, enabled);

late final _igBeginMenu = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint8 enabled),
  int Function(Pointer<Uint8> label, int enabled)>('igBeginMenu');

///```c
/// byte beginMenuBar(
/// );
///```
int beginMenuBar() =>
  _igBeginMenuBar();

late final _igBeginMenuBar = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igBeginMenuBar');

///```c
/// byte beginPopup(
///   byte* str_id ,
///   ImGuiWindowFlags flags 
/// );
///```
int beginPopup(Pointer<Uint8> str_id, int flags) =>
  _igBeginPopup(str_id, flags);

late final _igBeginPopup = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 flags),
  int Function(Pointer<Uint8> str_id, int flags)>('igBeginPopup');

///```c
/// byte beginPopupContextItem(
///   byte* str_id ,
///   ImGuiPopupFlags popup_flags 
/// );
///```
int beginPopupContextItem(Pointer<Uint8> str_id, int popup_flags) =>
  _igBeginPopupContextItem(str_id, popup_flags);

late final _igBeginPopupContextItem = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 popup_flags),
  int Function(Pointer<Uint8> str_id, int popup_flags)>('igBeginPopupContextItem');

///```c
/// byte beginPopupContextVoid(
///   byte* str_id ,
///   ImGuiPopupFlags popup_flags 
/// );
///```
int beginPopupContextVoid(Pointer<Uint8> str_id, int popup_flags) =>
  _igBeginPopupContextVoid(str_id, popup_flags);

late final _igBeginPopupContextVoid = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 popup_flags),
  int Function(Pointer<Uint8> str_id, int popup_flags)>('igBeginPopupContextVoid');

///```c
/// byte beginPopupContextWindow(
///   byte* str_id ,
///   ImGuiPopupFlags popup_flags 
/// );
///```
int beginPopupContextWindow(Pointer<Uint8> str_id, int popup_flags) =>
  _igBeginPopupContextWindow(str_id, popup_flags);

late final _igBeginPopupContextWindow = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 popup_flags),
  int Function(Pointer<Uint8> str_id, int popup_flags)>('igBeginPopupContextWindow');

///```c
/// byte beginPopupModal(
///   byte* name ,
///   byte* p_open ,
///   ImGuiWindowFlags flags 
/// );
///```
int beginPopupModal(Pointer<Uint8> name, Pointer<Uint8> p_open, int flags) =>
  _igBeginPopupModal(name, p_open, flags);

late final _igBeginPopupModal = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> name, Pointer<Uint8> p_open, Uint32 flags),
  int Function(Pointer<Uint8> name, Pointer<Uint8> p_open, int flags)>('igBeginPopupModal');

///```c
/// byte beginTabBar(
///   byte* str_id ,
///   ImGuiTabBarFlags flags 
/// );
///```
int beginTabBar(Pointer<Uint8> str_id, int flags) =>
  _igBeginTabBar(str_id, flags);

late final _igBeginTabBar = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 flags),
  int Function(Pointer<Uint8> str_id, int flags)>('igBeginTabBar');

///```c
/// byte beginTabItem(
///   byte* label ,
///   byte* p_open ,
///   ImGuiTabItemFlags flags 
/// );
///```
int beginTabItem(Pointer<Uint8> label, Pointer<Uint8> p_open, int flags) =>
  _igBeginTabItem(label, p_open, flags);

late final _igBeginTabItem = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> p_open, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Uint8> p_open, int flags)>('igBeginTabItem');

///```c
/// byte beginTable(
///   byte* str_id ,
///   int column ,
///   ImGuiTableFlags flags ,
///   Vector2 outer_size ,
///   float inner_width 
/// );
///```
int beginTable(Pointer<Uint8> str_id, int column, int flags, Vector2 outer_size, double inner_width) =>
  _igBeginTable(str_id, column, flags, outer_size, inner_width);

late final _igBeginTable = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Int32 column, Uint32 flags, Vector2 outer_size, Float inner_width),
  int Function(Pointer<Uint8> str_id, int column, int flags, Vector2 outer_size, double inner_width)>('igBeginTable');

///```c
/// void beginTooltip(
/// );
///```
void beginTooltip() =>
  _igBeginTooltip();

late final _igBeginTooltip = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igBeginTooltip');

///```c
/// void bullet(
/// );
///```
void bullet() =>
  _igBullet();

late final _igBullet = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igBullet');

///```c
/// void bulletText(
///   byte* fmt ,
///   ... ... 
/// );
///```
void bulletText(Pointer<Uint8> fmt) =>
  _igBulletText(fmt);

late final _igBulletText = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igBulletText');

///```c
/// byte button(
///   byte* label ,
///   Vector2 size 
/// );
///```
int button(Pointer<Uint8> label, Vector2 size) =>
  _igButton(label, size);

late final _igButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Vector2 size),
  int Function(Pointer<Uint8> label, Vector2 size)>('igButton');

///```c
/// float calcItemWidth(
/// );
///```
double calcItemWidth() =>
  _igCalcItemWidth();

late final _igCalcItemWidth = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igCalcItemWidth');

///```c
/// void calcListClipping(
///   int items_count ,
///   float items_height ,
///   int* out_items_display_start ,
///   int* out_items_display_end 
/// );
///```
void calcListClipping(int items_count, double items_height, Pointer<Int32> out_items_display_start, Pointer<Int32> out_items_display_end) =>
  _igCalcListClipping(items_count, items_height, out_items_display_start, out_items_display_end);

late final _igCalcListClipping = _cimgui.lookupFunction<
  Void Function(Int32 items_count, Float items_height, Pointer<Int32> out_items_display_start, Pointer<Int32> out_items_display_end),
  void Function(int items_count, double items_height, Pointer<Int32> out_items_display_start, Pointer<Int32> out_items_display_end)>('igCalcListClipping');

///```c
/// void calcTextSize(
///   Vector2* pOut ,
///   byte* text ,
///   byte* text_end ,
///   byte hide_text_after_double_hash ,
///   float wrap_width 
/// );
///```
void calcTextSize(Pointer<Vector2> pOut, Pointer<Uint8> text, Pointer<Uint8> text_end, int hide_text_after_double_hash, double wrap_width) =>
  _igCalcTextSize(pOut, text, text_end, hide_text_after_double_hash, wrap_width);

late final _igCalcTextSize = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Pointer<Uint8> text, Pointer<Uint8> text_end, Uint8 hide_text_after_double_hash, Float wrap_width),
  void Function(Pointer<Vector2> pOut, Pointer<Uint8> text, Pointer<Uint8> text_end, int hide_text_after_double_hash, double wrap_width)>('igCalcTextSize');

///```c
/// void captureKeyboardFromApp(
///   byte want_capture_keyboard_value 
/// );
///```
void captureKeyboardFromApp(int want_capture_keyboard_value) =>
  _igCaptureKeyboardFromApp(want_capture_keyboard_value);

late final _igCaptureKeyboardFromApp = _cimgui.lookupFunction<
  Void Function(Uint8 want_capture_keyboard_value),
  void Function(int want_capture_keyboard_value)>('igCaptureKeyboardFromApp');

///```c
/// void captureMouseFromApp(
///   byte want_capture_mouse_value 
/// );
///```
void captureMouseFromApp(int want_capture_mouse_value) =>
  _igCaptureMouseFromApp(want_capture_mouse_value);

late final _igCaptureMouseFromApp = _cimgui.lookupFunction<
  Void Function(Uint8 want_capture_mouse_value),
  void Function(int want_capture_mouse_value)>('igCaptureMouseFromApp');

///```c
/// byte checkbox(
///   byte* label ,
///   byte* v 
/// );
///```
int checkbox(Pointer<Uint8> label, Pointer<Uint8> v) =>
  _igCheckbox(label, v);

late final _igCheckbox = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> v),
  int Function(Pointer<Uint8> label, Pointer<Uint8> v)>('igCheckbox');

///```c
/// byte checkboxFlags(
///   byte* label ,
///   int* flags ,
///   int flags_value 
/// );
///```
int checkboxFlags(Pointer<Uint8> label, Pointer<Int32> flags, int flags_value) =>
  _igCheckboxFlagsIntPtr(label, flags, flags_value);

late final _igCheckboxFlagsIntPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> flags, Int32 flags_value),
  int Function(Pointer<Uint8> label, Pointer<Int32> flags, int flags_value)>('igCheckboxFlagsIntPtr');

///```c
/// byte checkboxFlags(
///   byte* label ,
///   uint* flags ,
///   uint flags_value 
/// );
///```
int checkboxFlags(Pointer<Uint8> label, Pointer<Uint32> flags, int flags_value) =>
  _igCheckboxFlagsUintPtr(label, flags, flags_value);

late final _igCheckboxFlagsUintPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint32> flags, Uint32 flags_value),
  int Function(Pointer<Uint8> label, Pointer<Uint32> flags, int flags_value)>('igCheckboxFlagsUintPtr');

///```c
/// void closeCurrentPopup(
/// );
///```
void closeCurrentPopup() =>
  _igCloseCurrentPopup();

late final _igCloseCurrentPopup = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igCloseCurrentPopup');

///```c
/// byte collapsingHeader(
///   byte* label ,
///   ImGuiTreeNodeFlags flags 
/// );
///```
int collapsingHeader(Pointer<Uint8> label, int flags) =>
  _igCollapsingHeaderTreeNodeFlags(label, flags);

late final _igCollapsingHeaderTreeNodeFlags = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 flags),
  int Function(Pointer<Uint8> label, int flags)>('igCollapsingHeaderTreeNodeFlags');

///```c
/// byte collapsingHeader(
///   byte* label ,
///   byte* p_visible ,
///   ImGuiTreeNodeFlags flags 
/// );
///```
int collapsingHeader(Pointer<Uint8> label, Pointer<Uint8> p_visible, int flags) =>
  _igCollapsingHeaderBoolPtr(label, p_visible, flags);

late final _igCollapsingHeaderBoolPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> p_visible, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Uint8> p_visible, int flags)>('igCollapsingHeaderBoolPtr');

///```c
/// byte colorButton(
///   byte* desc_id ,
///   Vector4 col ,
///   ImGuiColorEditFlags flags ,
///   Vector2 size 
/// );
///```
int colorButton(Pointer<Uint8> desc_id, Vector4 col, int flags, Vector2 size) =>
  _igColorButton(desc_id, col, flags, size);

late final _igColorButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> desc_id, Vector4 col, Uint32 flags, Vector2 size),
  int Function(Pointer<Uint8> desc_id, Vector4 col, int flags, Vector2 size)>('igColorButton');

///```c
/// uint colorConvertFloat4ToU32(
///   Vector4 _in 
/// );
///```
int colorConvertFloat4ToU32(Vector4 _in) =>
  _igColorConvertFloat4ToU32(_in);

late final _igColorConvertFloat4ToU32 = _cimgui.lookupFunction<
  Uint32 Function(Vector4 _in),
  int Function(Vector4 _in)>('igColorConvertFloat4ToU32');

///```c
/// void colorConvertHSVtoRGB(
///   float h ,
///   float s ,
///   float v ,
///   float* out_r ,
///   float* out_g ,
///   float* out_b 
/// );
///```
void colorConvertHSVtoRGB(double h, double s, double v, Pointer<Float> out_r, Pointer<Float> out_g, Pointer<Float> out_b) =>
  _igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b);

late final _igColorConvertHSVtoRGB = _cimgui.lookupFunction<
  Void Function(Float h, Float s, Float v, Pointer<Float> out_r, Pointer<Float> out_g, Pointer<Float> out_b),
  void Function(double h, double s, double v, Pointer<Float> out_r, Pointer<Float> out_g, Pointer<Float> out_b)>('igColorConvertHSVtoRGB');

///```c
/// void colorConvertRGBtoHSV(
///   float r ,
///   float g ,
///   float b ,
///   float* out_h ,
///   float* out_s ,
///   float* out_v 
/// );
///```
void colorConvertRGBtoHSV(double r, double g, double b, Pointer<Float> out_h, Pointer<Float> out_s, Pointer<Float> out_v) =>
  _igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v);

late final _igColorConvertRGBtoHSV = _cimgui.lookupFunction<
  Void Function(Float r, Float g, Float b, Pointer<Float> out_h, Pointer<Float> out_s, Pointer<Float> out_v),
  void Function(double r, double g, double b, Pointer<Float> out_h, Pointer<Float> out_s, Pointer<Float> out_v)>('igColorConvertRGBtoHSV');

///```c
/// void colorConvertU32ToFloat4(
///   Vector4* pOut ,
///   uint _in 
/// );
///```
void colorConvertU32ToFloat4(Pointer<Vector4> pOut, int _in) =>
  _igColorConvertU32ToFloat4(pOut, _in);

late final _igColorConvertU32ToFloat4 = _cimgui.lookupFunction<
  Void Function(Pointer<Vector4> pOut, Uint32 _in),
  void Function(Pointer<Vector4> pOut, int _in)>('igColorConvertU32ToFloat4');

///```c
/// byte colorEdit3(
///   byte* label ,
///   Vector3* col ,
///   ImGuiColorEditFlags flags 
/// );
///```
int colorEdit3(Pointer<Uint8> label, Pointer<Vector3> col, int flags) =>
  _igColorEdit3(label, col, flags);

late final _igColorEdit3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector3> col, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector3> col, int flags)>('igColorEdit3');

///```c
/// byte colorEdit4(
///   byte* label ,
///   Vector4* col ,
///   ImGuiColorEditFlags flags 
/// );
///```
int colorEdit4(Pointer<Uint8> label, Pointer<Vector4> col, int flags) =>
  _igColorEdit4(label, col, flags);

late final _igColorEdit4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector4> col, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector4> col, int flags)>('igColorEdit4');

///```c
/// byte colorPicker3(
///   byte* label ,
///   Vector3* col ,
///   ImGuiColorEditFlags flags 
/// );
///```
int colorPicker3(Pointer<Uint8> label, Pointer<Vector3> col, int flags) =>
  _igColorPicker3(label, col, flags);

late final _igColorPicker3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector3> col, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector3> col, int flags)>('igColorPicker3');

///```c
/// byte colorPicker4(
///   byte* label ,
///   Vector4* col ,
///   ImGuiColorEditFlags flags ,
///   float* ref_col 
/// );
///```
int colorPicker4(Pointer<Uint8> label, Pointer<Vector4> col, int flags, Pointer<Float> ref_col) =>
  _igColorPicker4(label, col, flags, ref_col);

late final _igColorPicker4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector4> col, Uint32 flags, Pointer<Float> ref_col),
  int Function(Pointer<Uint8> label, Pointer<Vector4> col, int flags, Pointer<Float> ref_col)>('igColorPicker4');

///```c
/// void columns(
///   int count ,
///   byte* id ,
///   byte border 
/// );
///```
void columns(int count, Pointer<Uint8> id, int border) =>
  _igColumns(count, id, border);

late final _igColumns = _cimgui.lookupFunction<
  Void Function(Int32 count, Pointer<Uint8> id, Uint8 border),
  void Function(int count, Pointer<Uint8> id, int border)>('igColumns');

///```c
/// byte combo(
///   byte* label ,
///   int* current_item ,
///   byte** items ,
///   int items_count ,
///   int popup_max_height_in_items 
/// );
///```
int combo(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, int items_count, int popup_max_height_in_items) =>
  _igComboStr_arr(label, current_item, items, items_count, popup_max_height_in_items);

late final _igComboStr_arr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, Int32 items_count, Int32 popup_max_height_in_items),
  int Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, int items_count, int popup_max_height_in_items)>('igComboStr_arr');

///```c
/// byte combo(
///   byte* label ,
///   int* current_item ,
///   byte* items_separated_by_zeros ,
///   int popup_max_height_in_items 
/// );
///```
int combo(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Uint8> items_separated_by_zeros, int popup_max_height_in_items) =>
  _igComboStr(label, current_item, items_separated_by_zeros, popup_max_height_in_items);

late final _igComboStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Uint8> items_separated_by_zeros, Int32 popup_max_height_in_items),
  int Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Uint8> items_separated_by_zeros, int popup_max_height_in_items)>('igComboStr');

///```c
/// byte combo(
///   byte* label ,
///   int* current_item ,
///   Pointer items_getter ,
///   void* data ,
///   int items_count ,
///   int popup_max_height_in_items 
/// );
///```
int combo(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, int items_count, int popup_max_height_in_items) =>
  _igComboFnBoolPtr(label, current_item, items_getter, data, items_count, popup_max_height_in_items);

late final _igComboFnBoolPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, Int32 items_count, Int32 popup_max_height_in_items),
  int Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, int items_count, int popup_max_height_in_items)>('igComboFnBoolPtr');

///```c
/// IntPtr createContext(
///   ImFontAtlas* shared_font_atlas 
/// );
///```
int createContext(Pointer<ImFontAtlas> shared_font_atlas) =>
  _igCreateContext(shared_font_atlas);

late final _igCreateContext = _cimgui.lookupFunction<
  IntPtr Function(Pointer<ImFontAtlas> shared_font_atlas),
  int Function(Pointer<ImFontAtlas> shared_font_atlas)>('igCreateContext');

///```c
/// byte debugCheckVersionAndDataLayout(
///   byte* version_str ,
///   uint sz_io ,
///   uint sz_style ,
///   uint sz_vec2 ,
///   uint sz_vec4 ,
///   uint sz_drawvert ,
///   uint sz_drawidx 
/// );
///```
int debugCheckVersionAndDataLayout(Pointer<Uint8> version_str, int sz_io, int sz_style, int sz_vec2, int sz_vec4, int sz_drawvert, int sz_drawidx) =>
  _igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx);

late final _igDebugCheckVersionAndDataLayout = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> version_str, Uint32 sz_io, Uint32 sz_style, Uint32 sz_vec2, Uint32 sz_vec4, Uint32 sz_drawvert, Uint32 sz_drawidx),
  int Function(Pointer<Uint8> version_str, int sz_io, int sz_style, int sz_vec2, int sz_vec4, int sz_drawvert, int sz_drawidx)>('igDebugCheckVersionAndDataLayout');

///```c
/// void destroyContext(
///   IntPtr ctx 
/// );
///```
void destroyContext(int ctx) =>
  _igDestroyContext(ctx);

late final _igDestroyContext = _cimgui.lookupFunction<
  Void Function(IntPtr ctx),
  void Function(int ctx)>('igDestroyContext');

///```c
/// void destroyPlatformWindows(
/// );
///```
void destroyPlatformWindows() =>
  _igDestroyPlatformWindows();

late final _igDestroyPlatformWindows = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igDestroyPlatformWindows');

///```c
/// void dockSpace(
///   uint id ,
///   Vector2 size ,
///   ImGuiDockNodeFlags flags ,
///   ImGuiWindowClass* window_class 
/// );
///```
void dockSpace(int id, Vector2 size, int flags, Pointer<ImGuiWindowClass> window_class) =>
  _igDockSpace(id, size, flags, window_class);

late final _igDockSpace = _cimgui.lookupFunction<
  Void Function(Uint32 id, Vector2 size, Uint32 flags, Pointer<ImGuiWindowClass> window_class),
  void Function(int id, Vector2 size, int flags, Pointer<ImGuiWindowClass> window_class)>('igDockSpace');

///```c
/// uint dockSpaceOverViewport(
///   ImGuiViewport* viewport ,
///   ImGuiDockNodeFlags flags ,
///   ImGuiWindowClass* window_class 
/// );
///```
int dockSpaceOverViewport(Pointer<ImGuiViewport> viewport, int flags, Pointer<ImGuiWindowClass> window_class) =>
  _igDockSpaceOverViewport(viewport, flags, window_class);

late final _igDockSpaceOverViewport = _cimgui.lookupFunction<
  Uint32 Function(Pointer<ImGuiViewport> viewport, Uint32 flags, Pointer<ImGuiWindowClass> window_class),
  int Function(Pointer<ImGuiViewport> viewport, int flags, Pointer<ImGuiWindowClass> window_class)>('igDockSpaceOverViewport');

///```c
/// byte dragFloat(
///   byte* label ,
///   float* v ,
///   float v_speed ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragFloat(Pointer<Uint8> label, Pointer<Float> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igDragFloat(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragFloat = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Float> v, Float v_speed, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Float> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igDragFloat');

///```c
/// byte dragFloat2(
///   byte* label ,
///   Vector2* v ,
///   float v_speed ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragFloat2(Pointer<Uint8> label, Pointer<Vector2> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igDragFloat2(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragFloat2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector2> v, Float v_speed, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector2> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igDragFloat2');

///```c
/// byte dragFloat3(
///   byte* label ,
///   Vector3* v ,
///   float v_speed ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragFloat3(Pointer<Uint8> label, Pointer<Vector3> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igDragFloat3(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragFloat3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector3> v, Float v_speed, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector3> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igDragFloat3');

///```c
/// byte dragFloat4(
///   byte* label ,
///   Vector4* v ,
///   float v_speed ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragFloat4(Pointer<Uint8> label, Pointer<Vector4> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igDragFloat4(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragFloat4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector4> v, Float v_speed, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector4> v, double v_speed, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igDragFloat4');

///```c
/// byte dragFloatRange2(
///   byte* label ,
///   float* v_current_min ,
///   float* v_current_max ,
///   float v_speed ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   byte* format_max ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragFloatRange2(Pointer<Uint8> label, Pointer<Float> v_current_min, Pointer<Float> v_current_max, double v_speed, double v_min, double v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, int flags) =>
  _igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);

late final _igDragFloatRange2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Float> v_current_min, Pointer<Float> v_current_max, Float v_speed, Float v_min, Float v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Float> v_current_min, Pointer<Float> v_current_max, double v_speed, double v_min, double v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, int flags)>('igDragFloatRange2');

///```c
/// byte dragInt(
///   byte* label ,
///   int* v ,
///   float v_speed ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragInt(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igDragInt(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragInt = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Float v_speed, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igDragInt');

///```c
/// byte dragInt2(
///   byte* label ,
///   int* v ,
///   float v_speed ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragInt2(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igDragInt2(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragInt2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Float v_speed, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igDragInt2');

///```c
/// byte dragInt3(
///   byte* label ,
///   int* v ,
///   float v_speed ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragInt3(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igDragInt3(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragInt3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Float v_speed, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igDragInt3');

///```c
/// byte dragInt4(
///   byte* label ,
///   int* v ,
///   float v_speed ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragInt4(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igDragInt4(label, v, v_speed, v_min, v_max, format, flags);

late final _igDragInt4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Float v_speed, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, double v_speed, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igDragInt4');

///```c
/// byte dragIntRange2(
///   byte* label ,
///   int* v_current_min ,
///   int* v_current_max ,
///   float v_speed ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   byte* format_max ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragIntRange2(Pointer<Uint8> label, Pointer<Int32> v_current_min, Pointer<Int32> v_current_max, double v_speed, int v_min, int v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, int flags) =>
  _igDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);

late final _igDragIntRange2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v_current_min, Pointer<Int32> v_current_max, Float v_speed, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v_current_min, Pointer<Int32> v_current_max, double v_speed, int v_min, int v_max, Pointer<Uint8> format, Pointer<Uint8> format_max, int flags)>('igDragIntRange2');

///```c
/// byte dragScalar(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   float v_speed ,
///   void* p_min ,
///   void* p_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragScalar(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, double v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags) =>
  _igDragScalar(label, data_type, p_data, v_speed, p_min, p_max, format, flags);

late final _igDragScalar = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Float v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, double v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags)>('igDragScalar');

///```c
/// byte dragScalarN(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   int components ,
///   float v_speed ,
///   void* p_min ,
///   void* p_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int dragScalarN(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, double v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags) =>
  _igDragScalarN(label, data_type, p_data, components, v_speed, p_min, p_max, format, flags);

late final _igDragScalarN = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Int32 components, Float v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, double v_speed, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags)>('igDragScalarN');

///```c
/// void dummy(
///   Vector2 size 
/// );
///```
void dummy(Vector2 size) =>
  _igDummy(size);

late final _igDummy = _cimgui.lookupFunction<
  Void Function(Vector2 size),
  void Function(Vector2 size)>('igDummy');

///```c
/// void end(
/// );
///```
void end() =>
  _igEnd();

late final _igEnd = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEnd');

///```c
/// void endChild(
/// );
///```
void endChild() =>
  _igEndChild();

late final _igEndChild = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndChild');

///```c
/// void endChildFrame(
/// );
///```
void endChildFrame() =>
  _igEndChildFrame();

late final _igEndChildFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndChildFrame');

///```c
/// void endCombo(
/// );
///```
void endCombo() =>
  _igEndCombo();

late final _igEndCombo = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndCombo');

///```c
/// void endDragDropSource(
/// );
///```
void endDragDropSource() =>
  _igEndDragDropSource();

late final _igEndDragDropSource = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndDragDropSource');

///```c
/// void endDragDropTarget(
/// );
///```
void endDragDropTarget() =>
  _igEndDragDropTarget();

late final _igEndDragDropTarget = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndDragDropTarget');

///```c
/// void endFrame(
/// );
///```
void endFrame() =>
  _igEndFrame();

late final _igEndFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndFrame');

///```c
/// void endGroup(
/// );
///```
void endGroup() =>
  _igEndGroup();

late final _igEndGroup = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndGroup');

///```c
/// void endListBox(
/// );
///```
void endListBox() =>
  _igEndListBox();

late final _igEndListBox = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndListBox');

///```c
/// void endMainMenuBar(
/// );
///```
void endMainMenuBar() =>
  _igEndMainMenuBar();

late final _igEndMainMenuBar = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndMainMenuBar');

///```c
/// void endMenu(
/// );
///```
void endMenu() =>
  _igEndMenu();

late final _igEndMenu = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndMenu');

///```c
/// void endMenuBar(
/// );
///```
void endMenuBar() =>
  _igEndMenuBar();

late final _igEndMenuBar = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndMenuBar');

///```c
/// void endPopup(
/// );
///```
void endPopup() =>
  _igEndPopup();

late final _igEndPopup = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndPopup');

///```c
/// void endTabBar(
/// );
///```
void endTabBar() =>
  _igEndTabBar();

late final _igEndTabBar = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndTabBar');

///```c
/// void endTabItem(
/// );
///```
void endTabItem() =>
  _igEndTabItem();

late final _igEndTabItem = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndTabItem');

///```c
/// void endTable(
/// );
///```
void endTable() =>
  _igEndTable();

late final _igEndTable = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndTable');

///```c
/// void endTooltip(
/// );
///```
void endTooltip() =>
  _igEndTooltip();

late final _igEndTooltip = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igEndTooltip');

///```c
/// ImGuiViewport* findViewportByID(
///   uint id 
/// );
///```
Pointer<ImGuiViewport> findViewportByID(int id) =>
  _igFindViewportByID(id);

late final _igFindViewportByID = _cimgui.lookupFunction<
  Pointer<ImGuiViewport> Function(Uint32 id),
  Pointer<ImGuiViewport> Function(int id)>('igFindViewportByID');

///```c
/// ImGuiViewport* findViewportByPlatformHandle(
///   void* platform_handle 
/// );
///```
Pointer<ImGuiViewport> findViewportByPlatformHandle(Pointer<Void> platform_handle) =>
  _igFindViewportByPlatformHandle(platform_handle);

late final _igFindViewportByPlatformHandle = _cimgui.lookupFunction<
  Pointer<ImGuiViewport> Function(Pointer<Void> platform_handle),
  Pointer<ImGuiViewport> Function(Pointer<Void> platform_handle)>('igFindViewportByPlatformHandle');

///```c
/// void getAllocatorFunctions(
///   IntPtr* p_alloc_func ,
///   IntPtr* p_free_func ,
///   void** p_user_data 
/// );
///```
void getAllocatorFunctions(Pointer<IntPtr> p_alloc_func, Pointer<IntPtr> p_free_func, Pointer<Pointer<Void>> p_user_data) =>
  _igGetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data);

late final _igGetAllocatorFunctions = _cimgui.lookupFunction<
  Void Function(Pointer<IntPtr> p_alloc_func, Pointer<IntPtr> p_free_func, Pointer<Pointer<Void>> p_user_data),
  void Function(Pointer<IntPtr> p_alloc_func, Pointer<IntPtr> p_free_func, Pointer<Pointer<Void>> p_user_data)>('igGetAllocatorFunctions');

///```c
/// ImDrawList* getBackgroundDrawList(
/// );
///```
Pointer<ImDrawList> getBackgroundDrawList() =>
  _igGetBackgroundDrawListNil();

late final _igGetBackgroundDrawListNil = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(),
  Pointer<ImDrawList> Function()>('igGetBackgroundDrawListNil');

///```c
/// ImDrawList* getBackgroundDrawList(
///   ImGuiViewport* viewport 
/// );
///```
Pointer<ImDrawList> getBackgroundDrawList(Pointer<ImGuiViewport> viewport) =>
  _igGetBackgroundDrawListViewportPtr(viewport);

late final _igGetBackgroundDrawListViewportPtr = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(Pointer<ImGuiViewport> viewport),
  Pointer<ImDrawList> Function(Pointer<ImGuiViewport> viewport)>('igGetBackgroundDrawListViewportPtr');

///```c
/// byte* getClipboardText(
/// );
///```
Pointer<Uint8> getClipboardText() =>
  _igGetClipboardText();

late final _igGetClipboardText = _cimgui.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()>('igGetClipboardText');

///```c
/// uint getColorU32(
///   ImGuiCol idx ,
///   float alpha_mul 
/// );
///```
int getColorU32(int idx, double alpha_mul) =>
  _igGetColorU32Col(idx, alpha_mul);

late final _igGetColorU32Col = _cimgui.lookupFunction<
  Uint32 Function(Uint32 idx, Float alpha_mul),
  int Function(int idx, double alpha_mul)>('igGetColorU32Col');

///```c
/// uint getColorU32(
///   Vector4 col 
/// );
///```
int getColorU32(Vector4 col) =>
  _igGetColorU32Vec4(col);

late final _igGetColorU32Vec4 = _cimgui.lookupFunction<
  Uint32 Function(Vector4 col),
  int Function(Vector4 col)>('igGetColorU32Vec4');

///```c
/// uint getColorU32(
///   uint col 
/// );
///```
int getColorU32(int col) =>
  _igGetColorU32U32(col);

late final _igGetColorU32U32 = _cimgui.lookupFunction<
  Uint32 Function(Uint32 col),
  int Function(int col)>('igGetColorU32U32');

///```c
/// int getColumnIndex(
/// );
///```
int getColumnIndex() =>
  _igGetColumnIndex();

late final _igGetColumnIndex = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igGetColumnIndex');

///```c
/// float getColumnOffset(
///   int column_index 
/// );
///```
double getColumnOffset(int column_index) =>
  _igGetColumnOffset(column_index);

late final _igGetColumnOffset = _cimgui.lookupFunction<
  Float Function(Int32 column_index),
  double Function(int column_index)>('igGetColumnOffset');

///```c
/// float getColumnWidth(
///   int column_index 
/// );
///```
double getColumnWidth(int column_index) =>
  _igGetColumnWidth(column_index);

late final _igGetColumnWidth = _cimgui.lookupFunction<
  Float Function(Int32 column_index),
  double Function(int column_index)>('igGetColumnWidth');

///```c
/// int getColumnsCount(
/// );
///```
int getColumnsCount() =>
  _igGetColumnsCount();

late final _igGetColumnsCount = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igGetColumnsCount');

///```c
/// void getContentRegionAvail(
///   Vector2* pOut 
/// );
///```
void getContentRegionAvail(Pointer<Vector2> pOut) =>
  _igGetContentRegionAvail(pOut);

late final _igGetContentRegionAvail = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetContentRegionAvail');

///```c
/// void getContentRegionMax(
///   Vector2* pOut 
/// );
///```
void getContentRegionMax(Pointer<Vector2> pOut) =>
  _igGetContentRegionMax(pOut);

late final _igGetContentRegionMax = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetContentRegionMax');

///```c
/// IntPtr getCurrentContext(
/// );
///```
int getCurrentContext() =>
  _igGetCurrentContext();

late final _igGetCurrentContext = _cimgui.lookupFunction<
  IntPtr Function(),
  int Function()>('igGetCurrentContext');

///```c
/// void getCursorPos(
///   Vector2* pOut 
/// );
///```
void getCursorPos(Pointer<Vector2> pOut) =>
  _igGetCursorPos(pOut);

late final _igGetCursorPos = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetCursorPos');

///```c
/// float getCursorPosX(
/// );
///```
double getCursorPosX() =>
  _igGetCursorPosX();

late final _igGetCursorPosX = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetCursorPosX');

///```c
/// float getCursorPosY(
/// );
///```
double getCursorPosY() =>
  _igGetCursorPosY();

late final _igGetCursorPosY = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetCursorPosY');

///```c
/// void getCursorScreenPos(
///   Vector2* pOut 
/// );
///```
void getCursorScreenPos(Pointer<Vector2> pOut) =>
  _igGetCursorScreenPos(pOut);

late final _igGetCursorScreenPos = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetCursorScreenPos');

///```c
/// void getCursorStartPos(
///   Vector2* pOut 
/// );
///```
void getCursorStartPos(Pointer<Vector2> pOut) =>
  _igGetCursorStartPos(pOut);

late final _igGetCursorStartPos = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetCursorStartPos');

///```c
/// ImGuiPayload* getDragDropPayload(
/// );
///```
Pointer<ImGuiPayload> getDragDropPayload() =>
  _igGetDragDropPayload();

late final _igGetDragDropPayload = _cimgui.lookupFunction<
  Pointer<ImGuiPayload> Function(),
  Pointer<ImGuiPayload> Function()>('igGetDragDropPayload');

///```c
/// ImDrawData* getDrawData(
/// );
///```
Pointer<ImDrawData> getDrawData() =>
  _igGetDrawData();

late final _igGetDrawData = _cimgui.lookupFunction<
  Pointer<ImDrawData> Function(),
  Pointer<ImDrawData> Function()>('igGetDrawData');

///```c
/// IntPtr getDrawListSharedData(
/// );
///```
int getDrawListSharedData() =>
  _igGetDrawListSharedData();

late final _igGetDrawListSharedData = _cimgui.lookupFunction<
  IntPtr Function(),
  int Function()>('igGetDrawListSharedData');

///```c
/// ImFont* getFont(
/// );
///```
Pointer<ImFont> getFont() =>
  _igGetFont();

late final _igGetFont = _cimgui.lookupFunction<
  Pointer<ImFont> Function(),
  Pointer<ImFont> Function()>('igGetFont');

///```c
/// float getFontSize(
/// );
///```
double getFontSize() =>
  _igGetFontSize();

late final _igGetFontSize = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetFontSize');

///```c
/// void getFontTexUvWhitePixel(
///   Vector2* pOut 
/// );
///```
void getFontTexUvWhitePixel(Pointer<Vector2> pOut) =>
  _igGetFontTexUvWhitePixel(pOut);

late final _igGetFontTexUvWhitePixel = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetFontTexUvWhitePixel');

///```c
/// ImDrawList* getForegroundDrawList(
/// );
///```
Pointer<ImDrawList> getForegroundDrawList() =>
  _igGetForegroundDrawListNil();

late final _igGetForegroundDrawListNil = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(),
  Pointer<ImDrawList> Function()>('igGetForegroundDrawListNil');

///```c
/// ImDrawList* getForegroundDrawList(
///   ImGuiViewport* viewport 
/// );
///```
Pointer<ImDrawList> getForegroundDrawList(Pointer<ImGuiViewport> viewport) =>
  _igGetForegroundDrawListViewportPtr(viewport);

late final _igGetForegroundDrawListViewportPtr = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(Pointer<ImGuiViewport> viewport),
  Pointer<ImDrawList> Function(Pointer<ImGuiViewport> viewport)>('igGetForegroundDrawListViewportPtr');

///```c
/// int getFrameCount(
/// );
///```
int getFrameCount() =>
  _igGetFrameCount();

late final _igGetFrameCount = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igGetFrameCount');

///```c
/// float getFrameHeight(
/// );
///```
double getFrameHeight() =>
  _igGetFrameHeight();

late final _igGetFrameHeight = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetFrameHeight');

///```c
/// float getFrameHeightWithSpacing(
/// );
///```
double getFrameHeightWithSpacing() =>
  _igGetFrameHeightWithSpacing();

late final _igGetFrameHeightWithSpacing = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetFrameHeightWithSpacing');

///```c
/// uint getID(
///   byte* str_id 
/// );
///```
int getID(Pointer<Uint8> str_id) =>
  _igGetIDStr(str_id);

late final _igGetIDStr = _cimgui.lookupFunction<
  Uint32 Function(Pointer<Uint8> str_id),
  int Function(Pointer<Uint8> str_id)>('igGetIDStr');

///```c
/// uint getID(
///   byte* str_id_begin ,
///   byte* str_id_end 
/// );
///```
int getID(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end) =>
  _igGetIDStrStr(str_id_begin, str_id_end);

late final _igGetIDStrStr = _cimgui.lookupFunction<
  Uint32 Function(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end),
  int Function(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end)>('igGetIDStrStr');

///```c
/// uint getID(
///   void* ptr_id 
/// );
///```
int getID(Pointer<Void> ptr_id) =>
  _igGetIDPtr(ptr_id);

late final _igGetIDPtr = _cimgui.lookupFunction<
  Uint32 Function(Pointer<Void> ptr_id),
  int Function(Pointer<Void> ptr_id)>('igGetIDPtr');

///```c
/// ImGuiIO* getIO(
/// );
///```
Pointer<ImGuiIO> getIO() =>
  _igGetIO();

late final _igGetIO = _cimgui.lookupFunction<
  Pointer<ImGuiIO> Function(),
  Pointer<ImGuiIO> Function()>('igGetIO');

///```c
/// void getItemRectMax(
///   Vector2* pOut 
/// );
///```
void getItemRectMax(Pointer<Vector2> pOut) =>
  _igGetItemRectMax(pOut);

late final _igGetItemRectMax = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetItemRectMax');

///```c
/// void getItemRectMin(
///   Vector2* pOut 
/// );
///```
void getItemRectMin(Pointer<Vector2> pOut) =>
  _igGetItemRectMin(pOut);

late final _igGetItemRectMin = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetItemRectMin');

///```c
/// void getItemRectSize(
///   Vector2* pOut 
/// );
///```
void getItemRectSize(Pointer<Vector2> pOut) =>
  _igGetItemRectSize(pOut);

late final _igGetItemRectSize = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetItemRectSize');

///```c
/// int getKeyIndex(
///   ImGuiKey imgui_key 
/// );
///```
int getKeyIndex(int imgui_key) =>
  _igGetKeyIndex(imgui_key);

late final _igGetKeyIndex = _cimgui.lookupFunction<
  Int32 Function(Uint32 imgui_key),
  int Function(int imgui_key)>('igGetKeyIndex');

///```c
/// int getKeyPressedAmount(
///   int key_index ,
///   float repeat_delay ,
///   float rate 
/// );
///```
int getKeyPressedAmount(int key_index, double repeat_delay, double rate) =>
  _igGetKeyPressedAmount(key_index, repeat_delay, rate);

late final _igGetKeyPressedAmount = _cimgui.lookupFunction<
  Int32 Function(Int32 key_index, Float repeat_delay, Float rate),
  int Function(int key_index, double repeat_delay, double rate)>('igGetKeyPressedAmount');

///```c
/// ImGuiViewport* getMainViewport(
/// );
///```
Pointer<ImGuiViewport> getMainViewport() =>
  _igGetMainViewport();

late final _igGetMainViewport = _cimgui.lookupFunction<
  Pointer<ImGuiViewport> Function(),
  Pointer<ImGuiViewport> Function()>('igGetMainViewport');

///```c
/// ImGuiMouseCursor getMouseCursor(
/// );
///```
int getMouseCursor() =>
  _igGetMouseCursor();

late final _igGetMouseCursor = _cimgui.lookupFunction<
  Uint32 Function(),
  int Function()>('igGetMouseCursor');

///```c
/// void getMouseDragDelta(
///   Vector2* pOut ,
///   ImGuiMouseButton button ,
///   float lock_threshold 
/// );
///```
void getMouseDragDelta(Pointer<Vector2> pOut, int button, double lock_threshold) =>
  _igGetMouseDragDelta(pOut, button, lock_threshold);

late final _igGetMouseDragDelta = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut, Uint32 button, Float lock_threshold),
  void Function(Pointer<Vector2> pOut, int button, double lock_threshold)>('igGetMouseDragDelta');

///```c
/// void getMousePos(
///   Vector2* pOut 
/// );
///```
void getMousePos(Pointer<Vector2> pOut) =>
  _igGetMousePos(pOut);

late final _igGetMousePos = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetMousePos');

///```c
/// void getMousePosOnOpeningCurrentPopup(
///   Vector2* pOut 
/// );
///```
void getMousePosOnOpeningCurrentPopup(Pointer<Vector2> pOut) =>
  _igGetMousePosOnOpeningCurrentPopup(pOut);

late final _igGetMousePosOnOpeningCurrentPopup = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetMousePosOnOpeningCurrentPopup');

///```c
/// ImGuiPlatformIO* getPlatformIO(
/// );
///```
Pointer<ImGuiPlatformIO> getPlatformIO() =>
  _igGetPlatformIO();

late final _igGetPlatformIO = _cimgui.lookupFunction<
  Pointer<ImGuiPlatformIO> Function(),
  Pointer<ImGuiPlatformIO> Function()>('igGetPlatformIO');

///```c
/// float getScrollMaxX(
/// );
///```
double getScrollMaxX() =>
  _igGetScrollMaxX();

late final _igGetScrollMaxX = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetScrollMaxX');

///```c
/// float getScrollMaxY(
/// );
///```
double getScrollMaxY() =>
  _igGetScrollMaxY();

late final _igGetScrollMaxY = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetScrollMaxY');

///```c
/// float getScrollX(
/// );
///```
double getScrollX() =>
  _igGetScrollX();

late final _igGetScrollX = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetScrollX');

///```c
/// float getScrollY(
/// );
///```
double getScrollY() =>
  _igGetScrollY();

late final _igGetScrollY = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetScrollY');

///```c
/// ImGuiStorage* getStateStorage(
/// );
///```
Pointer<ImGuiStorage> getStateStorage() =>
  _igGetStateStorage();

late final _igGetStateStorage = _cimgui.lookupFunction<
  Pointer<ImGuiStorage> Function(),
  Pointer<ImGuiStorage> Function()>('igGetStateStorage');

///```c
/// ImGuiStyle* getStyle(
/// );
///```
Pointer<ImGuiStyle> getStyle() =>
  _igGetStyle();

late final _igGetStyle = _cimgui.lookupFunction<
  Pointer<ImGuiStyle> Function(),
  Pointer<ImGuiStyle> Function()>('igGetStyle');

///```c
/// byte* getStyleColorName(
///   ImGuiCol idx 
/// );
///```
Pointer<Uint8> getStyleColorName(int idx) =>
  _igGetStyleColorName(idx);

late final _igGetStyleColorName = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Uint32 idx),
  Pointer<Uint8> Function(int idx)>('igGetStyleColorName');

///```c
/// Vector4* getStyleColorVec4(
///   ImGuiCol idx 
/// );
///```
Pointer<Vector4> getStyleColorVec4(int idx) =>
  _igGetStyleColorVec4(idx);

late final _igGetStyleColorVec4 = _cimgui.lookupFunction<
  Pointer<Vector4> Function(Uint32 idx),
  Pointer<Vector4> Function(int idx)>('igGetStyleColorVec4');

///```c
/// float getTextLineHeight(
/// );
///```
double getTextLineHeight() =>
  _igGetTextLineHeight();

late final _igGetTextLineHeight = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetTextLineHeight');

///```c
/// float getTextLineHeightWithSpacing(
/// );
///```
double getTextLineHeightWithSpacing() =>
  _igGetTextLineHeightWithSpacing();

late final _igGetTextLineHeightWithSpacing = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetTextLineHeightWithSpacing');

///```c
/// double getTime(
/// );
///```
double getTime() =>
  _igGetTime();

late final _igGetTime = _cimgui.lookupFunction<
  Double Function(),
  double Function()>('igGetTime');

///```c
/// float getTreeNodeToLabelSpacing(
/// );
///```
double getTreeNodeToLabelSpacing() =>
  _igGetTreeNodeToLabelSpacing();

late final _igGetTreeNodeToLabelSpacing = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetTreeNodeToLabelSpacing');

///```c
/// byte* getVersion(
/// );
///```
Pointer<Uint8> getVersion() =>
  _igGetVersion();

late final _igGetVersion = _cimgui.lookupFunction<
  Pointer<Uint8> Function(),
  Pointer<Uint8> Function()>('igGetVersion');

///```c
/// void getWindowContentRegionMax(
///   Vector2* pOut 
/// );
///```
void getWindowContentRegionMax(Pointer<Vector2> pOut) =>
  _igGetWindowContentRegionMax(pOut);

late final _igGetWindowContentRegionMax = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetWindowContentRegionMax');

///```c
/// void getWindowContentRegionMin(
///   Vector2* pOut 
/// );
///```
void getWindowContentRegionMin(Pointer<Vector2> pOut) =>
  _igGetWindowContentRegionMin(pOut);

late final _igGetWindowContentRegionMin = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetWindowContentRegionMin');

///```c
/// float getWindowContentRegionWidth(
/// );
///```
double getWindowContentRegionWidth() =>
  _igGetWindowContentRegionWidth();

late final _igGetWindowContentRegionWidth = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetWindowContentRegionWidth');

///```c
/// uint getWindowDockID(
/// );
///```
int getWindowDockID() =>
  _igGetWindowDockID();

late final _igGetWindowDockID = _cimgui.lookupFunction<
  Uint32 Function(),
  int Function()>('igGetWindowDockID');

///```c
/// float getWindowDpiScale(
/// );
///```
double getWindowDpiScale() =>
  _igGetWindowDpiScale();

late final _igGetWindowDpiScale = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetWindowDpiScale');

///```c
/// ImDrawList* getWindowDrawList(
/// );
///```
Pointer<ImDrawList> getWindowDrawList() =>
  _igGetWindowDrawList();

late final _igGetWindowDrawList = _cimgui.lookupFunction<
  Pointer<ImDrawList> Function(),
  Pointer<ImDrawList> Function()>('igGetWindowDrawList');

///```c
/// float getWindowHeight(
/// );
///```
double getWindowHeight() =>
  _igGetWindowHeight();

late final _igGetWindowHeight = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetWindowHeight');

///```c
/// void getWindowPos(
///   Vector2* pOut 
/// );
///```
void getWindowPos(Pointer<Vector2> pOut) =>
  _igGetWindowPos(pOut);

late final _igGetWindowPos = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetWindowPos');

///```c
/// void getWindowSize(
///   Vector2* pOut 
/// );
///```
void getWindowSize(Pointer<Vector2> pOut) =>
  _igGetWindowSize(pOut);

late final _igGetWindowSize = _cimgui.lookupFunction<
  Void Function(Pointer<Vector2> pOut),
  void Function(Pointer<Vector2> pOut)>('igGetWindowSize');

///```c
/// ImGuiViewport* getWindowViewport(
/// );
///```
Pointer<ImGuiViewport> getWindowViewport() =>
  _igGetWindowViewport();

late final _igGetWindowViewport = _cimgui.lookupFunction<
  Pointer<ImGuiViewport> Function(),
  Pointer<ImGuiViewport> Function()>('igGetWindowViewport');

///```c
/// float getWindowWidth(
/// );
///```
double getWindowWidth() =>
  _igGetWindowWidth();

late final _igGetWindowWidth = _cimgui.lookupFunction<
  Float Function(),
  double Function()>('igGetWindowWidth');

///```c
/// void image(
///   IntPtr user_texture_id ,
///   Vector2 size ,
///   Vector2 uv0 ,
///   Vector2 uv1 ,
///   Vector4 tint_col ,
///   Vector4 border_col 
/// );
///```
void image(int user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, Vector4 tint_col, Vector4 border_col) =>
  _igImage(user_texture_id, size, uv0, uv1, tint_col, border_col);

late final _igImage = _cimgui.lookupFunction<
  Void Function(IntPtr user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, Vector4 tint_col, Vector4 border_col),
  void Function(int user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, Vector4 tint_col, Vector4 border_col)>('igImage');

///```c
/// byte imageButton(
///   IntPtr user_texture_id ,
///   Vector2 size ,
///   Vector2 uv0 ,
///   Vector2 uv1 ,
///   int frame_padding ,
///   Vector4 bg_col ,
///   Vector4 tint_col 
/// );
///```
int imageButton(int user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, int frame_padding, Vector4 bg_col, Vector4 tint_col) =>
  _igImageButton(user_texture_id, size, uv0, uv1, frame_padding, bg_col, tint_col);

late final _igImageButton = _cimgui.lookupFunction<
  Uint8 Function(IntPtr user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, Int32 frame_padding, Vector4 bg_col, Vector4 tint_col),
  int Function(int user_texture_id, Vector2 size, Vector2 uv0, Vector2 uv1, int frame_padding, Vector4 bg_col, Vector4 tint_col)>('igImageButton');

///```c
/// void indent(
///   float indent_w 
/// );
///```
void indent(double indent_w) =>
  _igIndent(indent_w);

late final _igIndent = _cimgui.lookupFunction<
  Void Function(Float indent_w),
  void Function(double indent_w)>('igIndent');

///```c
/// byte inputDouble(
///   byte* label ,
///   double* v ,
///   double step ,
///   double step_fast ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputDouble(Pointer<Uint8> label, Pointer<Double> v, double step, double step_fast, Pointer<Uint8> format, int flags) =>
  _igInputDouble(label, v, step, step_fast, format, flags);

late final _igInputDouble = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Double> v, Double step, Double step_fast, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Double> v, double step, double step_fast, Pointer<Uint8> format, int flags)>('igInputDouble');

///```c
/// byte inputFloat(
///   byte* label ,
///   float* v ,
///   float step ,
///   float step_fast ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputFloat(Pointer<Uint8> label, Pointer<Float> v, double step, double step_fast, Pointer<Uint8> format, int flags) =>
  _igInputFloat(label, v, step, step_fast, format, flags);

late final _igInputFloat = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Float> v, Float step, Float step_fast, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Float> v, double step, double step_fast, Pointer<Uint8> format, int flags)>('igInputFloat');

///```c
/// byte inputFloat2(
///   byte* label ,
///   Vector2* v ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputFloat2(Pointer<Uint8> label, Pointer<Vector2> v, Pointer<Uint8> format, int flags) =>
  _igInputFloat2(label, v, format, flags);

late final _igInputFloat2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector2> v, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector2> v, Pointer<Uint8> format, int flags)>('igInputFloat2');

///```c
/// byte inputFloat3(
///   byte* label ,
///   Vector3* v ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputFloat3(Pointer<Uint8> label, Pointer<Vector3> v, Pointer<Uint8> format, int flags) =>
  _igInputFloat3(label, v, format, flags);

late final _igInputFloat3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector3> v, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector3> v, Pointer<Uint8> format, int flags)>('igInputFloat3');

///```c
/// byte inputFloat4(
///   byte* label ,
///   Vector4* v ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputFloat4(Pointer<Uint8> label, Pointer<Vector4> v, Pointer<Uint8> format, int flags) =>
  _igInputFloat4(label, v, format, flags);

late final _igInputFloat4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector4> v, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector4> v, Pointer<Uint8> format, int flags)>('igInputFloat4');

///```c
/// byte inputInt(
///   byte* label ,
///   int* v ,
///   int step ,
///   int step_fast ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputInt(Pointer<Uint8> label, Pointer<Int32> v, int step, int step_fast, int flags) =>
  _igInputInt(label, v, step, step_fast, flags);

late final _igInputInt = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 step, Int32 step_fast, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int step, int step_fast, int flags)>('igInputInt');

///```c
/// byte inputInt2(
///   byte* label ,
///   int* v ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputInt2(Pointer<Uint8> label, Pointer<Int32> v, int flags) =>
  _igInputInt2(label, v, flags);

late final _igInputInt2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int flags)>('igInputInt2');

///```c
/// byte inputInt3(
///   byte* label ,
///   int* v ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputInt3(Pointer<Uint8> label, Pointer<Int32> v, int flags) =>
  _igInputInt3(label, v, flags);

late final _igInputInt3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int flags)>('igInputInt3');

///```c
/// byte inputInt4(
///   byte* label ,
///   int* v ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputInt4(Pointer<Uint8> label, Pointer<Int32> v, int flags) =>
  _igInputInt4(label, v, flags);

late final _igInputInt4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int flags)>('igInputInt4');

///```c
/// byte inputScalar(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   void* p_step ,
///   void* p_step_fast ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputScalar(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, int flags) =>
  _igInputScalar(label, data_type, p_data, p_step, p_step_fast, format, flags);

late final _igInputScalar = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, int flags)>('igInputScalar');

///```c
/// byte inputScalarN(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   int components ,
///   void* p_step ,
///   void* p_step_fast ,
///   byte* format ,
///   ImGuiInputTextFlags flags 
/// );
///```
int inputScalarN(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, int flags) =>
  _igInputScalarN(label, data_type, p_data, components, p_step, p_step_fast, format, flags);

late final _igInputScalarN = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Int32 components, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, Pointer<Void> p_step, Pointer<Void> p_step_fast, Pointer<Uint8> format, int flags)>('igInputScalarN');

///```c
/// byte inputText(
///   byte* label ,
///   byte* buf ,
///   uint buf_size ,
///   ImGuiInputTextFlags flags ,
///   ImGuiInputTextCallback callback ,
///   void* user_data 
/// );
///```
int inputText(Pointer<Uint8> label, Pointer<Uint8> buf, int buf_size, int flags, Pointer callback, Pointer<Void> user_data) =>
  _igInputText(label, buf, buf_size, flags, callback, user_data);

late final _igInputText = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> buf, Uint32 buf_size, Uint32 flags, Pointer callback, Pointer<Void> user_data),
  int Function(Pointer<Uint8> label, Pointer<Uint8> buf, int buf_size, int flags, Pointer callback, Pointer<Void> user_data)>('igInputText');

///```c
/// byte inputTextMultiline(
///   byte* label ,
///   byte* buf ,
///   uint buf_size ,
///   Vector2 size ,
///   ImGuiInputTextFlags flags ,
///   ImGuiInputTextCallback callback ,
///   void* user_data 
/// );
///```
int inputTextMultiline(Pointer<Uint8> label, Pointer<Uint8> buf, int buf_size, Vector2 size, int flags, Pointer callback, Pointer<Void> user_data) =>
  _igInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data);

late final _igInputTextMultiline = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> buf, Uint32 buf_size, Vector2 size, Uint32 flags, Pointer callback, Pointer<Void> user_data),
  int Function(Pointer<Uint8> label, Pointer<Uint8> buf, int buf_size, Vector2 size, int flags, Pointer callback, Pointer<Void> user_data)>('igInputTextMultiline');

///```c
/// byte inputTextWithHint(
///   byte* label ,
///   byte* hint ,
///   byte* buf ,
///   uint buf_size ,
///   ImGuiInputTextFlags flags ,
///   ImGuiInputTextCallback callback ,
///   void* user_data 
/// );
///```
int inputTextWithHint(Pointer<Uint8> label, Pointer<Uint8> hint, Pointer<Uint8> buf, int buf_size, int flags, Pointer callback, Pointer<Void> user_data) =>
  _igInputTextWithHint(label, hint, buf, buf_size, flags, callback, user_data);

late final _igInputTextWithHint = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> hint, Pointer<Uint8> buf, Uint32 buf_size, Uint32 flags, Pointer callback, Pointer<Void> user_data),
  int Function(Pointer<Uint8> label, Pointer<Uint8> hint, Pointer<Uint8> buf, int buf_size, int flags, Pointer callback, Pointer<Void> user_data)>('igInputTextWithHint');

///```c
/// byte invisibleButton(
///   byte* str_id ,
///   Vector2 size ,
///   ImGuiButtonFlags flags 
/// );
///```
int invisibleButton(Pointer<Uint8> str_id, Vector2 size, int flags) =>
  _igInvisibleButton(str_id, size, flags);

late final _igInvisibleButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Vector2 size, Uint32 flags),
  int Function(Pointer<Uint8> str_id, Vector2 size, int flags)>('igInvisibleButton');

///```c
/// byte isAnyItemActive(
/// );
///```
int isAnyItemActive() =>
  _igIsAnyItemActive();

late final _igIsAnyItemActive = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsAnyItemActive');

///```c
/// byte isAnyItemFocused(
/// );
///```
int isAnyItemFocused() =>
  _igIsAnyItemFocused();

late final _igIsAnyItemFocused = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsAnyItemFocused');

///```c
/// byte isAnyItemHovered(
/// );
///```
int isAnyItemHovered() =>
  _igIsAnyItemHovered();

late final _igIsAnyItemHovered = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsAnyItemHovered');

///```c
/// byte isAnyMouseDown(
/// );
///```
int isAnyMouseDown() =>
  _igIsAnyMouseDown();

late final _igIsAnyMouseDown = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsAnyMouseDown');

///```c
/// byte isItemActivated(
/// );
///```
int isItemActivated() =>
  _igIsItemActivated();

late final _igIsItemActivated = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemActivated');

///```c
/// byte isItemActive(
/// );
///```
int isItemActive() =>
  _igIsItemActive();

late final _igIsItemActive = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemActive');

///```c
/// byte isItemClicked(
///   ImGuiMouseButton mouse_button 
/// );
///```
int isItemClicked(int mouse_button) =>
  _igIsItemClicked(mouse_button);

late final _igIsItemClicked = _cimgui.lookupFunction<
  Uint8 Function(Uint32 mouse_button),
  int Function(int mouse_button)>('igIsItemClicked');

///```c
/// byte isItemDeactivated(
/// );
///```
int isItemDeactivated() =>
  _igIsItemDeactivated();

late final _igIsItemDeactivated = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemDeactivated');

///```c
/// byte isItemDeactivatedAfterEdit(
/// );
///```
int isItemDeactivatedAfterEdit() =>
  _igIsItemDeactivatedAfterEdit();

late final _igIsItemDeactivatedAfterEdit = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemDeactivatedAfterEdit');

///```c
/// byte isItemEdited(
/// );
///```
int isItemEdited() =>
  _igIsItemEdited();

late final _igIsItemEdited = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemEdited');

///```c
/// byte isItemFocused(
/// );
///```
int isItemFocused() =>
  _igIsItemFocused();

late final _igIsItemFocused = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemFocused');

///```c
/// byte isItemHovered(
///   ImGuiHoveredFlags flags 
/// );
///```
int isItemHovered(int flags) =>
  _igIsItemHovered(flags);

late final _igIsItemHovered = _cimgui.lookupFunction<
  Uint8 Function(Uint32 flags),
  int Function(int flags)>('igIsItemHovered');

///```c
/// byte isItemToggledOpen(
/// );
///```
int isItemToggledOpen() =>
  _igIsItemToggledOpen();

late final _igIsItemToggledOpen = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemToggledOpen');

///```c
/// byte isItemVisible(
/// );
///```
int isItemVisible() =>
  _igIsItemVisible();

late final _igIsItemVisible = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsItemVisible');

///```c
/// byte isKeyDown(
///   int user_key_index 
/// );
///```
int isKeyDown(int user_key_index) =>
  _igIsKeyDown(user_key_index);

late final _igIsKeyDown = _cimgui.lookupFunction<
  Uint8 Function(Int32 user_key_index),
  int Function(int user_key_index)>('igIsKeyDown');

///```c
/// byte isKeyPressed(
///   int user_key_index ,
///   byte repeat 
/// );
///```
int isKeyPressed(int user_key_index, int repeat) =>
  _igIsKeyPressed(user_key_index, repeat);

late final _igIsKeyPressed = _cimgui.lookupFunction<
  Uint8 Function(Int32 user_key_index, Uint8 repeat),
  int Function(int user_key_index, int repeat)>('igIsKeyPressed');

///```c
/// byte isKeyReleased(
///   int user_key_index 
/// );
///```
int isKeyReleased(int user_key_index) =>
  _igIsKeyReleased(user_key_index);

late final _igIsKeyReleased = _cimgui.lookupFunction<
  Uint8 Function(Int32 user_key_index),
  int Function(int user_key_index)>('igIsKeyReleased');

///```c
/// byte isMouseClicked(
///   ImGuiMouseButton button ,
///   byte repeat 
/// );
///```
int isMouseClicked(int button, int repeat) =>
  _igIsMouseClicked(button, repeat);

late final _igIsMouseClicked = _cimgui.lookupFunction<
  Uint8 Function(Uint32 button, Uint8 repeat),
  int Function(int button, int repeat)>('igIsMouseClicked');

///```c
/// byte isMouseDoubleClicked(
///   ImGuiMouseButton button 
/// );
///```
int isMouseDoubleClicked(int button) =>
  _igIsMouseDoubleClicked(button);

late final _igIsMouseDoubleClicked = _cimgui.lookupFunction<
  Uint8 Function(Uint32 button),
  int Function(int button)>('igIsMouseDoubleClicked');

///```c
/// byte isMouseDown(
///   ImGuiMouseButton button 
/// );
///```
int isMouseDown(int button) =>
  _igIsMouseDown(button);

late final _igIsMouseDown = _cimgui.lookupFunction<
  Uint8 Function(Uint32 button),
  int Function(int button)>('igIsMouseDown');

///```c
/// byte isMouseDragging(
///   ImGuiMouseButton button ,
///   float lock_threshold 
/// );
///```
int isMouseDragging(int button, double lock_threshold) =>
  _igIsMouseDragging(button, lock_threshold);

late final _igIsMouseDragging = _cimgui.lookupFunction<
  Uint8 Function(Uint32 button, Float lock_threshold),
  int Function(int button, double lock_threshold)>('igIsMouseDragging');

///```c
/// byte isMouseHoveringRect(
///   Vector2 r_min ,
///   Vector2 r_max ,
///   byte clip 
/// );
///```
int isMouseHoveringRect(Vector2 r_min, Vector2 r_max, int clip) =>
  _igIsMouseHoveringRect(r_min, r_max, clip);

late final _igIsMouseHoveringRect = _cimgui.lookupFunction<
  Uint8 Function(Vector2 r_min, Vector2 r_max, Uint8 clip),
  int Function(Vector2 r_min, Vector2 r_max, int clip)>('igIsMouseHoveringRect');

///```c
/// byte isMousePosValid(
///   Vector2* mouse_pos 
/// );
///```
int isMousePosValid(Pointer<Vector2> mouse_pos) =>
  _igIsMousePosValid(mouse_pos);

late final _igIsMousePosValid = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Vector2> mouse_pos),
  int Function(Pointer<Vector2> mouse_pos)>('igIsMousePosValid');

///```c
/// byte isMouseReleased(
///   ImGuiMouseButton button 
/// );
///```
int isMouseReleased(int button) =>
  _igIsMouseReleased(button);

late final _igIsMouseReleased = _cimgui.lookupFunction<
  Uint8 Function(Uint32 button),
  int Function(int button)>('igIsMouseReleased');

///```c
/// byte isPopupOpen(
///   byte* str_id ,
///   ImGuiPopupFlags flags 
/// );
///```
int isPopupOpen(Pointer<Uint8> str_id, int flags) =>
  _igIsPopupOpenStr(str_id, flags);

late final _igIsPopupOpenStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 flags),
  int Function(Pointer<Uint8> str_id, int flags)>('igIsPopupOpenStr');

///```c
/// byte isRectVisible(
///   Vector2 size 
/// );
///```
int isRectVisible(Vector2 size) =>
  _igIsRectVisibleNil(size);

late final _igIsRectVisibleNil = _cimgui.lookupFunction<
  Uint8 Function(Vector2 size),
  int Function(Vector2 size)>('igIsRectVisibleNil');

///```c
/// byte isRectVisible(
///   Vector2 rect_min ,
///   Vector2 rect_max 
/// );
///```
int isRectVisible(Vector2 rect_min, Vector2 rect_max) =>
  _igIsRectVisibleVec2(rect_min, rect_max);

late final _igIsRectVisibleVec2 = _cimgui.lookupFunction<
  Uint8 Function(Vector2 rect_min, Vector2 rect_max),
  int Function(Vector2 rect_min, Vector2 rect_max)>('igIsRectVisibleVec2');

///```c
/// byte isWindowAppearing(
/// );
///```
int isWindowAppearing() =>
  _igIsWindowAppearing();

late final _igIsWindowAppearing = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsWindowAppearing');

///```c
/// byte isWindowCollapsed(
/// );
///```
int isWindowCollapsed() =>
  _igIsWindowCollapsed();

late final _igIsWindowCollapsed = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsWindowCollapsed');

///```c
/// byte isWindowDocked(
/// );
///```
int isWindowDocked() =>
  _igIsWindowDocked();

late final _igIsWindowDocked = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igIsWindowDocked');

///```c
/// byte isWindowFocused(
///   ImGuiFocusedFlags flags 
/// );
///```
int isWindowFocused(int flags) =>
  _igIsWindowFocused(flags);

late final _igIsWindowFocused = _cimgui.lookupFunction<
  Uint8 Function(Uint32 flags),
  int Function(int flags)>('igIsWindowFocused');

///```c
/// byte isWindowHovered(
///   ImGuiHoveredFlags flags 
/// );
///```
int isWindowHovered(int flags) =>
  _igIsWindowHovered(flags);

late final _igIsWindowHovered = _cimgui.lookupFunction<
  Uint8 Function(Uint32 flags),
  int Function(int flags)>('igIsWindowHovered');

///```c
/// void labelText(
///   byte* label ,
///   byte* fmt ,
///   ... ... 
/// );
///```
void labelText(Pointer<Uint8> label, Pointer<Uint8> fmt) =>
  _igLabelText(label, fmt);

late final _igLabelText = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> label, Pointer<Uint8> fmt)>('igLabelText');

///```c
/// byte listBox(
///   byte* label ,
///   int* current_item ,
///   byte** items ,
///   int items_count ,
///   int height_in_items 
/// );
///```
int listBox(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, int items_count, int height_in_items) =>
  _igListBoxStr_arr(label, current_item, items, items_count, height_in_items);

late final _igListBoxStr_arr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, Int32 items_count, Int32 height_in_items),
  int Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer<Pointer<Uint8>> items, int items_count, int height_in_items)>('igListBoxStr_arr');

///```c
/// byte listBox(
///   byte* label ,
///   int* current_item ,
///   Pointer items_getter ,
///   void* data ,
///   int items_count ,
///   int height_in_items 
/// );
///```
int listBox(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, int items_count, int height_in_items) =>
  _igListBoxFnBoolPtr(label, current_item, items_getter, data, items_count, height_in_items);

late final _igListBoxFnBoolPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, Int32 items_count, Int32 height_in_items),
  int Function(Pointer<Uint8> label, Pointer<Int32> current_item, Pointer items_getter, Pointer<Void> data, int items_count, int height_in_items)>('igListBoxFnBoolPtr');

///```c
/// void loadIniSettingsFromDisk(
///   byte* ini_filename 
/// );
///```
void loadIniSettingsFromDisk(Pointer<Uint8> ini_filename) =>
  _igLoadIniSettingsFromDisk(ini_filename);

late final _igLoadIniSettingsFromDisk = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> ini_filename),
  void Function(Pointer<Uint8> ini_filename)>('igLoadIniSettingsFromDisk');

///```c
/// void loadIniSettingsFromMemory(
///   byte* ini_data ,
///   uint ini_size 
/// );
///```
void loadIniSettingsFromMemory(Pointer<Uint8> ini_data, int ini_size) =>
  _igLoadIniSettingsFromMemory(ini_data, ini_size);

late final _igLoadIniSettingsFromMemory = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> ini_data, Uint32 ini_size),
  void Function(Pointer<Uint8> ini_data, int ini_size)>('igLoadIniSettingsFromMemory');

///```c
/// void logButtons(
/// );
///```
void logButtons() =>
  _igLogButtons();

late final _igLogButtons = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igLogButtons');

///```c
/// void logFinish(
/// );
///```
void logFinish() =>
  _igLogFinish();

late final _igLogFinish = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igLogFinish');

///```c
/// void logText(
///   byte* fmt ,
///   ... ... 
/// );
///```
void logText(Pointer<Uint8> fmt) =>
  _igLogText(fmt);

late final _igLogText = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igLogText');

///```c
/// void logToClipboard(
///   int auto_open_depth 
/// );
///```
void logToClipboard(int auto_open_depth) =>
  _igLogToClipboard(auto_open_depth);

late final _igLogToClipboard = _cimgui.lookupFunction<
  Void Function(Int32 auto_open_depth),
  void Function(int auto_open_depth)>('igLogToClipboard');

///```c
/// void logToFile(
///   int auto_open_depth ,
///   byte* filename 
/// );
///```
void logToFile(int auto_open_depth, Pointer<Uint8> filename) =>
  _igLogToFile(auto_open_depth, filename);

late final _igLogToFile = _cimgui.lookupFunction<
  Void Function(Int32 auto_open_depth, Pointer<Uint8> filename),
  void Function(int auto_open_depth, Pointer<Uint8> filename)>('igLogToFile');

///```c
/// void logToTTY(
///   int auto_open_depth 
/// );
///```
void logToTTY(int auto_open_depth) =>
  _igLogToTTY(auto_open_depth);

late final _igLogToTTY = _cimgui.lookupFunction<
  Void Function(Int32 auto_open_depth),
  void Function(int auto_open_depth)>('igLogToTTY');

///```c
/// void* memAlloc(
///   uint size 
/// );
///```
Pointer<Void> memAlloc(int size) =>
  _igMemAlloc(size);

late final _igMemAlloc = _cimgui.lookupFunction<
  Pointer<Void> Function(Uint32 size),
  Pointer<Void> Function(int size)>('igMemAlloc');

///```c
/// void memFree(
///   void* ptr 
/// );
///```
void memFree(Pointer<Void> ptr) =>
  _igMemFree(ptr);

late final _igMemFree = _cimgui.lookupFunction<
  Void Function(Pointer<Void> ptr),
  void Function(Pointer<Void> ptr)>('igMemFree');

///```c
/// byte menuItem(
///   byte* label ,
///   byte* shortcut ,
///   byte selected ,
///   byte enabled 
/// );
///```
int menuItem(Pointer<Uint8> label, Pointer<Uint8> shortcut, int selected, int enabled) =>
  _igMenuItemBool(label, shortcut, selected, enabled);

late final _igMenuItemBool = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> shortcut, Uint8 selected, Uint8 enabled),
  int Function(Pointer<Uint8> label, Pointer<Uint8> shortcut, int selected, int enabled)>('igMenuItemBool');

///```c
/// byte menuItem(
///   byte* label ,
///   byte* shortcut ,
///   byte* p_selected ,
///   byte enabled 
/// );
///```
int menuItem(Pointer<Uint8> label, Pointer<Uint8> shortcut, Pointer<Uint8> p_selected, int enabled) =>
  _igMenuItemBoolPtr(label, shortcut, p_selected, enabled);

late final _igMenuItemBoolPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> shortcut, Pointer<Uint8> p_selected, Uint8 enabled),
  int Function(Pointer<Uint8> label, Pointer<Uint8> shortcut, Pointer<Uint8> p_selected, int enabled)>('igMenuItemBoolPtr');

///```c
/// void newFrame(
/// );
///```
void newFrame() =>
  _igNewFrame();

late final _igNewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igNewFrame');

///```c
/// void newLine(
/// );
///```
void newLine() =>
  _igNewLine();

late final _igNewLine = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igNewLine');

///```c
/// void nextColumn(
/// );
///```
void nextColumn() =>
  _igNextColumn();

late final _igNextColumn = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igNextColumn');

///```c
/// void openPopup(
///   byte* str_id ,
///   ImGuiPopupFlags popup_flags 
/// );
///```
void openPopup(Pointer<Uint8> str_id, int popup_flags) =>
  _igOpenPopup(str_id, popup_flags);

late final _igOpenPopup = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> str_id, Uint32 popup_flags),
  void Function(Pointer<Uint8> str_id, int popup_flags)>('igOpenPopup');

///```c
/// void openPopupOnItemClick(
///   byte* str_id ,
///   ImGuiPopupFlags popup_flags 
/// );
///```
void openPopupOnItemClick(Pointer<Uint8> str_id, int popup_flags) =>
  _igOpenPopupOnItemClick(str_id, popup_flags);

late final _igOpenPopupOnItemClick = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> str_id, Uint32 popup_flags),
  void Function(Pointer<Uint8> str_id, int popup_flags)>('igOpenPopupOnItemClick');

///```c
/// void plotHistogram(
///   byte* label ,
///   float* values ,
///   int values_count ,
///   int values_offset ,
///   byte* overlay_text ,
///   float scale_min ,
///   float scale_max ,
///   Vector2 graph_size ,
///   int stride 
/// );
///```
void plotHistogram(Pointer<Uint8> label, Pointer<Float> values, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size, int stride) =>
  _igPlotHistogramFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);

late final _igPlotHistogramFloatPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Pointer<Float> values, Int32 values_count, Int32 values_offset, Pointer<Uint8> overlay_text, Float scale_min, Float scale_max, Vector2 graph_size, Int32 stride),
  void Function(Pointer<Uint8> label, Pointer<Float> values, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size, int stride)>('igPlotHistogramFloatPtr');

///```c
/// void plotHistogram(
///   byte* label ,
///   Pointer values_getter ,
///   void* data ,
///   int values_count ,
///   int values_offset ,
///   byte* overlay_text ,
///   float scale_min ,
///   float scale_max ,
///   Vector2 graph_size 
/// );
///```
void plotHistogram(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size) =>
  _igPlotHistogramFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);

late final _igPlotHistogramFnFloatPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, Int32 values_count, Int32 values_offset, Pointer<Uint8> overlay_text, Float scale_min, Float scale_max, Vector2 graph_size),
  void Function(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size)>('igPlotHistogramFnFloatPtr');

///```c
/// void plotLines(
///   byte* label ,
///   float* values ,
///   int values_count ,
///   int values_offset ,
///   byte* overlay_text ,
///   float scale_min ,
///   float scale_max ,
///   Vector2 graph_size ,
///   int stride 
/// );
///```
void plotLines(Pointer<Uint8> label, Pointer<Float> values, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size, int stride) =>
  _igPlotLinesFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);

late final _igPlotLinesFloatPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Pointer<Float> values, Int32 values_count, Int32 values_offset, Pointer<Uint8> overlay_text, Float scale_min, Float scale_max, Vector2 graph_size, Int32 stride),
  void Function(Pointer<Uint8> label, Pointer<Float> values, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size, int stride)>('igPlotLinesFloatPtr');

///```c
/// void plotLines(
///   byte* label ,
///   Pointer values_getter ,
///   void* data ,
///   int values_count ,
///   int values_offset ,
///   byte* overlay_text ,
///   float scale_min ,
///   float scale_max ,
///   Vector2 graph_size 
/// );
///```
void plotLines(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size) =>
  _igPlotLinesFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);

late final _igPlotLinesFnFloatPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, Int32 values_count, Int32 values_offset, Pointer<Uint8> overlay_text, Float scale_min, Float scale_max, Vector2 graph_size),
  void Function(Pointer<Uint8> label, Pointer values_getter, Pointer<Void> data, int values_count, int values_offset, Pointer<Uint8> overlay_text, double scale_min, double scale_max, Vector2 graph_size)>('igPlotLinesFnFloatPtr');

///```c
/// void popAllowKeyboardFocus(
/// );
///```
void popAllowKeyboardFocus() =>
  _igPopAllowKeyboardFocus();

late final _igPopAllowKeyboardFocus = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopAllowKeyboardFocus');

///```c
/// void popButtonRepeat(
/// );
///```
void popButtonRepeat() =>
  _igPopButtonRepeat();

late final _igPopButtonRepeat = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopButtonRepeat');

///```c
/// void popClipRect(
/// );
///```
void popClipRect() =>
  _igPopClipRect();

late final _igPopClipRect = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopClipRect');

///```c
/// void popFont(
/// );
///```
void popFont() =>
  _igPopFont();

late final _igPopFont = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopFont');

///```c
/// void popID(
/// );
///```
void popID() =>
  _igPopID();

late final _igPopID = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopID');

///```c
/// void popItemWidth(
/// );
///```
void popItemWidth() =>
  _igPopItemWidth();

late final _igPopItemWidth = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopItemWidth');

///```c
/// void popStyleColor(
///   int count 
/// );
///```
void popStyleColor(int count) =>
  _igPopStyleColor(count);

late final _igPopStyleColor = _cimgui.lookupFunction<
  Void Function(Int32 count),
  void Function(int count)>('igPopStyleColor');

///```c
/// void popStyleVar(
///   int count 
/// );
///```
void popStyleVar(int count) =>
  _igPopStyleVar(count);

late final _igPopStyleVar = _cimgui.lookupFunction<
  Void Function(Int32 count),
  void Function(int count)>('igPopStyleVar');

///```c
/// void popTextWrapPos(
/// );
///```
void popTextWrapPos() =>
  _igPopTextWrapPos();

late final _igPopTextWrapPos = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igPopTextWrapPos');

///```c
/// void progressBar(
///   float fraction ,
///   Vector2 size_arg ,
///   byte* overlay 
/// );
///```
void progressBar(double fraction, Vector2 size_arg, Pointer<Uint8> overlay) =>
  _igProgressBar(fraction, size_arg, overlay);

late final _igProgressBar = _cimgui.lookupFunction<
  Void Function(Float fraction, Vector2 size_arg, Pointer<Uint8> overlay),
  void Function(double fraction, Vector2 size_arg, Pointer<Uint8> overlay)>('igProgressBar');

///```c
/// void pushAllowKeyboardFocus(
///   byte allow_keyboard_focus 
/// );
///```
void pushAllowKeyboardFocus(int allow_keyboard_focus) =>
  _igPushAllowKeyboardFocus(allow_keyboard_focus);

late final _igPushAllowKeyboardFocus = _cimgui.lookupFunction<
  Void Function(Uint8 allow_keyboard_focus),
  void Function(int allow_keyboard_focus)>('igPushAllowKeyboardFocus');

///```c
/// void pushButtonRepeat(
///   byte repeat 
/// );
///```
void pushButtonRepeat(int repeat) =>
  _igPushButtonRepeat(repeat);

late final _igPushButtonRepeat = _cimgui.lookupFunction<
  Void Function(Uint8 repeat),
  void Function(int repeat)>('igPushButtonRepeat');

///```c
/// void pushClipRect(
///   Vector2 clip_rect_min ,
///   Vector2 clip_rect_max ,
///   byte intersect_with_current_clip_rect 
/// );
///```
void pushClipRect(Vector2 clip_rect_min, Vector2 clip_rect_max, int intersect_with_current_clip_rect) =>
  _igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);

late final _igPushClipRect = _cimgui.lookupFunction<
  Void Function(Vector2 clip_rect_min, Vector2 clip_rect_max, Uint8 intersect_with_current_clip_rect),
  void Function(Vector2 clip_rect_min, Vector2 clip_rect_max, int intersect_with_current_clip_rect)>('igPushClipRect');

///```c
/// void pushFont(
///   ImFont* font 
/// );
///```
void pushFont(Pointer<ImFont> font) =>
  _igPushFont(font);

late final _igPushFont = _cimgui.lookupFunction<
  Void Function(Pointer<ImFont> font),
  void Function(Pointer<ImFont> font)>('igPushFont');

///```c
/// void pushID(
///   byte* str_id 
/// );
///```
void pushID(Pointer<Uint8> str_id) =>
  _igPushIDStr(str_id);

late final _igPushIDStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> str_id),
  void Function(Pointer<Uint8> str_id)>('igPushIDStr');

///```c
/// void pushID(
///   byte* str_id_begin ,
///   byte* str_id_end 
/// );
///```
void pushID(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end) =>
  _igPushIDStrStr(str_id_begin, str_id_end);

late final _igPushIDStrStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end),
  void Function(Pointer<Uint8> str_id_begin, Pointer<Uint8> str_id_end)>('igPushIDStrStr');

///```c
/// void pushID(
///   void* ptr_id 
/// );
///```
void pushID(Pointer<Void> ptr_id) =>
  _igPushIDPtr(ptr_id);

late final _igPushIDPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Void> ptr_id),
  void Function(Pointer<Void> ptr_id)>('igPushIDPtr');

///```c
/// void pushID(
///   int int_id 
/// );
///```
void pushID(int int_id) =>
  _igPushIDInt(int_id);

late final _igPushIDInt = _cimgui.lookupFunction<
  Void Function(Int32 int_id),
  void Function(int int_id)>('igPushIDInt');

///```c
/// void pushItemWidth(
///   float item_width 
/// );
///```
void pushItemWidth(double item_width) =>
  _igPushItemWidth(item_width);

late final _igPushItemWidth = _cimgui.lookupFunction<
  Void Function(Float item_width),
  void Function(double item_width)>('igPushItemWidth');

///```c
/// void pushStyleColor(
///   ImGuiCol idx ,
///   uint col 
/// );
///```
void pushStyleColor(int idx, int col) =>
  _igPushStyleColorU32(idx, col);

late final _igPushStyleColorU32 = _cimgui.lookupFunction<
  Void Function(Uint32 idx, Uint32 col),
  void Function(int idx, int col)>('igPushStyleColorU32');

///```c
/// void pushStyleColor(
///   ImGuiCol idx ,
///   Vector4 col 
/// );
///```
void pushStyleColor(int idx, Vector4 col) =>
  _igPushStyleColorVec4(idx, col);

late final _igPushStyleColorVec4 = _cimgui.lookupFunction<
  Void Function(Uint32 idx, Vector4 col),
  void Function(int idx, Vector4 col)>('igPushStyleColorVec4');

///```c
/// void pushStyleVar(
///   ImGuiStyleVar idx ,
///   float val 
/// );
///```
void pushStyleVar(int idx, double val) =>
  _igPushStyleVarFloat(idx, val);

late final _igPushStyleVarFloat = _cimgui.lookupFunction<
  Void Function(Uint32 idx, Float val),
  void Function(int idx, double val)>('igPushStyleVarFloat');

///```c
/// void pushStyleVar(
///   ImGuiStyleVar idx ,
///   Vector2 val 
/// );
///```
void pushStyleVar(int idx, Vector2 val) =>
  _igPushStyleVarVec2(idx, val);

late final _igPushStyleVarVec2 = _cimgui.lookupFunction<
  Void Function(Uint32 idx, Vector2 val),
  void Function(int idx, Vector2 val)>('igPushStyleVarVec2');

///```c
/// void pushTextWrapPos(
///   float wrap_local_pos_x 
/// );
///```
void pushTextWrapPos(double wrap_local_pos_x) =>
  _igPushTextWrapPos(wrap_local_pos_x);

late final _igPushTextWrapPos = _cimgui.lookupFunction<
  Void Function(Float wrap_local_pos_x),
  void Function(double wrap_local_pos_x)>('igPushTextWrapPos');

///```c
/// byte radioButton(
///   byte* label ,
///   byte active 
/// );
///```
int radioButton(Pointer<Uint8> label, int active) =>
  _igRadioButtonBool(label, active);

late final _igRadioButtonBool = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint8 active),
  int Function(Pointer<Uint8> label, int active)>('igRadioButtonBool');

///```c
/// byte radioButton(
///   byte* label ,
///   int* v ,
///   int v_button 
/// );
///```
int radioButton(Pointer<Uint8> label, Pointer<Int32> v, int v_button) =>
  _igRadioButtonIntPtr(label, v, v_button);

late final _igRadioButtonIntPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 v_button),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int v_button)>('igRadioButtonIntPtr');

///```c
/// void render(
/// );
///```
void render() =>
  _igRender();

late final _igRender = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igRender');

///```c
/// void renderPlatformWindowsDefault(
///   void* platform_render_arg ,
///   void* renderer_render_arg 
/// );
///```
void renderPlatformWindowsDefault(Pointer<Void> platform_render_arg, Pointer<Void> renderer_render_arg) =>
  _igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg);

late final _igRenderPlatformWindowsDefault = _cimgui.lookupFunction<
  Void Function(Pointer<Void> platform_render_arg, Pointer<Void> renderer_render_arg),
  void Function(Pointer<Void> platform_render_arg, Pointer<Void> renderer_render_arg)>('igRenderPlatformWindowsDefault');

///```c
/// void resetMouseDragDelta(
///   ImGuiMouseButton button 
/// );
///```
void resetMouseDragDelta(int button) =>
  _igResetMouseDragDelta(button);

late final _igResetMouseDragDelta = _cimgui.lookupFunction<
  Void Function(Uint32 button),
  void Function(int button)>('igResetMouseDragDelta');

///```c
/// void sameLine(
///   float offset_from_start_x ,
///   float spacing 
/// );
///```
void sameLine(double offset_from_start_x, double spacing) =>
  _igSameLine(offset_from_start_x, spacing);

late final _igSameLine = _cimgui.lookupFunction<
  Void Function(Float offset_from_start_x, Float spacing),
  void Function(double offset_from_start_x, double spacing)>('igSameLine');

///```c
/// void saveIniSettingsToDisk(
///   byte* ini_filename 
/// );
///```
void saveIniSettingsToDisk(Pointer<Uint8> ini_filename) =>
  _igSaveIniSettingsToDisk(ini_filename);

late final _igSaveIniSettingsToDisk = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> ini_filename),
  void Function(Pointer<Uint8> ini_filename)>('igSaveIniSettingsToDisk');

///```c
/// byte* saveIniSettingsToMemory(
///   uint* out_ini_size 
/// );
///```
Pointer<Uint8> saveIniSettingsToMemory(Pointer<Uint32> out_ini_size) =>
  _igSaveIniSettingsToMemory(out_ini_size);

late final _igSaveIniSettingsToMemory = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Pointer<Uint32> out_ini_size),
  Pointer<Uint8> Function(Pointer<Uint32> out_ini_size)>('igSaveIniSettingsToMemory');

///```c
/// byte selectable(
///   byte* label ,
///   byte selected ,
///   ImGuiSelectableFlags flags ,
///   Vector2 size 
/// );
///```
int selectable(Pointer<Uint8> label, int selected, int flags, Vector2 size) =>
  _igSelectableBool(label, selected, flags, size);

late final _igSelectableBool = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint8 selected, Uint32 flags, Vector2 size),
  int Function(Pointer<Uint8> label, int selected, int flags, Vector2 size)>('igSelectableBool');

///```c
/// byte selectable(
///   byte* label ,
///   byte* p_selected ,
///   ImGuiSelectableFlags flags ,
///   Vector2 size 
/// );
///```
int selectable(Pointer<Uint8> label, Pointer<Uint8> p_selected, int flags, Vector2 size) =>
  _igSelectableBoolPtr(label, p_selected, flags, size);

late final _igSelectableBoolPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Uint8> p_selected, Uint32 flags, Vector2 size),
  int Function(Pointer<Uint8> label, Pointer<Uint8> p_selected, int flags, Vector2 size)>('igSelectableBoolPtr');

///```c
/// void separator(
/// );
///```
void separator() =>
  _igSeparator();

late final _igSeparator = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSeparator');

///```c
/// void setAllocatorFunctions(
///   IntPtr alloc_func ,
///   IntPtr free_func ,
///   void* user_data 
/// );
///```
void setAllocatorFunctions(int alloc_func, int free_func, Pointer<Void> user_data) =>
  _igSetAllocatorFunctions(alloc_func, free_func, user_data);

late final _igSetAllocatorFunctions = _cimgui.lookupFunction<
  Void Function(IntPtr alloc_func, IntPtr free_func, Pointer<Void> user_data),
  void Function(int alloc_func, int free_func, Pointer<Void> user_data)>('igSetAllocatorFunctions');

///```c
/// void setClipboardText(
///   byte* text 
/// );
///```
void setClipboardText(Pointer<Uint8> text) =>
  _igSetClipboardText(text);

late final _igSetClipboardText = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> text),
  void Function(Pointer<Uint8> text)>('igSetClipboardText');

///```c
/// void setColorEditOptions(
///   ImGuiColorEditFlags flags 
/// );
///```
void setColorEditOptions(int flags) =>
  _igSetColorEditOptions(flags);

late final _igSetColorEditOptions = _cimgui.lookupFunction<
  Void Function(Uint32 flags),
  void Function(int flags)>('igSetColorEditOptions');

///```c
/// void setColumnOffset(
///   int column_index ,
///   float offset_x 
/// );
///```
void setColumnOffset(int column_index, double offset_x) =>
  _igSetColumnOffset(column_index, offset_x);

late final _igSetColumnOffset = _cimgui.lookupFunction<
  Void Function(Int32 column_index, Float offset_x),
  void Function(int column_index, double offset_x)>('igSetColumnOffset');

///```c
/// void setColumnWidth(
///   int column_index ,
///   float width 
/// );
///```
void setColumnWidth(int column_index, double width) =>
  _igSetColumnWidth(column_index, width);

late final _igSetColumnWidth = _cimgui.lookupFunction<
  Void Function(Int32 column_index, Float width),
  void Function(int column_index, double width)>('igSetColumnWidth');

///```c
/// void setCurrentContext(
///   IntPtr ctx 
/// );
///```
void setCurrentContext(int ctx) =>
  _igSetCurrentContext(ctx);

late final _igSetCurrentContext = _cimgui.lookupFunction<
  Void Function(IntPtr ctx),
  void Function(int ctx)>('igSetCurrentContext');

///```c
/// void setCursorPos(
///   Vector2 local_pos 
/// );
///```
void setCursorPos(Vector2 local_pos) =>
  _igSetCursorPos(local_pos);

late final _igSetCursorPos = _cimgui.lookupFunction<
  Void Function(Vector2 local_pos),
  void Function(Vector2 local_pos)>('igSetCursorPos');

///```c
/// void setCursorPosX(
///   float local_x 
/// );
///```
void setCursorPosX(double local_x) =>
  _igSetCursorPosX(local_x);

late final _igSetCursorPosX = _cimgui.lookupFunction<
  Void Function(Float local_x),
  void Function(double local_x)>('igSetCursorPosX');

///```c
/// void setCursorPosY(
///   float local_y 
/// );
///```
void setCursorPosY(double local_y) =>
  _igSetCursorPosY(local_y);

late final _igSetCursorPosY = _cimgui.lookupFunction<
  Void Function(Float local_y),
  void Function(double local_y)>('igSetCursorPosY');

///```c
/// void setCursorScreenPos(
///   Vector2 pos 
/// );
///```
void setCursorScreenPos(Vector2 pos) =>
  _igSetCursorScreenPos(pos);

late final _igSetCursorScreenPos = _cimgui.lookupFunction<
  Void Function(Vector2 pos),
  void Function(Vector2 pos)>('igSetCursorScreenPos');

///```c
/// byte setDragDropPayload(
///   byte* type ,
///   void* data ,
///   uint sz ,
///   ImGuiCond cond 
/// );
///```
int setDragDropPayload(Pointer<Uint8> type, Pointer<Void> data, int sz, int cond) =>
  _igSetDragDropPayload(type, data, sz, cond);

late final _igSetDragDropPayload = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> type, Pointer<Void> data, Uint32 sz, Uint32 cond),
  int Function(Pointer<Uint8> type, Pointer<Void> data, int sz, int cond)>('igSetDragDropPayload');

///```c
/// void setItemAllowOverlap(
/// );
///```
void setItemAllowOverlap() =>
  _igSetItemAllowOverlap();

late final _igSetItemAllowOverlap = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSetItemAllowOverlap');

///```c
/// void setItemDefaultFocus(
/// );
///```
void setItemDefaultFocus() =>
  _igSetItemDefaultFocus();

late final _igSetItemDefaultFocus = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSetItemDefaultFocus');

///```c
/// void setKeyboardFocusHere(
///   int offset 
/// );
///```
void setKeyboardFocusHere(int offset) =>
  _igSetKeyboardFocusHere(offset);

late final _igSetKeyboardFocusHere = _cimgui.lookupFunction<
  Void Function(Int32 offset),
  void Function(int offset)>('igSetKeyboardFocusHere');

///```c
/// void setMouseCursor(
///   ImGuiMouseCursor cursor_type 
/// );
///```
void setMouseCursor(int cursor_type) =>
  _igSetMouseCursor(cursor_type);

late final _igSetMouseCursor = _cimgui.lookupFunction<
  Void Function(Uint32 cursor_type),
  void Function(int cursor_type)>('igSetMouseCursor');

///```c
/// void setNextItemOpen(
///   byte is_open ,
///   ImGuiCond cond 
/// );
///```
void setNextItemOpen(int is_open, int cond) =>
  _igSetNextItemOpen(is_open, cond);

late final _igSetNextItemOpen = _cimgui.lookupFunction<
  Void Function(Uint8 is_open, Uint32 cond),
  void Function(int is_open, int cond)>('igSetNextItemOpen');

///```c
/// void setNextItemWidth(
///   float item_width 
/// );
///```
void setNextItemWidth(double item_width) =>
  _igSetNextItemWidth(item_width);

late final _igSetNextItemWidth = _cimgui.lookupFunction<
  Void Function(Float item_width),
  void Function(double item_width)>('igSetNextItemWidth');

///```c
/// void setNextWindowBgAlpha(
///   float alpha 
/// );
///```
void setNextWindowBgAlpha(double alpha) =>
  _igSetNextWindowBgAlpha(alpha);

late final _igSetNextWindowBgAlpha = _cimgui.lookupFunction<
  Void Function(Float alpha),
  void Function(double alpha)>('igSetNextWindowBgAlpha');

///```c
/// void setNextWindowClass(
///   ImGuiWindowClass* window_class 
/// );
///```
void setNextWindowClass(Pointer<ImGuiWindowClass> window_class) =>
  _igSetNextWindowClass(window_class);

late final _igSetNextWindowClass = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiWindowClass> window_class),
  void Function(Pointer<ImGuiWindowClass> window_class)>('igSetNextWindowClass');

///```c
/// void setNextWindowCollapsed(
///   byte collapsed ,
///   ImGuiCond cond 
/// );
///```
void setNextWindowCollapsed(int collapsed, int cond) =>
  _igSetNextWindowCollapsed(collapsed, cond);

late final _igSetNextWindowCollapsed = _cimgui.lookupFunction<
  Void Function(Uint8 collapsed, Uint32 cond),
  void Function(int collapsed, int cond)>('igSetNextWindowCollapsed');

///```c
/// void setNextWindowContentSize(
///   Vector2 size 
/// );
///```
void setNextWindowContentSize(Vector2 size) =>
  _igSetNextWindowContentSize(size);

late final _igSetNextWindowContentSize = _cimgui.lookupFunction<
  Void Function(Vector2 size),
  void Function(Vector2 size)>('igSetNextWindowContentSize');

///```c
/// void setNextWindowDockID(
///   uint dock_id ,
///   ImGuiCond cond 
/// );
///```
void setNextWindowDockID(int dock_id, int cond) =>
  _igSetNextWindowDockID(dock_id, cond);

late final _igSetNextWindowDockID = _cimgui.lookupFunction<
  Void Function(Uint32 dock_id, Uint32 cond),
  void Function(int dock_id, int cond)>('igSetNextWindowDockID');

///```c
/// void setNextWindowFocus(
/// );
///```
void setNextWindowFocus() =>
  _igSetNextWindowFocus();

late final _igSetNextWindowFocus = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSetNextWindowFocus');

///```c
/// void setNextWindowPos(
///   Vector2 pos ,
///   ImGuiCond cond ,
///   Vector2 pivot 
/// );
///```
void setNextWindowPos(Vector2 pos, int cond, Vector2 pivot) =>
  _igSetNextWindowPos(pos, cond, pivot);

late final _igSetNextWindowPos = _cimgui.lookupFunction<
  Void Function(Vector2 pos, Uint32 cond, Vector2 pivot),
  void Function(Vector2 pos, int cond, Vector2 pivot)>('igSetNextWindowPos');

///```c
/// void setNextWindowSize(
///   Vector2 size ,
///   ImGuiCond cond 
/// );
///```
void setNextWindowSize(Vector2 size, int cond) =>
  _igSetNextWindowSize(size, cond);

late final _igSetNextWindowSize = _cimgui.lookupFunction<
  Void Function(Vector2 size, Uint32 cond),
  void Function(Vector2 size, int cond)>('igSetNextWindowSize');

///```c
/// void setNextWindowSizeConstraints(
///   Vector2 size_min ,
///   Vector2 size_max ,
///   ImGuiSizeCallback custom_callback ,
///   void* custom_callback_data 
/// );
///```
void setNextWindowSizeConstraints(Vector2 size_min, Vector2 size_max, Pointer custom_callback, Pointer<Void> custom_callback_data) =>
  _igSetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data);

late final _igSetNextWindowSizeConstraints = _cimgui.lookupFunction<
  Void Function(Vector2 size_min, Vector2 size_max, Pointer custom_callback, Pointer<Void> custom_callback_data),
  void Function(Vector2 size_min, Vector2 size_max, Pointer custom_callback, Pointer<Void> custom_callback_data)>('igSetNextWindowSizeConstraints');

///```c
/// void setNextWindowViewport(
///   uint viewport_id 
/// );
///```
void setNextWindowViewport(int viewport_id) =>
  _igSetNextWindowViewport(viewport_id);

late final _igSetNextWindowViewport = _cimgui.lookupFunction<
  Void Function(Uint32 viewport_id),
  void Function(int viewport_id)>('igSetNextWindowViewport');

///```c
/// void setScrollFromPosX(
///   float local_x ,
///   float center_x_ratio 
/// );
///```
void setScrollFromPosX(double local_x, double center_x_ratio) =>
  _igSetScrollFromPosXFloat(local_x, center_x_ratio);

late final _igSetScrollFromPosXFloat = _cimgui.lookupFunction<
  Void Function(Float local_x, Float center_x_ratio),
  void Function(double local_x, double center_x_ratio)>('igSetScrollFromPosXFloat');

///```c
/// void setScrollFromPosY(
///   float local_y ,
///   float center_y_ratio 
/// );
///```
void setScrollFromPosY(double local_y, double center_y_ratio) =>
  _igSetScrollFromPosYFloat(local_y, center_y_ratio);

late final _igSetScrollFromPosYFloat = _cimgui.lookupFunction<
  Void Function(Float local_y, Float center_y_ratio),
  void Function(double local_y, double center_y_ratio)>('igSetScrollFromPosYFloat');

///```c
/// void setScrollHereX(
///   float center_x_ratio 
/// );
///```
void setScrollHereX(double center_x_ratio) =>
  _igSetScrollHereX(center_x_ratio);

late final _igSetScrollHereX = _cimgui.lookupFunction<
  Void Function(Float center_x_ratio),
  void Function(double center_x_ratio)>('igSetScrollHereX');

///```c
/// void setScrollHereY(
///   float center_y_ratio 
/// );
///```
void setScrollHereY(double center_y_ratio) =>
  _igSetScrollHereY(center_y_ratio);

late final _igSetScrollHereY = _cimgui.lookupFunction<
  Void Function(Float center_y_ratio),
  void Function(double center_y_ratio)>('igSetScrollHereY');

///```c
/// void setScrollX(
///   float scroll_x 
/// );
///```
void setScrollX(double scroll_x) =>
  _igSetScrollXFloat(scroll_x);

late final _igSetScrollXFloat = _cimgui.lookupFunction<
  Void Function(Float scroll_x),
  void Function(double scroll_x)>('igSetScrollXFloat');

///```c
/// void setScrollY(
///   float scroll_y 
/// );
///```
void setScrollY(double scroll_y) =>
  _igSetScrollYFloat(scroll_y);

late final _igSetScrollYFloat = _cimgui.lookupFunction<
  Void Function(Float scroll_y),
  void Function(double scroll_y)>('igSetScrollYFloat');

///```c
/// void setStateStorage(
///   ImGuiStorage* storage 
/// );
///```
void setStateStorage(Pointer<ImGuiStorage> storage) =>
  _igSetStateStorage(storage);

late final _igSetStateStorage = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStorage> storage),
  void Function(Pointer<ImGuiStorage> storage)>('igSetStateStorage');

///```c
/// void setTabItemClosed(
///   byte* tab_or_docked_window_label 
/// );
///```
void setTabItemClosed(Pointer<Uint8> tab_or_docked_window_label) =>
  _igSetTabItemClosed(tab_or_docked_window_label);

late final _igSetTabItemClosed = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> tab_or_docked_window_label),
  void Function(Pointer<Uint8> tab_or_docked_window_label)>('igSetTabItemClosed');

///```c
/// void setTooltip(
///   byte* fmt ,
///   ... ... 
/// );
///```
void setTooltip(Pointer<Uint8> fmt) =>
  _igSetTooltip(fmt);

late final _igSetTooltip = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igSetTooltip');

///```c
/// void setWindowCollapsed(
///   byte collapsed ,
///   ImGuiCond cond 
/// );
///```
void setWindowCollapsed(int collapsed, int cond) =>
  _igSetWindowCollapsedBool(collapsed, cond);

late final _igSetWindowCollapsedBool = _cimgui.lookupFunction<
  Void Function(Uint8 collapsed, Uint32 cond),
  void Function(int collapsed, int cond)>('igSetWindowCollapsedBool');

///```c
/// void setWindowCollapsed(
///   byte* name ,
///   byte collapsed ,
///   ImGuiCond cond 
/// );
///```
void setWindowCollapsed(Pointer<Uint8> name, int collapsed, int cond) =>
  _igSetWindowCollapsedStr(name, collapsed, cond);

late final _igSetWindowCollapsedStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> name, Uint8 collapsed, Uint32 cond),
  void Function(Pointer<Uint8> name, int collapsed, int cond)>('igSetWindowCollapsedStr');

///```c
/// void setWindowFocus(
/// );
///```
void setWindowFocus() =>
  _igSetWindowFocusNil();

late final _igSetWindowFocusNil = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSetWindowFocusNil');

///```c
/// void setWindowFocus(
///   byte* name 
/// );
///```
void setWindowFocus(Pointer<Uint8> name) =>
  _igSetWindowFocusStr(name);

late final _igSetWindowFocusStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> name),
  void Function(Pointer<Uint8> name)>('igSetWindowFocusStr');

///```c
/// void setWindowFontScale(
///   float scale 
/// );
///```
void setWindowFontScale(double scale) =>
  _igSetWindowFontScale(scale);

late final _igSetWindowFontScale = _cimgui.lookupFunction<
  Void Function(Float scale),
  void Function(double scale)>('igSetWindowFontScale');

///```c
/// void setWindowPos(
///   Vector2 pos ,
///   ImGuiCond cond 
/// );
///```
void setWindowPos(Vector2 pos, int cond) =>
  _igSetWindowPosVec2(pos, cond);

late final _igSetWindowPosVec2 = _cimgui.lookupFunction<
  Void Function(Vector2 pos, Uint32 cond),
  void Function(Vector2 pos, int cond)>('igSetWindowPosVec2');

///```c
/// void setWindowPos(
///   byte* name ,
///   Vector2 pos ,
///   ImGuiCond cond 
/// );
///```
void setWindowPos(Pointer<Uint8> name, Vector2 pos, int cond) =>
  _igSetWindowPosStr(name, pos, cond);

late final _igSetWindowPosStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> name, Vector2 pos, Uint32 cond),
  void Function(Pointer<Uint8> name, Vector2 pos, int cond)>('igSetWindowPosStr');

///```c
/// void setWindowSize(
///   Vector2 size ,
///   ImGuiCond cond 
/// );
///```
void setWindowSize(Vector2 size, int cond) =>
  _igSetWindowSizeVec2(size, cond);

late final _igSetWindowSizeVec2 = _cimgui.lookupFunction<
  Void Function(Vector2 size, Uint32 cond),
  void Function(Vector2 size, int cond)>('igSetWindowSizeVec2');

///```c
/// void setWindowSize(
///   byte* name ,
///   Vector2 size ,
///   ImGuiCond cond 
/// );
///```
void setWindowSize(Pointer<Uint8> name, Vector2 size, int cond) =>
  _igSetWindowSizeStr(name, size, cond);

late final _igSetWindowSizeStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> name, Vector2 size, Uint32 cond),
  void Function(Pointer<Uint8> name, Vector2 size, int cond)>('igSetWindowSizeStr');

///```c
/// void showAboutWindow(
///   byte* p_open 
/// );
///```
void showAboutWindow(Pointer<Uint8> p_open) =>
  _igShowAboutWindow(p_open);

late final _igShowAboutWindow = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> p_open),
  void Function(Pointer<Uint8> p_open)>('igShowAboutWindow');

///```c
/// void showDemoWindow(
///   byte* p_open 
/// );
///```
void showDemoWindow(Pointer<Uint8> p_open) =>
  _igShowDemoWindow(p_open);

late final _igShowDemoWindow = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> p_open),
  void Function(Pointer<Uint8> p_open)>('igShowDemoWindow');

///```c
/// void showFontSelector(
///   byte* label 
/// );
///```
void showFontSelector(Pointer<Uint8> label) =>
  _igShowFontSelector(label);

late final _igShowFontSelector = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label),
  void Function(Pointer<Uint8> label)>('igShowFontSelector');

///```c
/// void showMetricsWindow(
///   byte* p_open 
/// );
///```
void showMetricsWindow(Pointer<Uint8> p_open) =>
  _igShowMetricsWindow(p_open);

late final _igShowMetricsWindow = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> p_open),
  void Function(Pointer<Uint8> p_open)>('igShowMetricsWindow');

///```c
/// void showStyleEditor(
///   ImGuiStyle* _ref 
/// );
///```
void showStyleEditor(Pointer<ImGuiStyle> _ref) =>
  _igShowStyleEditor(_ref);

late final _igShowStyleEditor = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> _ref),
  void Function(Pointer<ImGuiStyle> _ref)>('igShowStyleEditor');

///```c
/// byte showStyleSelector(
///   byte* label 
/// );
///```
int showStyleSelector(Pointer<Uint8> label) =>
  _igShowStyleSelector(label);

late final _igShowStyleSelector = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label),
  int Function(Pointer<Uint8> label)>('igShowStyleSelector');

///```c
/// void showUserGuide(
/// );
///```
void showUserGuide() =>
  _igShowUserGuide();

late final _igShowUserGuide = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igShowUserGuide');

///```c
/// byte sliderAngle(
///   byte* label ,
///   float* v_rad ,
///   float v_degrees_min ,
///   float v_degrees_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderAngle(Pointer<Uint8> label, Pointer<Float> v_rad, double v_degrees_min, double v_degrees_max, Pointer<Uint8> format, int flags) =>
  _igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags);

late final _igSliderAngle = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Float> v_rad, Float v_degrees_min, Float v_degrees_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Float> v_rad, double v_degrees_min, double v_degrees_max, Pointer<Uint8> format, int flags)>('igSliderAngle');

///```c
/// byte sliderFloat(
///   byte* label ,
///   float* v ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderFloat(Pointer<Uint8> label, Pointer<Float> v, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igSliderFloat(label, v, v_min, v_max, format, flags);

late final _igSliderFloat = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Float> v, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Float> v, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igSliderFloat');

///```c
/// byte sliderFloat2(
///   byte* label ,
///   Vector2* v ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderFloat2(Pointer<Uint8> label, Pointer<Vector2> v, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igSliderFloat2(label, v, v_min, v_max, format, flags);

late final _igSliderFloat2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector2> v, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector2> v, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igSliderFloat2');

///```c
/// byte sliderFloat3(
///   byte* label ,
///   Vector3* v ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderFloat3(Pointer<Uint8> label, Pointer<Vector3> v, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igSliderFloat3(label, v, v_min, v_max, format, flags);

late final _igSliderFloat3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector3> v, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector3> v, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igSliderFloat3');

///```c
/// byte sliderFloat4(
///   byte* label ,
///   Vector4* v ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderFloat4(Pointer<Uint8> label, Pointer<Vector4> v, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igSliderFloat4(label, v, v_min, v_max, format, flags);

late final _igSliderFloat4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Vector4> v, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Vector4> v, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igSliderFloat4');

///```c
/// byte sliderInt(
///   byte* label ,
///   int* v ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderInt(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igSliderInt(label, v, v_min, v_max, format, flags);

late final _igSliderInt = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igSliderInt');

///```c
/// byte sliderInt2(
///   byte* label ,
///   int* v ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderInt2(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igSliderInt2(label, v, v_min, v_max, format, flags);

late final _igSliderInt2 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igSliderInt2');

///```c
/// byte sliderInt3(
///   byte* label ,
///   int* v ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderInt3(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igSliderInt3(label, v, v_min, v_max, format, flags);

late final _igSliderInt3 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igSliderInt3');

///```c
/// byte sliderInt4(
///   byte* label ,
///   int* v ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderInt4(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igSliderInt4(label, v, v_min, v_max, format, flags);

late final _igSliderInt4 = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Pointer<Int32> v, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igSliderInt4');

///```c
/// byte sliderScalar(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   void* p_min ,
///   void* p_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderScalar(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags) =>
  _igSliderScalar(label, data_type, p_data, p_min, p_max, format, flags);

late final _igSliderScalar = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags)>('igSliderScalar');

///```c
/// byte sliderScalarN(
///   byte* label ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   int components ,
///   void* p_min ,
///   void* p_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int sliderScalarN(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags) =>
  _igSliderScalarN(label, data_type, p_data, components, p_min, p_max, format, flags);

late final _igSliderScalarN = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 data_type, Pointer<Void> p_data, Int32 components, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, int data_type, Pointer<Void> p_data, int components, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags)>('igSliderScalarN');

///```c
/// byte smallButton(
///   byte* label 
/// );
///```
int smallButton(Pointer<Uint8> label) =>
  _igSmallButton(label);

late final _igSmallButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label),
  int Function(Pointer<Uint8> label)>('igSmallButton');

///```c
/// void spacing(
/// );
///```
void spacing() =>
  _igSpacing();

late final _igSpacing = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igSpacing');

///```c
/// void styleColorsClassic(
///   ImGuiStyle* dst 
/// );
///```
void styleColorsClassic(Pointer<ImGuiStyle> dst) =>
  _igStyleColorsClassic(dst);

late final _igStyleColorsClassic = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> dst),
  void Function(Pointer<ImGuiStyle> dst)>('igStyleColorsClassic');

///```c
/// void styleColorsDark(
///   ImGuiStyle* dst 
/// );
///```
void styleColorsDark(Pointer<ImGuiStyle> dst) =>
  _igStyleColorsDark(dst);

late final _igStyleColorsDark = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> dst),
  void Function(Pointer<ImGuiStyle> dst)>('igStyleColorsDark');

///```c
/// void styleColorsLight(
///   ImGuiStyle* dst 
/// );
///```
void styleColorsLight(Pointer<ImGuiStyle> dst) =>
  _igStyleColorsLight(dst);

late final _igStyleColorsLight = _cimgui.lookupFunction<
  Void Function(Pointer<ImGuiStyle> dst),
  void Function(Pointer<ImGuiStyle> dst)>('igStyleColorsLight');

///```c
/// byte tabItemButton(
///   byte* label ,
///   ImGuiTabItemFlags flags 
/// );
///```
int tabItemButton(Pointer<Uint8> label, int flags) =>
  _igTabItemButton(label, flags);

late final _igTabItemButton = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 flags),
  int Function(Pointer<Uint8> label, int flags)>('igTabItemButton');

///```c
/// int tableGetColumnCount(
/// );
///```
int tableGetColumnCount() =>
  _igTableGetColumnCount();

late final _igTableGetColumnCount = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igTableGetColumnCount');

///```c
/// ImGuiTableColumnFlags tableGetColumnFlags(
///   int column_n 
/// );
///```
int tableGetColumnFlags(int column_n) =>
  _igTableGetColumnFlags(column_n);

late final _igTableGetColumnFlags = _cimgui.lookupFunction<
  Uint32 Function(Int32 column_n),
  int Function(int column_n)>('igTableGetColumnFlags');

///```c
/// int tableGetColumnIndex(
/// );
///```
int tableGetColumnIndex() =>
  _igTableGetColumnIndex();

late final _igTableGetColumnIndex = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igTableGetColumnIndex');

///```c
/// byte* tableGetColumnName(
///   int column_n 
/// );
///```
Pointer<Uint8> tableGetColumnName(int column_n) =>
  _igTableGetColumnNameInt(column_n);

late final _igTableGetColumnNameInt = _cimgui.lookupFunction<
  Pointer<Uint8> Function(Int32 column_n),
  Pointer<Uint8> Function(int column_n)>('igTableGetColumnNameInt');

///```c
/// int tableGetRowIndex(
/// );
///```
int tableGetRowIndex() =>
  _igTableGetRowIndex();

late final _igTableGetRowIndex = _cimgui.lookupFunction<
  Int32 Function(),
  int Function()>('igTableGetRowIndex');

///```c
/// ImGuiTableSortSpecs* tableGetSortSpecs(
/// );
///```
Pointer<ImGuiTableSortSpecs> tableGetSortSpecs() =>
  _igTableGetSortSpecs();

late final _igTableGetSortSpecs = _cimgui.lookupFunction<
  Pointer<ImGuiTableSortSpecs> Function(),
  Pointer<ImGuiTableSortSpecs> Function()>('igTableGetSortSpecs');

///```c
/// void tableHeader(
///   byte* label 
/// );
///```
void tableHeader(Pointer<Uint8> label) =>
  _igTableHeader(label);

late final _igTableHeader = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label),
  void Function(Pointer<Uint8> label)>('igTableHeader');

///```c
/// void tableHeadersRow(
/// );
///```
void tableHeadersRow() =>
  _igTableHeadersRow();

late final _igTableHeadersRow = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igTableHeadersRow');

///```c
/// byte tableNextColumn(
/// );
///```
int tableNextColumn() =>
  _igTableNextColumn();

late final _igTableNextColumn = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('igTableNextColumn');

///```c
/// void tableNextRow(
///   ImGuiTableRowFlags row_flags ,
///   float min_row_height 
/// );
///```
void tableNextRow(int row_flags, double min_row_height) =>
  _igTableNextRow(row_flags, min_row_height);

late final _igTableNextRow = _cimgui.lookupFunction<
  Void Function(Uint32 row_flags, Float min_row_height),
  void Function(int row_flags, double min_row_height)>('igTableNextRow');

///```c
/// void tableSetBgColor(
///   ImGuiTableBgTarget target ,
///   uint color ,
///   int column_n 
/// );
///```
void tableSetBgColor(int target, int color, int column_n) =>
  _igTableSetBgColor(target, color, column_n);

late final _igTableSetBgColor = _cimgui.lookupFunction<
  Void Function(Uint32 target, Uint32 color, Int32 column_n),
  void Function(int target, int color, int column_n)>('igTableSetBgColor');

///```c
/// byte tableSetColumnIndex(
///   int column_n 
/// );
///```
int tableSetColumnIndex(int column_n) =>
  _igTableSetColumnIndex(column_n);

late final _igTableSetColumnIndex = _cimgui.lookupFunction<
  Uint8 Function(Int32 column_n),
  int Function(int column_n)>('igTableSetColumnIndex');

///```c
/// void tableSetupColumn(
///   byte* label ,
///   ImGuiTableColumnFlags flags ,
///   float init_width_or_weight ,
///   uint user_id 
/// );
///```
void tableSetupColumn(Pointer<Uint8> label, int flags, double init_width_or_weight, int user_id) =>
  _igTableSetupColumn(label, flags, init_width_or_weight, user_id);

late final _igTableSetupColumn = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> label, Uint32 flags, Float init_width_or_weight, Uint32 user_id),
  void Function(Pointer<Uint8> label, int flags, double init_width_or_weight, int user_id)>('igTableSetupColumn');

///```c
/// void tableSetupScrollFreeze(
///   int cols ,
///   int rows 
/// );
///```
void tableSetupScrollFreeze(int cols, int rows) =>
  _igTableSetupScrollFreeze(cols, rows);

late final _igTableSetupScrollFreeze = _cimgui.lookupFunction<
  Void Function(Int32 cols, Int32 rows),
  void Function(int cols, int rows)>('igTableSetupScrollFreeze');

///```c
/// void text(
///   byte* fmt ,
///   ... ... 
/// );
///```
void text(Pointer<Uint8> fmt) =>
  _igText(fmt);

late final _igText = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igText');

///```c
/// void textColored(
///   Vector4 col ,
///   byte* fmt ,
///   ... ... 
/// );
///```
void textColored(Vector4 col, Pointer<Uint8> fmt) =>
  _igTextColored(col, fmt);

late final _igTextColored = _cimgui.lookupFunction<
  Void Function(Vector4 col, Pointer<Uint8> fmt),
  void Function(Vector4 col, Pointer<Uint8> fmt)>('igTextColored');

///```c
/// void textDisabled(
///   byte* fmt ,
///   ... ... 
/// );
///```
void textDisabled(Pointer<Uint8> fmt) =>
  _igTextDisabled(fmt);

late final _igTextDisabled = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igTextDisabled');

///```c
/// void textUnformatted(
///   byte* text ,
///   byte* text_end 
/// );
///```
void textUnformatted(Pointer<Uint8> text, Pointer<Uint8> text_end) =>
  _igTextUnformatted(text, text_end);

late final _igTextUnformatted = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> text, Pointer<Uint8> text_end),
  void Function(Pointer<Uint8> text, Pointer<Uint8> text_end)>('igTextUnformatted');

///```c
/// void textWrapped(
///   byte* fmt ,
///   ... ... 
/// );
///```
void textWrapped(Pointer<Uint8> fmt) =>
  _igTextWrapped(fmt);

late final _igTextWrapped = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> fmt),
  void Function(Pointer<Uint8> fmt)>('igTextWrapped');

///```c
/// byte treeNode(
///   byte* label 
/// );
///```
int treeNode(Pointer<Uint8> label) =>
  _igTreeNodeStr(label);

late final _igTreeNodeStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label),
  int Function(Pointer<Uint8> label)>('igTreeNodeStr');

///```c
/// byte treeNode(
///   byte* str_id ,
///   byte* fmt ,
///   ... ... 
/// );
///```
int treeNode(Pointer<Uint8> str_id, Pointer<Uint8> fmt) =>
  _igTreeNodeStrStr(str_id, fmt);

late final _igTreeNodeStrStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Pointer<Uint8> fmt),
  int Function(Pointer<Uint8> str_id, Pointer<Uint8> fmt)>('igTreeNodeStrStr');

///```c
/// byte treeNode(
///   void* ptr_id ,
///   byte* fmt ,
///   ... ... 
/// );
///```
int treeNode(Pointer<Void> ptr_id, Pointer<Uint8> fmt) =>
  _igTreeNodePtr(ptr_id, fmt);

late final _igTreeNodePtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Void> ptr_id, Pointer<Uint8> fmt),
  int Function(Pointer<Void> ptr_id, Pointer<Uint8> fmt)>('igTreeNodePtr');

///```c
/// byte treeNodeEx(
///   byte* label ,
///   ImGuiTreeNodeFlags flags 
/// );
///```
int treeNodeEx(Pointer<Uint8> label, int flags) =>
  _igTreeNodeExStr(label, flags);

late final _igTreeNodeExStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Uint32 flags),
  int Function(Pointer<Uint8> label, int flags)>('igTreeNodeExStr');

///```c
/// byte treeNodeEx(
///   byte* str_id ,
///   ImGuiTreeNodeFlags flags ,
///   byte* fmt ,
///   ... ... 
/// );
///```
int treeNodeEx(Pointer<Uint8> str_id, int flags, Pointer<Uint8> fmt) =>
  _igTreeNodeExStrStr(str_id, flags, fmt);

late final _igTreeNodeExStrStr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> str_id, Uint32 flags, Pointer<Uint8> fmt),
  int Function(Pointer<Uint8> str_id, int flags, Pointer<Uint8> fmt)>('igTreeNodeExStrStr');

///```c
/// byte treeNodeEx(
///   void* ptr_id ,
///   ImGuiTreeNodeFlags flags ,
///   byte* fmt ,
///   ... ... 
/// );
///```
int treeNodeEx(Pointer<Void> ptr_id, int flags, Pointer<Uint8> fmt) =>
  _igTreeNodeExPtr(ptr_id, flags, fmt);

late final _igTreeNodeExPtr = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Void> ptr_id, Uint32 flags, Pointer<Uint8> fmt),
  int Function(Pointer<Void> ptr_id, int flags, Pointer<Uint8> fmt)>('igTreeNodeExPtr');

///```c
/// void treePop(
/// );
///```
void treePop() =>
  _igTreePop();

late final _igTreePop = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igTreePop');

///```c
/// void treePush(
///   byte* str_id 
/// );
///```
void treePush(Pointer<Uint8> str_id) =>
  _igTreePushStr(str_id);

late final _igTreePushStr = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> str_id),
  void Function(Pointer<Uint8> str_id)>('igTreePushStr');

///```c
/// void treePush(
///   void* ptr_id 
/// );
///```
void treePush(Pointer<Void> ptr_id) =>
  _igTreePushPtr(ptr_id);

late final _igTreePushPtr = _cimgui.lookupFunction<
  Void Function(Pointer<Void> ptr_id),
  void Function(Pointer<Void> ptr_id)>('igTreePushPtr');

///```c
/// void unindent(
///   float indent_w 
/// );
///```
void unindent(double indent_w) =>
  _igUnindent(indent_w);

late final _igUnindent = _cimgui.lookupFunction<
  Void Function(Float indent_w),
  void Function(double indent_w)>('igUnindent');

///```c
/// void updatePlatformWindows(
/// );
///```
void updatePlatformWindows() =>
  _igUpdatePlatformWindows();

late final _igUpdatePlatformWindows = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('igUpdatePlatformWindows');

///```c
/// byte vSliderFloat(
///   byte* label ,
///   Vector2 size ,
///   float* v ,
///   float v_min ,
///   float v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int vSliderFloat(Pointer<Uint8> label, Vector2 size, Pointer<Float> v, double v_min, double v_max, Pointer<Uint8> format, int flags) =>
  _igVSliderFloat(label, size, v, v_min, v_max, format, flags);

late final _igVSliderFloat = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Vector2 size, Pointer<Float> v, Float v_min, Float v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Vector2 size, Pointer<Float> v, double v_min, double v_max, Pointer<Uint8> format, int flags)>('igVSliderFloat');

///```c
/// byte vSliderInt(
///   byte* label ,
///   Vector2 size ,
///   int* v ,
///   int v_min ,
///   int v_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int vSliderInt(Pointer<Uint8> label, Vector2 size, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags) =>
  _igVSliderInt(label, size, v, v_min, v_max, format, flags);

late final _igVSliderInt = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Vector2 size, Pointer<Int32> v, Int32 v_min, Int32 v_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Vector2 size, Pointer<Int32> v, int v_min, int v_max, Pointer<Uint8> format, int flags)>('igVSliderInt');

///```c
/// byte vSliderScalar(
///   byte* label ,
///   Vector2 size ,
///   ImGuiDataType data_type ,
///   void* p_data ,
///   void* p_min ,
///   void* p_max ,
///   byte* format ,
///   ImGuiSliderFlags flags 
/// );
///```
int vSliderScalar(Pointer<Uint8> label, Vector2 size, int data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags) =>
  _igVSliderScalar(label, size, data_type, p_data, p_min, p_max, format, flags);

late final _igVSliderScalar = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> label, Vector2 size, Uint32 data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, Uint32 flags),
  int Function(Pointer<Uint8> label, Vector2 size, int data_type, Pointer<Void> p_data, Pointer<Void> p_min, Pointer<Void> p_max, Pointer<Uint8> format, int flags)>('igVSliderScalar');

///```c
/// void value(
///   byte* prefix ,
///   byte b 
/// );
///```
void value(Pointer<Uint8> prefix, int b) =>
  _igValueBool(prefix, b);

late final _igValueBool = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> prefix, Uint8 b),
  void Function(Pointer<Uint8> prefix, int b)>('igValueBool');

///```c
/// void value(
///   byte* prefix ,
///   int v 
/// );
///```
void value(Pointer<Uint8> prefix, int v) =>
  _igValueInt(prefix, v);

late final _igValueInt = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> prefix, Int32 v),
  void Function(Pointer<Uint8> prefix, int v)>('igValueInt');

///```c
/// void value(
///   byte* prefix ,
///   uint v 
/// );
///```
void value(Pointer<Uint8> prefix, int v) =>
  _igValueUint(prefix, v);

late final _igValueUint = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> prefix, Uint32 v),
  void Function(Pointer<Uint8> prefix, int v)>('igValueUint');

///```c
/// void value(
///   byte* prefix ,
///   float v ,
///   byte* float_format 
/// );
///```
void value(Pointer<Uint8> prefix, double v, Pointer<Uint8> float_format) =>
  _igValueFloat(prefix, v, float_format);

late final _igValueFloat = _cimgui.lookupFunction<
  Void Function(Pointer<Uint8> prefix, Float v, Pointer<Uint8> float_format),
  void Function(Pointer<Uint8> prefix, double v, Pointer<Uint8> float_format)>('igValueFloat');

///```c
/// void imGui_ImplGlfw_CharCallback(
///   GLFWwindow* window ,
///   uint c 
/// );
///```
void imGui_ImplGlfw_CharCallback(Pointer<GLFWwindow> window, int c) =>
  _ImGui_ImplGlfw_CharCallback(window, c);

late final _ImGui_ImplGlfw_CharCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Uint32 c),
  void Function(Pointer<GLFWwindow> window, int c)>('ImGui_ImplGlfw_CharCallback');

///```c
/// void imGui_ImplGlfw_CursorEnterCallback(
///   GLFWwindow* window ,
///   int entered 
/// );
///```
void imGui_ImplGlfw_CursorEnterCallback(Pointer<GLFWwindow> window, int entered) =>
  _ImGui_ImplGlfw_CursorEnterCallback(window, entered);

late final _ImGui_ImplGlfw_CursorEnterCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Int32 entered),
  void Function(Pointer<GLFWwindow> window, int entered)>('ImGui_ImplGlfw_CursorEnterCallback');

///```c
/// void imGui_ImplGlfw_CursorPosCallback(
///   GLFWwindow* window ,
///   double x ,
///   double y 
/// );
///```
void imGui_ImplGlfw_CursorPosCallback(Pointer<GLFWwindow> window, double x, double y) =>
  _ImGui_ImplGlfw_CursorPosCallback(window, x, y);

late final _ImGui_ImplGlfw_CursorPosCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Double x, Double y),
  void Function(Pointer<GLFWwindow> window, double x, double y)>('ImGui_ImplGlfw_CursorPosCallback');

///```c
/// byte imGui_ImplGlfw_InitForOpenGL(
///   GLFWwindow* window ,
///   byte install_callbacks 
/// );
///```
int imGui_ImplGlfw_InitForOpenGL(Pointer<GLFWwindow> window, int install_callbacks) =>
  _ImGui_ImplGlfw_InitForOpenGL(window, install_callbacks);

late final _ImGui_ImplGlfw_InitForOpenGL = _cimgui.lookupFunction<
  Uint8 Function(Pointer<GLFWwindow> window, Uint8 install_callbacks),
  int Function(Pointer<GLFWwindow> window, int install_callbacks)>('ImGui_ImplGlfw_InitForOpenGL');

///```c
/// byte imGui_ImplGlfw_InitForOther(
///   GLFWwindow* window ,
///   byte install_callbacks 
/// );
///```
int imGui_ImplGlfw_InitForOther(Pointer<GLFWwindow> window, int install_callbacks) =>
  _ImGui_ImplGlfw_InitForOther(window, install_callbacks);

late final _ImGui_ImplGlfw_InitForOther = _cimgui.lookupFunction<
  Uint8 Function(Pointer<GLFWwindow> window, Uint8 install_callbacks),
  int Function(Pointer<GLFWwindow> window, int install_callbacks)>('ImGui_ImplGlfw_InitForOther');

///```c
/// byte imGui_ImplGlfw_InitForVulkan(
///   GLFWwindow* window ,
///   byte install_callbacks 
/// );
///```
int imGui_ImplGlfw_InitForVulkan(Pointer<GLFWwindow> window, int install_callbacks) =>
  _ImGui_ImplGlfw_InitForVulkan(window, install_callbacks);

late final _ImGui_ImplGlfw_InitForVulkan = _cimgui.lookupFunction<
  Uint8 Function(Pointer<GLFWwindow> window, Uint8 install_callbacks),
  int Function(Pointer<GLFWwindow> window, int install_callbacks)>('ImGui_ImplGlfw_InitForVulkan');

///```c
/// void imGui_ImplGlfw_InstallCallbacks(
///   GLFWwindow* window 
/// );
///```
void imGui_ImplGlfw_InstallCallbacks(Pointer<GLFWwindow> window) =>
  _ImGui_ImplGlfw_InstallCallbacks(window);

late final _ImGui_ImplGlfw_InstallCallbacks = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window),
  void Function(Pointer<GLFWwindow> window)>('ImGui_ImplGlfw_InstallCallbacks');

///```c
/// void imGui_ImplGlfw_KeyCallback(
///   GLFWwindow* window ,
///   int key ,
///   int scancode ,
///   int action ,
///   int mods 
/// );
///```
void imGui_ImplGlfw_KeyCallback(Pointer<GLFWwindow> window, int key, int scancode, int action, int mods) =>
  _ImGui_ImplGlfw_KeyCallback(window, key, scancode, action, mods);

late final _ImGui_ImplGlfw_KeyCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Int32 key, Int32 scancode, Int32 action, Int32 mods),
  void Function(Pointer<GLFWwindow> window, int key, int scancode, int action, int mods)>('ImGui_ImplGlfw_KeyCallback');

///```c
/// void imGui_ImplGlfw_MonitorCallback(
///   GLFWmonitor* monitor ,
///   int event 
/// );
///```
void imGui_ImplGlfw_MonitorCallback(Pointer<GLFWmonitor> monitor, int event) =>
  _ImGui_ImplGlfw_MonitorCallback(monitor, event);

late final _ImGui_ImplGlfw_MonitorCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWmonitor> monitor, Int32 event),
  void Function(Pointer<GLFWmonitor> monitor, int event)>('ImGui_ImplGlfw_MonitorCallback');

///```c
/// void imGui_ImplGlfw_MouseButtonCallback(
///   GLFWwindow* window ,
///   int button ,
///   int action ,
///   int mods 
/// );
///```
void imGui_ImplGlfw_MouseButtonCallback(Pointer<GLFWwindow> window, int button, int action, int mods) =>
  _ImGui_ImplGlfw_MouseButtonCallback(window, button, action, mods);

late final _ImGui_ImplGlfw_MouseButtonCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Int32 button, Int32 action, Int32 mods),
  void Function(Pointer<GLFWwindow> window, int button, int action, int mods)>('ImGui_ImplGlfw_MouseButtonCallback');

///```c
/// void imGui_ImplGlfw_NewFrame(
/// );
///```
void imGui_ImplGlfw_NewFrame() =>
  _ImGui_ImplGlfw_NewFrame();

late final _ImGui_ImplGlfw_NewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplGlfw_NewFrame');

///```c
/// void imGui_ImplGlfw_RestoreCallbacks(
///   GLFWwindow* window 
/// );
///```
void imGui_ImplGlfw_RestoreCallbacks(Pointer<GLFWwindow> window) =>
  _ImGui_ImplGlfw_RestoreCallbacks(window);

late final _ImGui_ImplGlfw_RestoreCallbacks = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window),
  void Function(Pointer<GLFWwindow> window)>('ImGui_ImplGlfw_RestoreCallbacks');

///```c
/// void imGui_ImplGlfw_ScrollCallback(
///   GLFWwindow* window ,
///   double xoffset ,
///   double yoffset 
/// );
///```
void imGui_ImplGlfw_ScrollCallback(Pointer<GLFWwindow> window, double xoffset, double yoffset) =>
  _ImGui_ImplGlfw_ScrollCallback(window, xoffset, yoffset);

late final _ImGui_ImplGlfw_ScrollCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Double xoffset, Double yoffset),
  void Function(Pointer<GLFWwindow> window, double xoffset, double yoffset)>('ImGui_ImplGlfw_ScrollCallback');

///```c
/// void imGui_ImplGlfw_SetCallbacksChainForAllWindows(
///   byte chain_for_all_windows 
/// );
///```
void imGui_ImplGlfw_SetCallbacksChainForAllWindows(int chain_for_all_windows) =>
  _ImGui_ImplGlfw_SetCallbacksChainForAllWindows(chain_for_all_windows);

late final _ImGui_ImplGlfw_SetCallbacksChainForAllWindows = _cimgui.lookupFunction<
  Void Function(Uint8 chain_for_all_windows),
  void Function(int chain_for_all_windows)>('ImGui_ImplGlfw_SetCallbacksChainForAllWindows');

///```c
/// void imGui_ImplGlfw_Shutdown(
/// );
///```
void imGui_ImplGlfw_Shutdown() =>
  _ImGui_ImplGlfw_Shutdown();

late final _ImGui_ImplGlfw_Shutdown = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplGlfw_Shutdown');

///```c
/// void imGui_ImplGlfw_Sleep(
///   int milliseconds 
/// );
///```
void imGui_ImplGlfw_Sleep(int milliseconds) =>
  _ImGui_ImplGlfw_Sleep(milliseconds);

late final _ImGui_ImplGlfw_Sleep = _cimgui.lookupFunction<
  Void Function(Int32 milliseconds),
  void Function(int milliseconds)>('ImGui_ImplGlfw_Sleep');

///```c
/// void imGui_ImplGlfw_WindowFocusCallback(
///   GLFWwindow* window ,
///   int focused 
/// );
///```
void imGui_ImplGlfw_WindowFocusCallback(Pointer<GLFWwindow> window, int focused) =>
  _ImGui_ImplGlfw_WindowFocusCallback(window, focused);

late final _ImGui_ImplGlfw_WindowFocusCallback = _cimgui.lookupFunction<
  Void Function(Pointer<GLFWwindow> window, Int32 focused),
  void Function(Pointer<GLFWwindow> window, int focused)>('ImGui_ImplGlfw_WindowFocusCallback');

///```c
/// byte imGui_ImplOpenGL2_CreateDeviceObjects(
/// );
///```
int imGui_ImplOpenGL2_CreateDeviceObjects() =>
  _ImGui_ImplOpenGL2_CreateDeviceObjects();

late final _ImGui_ImplOpenGL2_CreateDeviceObjects = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('ImGui_ImplOpenGL2_CreateDeviceObjects');

///```c
/// byte imGui_ImplOpenGL2_CreateFontsTexture(
/// );
///```
int imGui_ImplOpenGL2_CreateFontsTexture() =>
  _ImGui_ImplOpenGL2_CreateFontsTexture();

late final _ImGui_ImplOpenGL2_CreateFontsTexture = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('ImGui_ImplOpenGL2_CreateFontsTexture');

///```c
/// void imGui_ImplOpenGL2_DestroyDeviceObjects(
/// );
///```
void imGui_ImplOpenGL2_DestroyDeviceObjects() =>
  _ImGui_ImplOpenGL2_DestroyDeviceObjects();

late final _ImGui_ImplOpenGL2_DestroyDeviceObjects = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL2_DestroyDeviceObjects');

///```c
/// void imGui_ImplOpenGL2_DestroyFontsTexture(
/// );
///```
void imGui_ImplOpenGL2_DestroyFontsTexture() =>
  _ImGui_ImplOpenGL2_DestroyFontsTexture();

late final _ImGui_ImplOpenGL2_DestroyFontsTexture = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL2_DestroyFontsTexture');

///```c
/// byte imGui_ImplOpenGL2_Init(
/// );
///```
int imGui_ImplOpenGL2_Init() =>
  _ImGui_ImplOpenGL2_Init();

late final _ImGui_ImplOpenGL2_Init = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('ImGui_ImplOpenGL2_Init');

///```c
/// void imGui_ImplOpenGL2_NewFrame(
/// );
///```
void imGui_ImplOpenGL2_NewFrame() =>
  _ImGui_ImplOpenGL2_NewFrame();

late final _ImGui_ImplOpenGL2_NewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL2_NewFrame');

///```c
/// void imGui_ImplOpenGL2_RenderDrawData(
///   ImDrawData* draw_data 
/// );
///```
void imGui_ImplOpenGL2_RenderDrawData(Pointer<ImDrawData> draw_data) =>
  _ImGui_ImplOpenGL2_RenderDrawData(draw_data);

late final _ImGui_ImplOpenGL2_RenderDrawData = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> draw_data),
  void Function(Pointer<ImDrawData> draw_data)>('ImGui_ImplOpenGL2_RenderDrawData');

///```c
/// void imGui_ImplOpenGL2_Shutdown(
/// );
///```
void imGui_ImplOpenGL2_Shutdown() =>
  _ImGui_ImplOpenGL2_Shutdown();

late final _ImGui_ImplOpenGL2_Shutdown = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL2_Shutdown');

///```c
/// byte imGui_ImplOpenGL3_CreateDeviceObjects(
/// );
///```
int imGui_ImplOpenGL3_CreateDeviceObjects() =>
  _ImGui_ImplOpenGL3_CreateDeviceObjects();

late final _ImGui_ImplOpenGL3_CreateDeviceObjects = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('ImGui_ImplOpenGL3_CreateDeviceObjects');

///```c
/// byte imGui_ImplOpenGL3_CreateFontsTexture(
/// );
///```
int imGui_ImplOpenGL3_CreateFontsTexture() =>
  _ImGui_ImplOpenGL3_CreateFontsTexture();

late final _ImGui_ImplOpenGL3_CreateFontsTexture = _cimgui.lookupFunction<
  Uint8 Function(),
  int Function()>('ImGui_ImplOpenGL3_CreateFontsTexture');

///```c
/// void imGui_ImplOpenGL3_DestroyDeviceObjects(
/// );
///```
void imGui_ImplOpenGL3_DestroyDeviceObjects() =>
  _ImGui_ImplOpenGL3_DestroyDeviceObjects();

late final _ImGui_ImplOpenGL3_DestroyDeviceObjects = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL3_DestroyDeviceObjects');

///```c
/// void imGui_ImplOpenGL3_DestroyFontsTexture(
/// );
///```
void imGui_ImplOpenGL3_DestroyFontsTexture() =>
  _ImGui_ImplOpenGL3_DestroyFontsTexture();

late final _ImGui_ImplOpenGL3_DestroyFontsTexture = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL3_DestroyFontsTexture');

///```c
/// byte imGui_ImplOpenGL3_Init(
///   byte* glsl_version 
/// );
///```
int imGui_ImplOpenGL3_Init(Pointer<Uint8> glsl_version) =>
  _ImGui_ImplOpenGL3_Init(glsl_version);

late final _ImGui_ImplOpenGL3_Init = _cimgui.lookupFunction<
  Uint8 Function(Pointer<Uint8> glsl_version),
  int Function(Pointer<Uint8> glsl_version)>('ImGui_ImplOpenGL3_Init');

///```c
/// void imGui_ImplOpenGL3_NewFrame(
/// );
///```
void imGui_ImplOpenGL3_NewFrame() =>
  _ImGui_ImplOpenGL3_NewFrame();

late final _ImGui_ImplOpenGL3_NewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL3_NewFrame');

///```c
/// void imGui_ImplOpenGL3_RenderDrawData(
///   ImDrawData* draw_data 
/// );
///```
void imGui_ImplOpenGL3_RenderDrawData(Pointer<ImDrawData> draw_data) =>
  _ImGui_ImplOpenGL3_RenderDrawData(draw_data);

late final _ImGui_ImplOpenGL3_RenderDrawData = _cimgui.lookupFunction<
  Void Function(Pointer<ImDrawData> draw_data),
  void Function(Pointer<ImDrawData> draw_data)>('ImGui_ImplOpenGL3_RenderDrawData');

///```c
/// void imGui_ImplOpenGL3_Shutdown(
/// );
///```
void imGui_ImplOpenGL3_Shutdown() =>
  _ImGui_ImplOpenGL3_Shutdown();

late final _ImGui_ImplOpenGL3_Shutdown = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplOpenGL3_Shutdown');

///```c
/// byte imGui_ImplSDL2_InitForD3D(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL2_InitForD3D(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL2_InitForD3D(window);

late final _ImGui_ImplSDL2_InitForD3D = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL2_InitForD3D');

///```c
/// byte imGui_ImplSDL2_InitForMetal(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL2_InitForMetal(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL2_InitForMetal(window);

late final _ImGui_ImplSDL2_InitForMetal = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL2_InitForMetal');

///```c
/// byte imGui_ImplSDL2_InitForOpenGL(
///   SDL_Window* window ,
///   void* sdl_gl_context 
/// );
///```
int imGui_ImplSDL2_InitForOpenGL(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context) =>
  _ImGui_ImplSDL2_InitForOpenGL(window, sdl_gl_context);

late final _ImGui_ImplSDL2_InitForOpenGL = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context),
  int Function(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context)>('ImGui_ImplSDL2_InitForOpenGL');

///```c
/// byte imGui_ImplSDL2_InitForOther(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL2_InitForOther(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL2_InitForOther(window);

late final _ImGui_ImplSDL2_InitForOther = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL2_InitForOther');

///```c
/// byte imGui_ImplSDL2_InitForSDLRenderer(
///   SDL_Window* window ,
///   SDL_Renderer* renderer 
/// );
///```
int imGui_ImplSDL2_InitForSDLRenderer(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer) =>
  _ImGui_ImplSDL2_InitForSDLRenderer(window, renderer);

late final _ImGui_ImplSDL2_InitForSDLRenderer = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer),
  int Function(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer)>('ImGui_ImplSDL2_InitForSDLRenderer');

///```c
/// byte imGui_ImplSDL2_InitForVulkan(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL2_InitForVulkan(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL2_InitForVulkan(window);

late final _ImGui_ImplSDL2_InitForVulkan = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL2_InitForVulkan');

///```c
/// void imGui_ImplSDL2_NewFrame(
/// );
///```
void imGui_ImplSDL2_NewFrame() =>
  _ImGui_ImplSDL2_NewFrame();

late final _ImGui_ImplSDL2_NewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplSDL2_NewFrame');

///```c
/// byte imGui_ImplSDL2_ProcessEvent(
///   SDL_Event* event 
/// );
///```
int imGui_ImplSDL2_ProcessEvent(Pointer<SDL_Event> event) =>
  _ImGui_ImplSDL2_ProcessEvent(event);

late final _ImGui_ImplSDL2_ProcessEvent = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Event> event),
  int Function(Pointer<SDL_Event> event)>('ImGui_ImplSDL2_ProcessEvent');

///```c
/// void imGui_ImplSDL2_SetGamepadMode(
///   ImGui_ImplSDL2_GamepadMode mode ,
///   struct _SDL_GameController** manual_gamepads_array ,
///   int manual_gamepads_count 
/// );
///```
void imGui_ImplSDL2_SetGamepadMode(ImGui_ImplSDL2_GamepadMode mode, Pointer<Pointer<struct _SDL_GameController>> manual_gamepads_array, int manual_gamepads_count) =>
  _ImGui_ImplSDL2_SetGamepadMode(mode, manual_gamepads_array, manual_gamepads_count);

late final _ImGui_ImplSDL2_SetGamepadMode = _cimgui.lookupFunction<
  Void Function(ImGui_ImplSDL2_GamepadMode mode, Pointer<Pointer<struct _SDL_GameController>> manual_gamepads_array, Int32 manual_gamepads_count),
  void Function(ImGui_ImplSDL2_GamepadMode mode, Pointer<Pointer<struct _SDL_GameController>> manual_gamepads_array, int manual_gamepads_count)>('ImGui_ImplSDL2_SetGamepadMode');

///```c
/// void imGui_ImplSDL2_Shutdown(
/// );
///```
void imGui_ImplSDL2_Shutdown() =>
  _ImGui_ImplSDL2_Shutdown();

late final _ImGui_ImplSDL2_Shutdown = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplSDL2_Shutdown');

///```c
/// byte imGui_ImplSDL3_InitForD3D(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL3_InitForD3D(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL3_InitForD3D(window);

late final _ImGui_ImplSDL3_InitForD3D = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL3_InitForD3D');

///```c
/// byte imGui_ImplSDL3_InitForMetal(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL3_InitForMetal(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL3_InitForMetal(window);

late final _ImGui_ImplSDL3_InitForMetal = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL3_InitForMetal');

///```c
/// byte imGui_ImplSDL3_InitForOpenGL(
///   SDL_Window* window ,
///   void* sdl_gl_context 
/// );
///```
int imGui_ImplSDL3_InitForOpenGL(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context) =>
  _ImGui_ImplSDL3_InitForOpenGL(window, sdl_gl_context);

late final _ImGui_ImplSDL3_InitForOpenGL = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context),
  int Function(Pointer<SDL_Window> window, Pointer<Void> sdl_gl_context)>('ImGui_ImplSDL3_InitForOpenGL');

///```c
/// byte imGui_ImplSDL3_InitForOther(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL3_InitForOther(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL3_InitForOther(window);

late final _ImGui_ImplSDL3_InitForOther = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL3_InitForOther');

///```c
/// byte imGui_ImplSDL3_InitForSDLRenderer(
///   SDL_Window* window ,
///   SDL_Renderer* renderer 
/// );
///```
int imGui_ImplSDL3_InitForSDLRenderer(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer) =>
  _ImGui_ImplSDL3_InitForSDLRenderer(window, renderer);

late final _ImGui_ImplSDL3_InitForSDLRenderer = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer),
  int Function(Pointer<SDL_Window> window, Pointer<SDL_Renderer> renderer)>('ImGui_ImplSDL3_InitForSDLRenderer');

///```c
/// byte imGui_ImplSDL3_InitForVulkan(
///   SDL_Window* window 
/// );
///```
int imGui_ImplSDL3_InitForVulkan(Pointer<SDL_Window> window) =>
  _ImGui_ImplSDL3_InitForVulkan(window);

late final _ImGui_ImplSDL3_InitForVulkan = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Window> window),
  int Function(Pointer<SDL_Window> window)>('ImGui_ImplSDL3_InitForVulkan');

///```c
/// void imGui_ImplSDL3_NewFrame(
/// );
///```
void imGui_ImplSDL3_NewFrame() =>
  _ImGui_ImplSDL3_NewFrame();

late final _ImGui_ImplSDL3_NewFrame = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplSDL3_NewFrame');

///```c
/// byte imGui_ImplSDL3_ProcessEvent(
///   SDL_Event* event 
/// );
///```
int imGui_ImplSDL3_ProcessEvent(Pointer<SDL_Event> event) =>
  _ImGui_ImplSDL3_ProcessEvent(event);

late final _ImGui_ImplSDL3_ProcessEvent = _cimgui.lookupFunction<
  Uint8 Function(Pointer<SDL_Event> event),
  int Function(Pointer<SDL_Event> event)>('ImGui_ImplSDL3_ProcessEvent');

///```c
/// void imGui_ImplSDL3_SetGamepadMode(
///   ImGui_ImplSDL3_GamepadMode mode ,
///   SDL_Gamepad** manual_gamepads_array ,
///   int manual_gamepads_count 
/// );
///```
void imGui_ImplSDL3_SetGamepadMode(ImGui_ImplSDL3_GamepadMode mode, Pointer<Pointer<SDL_Gamepad>> manual_gamepads_array, int manual_gamepads_count) =>
  _ImGui_ImplSDL3_SetGamepadMode(mode, manual_gamepads_array, manual_gamepads_count);

late final _ImGui_ImplSDL3_SetGamepadMode = _cimgui.lookupFunction<
  Void Function(ImGui_ImplSDL3_GamepadMode mode, Pointer<Pointer<SDL_Gamepad>> manual_gamepads_array, Int32 manual_gamepads_count),
  void Function(ImGui_ImplSDL3_GamepadMode mode, Pointer<Pointer<SDL_Gamepad>> manual_gamepads_array, int manual_gamepads_count)>('ImGui_ImplSDL3_SetGamepadMode');

///```c
/// void imGui_ImplSDL3_Shutdown(
/// );
///```
void imGui_ImplSDL3_Shutdown() =>
  _ImGui_ImplSDL3_Shutdown();

late final _ImGui_ImplSDL3_Shutdown = _cimgui.lookupFunction<
  Void Function(),
  void Function()>('ImGui_ImplSDL3_Shutdown');

//endregion

//region Types
class ImColor extends Struct {
  external Vector4 value;
}
class ImDrawChannel extends Struct {
  external ImVector _CmdBuffer;

  external ImVector _IdxBuffer;
}
class ImDrawCmd extends Struct {
  external Vector4 clipRect;

  @IntPtr()
  external int textureId;

  @Uint32()
  external int vtxOffset;

  @Uint32()
  external int idxOffset;

  @Uint32()
  external int elemCount;

  @IntPtr()
  external int userCallback;

  external Pointer<Void> userCallbackData;

  @Int32()
  external int userCallbackDataSize;

  @Int32()
  external int userCallbackDataOffset;
}
class ImDrawCmdHeader extends Struct {
  external Vector4 clipRect;

  @IntPtr()
  external int textureId;

  @Uint32()
  external int vtxOffset;
}
class ImDrawData extends Struct {
  @Uint8()
  external int valid;

  @Int32()
  external int cmdListsCount;

  @Int32()
  external int totalIdxCount;

  @Int32()
  external int totalVtxCount;

  external ImVector cmdLists;

  external Vector2 displayPos;

  external Vector2 displaySize;

  external Vector2 framebufferScale;

  external Pointer<ImGuiViewport> ownerViewport;
}
class ImDrawList extends Struct {
  external ImVector cmdBuffer;

  external ImVector idxBuffer;

  external ImVector vtxBuffer;

  /// Enum ImDrawListFlags
  @Uint32()
  external int flags;

  @Uint32()
  external int _VtxCurrentIdx;

  @IntPtr()
  external int _Data;

  external Pointer<ImDrawVert> _VtxWritePtr;

  external Pointer<Uint16> _IdxWritePtr;

  external ImVector _Path;

  external ImDrawCmdHeader _CmdHeader;

  external ImDrawListSplitter _Splitter;

  external ImVector _ClipRectStack;

  external ImVector _TextureIdStack;

  external ImVector _CallbacksDataBuf;

  @Float()
  external double _FringeScale;

  external Pointer<Uint8> _OwnerName;
}
class ImDrawListSplitter extends Struct {
  @Int32()
  external int _Current;

  @Int32()
  external int _Count;

  external ImVector _Channels;
}
class ImDrawVert extends Struct {
  external Vector2 pos;

  external Vector2 uv;

  @Uint32()
  external int col;
}
class ImFont extends Struct {
  external ImVector indexAdvanceX;

  @Float()
  external double fallbackAdvanceX;

  @Float()
  external double fontSize;

  external ImVector indexLookup;

  external ImVector glyphs;

  external Pointer<ImFontGlyph> fallbackGlyph;

  external Pointer<ImFontAtlas> containerAtlas;

  external Pointer<ImFontConfig> configData;

  @Int16()
  external int configDataCount;

  @Int16()
  external int ellipsisCharCount;

  @Uint16()
  external int ellipsisChar;

  @Uint16()
  external int fallbackChar;

  @Float()
  external double ellipsisWidth;

  @Float()
  external double ellipsisCharStep;

  @Uint8()
  external int dirtyLookupTables;

  @Float()
  external double scale;

  @Float()
  external double ascent;

  @Float()
  external double descent;

  @Int32()
  external int metricsTotalSurface;

  @Array(2)
  external Array<byte> Used4kPagesMap;
}
class ImFontAtlas extends Struct {
  /// Enum ImFontAtlasFlags
  @Uint32()
  external int flags;

  @IntPtr()
  external int texID;

  @Int32()
  external int texDesiredWidth;

  @Int32()
  external int texGlyphPadding;

  @Uint8()
  external int locked;

  external Pointer<Void> userData;

  @Uint8()
  external int texReady;

  @Uint8()
  external int texPixelsUseColors;

  external Pointer<Uint8> texPixelsAlpha8;

  external Pointer<Uint32> texPixelsRGBA32;

  @Int32()
  external int texWidth;

  @Int32()
  external int texHeight;

  external Vector2 texUvScale;

  external Vector2 texUvWhitePixel;

  external ImVector fonts;

  external ImVector customRects;

  external ImVector configData;

  external Vector4 texUvLines_0;
  external Vector4 texUvLines_1;
  external Vector4 texUvLines_2;
  external Vector4 texUvLines_3;
  external Vector4 texUvLines_4;
  external Vector4 texUvLines_5;
  external Vector4 texUvLines_6;
  external Vector4 texUvLines_7;
  external Vector4 texUvLines_8;
  external Vector4 texUvLines_9;
  external Vector4 texUvLines_10;
  external Vector4 texUvLines_11;
  external Vector4 texUvLines_12;
  external Vector4 texUvLines_13;
  external Vector4 texUvLines_14;
  external Vector4 texUvLines_15;
  external Vector4 texUvLines_16;
  external Vector4 texUvLines_17;
  external Vector4 texUvLines_18;
  external Vector4 texUvLines_19;
  external Vector4 texUvLines_20;
  external Vector4 texUvLines_21;
  external Vector4 texUvLines_22;
  external Vector4 texUvLines_23;
  external Vector4 texUvLines_24;
  external Vector4 texUvLines_25;
  external Vector4 texUvLines_26;
  external Vector4 texUvLines_27;
  external Vector4 texUvLines_28;
  external Vector4 texUvLines_29;
  external Vector4 texUvLines_30;
  external Vector4 texUvLines_31;
  external Vector4 texUvLines_32;
  external Vector4 texUvLines_33;
  external Vector4 texUvLines_34;
  external Vector4 texUvLines_35;
  external Vector4 texUvLines_36;
  external Vector4 texUvLines_37;
  external Vector4 texUvLines_38;
  external Vector4 texUvLines_39;
  external Vector4 texUvLines_40;
  external Vector4 texUvLines_41;
  external Vector4 texUvLines_42;
  external Vector4 texUvLines_43;
  external Vector4 texUvLines_44;
  external Vector4 texUvLines_45;
  external Vector4 texUvLines_46;
  external Vector4 texUvLines_47;
  external Vector4 texUvLines_48;
  external Vector4 texUvLines_49;
  external Vector4 texUvLines_50;
  external Vector4 texUvLines_51;
  external Vector4 texUvLines_52;
  external Vector4 texUvLines_53;
  external Vector4 texUvLines_54;
  external Vector4 texUvLines_55;
  external Vector4 texUvLines_56;
  external Vector4 texUvLines_57;
  external Vector4 texUvLines_58;
  external Vector4 texUvLines_59;
  external Vector4 texUvLines_60;
  external Vector4 texUvLines_61;
  external Vector4 texUvLines_62;
  external Vector4 texUvLines_63;

  external Pointer<IntPtr> fontBuilderIO;

  @Uint32()
  external int fontBuilderFlags;

  @Int32()
  external int packIdMouseCursors;

  @Int32()
  external int packIdLines;
}
class ImFontAtlasCustomRect extends Struct {
  @Uint16()
  external int x;

  @Uint16()
  external int y;

  @Uint16()
  external int width;

  @Uint16()
  external int height;

  @Uint32()
  external int glyphID;

  @Uint32()
  external int glyphColored;

  @Float()
  external double glyphAdvanceX;

  external Vector2 glyphOffset;

  external Pointer<ImFont> font;
}
class ImFontConfig extends Struct {
  external Pointer<Void> fontData;

  @Int32()
  external int fontDataSize;

  @Uint8()
  external int fontDataOwnedByAtlas;

  @Int32()
  external int fontNo;

  @Float()
  external double sizePixels;

  @Int32()
  external int oversampleH;

  @Int32()
  external int oversampleV;

  @Uint8()
  external int pixelSnapH;

  external Vector2 glyphExtraSpacing;

  external Vector2 glyphOffset;

  external Pointer<Uint16> glyphRanges;

  @Float()
  external double glyphMinAdvanceX;

  @Float()
  external double glyphMaxAdvanceX;

  @Uint8()
  external int mergeMode;

  @Uint32()
  external int fontBuilderFlags;

  @Float()
  external double rasterizerMultiply;

  @Float()
  external double rasterizerDensity;

  @Uint16()
  external int ellipsisChar;

  @Array(40)
  external Array<byte> Name;

  external Pointer<ImFont> dstFont;
}
class ImFontGlyph extends Struct {
  @Uint32()
  external int colored;

  @Uint32()
  external int visible;

  @Uint32()
  external int codepoint;

  @Float()
  external double advanceX;

  @Float()
  external double x0;

  @Float()
  external double y0;

  @Float()
  external double x1;

  @Float()
  external double y1;

  @Float()
  external double u0;

  @Float()
  external double v0;

  @Float()
  external double u1;

  @Float()
  external double v1;
}
class ImFontGlyphRangesBuilder extends Struct {
  external ImVector usedChars;
}
class ImGuiIO extends Struct {
  /// Enum ImGuiConfigFlags
  @Uint32()
  external int configFlags;

  /// Enum ImGuiBackendFlags
  @Uint32()
  external int backendFlags;

  external Vector2 displaySize;

  @Float()
  external double deltaTime;

  @Float()
  external double iniSavingRate;

  external Pointer<Uint8> iniFilename;

  external Pointer<Uint8> logFilename;

  external Pointer<Void> userData;

  external Pointer<ImFontAtlas> fonts;

  @Float()
  external double fontGlobalScale;

  @Uint8()
  external int fontAllowUserScaling;

  external Pointer<ImFont> fontDefault;

  external Vector2 displayFramebufferScale;

  @Uint8()
  external int configNavSwapGamepadButtons;

  @Uint8()
  external int configNavMoveSetMousePos;

  @Uint8()
  external int configNavCaptureKeyboard;

  @Uint8()
  external int configNavEscapeClearFocusItem;

  @Uint8()
  external int configNavEscapeClearFocusWindow;

  @Uint8()
  external int configNavCursorVisibleAuto;

  @Uint8()
  external int configNavCursorVisibleAlways;

  @Uint8()
  external int configDockingNoSplit;

  @Uint8()
  external int configDockingWithShift;

  @Uint8()
  external int configDockingAlwaysTabBar;

  @Uint8()
  external int configDockingTransparentPayload;

  @Uint8()
  external int configViewportsNoAutoMerge;

  @Uint8()
  external int configViewportsNoTaskBarIcon;

  @Uint8()
  external int configViewportsNoDecoration;

  @Uint8()
  external int configViewportsNoDefaultParent;

  @Uint8()
  external int mouseDrawCursor;

  @Uint8()
  external int configMacOSXBehaviors;

  @Uint8()
  external int configInputTrickleEventQueue;

  @Uint8()
  external int configInputTextCursorBlink;

  @Uint8()
  external int configInputTextEnterKeepActive;

  @Uint8()
  external int configDragClickToInputText;

  @Uint8()
  external int configWindowsResizeFromEdges;

  @Uint8()
  external int configWindowsMoveFromTitleBarOnly;

  @Uint8()
  external int configWindowsCopyContentsWithCtrlC;

  @Uint8()
  external int configScrollbarScrollByPage;

  @Float()
  external double configMemoryCompactTimer;

  @Float()
  external double mouseDoubleClickTime;

  @Float()
  external double mouseDoubleClickMaxDist;

  @Float()
  external double mouseDragThreshold;

  @Float()
  external double keyRepeatDelay;

  @Float()
  external double keyRepeatRate;

  @Uint8()
  external int configErrorRecovery;

  @Uint8()
  external int configErrorRecoveryEnableAssert;

  @Uint8()
  external int configErrorRecoveryEnableDebugLog;

  @Uint8()
  external int configErrorRecoveryEnableTooltip;

  @Uint8()
  external int configDebugIsDebuggerPresent;

  @Uint8()
  external int configDebugHighlightIdConflicts;

  @Uint8()
  external int configDebugBeginReturnValueOnce;

  @Uint8()
  external int configDebugBeginReturnValueLoop;

  @Uint8()
  external int configDebugIgnoreFocusLoss;

  @Uint8()
  external int configDebugIniSettings;

  external Pointer<Uint8> backendPlatformName;

  external Pointer<Uint8> backendRendererName;

  external Pointer<Void> backendPlatformUserData;

  external Pointer<Void> backendRendererUserData;

  external Pointer<Void> backendLanguageUserData;

  @Uint8()
  external int wantCaptureMouse;

  @Uint8()
  external int wantCaptureKeyboard;

  @Uint8()
  external int wantTextInput;

  @Uint8()
  external int wantSetMousePos;

  @Uint8()
  external int wantSaveIniSettings;

  @Uint8()
  external int navActive;

  @Uint8()
  external int navVisible;

  @Float()
  external double framerate;

  @Int32()
  external int metricsRenderVertices;

  @Int32()
  external int metricsRenderIndices;

  @Int32()
  external int metricsRenderWindows;

  @Int32()
  external int metricsActiveWindows;

  external Vector2 mouseDelta;

  @IntPtr()
  external int ctx;

  external Vector2 mousePos;

  @Array(5)
  external Array<byte> MouseDown;

  @Float()
  external double mouseWheel;

  @Float()
  external double mouseWheelH;

  /// Enum ImGuiMouseSource
  @Uint32()
  external int mouseSource;

  @Uint32()
  external int mouseHoveredViewport;

  @Uint8()
  external int keyCtrl;

  @Uint8()
  external int keyShift;

  @Uint8()
  external int keyAlt;

  @Uint8()
  external int keySuper;

  /// Enum ImGuiKey
  @Uint32()
  external int keyMods;

  external ImGuiKeyData keysData_0;
  external ImGuiKeyData keysData_1;
  external ImGuiKeyData keysData_2;
  external ImGuiKeyData keysData_3;
  external ImGuiKeyData keysData_4;
  external ImGuiKeyData keysData_5;
  external ImGuiKeyData keysData_6;
  external ImGuiKeyData keysData_7;
  external ImGuiKeyData keysData_8;
  external ImGuiKeyData keysData_9;
  external ImGuiKeyData keysData_10;
  external ImGuiKeyData keysData_11;
  external ImGuiKeyData keysData_12;
  external ImGuiKeyData keysData_13;
  external ImGuiKeyData keysData_14;
  external ImGuiKeyData keysData_15;
  external ImGuiKeyData keysData_16;
  external ImGuiKeyData keysData_17;
  external ImGuiKeyData keysData_18;
  external ImGuiKeyData keysData_19;
  external ImGuiKeyData keysData_20;
  external ImGuiKeyData keysData_21;
  external ImGuiKeyData keysData_22;
  external ImGuiKeyData keysData_23;
  external ImGuiKeyData keysData_24;
  external ImGuiKeyData keysData_25;
  external ImGuiKeyData keysData_26;
  external ImGuiKeyData keysData_27;
  external ImGuiKeyData keysData_28;
  external ImGuiKeyData keysData_29;
  external ImGuiKeyData keysData_30;
  external ImGuiKeyData keysData_31;
  external ImGuiKeyData keysData_32;
  external ImGuiKeyData keysData_33;
  external ImGuiKeyData keysData_34;
  external ImGuiKeyData keysData_35;
  external ImGuiKeyData keysData_36;
  external ImGuiKeyData keysData_37;
  external ImGuiKeyData keysData_38;
  external ImGuiKeyData keysData_39;
  external ImGuiKeyData keysData_40;
  external ImGuiKeyData keysData_41;
  external ImGuiKeyData keysData_42;
  external ImGuiKeyData keysData_43;
  external ImGuiKeyData keysData_44;
  external ImGuiKeyData keysData_45;
  external ImGuiKeyData keysData_46;
  external ImGuiKeyData keysData_47;
  external ImGuiKeyData keysData_48;
  external ImGuiKeyData keysData_49;
  external ImGuiKeyData keysData_50;
  external ImGuiKeyData keysData_51;
  external ImGuiKeyData keysData_52;
  external ImGuiKeyData keysData_53;
  external ImGuiKeyData keysData_54;
  external ImGuiKeyData keysData_55;
  external ImGuiKeyData keysData_56;
  external ImGuiKeyData keysData_57;
  external ImGuiKeyData keysData_58;
  external ImGuiKeyData keysData_59;
  external ImGuiKeyData keysData_60;
  external ImGuiKeyData keysData_61;
  external ImGuiKeyData keysData_62;
  external ImGuiKeyData keysData_63;
  external ImGuiKeyData keysData_64;
  external ImGuiKeyData keysData_65;
  external ImGuiKeyData keysData_66;
  external ImGuiKeyData keysData_67;
  external ImGuiKeyData keysData_68;
  external ImGuiKeyData keysData_69;
  external ImGuiKeyData keysData_70;
  external ImGuiKeyData keysData_71;
  external ImGuiKeyData keysData_72;
  external ImGuiKeyData keysData_73;
  external ImGuiKeyData keysData_74;
  external ImGuiKeyData keysData_75;
  external ImGuiKeyData keysData_76;
  external ImGuiKeyData keysData_77;
  external ImGuiKeyData keysData_78;
  external ImGuiKeyData keysData_79;
  external ImGuiKeyData keysData_80;
  external ImGuiKeyData keysData_81;
  external ImGuiKeyData keysData_82;
  external ImGuiKeyData keysData_83;
  external ImGuiKeyData keysData_84;
  external ImGuiKeyData keysData_85;
  external ImGuiKeyData keysData_86;
  external ImGuiKeyData keysData_87;
  external ImGuiKeyData keysData_88;
  external ImGuiKeyData keysData_89;
  external ImGuiKeyData keysData_90;
  external ImGuiKeyData keysData_91;
  external ImGuiKeyData keysData_92;
  external ImGuiKeyData keysData_93;
  external ImGuiKeyData keysData_94;
  external ImGuiKeyData keysData_95;
  external ImGuiKeyData keysData_96;
  external ImGuiKeyData keysData_97;
  external ImGuiKeyData keysData_98;
  external ImGuiKeyData keysData_99;
  external ImGuiKeyData keysData_100;
  external ImGuiKeyData keysData_101;
  external ImGuiKeyData keysData_102;
  external ImGuiKeyData keysData_103;
  external ImGuiKeyData keysData_104;
  external ImGuiKeyData keysData_105;
  external ImGuiKeyData keysData_106;
  external ImGuiKeyData keysData_107;
  external ImGuiKeyData keysData_108;
  external ImGuiKeyData keysData_109;
  external ImGuiKeyData keysData_110;
  external ImGuiKeyData keysData_111;
  external ImGuiKeyData keysData_112;
  external ImGuiKeyData keysData_113;
  external ImGuiKeyData keysData_114;
  external ImGuiKeyData keysData_115;
  external ImGuiKeyData keysData_116;
  external ImGuiKeyData keysData_117;
  external ImGuiKeyData keysData_118;
  external ImGuiKeyData keysData_119;
  external ImGuiKeyData keysData_120;
  external ImGuiKeyData keysData_121;
  external ImGuiKeyData keysData_122;
  external ImGuiKeyData keysData_123;
  external ImGuiKeyData keysData_124;
  external ImGuiKeyData keysData_125;
  external ImGuiKeyData keysData_126;
  external ImGuiKeyData keysData_127;
  external ImGuiKeyData keysData_128;
  external ImGuiKeyData keysData_129;
  external ImGuiKeyData keysData_130;
  external ImGuiKeyData keysData_131;
  external ImGuiKeyData keysData_132;
  external ImGuiKeyData keysData_133;
  external ImGuiKeyData keysData_134;
  external ImGuiKeyData keysData_135;
  external ImGuiKeyData keysData_136;
  external ImGuiKeyData keysData_137;
  external ImGuiKeyData keysData_138;
  external ImGuiKeyData keysData_139;
  external ImGuiKeyData keysData_140;
  external ImGuiKeyData keysData_141;
  external ImGuiKeyData keysData_142;
  external ImGuiKeyData keysData_143;
  external ImGuiKeyData keysData_144;
  external ImGuiKeyData keysData_145;
  external ImGuiKeyData keysData_146;
  external ImGuiKeyData keysData_147;
  external ImGuiKeyData keysData_148;
  external ImGuiKeyData keysData_149;
  external ImGuiKeyData keysData_150;
  external ImGuiKeyData keysData_151;
  external ImGuiKeyData keysData_152;
  external ImGuiKeyData keysData_153;

  @Uint8()
  external int wantCaptureMouseUnlessPopupClose;

  external Vector2 mousePosPrev;

  external Vector2 mouseClickedPos_0;
  external Vector2 mouseClickedPos_1;
  external Vector2 mouseClickedPos_2;
  external Vector2 mouseClickedPos_3;
  external Vector2 mouseClickedPos_4;

  @Array(5)
  external Array<double> MouseClickedTime;

  @Array(5)
  external Array<byte> MouseClicked;

  @Array(5)
  external Array<byte> MouseDoubleClicked;

  @Array(5)
  external Array<ushort> MouseClickedCount;

  @Array(5)
  external Array<ushort> MouseClickedLastCount;

  @Array(5)
  external Array<byte> MouseReleased;

  @Array(5)
  external Array<byte> MouseDownOwned;

  @Array(5)
  external Array<byte> MouseDownOwnedUnlessPopupClose;

  @Uint8()
  external int mouseWheelRequestAxisSwap;

  @Uint8()
  external int mouseCtrlLeftAsRightClick;

  @Array(5)
  external Array<float> MouseDownDuration;

  @Array(5)
  external Array<float> MouseDownDurationPrev;

  external Vector2 mouseDragMaxDistanceAbs_0;
  external Vector2 mouseDragMaxDistanceAbs_1;
  external Vector2 mouseDragMaxDistanceAbs_2;
  external Vector2 mouseDragMaxDistanceAbs_3;
  external Vector2 mouseDragMaxDistanceAbs_4;

  @Array(5)
  external Array<float> MouseDragMaxDistanceSqr;

  @Float()
  external double penPressure;

  @Uint8()
  external int appFocusLost;

  @Uint8()
  external int appAcceptingEvents;

  @Uint16()
  external int inputQueueSurrogate;

  external ImVector inputQueueCharacters;
}
class ImGuiInputTextCallbackData extends Struct {
  @IntPtr()
  external int ctx;

  /// Enum ImGuiInputTextFlags
  @Uint32()
  external int eventFlag;

  /// Enum ImGuiInputTextFlags
  @Uint32()
  external int flags;

  external Pointer<Void> userData;

  @Uint16()
  external int eventChar;

  /// Enum ImGuiKey
  @Uint32()
  external int eventKey;

  external Pointer<Uint8> buf;

  @Int32()
  external int bufTextLen;

  @Int32()
  external int bufSize;

  @Uint8()
  external int bufDirty;

  @Int32()
  external int cursorPos;

  @Int32()
  external int selectionStart;

  @Int32()
  external int selectionEnd;
}
class ImGuiKeyData extends Struct {
  @Uint8()
  external int down;

  @Float()
  external double downDuration;

  @Float()
  external double downDurationPrev;

  @Float()
  external double analogValue;
}
class ImGuiListClipper extends Struct {
  @IntPtr()
  external int ctx;

  @Int32()
  external int displayStart;

  @Int32()
  external int displayEnd;

  @Int32()
  external int itemsCount;

  @Float()
  external double itemsHeight;

  @Float()
  external double startPosY;

  @Double()
  external double startSeekOffsetY;

  external Pointer<Void> tempData;
}
class ImGuiMultiSelectIO extends Struct {
  external ImVector requests;

  @Int64()
  external int rangeSrcItem;

  @Int64()
  external int navIdItem;

  @Uint8()
  external int navIdSelected;

  @Uint8()
  external int rangeSrcReset;

  @Int32()
  external int itemsCount;
}
class ImGuiOnceUponAFrame extends Struct {
  @Int32()
  external int refFrame;
}
class ImGuiPayload extends Struct {
  external Pointer<Void> data;

  @Int32()
  external int dataSize;

  @Uint32()
  external int sourceId;

  @Uint32()
  external int sourceParentId;

  @Int32()
  external int dataFrameCount;

  @Array(33)
  external Array<byte> DataType;

  @Uint8()
  external int preview;

  @Uint8()
  external int delivery;
}
class ImGuiPlatformIO extends Struct {
  external Pointer platform_GetClipboardTextFn;

  external Pointer platform_SetClipboardTextFn;

  external Pointer<Void> platform_ClipboardUserData;

  external Pointer platform_OpenInShellFn;

  external Pointer<Void> platform_OpenInShellUserData;

  external Pointer platform_SetImeDataFn;

  external Pointer<Void> platform_ImeUserData;

  @Uint16()
  external int platform_LocaleDecimalPoint;

  external Pointer<Void> renderer_RenderState;

  external Pointer platform_CreateWindow;

  external Pointer platform_DestroyWindow;

  external Pointer platform_ShowWindow;

  external Pointer platform_SetWindowPos;

  external Pointer platform_GetWindowPos;

  external Pointer platform_SetWindowSize;

  external Pointer platform_GetWindowSize;

  external Pointer platform_SetWindowFocus;

  external Pointer platform_GetWindowFocus;

  external Pointer platform_GetWindowMinimized;

  external Pointer platform_SetWindowTitle;

  external Pointer platform_SetWindowAlpha;

  external Pointer platform_UpdateWindow;

  external Pointer platform_RenderWindow;

  external Pointer platform_SwapBuffers;

  external Pointer platform_GetWindowDpiScale;

  external Pointer platform_OnChangedViewport;

  external Pointer platform_GetWindowWorkAreaInsets;

  external Pointer platform_CreateVkSurface;

  external Pointer renderer_CreateWindow;

  external Pointer renderer_DestroyWindow;

  external Pointer renderer_SetWindowSize;

  external Pointer renderer_RenderWindow;

  external Pointer renderer_SwapBuffers;

  external ImVector monitors;

  external ImVector viewports;
}
class ImGuiPlatformImeData extends Struct {
  @Uint8()
  external int wantVisible;

  external Vector2 inputPos;

  @Float()
  external double inputLineHeight;
}
class ImGuiPlatformMonitor extends Struct {
  external Vector2 mainPos;

  external Vector2 mainSize;

  external Vector2 workPos;

  external Vector2 workSize;

  @Float()
  external double dpiScale;

  external Pointer<Void> platformHandle;
}
class ImGuiSelectionBasicStorage extends Struct {
  @Int32()
  external int size;

  @Uint8()
  external int preserveOrder;

  external Pointer<Void> userData;

  external Pointer adapterIndexToStorageId;

  @Int32()
  external int _SelectionOrder;

  external ImGuiStorage _Storage;
}
class ImGuiSelectionExternalStorage extends Struct {
  external Pointer<Void> userData;

  external Pointer adapterSetItemSelected;
}
class ImGuiSelectionRequest extends Struct {
  /// Enum ImGuiSelectionRequestType
  @Uint32()
  external int type;

  @Uint8()
  external int selected;

  @Int8()
  external int rangeDirection;

  @Int64()
  external int rangeFirstItem;

  @Int64()
  external int rangeLastItem;
}
class ImGuiSizeCallbackData extends Struct {
  external Pointer<Void> userData;

  external Vector2 pos;

  external Vector2 currentSize;

  external Vector2 desiredSize;
}
class ImGuiStorage extends Struct {
  external ImVector data;
}
class ImGuiStyle extends Struct {
  @Float()
  external double alpha;

  @Float()
  external double disabledAlpha;

  external Vector2 windowPadding;

  @Float()
  external double windowRounding;

  @Float()
  external double windowBorderSize;

  external Vector2 windowMinSize;

  external Vector2 windowTitleAlign;

  /// Enum ImGuiDir
  @Uint32()
  external int windowMenuButtonPosition;

  @Float()
  external double childRounding;

  @Float()
  external double childBorderSize;

  @Float()
  external double popupRounding;

  @Float()
  external double popupBorderSize;

  external Vector2 framePadding;

  @Float()
  external double frameRounding;

  @Float()
  external double frameBorderSize;

  external Vector2 itemSpacing;

  external Vector2 itemInnerSpacing;

  external Vector2 cellPadding;

  external Vector2 touchExtraPadding;

  @Float()
  external double indentSpacing;

  @Float()
  external double columnsMinSpacing;

  @Float()
  external double scrollbarSize;

  @Float()
  external double scrollbarRounding;

  @Float()
  external double grabMinSize;

  @Float()
  external double grabRounding;

  @Float()
  external double logSliderDeadzone;

  @Float()
  external double tabRounding;

  @Float()
  external double tabBorderSize;

  @Float()
  external double tabMinWidthForCloseButton;

  @Float()
  external double tabBarBorderSize;

  @Float()
  external double tabBarOverlineSize;

  @Float()
  external double tableAngledHeadersAngle;

  external Vector2 tableAngledHeadersTextAlign;

  /// Enum ImGuiDir
  @Uint32()
  external int colorButtonPosition;

  external Vector2 buttonTextAlign;

  external Vector2 selectableTextAlign;

  @Float()
  external double separatorTextBorderSize;

  external Vector2 separatorTextAlign;

  external Vector2 separatorTextPadding;

  external Vector2 displayWindowPadding;

  external Vector2 displaySafeAreaPadding;

  @Float()
  external double dockingSeparatorSize;

  @Float()
  external double mouseCursorScale;

  @Uint8()
  external int antiAliasedLines;

  @Uint8()
  external int antiAliasedLinesUseTex;

  @Uint8()
  external int antiAliasedFill;

  @Float()
  external double curveTessellationTol;

  @Float()
  external double circleTessellationMaxError;

  external Vector4 colors_0;
  external Vector4 colors_1;
  external Vector4 colors_2;
  external Vector4 colors_3;
  external Vector4 colors_4;
  external Vector4 colors_5;
  external Vector4 colors_6;
  external Vector4 colors_7;
  external Vector4 colors_8;
  external Vector4 colors_9;
  external Vector4 colors_10;
  external Vector4 colors_11;
  external Vector4 colors_12;
  external Vector4 colors_13;
  external Vector4 colors_14;
  external Vector4 colors_15;
  external Vector4 colors_16;
  external Vector4 colors_17;
  external Vector4 colors_18;
  external Vector4 colors_19;
  external Vector4 colors_20;
  external Vector4 colors_21;
  external Vector4 colors_22;
  external Vector4 colors_23;
  external Vector4 colors_24;
  external Vector4 colors_25;
  external Vector4 colors_26;
  external Vector4 colors_27;
  external Vector4 colors_28;
  external Vector4 colors_29;
  external Vector4 colors_30;
  external Vector4 colors_31;
  external Vector4 colors_32;
  external Vector4 colors_33;
  external Vector4 colors_34;
  external Vector4 colors_35;
  external Vector4 colors_36;
  external Vector4 colors_37;
  external Vector4 colors_38;
  external Vector4 colors_39;
  external Vector4 colors_40;
  external Vector4 colors_41;
  external Vector4 colors_42;
  external Vector4 colors_43;
  external Vector4 colors_44;
  external Vector4 colors_45;
  external Vector4 colors_46;
  external Vector4 colors_47;
  external Vector4 colors_48;
  external Vector4 colors_49;
  external Vector4 colors_50;
  external Vector4 colors_51;
  external Vector4 colors_52;
  external Vector4 colors_53;
  external Vector4 colors_54;
  external Vector4 colors_55;
  external Vector4 colors_56;
  external Vector4 colors_57;

  @Float()
  external double hoverStationaryDelay;

  @Float()
  external double hoverDelayShort;

  @Float()
  external double hoverDelayNormal;

  /// Enum ImGuiHoveredFlags
  @Uint32()
  external int hoverFlagsForTooltipMouse;

  /// Enum ImGuiHoveredFlags
  @Uint32()
  external int hoverFlagsForTooltipNav;
}
class ImGuiTableColumnSortSpecs extends Struct {
  @Uint32()
  external int columnUserID;

  @Int16()
  external int columnIndex;

  @Int16()
  external int sortOrder;

  /// Enum ImGuiSortDirection
  @Uint32()
  external int sortDirection;
}
class ImGuiTableSortSpecs extends Struct {
  external Pointer<ImGuiTableColumnSortSpecs> specs;

  @Int32()
  external int specsCount;

  @Uint8()
  external int specsDirty;
}
class ImGuiTextBuffer extends Struct {
  external ImVector buf;
}
class ImGuiTextFilter extends Struct {
  @Array(256)
  external Array<byte> InputBuf;

  external ImVector filters;

  @Int32()
  external int countGrep;
}
class ImGuiTextRange extends Struct {
  external Pointer<Uint8> b;

  external Pointer<Uint8> e;
}
class ImGuiViewport extends Struct {
  @Uint32()
  external int iD;

  /// Enum ImGuiViewportFlags
  @Uint32()
  external int flags;

  external Vector2 pos;

  external Vector2 size;

  external Vector2 workPos;

  external Vector2 workSize;

  @Float()
  external double dpiScale;

  @Uint32()
  external int parentViewportId;

  external Pointer<ImDrawData> drawData;

  external Pointer<Void> rendererUserData;

  external Pointer<Void> platformUserData;

  external Pointer<Void> platformHandle;

  external Pointer<Void> platformHandleRaw;

  @Uint8()
  external int platformWindowCreated;

  @Uint8()
  external int platformRequestMove;

  @Uint8()
  external int platformRequestResize;

  @Uint8()
  external int platformRequestClose;
}
class ImGuiWindowClass extends Struct {
  @Uint32()
  external int classId;

  @Uint32()
  external int parentViewportId;

  @Uint32()
  external int focusRouteParentWindowId;

  /// Enum ImGuiViewportFlags
  @Uint32()
  external int viewportFlagsOverrideSet;

  /// Enum ImGuiViewportFlags
  @Uint32()
  external int viewportFlagsOverrideClear;

  /// Enum ImGuiTabItemFlags
  @Uint32()
  external int tabItemFlagsOverrideSet;

  /// Enum ImGuiDockNodeFlags
  @Uint32()
  external int dockNodeFlagsOverrideSet;

  @Uint8()
  external int dockingAlwaysTabBar;

  @Uint8()
  external int dockingAllowUnclassed;
}
//endregion

//region Enums
class ImDrawFlags {
  const int None = 0;
  const int Closed = 1;
  const int RoundCornersTopLeft = 16;
  const int RoundCornersTopRight = 32;
  const int RoundCornersBottomLeft = 64;
  const int RoundCornersBottomRight = 128;
  const int RoundCornersNone = 256;
  const int RoundCornersTop = 48;
  const int RoundCornersBottom = 192;
  const int RoundCornersLeft = 80;
  const int RoundCornersRight = 160;
  const int RoundCornersAll = 240;
  const int RoundCornersDefault = 240;
  const int RoundCornersMask = 496;
}
class ImDrawListFlags {
  const int None = 0;
  const int AntiAliasedLines = 1;
  const int AntiAliasedLinesUseTex = 2;
  const int AntiAliasedFill = 4;
  const int AllowVtxOffset = 8;
}
class ImFontAtlasFlags {
  const int None = 0;
  const int NoPowerOfTwoHeight = 1;
  const int NoMouseCursors = 2;
  const int NoBakedLines = 4;
}
class ImGuiBackendFlags {
  const int None = 0;
  const int HasGamepad = 1;
  const int HasMouseCursors = 2;
  const int HasSetMousePos = 4;
  const int RendererHasVtxOffset = 8;
  const int PlatformHasViewports = 1024;
  const int HasMouseHoveredViewport = 2048;
  const int RendererHasViewports = 4096;
}
class ImGuiButtonFlags {
  const int None = 0;
  const int MouseButtonLeft = 1;
  const int MouseButtonRight = 2;
  const int MouseButtonMiddle = 4;
  const int MouseButtonMask = 7;
  const int EnableNav = 8;
}
class ImGuiChildFlags {
  const int None = 0;
  const int Borders = 1;
  const int AlwaysUseWindowPadding = 2;
  const int ResizeX = 4;
  const int ResizeY = 8;
  const int AutoResizeX = 16;
  const int AutoResizeY = 32;
  const int AlwaysAutoResize = 64;
  const int FrameStyle = 128;
  const int NavFlattened = 256;
}
class ImGuiCol {
  const int Text = 0;
  const int TextDisabled = 1;
  const int WindowBg = 2;
  const int ChildBg = 3;
  const int PopupBg = 4;
  const int Border = 5;
  const int BorderShadow = 6;
  const int FrameBg = 7;
  const int FrameBgHovered = 8;
  const int FrameBgActive = 9;
  const int TitleBg = 10;
  const int TitleBgActive = 11;
  const int TitleBgCollapsed = 12;
  const int MenuBarBg = 13;
  const int ScrollbarBg = 14;
  const int ScrollbarGrab = 15;
  const int ScrollbarGrabHovered = 16;
  const int ScrollbarGrabActive = 17;
  const int CheckMark = 18;
  const int SliderGrab = 19;
  const int SliderGrabActive = 20;
  const int Button = 21;
  const int ButtonHovered = 22;
  const int ButtonActive = 23;
  const int Header = 24;
  const int HeaderHovered = 25;
  const int HeaderActive = 26;
  const int Separator = 27;
  const int SeparatorHovered = 28;
  const int SeparatorActive = 29;
  const int ResizeGrip = 30;
  const int ResizeGripHovered = 31;
  const int ResizeGripActive = 32;
  const int TabHovered = 33;
  const int Tab = 34;
  const int TabSelected = 35;
  const int TabSelectedOverline = 36;
  const int TabDimmed = 37;
  const int TabDimmedSelected = 38;
  const int TabDimmedSelectedOverline = 39;
  const int DockingPreview = 40;
  const int DockingEmptyBg = 41;
  const int PlotLines = 42;
  const int PlotLinesHovered = 43;
  const int PlotHistogram = 44;
  const int PlotHistogramHovered = 45;
  const int TableHeaderBg = 46;
  const int TableBorderStrong = 47;
  const int TableBorderLight = 48;
  const int TableRowBg = 49;
  const int TableRowBgAlt = 50;
  const int TextLink = 51;
  const int TextSelectedBg = 52;
  const int DragDropTarget = 53;
  const int NavCursor = 54;
  const int NavWindowingHighlight = 55;
  const int NavWindowingDimBg = 56;
  const int ModalWindowDimBg = 57;
  const int COUNT = 58;
}
class ImGuiColorEditFlags {
  const int None = 0;
  const int NoAlpha = 2;
  const int NoPicker = 4;
  const int NoOptions = 8;
  const int NoSmallPreview = 16;
  const int NoInputs = 32;
  const int NoTooltip = 64;
  const int NoLabel = 128;
  const int NoSidePreview = 256;
  const int NoDragDrop = 512;
  const int NoBorder = 1024;
  const int AlphaBar = 65536;
  const int AlphaPreview = 131072;
  const int AlphaPreviewHalf = 262144;
  const int HDR = 524288;
  const int DisplayRGB = 1048576;
  const int DisplayHSV = 2097152;
  const int DisplayHex = 4194304;
  const int Uint8 = 8388608;
  const int Float = 16777216;
  const int PickerHueBar = 33554432;
  const int PickerHueWheel = 67108864;
  const int InputRGB = 134217728;
  const int InputHSV = 268435456;
  const int DefaultOptions = 177209344;
  const int DisplayMask = 7340032;
  const int DataTypeMask = 25165824;
  const int PickerMask = 100663296;
  const int InputMask = 402653184;
}
class ImGuiComboFlags {
  const int None = 0;
  const int PopupAlignLeft = 1;
  const int HeightSmall = 2;
  const int HeightRegular = 4;
  const int HeightLarge = 8;
  const int HeightLargest = 16;
  const int NoArrowButton = 32;
  const int NoPreview = 64;
  const int WidthFitPreview = 128;
  const int HeightMask = 30;
}
class ImGuiCond {
  const int None = 0;
  const int Always = 1;
  const int Once = 2;
  const int FirstUseEver = 4;
  const int Appearing = 8;
}
class ImGuiConfigFlags {
  const int None = 0;
  const int NavEnableKeyboard = 1;
  const int NavEnableGamepad = 2;
  const int NoMouse = 16;
  const int NoMouseCursorChange = 32;
  const int NoKeyboard = 64;
  const int DockingEnable = 128;
  const int ViewportsEnable = 1024;
  const int DpiEnableScaleViewports = 16384;
  const int DpiEnableScaleFonts = 32768;
  const int IsSRGB = 1048576;
  const int IsTouchScreen = 2097152;
}
class ImGuiDataType {
  const int S8 = 0;
  const int U8 = 1;
  const int S16 = 2;
  const int U16 = 3;
  const int S32 = 4;
  const int U32 = 5;
  const int S64 = 6;
  const int U64 = 7;
  const int Float = 8;
  const int Double = 9;
  const int Bool = 10;
  const int COUNT = 11;
}
class ImGuiDir {
  const int None = -1;
  const int Left = 0;
  const int Right = 1;
  const int Up = 2;
  const int Down = 3;
  const int COUNT = 4;
}
class ImGuiDockNodeFlags {
  const int None = 0;
  const int KeepAliveOnly = 1;
  const int NoDockingOverCentralNode = 4;
  const int PassthruCentralNode = 8;
  const int NoDockingSplit = 16;
  const int NoResize = 32;
  const int AutoHideTabBar = 64;
  const int NoUndocking = 128;
}
class ImGuiDragDropFlags {
  const int None = 0;
  const int SourceNoPreviewTooltip = 1;
  const int SourceNoDisableHover = 2;
  const int SourceNoHoldToOpenOthers = 4;
  const int SourceAllowNullID = 8;
  const int SourceExtern = 16;
  const int PayloadAutoExpire = 32;
  const int PayloadNoCrossContext = 64;
  const int PayloadNoCrossProcess = 128;
  const int AcceptBeforeDelivery = 1024;
  const int AcceptNoDrawDefaultRect = 2048;
  const int AcceptNoPreviewTooltip = 4096;
  const int AcceptPeekOnly = 3072;
}
class ImGuiFocusedFlags {
  const int None = 0;
  const int ChildWindows = 1;
  const int RootWindow = 2;
  const int AnyWindow = 4;
  const int NoPopupHierarchy = 8;
  const int DockHierarchy = 16;
  const int RootAndChildWindows = 3;
}
class ImGuiFreeTypeBuilderFlags {
  const int NoHinting = 1;
  const int NoAutoHint = 2;
  const int ForceAutoHint = 4;
  const int LightHinting = 8;
  const int MonoHinting = 16;
  const int Bold = 32;
  const int Oblique = 64;
  const int Monochrome = 128;
  const int LoadColor = 256;
  const int Bitmap = 512;
}
class ImGuiHoveredFlags {
  const int None = 0;
  const int ChildWindows = 1;
  const int RootWindow = 2;
  const int AnyWindow = 4;
  const int NoPopupHierarchy = 8;
  const int DockHierarchy = 16;
  const int AllowWhenBlockedByPopup = 32;
  const int AllowWhenBlockedByActiveItem = 128;
  const int AllowWhenOverlappedByItem = 256;
  const int AllowWhenOverlappedByWindow = 512;
  const int AllowWhenDisabled = 1024;
  const int NoNavOverride = 2048;
  const int AllowWhenOverlapped = 768;
  const int RectOnly = 928;
  const int RootAndChildWindows = 3;
  const int ForTooltip = 4096;
  const int Stationary = 8192;
  const int DelayNone = 16384;
  const int DelayShort = 32768;
  const int DelayNormal = 65536;
  const int NoSharedDelay = 131072;
}
class ImGuiInputFlags {
  const int None = 0;
  const int Repeat = 1;
  const int RouteActive = 1024;
  const int RouteFocused = 2048;
  const int RouteGlobal = 4096;
  const int RouteAlways = 8192;
  const int RouteOverFocused = 16384;
  const int RouteOverActive = 32768;
  const int RouteUnlessBgFocused = 65536;
  const int RouteFromRootWindow = 131072;
  const int Tooltip = 262144;
}
class ImGuiInputTextFlags {
  const int None = 0;
  const int CharsDecimal = 1;
  const int CharsHexadecimal = 2;
  const int CharsScientific = 4;
  const int CharsUppercase = 8;
  const int CharsNoBlank = 16;
  const int AllowTabInput = 32;
  const int EnterReturnsTrue = 64;
  const int EscapeClearsAll = 128;
  const int CtrlEnterForNewLine = 256;
  const int ReadOnly = 512;
  const int Password = 1024;
  const int AlwaysOverwrite = 2048;
  const int AutoSelectAll = 4096;
  const int ParseEmptyRefVal = 8192;
  const int DisplayEmptyRefVal = 16384;
  const int NoHorizontalScroll = 32768;
  const int NoUndoRedo = 65536;
  const int ElideLeft = 131072;
  const int CallbackCompletion = 262144;
  const int CallbackHistory = 524288;
  const int CallbackAlways = 1048576;
  const int CallbackCharFilter = 2097152;
  const int CallbackResize = 4194304;
  const int CallbackEdit = 8388608;
}
class ImGuiItemFlags {
  const int None = 0;
  const int NoTabStop = 1;
  const int NoNav = 2;
  const int NoNavDefaultFocus = 4;
  const int ButtonRepeat = 8;
  const int AutoClosePopups = 16;
  const int AllowDuplicateId = 32;
}
class ImGuiKey {
  const int None = 0;
  const int NamedKey_BEGIN = 512;
  const int Tab = 512;
  const int LeftArrow = 513;
  const int RightArrow = 514;
  const int UpArrow = 515;
  const int DownArrow = 516;
  const int PageUp = 517;
  const int PageDown = 518;
  const int Home = 519;
  const int End = 520;
  const int Insert = 521;
  const int Delete = 522;
  const int Backspace = 523;
  const int Space = 524;
  const int Enter = 525;
  const int Escape = 526;
  const int LeftCtrl = 527;
  const int LeftShift = 528;
  const int LeftAlt = 529;
  const int LeftSuper = 530;
  const int RightCtrl = 531;
  const int RightShift = 532;
  const int RightAlt = 533;
  const int RightSuper = 534;
  const int Menu = 535;
  const int _0 = 536;
  const int _1 = 537;
  const int _2 = 538;
  const int _3 = 539;
  const int _4 = 540;
  const int _5 = 541;
  const int _6 = 542;
  const int _7 = 543;
  const int _8 = 544;
  const int _9 = 545;
  const int A = 546;
  const int B = 547;
  const int C = 548;
  const int D = 549;
  const int E = 550;
  const int F = 551;
  const int G = 552;
  const int H = 553;
  const int I = 554;
  const int J = 555;
  const int K = 556;
  const int L = 557;
  const int M = 558;
  const int N = 559;
  const int O = 560;
  const int P = 561;
  const int Q = 562;
  const int R = 563;
  const int S = 564;
  const int T = 565;
  const int U = 566;
  const int V = 567;
  const int W = 568;
  const int X = 569;
  const int Y = 570;
  const int Z = 571;
  const int F1 = 572;
  const int F2 = 573;
  const int F3 = 574;
  const int F4 = 575;
  const int F5 = 576;
  const int F6 = 577;
  const int F7 = 578;
  const int F8 = 579;
  const int F9 = 580;
  const int F10 = 581;
  const int F11 = 582;
  const int F12 = 583;
  const int F13 = 584;
  const int F14 = 585;
  const int F15 = 586;
  const int F16 = 587;
  const int F17 = 588;
  const int F18 = 589;
  const int F19 = 590;
  const int F20 = 591;
  const int F21 = 592;
  const int F22 = 593;
  const int F23 = 594;
  const int F24 = 595;
  const int Apostrophe = 596;
  const int Comma = 597;
  const int Minus = 598;
  const int Period = 599;
  const int Slash = 600;
  const int Semicolon = 601;
  const int Equal = 602;
  const int LeftBracket = 603;
  const int Backslash = 604;
  const int RightBracket = 605;
  const int GraveAccent = 606;
  const int CapsLock = 607;
  const int ScrollLock = 608;
  const int NumLock = 609;
  const int PrintScreen = 610;
  const int Pause = 611;
  const int Keypad0 = 612;
  const int Keypad1 = 613;
  const int Keypad2 = 614;
  const int Keypad3 = 615;
  const int Keypad4 = 616;
  const int Keypad5 = 617;
  const int Keypad6 = 618;
  const int Keypad7 = 619;
  const int Keypad8 = 620;
  const int Keypad9 = 621;
  const int KeypadDecimal = 622;
  const int KeypadDivide = 623;
  const int KeypadMultiply = 624;
  const int KeypadSubtract = 625;
  const int KeypadAdd = 626;
  const int KeypadEnter = 627;
  const int KeypadEqual = 628;
  const int AppBack = 629;
  const int AppForward = 630;
  const int GamepadStart = 631;
  const int GamepadBack = 632;
  const int GamepadFaceLeft = 633;
  const int GamepadFaceRight = 634;
  const int GamepadFaceUp = 635;
  const int GamepadFaceDown = 636;
  const int GamepadDpadLeft = 637;
  const int GamepadDpadRight = 638;
  const int GamepadDpadUp = 639;
  const int GamepadDpadDown = 640;
  const int GamepadL1 = 641;
  const int GamepadR1 = 642;
  const int GamepadL2 = 643;
  const int GamepadR2 = 644;
  const int GamepadL3 = 645;
  const int GamepadR3 = 646;
  const int GamepadLStickLeft = 647;
  const int GamepadLStickRight = 648;
  const int GamepadLStickUp = 649;
  const int GamepadLStickDown = 650;
  const int GamepadRStickLeft = 651;
  const int GamepadRStickRight = 652;
  const int GamepadRStickUp = 653;
  const int GamepadRStickDown = 654;
  const int MouseLeft = 655;
  const int MouseRight = 656;
  const int MouseMiddle = 657;
  const int MouseX1 = 658;
  const int MouseX2 = 659;
  const int MouseWheelX = 660;
  const int MouseWheelY = 661;
  const int ReservedForModCtrl = 662;
  const int ReservedForModShift = 663;
  const int ReservedForModAlt = 664;
  const int ReservedForModSuper = 665;
  const int NamedKey_END = 666;
  const int ModNone = 0;
  const int ModCtrl = 4096;
  const int ModShift = 8192;
  const int ModAlt = 16384;
  const int ModSuper = 32768;
  const int ModMask = 61440;
  const int NamedKey_COUNT = 154;
}
class ImGuiMouseButton {
  const int Left = 0;
  const int Right = 1;
  const int Middle = 2;
  const int COUNT = 5;
}
class ImGuiMouseCursor {
  const int None = -1;
  const int Arrow = 0;
  const int TextInput = 1;
  const int ResizeAll = 2;
  const int ResizeNS = 3;
  const int ResizeEW = 4;
  const int ResizeNESW = 5;
  const int ResizeNWSE = 6;
  const int Hand = 7;
  const int NotAllowed = 8;
  const int COUNT = 9;
}
class ImGuiMouseSource {
  const int Mouse = 0;
  const int TouchScreen = 1;
  const int Pen = 2;
  const int COUNT = 3;
}
class ImGuiMultiSelectFlags {
  const int None = 0;
  const int SingleSelect = 1;
  const int NoSelectAll = 2;
  const int NoRangeSelect = 4;
  const int NoAutoSelect = 8;
  const int NoAutoClear = 16;
  const int NoAutoClearOnReselect = 32;
  const int BoxSelect1d = 64;
  const int BoxSelect2d = 128;
  const int BoxSelectNoScroll = 256;
  const int ClearOnEscape = 512;
  const int ClearOnClickVoid = 1024;
  const int ScopeWindow = 2048;
  const int ScopeRect = 4096;
  const int SelectOnClick = 8192;
  const int SelectOnClickRelease = 16384;
  const int NavWrapX = 65536;
}
class ImGuiPopupFlags {
  const int None = 0;
  const int MouseButtonLeft = 0;
  const int MouseButtonRight = 1;
  const int MouseButtonMiddle = 2;
  const int MouseButtonMask = 31;
  const int MouseButtonDefault = 1;
  const int NoReopen = 32;
  const int NoOpenOverExistingPopup = 128;
  const int NoOpenOverItems = 256;
  const int AnyPopupId = 1024;
  const int AnyPopupLevel = 2048;
  const int AnyPopup = 3072;
}
class ImGuiSelectableFlags {
  const int None = 0;
  const int NoAutoClosePopups = 1;
  const int SpanAllColumns = 2;
  const int AllowDoubleClick = 4;
  const int Disabled = 8;
  const int AllowOverlap = 16;
  const int Highlight = 32;
}
class ImGuiSelectionRequestType {
  const int None = 0;
  const int SetAll = 1;
  const int SetRange = 2;
}
class ImGuiSliderFlags {
  const int None = 0;
  const int Logarithmic = 32;
  const int NoRoundToFormat = 64;
  const int NoInput = 128;
  const int WrapAround = 256;
  const int ClampOnInput = 512;
  const int ClampZeroRange = 1024;
  const int AlwaysClamp = 1536;
  const int InvalidMask = 1879048207;
}
class ImGuiSortDirection {
  const int None = 0;
  const int Ascending = 1;
  const int Descending = 2;
}
class ImGuiStyleVar {
  const int Alpha = 0;
  const int DisabledAlpha = 1;
  const int WindowPadding = 2;
  const int WindowRounding = 3;
  const int WindowBorderSize = 4;
  const int WindowMinSize = 5;
  const int WindowTitleAlign = 6;
  const int ChildRounding = 7;
  const int ChildBorderSize = 8;
  const int PopupRounding = 9;
  const int PopupBorderSize = 10;
  const int FramePadding = 11;
  const int FrameRounding = 12;
  const int FrameBorderSize = 13;
  const int ItemSpacing = 14;
  const int ItemInnerSpacing = 15;
  const int IndentSpacing = 16;
  const int CellPadding = 17;
  const int ScrollbarSize = 18;
  const int ScrollbarRounding = 19;
  const int GrabMinSize = 20;
  const int GrabRounding = 21;
  const int TabRounding = 22;
  const int TabBorderSize = 23;
  const int TabBarBorderSize = 24;
  const int TabBarOverlineSize = 25;
  const int TableAngledHeadersAngle = 26;
  const int TableAngledHeadersTextAlign = 27;
  const int ButtonTextAlign = 28;
  const int SelectableTextAlign = 29;
  const int SeparatorTextBorderSize = 30;
  const int SeparatorTextAlign = 31;
  const int SeparatorTextPadding = 32;
  const int DockingSeparatorSize = 33;
  const int COUNT = 34;
}
class ImGuiTabBarFlags {
  const int None = 0;
  const int Reorderable = 1;
  const int AutoSelectNewTabs = 2;
  const int TabListPopupButton = 4;
  const int NoCloseWithMiddleMouseButton = 8;
  const int NoTabListScrollingButtons = 16;
  const int NoTooltip = 32;
  const int DrawSelectedOverline = 64;
  const int FittingPolicyResizeDown = 128;
  const int FittingPolicyScroll = 256;
  const int FittingPolicyMask = 384;
  const int FittingPolicyDefault = 128;
}
class ImGuiTabItemFlags {
  const int None = 0;
  const int UnsavedDocument = 1;
  const int SetSelected = 2;
  const int NoCloseWithMiddleMouseButton = 4;
  const int NoPushId = 8;
  const int NoTooltip = 16;
  const int NoReorder = 32;
  const int Leading = 64;
  const int Trailing = 128;
  const int NoAssumedClosure = 256;
}
class ImGuiTableBgTarget {
  const int None = 0;
  const int RowBg0 = 1;
  const int RowBg1 = 2;
  const int CellBg = 3;
}
class ImGuiTableColumnFlags {
  const int None = 0;
  const int Disabled = 1;
  const int DefaultHide = 2;
  const int DefaultSort = 4;
  const int WidthStretch = 8;
  const int WidthFixed = 16;
  const int NoResize = 32;
  const int NoReorder = 64;
  const int NoHide = 128;
  const int NoClip = 256;
  const int NoSort = 512;
  const int NoSortAscending = 1024;
  const int NoSortDescending = 2048;
  const int NoHeaderLabel = 4096;
  const int NoHeaderWidth = 8192;
  const int PreferSortAscending = 16384;
  const int PreferSortDescending = 32768;
  const int IndentEnable = 65536;
  const int IndentDisable = 131072;
  const int AngledHeader = 262144;
  const int IsEnabled = 16777216;
  const int IsVisible = 33554432;
  const int IsSorted = 67108864;
  const int IsHovered = 134217728;
  const int WidthMask = 24;
  const int IndentMask = 196608;
  const int StatusMask = 251658240;
  const int NoDirectResize = 1073741824;
}
class ImGuiTableFlags {
  const int None = 0;
  const int Resizable = 1;
  const int Reorderable = 2;
  const int Hideable = 4;
  const int Sortable = 8;
  const int NoSavedSettings = 16;
  const int ContextMenuInBody = 32;
  const int RowBg = 64;
  const int BordersInnerH = 128;
  const int BordersOuterH = 256;
  const int BordersInnerV = 512;
  const int BordersOuterV = 1024;
  const int BordersH = 384;
  const int BordersV = 1536;
  const int BordersInner = 640;
  const int BordersOuter = 1280;
  const int Borders = 1920;
  const int NoBordersInBody = 2048;
  const int NoBordersInBodyUntilResize = 4096;
  const int SizingFixedFit = 8192;
  const int SizingFixedSame = 16384;
  const int SizingStretchProp = 24576;
  const int SizingStretchSame = 32768;
  const int NoHostExtendX = 65536;
  const int NoHostExtendY = 131072;
  const int NoKeepColumnsVisible = 262144;
  const int PreciseWidths = 524288;
  const int NoClip = 1048576;
  const int PadOuterX = 2097152;
  const int NoPadOuterX = 4194304;
  const int NoPadInnerX = 8388608;
  const int ScrollX = 16777216;
  const int ScrollY = 33554432;
  const int SortMulti = 67108864;
  const int SortTristate = 134217728;
  const int HighlightHoveredColumn = 268435456;
  const int SizingMask = 57344;
}
class ImGuiTableRowFlags {
  const int None = 0;
  const int Headers = 1;
}
class ImGuiTreeNodeFlags {
  const int None = 0;
  const int Selected = 1;
  const int Framed = 2;
  const int AllowOverlap = 4;
  const int NoTreePushOnOpen = 8;
  const int NoAutoOpenOnLog = 16;
  const int DefaultOpen = 32;
  const int OpenOnDoubleClick = 64;
  const int OpenOnArrow = 128;
  const int Leaf = 256;
  const int Bullet = 512;
  const int FramePadding = 1024;
  const int SpanAvailWidth = 2048;
  const int SpanFullWidth = 4096;
  const int SpanTextWidth = 8192;
  const int SpanAllColumns = 16384;
  const int NavLeftJumpsBackHere = 32768;
  const int CollapsingHeader = 26;
}
class ImGuiViewportFlags {
  const int None = 0;
  const int IsPlatformWindow = 1;
  const int IsPlatformMonitor = 2;
  const int OwnedByApp = 4;
  const int NoDecoration = 8;
  const int NoTaskBarIcon = 16;
  const int NoFocusOnAppearing = 32;
  const int NoFocusOnClick = 64;
  const int NoInputs = 128;
  const int NoRendererClear = 256;
  const int NoAutoMerge = 512;
  const int TopMost = 1024;
  const int CanHostOtherWindows = 2048;
  const int IsMinimized = 4096;
  const int IsFocused = 8192;
}
class ImGuiWindowFlags {
  const int None = 0;
  const int NoTitleBar = 1;
  const int NoResize = 2;
  const int NoMove = 4;
  const int NoScrollbar = 8;
  const int NoScrollWithMouse = 16;
  const int NoCollapse = 32;
  const int AlwaysAutoResize = 64;
  const int NoBackground = 128;
  const int NoSavedSettings = 256;
  const int NoMouseInputs = 512;
  const int MenuBar = 1024;
  const int HorizontalScrollbar = 2048;
  const int NoFocusOnAppearing = 4096;
  const int NoBringToFrontOnFocus = 8192;
  const int AlwaysVerticalScrollbar = 16384;
  const int AlwaysHorizontalScrollbar = 32768;
  const int NoNavInputs = 65536;
  const int NoNavFocus = 131072;
  const int UnsavedDocument = 262144;
  const int NoDocking = 524288;
  const int NoNav = 196608;
  const int NoDecoration = 43;
  const int NoInputs = 197120;
  const int ChildWindow = 16777216;
  const int Tooltip = 33554432;
  const int Popup = 67108864;
  const int Modal = 134217728;
  const int ChildMenu = 268435456;
  const int DockNodeHost = 536870912;
}
//endregion

