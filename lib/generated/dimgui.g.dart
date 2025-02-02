import 'dart:io';
import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';

import '../cimgui.g.dart';

// region Init
cImgui _initialize(String path) {
  var dll = switch (Platform.operatingSystem) {
    "windows" => "$path.dll",
    "macos" => "$path.dylib",
    "linux" => "$path.so",
    _ => throw Exception("Unsupported platform ${Platform.operatingSystem}"),
  };

  return cImgui(ffi.DynamicLibrary.open(dll));
}

final _cimgui = _initialize("resources/imgui/cimgui");
// endregion

void imVec2Destroy(
  ffi.Pointer<ImVec2> self,
) {

  _cimgui.ImVec2_destroy(
    self,
  );

}

ffi.Pointer<ImVec2> imVec2ImVec2Float(
  double x,
  double y,
) {
  ffi.Pointer<ImVec2> ret;

  ret = _cimgui.ImVec2_ImVec2_Float(
    x,
    y,
  );

  return ret;
}

ffi.Pointer<ImVec4> imVec4ImVec4Nil(
) {
  ffi.Pointer<ImVec4> ret;

  ret = _cimgui.ImVec4_ImVec4_Nil(
  );

  return ret;
}

void imVec4Destroy(
  ffi.Pointer<ImVec4> self,
) {

  _cimgui.ImVec4_destroy(
    self,
  );

}

ffi.Pointer<ImVec4> imVec4ImVec4Float(
  double x,
  double y,
  double z,
  double w,
) {
  ffi.Pointer<ImVec4> ret;

  ret = _cimgui.ImVec4_ImVec4_Float(
    x,
    y,
    z,
    w,
  );

  return ret;
}

ffi.Pointer<ImGuiContext> createContext(
  [ffi.Pointer<ImFontAtlas>? sharedFontAtlas,]
) {
  ffi.Pointer<ImGuiContext> ret;

  ret = _cimgui.igCreateContext(
    sharedFontAtlas,
  );

  return ret;
}

void destroyContext(
  [ffi.Pointer<ImGuiContext>? ctx,]
) {

  _cimgui.igDestroyContext(
    ctx,
  );

}

ffi.Pointer<ImGuiContext> getCurrentContext(
) {
  ffi.Pointer<ImGuiContext> ret;

  ret = _cimgui.igGetCurrentContext(
  );

  return ret;
}

void setCurrentContext(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igSetCurrentContext(
    ctx,
  );

}

ffi.Pointer<ImGuiIO> getIO(
) {
  ffi.Pointer<ImGuiIO> ret;

  ret = _cimgui.igGetIO(
  );

  return ret;
}

ffi.Pointer<ImGuiPlatformIO> getPlatformIO(
) {
  ffi.Pointer<ImGuiPlatformIO> ret;

  ret = _cimgui.igGetPlatformIO(
  );

  return ret;
}

ffi.Pointer<ImGuiStyle> getStyle(
) {
  ffi.Pointer<ImGuiStyle> ret;

  ret = _cimgui.igGetStyle(
  );

  return ret;
}

void newFrame(
) {

  _cimgui.igNewFrame(
  );

}

void endFrame(
) {

  _cimgui.igEndFrame(
  );

}

void render(
) {

  _cimgui.igRender(
  );

}

ffi.Pointer<ImDrawData> getDrawData(
) {
  ffi.Pointer<ImDrawData> ret;

  ret = _cimgui.igGetDrawData(
  );

  return ret;
}

void showDemoWindow(
  [ffi.Pointer<ffi.Bool>? pOpen,]
) {

  _cimgui.igShowDemoWindow(
    pOpen,
  );

}

void showMetricsWindow(
  [ffi.Pointer<ffi.Bool>? pOpen,]
) {

  _cimgui.igShowMetricsWindow(
    pOpen,
  );

}

void showDebugLogWindow(
  ffi.Pointer<ffi.Bool> pOpen,
) {

  _cimgui.igShowDebugLogWindow(
    pOpen,
  );

}

void showIDStackToolWindow(
  ffi.Pointer<ffi.Bool> pOpen,
) {

  _cimgui.igShowIDStackToolWindow(
    pOpen,
  );

}

void showAboutWindow(
  [ffi.Pointer<ffi.Bool>? pOpen,]
) {

  _cimgui.igShowAboutWindow(
    pOpen,
  );

}

void showStyleEditor(
  [ffi.Pointer<ImGuiStyle>? ref,]
) {

  _cimgui.igShowStyleEditor(
    ref,
  );

}

bool showStyleSelector(
  String label,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igShowStyleSelector(
    _label,
  );

  return ret;
}

void showFontSelector(
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igShowFontSelector(
    _label,
  );

}

void showUserGuide(
) {

  _cimgui.igShowUserGuide(
  );

}

ffi.Pointer<ffi.Char> getVersion(
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igGetVersion(
  );

  return ret;
}

void styleColorsDark(
  [ffi.Pointer<ImGuiStyle>? dst,]
) {

  _cimgui.igStyleColorsDark(
    dst,
  );

}

void styleColorsLight(
  [ffi.Pointer<ImGuiStyle>? dst,]
) {

  _cimgui.igStyleColorsLight(
    dst,
  );

}

void styleColorsClassic(
  [ffi.Pointer<ImGuiStyle>? dst,]
) {

  _cimgui.igStyleColorsClassic(
    dst,
  );

}

bool begin(
  String name,
  [ffi.Pointer<ffi.Bool>? pOpen,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBegin(
    _name,
    pOpen,
    flags,
  );

  return ret;
}

void end(
) {

  _cimgui.igEnd(
  );

}

bool beginChildStr(
  String strId,
  ImVec2 size,
  int childFlags,
  int windowFlags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginChild_Str(
    _strId,
    size,
    childFlags,
    windowFlags,
  );

  return ret;
}

bool beginChildID(
  int id,
  ImVec2 size,
  int childFlags,
  int windowFlags,
) {
  bool ret;

  ret = _cimgui.igBeginChild_ID(
    id,
    size,
    childFlags,
    windowFlags,
  );

  return ret;
}

void endChild(
) {

  _cimgui.igEndChild(
  );

}

bool isWindowAppearing(
) {
  bool ret;

  ret = _cimgui.igIsWindowAppearing(
  );

  return ret;
}

bool isWindowCollapsed(
) {
  bool ret;

  ret = _cimgui.igIsWindowCollapsed(
  );

  return ret;
}

bool isWindowFocused(
  [int flags = 0,]
) {
  bool ret;

  ret = _cimgui.igIsWindowFocused(
    flags,
  );

  return ret;
}

bool isWindowHovered(
  [int flags = 0,]
) {
  bool ret;

  ret = _cimgui.igIsWindowHovered(
    flags,
  );

  return ret;
}

ffi.Pointer<ImDrawList> getWindowDrawList(
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.igGetWindowDrawList(
  );

  return ret;
}

double getWindowDpiScale(
) {
  double ret;

  ret = _cimgui.igGetWindowDpiScale(
  );

  return ret;
}

void getWindowPos(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetWindowPos(
    pOut,
  );

}

void getWindowSize(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetWindowSize(
    pOut,
  );

}

double getWindowWidth(
) {
  double ret;

  ret = _cimgui.igGetWindowWidth(
  );

  return ret;
}

double getWindowHeight(
) {
  double ret;

  ret = _cimgui.igGetWindowHeight(
  );

  return ret;
}

ffi.Pointer<ImGuiViewport> getWindowViewport(
) {
  ffi.Pointer<ImGuiViewport> ret;

  ret = _cimgui.igGetWindowViewport(
  );

  return ret;
}

void setNextWindowPos(
  ImVec2 pos,
  [int cond = 0,
  ImVec2 pivot = ImVec2(0,0),]
) {

  _cimgui.igSetNextWindowPos(
    pos,
    cond,
    pivot,
  );

}

void setNextWindowSize(
  ImVec2 size,
  [int cond = 0,]
) {

  _cimgui.igSetNextWindowSize(
    size,
    cond,
  );

}

void setNextWindowSizeConstraints(
  ImVec2 sizeMin,
  ImVec2 sizeMax,
  [ImGuiSizeCallback? customCallback,
  ffi.Pointer<ffi.Void>? customCallbackData,]
) {

  _cimgui.igSetNextWindowSizeConstraints(
    sizeMin,
    sizeMax,
    customCallback,
    customCallbackData,
  );

}

void setNextWindowContentSize(
  ImVec2 size,
) {

  _cimgui.igSetNextWindowContentSize(
    size,
  );

}

void setNextWindowCollapsed(
  bool collapsed,
  [int cond = 0,]
) {

  _cimgui.igSetNextWindowCollapsed(
    collapsed,
    cond,
  );

}

void setNextWindowFocus(
) {

  _cimgui.igSetNextWindowFocus(
  );

}

void setNextWindowScroll(
  ImVec2 scroll,
) {

  _cimgui.igSetNextWindowScroll(
    scroll,
  );

}

void setNextWindowBgAlpha(
  double alpha,
) {

  _cimgui.igSetNextWindowBgAlpha(
    alpha,
  );

}

void setNextWindowViewport(
  int viewportId,
) {

  _cimgui.igSetNextWindowViewport(
    viewportId,
  );

}

void setWindowPosVec2(
  ImVec2 pos,
  int cond,
) {

  _cimgui.igSetWindowPos_Vec2(
    pos,
    cond,
  );

}

void setWindowSizeVec2(
  ImVec2 size,
  int cond,
) {

  _cimgui.igSetWindowSize_Vec2(
    size,
    cond,
  );

}

void setWindowCollapsedBool(
  bool collapsed,
  int cond,
) {

  _cimgui.igSetWindowCollapsed_Bool(
    collapsed,
    cond,
  );

}

void setWindowFocusNil(
) {

  _cimgui.igSetWindowFocus_Nil(
  );

}

void setWindowFontScale(
  double scale,
) {

  _cimgui.igSetWindowFontScale(
    scale,
  );

}

void setWindowPosStr(
  String name,
  ImVec2 pos,
  int cond,
) {
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetWindowPos_Str(
    _name,
    pos,
    cond,
  );

}

void setWindowSizeStr(
  String name,
  ImVec2 size,
  int cond,
) {
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetWindowSize_Str(
    _name,
    size,
    cond,
  );

}

void setWindowCollapsedStr(
  String name,
  bool collapsed,
  int cond,
) {
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetWindowCollapsed_Str(
    _name,
    collapsed,
    cond,
  );

}

void setWindowFocusStr(
  String name,
) {
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetWindowFocus_Str(
    _name,
  );

}

double getScrollX(
) {
  double ret;

  ret = _cimgui.igGetScrollX(
  );

  return ret;
}

double getScrollY(
) {
  double ret;

  ret = _cimgui.igGetScrollY(
  );

  return ret;
}

void setScrollXFloat(
  double scrollX,
) {

  _cimgui.igSetScrollX_Float(
    scrollX,
  );

}

void setScrollYFloat(
  double scrollY,
) {

  _cimgui.igSetScrollY_Float(
    scrollY,
  );

}

double getScrollMaxX(
) {
  double ret;

  ret = _cimgui.igGetScrollMaxX(
  );

  return ret;
}

double getScrollMaxY(
) {
  double ret;

  ret = _cimgui.igGetScrollMaxY(
  );

  return ret;
}

void setScrollHereX(
  [double centerXRatio = 0.5,]
) {

  _cimgui.igSetScrollHereX(
    centerXRatio,
  );

}

void setScrollHereY(
  [double centerYRatio = 0.5,]
) {

  _cimgui.igSetScrollHereY(
    centerYRatio,
  );

}

void setScrollFromPosXFloat(
  double localX,
  double centerXRatio,
) {

  _cimgui.igSetScrollFromPosX_Float(
    localX,
    centerXRatio,
  );

}

void setScrollFromPosYFloat(
  double localY,
  double centerYRatio,
) {

  _cimgui.igSetScrollFromPosY_Float(
    localY,
    centerYRatio,
  );

}

void pushFont(
  ffi.Pointer<ImFont> font,
) {

  _cimgui.igPushFont(
    font,
  );

}

void popFont(
) {

  _cimgui.igPopFont(
  );

}

void pushStyleColorU32(
  int idx,
  int col,
) {

  _cimgui.igPushStyleColor_U32(
    idx,
    col,
  );

}

void pushStyleColorVec4(
  int idx,
  ImVec4 col,
) {

  _cimgui.igPushStyleColor_Vec4(
    idx,
    col,
  );

}

void popStyleColor(
  [int count = 1,]
) {

  _cimgui.igPopStyleColor(
    count,
  );

}

void pushStyleVarFloat(
  int idx,
  double val,
) {

  _cimgui.igPushStyleVar_Float(
    idx,
    val,
  );

}

void pushStyleVarVec2(
  int idx,
  ImVec2 val,
) {

  _cimgui.igPushStyleVar_Vec2(
    idx,
    val,
  );

}

void pushStyleVarX(
  int idx,
  double valX,
) {

  _cimgui.igPushStyleVarX(
    idx,
    valX,
  );

}

void pushStyleVarY(
  int idx,
  double valY,
) {

  _cimgui.igPushStyleVarY(
    idx,
    valY,
  );

}

void popStyleVar(
  [int count = 1,]
) {

  _cimgui.igPopStyleVar(
    count,
  );

}

void pushItemFlag(
  int option,
  bool enabled,
) {

  _cimgui.igPushItemFlag(
    option,
    enabled,
  );

}

void popItemFlag(
) {

  _cimgui.igPopItemFlag(
  );

}

void pushItemWidth(
  double itemWidth,
) {

  _cimgui.igPushItemWidth(
    itemWidth,
  );

}

void popItemWidth(
) {

  _cimgui.igPopItemWidth(
  );

}

void setNextItemWidth(
  double itemWidth,
) {

  _cimgui.igSetNextItemWidth(
    itemWidth,
  );

}

double calcItemWidth(
) {
  double ret;

  ret = _cimgui.igCalcItemWidth(
  );

  return ret;
}

void pushTextWrapPos(
  [double wrapLocalPosX = 0.0,]
) {

  _cimgui.igPushTextWrapPos(
    wrapLocalPosX,
  );

}

void popTextWrapPos(
) {

  _cimgui.igPopTextWrapPos(
  );

}

ffi.Pointer<ImFont> getFont(
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.igGetFont(
  );

  return ret;
}

double getFontSize(
) {
  double ret;

  ret = _cimgui.igGetFontSize(
  );

  return ret;
}

void getFontTexUvWhitePixel(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetFontTexUvWhitePixel(
    pOut,
  );

}

int getColorU32Col(
  int idx,
  double alphaMul,
) {
  int ret;

  ret = _cimgui.igGetColorU32_Col(
    idx,
    alphaMul,
  );

  return ret;
}

int getColorU32Vec4(
  ImVec4 col,
) {
  int ret;

  ret = _cimgui.igGetColorU32_Vec4(
    col,
  );

  return ret;
}

int getColorU32U32(
  int col,
  double alphaMul,
) {
  int ret;

  ret = _cimgui.igGetColorU32_U32(
    col,
    alphaMul,
  );

  return ret;
}

ffi.Pointer<ImVec4> getStyleColorVec4(
  int idx,
) {
  ffi.Pointer<ImVec4> ret;

  ret = _cimgui.igGetStyleColorVec4(
    idx,
  );

  return ret;
}

void getCursorScreenPos(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetCursorScreenPos(
    pOut,
  );

}

void setCursorScreenPos(
  ImVec2 pos,
) {

  _cimgui.igSetCursorScreenPos(
    pos,
  );

}

void getContentRegionAvail(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetContentRegionAvail(
    pOut,
  );

}

void getCursorPos(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetCursorPos(
    pOut,
  );

}

double getCursorPosX(
) {
  double ret;

  ret = _cimgui.igGetCursorPosX(
  );

  return ret;
}

double getCursorPosY(
) {
  double ret;

  ret = _cimgui.igGetCursorPosY(
  );

  return ret;
}

void setCursorPos(
  ImVec2 localPos,
) {

  _cimgui.igSetCursorPos(
    localPos,
  );

}

void setCursorPosX(
  double localX,
) {

  _cimgui.igSetCursorPosX(
    localX,
  );

}

void setCursorPosY(
  double localY,
) {

  _cimgui.igSetCursorPosY(
    localY,
  );

}

void getCursorStartPos(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetCursorStartPos(
    pOut,
  );

}

void separator(
) {

  _cimgui.igSeparator(
  );

}

void sameLine(
  [double offsetFromStartX = 0.0,
  double spacing = -1.0,]
) {

  _cimgui.igSameLine(
    offsetFromStartX,
    spacing,
  );

}

void newLine(
) {

  _cimgui.igNewLine(
  );

}

void spacing(
) {

  _cimgui.igSpacing(
  );

}

void dummy(
  ImVec2 size,
) {

  _cimgui.igDummy(
    size,
  );

}

void indent(
  [double indentW = 0.0,]
) {

  _cimgui.igIndent(
    indentW,
  );

}

void unindent(
  [double indentW = 0.0,]
) {

  _cimgui.igUnindent(
    indentW,
  );

}

void beginGroup(
) {

  _cimgui.igBeginGroup(
  );

}

void endGroup(
) {

  _cimgui.igEndGroup(
  );

}

void alignTextToFramePadding(
) {

  _cimgui.igAlignTextToFramePadding(
  );

}

double getTextLineHeight(
) {
  double ret;

  ret = _cimgui.igGetTextLineHeight(
  );

  return ret;
}

double getTextLineHeightWithSpacing(
) {
  double ret;

  ret = _cimgui.igGetTextLineHeightWithSpacing(
  );

  return ret;
}

double getFrameHeight(
) {
  double ret;

  ret = _cimgui.igGetFrameHeight(
  );

  return ret;
}

double getFrameHeightWithSpacing(
) {
  double ret;

  ret = _cimgui.igGetFrameHeightWithSpacing(
  );

  return ret;
}

void pushIDStr(
  String strId,
) {
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPushID_Str(
    _strId,
  );

}

void pushIDStrStr(
  String strIdBegin,
  String strIdEnd,
) {
  final ffi.Pointer<ffi.Char> _strIdBegin = strIdBegin != null ? strIdBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strIdEnd = strIdEnd != null ? strIdEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPushID_StrStr(
    _strIdBegin,
    _strIdEnd,
  );

}

void pushIDPtr(
  ffi.Pointer<ffi.Void> ptrId,
) {

  _cimgui.igPushID_Ptr(
    ptrId,
  );

}

void pushIDInt(
  int intId,
) {

  _cimgui.igPushID_Int(
    intId,
  );

}

void popID(
) {

  _cimgui.igPopID(
  );

}

int getIDStr(
  String strId,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igGetID_Str(
    _strId,
  );

  return ret;
}

int getIDStrStr(
  String strIdBegin,
  String strIdEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _strIdBegin = strIdBegin != null ? strIdBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strIdEnd = strIdEnd != null ? strIdEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igGetID_StrStr(
    _strIdBegin,
    _strIdEnd,
  );

  return ret;
}

int getIDPtr(
  ffi.Pointer<ffi.Void> ptrId,
) {
  int ret;

  ret = _cimgui.igGetID_Ptr(
    ptrId,
  );

  return ret;
}

int getIDInt(
  int intId,
) {
  int ret;

  ret = _cimgui.igGetID_Int(
    intId,
  );

  return ret;
}

void textUnformatted(
  String text,
  [String? textEnd,]
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextUnformatted(
    _text,
    _textEnd,
  );

}

void text(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igText(
    _fmt,
  );

}

void textColored(
  ImVec4 col,
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextColored(
    col,
    _fmt,
  );

}

void textDisabled(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextDisabled(
    _fmt,
  );

}

void textWrapped(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextWrapped(
    _fmt,
  );

}

void labelText(
  String label,
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLabelText(
    _label,
    _fmt,
  );

}

void bulletText(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igBulletText(
    _fmt,
  );

}

void separatorText(
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSeparatorText(
    _label,
  );

}

bool button(
  String label,
  [ImVec2 size = ImVec2(0,0),]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igButton(
    _label,
    size,
  );

  return ret;
}

bool smallButton(
  String label,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSmallButton(
    _label,
  );

  return ret;
}

bool invisibleButton(
  String strId,
  ImVec2 size,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInvisibleButton(
    _strId,
    size,
    flags,
  );

  return ret;
}

bool arrowButton(
  String strId,
  ImGuiDir dir,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igArrowButton(
    _strId,
    dir,
  );

  return ret;
}

bool checkbox(
  String label,
  ffi.Pointer<ffi.Bool> v,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCheckbox(
    _label,
    v,
  );

  return ret;
}

bool checkboxFlagsIntPtr(
  String label,
  ffi.Pointer<ffi.Int> flags,
  int flagsValue,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCheckboxFlags_IntPtr(
    _label,
    flags,
    flagsValue,
  );

  return ret;
}

bool checkboxFlagsUintPtr(
  String label,
  ffi.Pointer<ffi.UnsignedInt> flags,
  int flagsValue,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCheckboxFlags_UintPtr(
    _label,
    flags,
    flagsValue,
  );

  return ret;
}

bool radioButtonBool(
  String label,
  bool active,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igRadioButton_Bool(
    _label,
    active,
  );

  return ret;
}

bool radioButtonIntPtr(
  String label,
  ffi.Pointer<ffi.Int> v,
  int vButton,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igRadioButton_IntPtr(
    _label,
    v,
    vButton,
  );

  return ret;
}

void progressBar(
  double fraction,
  [ImVec2 sizeArg = ImVec2(-FLT_MIN,0),
  String? overlay,]
) {
  final ffi.Pointer<ffi.Char> _overlay = overlay != null ? overlay.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igProgressBar(
    fraction,
    sizeArg,
    _overlay,
  );

}

void bullet(
) {

  _cimgui.igBullet(
  );

}

bool textLink(
  String label,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTextLink(
    _label,
  );

  return ret;
}

void textLinkOpenURL(
  String label,
  String url,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _url = url != null ? url.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextLinkOpenURL(
    _label,
    _url,
  );

}

void image(
  int userTextureId,
  ImVec2 imageSize,
  [ImVec2 uv0 = ImVec2(0,0),
  ImVec2 uv1 = ImVec2(1,1),
  ImVec4 tintCol = ImVec4(1,1,1,1),
  ImVec4 borderCol = ImVec4(0,0,0,0),]
) {

  _cimgui.igImage(
    userTextureId,
    imageSize,
    uv0,
    uv1,
    tintCol,
    borderCol,
  );

}

bool imageButton(
  String strId,
  int userTextureId,
  ImVec2 imageSize,
  [ImVec2 uv0 = ImVec2(0,0),
  ImVec2 uv1 = ImVec2(1,1),
  ImVec4 bgCol = ImVec4(0,0,0,0),
  ImVec4 tintCol = ImVec4(1,1,1,1),]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImageButton(
    _strId,
    userTextureId,
    imageSize,
    uv0,
    uv1,
    bgCol,
    tintCol,
  );

  return ret;
}

bool beginCombo(
  String label,
  String previewValue,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _previewValue = previewValue != null ? previewValue.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginCombo(
    _label,
    _previewValue,
    flags,
  );

  return ret;
}

void endCombo(
) {

  _cimgui.igEndCombo(
  );

}

bool comboStrArr(
  String label,
  ffi.Pointer<ffi.Int> currentItem,
  ffi.Pointer<ffi.Pointer<ffi.Char>> items,
  int itemsCount,
  int popupMaxHeightInItems,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCombo_Str_arr(
    _label,
    currentItem,
    items,
    itemsCount,
    popupMaxHeightInItems,
  );

  return ret;
}

bool comboStr(
  String label,
  ffi.Pointer<ffi.Int> currentItem,
  String itemsSeparatedByZeros,
  int popupMaxHeightInItems,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _itemsSeparatedByZeros = itemsSeparatedByZeros != null ? itemsSeparatedByZeros.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCombo_Str(
    _label,
    currentItem,
    _itemsSeparatedByZeros,
    popupMaxHeightInItems,
  );

  return ret;
}

bool comboFnStrPtr(
  String label,
  ffi.Pointer<ffi.Int> currentItem,
  ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void> user_data, ffi.Int idx)>> getter,
  ffi.Pointer<ffi.Void> userData,
  int itemsCount,
  int popupMaxHeightInItems,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCombo_FnStrPtr(
    _label,
    currentItem,
    getter,
    userData,
    itemsCount,
    popupMaxHeightInItems,
  );

  return ret;
}

bool dragFloat(
  String label,
  ffi.Pointer<ffi.Float> v,
  [double vSpeed = 1.0,
  double vMin = 0.0,
  double vMax = 0.0,
  String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragFloat(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragFloat2(
  String label,
  ffi.Pointer<ffi.Float> v,
  [double vSpeed = 1.0,
  double vMin = 0.0,
  double vMax = 0.0,
  String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragFloat2(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragFloat3(
  String label,
  ffi.Pointer<ffi.Float> v,
  [double vSpeed = 1.0,
  double vMin = 0.0,
  double vMax = 0.0,
  String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragFloat3(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragFloat4(
  String label,
  ffi.Pointer<ffi.Float> v,
  [double vSpeed = 1.0,
  double vMin = 0.0,
  double vMax = 0.0,
  String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragFloat4(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragFloatRange2(
  String label,
  ffi.Pointer<ffi.Float> vCurrentMin,
  ffi.Pointer<ffi.Float> vCurrentMax,
  [double vSpeed = 1.0,
  double vMin = 0.0,
  double vMax = 0.0,
  String format = "%.3f",
  String? formatMax,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _formatMax = formatMax != null ? formatMax.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragFloatRange2(
    _label,
    vCurrentMin,
    vCurrentMax,
    vSpeed,
    vMin,
    vMax,
    _format,
    _formatMax,
    flags,
  );

  return ret;
}

bool dragInt(
  String label,
  ffi.Pointer<ffi.Int> v,
  [double vSpeed = 1.0,
  int vMin = 0,
  int vMax = 0,
  String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragInt(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragInt2(
  String label,
  ffi.Pointer<ffi.Int> v,
  [double vSpeed = 1.0,
  int vMin = 0,
  int vMax = 0,
  String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragInt2(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragInt3(
  String label,
  ffi.Pointer<ffi.Int> v,
  [double vSpeed = 1.0,
  int vMin = 0,
  int vMax = 0,
  String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragInt3(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragInt4(
  String label,
  ffi.Pointer<ffi.Int> v,
  [double vSpeed = 1.0,
  int vMin = 0,
  int vMax = 0,
  String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragInt4(
    _label,
    v,
    vSpeed,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool dragIntRange2(
  String label,
  ffi.Pointer<ffi.Int> vCurrentMin,
  ffi.Pointer<ffi.Int> vCurrentMax,
  [double vSpeed = 1.0,
  int vMin = 0,
  int vMax = 0,
  String format = "%d",
  String? formatMax,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _formatMax = formatMax != null ? formatMax.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragIntRange2(
    _label,
    vCurrentMin,
    vCurrentMax,
    vSpeed,
    vMin,
    vMax,
    _format,
    _formatMax,
    flags,
  );

  return ret;
}

bool dragScalar(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  double vSpeed,
  [ffi.Pointer<ffi.Void>? pMin,
  ffi.Pointer<ffi.Void>? pMax,
  String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragScalar(
    _label,
    dataType,
    pData,
    vSpeed,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool dragScalarN(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  int components,
  double vSpeed,
  [ffi.Pointer<ffi.Void>? pMin,
  ffi.Pointer<ffi.Void>? pMax,
  String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragScalarN(
    _label,
    dataType,
    pData,
    components,
    vSpeed,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderFloat(
  String label,
  ffi.Pointer<ffi.Float> v,
  double vMin,
  double vMax,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderFloat(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderFloat2(
  String label,
  ffi.Pointer<ffi.Float> v,
  double vMin,
  double vMax,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderFloat2(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderFloat3(
  String label,
  ffi.Pointer<ffi.Float> v,
  double vMin,
  double vMax,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderFloat3(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderFloat4(
  String label,
  ffi.Pointer<ffi.Float> v,
  double vMin,
  double vMax,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderFloat4(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderAngle(
  String label,
  ffi.Pointer<ffi.Float> vRad,
  [double vDegreesMin = -360.0,
  double vDegreesMax = 360.0,
  String format = "%.0f deg",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderAngle(
    _label,
    vRad,
    vDegreesMin,
    vDegreesMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderInt(
  String label,
  ffi.Pointer<ffi.Int> v,
  int vMin,
  int vMax,
  [String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderInt(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderInt2(
  String label,
  ffi.Pointer<ffi.Int> v,
  int vMin,
  int vMax,
  [String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderInt2(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderInt3(
  String label,
  ffi.Pointer<ffi.Int> v,
  int vMin,
  int vMax,
  [String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderInt3(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderInt4(
  String label,
  ffi.Pointer<ffi.Int> v,
  int vMin,
  int vMax,
  [String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderInt4(
    _label,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderScalar(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
  [String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderScalar(
    _label,
    dataType,
    pData,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderScalarN(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  int components,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
  [String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderScalarN(
    _label,
    dataType,
    pData,
    components,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool vSliderFloat(
  String label,
  ImVec2 size,
  ffi.Pointer<ffi.Float> v,
  double vMin,
  double vMax,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igVSliderFloat(
    _label,
    size,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool vSliderInt(
  String label,
  ImVec2 size,
  ffi.Pointer<ffi.Int> v,
  int vMin,
  int vMax,
  [String format = "%d",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igVSliderInt(
    _label,
    size,
    v,
    vMin,
    vMax,
    _format,
    flags,
  );

  return ret;
}

bool vSliderScalar(
  String label,
  ImVec2 size,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
  [String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igVSliderScalar(
    _label,
    size,
    dataType,
    pData,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool inputText(
  String label,
  String buf,
  int bufSize,
  [int flags = 0,
  ImGuiInputTextCallback? callback,
  ffi.Pointer<ffi.Void>? userData,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputText(
    _label,
    _buf,
    bufSize,
    flags,
    callback,
    userData,
  );

  return ret;
}

bool inputTextMultiline(
  String label,
  String buf,
  int bufSize,
  [ImVec2 size = ImVec2(0,0),
  int flags = 0,
  ImGuiInputTextCallback? callback,
  ffi.Pointer<ffi.Void>? userData,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputTextMultiline(
    _label,
    _buf,
    bufSize,
    size,
    flags,
    callback,
    userData,
  );

  return ret;
}

bool inputTextWithHint(
  String label,
  String hint,
  String buf,
  int bufSize,
  [int flags = 0,
  ImGuiInputTextCallback? callback,
  ffi.Pointer<ffi.Void>? userData,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _hint = hint != null ? hint.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputTextWithHint(
    _label,
    _hint,
    _buf,
    bufSize,
    flags,
    callback,
    userData,
  );

  return ret;
}

bool inputFloat(
  String label,
  ffi.Pointer<ffi.Float> v,
  [double step = 0.0,
  double stepFast = 0.0,
  String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputFloat(
    _label,
    v,
    step,
    stepFast,
    _format,
    flags,
  );

  return ret;
}

bool inputFloat2(
  String label,
  ffi.Pointer<ffi.Float> v,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputFloat2(
    _label,
    v,
    _format,
    flags,
  );

  return ret;
}

bool inputFloat3(
  String label,
  ffi.Pointer<ffi.Float> v,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputFloat3(
    _label,
    v,
    _format,
    flags,
  );

  return ret;
}

bool inputFloat4(
  String label,
  ffi.Pointer<ffi.Float> v,
  [String format = "%.3f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputFloat4(
    _label,
    v,
    _format,
    flags,
  );

  return ret;
}

bool inputInt(
  String label,
  ffi.Pointer<ffi.Int> v,
  [int step = 1,
  int stepFast = 10,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputInt(
    _label,
    v,
    step,
    stepFast,
    flags,
  );

  return ret;
}

bool inputInt2(
  String label,
  ffi.Pointer<ffi.Int> v,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputInt2(
    _label,
    v,
    flags,
  );

  return ret;
}

bool inputInt3(
  String label,
  ffi.Pointer<ffi.Int> v,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputInt3(
    _label,
    v,
    flags,
  );

  return ret;
}

bool inputInt4(
  String label,
  ffi.Pointer<ffi.Int> v,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputInt4(
    _label,
    v,
    flags,
  );

  return ret;
}

bool inputDouble(
  String label,
  ffi.Pointer<ffi.Double> v,
  [double step = 0.0,
  double stepFast = 0.0,
  String format = "%.6f",
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputDouble(
    _label,
    v,
    step,
    stepFast,
    _format,
    flags,
  );

  return ret;
}

bool inputScalar(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  [ffi.Pointer<ffi.Void>? pStep,
  ffi.Pointer<ffi.Void>? pStepFast,
  String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputScalar(
    _label,
    dataType,
    pData,
    pStep,
    pStepFast,
    _format,
    flags,
  );

  return ret;
}

bool inputScalarN(
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  int components,
  [ffi.Pointer<ffi.Void>? pStep,
  ffi.Pointer<ffi.Void>? pStepFast,
  String? format,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputScalarN(
    _label,
    dataType,
    pData,
    components,
    pStep,
    pStepFast,
    _format,
    flags,
  );

  return ret;
}

bool colorEdit3(
  String label,
  ffi.Pointer<ffi.Float> col,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igColorEdit3(
    _label,
    col,
    flags,
  );

  return ret;
}

bool colorEdit4(
  String label,
  ffi.Pointer<ffi.Float> col,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igColorEdit4(
    _label,
    col,
    flags,
  );

  return ret;
}

bool colorPicker3(
  String label,
  ffi.Pointer<ffi.Float> col,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igColorPicker3(
    _label,
    col,
    flags,
  );

  return ret;
}

bool colorPicker4(
  String label,
  ffi.Pointer<ffi.Float> col,
  [int flags = 0,
  ffi.Pointer<ffi.Float>? refCol,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igColorPicker4(
    _label,
    col,
    flags,
    refCol,
  );

  return ret;
}

bool colorButton(
  String descId,
  ImVec4 col,
  [int flags = 0,
  ImVec2 size = ImVec2(0,0),]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _descId = descId != null ? descId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igColorButton(
    _descId,
    col,
    flags,
    size,
  );

  return ret;
}

void setColorEditOptions(
  int flags,
) {

  _cimgui.igSetColorEditOptions(
    flags,
  );

}

bool treeNodeStr(
  String label,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNode_Str(
    _label,
  );

  return ret;
}

bool treeNodeStrStr(
  String strId,
  String fmt,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNode_StrStr(
    _strId,
    _fmt,
  );

  return ret;
}

bool treeNodePtr(
  ffi.Pointer<ffi.Void> ptrId,
  String fmt,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNode_Ptr(
    ptrId,
    _fmt,
  );

  return ret;
}

bool treeNodeExStr(
  String label,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNodeEx_Str(
    _label,
    flags,
  );

  return ret;
}

bool treeNodeExStrStr(
  String strId,
  int flags,
  String fmt,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNodeEx_StrStr(
    _strId,
    flags,
    _fmt,
  );

  return ret;
}

bool treeNodeExPtr(
  ffi.Pointer<ffi.Void> ptrId,
  int flags,
  String fmt,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNodeEx_Ptr(
    ptrId,
    flags,
    _fmt,
  );

  return ret;
}

void treePushStr(
  String strId,
) {
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTreePush_Str(
    _strId,
  );

}

void treePushPtr(
  ffi.Pointer<ffi.Void> ptrId,
) {

  _cimgui.igTreePush_Ptr(
    ptrId,
  );

}

void treePop(
) {

  _cimgui.igTreePop(
  );

}

double getTreeNodeToLabelSpacing(
) {
  double ret;

  ret = _cimgui.igGetTreeNodeToLabelSpacing(
  );

  return ret;
}

bool collapsingHeaderTreeNodeFlags(
  String label,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCollapsingHeader_TreeNodeFlags(
    _label,
    flags,
  );

  return ret;
}

bool collapsingHeaderBoolPtr(
  String label,
  ffi.Pointer<ffi.Bool> pVisible,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCollapsingHeader_BoolPtr(
    _label,
    pVisible,
    flags,
  );

  return ret;
}

void setNextItemOpen(
  bool isOpen,
  [int cond = 0,]
) {

  _cimgui.igSetNextItemOpen(
    isOpen,
    cond,
  );

}

void setNextItemStorageID(
  int storageId,
) {

  _cimgui.igSetNextItemStorageID(
    storageId,
  );

}

bool selectableBool(
  String label,
  bool selected,
  int flags,
  ImVec2 size,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSelectable_Bool(
    _label,
    selected,
    flags,
    size,
  );

  return ret;
}

bool selectableBoolPtr(
  String label,
  ffi.Pointer<ffi.Bool> pSelected,
  int flags,
  ImVec2 size,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSelectable_BoolPtr(
    _label,
    pSelected,
    flags,
    size,
  );

  return ret;
}

ffi.Pointer<ImGuiMultiSelectIO> beginMultiSelect(
  int flags,
  int selectionSize,
  int itemsCount,
) {
  ffi.Pointer<ImGuiMultiSelectIO> ret;

  ret = _cimgui.igBeginMultiSelect(
    flags,
    selectionSize,
    itemsCount,
  );

  return ret;
}

ffi.Pointer<ImGuiMultiSelectIO> endMultiSelect(
) {
  ffi.Pointer<ImGuiMultiSelectIO> ret;

  ret = _cimgui.igEndMultiSelect(
  );

  return ret;
}

void setNextItemSelectionUserData(
  int selectionUserData,
) {

  _cimgui.igSetNextItemSelectionUserData(
    selectionUserData,
  );

}

bool isItemToggledSelection(
) {
  bool ret;

  ret = _cimgui.igIsItemToggledSelection(
  );

  return ret;
}

bool beginListBox(
  String label,
  [ImVec2 size = ImVec2(0,0),]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginListBox(
    _label,
    size,
  );

  return ret;
}

void endListBox(
) {

  _cimgui.igEndListBox(
  );

}

bool listBoxStrArr(
  String label,
  ffi.Pointer<ffi.Int> currentItem,
  ffi.Pointer<ffi.Pointer<ffi.Char>> items,
  int itemsCount,
  int heightInItems,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igListBox_Str_arr(
    _label,
    currentItem,
    items,
    itemsCount,
    heightInItems,
  );

  return ret;
}

bool listBoxFnStrPtr(
  String label,
  ffi.Pointer<ffi.Int> currentItem,
  ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void> user_data, ffi.Int idx)>> getter,
  ffi.Pointer<ffi.Void> userData,
  int itemsCount,
  int heightInItems,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igListBox_FnStrPtr(
    _label,
    currentItem,
    getter,
    userData,
    itemsCount,
    heightInItems,
  );

  return ret;
}

void plotLinesFloatPtr(
  String label,
  ffi.Pointer<ffi.Float> values,
  int valuesCount,
  int valuesOffset,
  String overlayText,
  double scaleMin,
  double scaleMax,
  ImVec2 graphSize,
  int stride,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _overlayText = overlayText != null ? overlayText.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPlotLines_FloatPtr(
    _label,
    values,
    valuesCount,
    valuesOffset,
    _overlayText,
    scaleMin,
    scaleMax,
    graphSize,
    stride,
  );

}

void plotLinesFnFloatPtr(
  String label,
  ffi.Pointer<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void> data, ffi.Int idx)>> valuesGetter,
  ffi.Pointer<ffi.Void> data,
  int valuesCount,
  int valuesOffset,
  String overlayText,
  double scaleMin,
  double scaleMax,
  ImVec2 graphSize,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _overlayText = overlayText != null ? overlayText.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPlotLines_FnFloatPtr(
    _label,
    valuesGetter,
    data,
    valuesCount,
    valuesOffset,
    _overlayText,
    scaleMin,
    scaleMax,
    graphSize,
  );

}

void plotHistogramFloatPtr(
  String label,
  ffi.Pointer<ffi.Float> values,
  int valuesCount,
  int valuesOffset,
  String overlayText,
  double scaleMin,
  double scaleMax,
  ImVec2 graphSize,
  int stride,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _overlayText = overlayText != null ? overlayText.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPlotHistogram_FloatPtr(
    _label,
    values,
    valuesCount,
    valuesOffset,
    _overlayText,
    scaleMin,
    scaleMax,
    graphSize,
    stride,
  );

}

void plotHistogramFnFloatPtr(
  String label,
  ffi.Pointer<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void> data, ffi.Int idx)>> valuesGetter,
  ffi.Pointer<ffi.Void> data,
  int valuesCount,
  int valuesOffset,
  String overlayText,
  double scaleMin,
  double scaleMax,
  ImVec2 graphSize,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _overlayText = overlayText != null ? overlayText.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igPlotHistogram_FnFloatPtr(
    _label,
    valuesGetter,
    data,
    valuesCount,
    valuesOffset,
    _overlayText,
    scaleMin,
    scaleMax,
    graphSize,
  );

}

void valueBool(
  String prefix,
  bool b,
) {
  final ffi.Pointer<ffi.Char> _prefix = prefix != null ? prefix.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igValue_Bool(
    _prefix,
    b,
  );

}

void valueInt(
  String prefix,
  int v,
) {
  final ffi.Pointer<ffi.Char> _prefix = prefix != null ? prefix.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igValue_Int(
    _prefix,
    v,
  );

}

void valueUint(
  String prefix,
  int v,
) {
  final ffi.Pointer<ffi.Char> _prefix = prefix != null ? prefix.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igValue_Uint(
    _prefix,
    v,
  );

}

void valueFloat(
  String prefix,
  double v,
  String floatFormat,
) {
  final ffi.Pointer<ffi.Char> _prefix = prefix != null ? prefix.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _floatFormat = floatFormat != null ? floatFormat.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igValue_Float(
    _prefix,
    v,
    _floatFormat,
  );

}

bool beginMenuBar(
) {
  bool ret;

  ret = _cimgui.igBeginMenuBar(
  );

  return ret;
}

void endMenuBar(
) {

  _cimgui.igEndMenuBar(
  );

}

bool beginMainMenuBar(
) {
  bool ret;

  ret = _cimgui.igBeginMainMenuBar(
  );

  return ret;
}

void endMainMenuBar(
) {

  _cimgui.igEndMainMenuBar(
  );

}

bool beginMenu(
  String label,
  [bool enabled = true,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginMenu(
    _label,
    enabled,
  );

  return ret;
}

void endMenu(
) {

  _cimgui.igEndMenu(
  );

}

bool menuItemBool(
  String label,
  String shortcut,
  bool selected,
  bool enabled,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _shortcut = shortcut != null ? shortcut.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igMenuItem_Bool(
    _label,
    _shortcut,
    selected,
    enabled,
  );

  return ret;
}

bool menuItemBoolPtr(
  String label,
  String shortcut,
  ffi.Pointer<ffi.Bool> pSelected,
  bool enabled,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _shortcut = shortcut != null ? shortcut.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igMenuItem_BoolPtr(
    _label,
    _shortcut,
    pSelected,
    enabled,
  );

  return ret;
}

bool beginTooltip(
) {
  bool ret;

  ret = _cimgui.igBeginTooltip(
  );

  return ret;
}

void endTooltip(
) {

  _cimgui.igEndTooltip(
  );

}

void setTooltip(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetTooltip(
    _fmt,
  );

}

bool beginItemTooltip(
) {
  bool ret;

  ret = _cimgui.igBeginItemTooltip(
  );

  return ret;
}

void setItemTooltip(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetItemTooltip(
    _fmt,
  );

}

bool beginPopup(
  String strId,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginPopup(
    _strId,
    flags,
  );

  return ret;
}

bool beginPopupModal(
  String name,
  [ffi.Pointer<ffi.Bool>? pOpen,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginPopupModal(
    _name,
    pOpen,
    flags,
  );

  return ret;
}

void endPopup(
) {

  _cimgui.igEndPopup(
  );

}

void openPopupStr(
  String strId,
  int popupFlags,
) {
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igOpenPopup_Str(
    _strId,
    popupFlags,
  );

}

void openPopupID(
  int id,
  int popupFlags,
) {

  _cimgui.igOpenPopup_ID(
    id,
    popupFlags,
  );

}

void openPopupOnItemClick(
  [String? strId,
  int popupFlags = 1,]
) {
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igOpenPopupOnItemClick(
    _strId,
    popupFlags,
  );

}

void closeCurrentPopup(
) {

  _cimgui.igCloseCurrentPopup(
  );

}

bool beginPopupContextItem(
  [String? strId,
  int popupFlags = 1,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginPopupContextItem(
    _strId,
    popupFlags,
  );

  return ret;
}

bool beginPopupContextWindow(
  [String? strId,
  int popupFlags = 1,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginPopupContextWindow(
    _strId,
    popupFlags,
  );

  return ret;
}

bool beginPopupContextVoid(
  [String? strId,
  int popupFlags = 1,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginPopupContextVoid(
    _strId,
    popupFlags,
  );

  return ret;
}

bool isPopupOpenStr(
  String strId,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igIsPopupOpen_Str(
    _strId,
    flags,
  );

  return ret;
}

bool beginTable(
  String strId,
  int columns,
  [int flags = 0,
  ImVec2 outerSize = new Vector2(),
  double innerWidth = 0.0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginTable(
    _strId,
    columns,
    flags,
    outerSize,
    innerWidth,
  );

  return ret;
}

void endTable(
) {

  _cimgui.igEndTable(
  );

}

void tableNextRow(
  [int rowFlags = 0,
  double minRowHeight = 0.0,]
) {

  _cimgui.igTableNextRow(
    rowFlags,
    minRowHeight,
  );

}

bool tableNextColumn(
) {
  bool ret;

  ret = _cimgui.igTableNextColumn(
  );

  return ret;
}

bool tableSetColumnIndex(
  int columnN,
) {
  bool ret;

  ret = _cimgui.igTableSetColumnIndex(
    columnN,
  );

  return ret;
}

void tableSetupColumn(
  String label,
  [int flags = 0,
  double initWidthOrWeight = 0.0,
  int userId = 0,]
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTableSetupColumn(
    _label,
    flags,
    initWidthOrWeight,
    userId,
  );

}

void tableSetupScrollFreeze(
  int cols,
  int rows,
) {

  _cimgui.igTableSetupScrollFreeze(
    cols,
    rows,
  );

}

void tableHeader(
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTableHeader(
    _label,
  );

}

void tableHeadersRow(
) {

  _cimgui.igTableHeadersRow(
  );

}

void tableAngledHeadersRow(
) {

  _cimgui.igTableAngledHeadersRow(
  );

}

ffi.Pointer<ImGuiTableSortSpecs> tableGetSortSpecs(
) {
  ffi.Pointer<ImGuiTableSortSpecs> ret;

  ret = _cimgui.igTableGetSortSpecs(
  );

  return ret;
}

int tableGetColumnCount(
) {
  int ret;

  ret = _cimgui.igTableGetColumnCount(
  );

  return ret;
}

int tableGetColumnIndex(
) {
  int ret;

  ret = _cimgui.igTableGetColumnIndex(
  );

  return ret;
}

int tableGetRowIndex(
) {
  int ret;

  ret = _cimgui.igTableGetRowIndex(
  );

  return ret;
}

ffi.Pointer<ffi.Char> tableGetColumnNameInt(
  int columnN,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igTableGetColumnName_Int(
    columnN,
  );

  return ret;
}

int tableGetColumnFlags(
  [int columnN = -1,]
) {
  int ret;

  ret = _cimgui.igTableGetColumnFlags(
    columnN,
  );

  return ret;
}

void tableSetColumnEnabled(
  int columnN,
  bool v,
) {

  _cimgui.igTableSetColumnEnabled(
    columnN,
    v,
  );

}

int tableGetHoveredColumn(
) {
  int ret;

  ret = _cimgui.igTableGetHoveredColumn(
  );

  return ret;
}

void tableSetBgColor(
  int target,
  int color,
  [int columnN = -1,]
) {

  _cimgui.igTableSetBgColor(
    target,
    color,
    columnN,
  );

}

void columns(
  [int count = 1,
  String? id,
  bool borders,]
) {
  final ffi.Pointer<ffi.Char> _id = id != null ? id.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igColumns(
    count,
    _id,
    borders,
  );

}

void nextColumn(
) {

  _cimgui.igNextColumn(
  );

}

int getColumnIndex(
) {
  int ret;

  ret = _cimgui.igGetColumnIndex(
  );

  return ret;
}

double getColumnWidth(
  [int columnIndex = -1,]
) {
  double ret;

  ret = _cimgui.igGetColumnWidth(
    columnIndex,
  );

  return ret;
}

void setColumnWidth(
  int columnIndex,
  double width,
) {

  _cimgui.igSetColumnWidth(
    columnIndex,
    width,
  );

}

double getColumnOffset(
  [int columnIndex = -1,]
) {
  double ret;

  ret = _cimgui.igGetColumnOffset(
    columnIndex,
  );

  return ret;
}

void setColumnOffset(
  int columnIndex,
  double offsetX,
) {

  _cimgui.igSetColumnOffset(
    columnIndex,
    offsetX,
  );

}

int getColumnsCount(
) {
  int ret;

  ret = _cimgui.igGetColumnsCount(
  );

  return ret;
}

bool beginTabBar(
  String strId,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginTabBar(
    _strId,
    flags,
  );

  return ret;
}

void endTabBar(
) {

  _cimgui.igEndTabBar(
  );

}

bool beginTabItem(
  String label,
  [ffi.Pointer<ffi.Bool>? pOpen,
  int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginTabItem(
    _label,
    pOpen,
    flags,
  );

  return ret;
}

void endTabItem(
) {

  _cimgui.igEndTabItem(
  );

}

bool tabItemButton(
  String label,
  [int flags = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTabItemButton(
    _label,
    flags,
  );

  return ret;
}

void setTabItemClosed(
  String tabOrDockedWindowLabel,
) {
  final ffi.Pointer<ffi.Char> _tabOrDockedWindowLabel = tabOrDockedWindowLabel != null ? tabOrDockedWindowLabel.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetTabItemClosed(
    _tabOrDockedWindowLabel,
  );

}

int dockSpace(
  int dockspaceId,
  [ImVec2 size = ImVec2(0,0),
  int flags = 0,
  ffi.Pointer<ImGuiWindowClass>? windowClass,]
) {
  int ret;

  ret = _cimgui.igDockSpace(
    dockspaceId,
    size,
    flags,
    windowClass,
  );

  return ret;
}

int dockSpaceOverViewport(
  int dockspaceId,
  [ffi.Pointer<ImGuiViewport>? viewport,
  int flags = 0,
  ffi.Pointer<ImGuiWindowClass>? windowClass,]
) {
  int ret;

  ret = _cimgui.igDockSpaceOverViewport(
    dockspaceId,
    viewport,
    flags,
    windowClass,
  );

  return ret;
}

void setNextWindowDockID(
  int dockId,
  [int cond = 0,]
) {

  _cimgui.igSetNextWindowDockID(
    dockId,
    cond,
  );

}

void setNextWindowClass(
  ffi.Pointer<ImGuiWindowClass> windowClass,
) {

  _cimgui.igSetNextWindowClass(
    windowClass,
  );

}

int getWindowDockID(
) {
  int ret;

  ret = _cimgui.igGetWindowDockID(
  );

  return ret;
}

bool isWindowDocked(
) {
  bool ret;

  ret = _cimgui.igIsWindowDocked(
  );

  return ret;
}

void logToTTY(
  [int autoOpenDepth = -1,]
) {

  _cimgui.igLogToTTY(
    autoOpenDepth,
  );

}

void logToFile(
  [int autoOpenDepth = -1,
  String? filename,]
) {
  final ffi.Pointer<ffi.Char> _filename = filename != null ? filename.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLogToFile(
    autoOpenDepth,
    _filename,
  );

}

void logToClipboard(
  [int autoOpenDepth = -1,]
) {

  _cimgui.igLogToClipboard(
    autoOpenDepth,
  );

}

void logFinish(
) {

  _cimgui.igLogFinish(
  );

}

void logButtons(
) {

  _cimgui.igLogButtons(
  );

}

bool beginDragDropSource(
  [int flags = 0,]
) {
  bool ret;

  ret = _cimgui.igBeginDragDropSource(
    flags,
  );

  return ret;
}

bool setDragDropPayload(
  String type,
  ffi.Pointer<ffi.Void> data,
  int sz,
  [int cond = 0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _type = type != null ? type.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSetDragDropPayload(
    _type,
    data,
    sz,
    cond,
  );

  return ret;
}

void endDragDropSource(
) {

  _cimgui.igEndDragDropSource(
  );

}

bool beginDragDropTarget(
) {
  bool ret;

  ret = _cimgui.igBeginDragDropTarget(
  );

  return ret;
}

ffi.Pointer<ImGuiPayload> acceptDragDropPayload(
  String type,
  [int flags = 0,]
) {
  ffi.Pointer<ImGuiPayload> ret;
  final ffi.Pointer<ffi.Char> _type = type != null ? type.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igAcceptDragDropPayload(
    _type,
    flags,
  );

  return ret;
}

void endDragDropTarget(
) {

  _cimgui.igEndDragDropTarget(
  );

}

ffi.Pointer<ImGuiPayload> getDragDropPayload(
) {
  ffi.Pointer<ImGuiPayload> ret;

  ret = _cimgui.igGetDragDropPayload(
  );

  return ret;
}

void beginDisabled(
  bool disabled,
) {

  _cimgui.igBeginDisabled(
    disabled,
  );

}

void endDisabled(
) {

  _cimgui.igEndDisabled(
  );

}

void pushClipRect(
  ImVec2 clipRectMin,
  ImVec2 clipRectMax,
  bool intersectWithCurrentClipRect,
) {

  _cimgui.igPushClipRect(
    clipRectMin,
    clipRectMax,
    intersectWithCurrentClipRect,
  );

}

void popClipRect(
) {

  _cimgui.igPopClipRect(
  );

}

void setItemDefaultFocus(
) {

  _cimgui.igSetItemDefaultFocus(
  );

}

void setKeyboardFocusHere(
  [int offset = 0,]
) {

  _cimgui.igSetKeyboardFocusHere(
    offset,
  );

}

void setNavCursorVisible(
  bool visible,
) {

  _cimgui.igSetNavCursorVisible(
    visible,
  );

}

void setNextItemAllowOverlap(
) {

  _cimgui.igSetNextItemAllowOverlap(
  );

}

bool isItemHovered(
  [int flags = 0,]
) {
  bool ret;

  ret = _cimgui.igIsItemHovered(
    flags,
  );

  return ret;
}

bool isItemActive(
) {
  bool ret;

  ret = _cimgui.igIsItemActive(
  );

  return ret;
}

bool isItemFocused(
) {
  bool ret;

  ret = _cimgui.igIsItemFocused(
  );

  return ret;
}

bool isItemClicked(
  [int mouseButton = 0,]
) {
  bool ret;

  ret = _cimgui.igIsItemClicked(
    mouseButton,
  );

  return ret;
}

bool isItemVisible(
) {
  bool ret;

  ret = _cimgui.igIsItemVisible(
  );

  return ret;
}

bool isItemEdited(
) {
  bool ret;

  ret = _cimgui.igIsItemEdited(
  );

  return ret;
}

bool isItemActivated(
) {
  bool ret;

  ret = _cimgui.igIsItemActivated(
  );

  return ret;
}

bool isItemDeactivated(
) {
  bool ret;

  ret = _cimgui.igIsItemDeactivated(
  );

  return ret;
}

bool isItemDeactivatedAfterEdit(
) {
  bool ret;

  ret = _cimgui.igIsItemDeactivatedAfterEdit(
  );

  return ret;
}

bool isItemToggledOpen(
) {
  bool ret;

  ret = _cimgui.igIsItemToggledOpen(
  );

  return ret;
}

bool isAnyItemHovered(
) {
  bool ret;

  ret = _cimgui.igIsAnyItemHovered(
  );

  return ret;
}

bool isAnyItemActive(
) {
  bool ret;

  ret = _cimgui.igIsAnyItemActive(
  );

  return ret;
}

bool isAnyItemFocused(
) {
  bool ret;

  ret = _cimgui.igIsAnyItemFocused(
  );

  return ret;
}

int getItemID(
) {
  int ret;

  ret = _cimgui.igGetItemID(
  );

  return ret;
}

void getItemRectMin(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetItemRectMin(
    pOut,
  );

}

void getItemRectMax(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetItemRectMax(
    pOut,
  );

}

void getItemRectSize(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetItemRectSize(
    pOut,
  );

}

ffi.Pointer<ImGuiViewport> getMainViewport(
) {
  ffi.Pointer<ImGuiViewport> ret;

  ret = _cimgui.igGetMainViewport(
  );

  return ret;
}

ffi.Pointer<ImDrawList> getBackgroundDrawList(
  ffi.Pointer<ImGuiViewport> viewport,
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.igGetBackgroundDrawList(
    viewport,
  );

  return ret;
}

ffi.Pointer<ImDrawList> getForegroundDrawListViewportPtr(
  ffi.Pointer<ImGuiViewport> viewport,
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.igGetForegroundDrawList_ViewportPtr(
    viewport,
  );

  return ret;
}

bool isRectVisibleNil(
  ImVec2 size,
) {
  bool ret;

  ret = _cimgui.igIsRectVisible_Nil(
    size,
  );

  return ret;
}

bool isRectVisibleVec2(
  ImVec2 rectMin,
  ImVec2 rectMax,
) {
  bool ret;

  ret = _cimgui.igIsRectVisible_Vec2(
    rectMin,
    rectMax,
  );

  return ret;
}

double getTime(
) {
  double ret;

  ret = _cimgui.igGetTime(
  );

  return ret;
}

int getFrameCount(
) {
  int ret;

  ret = _cimgui.igGetFrameCount(
  );

  return ret;
}

ffi.Pointer<ImDrawListSharedData> getDrawListSharedData(
) {
  ffi.Pointer<ImDrawListSharedData> ret;

  ret = _cimgui.igGetDrawListSharedData(
  );

  return ret;
}

ffi.Pointer<ffi.Char> getStyleColorName(
  int idx,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igGetStyleColorName(
    idx,
  );

  return ret;
}

void setStateStorage(
  ffi.Pointer<ImGuiStorage> storage,
) {

  _cimgui.igSetStateStorage(
    storage,
  );

}

ffi.Pointer<ImGuiStorage> getStateStorage(
) {
  ffi.Pointer<ImGuiStorage> ret;

  ret = _cimgui.igGetStateStorage(
  );

  return ret;
}

void calcTextSize(
  ffi.Pointer<ImVec2> pOut,
  String text,
  [String? textEnd,
  bool hideTextAfterDoubleHash = false,
  double wrapWidth = -1.0,]
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igCalcTextSize(
    pOut,
    _text,
    _textEnd,
    hideTextAfterDoubleHash,
    wrapWidth,
  );

}

void colorConvertU32ToFloat4(
  ffi.Pointer<ImVec4> pOut,
  int in1,
) {

  _cimgui.igColorConvertU32ToFloat4(
    pOut,
    in1,
  );

}

int colorConvertFloat4ToU32(
  ImVec4 in1,
) {
  int ret;

  ret = _cimgui.igColorConvertFloat4ToU32(
    in1,
  );

  return ret;
}

void colorConvertRGBtoHSV(
  double r,
  double g,
  double b,
  ffi.Pointer<ffi.Float> outH,
  ffi.Pointer<ffi.Float> outS,
  ffi.Pointer<ffi.Float> outV,
) {

  _cimgui.igColorConvertRGBtoHSV(
    r,
    g,
    b,
    outH,
    outS,
    outV,
  );

}

void colorConvertHSVtoRGB(
  double h,
  double s,
  double v,
  ffi.Pointer<ffi.Float> outR,
  ffi.Pointer<ffi.Float> outG,
  ffi.Pointer<ffi.Float> outB,
) {

  _cimgui.igColorConvertHSVtoRGB(
    h,
    s,
    v,
    outR,
    outG,
    outB,
  );

}

bool isKeyDownNil(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsKeyDown_Nil(
    key,
  );

  return ret;
}

bool isKeyPressedBool(
  ImGuiKey key,
  bool repeat,
) {
  bool ret;

  ret = _cimgui.igIsKeyPressed_Bool(
    key,
    repeat,
  );

  return ret;
}

bool isKeyReleasedNil(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsKeyReleased_Nil(
    key,
  );

  return ret;
}

bool isKeyChordPressedNil(
  int keyChord,
) {
  bool ret;

  ret = _cimgui.igIsKeyChordPressed_Nil(
    keyChord,
  );

  return ret;
}

int getKeyPressedAmount(
  ImGuiKey key,
  double repeatDelay,
  double rate,
) {
  int ret;

  ret = _cimgui.igGetKeyPressedAmount(
    key,
    repeatDelay,
    rate,
  );

  return ret;
}

ffi.Pointer<ffi.Char> getKeyName(
  ImGuiKey key,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igGetKeyName(
    key,
  );

  return ret;
}

void setNextFrameWantCaptureKeyboard(
  bool wantCaptureKeyboard,
) {

  _cimgui.igSetNextFrameWantCaptureKeyboard(
    wantCaptureKeyboard,
  );

}

bool shortcutNil(
  int keyChord,
  int flags,
) {
  bool ret;

  ret = _cimgui.igShortcut_Nil(
    keyChord,
    flags,
  );

  return ret;
}

void setNextItemShortcut(
  int keyChord,
  int flags,
) {

  _cimgui.igSetNextItemShortcut(
    keyChord,
    flags,
  );

}

void setItemKeyOwnerNil(
  ImGuiKey key,
) {

  _cimgui.igSetItemKeyOwner_Nil(
    key,
  );

}

bool isMouseDownNil(
  int button,
) {
  bool ret;

  ret = _cimgui.igIsMouseDown_Nil(
    button,
  );

  return ret;
}

bool isMouseClickedBool(
  int button,
  bool repeat,
) {
  bool ret;

  ret = _cimgui.igIsMouseClicked_Bool(
    button,
    repeat,
  );

  return ret;
}

bool isMouseReleasedNil(
  int button,
) {
  bool ret;

  ret = _cimgui.igIsMouseReleased_Nil(
    button,
  );

  return ret;
}

bool isMouseDoubleClickedNil(
  int button,
) {
  bool ret;

  ret = _cimgui.igIsMouseDoubleClicked_Nil(
    button,
  );

  return ret;
}

int getMouseClickedCount(
  int button,
) {
  int ret;

  ret = _cimgui.igGetMouseClickedCount(
    button,
  );

  return ret;
}

bool isMouseHoveringRect(
  ImVec2 rMin,
  ImVec2 rMax,
  [bool clip = true,]
) {
  bool ret;

  ret = _cimgui.igIsMouseHoveringRect(
    rMin,
    rMax,
    clip,
  );

  return ret;
}

bool isMousePosValid(
  [ffi.Pointer<ImVec2>? mousePos,]
) {
  bool ret;

  ret = _cimgui.igIsMousePosValid(
    mousePos,
  );

  return ret;
}

bool isAnyMouseDown(
) {
  bool ret;

  ret = _cimgui.igIsAnyMouseDown(
  );

  return ret;
}

void getMousePos(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetMousePos(
    pOut,
  );

}

void getMousePosOnOpeningCurrentPopup(
  ffi.Pointer<ImVec2> pOut,
) {

  _cimgui.igGetMousePosOnOpeningCurrentPopup(
    pOut,
  );

}

bool isMouseDragging(
  int button,
  [double lockThreshold = -1.0,]
) {
  bool ret;

  ret = _cimgui.igIsMouseDragging(
    button,
    lockThreshold,
  );

  return ret;
}

void getMouseDragDelta(
  ffi.Pointer<ImVec2> pOut,
  [int button = 0,
  double lockThreshold = -1.0,]
) {

  _cimgui.igGetMouseDragDelta(
    pOut,
    button,
    lockThreshold,
  );

}

void resetMouseDragDelta(
  [int button = 0,]
) {

  _cimgui.igResetMouseDragDelta(
    button,
  );

}

int getMouseCursor(
) {
  int ret;

  ret = _cimgui.igGetMouseCursor(
  );

  return ret;
}

void setMouseCursor(
  int cursorType,
) {

  _cimgui.igSetMouseCursor(
    cursorType,
  );

}

void setNextFrameWantCaptureMouse(
  bool wantCaptureMouse,
) {

  _cimgui.igSetNextFrameWantCaptureMouse(
    wantCaptureMouse,
  );

}

ffi.Pointer<ffi.Char> getClipboardText(
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igGetClipboardText(
  );

  return ret;
}

void setClipboardText(
  String text,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSetClipboardText(
    _text,
  );

}

void loadIniSettingsFromDisk(
  String iniFilename,
) {
  final ffi.Pointer<ffi.Char> _iniFilename = iniFilename != null ? iniFilename.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLoadIniSettingsFromDisk(
    _iniFilename,
  );

}

void loadIniSettingsFromMemory(
  String iniData,
  [int iniSize = 0,]
) {
  final ffi.Pointer<ffi.Char> _iniData = iniData != null ? iniData.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLoadIniSettingsFromMemory(
    _iniData,
    iniSize,
  );

}

void saveIniSettingsToDisk(
  String iniFilename,
) {
  final ffi.Pointer<ffi.Char> _iniFilename = iniFilename != null ? iniFilename.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSaveIniSettingsToDisk(
    _iniFilename,
  );

}

ffi.Pointer<ffi.Char> saveIniSettingsToMemory(
  [ffi.Pointer<ffi.Size>? outIniSize,]
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igSaveIniSettingsToMemory(
    outIniSize,
  );

  return ret;
}

void debugTextEncoding(
  String text,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugTextEncoding(
    _text,
  );

}

void debugFlashStyleColor(
  int idx,
) {

  _cimgui.igDebugFlashStyleColor(
    idx,
  );

}

void debugStartItemPicker(
) {

  _cimgui.igDebugStartItemPicker(
  );

}

bool debugCheckVersionAndDataLayout(
  String versionStr,
  int szIo,
  int szStyle,
  int szVec2,
  int szVec4,
  int szDrawvert,
  int szDrawidx,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _versionStr = versionStr != null ? versionStr.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDebugCheckVersionAndDataLayout(
    _versionStr,
    szIo,
    szStyle,
    szVec2,
    szVec4,
    szDrawvert,
    szDrawidx,
  );

  return ret;
}

void debugLog(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugLog(
    _fmt,
  );

}

void setAllocatorFunctions(
  ImGuiMemAllocFunc allocFunc,
  ImGuiMemFreeFunc freeFunc,
  [ffi.Pointer<ffi.Void>? userData,]
) {

  _cimgui.igSetAllocatorFunctions(
    allocFunc,
    freeFunc,
    userData,
  );

}

void getAllocatorFunctions(
  ffi.Pointer<ImGuiMemAllocFunc> pAllocFunc,
  ffi.Pointer<ImGuiMemFreeFunc> pFreeFunc,
  ffi.Pointer<ffi.Pointer<ffi.Void>> pUserData,
) {

  _cimgui.igGetAllocatorFunctions(
    pAllocFunc,
    pFreeFunc,
    pUserData,
  );

}

ffi.Pointer<ffi.Void> memAlloc(
  int size,
) {
  ffi.Pointer<ffi.Void> ret;

  ret = _cimgui.igMemAlloc(
    size,
  );

  return ret;
}

void memFree(
  ffi.Pointer<ffi.Void> ptr,
) {

  _cimgui.igMemFree(
    ptr,
  );

}

void updatePlatformWindows(
) {

  _cimgui.igUpdatePlatformWindows(
  );

}

void renderPlatformWindowsDefault(
  [ffi.Pointer<ffi.Void>? platformRenderArg,
  ffi.Pointer<ffi.Void>? rendererRenderArg,]
) {

  _cimgui.igRenderPlatformWindowsDefault(
    platformRenderArg,
    rendererRenderArg,
  );

}

void destroyPlatformWindows(
) {

  _cimgui.igDestroyPlatformWindows(
  );

}

ffi.Pointer<ImGuiViewport> findViewportByID(
  int id,
) {
  ffi.Pointer<ImGuiViewport> ret;

  ret = _cimgui.igFindViewportByID(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiViewport> findViewportByPlatformHandle(
  ffi.Pointer<ffi.Void> platformHandle,
) {
  ffi.Pointer<ImGuiViewport> ret;

  ret = _cimgui.igFindViewportByPlatformHandle(
    platformHandle,
  );

  return ret;
}

ffi.Pointer<ImGuiTableSortSpecs> imGuiTableSortSpecsImGuiTableSortSpecs(
) {
  ffi.Pointer<ImGuiTableSortSpecs> ret;

  ret = _cimgui.ImGuiTableSortSpecs_ImGuiTableSortSpecs(
  );

  return ret;
}

void imGuiTableSortSpecsDestroy(
  ffi.Pointer<ImGuiTableSortSpecs> self,
) {

  _cimgui.ImGuiTableSortSpecs_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableColumnSortSpecs> imGuiTableColumnSortSpecsImGuiTableColumnSortSpecs(
) {
  ffi.Pointer<ImGuiTableColumnSortSpecs> ret;

  ret = _cimgui.ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs(
  );

  return ret;
}

void imGuiTableColumnSortSpecsDestroy(
  ffi.Pointer<ImGuiTableColumnSortSpecs> self,
) {

  _cimgui.ImGuiTableColumnSortSpecs_destroy(
    self,
  );

}

ffi.Pointer<ImGuiStyle> imGuiStyleImGuiStyle(
) {
  ffi.Pointer<ImGuiStyle> ret;

  ret = _cimgui.ImGuiStyle_ImGuiStyle(
  );

  return ret;
}

void imGuiStyleDestroy(
  ffi.Pointer<ImGuiStyle> self,
) {

  _cimgui.ImGuiStyle_destroy(
    self,
  );

}

void imGuiStyleScaleAllSizes(
  ffi.Pointer<ImGuiStyle> self,
  double scaleFactor,
) {

  _cimgui.ImGuiStyle_ScaleAllSizes(
    self,
    scaleFactor,
  );

}

void imGuiIOAddKeyEvent(
  ffi.Pointer<ImGuiIO> self,
  ImGuiKey key,
  bool down,
) {

  _cimgui.ImGuiIO_AddKeyEvent(
    self,
    key,
    down,
  );

}

void imGuiIOAddKeyAnalogEvent(
  ffi.Pointer<ImGuiIO> self,
  ImGuiKey key,
  bool down,
  double v,
) {

  _cimgui.ImGuiIO_AddKeyAnalogEvent(
    self,
    key,
    down,
    v,
  );

}

void imGuiIOAddMousePosEvent(
  ffi.Pointer<ImGuiIO> self,
  double x,
  double y,
) {

  _cimgui.ImGuiIO_AddMousePosEvent(
    self,
    x,
    y,
  );

}

void imGuiIOAddMouseButtonEvent(
  ffi.Pointer<ImGuiIO> self,
  int button,
  bool down,
) {

  _cimgui.ImGuiIO_AddMouseButtonEvent(
    self,
    button,
    down,
  );

}

void imGuiIOAddMouseWheelEvent(
  ffi.Pointer<ImGuiIO> self,
  double wheelX,
  double wheelY,
) {

  _cimgui.ImGuiIO_AddMouseWheelEvent(
    self,
    wheelX,
    wheelY,
  );

}

void imGuiIOAddMouseSourceEvent(
  ffi.Pointer<ImGuiIO> self,
  ImGuiMouseSource source,
) {

  _cimgui.ImGuiIO_AddMouseSourceEvent(
    self,
    source,
  );

}

void imGuiIOAddMouseViewportEvent(
  ffi.Pointer<ImGuiIO> self,
  int id,
) {

  _cimgui.ImGuiIO_AddMouseViewportEvent(
    self,
    id,
  );

}

void imGuiIOAddFocusEvent(
  ffi.Pointer<ImGuiIO> self,
  bool focused,
) {

  _cimgui.ImGuiIO_AddFocusEvent(
    self,
    focused,
  );

}

void imGuiIOAddInputCharacter(
  ffi.Pointer<ImGuiIO> self,
  int c,
) {

  _cimgui.ImGuiIO_AddInputCharacter(
    self,
    c,
  );

}

void imGuiIOAddInputCharacterUTF16(
  ffi.Pointer<ImGuiIO> self,
  int c,
) {

  _cimgui.ImGuiIO_AddInputCharacterUTF16(
    self,
    c,
  );

}

void imGuiIOAddInputCharactersUTF8(
  ffi.Pointer<ImGuiIO> self,
  String str,
) {
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImGuiIO_AddInputCharactersUTF8(
    self,
    _str,
  );

}

void imGuiIOSetKeyEventNativeData(
  ffi.Pointer<ImGuiIO> self,
  ImGuiKey key,
  int nativeKeycode,
  int nativeScancode,
  int nativeLegacyIndex,
) {

  _cimgui.ImGuiIO_SetKeyEventNativeData(
    self,
    key,
    nativeKeycode,
    nativeScancode,
    nativeLegacyIndex,
  );

}

void imGuiIOSetAppAcceptingEvents(
  ffi.Pointer<ImGuiIO> self,
  bool acceptingEvents,
) {

  _cimgui.ImGuiIO_SetAppAcceptingEvents(
    self,
    acceptingEvents,
  );

}

void imGuiIOClearEventsQueue(
  ffi.Pointer<ImGuiIO> self,
) {

  _cimgui.ImGuiIO_ClearEventsQueue(
    self,
  );

}

void imGuiIOClearInputKeys(
  ffi.Pointer<ImGuiIO> self,
) {

  _cimgui.ImGuiIO_ClearInputKeys(
    self,
  );

}

void imGuiIOClearInputMouse(
  ffi.Pointer<ImGuiIO> self,
) {

  _cimgui.ImGuiIO_ClearInputMouse(
    self,
  );

}

ffi.Pointer<ImGuiIO> imGuiIOImGuiIO(
) {
  ffi.Pointer<ImGuiIO> ret;

  ret = _cimgui.ImGuiIO_ImGuiIO(
  );

  return ret;
}

void imGuiIODestroy(
  ffi.Pointer<ImGuiIO> self,
) {

  _cimgui.ImGuiIO_destroy(
    self,
  );

}

ffi.Pointer<ImGuiInputTextCallbackData> imGuiInputTextCallbackDataImGuiInputTextCallbackData(
) {
  ffi.Pointer<ImGuiInputTextCallbackData> ret;

  ret = _cimgui.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData(
  );

  return ret;
}

void imGuiInputTextCallbackDataDestroy(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
) {

  _cimgui.ImGuiInputTextCallbackData_destroy(
    self,
  );

}

void imGuiInputTextCallbackDataDeleteChars(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
  int pos,
  int bytesCount,
) {

  _cimgui.ImGuiInputTextCallbackData_DeleteChars(
    self,
    pos,
    bytesCount,
  );

}

void imGuiInputTextCallbackDataInsertChars(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
  int pos,
  String text,
  [String? textEnd,]
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImGuiInputTextCallbackData_InsertChars(
    self,
    pos,
    _text,
    _textEnd,
  );

}

void imGuiInputTextCallbackDataSelectAll(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
) {

  _cimgui.ImGuiInputTextCallbackData_SelectAll(
    self,
  );

}

void imGuiInputTextCallbackDataClearSelection(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
) {

  _cimgui.ImGuiInputTextCallbackData_ClearSelection(
    self,
  );

}

bool imGuiInputTextCallbackDataHasSelection(
  ffi.Pointer<ImGuiInputTextCallbackData> self,
) {
  bool ret;

  ret = _cimgui.ImGuiInputTextCallbackData_HasSelection(
    self,
  );

  return ret;
}

ffi.Pointer<ImGuiWindowClass> imGuiWindowClassImGuiWindowClass(
) {
  ffi.Pointer<ImGuiWindowClass> ret;

  ret = _cimgui.ImGuiWindowClass_ImGuiWindowClass(
  );

  return ret;
}

void imGuiWindowClassDestroy(
  ffi.Pointer<ImGuiWindowClass> self,
) {

  _cimgui.ImGuiWindowClass_destroy(
    self,
  );

}

ffi.Pointer<ImGuiPayload> imGuiPayloadImGuiPayload(
) {
  ffi.Pointer<ImGuiPayload> ret;

  ret = _cimgui.ImGuiPayload_ImGuiPayload(
  );

  return ret;
}

void imGuiPayloadDestroy(
  ffi.Pointer<ImGuiPayload> self,
) {

  _cimgui.ImGuiPayload_destroy(
    self,
  );

}

void imGuiPayloadClear(
  ffi.Pointer<ImGuiPayload> self,
) {

  _cimgui.ImGuiPayload_Clear(
    self,
  );

}

bool imGuiPayloadIsDataType(
  ffi.Pointer<ImGuiPayload> self,
  String type,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _type = type != null ? type.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiPayload_IsDataType(
    self,
    _type,
  );

  return ret;
}

bool imGuiPayloadIsPreview(
  ffi.Pointer<ImGuiPayload> self,
) {
  bool ret;

  ret = _cimgui.ImGuiPayload_IsPreview(
    self,
  );

  return ret;
}

bool imGuiPayloadIsDelivery(
  ffi.Pointer<ImGuiPayload> self,
) {
  bool ret;

  ret = _cimgui.ImGuiPayload_IsDelivery(
    self,
  );

  return ret;
}

ffi.Pointer<ImGuiOnceUponAFrame> imGuiOnceUponAFrameImGuiOnceUponAFrame(
) {
  ffi.Pointer<ImGuiOnceUponAFrame> ret;

  ret = _cimgui.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame(
  );

  return ret;
}

void imGuiOnceUponAFrameDestroy(
  ffi.Pointer<ImGuiOnceUponAFrame> self,
) {

  _cimgui.ImGuiOnceUponAFrame_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTextFilter> imGuiTextFilterImGuiTextFilter(
  [String defaultFilter = "",]
) {
  ffi.Pointer<ImGuiTextFilter> ret;
  final ffi.Pointer<ffi.Char> _defaultFilter = defaultFilter != null ? defaultFilter.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextFilter_ImGuiTextFilter(
    _defaultFilter,
  );

  return ret;
}

void imGuiTextFilterDestroy(
  ffi.Pointer<ImGuiTextFilter> self,
) {

  _cimgui.ImGuiTextFilter_destroy(
    self,
  );

}

bool imGuiTextFilterDraw(
  ffi.Pointer<ImGuiTextFilter> self,
  [String label = "Filter(inc,-exc)",
  double width = 0.0,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextFilter_Draw(
    self,
    _label,
    width,
  );

  return ret;
}

bool imGuiTextFilterPassFilter(
  ffi.Pointer<ImGuiTextFilter> self,
  String text,
  [String? textEnd,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextFilter_PassFilter(
    self,
    _text,
    _textEnd,
  );

  return ret;
}

void imGuiTextFilterBuild(
  ffi.Pointer<ImGuiTextFilter> self,
) {

  _cimgui.ImGuiTextFilter_Build(
    self,
  );

}

void imGuiTextFilterClear(
  ffi.Pointer<ImGuiTextFilter> self,
) {

  _cimgui.ImGuiTextFilter_Clear(
    self,
  );

}

bool imGuiTextFilterIsActive(
  ffi.Pointer<ImGuiTextFilter> self,
) {
  bool ret;

  ret = _cimgui.ImGuiTextFilter_IsActive(
    self,
  );

  return ret;
}

ffi.Pointer<ImGuiTextRange> imGuiTextRangeImGuiTextRangeNil(
) {
  ffi.Pointer<ImGuiTextRange> ret;

  ret = _cimgui.ImGuiTextRange_ImGuiTextRange_Nil(
  );

  return ret;
}

void imGuiTextRangeDestroy(
  ffi.Pointer<ImGuiTextRange> self,
) {

  _cimgui.ImGuiTextRange_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTextRange> imGuiTextRangeImGuiTextRangeStr(
  String b,
  String e,
) {
  ffi.Pointer<ImGuiTextRange> ret;
  final ffi.Pointer<ffi.Char> _b = b != null ? b.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _e = e != null ? e.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextRange_ImGuiTextRange_Str(
    _b,
    _e,
  );

  return ret;
}

bool imGuiTextRangeEmpty(
  ffi.Pointer<ImGuiTextRange> self,
) {
  bool ret;

  ret = _cimgui.ImGuiTextRange_empty(
    self,
  );

  return ret;
}

void imGuiTextRangeSplit(
  ffi.Pointer<ImGuiTextRange> self,
  int separator,
  ffi.Pointer<ImVector_ImGuiTextRange> out,
) {

  _cimgui.ImGuiTextRange_split(
    self,
    separator,
    out,
  );

}

ffi.Pointer<ImGuiTextBuffer> imGuiTextBufferImGuiTextBuffer(
) {
  ffi.Pointer<ImGuiTextBuffer> ret;

  ret = _cimgui.ImGuiTextBuffer_ImGuiTextBuffer(
  );

  return ret;
}

void imGuiTextBufferDestroy(
  ffi.Pointer<ImGuiTextBuffer> self,
) {

  _cimgui.ImGuiTextBuffer_destroy(
    self,
  );

}

ffi.Pointer<ffi.Char> imGuiTextBufferBegin(
  ffi.Pointer<ImGuiTextBuffer> self,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.ImGuiTextBuffer_begin(
    self,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imGuiTextBufferEnd(
  ffi.Pointer<ImGuiTextBuffer> self,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.ImGuiTextBuffer_end(
    self,
  );

  return ret;
}

int imGuiTextBufferSize(
  ffi.Pointer<ImGuiTextBuffer> self,
) {
  int ret;

  ret = _cimgui.ImGuiTextBuffer_size(
    self,
  );

  return ret;
}

bool imGuiTextBufferEmpty(
  ffi.Pointer<ImGuiTextBuffer> self,
) {
  bool ret;

  ret = _cimgui.ImGuiTextBuffer_empty(
    self,
  );

  return ret;
}

void imGuiTextBufferClear(
  ffi.Pointer<ImGuiTextBuffer> self,
) {

  _cimgui.ImGuiTextBuffer_clear(
    self,
  );

}

void imGuiTextBufferReserve(
  ffi.Pointer<ImGuiTextBuffer> self,
  int capacity,
) {

  _cimgui.ImGuiTextBuffer_reserve(
    self,
    capacity,
  );

}

ffi.Pointer<ffi.Char> imGuiTextBufferCStr(
  ffi.Pointer<ImGuiTextBuffer> self,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.ImGuiTextBuffer_c_str(
    self,
  );

  return ret;
}

void imGuiTextBufferAppend(
  ffi.Pointer<ImGuiTextBuffer> self,
  String str,
  [String? strEnd,]
) {
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strEnd = strEnd != null ? strEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImGuiTextBuffer_append(
    self,
    _str,
    _strEnd,
  );

}

ffi.Pointer<ImGuiStoragePair> imGuiStoragePairImGuiStoragePairInt(
  int key,
  int val,
) {
  ffi.Pointer<ImGuiStoragePair> ret;

  ret = _cimgui.ImGuiStoragePair_ImGuiStoragePair_Int(
    key,
    val,
  );

  return ret;
}

void imGuiStoragePairDestroy(
  ffi.Pointer<ImGuiStoragePair> self,
) {

  _cimgui.ImGuiStoragePair_destroy(
    self,
  );

}

ffi.Pointer<ImGuiStoragePair> imGuiStoragePairImGuiStoragePairFloat(
  int key,
  double val,
) {
  ffi.Pointer<ImGuiStoragePair> ret;

  ret = _cimgui.ImGuiStoragePair_ImGuiStoragePair_Float(
    key,
    val,
  );

  return ret;
}

ffi.Pointer<ImGuiStoragePair> imGuiStoragePairImGuiStoragePairPtr(
  int key,
  ffi.Pointer<ffi.Void> val,
) {
  ffi.Pointer<ImGuiStoragePair> ret;

  ret = _cimgui.ImGuiStoragePair_ImGuiStoragePair_Ptr(
    key,
    val,
  );

  return ret;
}

void imGuiStorageClear(
  ffi.Pointer<ImGuiStorage> self,
) {

  _cimgui.ImGuiStorage_Clear(
    self,
  );

}

int imGuiStorageGetInt(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [int defaultVal = 0,]
) {
  int ret;

  ret = _cimgui.ImGuiStorage_GetInt(
    self,
    key,
    defaultVal,
  );

  return ret;
}

void imGuiStorageSetInt(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  int val,
) {

  _cimgui.ImGuiStorage_SetInt(
    self,
    key,
    val,
  );

}

bool imGuiStorageGetBool(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [bool defaultVal = false,]
) {
  bool ret;

  ret = _cimgui.ImGuiStorage_GetBool(
    self,
    key,
    defaultVal,
  );

  return ret;
}

void imGuiStorageSetBool(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  bool val,
) {

  _cimgui.ImGuiStorage_SetBool(
    self,
    key,
    val,
  );

}

double imGuiStorageGetFloat(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [double defaultVal = 0.0,]
) {
  double ret;

  ret = _cimgui.ImGuiStorage_GetFloat(
    self,
    key,
    defaultVal,
  );

  return ret;
}

void imGuiStorageSetFloat(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  double val,
) {

  _cimgui.ImGuiStorage_SetFloat(
    self,
    key,
    val,
  );

}

ffi.Pointer<ffi.Void> imGuiStorageGetVoidPtr(
  ffi.Pointer<ImGuiStorage> self,
  int key,
) {
  ffi.Pointer<ffi.Void> ret;

  ret = _cimgui.ImGuiStorage_GetVoidPtr(
    self,
    key,
  );

  return ret;
}

void imGuiStorageSetVoidPtr(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  ffi.Pointer<ffi.Void> val,
) {

  _cimgui.ImGuiStorage_SetVoidPtr(
    self,
    key,
    val,
  );

}

ffi.Pointer<ffi.Int> imGuiStorageGetIntRef(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [int defaultVal = 0,]
) {
  ffi.Pointer<ffi.Int> ret;

  ret = _cimgui.ImGuiStorage_GetIntRef(
    self,
    key,
    defaultVal,
  );

  return ret;
}

ffi.Pointer<ffi.Bool> imGuiStorageGetBoolRef(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [bool defaultVal = false,]
) {
  ffi.Pointer<ffi.Bool> ret;

  ret = _cimgui.ImGuiStorage_GetBoolRef(
    self,
    key,
    defaultVal,
  );

  return ret;
}

ffi.Pointer<ffi.Float> imGuiStorageGetFloatRef(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [double defaultVal = 0.0,]
) {
  ffi.Pointer<ffi.Float> ret;

  ret = _cimgui.ImGuiStorage_GetFloatRef(
    self,
    key,
    defaultVal,
  );

  return ret;
}

ffi.Pointer<ffi.Pointer<ffi.Void>> imGuiStorageGetVoidPtrRef(
  ffi.Pointer<ImGuiStorage> self,
  int key,
  [ffi.Pointer<ffi.Void>? defaultVal,]
) {
  ffi.Pointer<ffi.Pointer<ffi.Void>> ret;

  ret = _cimgui.ImGuiStorage_GetVoidPtrRef(
    self,
    key,
    defaultVal,
  );

  return ret;
}

void imGuiStorageBuildSortByKey(
  ffi.Pointer<ImGuiStorage> self,
) {

  _cimgui.ImGuiStorage_BuildSortByKey(
    self,
  );

}

void imGuiStorageSetAllInt(
  ffi.Pointer<ImGuiStorage> self,
  int val,
) {

  _cimgui.ImGuiStorage_SetAllInt(
    self,
    val,
  );

}

ffi.Pointer<ImGuiListClipper> imGuiListClipperImGuiListClipper(
) {
  ffi.Pointer<ImGuiListClipper> ret;

  ret = _cimgui.ImGuiListClipper_ImGuiListClipper(
  );

  return ret;
}

void imGuiListClipperDestroy(
  ffi.Pointer<ImGuiListClipper> self,
) {

  _cimgui.ImGuiListClipper_destroy(
    self,
  );

}

void imGuiListClipperBegin(
  ffi.Pointer<ImGuiListClipper> self,
  int itemsCount,
  [double itemsHeight = -1.0,]
) {

  _cimgui.ImGuiListClipper_Begin(
    self,
    itemsCount,
    itemsHeight,
  );

}

void imGuiListClipperEnd(
  ffi.Pointer<ImGuiListClipper> self,
) {

  _cimgui.ImGuiListClipper_End(
    self,
  );

}

bool imGuiListClipperStep(
  ffi.Pointer<ImGuiListClipper> self,
) {
  bool ret;

  ret = _cimgui.ImGuiListClipper_Step(
    self,
  );

  return ret;
}

void imGuiListClipperIncludeItemByIndex(
  ffi.Pointer<ImGuiListClipper> self,
  int itemIndex,
) {

  _cimgui.ImGuiListClipper_IncludeItemByIndex(
    self,
    itemIndex,
  );

}

void imGuiListClipperIncludeItemsByIndex(
  ffi.Pointer<ImGuiListClipper> self,
  int itemBegin,
  int itemEnd,
) {

  _cimgui.ImGuiListClipper_IncludeItemsByIndex(
    self,
    itemBegin,
    itemEnd,
  );

}

void imGuiListClipperSeekCursorForItem(
  ffi.Pointer<ImGuiListClipper> self,
  int itemIndex,
) {

  _cimgui.ImGuiListClipper_SeekCursorForItem(
    self,
    itemIndex,
  );

}

ffi.Pointer<ImColor> imColorImColorNil(
) {
  ffi.Pointer<ImColor> ret;

  ret = _cimgui.ImColor_ImColor_Nil(
  );

  return ret;
}

void imColorDestroy(
  ffi.Pointer<ImColor> self,
) {

  _cimgui.ImColor_destroy(
    self,
  );

}

ffi.Pointer<ImColor> imColorImColorFloat(
  double r,
  double g,
  double b,
  double a,
) {
  ffi.Pointer<ImColor> ret;

  ret = _cimgui.ImColor_ImColor_Float(
    r,
    g,
    b,
    a,
  );

  return ret;
}

ffi.Pointer<ImColor> imColorImColorVec4(
  ImVec4 col,
) {
  ffi.Pointer<ImColor> ret;

  ret = _cimgui.ImColor_ImColor_Vec4(
    col,
  );

  return ret;
}

ffi.Pointer<ImColor> imColorImColorInt(
  int r,
  int g,
  int b,
  int a,
) {
  ffi.Pointer<ImColor> ret;

  ret = _cimgui.ImColor_ImColor_Int(
    r,
    g,
    b,
    a,
  );

  return ret;
}

ffi.Pointer<ImColor> imColorImColorU32(
  int rgba,
) {
  ffi.Pointer<ImColor> ret;

  ret = _cimgui.ImColor_ImColor_U32(
    rgba,
  );

  return ret;
}

void imColorSetHSV(
  ffi.Pointer<ImColor> self,
  double h,
  double s,
  double v,
  [double a = 1.0,]
) {

  _cimgui.ImColor_SetHSV(
    self,
    h,
    s,
    v,
    a,
  );

}

void imColorHSV(
  ffi.Pointer<ImColor> pOut,
  double h,
  double s,
  double v,
  [double a = 1.0,]
) {

  _cimgui.ImColor_HSV(
    pOut,
    h,
    s,
    v,
    a,
  );

}

ffi.Pointer<ImGuiSelectionBasicStorage> imGuiSelectionBasicStorageImGuiSelectionBasicStorage(
) {
  ffi.Pointer<ImGuiSelectionBasicStorage> ret;

  ret = _cimgui.ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage(
  );

  return ret;
}

void imGuiSelectionBasicStorageDestroy(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
) {

  _cimgui.ImGuiSelectionBasicStorage_destroy(
    self,
  );

}

void imGuiSelectionBasicStorageApplyRequests(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  ffi.Pointer<ImGuiMultiSelectIO> msIo,
) {

  _cimgui.ImGuiSelectionBasicStorage_ApplyRequests(
    self,
    msIo,
  );

}

bool imGuiSelectionBasicStorageContains(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  int id,
) {
  bool ret;

  ret = _cimgui.ImGuiSelectionBasicStorage_Contains(
    self,
    id,
  );

  return ret;
}

void imGuiSelectionBasicStorageClear(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
) {

  _cimgui.ImGuiSelectionBasicStorage_Clear(
    self,
  );

}

void imGuiSelectionBasicStorageSwap(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  ffi.Pointer<ImGuiSelectionBasicStorage> r,
) {

  _cimgui.ImGuiSelectionBasicStorage_Swap(
    self,
    r,
  );

}

void imGuiSelectionBasicStorageSetItemSelected(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  int id,
  bool selected,
) {

  _cimgui.ImGuiSelectionBasicStorage_SetItemSelected(
    self,
    id,
    selected,
  );

}

bool imGuiSelectionBasicStorageGetNextSelectedItem(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  ffi.Pointer<ffi.Pointer<ffi.Void>> opaqueIt,
  ffi.Pointer<ImGuiID> outId,
) {
  bool ret;

  ret = _cimgui.ImGuiSelectionBasicStorage_GetNextSelectedItem(
    self,
    opaqueIt,
    outId,
  );

  return ret;
}

int imGuiSelectionBasicStorageGetStorageIdFromIndex(
  ffi.Pointer<ImGuiSelectionBasicStorage> self,
  int idx,
) {
  int ret;

  ret = _cimgui.ImGuiSelectionBasicStorage_GetStorageIdFromIndex(
    self,
    idx,
  );

  return ret;
}

ffi.Pointer<ImGuiSelectionExternalStorage> imGuiSelectionExternalStorageImGuiSelectionExternalStorage(
) {
  ffi.Pointer<ImGuiSelectionExternalStorage> ret;

  ret = _cimgui.ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage(
  );

  return ret;
}

void imGuiSelectionExternalStorageDestroy(
  ffi.Pointer<ImGuiSelectionExternalStorage> self,
) {

  _cimgui.ImGuiSelectionExternalStorage_destroy(
    self,
  );

}

void imGuiSelectionExternalStorageApplyRequests(
  ffi.Pointer<ImGuiSelectionExternalStorage> self,
  ffi.Pointer<ImGuiMultiSelectIO> msIo,
) {

  _cimgui.ImGuiSelectionExternalStorage_ApplyRequests(
    self,
    msIo,
  );

}

ffi.Pointer<ImDrawCmd> imDrawCmdImDrawCmd(
) {
  ffi.Pointer<ImDrawCmd> ret;

  ret = _cimgui.ImDrawCmd_ImDrawCmd(
  );

  return ret;
}

void imDrawCmdDestroy(
  ffi.Pointer<ImDrawCmd> self,
) {

  _cimgui.ImDrawCmd_destroy(
    self,
  );

}

int imDrawCmdGetTexID(
  ffi.Pointer<ImDrawCmd> self,
) {
  int ret;

  ret = _cimgui.ImDrawCmd_GetTexID(
    self,
  );

  return ret;
}

ffi.Pointer<ImDrawListSplitter> imDrawListSplitterImDrawListSplitter(
) {
  ffi.Pointer<ImDrawListSplitter> ret;

  ret = _cimgui.ImDrawListSplitter_ImDrawListSplitter(
  );

  return ret;
}

void imDrawListSplitterDestroy(
  ffi.Pointer<ImDrawListSplitter> self,
) {

  _cimgui.ImDrawListSplitter_destroy(
    self,
  );

}

void imDrawListSplitterClear(
  ffi.Pointer<ImDrawListSplitter> self,
) {

  _cimgui.ImDrawListSplitter_Clear(
    self,
  );

}

void imDrawListSplitterClearFreeMemory(
  ffi.Pointer<ImDrawListSplitter> self,
) {

  _cimgui.ImDrawListSplitter_ClearFreeMemory(
    self,
  );

}

void imDrawListSplitterSplit(
  ffi.Pointer<ImDrawListSplitter> self,
  ffi.Pointer<ImDrawList> drawList,
  int count,
) {

  _cimgui.ImDrawListSplitter_Split(
    self,
    drawList,
    count,
  );

}

void imDrawListSplitterMerge(
  ffi.Pointer<ImDrawListSplitter> self,
  ffi.Pointer<ImDrawList> drawList,
) {

  _cimgui.ImDrawListSplitter_Merge(
    self,
    drawList,
  );

}

void imDrawListSplitterSetCurrentChannel(
  ffi.Pointer<ImDrawListSplitter> self,
  ffi.Pointer<ImDrawList> drawList,
  int channelIdx,
) {

  _cimgui.ImDrawListSplitter_SetCurrentChannel(
    self,
    drawList,
    channelIdx,
  );

}

ffi.Pointer<ImDrawList> imDrawListImDrawList(
  ffi.Pointer<ImDrawListSharedData> sharedData,
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.ImDrawList_ImDrawList(
    sharedData,
  );

  return ret;
}

void imDrawListDestroy(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_destroy(
    self,
  );

}

void imDrawListPushClipRect(
  ffi.Pointer<ImDrawList> self,
  ImVec2 clipRectMin,
  ImVec2 clipRectMax,
  [bool intersectWithCurrentClipRect = false,]
) {

  _cimgui.ImDrawList_PushClipRect(
    self,
    clipRectMin,
    clipRectMax,
    intersectWithCurrentClipRect,
  );

}

void imDrawListPushClipRectFullScreen(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_PushClipRectFullScreen(
    self,
  );

}

void imDrawListPopClipRect(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_PopClipRect(
    self,
  );

}

void imDrawListPushTextureID(
  ffi.Pointer<ImDrawList> self,
  int textureId,
) {

  _cimgui.ImDrawList_PushTextureID(
    self,
    textureId,
  );

}

void imDrawListPopTextureID(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_PopTextureID(
    self,
  );

}

void imDrawListGetClipRectMin(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_GetClipRectMin(
    pOut,
    self,
  );

}

void imDrawListGetClipRectMax(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_GetClipRectMax(
    pOut,
    self,
  );

}

void imDrawListAddLine(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  int col,
  [double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddLine(
    self,
    p1,
    p2,
    col,
    thickness,
  );

}

void imDrawListAddRect(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pMin,
  ImVec2 pMax,
  int col,
  [double rounding = 0.0,
  int flags = 0,
  double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddRect(
    self,
    pMin,
    pMax,
    col,
    rounding,
    flags,
    thickness,
  );

}

void imDrawListAddRectFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pMin,
  ImVec2 pMax,
  int col,
  [double rounding = 0.0,
  int flags = 0,]
) {

  _cimgui.ImDrawList_AddRectFilled(
    self,
    pMin,
    pMax,
    col,
    rounding,
    flags,
  );

}

void imDrawListAddRectFilledMultiColor(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pMin,
  ImVec2 pMax,
  int colUprLeft,
  int colUprRight,
  int colBotRight,
  int colBotLeft,
) {

  _cimgui.ImDrawList_AddRectFilledMultiColor(
    self,
    pMin,
    pMax,
    colUprLeft,
    colUprRight,
    colBotRight,
    colBotLeft,
  );

}

void imDrawListAddQuad(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  int col,
  [double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddQuad(
    self,
    p1,
    p2,
    p3,
    p4,
    col,
    thickness,
  );

}

void imDrawListAddQuadFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  int col,
) {

  _cimgui.ImDrawList_AddQuadFilled(
    self,
    p1,
    p2,
    p3,
    p4,
    col,
  );

}

void imDrawListAddTriangle(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  int col,
  [double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddTriangle(
    self,
    p1,
    p2,
    p3,
    col,
    thickness,
  );

}

void imDrawListAddTriangleFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  int col,
) {

  _cimgui.ImDrawList_AddTriangleFilled(
    self,
    p1,
    p2,
    p3,
    col,
  );

}

void imDrawListAddCircle(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int col,
  [int numSegments = 0,
  double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddCircle(
    self,
    center,
    radius,
    col,
    numSegments,
    thickness,
  );

}

void imDrawListAddCircleFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int col,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_AddCircleFilled(
    self,
    center,
    radius,
    col,
    numSegments,
  );

}

void imDrawListAddNgon(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int col,
  int numSegments,
  [double thickness = 1.0,]
) {

  _cimgui.ImDrawList_AddNgon(
    self,
    center,
    radius,
    col,
    numSegments,
    thickness,
  );

}

void imDrawListAddNgonFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int col,
  int numSegments,
) {

  _cimgui.ImDrawList_AddNgonFilled(
    self,
    center,
    radius,
    col,
    numSegments,
  );

}

void imDrawListAddEllipse(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  ImVec2 radius,
  int col,
  double rot,
  int numSegments,
  double thickness,
) {

  _cimgui.ImDrawList_AddEllipse(
    self,
    center,
    radius,
    col,
    rot,
    numSegments,
    thickness,
  );

}

void imDrawListAddEllipseFilled(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  ImVec2 radius,
  int col,
  double rot,
  int numSegments,
) {

  _cimgui.ImDrawList_AddEllipseFilled(
    self,
    center,
    radius,
    col,
    rot,
    numSegments,
  );

}

void imDrawListAddTextVec2(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pos,
  int col,
  String textBegin,
  String textEnd,
) {
  final ffi.Pointer<ffi.Char> _textBegin = textBegin != null ? textBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImDrawList_AddText_Vec2(
    self,
    pos,
    col,
    _textBegin,
    _textEnd,
  );

}

void imDrawListAddTextFontPtr(
  ffi.Pointer<ImDrawList> self,
  ffi.Pointer<ImFont> font,
  double fontSize,
  ImVec2 pos,
  int col,
  String textBegin,
  String textEnd,
  double wrapWidth,
  ffi.Pointer<ImVec4> cpuFineClipRect,
) {
  final ffi.Pointer<ffi.Char> _textBegin = textBegin != null ? textBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImDrawList_AddText_FontPtr(
    self,
    font,
    fontSize,
    pos,
    col,
    _textBegin,
    _textEnd,
    wrapWidth,
    cpuFineClipRect,
  );

}

void imDrawListAddBezierCubic(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  int col,
  double thickness,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_AddBezierCubic(
    self,
    p1,
    p2,
    p3,
    p4,
    col,
    thickness,
    numSegments,
  );

}

void imDrawListAddBezierQuadratic(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  int col,
  double thickness,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_AddBezierQuadratic(
    self,
    p1,
    p2,
    p3,
    col,
    thickness,
    numSegments,
  );

}

void imDrawListAddPolyline(
  ffi.Pointer<ImDrawList> self,
  ffi.Pointer<ImVec2> points,
  int numPoints,
  int col,
  int flags,
  double thickness,
) {

  _cimgui.ImDrawList_AddPolyline(
    self,
    points,
    numPoints,
    col,
    flags,
    thickness,
  );

}

void imDrawListAddConvexPolyFilled(
  ffi.Pointer<ImDrawList> self,
  ffi.Pointer<ImVec2> points,
  int numPoints,
  int col,
) {

  _cimgui.ImDrawList_AddConvexPolyFilled(
    self,
    points,
    numPoints,
    col,
  );

}

void imDrawListAddConcavePolyFilled(
  ffi.Pointer<ImDrawList> self,
  ffi.Pointer<ImVec2> points,
  int numPoints,
  int col,
) {

  _cimgui.ImDrawList_AddConcavePolyFilled(
    self,
    points,
    numPoints,
    col,
  );

}

void imDrawListAddImage(
  ffi.Pointer<ImDrawList> self,
  int userTextureId,
  ImVec2 pMin,
  ImVec2 pMax,
  [ImVec2 uvMin = ImVec2(0,0),
  ImVec2 uvMax = ImVec2(1,1),
  int col = 429496729,]
) {

  _cimgui.ImDrawList_AddImage(
    self,
    userTextureId,
    pMin,
    pMax,
    uvMin,
    uvMax,
    col,
  );

}

void imDrawListAddImageQuad(
  ffi.Pointer<ImDrawList> self,
  int userTextureId,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  [ImVec2 uv1 = ImVec2(0,0),
  ImVec2 uv2 = ImVec2(1,0),
  ImVec2 uv3 = ImVec2(1,1),
  ImVec2 uv4 = ImVec2(0,1),
  int col = 429496729,]
) {

  _cimgui.ImDrawList_AddImageQuad(
    self,
    userTextureId,
    p1,
    p2,
    p3,
    p4,
    uv1,
    uv2,
    uv3,
    uv4,
    col,
  );

}

void imDrawListAddImageRounded(
  ffi.Pointer<ImDrawList> self,
  int userTextureId,
  ImVec2 pMin,
  ImVec2 pMax,
  ImVec2 uvMin,
  ImVec2 uvMax,
  int col,
  double rounding,
  [int flags = 0,]
) {

  _cimgui.ImDrawList_AddImageRounded(
    self,
    userTextureId,
    pMin,
    pMax,
    uvMin,
    uvMax,
    col,
    rounding,
    flags,
  );

}

void imDrawListPathClear(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_PathClear(
    self,
  );

}

void imDrawListPathLineTo(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pos,
) {

  _cimgui.ImDrawList_PathLineTo(
    self,
    pos,
  );

}

void imDrawListPathLineToMergeDuplicate(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pos,
) {

  _cimgui.ImDrawList_PathLineToMergeDuplicate(
    self,
    pos,
  );

}

void imDrawListPathFillConvex(
  ffi.Pointer<ImDrawList> self,
  int col,
) {

  _cimgui.ImDrawList_PathFillConvex(
    self,
    col,
  );

}

void imDrawListPathFillConcave(
  ffi.Pointer<ImDrawList> self,
  int col,
) {

  _cimgui.ImDrawList_PathFillConcave(
    self,
    col,
  );

}

void imDrawListPathStroke(
  ffi.Pointer<ImDrawList> self,
  int col,
  [int flags = 0,
  double thickness = 1.0,]
) {

  _cimgui.ImDrawList_PathStroke(
    self,
    col,
    flags,
    thickness,
  );

}

void imDrawListPathArcTo(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  double aMin,
  double aMax,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_PathArcTo(
    self,
    center,
    radius,
    aMin,
    aMax,
    numSegments,
  );

}

void imDrawListPathArcToFast(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int aMinOf12,
  int aMaxOf12,
) {

  _cimgui.ImDrawList_PathArcToFast(
    self,
    center,
    radius,
    aMinOf12,
    aMaxOf12,
  );

}

void imDrawListPathEllipticalArcTo(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  ImVec2 radius,
  double rot,
  double aMin,
  double aMax,
  int numSegments,
) {

  _cimgui.ImDrawList_PathEllipticalArcTo(
    self,
    center,
    radius,
    rot,
    aMin,
    aMax,
    numSegments,
  );

}

void imDrawListPathBezierCubicCurveTo(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_PathBezierCubicCurveTo(
    self,
    p2,
    p3,
    p4,
    numSegments,
  );

}

void imDrawListPathBezierQuadraticCurveTo(
  ffi.Pointer<ImDrawList> self,
  ImVec2 p2,
  ImVec2 p3,
  [int numSegments = 0,]
) {

  _cimgui.ImDrawList_PathBezierQuadraticCurveTo(
    self,
    p2,
    p3,
    numSegments,
  );

}

void imDrawListPathRect(
  ffi.Pointer<ImDrawList> self,
  ImVec2 rectMin,
  ImVec2 rectMax,
  [double rounding = 0.0,
  int flags = 0,]
) {

  _cimgui.ImDrawList_PathRect(
    self,
    rectMin,
    rectMax,
    rounding,
    flags,
  );

}

void imDrawListAddCallback(
  ffi.Pointer<ImDrawList> self,
  ImDrawCallback callback,
  ffi.Pointer<ffi.Void> userdata,
  int userdataSize,
) {

  _cimgui.ImDrawList_AddCallback(
    self,
    callback,
    userdata,
    userdataSize,
  );

}

void imDrawListAddDrawCmd(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_AddDrawCmd(
    self,
  );

}

ffi.Pointer<ImDrawList> imDrawListCloneOutput(
  ffi.Pointer<ImDrawList> self,
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.ImDrawList_CloneOutput(
    self,
  );

  return ret;
}

void imDrawListChannelsSplit(
  ffi.Pointer<ImDrawList> self,
  int count,
) {

  _cimgui.ImDrawList_ChannelsSplit(
    self,
    count,
  );

}

void imDrawListChannelsMerge(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList_ChannelsMerge(
    self,
  );

}

void imDrawListChannelsSetCurrent(
  ffi.Pointer<ImDrawList> self,
  int n,
) {

  _cimgui.ImDrawList_ChannelsSetCurrent(
    self,
    n,
  );

}

void imDrawListPrimReserve(
  ffi.Pointer<ImDrawList> self,
  int idxCount,
  int vtxCount,
) {

  _cimgui.ImDrawList_PrimReserve(
    self,
    idxCount,
    vtxCount,
  );

}

void imDrawListPrimUnreserve(
  ffi.Pointer<ImDrawList> self,
  int idxCount,
  int vtxCount,
) {

  _cimgui.ImDrawList_PrimUnreserve(
    self,
    idxCount,
    vtxCount,
  );

}

void imDrawListPrimRect(
  ffi.Pointer<ImDrawList> self,
  ImVec2 a,
  ImVec2 b,
  int col,
) {

  _cimgui.ImDrawList_PrimRect(
    self,
    a,
    b,
    col,
  );

}

void imDrawListPrimRectUV(
  ffi.Pointer<ImDrawList> self,
  ImVec2 a,
  ImVec2 b,
  ImVec2 uvA,
  ImVec2 uvB,
  int col,
) {

  _cimgui.ImDrawList_PrimRectUV(
    self,
    a,
    b,
    uvA,
    uvB,
    col,
  );

}

void imDrawListPrimQuadUV(
  ffi.Pointer<ImDrawList> self,
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
  ImVec2 d,
  ImVec2 uvA,
  ImVec2 uvB,
  ImVec2 uvC,
  ImVec2 uvD,
  int col,
) {

  _cimgui.ImDrawList_PrimQuadUV(
    self,
    a,
    b,
    c,
    d,
    uvA,
    uvB,
    uvC,
    uvD,
    col,
  );

}

void imDrawListPrimWriteVtx(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pos,
  ImVec2 uv,
  int col,
) {

  _cimgui.ImDrawList_PrimWriteVtx(
    self,
    pos,
    uv,
    col,
  );

}

void imDrawListPrimWriteIdx(
  ffi.Pointer<ImDrawList> self,
  int idx,
) {

  _cimgui.ImDrawList_PrimWriteIdx(
    self,
    idx,
  );

}

void imDrawListPrimVtx(
  ffi.Pointer<ImDrawList> self,
  ImVec2 pos,
  ImVec2 uv,
  int col,
) {

  _cimgui.ImDrawList_PrimVtx(
    self,
    pos,
    uv,
    col,
  );

}

void imDrawListResetForNewFrame(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__ResetForNewFrame(
    self,
  );

}

void imDrawListClearFreeMemory(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__ClearFreeMemory(
    self,
  );

}

void imDrawListPopUnusedDrawCmd(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__PopUnusedDrawCmd(
    self,
  );

}

void imDrawListTryMergeDrawCmds(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__TryMergeDrawCmds(
    self,
  );

}

void imDrawListOnChangedClipRect(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__OnChangedClipRect(
    self,
  );

}

void imDrawListOnChangedTextureID(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__OnChangedTextureID(
    self,
  );

}

void imDrawListOnChangedVtxOffset(
  ffi.Pointer<ImDrawList> self,
) {

  _cimgui.ImDrawList__OnChangedVtxOffset(
    self,
  );

}

void imDrawListSetTextureID(
  ffi.Pointer<ImDrawList> self,
  int textureId,
) {

  _cimgui.ImDrawList__SetTextureID(
    self,
    textureId,
  );

}

int imDrawListCalcCircleAutoSegmentCount(
  ffi.Pointer<ImDrawList> self,
  double radius,
) {
  int ret;

  ret = _cimgui.ImDrawList__CalcCircleAutoSegmentCount(
    self,
    radius,
  );

  return ret;
}

void imDrawListPathArcToFastEx(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  int aMinSample,
  int aMaxSample,
  int aStep,
) {

  _cimgui.ImDrawList__PathArcToFastEx(
    self,
    center,
    radius,
    aMinSample,
    aMaxSample,
    aStep,
  );

}

void imDrawListPathArcToN(
  ffi.Pointer<ImDrawList> self,
  ImVec2 center,
  double radius,
  double aMin,
  double aMax,
  int numSegments,
) {

  _cimgui.ImDrawList__PathArcToN(
    self,
    center,
    radius,
    aMin,
    aMax,
    numSegments,
  );

}

ffi.Pointer<ImDrawData> imDrawDataImDrawData(
) {
  ffi.Pointer<ImDrawData> ret;

  ret = _cimgui.ImDrawData_ImDrawData(
  );

  return ret;
}

void imDrawDataDestroy(
  ffi.Pointer<ImDrawData> self,
) {

  _cimgui.ImDrawData_destroy(
    self,
  );

}

void imDrawDataClear(
  ffi.Pointer<ImDrawData> self,
) {

  _cimgui.ImDrawData_Clear(
    self,
  );

}

void imDrawDataAddDrawList(
  ffi.Pointer<ImDrawData> self,
  ffi.Pointer<ImDrawList> drawList,
) {

  _cimgui.ImDrawData_AddDrawList(
    self,
    drawList,
  );

}

void imDrawDataDeIndexAllBuffers(
  ffi.Pointer<ImDrawData> self,
) {

  _cimgui.ImDrawData_DeIndexAllBuffers(
    self,
  );

}

void imDrawDataScaleClipRects(
  ffi.Pointer<ImDrawData> self,
  ImVec2 fbScale,
) {

  _cimgui.ImDrawData_ScaleClipRects(
    self,
    fbScale,
  );

}

ffi.Pointer<ImFontConfig> imFontConfigImFontConfig(
) {
  ffi.Pointer<ImFontConfig> ret;

  ret = _cimgui.ImFontConfig_ImFontConfig(
  );

  return ret;
}

void imFontConfigDestroy(
  ffi.Pointer<ImFontConfig> self,
) {

  _cimgui.ImFontConfig_destroy(
    self,
  );

}

ffi.Pointer<ImFontGlyphRangesBuilder> imFontGlyphRangesBuilderImFontGlyphRangesBuilder(
) {
  ffi.Pointer<ImFontGlyphRangesBuilder> ret;

  ret = _cimgui.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder(
  );

  return ret;
}

void imFontGlyphRangesBuilderDestroy(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
) {

  _cimgui.ImFontGlyphRangesBuilder_destroy(
    self,
  );

}

void imFontGlyphRangesBuilderClear(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
) {

  _cimgui.ImFontGlyphRangesBuilder_Clear(
    self,
  );

}

bool imFontGlyphRangesBuilderGetBit(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  int n,
) {
  bool ret;

  ret = _cimgui.ImFontGlyphRangesBuilder_GetBit(
    self,
    n,
  );

  return ret;
}

void imFontGlyphRangesBuilderSetBit(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  int n,
) {

  _cimgui.ImFontGlyphRangesBuilder_SetBit(
    self,
    n,
  );

}

void imFontGlyphRangesBuilderAddChar(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  int c,
) {

  _cimgui.ImFontGlyphRangesBuilder_AddChar(
    self,
    c,
  );

}

void imFontGlyphRangesBuilderAddText(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  String text,
  [String? textEnd,]
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImFontGlyphRangesBuilder_AddText(
    self,
    _text,
    _textEnd,
  );

}

void imFontGlyphRangesBuilderAddRanges(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  ffi.Pointer<ImWchar> ranges,
) {

  _cimgui.ImFontGlyphRangesBuilder_AddRanges(
    self,
    ranges,
  );

}

void imFontGlyphRangesBuilderBuildRanges(
  ffi.Pointer<ImFontGlyphRangesBuilder> self,
  ffi.Pointer<ImVector_ImWchar> outRanges,
) {

  _cimgui.ImFontGlyphRangesBuilder_BuildRanges(
    self,
    outRanges,
  );

}

ffi.Pointer<ImFontAtlasCustomRect> imFontAtlasCustomRectImFontAtlasCustomRect(
) {
  ffi.Pointer<ImFontAtlasCustomRect> ret;

  ret = _cimgui.ImFontAtlasCustomRect_ImFontAtlasCustomRect(
  );

  return ret;
}

void imFontAtlasCustomRectDestroy(
  ffi.Pointer<ImFontAtlasCustomRect> self,
) {

  _cimgui.ImFontAtlasCustomRect_destroy(
    self,
  );

}

bool imFontAtlasCustomRectIsPacked(
  ffi.Pointer<ImFontAtlasCustomRect> self,
) {
  bool ret;

  ret = _cimgui.ImFontAtlasCustomRect_IsPacked(
    self,
  );

  return ret;
}

ffi.Pointer<ImFontAtlas> imFontAtlasImFontAtlas(
) {
  ffi.Pointer<ImFontAtlas> ret;

  ret = _cimgui.ImFontAtlas_ImFontAtlas(
  );

  return ret;
}

void imFontAtlasDestroy(
  ffi.Pointer<ImFontAtlas> self,
) {

  _cimgui.ImFontAtlas_destroy(
    self,
  );

}

ffi.Pointer<ImFont> imFontAtlasAddFont(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ImFontConfig> fontCfg,
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.ImFontAtlas_AddFont(
    self,
    fontCfg,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontAtlasAddFontDefault(
  ffi.Pointer<ImFontAtlas> self,
  [ffi.Pointer<ImFontConfig>? fontCfg,]
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.ImFontAtlas_AddFontDefault(
    self,
    fontCfg,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontAtlasAddFontFromFileTTF(
  ffi.Pointer<ImFontAtlas> self,
  String filename,
  double sizePixels,
  [ffi.Pointer<ImFontConfig>? fontCfg,
  ffi.Pointer<ImWchar>? glyphRanges,]
) {
  ffi.Pointer<ImFont> ret;
  final ffi.Pointer<ffi.Char> _filename = filename != null ? filename.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImFontAtlas_AddFontFromFileTTF(
    self,
    _filename,
    sizePixels,
    fontCfg,
    glyphRanges,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontAtlasAddFontFromMemoryTTF(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ffi.Void> fontData,
  int fontDataSize,
  double sizePixels,
  [ffi.Pointer<ImFontConfig>? fontCfg,
  ffi.Pointer<ImWchar>? glyphRanges,]
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.ImFontAtlas_AddFontFromMemoryTTF(
    self,
    fontData,
    fontDataSize,
    sizePixels,
    fontCfg,
    glyphRanges,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontAtlasAddFontFromMemoryCompressedTTF(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ffi.Void> compressedFontData,
  int compressedFontDataSize,
  double sizePixels,
  [ffi.Pointer<ImFontConfig>? fontCfg,
  ffi.Pointer<ImWchar>? glyphRanges,]
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.ImFontAtlas_AddFontFromMemoryCompressedTTF(
    self,
    compressedFontData,
    compressedFontDataSize,
    sizePixels,
    fontCfg,
    glyphRanges,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontAtlasAddFontFromMemoryCompressedBase85TTF(
  ffi.Pointer<ImFontAtlas> self,
  String compressedFontDataBase85,
  double sizePixels,
  [ffi.Pointer<ImFontConfig>? fontCfg,
  ffi.Pointer<ImWchar>? glyphRanges,]
) {
  ffi.Pointer<ImFont> ret;
  final ffi.Pointer<ffi.Char> _compressedFontDataBase85 = compressedFontDataBase85 != null ? compressedFontDataBase85.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(
    self,
    _compressedFontDataBase85,
    sizePixels,
    fontCfg,
    glyphRanges,
  );

  return ret;
}

void imFontAtlasClearInputData(
  ffi.Pointer<ImFontAtlas> self,
) {

  _cimgui.ImFontAtlas_ClearInputData(
    self,
  );

}

void imFontAtlasClearTexData(
  ffi.Pointer<ImFontAtlas> self,
) {

  _cimgui.ImFontAtlas_ClearTexData(
    self,
  );

}

void imFontAtlasClearFonts(
  ffi.Pointer<ImFontAtlas> self,
) {

  _cimgui.ImFontAtlas_ClearFonts(
    self,
  );

}

void imFontAtlasClear(
  ffi.Pointer<ImFontAtlas> self,
) {

  _cimgui.ImFontAtlas_Clear(
    self,
  );

}

bool imFontAtlasBuild(
  ffi.Pointer<ImFontAtlas> self,
) {
  bool ret;

  ret = _cimgui.ImFontAtlas_Build(
    self,
  );

  return ret;
}

void imFontAtlasGetTexDataAsAlpha8(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ffi.Pointer<ffi.UnsignedChar>> outPixels,
  ffi.Pointer<ffi.Int> outWidth,
  ffi.Pointer<ffi.Int> outHeight,
  [ffi.Pointer<ffi.Int>? outBytesPerPixel,]
) {

  _cimgui.ImFontAtlas_GetTexDataAsAlpha8(
    self,
    outPixels,
    outWidth,
    outHeight,
    outBytesPerPixel,
  );

}

void imFontAtlasGetTexDataAsRGBA32(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ffi.Pointer<ffi.UnsignedChar>> outPixels,
  ffi.Pointer<ffi.Int> outWidth,
  ffi.Pointer<ffi.Int> outHeight,
  [ffi.Pointer<ffi.Int>? outBytesPerPixel,]
) {

  _cimgui.ImFontAtlas_GetTexDataAsRGBA32(
    self,
    outPixels,
    outWidth,
    outHeight,
    outBytesPerPixel,
  );

}

bool imFontAtlasIsBuilt(
  ffi.Pointer<ImFontAtlas> self,
) {
  bool ret;

  ret = _cimgui.ImFontAtlas_IsBuilt(
    self,
  );

  return ret;
}

void imFontAtlasSetTexID(
  ffi.Pointer<ImFontAtlas> self,
  int id,
) {

  _cimgui.ImFontAtlas_SetTexID(
    self,
    id,
  );

}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesDefault(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesDefault(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesGreek(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesGreek(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesKorean(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesKorean(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesJapanese(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesJapanese(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesChineseFull(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesChineseFull(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesChineseSimplifiedCommon(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesCyrillic(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesCyrillic(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesThai(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesThai(
    self,
  );

  return ret;
}

ffi.Pointer<ImWchar> imFontAtlasGetGlyphRangesVietnamese(
  ffi.Pointer<ImFontAtlas> self,
) {
  ffi.Pointer<ImWchar> ret;

  ret = _cimgui.ImFontAtlas_GetGlyphRangesVietnamese(
    self,
  );

  return ret;
}

int imFontAtlasAddCustomRectRegular(
  ffi.Pointer<ImFontAtlas> self,
  int width,
  int height,
) {
  int ret;

  ret = _cimgui.ImFontAtlas_AddCustomRectRegular(
    self,
    width,
    height,
  );

  return ret;
}

int imFontAtlasAddCustomRectFontGlyph(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ImFont> font,
  int id,
  int width,
  int height,
  double advanceX,
  [ImVec2 offset = ImVec2(0,0),]
) {
  int ret;

  ret = _cimgui.ImFontAtlas_AddCustomRectFontGlyph(
    self,
    font,
    id,
    width,
    height,
    advanceX,
    offset,
  );

  return ret;
}

ffi.Pointer<ImFontAtlasCustomRect> imFontAtlasGetCustomRectByIndex(
  ffi.Pointer<ImFontAtlas> self,
  int index,
) {
  ffi.Pointer<ImFontAtlasCustomRect> ret;

  ret = _cimgui.ImFontAtlas_GetCustomRectByIndex(
    self,
    index,
  );

  return ret;
}

void imFontAtlasCalcCustomRectUV(
  ffi.Pointer<ImFontAtlas> self,
  ffi.Pointer<ImFontAtlasCustomRect> rect,
  ffi.Pointer<ImVec2> outUvMin,
  ffi.Pointer<ImVec2> outUvMax,
) {

  _cimgui.ImFontAtlas_CalcCustomRectUV(
    self,
    rect,
    outUvMin,
    outUvMax,
  );

}

bool imFontAtlasGetMouseCursorTexData(
  ffi.Pointer<ImFontAtlas> self,
  int cursor,
  ffi.Pointer<ImVec2> outOffset,
  ffi.Pointer<ImVec2> outSize,
  ffi.Pointer<ImVec2> outUvBorder,
  ffi.Pointer<ImVec2> outUvFill,
) {
  bool ret;

  ret = _cimgui.ImFontAtlas_GetMouseCursorTexData(
    self,
    cursor,
    outOffset,
    outSize,
    outUvBorder,
    outUvFill,
  );

  return ret;
}

ffi.Pointer<ImFont> imFontImFont(
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.ImFont_ImFont(
  );

  return ret;
}

void imFontDestroy(
  ffi.Pointer<ImFont> self,
) {

  _cimgui.ImFont_destroy(
    self,
  );

}

ffi.Pointer<ImFontGlyph> imFontFindGlyph(
  ffi.Pointer<ImFont> self,
  int c,
) {
  ffi.Pointer<ImFontGlyph> ret;

  ret = _cimgui.ImFont_FindGlyph(
    self,
    c,
  );

  return ret;
}

ffi.Pointer<ImFontGlyph> imFontFindGlyphNoFallback(
  ffi.Pointer<ImFont> self,
  int c,
) {
  ffi.Pointer<ImFontGlyph> ret;

  ret = _cimgui.ImFont_FindGlyphNoFallback(
    self,
    c,
  );

  return ret;
}

double imFontGetCharAdvance(
  ffi.Pointer<ImFont> self,
  int c,
) {
  double ret;

  ret = _cimgui.ImFont_GetCharAdvance(
    self,
    c,
  );

  return ret;
}

bool imFontIsLoaded(
  ffi.Pointer<ImFont> self,
) {
  bool ret;

  ret = _cimgui.ImFont_IsLoaded(
    self,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imFontGetDebugName(
  ffi.Pointer<ImFont> self,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.ImFont_GetDebugName(
    self,
  );

  return ret;
}

void imFontCalcTextSizeA(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImFont> self,
  double size,
  double maxWidth,
  double wrapWidth,
  String textBegin,
  [String? textEnd,
  ffi.Pointer<ffi.Pointer<ffi.Char>>? remaining,]
) {
  final ffi.Pointer<ffi.Char> _textBegin = textBegin != null ? textBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImFont_CalcTextSizeA(
    pOut,
    self,
    size,
    maxWidth,
    wrapWidth,
    _textBegin,
    _textEnd,
    remaining,
  );

}

ffi.Pointer<ffi.Char> imFontCalcWordWrapPositionA(
  ffi.Pointer<ImFont> self,
  double scale,
  String text,
  String textEnd,
  double wrapWidth,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImFont_CalcWordWrapPositionA(
    self,
    scale,
    _text,
    _textEnd,
    wrapWidth,
  );

  return ret;
}

void imFontRenderChar(
  ffi.Pointer<ImFont> self,
  ffi.Pointer<ImDrawList> drawList,
  double size,
  ImVec2 pos,
  int col,
  int c,
) {

  _cimgui.ImFont_RenderChar(
    self,
    drawList,
    size,
    pos,
    col,
    c,
  );

}

void imFontRenderText(
  ffi.Pointer<ImFont> self,
  ffi.Pointer<ImDrawList> drawList,
  double size,
  ImVec2 pos,
  int col,
  ImVec4 clipRect,
  String textBegin,
  String textEnd,
  [double wrapWidth = 0.0,
  bool cpuFineClip = false,]
) {
  final ffi.Pointer<ffi.Char> _textBegin = textBegin != null ? textBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImFont_RenderText(
    self,
    drawList,
    size,
    pos,
    col,
    clipRect,
    _textBegin,
    _textEnd,
    wrapWidth,
    cpuFineClip,
  );

}

void imFontBuildLookupTable(
  ffi.Pointer<ImFont> self,
) {

  _cimgui.ImFont_BuildLookupTable(
    self,
  );

}

void imFontClearOutputData(
  ffi.Pointer<ImFont> self,
) {

  _cimgui.ImFont_ClearOutputData(
    self,
  );

}

void imFontGrowIndex(
  ffi.Pointer<ImFont> self,
  int newSize,
) {

  _cimgui.ImFont_GrowIndex(
    self,
    newSize,
  );

}

void imFontAddGlyph(
  ffi.Pointer<ImFont> self,
  ffi.Pointer<ImFontConfig> srcCfg,
  int c,
  double x0,
  double y0,
  double x1,
  double y1,
  double u0,
  double v0,
  double u1,
  double v1,
  double advanceX,
) {

  _cimgui.ImFont_AddGlyph(
    self,
    srcCfg,
    c,
    x0,
    y0,
    x1,
    y1,
    u0,
    v0,
    u1,
    v1,
    advanceX,
  );

}

void imFontAddRemapChar(
  ffi.Pointer<ImFont> self,
  int dst,
  int src,
  [bool overwriteDst = true,]
) {

  _cimgui.ImFont_AddRemapChar(
    self,
    dst,
    src,
    overwriteDst,
  );

}

void imFontSetGlyphVisible(
  ffi.Pointer<ImFont> self,
  int c,
  bool visible,
) {

  _cimgui.ImFont_SetGlyphVisible(
    self,
    c,
    visible,
  );

}

bool imFontIsGlyphRangeUnused(
  ffi.Pointer<ImFont> self,
  int cBegin,
  int cLast,
) {
  bool ret;

  ret = _cimgui.ImFont_IsGlyphRangeUnused(
    self,
    cBegin,
    cLast,
  );

  return ret;
}

ffi.Pointer<ImGuiViewport> imGuiViewportImGuiViewport(
) {
  ffi.Pointer<ImGuiViewport> ret;

  ret = _cimgui.ImGuiViewport_ImGuiViewport(
  );

  return ret;
}

void imGuiViewportDestroy(
  ffi.Pointer<ImGuiViewport> self,
) {

  _cimgui.ImGuiViewport_destroy(
    self,
  );

}

void imGuiViewportGetCenter(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiViewport> self,
) {

  _cimgui.ImGuiViewport_GetCenter(
    pOut,
    self,
  );

}

void imGuiViewportGetWorkCenter(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiViewport> self,
) {

  _cimgui.ImGuiViewport_GetWorkCenter(
    pOut,
    self,
  );

}

ffi.Pointer<ImGuiPlatformIO> imGuiPlatformIOImGuiPlatformIO(
) {
  ffi.Pointer<ImGuiPlatformIO> ret;

  ret = _cimgui.ImGuiPlatformIO_ImGuiPlatformIO(
  );

  return ret;
}

void imGuiPlatformIODestroy(
  ffi.Pointer<ImGuiPlatformIO> self,
) {

  _cimgui.ImGuiPlatformIO_destroy(
    self,
  );

}

ffi.Pointer<ImGuiPlatformMonitor> imGuiPlatformMonitorImGuiPlatformMonitor(
) {
  ffi.Pointer<ImGuiPlatformMonitor> ret;

  ret = _cimgui.ImGuiPlatformMonitor_ImGuiPlatformMonitor(
  );

  return ret;
}

void imGuiPlatformMonitorDestroy(
  ffi.Pointer<ImGuiPlatformMonitor> self,
) {

  _cimgui.ImGuiPlatformMonitor_destroy(
    self,
  );

}

ffi.Pointer<ImGuiPlatformImeData> imGuiPlatformImeDataImGuiPlatformImeData(
) {
  ffi.Pointer<ImGuiPlatformImeData> ret;

  ret = _cimgui.ImGuiPlatformImeData_ImGuiPlatformImeData(
  );

  return ret;
}

void imGuiPlatformImeDataDestroy(
  ffi.Pointer<ImGuiPlatformImeData> self,
) {

  _cimgui.ImGuiPlatformImeData_destroy(
    self,
  );

}

int imHashData(
  ffi.Pointer<ffi.Void> data,
  int dataSize,
  int seed,
) {
  int ret;

  ret = _cimgui.igImHashData(
    data,
    dataSize,
    seed,
  );

  return ret;
}

int imHashStr(
  String data,
  int dataSize,
  int seed,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _data = data != null ? data.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImHashStr(
    _data,
    dataSize,
    seed,
  );

  return ret;
}

void imQsort(
  ffi.Pointer<ffi.Void> base,
  int count,
  int sizeOfElement,
  ffi.Pointer<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>> compareFunc,
) {

  _cimgui.igImQsort(
    base,
    count,
    sizeOfElement,
    compareFunc,
  );

}

int imAlphaBlendColors(
  int colA,
  int colB,
) {
  int ret;

  ret = _cimgui.igImAlphaBlendColors(
    colA,
    colB,
  );

  return ret;
}

bool imIsPowerOfTwoInt(
  int v,
) {
  bool ret;

  ret = _cimgui.igImIsPowerOfTwo_Int(
    v,
  );

  return ret;
}

bool imIsPowerOfTwoU64(
  int v,
) {
  bool ret;

  ret = _cimgui.igImIsPowerOfTwo_U64(
    v,
  );

  return ret;
}

int imUpperPowerOfTwo(
  int v,
) {
  int ret;

  ret = _cimgui.igImUpperPowerOfTwo(
    v,
  );

  return ret;
}

int imStricmp(
  String str1,
  String str2,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _str1 = str1 != null ? str1.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _str2 = str2 != null ? str2.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStricmp(
    _str1,
    _str2,
  );

  return ret;
}

int imStrnicmp(
  String str1,
  String str2,
  int count,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _str1 = str1 != null ? str1.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _str2 = str2 != null ? str2.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrnicmp(
    _str1,
    _str2,
    count,
  );

  return ret;
}

void imStrncpy(
  String dst,
  String src,
  int count,
) {
  final ffi.Pointer<ffi.Char> _dst = dst != null ? dst.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _src = src != null ? src.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImStrncpy(
    _dst,
    _src,
    count,
  );

}

ffi.Pointer<ffi.Char> imStrdup(
  String str,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrdup(
    _str,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imStrdupcpy(
  String dst,
  ffi.Pointer<ffi.Size> pDstSize,
  String str,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _dst = dst != null ? dst.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrdupcpy(
    _dst,
    pDstSize,
    _str,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imStrchrRange(
  String strBegin,
  String strEnd,
  int c,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _strBegin = strBegin != null ? strBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strEnd = strEnd != null ? strEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrchrRange(
    _strBegin,
    _strEnd,
    c,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imStreolRange(
  String str,
  String strEnd,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strEnd = strEnd != null ? strEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStreolRange(
    _str,
    _strEnd,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imStristr(
  String haystack,
  String haystackEnd,
  String needle,
  String needleEnd,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _haystack = haystack != null ? haystack.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _haystackEnd = haystackEnd != null ? haystackEnd.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _needle = needle != null ? needle.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _needleEnd = needleEnd != null ? needleEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStristr(
    _haystack,
    _haystackEnd,
    _needle,
    _needleEnd,
  );

  return ret;
}

void imStrTrimBlanks(
  String str,
) {
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImStrTrimBlanks(
    _str,
  );

}

ffi.Pointer<ffi.Char> imStrSkipBlank(
  String str,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrSkipBlank(
    _str,
  );

  return ret;
}

int imStrlenW(
  ffi.Pointer<ImWchar> str,
) {
  int ret;

  ret = _cimgui.igImStrlenW(
    str,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imStrbol(
  String bufMidLine,
  String bufBegin,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _bufMidLine = bufMidLine != null ? bufMidLine.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _bufBegin = bufBegin != null ? bufBegin.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImStrbol(
    _bufMidLine,
    _bufBegin,
  );

  return ret;
}

int imToUpper(
  int c,
) {
  int ret;

  ret = _cimgui.igImToUpper(
    c,
  );

  return ret;
}

bool imCharIsBlankA(
  int c,
) {
  bool ret;

  ret = _cimgui.igImCharIsBlankA(
    c,
  );

  return ret;
}

bool imCharIsBlankW(
  int c,
) {
  bool ret;

  ret = _cimgui.igImCharIsBlankW(
    c,
  );

  return ret;
}

bool imCharIsXdigitA(
  int c,
) {
  bool ret;

  ret = _cimgui.igImCharIsXdigitA(
    c,
  );

  return ret;
}

int imFormatString(
  String buf,
  int bufSize,
  String fmt,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImFormatString(
    _buf,
    bufSize,
    _fmt,
  );

  return ret;
}

void imFormatStringToTempBuffer(
  ffi.Pointer<ffi.Pointer<ffi.Char>> outBuf,
  ffi.Pointer<ffi.Pointer<ffi.Char>> outBufEnd,
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImFormatStringToTempBuffer(
    outBuf,
    outBufEnd,
    _fmt,
  );

}

ffi.Pointer<ffi.Char> imParseFormatFindStart(
  String format,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImParseFormatFindStart(
    _format,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imParseFormatFindEnd(
  String format,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImParseFormatFindEnd(
    _format,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imParseFormatTrimDecorations(
  String format,
  String buf,
  int bufSize,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImParseFormatTrimDecorations(
    _format,
    _buf,
    bufSize,
  );

  return ret;
}

void imParseFormatSanitizeForPrinting(
  String fmtIn,
  String fmtOut,
  int fmtOutSize,
) {
  final ffi.Pointer<ffi.Char> _fmtIn = fmtIn != null ? fmtIn.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmtOut = fmtOut != null ? fmtOut.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImParseFormatSanitizeForPrinting(
    _fmtIn,
    _fmtOut,
    fmtOutSize,
  );

}

ffi.Pointer<ffi.Char> imParseFormatSanitizeForScanning(
  String fmtIn,
  String fmtOut,
  int fmtOutSize,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _fmtIn = fmtIn != null ? fmtIn.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _fmtOut = fmtOut != null ? fmtOut.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImParseFormatSanitizeForScanning(
    _fmtIn,
    _fmtOut,
    fmtOutSize,
  );

  return ret;
}

int imParseFormatPrecision(
  String format,
  int defaultValue,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImParseFormatPrecision(
    _format,
    defaultValue,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imTextCharToUtf8(
  String outBuf,
  int c,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _outBuf = outBuf != null ? outBuf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextCharToUtf8(
    _outBuf,
    c,
  );

  return ret;
}

int imTextStrToUtf8(
  String outBuf,
  int outBufSize,
  ffi.Pointer<ImWchar> inText,
  ffi.Pointer<ImWchar> inTextEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _outBuf = outBuf != null ? outBuf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextStrToUtf8(
    _outBuf,
    outBufSize,
    inText,
    inTextEnd,
  );

  return ret;
}

int imTextCharFromUtf8(
  ffi.Pointer<ffi.UnsignedInt> outChar,
  String inText,
  String inTextEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _inText = inText != null ? inText.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextEnd = inTextEnd != null ? inTextEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextCharFromUtf8(
    outChar,
    _inText,
    _inTextEnd,
  );

  return ret;
}

int imTextStrFromUtf8(
  ffi.Pointer<ImWchar> outBuf,
  int outBufSize,
  String inText,
  String inTextEnd,
  ffi.Pointer<ffi.Pointer<ffi.Char>> inRemaining,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _inText = inText != null ? inText.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextEnd = inTextEnd != null ? inTextEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextStrFromUtf8(
    outBuf,
    outBufSize,
    _inText,
    _inTextEnd,
    inRemaining,
  );

  return ret;
}

int imTextCountCharsFromUtf8(
  String inText,
  String inTextEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _inText = inText != null ? inText.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextEnd = inTextEnd != null ? inTextEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextCountCharsFromUtf8(
    _inText,
    _inTextEnd,
  );

  return ret;
}

int imTextCountUtf8BytesFromChar(
  String inText,
  String inTextEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _inText = inText != null ? inText.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextEnd = inTextEnd != null ? inTextEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextCountUtf8BytesFromChar(
    _inText,
    _inTextEnd,
  );

  return ret;
}

int imTextCountUtf8BytesFromStr(
  ffi.Pointer<ImWchar> inText,
  ffi.Pointer<ImWchar> inTextEnd,
) {
  int ret;

  ret = _cimgui.igImTextCountUtf8BytesFromStr(
    inText,
    inTextEnd,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imTextFindPreviousUtf8Codepoint(
  String inTextStart,
  String inTextCurr,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _inTextStart = inTextStart != null ? inTextStart.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextCurr = inTextCurr != null ? inTextCurr.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextFindPreviousUtf8Codepoint(
    _inTextStart,
    _inTextCurr,
  );

  return ret;
}

int imTextCountLines(
  String inText,
  String inTextEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _inText = inText != null ? inText.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _inTextEnd = inTextEnd != null ? inTextEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImTextCountLines(
    _inText,
    _inTextEnd,
  );

  return ret;
}

ImFileHandle imFileOpen(
  String filename,
  String mode,
) {
  ImFileHandle ret;
  final ffi.Pointer<ffi.Char> _filename = filename != null ? filename.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _mode = mode != null ? mode.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImFileOpen(
    _filename,
    _mode,
  );

  return ret;
}

bool imFileClose(
  ImFileHandle file,
) {
  bool ret;

  ret = _cimgui.igImFileClose(
    file,
  );

  return ret;
}

int imFileGetSize(
  ImFileHandle file,
) {
  int ret;

  ret = _cimgui.igImFileGetSize(
    file,
  );

  return ret;
}

int imFileRead(
  ffi.Pointer<ffi.Void> data,
  int size,
  int count,
  ImFileHandle file,
) {
  int ret;

  ret = _cimgui.igImFileRead(
    data,
    size,
    count,
    file,
  );

  return ret;
}

int imFileWrite(
  ffi.Pointer<ffi.Void> data,
  int size,
  int count,
  ImFileHandle file,
) {
  int ret;

  ret = _cimgui.igImFileWrite(
    data,
    size,
    count,
    file,
  );

  return ret;
}

ffi.Pointer<ffi.Void> imFileLoadToMemory(
  String filename,
  String mode,
  ffi.Pointer<ffi.Size> outFileSize,
  int paddingBytes,
) {
  ffi.Pointer<ffi.Void> ret;
  final ffi.Pointer<ffi.Char> _filename = filename != null ? filename.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _mode = mode != null ? mode.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igImFileLoadToMemory(
    _filename,
    _mode,
    outFileSize,
    paddingBytes,
  );

  return ret;
}

double imPowFloat(
  double x,
  double y,
) {
  double ret;

  ret = _cimgui.igImPow_Float(
    x,
    y,
  );

  return ret;
}

double imPowDouble(
  double x,
  double y,
) {
  double ret;

  ret = _cimgui.igImPow_double(
    x,
    y,
  );

  return ret;
}

double imLogFloat(
  double x,
) {
  double ret;

  ret = _cimgui.igImLog_Float(
    x,
  );

  return ret;
}

double imLogDouble(
  double x,
) {
  double ret;

  ret = _cimgui.igImLog_double(
    x,
  );

  return ret;
}

int imAbsInt(
  int x,
) {
  int ret;

  ret = _cimgui.igImAbs_Int(
    x,
  );

  return ret;
}

double imAbsFloat(
  double x,
) {
  double ret;

  ret = _cimgui.igImAbs_Float(
    x,
  );

  return ret;
}

double imAbsDouble(
  double x,
) {
  double ret;

  ret = _cimgui.igImAbs_double(
    x,
  );

  return ret;
}

double imSignFloat(
  double x,
) {
  double ret;

  ret = _cimgui.igImSign_Float(
    x,
  );

  return ret;
}

double imSignDouble(
  double x,
) {
  double ret;

  ret = _cimgui.igImSign_double(
    x,
  );

  return ret;
}

double imRsqrtFloat(
  double x,
) {
  double ret;

  ret = _cimgui.igImRsqrt_Float(
    x,
  );

  return ret;
}

double imRsqrtDouble(
  double x,
) {
  double ret;

  ret = _cimgui.igImRsqrt_double(
    x,
  );

  return ret;
}

void imMin(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 lhs,
  ImVec2 rhs,
) {

  _cimgui.igImMin(
    pOut,
    lhs,
    rhs,
  );

}

void imMax(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 lhs,
  ImVec2 rhs,
) {

  _cimgui.igImMax(
    pOut,
    lhs,
    rhs,
  );

}

void imClamp(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 v,
  ImVec2 mn,
  ImVec2 mx,
) {

  _cimgui.igImClamp(
    pOut,
    v,
    mn,
    mx,
  );

}

void imLerpVec2Float(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 a,
  ImVec2 b,
  double t,
) {

  _cimgui.igImLerp_Vec2Float(
    pOut,
    a,
    b,
    t,
  );

}

void imLerpVec2Vec2(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 a,
  ImVec2 b,
  ImVec2 t,
) {

  _cimgui.igImLerp_Vec2Vec2(
    pOut,
    a,
    b,
    t,
  );

}

void imLerpVec4(
  ffi.Pointer<ImVec4> pOut,
  ImVec4 a,
  ImVec4 b,
  double t,
) {

  _cimgui.igImLerp_Vec4(
    pOut,
    a,
    b,
    t,
  );

}

double imSaturate(
  double f,
) {
  double ret;

  ret = _cimgui.igImSaturate(
    f,
  );

  return ret;
}

double imLengthSqrVec2(
  ImVec2 lhs,
) {
  double ret;

  ret = _cimgui.igImLengthSqr_Vec2(
    lhs,
  );

  return ret;
}

double imLengthSqrVec4(
  ImVec4 lhs,
) {
  double ret;

  ret = _cimgui.igImLengthSqr_Vec4(
    lhs,
  );

  return ret;
}

double imInvLength(
  ImVec2 lhs,
  double failValue,
) {
  double ret;

  ret = _cimgui.igImInvLength(
    lhs,
    failValue,
  );

  return ret;
}

double imTruncFloat(
  double f,
) {
  double ret;

  ret = _cimgui.igImTrunc_Float(
    f,
  );

  return ret;
}

void imTruncVec2(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 v,
) {

  _cimgui.igImTrunc_Vec2(
    pOut,
    v,
  );

}

double imFloorFloat(
  double f,
) {
  double ret;

  ret = _cimgui.igImFloor_Float(
    f,
  );

  return ret;
}

void imFloorVec2(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 v,
) {

  _cimgui.igImFloor_Vec2(
    pOut,
    v,
  );

}

int imModPositive(
  int a,
  int b,
) {
  int ret;

  ret = _cimgui.igImModPositive(
    a,
    b,
  );

  return ret;
}

double imDot(
  ImVec2 a,
  ImVec2 b,
) {
  double ret;

  ret = _cimgui.igImDot(
    a,
    b,
  );

  return ret;
}

void imRotate(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 v,
  double cosA,
  double sinA,
) {

  _cimgui.igImRotate(
    pOut,
    v,
    cosA,
    sinA,
  );

}

double imLinearSweep(
  double current,
  double target,
  double speed,
) {
  double ret;

  ret = _cimgui.igImLinearSweep(
    current,
    target,
    speed,
  );

  return ret;
}

double imLinearRemapClamp(
  double s0,
  double s1,
  double d0,
  double d1,
  double x,
) {
  double ret;

  ret = _cimgui.igImLinearRemapClamp(
    s0,
    s1,
    d0,
    d1,
    x,
  );

  return ret;
}

void imMul(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 lhs,
  ImVec2 rhs,
) {

  _cimgui.igImMul(
    pOut,
    lhs,
    rhs,
  );

}

bool imIsFloatAboveGuaranteedIntegerPrecision(
  double f,
) {
  bool ret;

  ret = _cimgui.igImIsFloatAboveGuaranteedIntegerPrecision(
    f,
  );

  return ret;
}

double imExponentialMovingAverage(
  double avg,
  double sample,
  int n,
) {
  double ret;

  ret = _cimgui.igImExponentialMovingAverage(
    avg,
    sample,
    n,
  );

  return ret;
}

void imBezierCubicCalc(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  double t,
) {

  _cimgui.igImBezierCubicCalc(
    pOut,
    p1,
    p2,
    p3,
    p4,
    t,
  );

}

void imBezierCubicClosestPoint(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  ImVec2 p,
  int numSegments,
) {

  _cimgui.igImBezierCubicClosestPoint(
    pOut,
    p1,
    p2,
    p3,
    p4,
    p,
    numSegments,
  );

}

void imBezierCubicClosestPointCasteljau(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  ImVec2 p4,
  ImVec2 p,
  double tessTol,
) {

  _cimgui.igImBezierCubicClosestPointCasteljau(
    pOut,
    p1,
    p2,
    p3,
    p4,
    p,
    tessTol,
  );

}

void imBezierQuadraticCalc(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 p1,
  ImVec2 p2,
  ImVec2 p3,
  double t,
) {

  _cimgui.igImBezierQuadraticCalc(
    pOut,
    p1,
    p2,
    p3,
    t,
  );

}

void imLineClosestPoint(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 a,
  ImVec2 b,
  ImVec2 p,
) {

  _cimgui.igImLineClosestPoint(
    pOut,
    a,
    b,
    p,
  );

}

bool imTriangleContainsPoint(
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
  ImVec2 p,
) {
  bool ret;

  ret = _cimgui.igImTriangleContainsPoint(
    a,
    b,
    c,
    p,
  );

  return ret;
}

void imTriangleClosestPoint(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
  ImVec2 p,
) {

  _cimgui.igImTriangleClosestPoint(
    pOut,
    a,
    b,
    c,
    p,
  );

}

void imTriangleBarycentricCoords(
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
  ImVec2 p,
  ffi.Pointer<ffi.Float> outU,
  ffi.Pointer<ffi.Float> outV,
  ffi.Pointer<ffi.Float> outW,
) {

  _cimgui.igImTriangleBarycentricCoords(
    a,
    b,
    c,
    p,
    outU,
    outV,
    outW,
  );

}

double imTriangleArea(
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
) {
  double ret;

  ret = _cimgui.igImTriangleArea(
    a,
    b,
    c,
  );

  return ret;
}

bool imTriangleIsClockwise(
  ImVec2 a,
  ImVec2 b,
  ImVec2 c,
) {
  bool ret;

  ret = _cimgui.igImTriangleIsClockwise(
    a,
    b,
    c,
  );

  return ret;
}

ffi.Pointer<ImVec1> imVec1ImVec1Nil(
) {
  ffi.Pointer<ImVec1> ret;

  ret = _cimgui.ImVec1_ImVec1_Nil(
  );

  return ret;
}

void imVec1Destroy(
  ffi.Pointer<ImVec1> self,
) {

  _cimgui.ImVec1_destroy(
    self,
  );

}

ffi.Pointer<ImVec1> imVec1ImVec1Float(
  double x,
) {
  ffi.Pointer<ImVec1> ret;

  ret = _cimgui.ImVec1_ImVec1_Float(
    x,
  );

  return ret;
}

ffi.Pointer<ImVec2ih> imVec2ihImVec2ihNil(
) {
  ffi.Pointer<ImVec2ih> ret;

  ret = _cimgui.ImVec2ih_ImVec2ih_Nil(
  );

  return ret;
}

void imVec2ihDestroy(
  ffi.Pointer<ImVec2ih> self,
) {

  _cimgui.ImVec2ih_destroy(
    self,
  );

}

ffi.Pointer<ImVec2ih> imVec2ihImVec2ihShort(
  int x,
  int y,
) {
  ffi.Pointer<ImVec2ih> ret;

  ret = _cimgui.ImVec2ih_ImVec2ih_short(
    x,
    y,
  );

  return ret;
}

ffi.Pointer<ImVec2ih> imVec2ihImVec2ihVec2(
  ImVec2 rhs,
) {
  ffi.Pointer<ImVec2ih> ret;

  ret = _cimgui.ImVec2ih_ImVec2ih_Vec2(
    rhs,
  );

  return ret;
}

ffi.Pointer<ImRect> imRectImRectNil(
) {
  ffi.Pointer<ImRect> ret;

  ret = _cimgui.ImRect_ImRect_Nil(
  );

  return ret;
}

void imRectDestroy(
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_destroy(
    self,
  );

}

ffi.Pointer<ImRect> imRectImRectVec2(
  ImVec2 min,
  ImVec2 max,
) {
  ffi.Pointer<ImRect> ret;

  ret = _cimgui.ImRect_ImRect_Vec2(
    min,
    max,
  );

  return ret;
}

ffi.Pointer<ImRect> imRectImRectVec4(
  ImVec4 v,
) {
  ffi.Pointer<ImRect> ret;

  ret = _cimgui.ImRect_ImRect_Vec4(
    v,
  );

  return ret;
}

ffi.Pointer<ImRect> imRectImRectFloat(
  double x1,
  double y1,
  double x2,
  double y2,
) {
  ffi.Pointer<ImRect> ret;

  ret = _cimgui.ImRect_ImRect_Float(
    x1,
    y1,
    x2,
    y2,
  );

  return ret;
}

void imRectGetCenter(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetCenter(
    pOut,
    self,
  );

}

void imRectGetSize(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetSize(
    pOut,
    self,
  );

}

double imRectGetWidth(
  ffi.Pointer<ImRect> self,
) {
  double ret;

  ret = _cimgui.ImRect_GetWidth(
    self,
  );

  return ret;
}

double imRectGetHeight(
  ffi.Pointer<ImRect> self,
) {
  double ret;

  ret = _cimgui.ImRect_GetHeight(
    self,
  );

  return ret;
}

double imRectGetArea(
  ffi.Pointer<ImRect> self,
) {
  double ret;

  ret = _cimgui.ImRect_GetArea(
    self,
  );

  return ret;
}

void imRectGetTL(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetTL(
    pOut,
    self,
  );

}

void imRectGetTR(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetTR(
    pOut,
    self,
  );

}

void imRectGetBL(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetBL(
    pOut,
    self,
  );

}

void imRectGetBR(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_GetBR(
    pOut,
    self,
  );

}

bool imRectContainsVec2(
  ffi.Pointer<ImRect> self,
  ImVec2 p,
) {
  bool ret;

  ret = _cimgui.ImRect_Contains_Vec2(
    self,
    p,
  );

  return ret;
}

bool imRectContainsRect(
  ffi.Pointer<ImRect> self,
  ImRect r,
) {
  bool ret;

  ret = _cimgui.ImRect_Contains_Rect(
    self,
    r,
  );

  return ret;
}

bool imRectContainsWithPad(
  ffi.Pointer<ImRect> self,
  ImVec2 p,
  ImVec2 pad,
) {
  bool ret;

  ret = _cimgui.ImRect_ContainsWithPad(
    self,
    p,
    pad,
  );

  return ret;
}

bool imRectOverlaps(
  ffi.Pointer<ImRect> self,
  ImRect r,
) {
  bool ret;

  ret = _cimgui.ImRect_Overlaps(
    self,
    r,
  );

  return ret;
}

void imRectAddVec2(
  ffi.Pointer<ImRect> self,
  ImVec2 p,
) {

  _cimgui.ImRect_Add_Vec2(
    self,
    p,
  );

}

void imRectAddRect(
  ffi.Pointer<ImRect> self,
  ImRect r,
) {

  _cimgui.ImRect_Add_Rect(
    self,
    r,
  );

}

void imRectExpandFloat(
  ffi.Pointer<ImRect> self,
  double amount,
) {

  _cimgui.ImRect_Expand_Float(
    self,
    amount,
  );

}

void imRectExpandVec2(
  ffi.Pointer<ImRect> self,
  ImVec2 amount,
) {

  _cimgui.ImRect_Expand_Vec2(
    self,
    amount,
  );

}

void imRectTranslate(
  ffi.Pointer<ImRect> self,
  ImVec2 d,
) {

  _cimgui.ImRect_Translate(
    self,
    d,
  );

}

void imRectTranslateX(
  ffi.Pointer<ImRect> self,
  double dx,
) {

  _cimgui.ImRect_TranslateX(
    self,
    dx,
  );

}

void imRectTranslateY(
  ffi.Pointer<ImRect> self,
  double dy,
) {

  _cimgui.ImRect_TranslateY(
    self,
    dy,
  );

}

void imRectClipWith(
  ffi.Pointer<ImRect> self,
  ImRect r,
) {

  _cimgui.ImRect_ClipWith(
    self,
    r,
  );

}

void imRectClipWithFull(
  ffi.Pointer<ImRect> self,
  ImRect r,
) {

  _cimgui.ImRect_ClipWithFull(
    self,
    r,
  );

}

void imRectFloor(
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_Floor(
    self,
  );

}

bool imRectIsInverted(
  ffi.Pointer<ImRect> self,
) {
  bool ret;

  ret = _cimgui.ImRect_IsInverted(
    self,
  );

  return ret;
}

void imRectToVec4(
  ffi.Pointer<ImVec4> pOut,
  ffi.Pointer<ImRect> self,
) {

  _cimgui.ImRect_ToVec4(
    pOut,
    self,
  );

}

int imBitArrayGetStorageSizeInBytes(
  int bitcount,
) {
  int ret;

  ret = _cimgui.igImBitArrayGetStorageSizeInBytes(
    bitcount,
  );

  return ret;
}

void imBitArrayClearAllBits(
  ffi.Pointer<ImU32> arr,
  int bitcount,
) {

  _cimgui.igImBitArrayClearAllBits(
    arr,
    bitcount,
  );

}

bool imBitArrayTestBit(
  ffi.Pointer<ImU32> arr,
  int n,
) {
  bool ret;

  ret = _cimgui.igImBitArrayTestBit(
    arr,
    n,
  );

  return ret;
}

void imBitArrayClearBit(
  ffi.Pointer<ImU32> arr,
  int n,
) {

  _cimgui.igImBitArrayClearBit(
    arr,
    n,
  );

}

void imBitArraySetBit(
  ffi.Pointer<ImU32> arr,
  int n,
) {

  _cimgui.igImBitArraySetBit(
    arr,
    n,
  );

}

void imBitArraySetBitRange(
  ffi.Pointer<ImU32> arr,
  int n,
  int n2,
) {

  _cimgui.igImBitArraySetBitRange(
    arr,
    n,
    n2,
  );

}

void imBitVectorCreate(
  ffi.Pointer<ImBitVector> self,
  int sz,
) {

  _cimgui.ImBitVector_Create(
    self,
    sz,
  );

}

void imBitVectorClear(
  ffi.Pointer<ImBitVector> self,
) {

  _cimgui.ImBitVector_Clear(
    self,
  );

}

bool imBitVectorTestBit(
  ffi.Pointer<ImBitVector> self,
  int n,
) {
  bool ret;

  ret = _cimgui.ImBitVector_TestBit(
    self,
    n,
  );

  return ret;
}

void imBitVectorSetBit(
  ffi.Pointer<ImBitVector> self,
  int n,
) {

  _cimgui.ImBitVector_SetBit(
    self,
    n,
  );

}

void imBitVectorClearBit(
  ffi.Pointer<ImBitVector> self,
  int n,
) {

  _cimgui.ImBitVector_ClearBit(
    self,
    n,
  );

}

void imGuiTextIndexClear(
  ffi.Pointer<ImGuiTextIndex> self,
) {

  _cimgui.ImGuiTextIndex_clear(
    self,
  );

}

int imGuiTextIndexSize(
  ffi.Pointer<ImGuiTextIndex> self,
) {
  int ret;

  ret = _cimgui.ImGuiTextIndex_size(
    self,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imGuiTextIndexGetLineBegin(
  ffi.Pointer<ImGuiTextIndex> self,
  String base,
  int n,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _base = base != null ? base.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextIndex_get_line_begin(
    self,
    _base,
    n,
  );

  return ret;
}

ffi.Pointer<ffi.Char> imGuiTextIndexGetLineEnd(
  ffi.Pointer<ImGuiTextIndex> self,
  String base,
  int n,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _base = base != null ? base.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiTextIndex_get_line_end(
    self,
    _base,
    n,
  );

  return ret;
}

void imGuiTextIndexAppend(
  ffi.Pointer<ImGuiTextIndex> self,
  String base,
  int oldSize,
  int newSize,
) {
  final ffi.Pointer<ffi.Char> _base = base != null ? base.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImGuiTextIndex_append(
    self,
    _base,
    oldSize,
    newSize,
  );

}

ffi.Pointer<ImGuiStoragePair> imLowerBound(
  ffi.Pointer<ImGuiStoragePair> inBegin,
  ffi.Pointer<ImGuiStoragePair> inEnd,
  int key,
) {
  ffi.Pointer<ImGuiStoragePair> ret;

  ret = _cimgui.igImLowerBound(
    inBegin,
    inEnd,
    key,
  );

  return ret;
}

ffi.Pointer<ImDrawListSharedData> imDrawListSharedDataImDrawListSharedData(
) {
  ffi.Pointer<ImDrawListSharedData> ret;

  ret = _cimgui.ImDrawListSharedData_ImDrawListSharedData(
  );

  return ret;
}

void imDrawListSharedDataDestroy(
  ffi.Pointer<ImDrawListSharedData> self,
) {

  _cimgui.ImDrawListSharedData_destroy(
    self,
  );

}

void imDrawListSharedDataSetCircleTessellationMaxError(
  ffi.Pointer<ImDrawListSharedData> self,
  double maxError,
) {

  _cimgui.ImDrawListSharedData_SetCircleTessellationMaxError(
    self,
    maxError,
  );

}

ffi.Pointer<ImDrawDataBuilder> imDrawDataBuilderImDrawDataBuilder(
) {
  ffi.Pointer<ImDrawDataBuilder> ret;

  ret = _cimgui.ImDrawDataBuilder_ImDrawDataBuilder(
  );

  return ret;
}

void imDrawDataBuilderDestroy(
  ffi.Pointer<ImDrawDataBuilder> self,
) {

  _cimgui.ImDrawDataBuilder_destroy(
    self,
  );

}

ffi.Pointer<ffi.Void> imGuiDataVarInfoGetVarPtr(
  ffi.Pointer<ImGuiDataVarInfo> self,
  ffi.Pointer<ffi.Void> parent,
) {
  ffi.Pointer<ffi.Void> ret;

  ret = _cimgui.ImGuiDataVarInfo_GetVarPtr(
    self,
    parent,
  );

  return ret;
}

ffi.Pointer<ImGuiStyleMod> imGuiStyleModImGuiStyleModInt(
  int idx,
  int v,
) {
  ffi.Pointer<ImGuiStyleMod> ret;

  ret = _cimgui.ImGuiStyleMod_ImGuiStyleMod_Int(
    idx,
    v,
  );

  return ret;
}

void imGuiStyleModDestroy(
  ffi.Pointer<ImGuiStyleMod> self,
) {

  _cimgui.ImGuiStyleMod_destroy(
    self,
  );

}

ffi.Pointer<ImGuiStyleMod> imGuiStyleModImGuiStyleModFloat(
  int idx,
  double v,
) {
  ffi.Pointer<ImGuiStyleMod> ret;

  ret = _cimgui.ImGuiStyleMod_ImGuiStyleMod_Float(
    idx,
    v,
  );

  return ret;
}

ffi.Pointer<ImGuiStyleMod> imGuiStyleModImGuiStyleModVec2(
  int idx,
  ImVec2 v,
) {
  ffi.Pointer<ImGuiStyleMod> ret;

  ret = _cimgui.ImGuiStyleMod_ImGuiStyleMod_Vec2(
    idx,
    v,
  );

  return ret;
}

ffi.Pointer<ImGuiComboPreviewData> imGuiComboPreviewDataImGuiComboPreviewData(
) {
  ffi.Pointer<ImGuiComboPreviewData> ret;

  ret = _cimgui.ImGuiComboPreviewData_ImGuiComboPreviewData(
  );

  return ret;
}

void imGuiComboPreviewDataDestroy(
  ffi.Pointer<ImGuiComboPreviewData> self,
) {

  _cimgui.ImGuiComboPreviewData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiMenuColumns> imGuiMenuColumnsImGuiMenuColumns(
) {
  ffi.Pointer<ImGuiMenuColumns> ret;

  ret = _cimgui.ImGuiMenuColumns_ImGuiMenuColumns(
  );

  return ret;
}

void imGuiMenuColumnsDestroy(
  ffi.Pointer<ImGuiMenuColumns> self,
) {

  _cimgui.ImGuiMenuColumns_destroy(
    self,
  );

}

void imGuiMenuColumnsUpdate(
  ffi.Pointer<ImGuiMenuColumns> self,
  double spacing,
  bool windowReappearing,
) {

  _cimgui.ImGuiMenuColumns_Update(
    self,
    spacing,
    windowReappearing,
  );

}

double imGuiMenuColumnsDeclColumns(
  ffi.Pointer<ImGuiMenuColumns> self,
  double wIcon,
  double wLabel,
  double wShortcut,
  double wMark,
) {
  double ret;

  ret = _cimgui.ImGuiMenuColumns_DeclColumns(
    self,
    wIcon,
    wLabel,
    wShortcut,
    wMark,
  );

  return ret;
}

void imGuiMenuColumnsCalcNextTotalWidth(
  ffi.Pointer<ImGuiMenuColumns> self,
  bool updateOffsets,
) {

  _cimgui.ImGuiMenuColumns_CalcNextTotalWidth(
    self,
    updateOffsets,
  );

}

ffi.Pointer<ImGuiInputTextDeactivatedState> imGuiInputTextDeactivatedStateImGuiInputTextDeactivatedState(
) {
  ffi.Pointer<ImGuiInputTextDeactivatedState> ret;

  ret = _cimgui.ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState(
  );

  return ret;
}

void imGuiInputTextDeactivatedStateDestroy(
  ffi.Pointer<ImGuiInputTextDeactivatedState> self,
) {

  _cimgui.ImGuiInputTextDeactivatedState_destroy(
    self,
  );

}

void imGuiInputTextDeactivatedStateClearFreeMemory(
  ffi.Pointer<ImGuiInputTextDeactivatedState> self,
) {

  _cimgui.ImGuiInputTextDeactivatedState_ClearFreeMemory(
    self,
  );

}

ffi.Pointer<ImGuiInputTextState> imGuiInputTextStateImGuiInputTextState(
) {
  ffi.Pointer<ImGuiInputTextState> ret;

  ret = _cimgui.ImGuiInputTextState_ImGuiInputTextState(
  );

  return ret;
}

void imGuiInputTextStateDestroy(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_destroy(
    self,
  );

}

void imGuiInputTextStateClearText(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ClearText(
    self,
  );

}

void imGuiInputTextStateClearFreeMemory(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ClearFreeMemory(
    self,
  );

}

void imGuiInputTextStateOnKeyPressed(
  ffi.Pointer<ImGuiInputTextState> self,
  int key,
) {

  _cimgui.ImGuiInputTextState_OnKeyPressed(
    self,
    key,
  );

}

void imGuiInputTextStateOnCharPressed(
  ffi.Pointer<ImGuiInputTextState> self,
  int c,
) {

  _cimgui.ImGuiInputTextState_OnCharPressed(
    self,
    c,
  );

}

void imGuiInputTextStateCursorAnimReset(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_CursorAnimReset(
    self,
  );

}

void imGuiInputTextStateCursorClamp(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_CursorClamp(
    self,
  );

}

bool imGuiInputTextStateHasSelection(
  ffi.Pointer<ImGuiInputTextState> self,
) {
  bool ret;

  ret = _cimgui.ImGuiInputTextState_HasSelection(
    self,
  );

  return ret;
}

void imGuiInputTextStateClearSelection(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ClearSelection(
    self,
  );

}

int imGuiInputTextStateGetCursorPos(
  ffi.Pointer<ImGuiInputTextState> self,
) {
  int ret;

  ret = _cimgui.ImGuiInputTextState_GetCursorPos(
    self,
  );

  return ret;
}

int imGuiInputTextStateGetSelectionStart(
  ffi.Pointer<ImGuiInputTextState> self,
) {
  int ret;

  ret = _cimgui.ImGuiInputTextState_GetSelectionStart(
    self,
  );

  return ret;
}

int imGuiInputTextStateGetSelectionEnd(
  ffi.Pointer<ImGuiInputTextState> self,
) {
  int ret;

  ret = _cimgui.ImGuiInputTextState_GetSelectionEnd(
    self,
  );

  return ret;
}

void imGuiInputTextStateSelectAll(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_SelectAll(
    self,
  );

}

void imGuiInputTextStateReloadUserBufAndSelectAll(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ReloadUserBufAndSelectAll(
    self,
  );

}

void imGuiInputTextStateReloadUserBufAndKeepSelection(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ReloadUserBufAndKeepSelection(
    self,
  );

}

void imGuiInputTextStateReloadUserBufAndMoveToEnd(
  ffi.Pointer<ImGuiInputTextState> self,
) {

  _cimgui.ImGuiInputTextState_ReloadUserBufAndMoveToEnd(
    self,
  );

}

ffi.Pointer<ImGuiNextWindowData> imGuiNextWindowDataImGuiNextWindowData(
) {
  ffi.Pointer<ImGuiNextWindowData> ret;

  ret = _cimgui.ImGuiNextWindowData_ImGuiNextWindowData(
  );

  return ret;
}

void imGuiNextWindowDataDestroy(
  ffi.Pointer<ImGuiNextWindowData> self,
) {

  _cimgui.ImGuiNextWindowData_destroy(
    self,
  );

}

void imGuiNextWindowDataClearFlags(
  ffi.Pointer<ImGuiNextWindowData> self,
) {

  _cimgui.ImGuiNextWindowData_ClearFlags(
    self,
  );

}

ffi.Pointer<ImGuiNextItemData> imGuiNextItemDataImGuiNextItemData(
) {
  ffi.Pointer<ImGuiNextItemData> ret;

  ret = _cimgui.ImGuiNextItemData_ImGuiNextItemData(
  );

  return ret;
}

void imGuiNextItemDataDestroy(
  ffi.Pointer<ImGuiNextItemData> self,
) {

  _cimgui.ImGuiNextItemData_destroy(
    self,
  );

}

void imGuiNextItemDataClearFlags(
  ffi.Pointer<ImGuiNextItemData> self,
) {

  _cimgui.ImGuiNextItemData_ClearFlags(
    self,
  );

}

ffi.Pointer<ImGuiLastItemData> imGuiLastItemDataImGuiLastItemData(
) {
  ffi.Pointer<ImGuiLastItemData> ret;

  ret = _cimgui.ImGuiLastItemData_ImGuiLastItemData(
  );

  return ret;
}

void imGuiLastItemDataDestroy(
  ffi.Pointer<ImGuiLastItemData> self,
) {

  _cimgui.ImGuiLastItemData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiErrorRecoveryState> imGuiErrorRecoveryStateImGuiErrorRecoveryState(
) {
  ffi.Pointer<ImGuiErrorRecoveryState> ret;

  ret = _cimgui.ImGuiErrorRecoveryState_ImGuiErrorRecoveryState(
  );

  return ret;
}

void imGuiErrorRecoveryStateDestroy(
  ffi.Pointer<ImGuiErrorRecoveryState> self,
) {

  _cimgui.ImGuiErrorRecoveryState_destroy(
    self,
  );

}

ffi.Pointer<ImGuiPtrOrIndex> imGuiPtrOrIndexImGuiPtrOrIndexPtr(
  ffi.Pointer<ffi.Void> ptr,
) {
  ffi.Pointer<ImGuiPtrOrIndex> ret;

  ret = _cimgui.ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(
    ptr,
  );

  return ret;
}

void imGuiPtrOrIndexDestroy(
  ffi.Pointer<ImGuiPtrOrIndex> self,
) {

  _cimgui.ImGuiPtrOrIndex_destroy(
    self,
  );

}

ffi.Pointer<ImGuiPtrOrIndex> imGuiPtrOrIndexImGuiPtrOrIndexInt(
  int index,
) {
  ffi.Pointer<ImGuiPtrOrIndex> ret;

  ret = _cimgui.ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(
    index,
  );

  return ret;
}

ffi.Pointer<ImGuiPopupData> imGuiPopupDataImGuiPopupData(
) {
  ffi.Pointer<ImGuiPopupData> ret;

  ret = _cimgui.ImGuiPopupData_ImGuiPopupData(
  );

  return ret;
}

void imGuiPopupDataDestroy(
  ffi.Pointer<ImGuiPopupData> self,
) {

  _cimgui.ImGuiPopupData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiInputEvent> imGuiInputEventImGuiInputEvent(
) {
  ffi.Pointer<ImGuiInputEvent> ret;

  ret = _cimgui.ImGuiInputEvent_ImGuiInputEvent(
  );

  return ret;
}

void imGuiInputEventDestroy(
  ffi.Pointer<ImGuiInputEvent> self,
) {

  _cimgui.ImGuiInputEvent_destroy(
    self,
  );

}

ffi.Pointer<ImGuiKeyRoutingData> imGuiKeyRoutingDataImGuiKeyRoutingData(
) {
  ffi.Pointer<ImGuiKeyRoutingData> ret;

  ret = _cimgui.ImGuiKeyRoutingData_ImGuiKeyRoutingData(
  );

  return ret;
}

void imGuiKeyRoutingDataDestroy(
  ffi.Pointer<ImGuiKeyRoutingData> self,
) {

  _cimgui.ImGuiKeyRoutingData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiKeyRoutingTable> imGuiKeyRoutingTableImGuiKeyRoutingTable(
) {
  ffi.Pointer<ImGuiKeyRoutingTable> ret;

  ret = _cimgui.ImGuiKeyRoutingTable_ImGuiKeyRoutingTable(
  );

  return ret;
}

void imGuiKeyRoutingTableDestroy(
  ffi.Pointer<ImGuiKeyRoutingTable> self,
) {

  _cimgui.ImGuiKeyRoutingTable_destroy(
    self,
  );

}

void imGuiKeyRoutingTableClear(
  ffi.Pointer<ImGuiKeyRoutingTable> self,
) {

  _cimgui.ImGuiKeyRoutingTable_Clear(
    self,
  );

}

ffi.Pointer<ImGuiKeyOwnerData> imGuiKeyOwnerDataImGuiKeyOwnerData(
) {
  ffi.Pointer<ImGuiKeyOwnerData> ret;

  ret = _cimgui.ImGuiKeyOwnerData_ImGuiKeyOwnerData(
  );

  return ret;
}

void imGuiKeyOwnerDataDestroy(
  ffi.Pointer<ImGuiKeyOwnerData> self,
) {

  _cimgui.ImGuiKeyOwnerData_destroy(
    self,
  );

}

ImGuiListClipperRange imGuiListClipperRangeFromIndices(
  int min,
  int max,
) {
  ImGuiListClipperRange ret;

  ret = _cimgui.ImGuiListClipperRange_FromIndices(
    min,
    max,
  );

  return ret;
}

ImGuiListClipperRange imGuiListClipperRangeFromPositions(
  double y1,
  double y2,
  int offMin,
  int offMax,
) {
  ImGuiListClipperRange ret;

  ret = _cimgui.ImGuiListClipperRange_FromPositions(
    y1,
    y2,
    offMin,
    offMax,
  );

  return ret;
}

ffi.Pointer<ImGuiListClipperData> imGuiListClipperDataImGuiListClipperData(
) {
  ffi.Pointer<ImGuiListClipperData> ret;

  ret = _cimgui.ImGuiListClipperData_ImGuiListClipperData(
  );

  return ret;
}

void imGuiListClipperDataDestroy(
  ffi.Pointer<ImGuiListClipperData> self,
) {

  _cimgui.ImGuiListClipperData_destroy(
    self,
  );

}

void imGuiListClipperDataReset(
  ffi.Pointer<ImGuiListClipperData> self,
  ffi.Pointer<ImGuiListClipper> clipper,
) {

  _cimgui.ImGuiListClipperData_Reset(
    self,
    clipper,
  );

}

ffi.Pointer<ImGuiNavItemData> imGuiNavItemDataImGuiNavItemData(
) {
  ffi.Pointer<ImGuiNavItemData> ret;

  ret = _cimgui.ImGuiNavItemData_ImGuiNavItemData(
  );

  return ret;
}

void imGuiNavItemDataDestroy(
  ffi.Pointer<ImGuiNavItemData> self,
) {

  _cimgui.ImGuiNavItemData_destroy(
    self,
  );

}

void imGuiNavItemDataClear(
  ffi.Pointer<ImGuiNavItemData> self,
) {

  _cimgui.ImGuiNavItemData_Clear(
    self,
  );

}

ffi.Pointer<ImGuiTypingSelectState> imGuiTypingSelectStateImGuiTypingSelectState(
) {
  ffi.Pointer<ImGuiTypingSelectState> ret;

  ret = _cimgui.ImGuiTypingSelectState_ImGuiTypingSelectState(
  );

  return ret;
}

void imGuiTypingSelectStateDestroy(
  ffi.Pointer<ImGuiTypingSelectState> self,
) {

  _cimgui.ImGuiTypingSelectState_destroy(
    self,
  );

}

void imGuiTypingSelectStateClear(
  ffi.Pointer<ImGuiTypingSelectState> self,
) {

  _cimgui.ImGuiTypingSelectState_Clear(
    self,
  );

}

ffi.Pointer<ImGuiOldColumnData> imGuiOldColumnDataImGuiOldColumnData(
) {
  ffi.Pointer<ImGuiOldColumnData> ret;

  ret = _cimgui.ImGuiOldColumnData_ImGuiOldColumnData(
  );

  return ret;
}

void imGuiOldColumnDataDestroy(
  ffi.Pointer<ImGuiOldColumnData> self,
) {

  _cimgui.ImGuiOldColumnData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiOldColumns> imGuiOldColumnsImGuiOldColumns(
) {
  ffi.Pointer<ImGuiOldColumns> ret;

  ret = _cimgui.ImGuiOldColumns_ImGuiOldColumns(
  );

  return ret;
}

void imGuiOldColumnsDestroy(
  ffi.Pointer<ImGuiOldColumns> self,
) {

  _cimgui.ImGuiOldColumns_destroy(
    self,
  );

}

ffi.Pointer<ImGuiBoxSelectState> imGuiBoxSelectStateImGuiBoxSelectState(
) {
  ffi.Pointer<ImGuiBoxSelectState> ret;

  ret = _cimgui.ImGuiBoxSelectState_ImGuiBoxSelectState(
  );

  return ret;
}

void imGuiBoxSelectStateDestroy(
  ffi.Pointer<ImGuiBoxSelectState> self,
) {

  _cimgui.ImGuiBoxSelectState_destroy(
    self,
  );

}

ffi.Pointer<ImGuiMultiSelectTempData> imGuiMultiSelectTempDataImGuiMultiSelectTempData(
) {
  ffi.Pointer<ImGuiMultiSelectTempData> ret;

  ret = _cimgui.ImGuiMultiSelectTempData_ImGuiMultiSelectTempData(
  );

  return ret;
}

void imGuiMultiSelectTempDataDestroy(
  ffi.Pointer<ImGuiMultiSelectTempData> self,
) {

  _cimgui.ImGuiMultiSelectTempData_destroy(
    self,
  );

}

void imGuiMultiSelectTempDataClear(
  ffi.Pointer<ImGuiMultiSelectTempData> self,
) {

  _cimgui.ImGuiMultiSelectTempData_Clear(
    self,
  );

}

void imGuiMultiSelectTempDataClearIO(
  ffi.Pointer<ImGuiMultiSelectTempData> self,
) {

  _cimgui.ImGuiMultiSelectTempData_ClearIO(
    self,
  );

}

ffi.Pointer<ImGuiMultiSelectState> imGuiMultiSelectStateImGuiMultiSelectState(
) {
  ffi.Pointer<ImGuiMultiSelectState> ret;

  ret = _cimgui.ImGuiMultiSelectState_ImGuiMultiSelectState(
  );

  return ret;
}

void imGuiMultiSelectStateDestroy(
  ffi.Pointer<ImGuiMultiSelectState> self,
) {

  _cimgui.ImGuiMultiSelectState_destroy(
    self,
  );

}

ffi.Pointer<ImGuiDockNode> imGuiDockNodeImGuiDockNode(
  int id,
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.ImGuiDockNode_ImGuiDockNode(
    id,
  );

  return ret;
}

void imGuiDockNodeDestroy(
  ffi.Pointer<ImGuiDockNode> self,
) {

  _cimgui.ImGuiDockNode_destroy(
    self,
  );

}

bool imGuiDockNodeIsRootNode(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsRootNode(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsDockSpace(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsDockSpace(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsFloatingNode(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsFloatingNode(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsCentralNode(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsCentralNode(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsHiddenTabBar(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsHiddenTabBar(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsNoTabBar(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsNoTabBar(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsSplitNode(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsSplitNode(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsLeafNode(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsLeafNode(
    self,
  );

  return ret;
}

bool imGuiDockNodeIsEmpty(
  ffi.Pointer<ImGuiDockNode> self,
) {
  bool ret;

  ret = _cimgui.ImGuiDockNode_IsEmpty(
    self,
  );

  return ret;
}

void imGuiDockNodeRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiDockNode> self,
) {

  _cimgui.ImGuiDockNode_Rect(
    pOut,
    self,
  );

}

void imGuiDockNodeSetLocalFlags(
  ffi.Pointer<ImGuiDockNode> self,
  int flags,
) {

  _cimgui.ImGuiDockNode_SetLocalFlags(
    self,
    flags,
  );

}

void imGuiDockNodeUpdateMergedFlags(
  ffi.Pointer<ImGuiDockNode> self,
) {

  _cimgui.ImGuiDockNode_UpdateMergedFlags(
    self,
  );

}

ffi.Pointer<ImGuiDockContext> imGuiDockContextImGuiDockContext(
) {
  ffi.Pointer<ImGuiDockContext> ret;

  ret = _cimgui.ImGuiDockContext_ImGuiDockContext(
  );

  return ret;
}

void imGuiDockContextDestroy(
  ffi.Pointer<ImGuiDockContext> self,
) {

  _cimgui.ImGuiDockContext_destroy(
    self,
  );

}

ffi.Pointer<ImGuiViewportP> imGuiViewportPImGuiViewportP(
) {
  ffi.Pointer<ImGuiViewportP> ret;

  ret = _cimgui.ImGuiViewportP_ImGuiViewportP(
  );

  return ret;
}

void imGuiViewportPDestroy(
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_destroy(
    self,
  );

}

void imGuiViewportPClearRequestFlags(
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_ClearRequestFlags(
    self,
  );

}

void imGuiViewportPCalcWorkRectPos(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiViewportP> self,
  ImVec2 insetMin,
) {

  _cimgui.ImGuiViewportP_CalcWorkRectPos(
    pOut,
    self,
    insetMin,
  );

}

void imGuiViewportPCalcWorkRectSize(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiViewportP> self,
  ImVec2 insetMin,
  ImVec2 insetMax,
) {

  _cimgui.ImGuiViewportP_CalcWorkRectSize(
    pOut,
    self,
    insetMin,
    insetMax,
  );

}

void imGuiViewportPUpdateWorkRect(
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_UpdateWorkRect(
    self,
  );

}

void imGuiViewportPGetMainRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_GetMainRect(
    pOut,
    self,
  );

}

void imGuiViewportPGetWorkRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_GetWorkRect(
    pOut,
    self,
  );

}

void imGuiViewportPGetBuildWorkRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiViewportP> self,
) {

  _cimgui.ImGuiViewportP_GetBuildWorkRect(
    pOut,
    self,
  );

}

ffi.Pointer<ImGuiWindowSettings> imGuiWindowSettingsImGuiWindowSettings(
) {
  ffi.Pointer<ImGuiWindowSettings> ret;

  ret = _cimgui.ImGuiWindowSettings_ImGuiWindowSettings(
  );

  return ret;
}

void imGuiWindowSettingsDestroy(
  ffi.Pointer<ImGuiWindowSettings> self,
) {

  _cimgui.ImGuiWindowSettings_destroy(
    self,
  );

}

ffi.Pointer<ffi.Char> imGuiWindowSettingsGetName(
  ffi.Pointer<ImGuiWindowSettings> self,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.ImGuiWindowSettings_GetName(
    self,
  );

  return ret;
}

ffi.Pointer<ImGuiSettingsHandler> imGuiSettingsHandlerImGuiSettingsHandler(
) {
  ffi.Pointer<ImGuiSettingsHandler> ret;

  ret = _cimgui.ImGuiSettingsHandler_ImGuiSettingsHandler(
  );

  return ret;
}

void imGuiSettingsHandlerDestroy(
  ffi.Pointer<ImGuiSettingsHandler> self,
) {

  _cimgui.ImGuiSettingsHandler_destroy(
    self,
  );

}

ffi.Pointer<ImGuiDebugAllocInfo> imGuiDebugAllocInfoImGuiDebugAllocInfo(
) {
  ffi.Pointer<ImGuiDebugAllocInfo> ret;

  ret = _cimgui.ImGuiDebugAllocInfo_ImGuiDebugAllocInfo(
  );

  return ret;
}

void imGuiDebugAllocInfoDestroy(
  ffi.Pointer<ImGuiDebugAllocInfo> self,
) {

  _cimgui.ImGuiDebugAllocInfo_destroy(
    self,
  );

}

ffi.Pointer<ImGuiStackLevelInfo> imGuiStackLevelInfoImGuiStackLevelInfo(
) {
  ffi.Pointer<ImGuiStackLevelInfo> ret;

  ret = _cimgui.ImGuiStackLevelInfo_ImGuiStackLevelInfo(
  );

  return ret;
}

void imGuiStackLevelInfoDestroy(
  ffi.Pointer<ImGuiStackLevelInfo> self,
) {

  _cimgui.ImGuiStackLevelInfo_destroy(
    self,
  );

}

ffi.Pointer<ImGuiIDStackTool> imGuiIDStackToolImGuiIDStackTool(
) {
  ffi.Pointer<ImGuiIDStackTool> ret;

  ret = _cimgui.ImGuiIDStackTool_ImGuiIDStackTool(
  );

  return ret;
}

void imGuiIDStackToolDestroy(
  ffi.Pointer<ImGuiIDStackTool> self,
) {

  _cimgui.ImGuiIDStackTool_destroy(
    self,
  );

}

ffi.Pointer<ImGuiContextHook> imGuiContextHookImGuiContextHook(
) {
  ffi.Pointer<ImGuiContextHook> ret;

  ret = _cimgui.ImGuiContextHook_ImGuiContextHook(
  );

  return ret;
}

void imGuiContextHookDestroy(
  ffi.Pointer<ImGuiContextHook> self,
) {

  _cimgui.ImGuiContextHook_destroy(
    self,
  );

}

ffi.Pointer<ImGuiContext> imGuiContextImGuiContext(
  ffi.Pointer<ImFontAtlas> sharedFontAtlas,
) {
  ffi.Pointer<ImGuiContext> ret;

  ret = _cimgui.ImGuiContext_ImGuiContext(
    sharedFontAtlas,
  );

  return ret;
}

void imGuiContextDestroy(
  ffi.Pointer<ImGuiContext> self,
) {

  _cimgui.ImGuiContext_destroy(
    self,
  );

}

ffi.Pointer<ImGuiWindow> imGuiWindowImGuiWindow(
  ffi.Pointer<ImGuiContext> context,
  String name,
) {
  ffi.Pointer<ImGuiWindow> ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiWindow_ImGuiWindow(
    context,
    _name,
  );

  return ret;
}

void imGuiWindowDestroy(
  ffi.Pointer<ImGuiWindow> self,
) {

  _cimgui.ImGuiWindow_destroy(
    self,
  );

}

int imGuiWindowGetIDStr(
  ffi.Pointer<ImGuiWindow> self,
  String str,
  String strEnd,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _str = str != null ? str.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strEnd = strEnd != null ? strEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGuiWindow_GetID_Str(
    self,
    _str,
    _strEnd,
  );

  return ret;
}

int imGuiWindowGetIDPtr(
  ffi.Pointer<ImGuiWindow> self,
  ffi.Pointer<ffi.Void> ptr,
) {
  int ret;

  ret = _cimgui.ImGuiWindow_GetID_Ptr(
    self,
    ptr,
  );

  return ret;
}

int imGuiWindowGetIDInt(
  ffi.Pointer<ImGuiWindow> self,
  int n,
) {
  int ret;

  ret = _cimgui.ImGuiWindow_GetID_Int(
    self,
    n,
  );

  return ret;
}

int imGuiWindowGetIDFromPos(
  ffi.Pointer<ImGuiWindow> self,
  ImVec2 pAbs,
) {
  int ret;

  ret = _cimgui.ImGuiWindow_GetIDFromPos(
    self,
    pAbs,
  );

  return ret;
}

int imGuiWindowGetIDFromRectangle(
  ffi.Pointer<ImGuiWindow> self,
  ImRect rAbs,
) {
  int ret;

  ret = _cimgui.ImGuiWindow_GetIDFromRectangle(
    self,
    rAbs,
  );

  return ret;
}

void imGuiWindowRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> self,
) {

  _cimgui.ImGuiWindow_Rect(
    pOut,
    self,
  );

}

double imGuiWindowCalcFontSize(
  ffi.Pointer<ImGuiWindow> self,
) {
  double ret;

  ret = _cimgui.ImGuiWindow_CalcFontSize(
    self,
  );

  return ret;
}

void imGuiWindowTitleBarRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> self,
) {

  _cimgui.ImGuiWindow_TitleBarRect(
    pOut,
    self,
  );

}

void imGuiWindowMenuBarRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> self,
) {

  _cimgui.ImGuiWindow_MenuBarRect(
    pOut,
    self,
  );

}

ffi.Pointer<ImGuiTabItem> imGuiTabItemImGuiTabItem(
) {
  ffi.Pointer<ImGuiTabItem> ret;

  ret = _cimgui.ImGuiTabItem_ImGuiTabItem(
  );

  return ret;
}

void imGuiTabItemDestroy(
  ffi.Pointer<ImGuiTabItem> self,
) {

  _cimgui.ImGuiTabItem_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTabBar> imGuiTabBarImGuiTabBar(
) {
  ffi.Pointer<ImGuiTabBar> ret;

  ret = _cimgui.ImGuiTabBar_ImGuiTabBar(
  );

  return ret;
}

void imGuiTabBarDestroy(
  ffi.Pointer<ImGuiTabBar> self,
) {

  _cimgui.ImGuiTabBar_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableColumn> imGuiTableColumnImGuiTableColumn(
) {
  ffi.Pointer<ImGuiTableColumn> ret;

  ret = _cimgui.ImGuiTableColumn_ImGuiTableColumn(
  );

  return ret;
}

void imGuiTableColumnDestroy(
  ffi.Pointer<ImGuiTableColumn> self,
) {

  _cimgui.ImGuiTableColumn_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableInstanceData> imGuiTableInstanceDataImGuiTableInstanceData(
) {
  ffi.Pointer<ImGuiTableInstanceData> ret;

  ret = _cimgui.ImGuiTableInstanceData_ImGuiTableInstanceData(
  );

  return ret;
}

void imGuiTableInstanceDataDestroy(
  ffi.Pointer<ImGuiTableInstanceData> self,
) {

  _cimgui.ImGuiTableInstanceData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTable> imGuiTableImGuiTable(
) {
  ffi.Pointer<ImGuiTable> ret;

  ret = _cimgui.ImGuiTable_ImGuiTable(
  );

  return ret;
}

void imGuiTableDestroy(
  ffi.Pointer<ImGuiTable> self,
) {

  _cimgui.ImGuiTable_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableTempData> imGuiTableTempDataImGuiTableTempData(
) {
  ffi.Pointer<ImGuiTableTempData> ret;

  ret = _cimgui.ImGuiTableTempData_ImGuiTableTempData(
  );

  return ret;
}

void imGuiTableTempDataDestroy(
  ffi.Pointer<ImGuiTableTempData> self,
) {

  _cimgui.ImGuiTableTempData_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableColumnSettings> imGuiTableColumnSettingsImGuiTableColumnSettings(
) {
  ffi.Pointer<ImGuiTableColumnSettings> ret;

  ret = _cimgui.ImGuiTableColumnSettings_ImGuiTableColumnSettings(
  );

  return ret;
}

void imGuiTableColumnSettingsDestroy(
  ffi.Pointer<ImGuiTableColumnSettings> self,
) {

  _cimgui.ImGuiTableColumnSettings_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableSettings> imGuiTableSettingsImGuiTableSettings(
) {
  ffi.Pointer<ImGuiTableSettings> ret;

  ret = _cimgui.ImGuiTableSettings_ImGuiTableSettings(
  );

  return ret;
}

void imGuiTableSettingsDestroy(
  ffi.Pointer<ImGuiTableSettings> self,
) {

  _cimgui.ImGuiTableSettings_destroy(
    self,
  );

}

ffi.Pointer<ImGuiTableColumnSettings> imGuiTableSettingsGetColumnSettings(
  ffi.Pointer<ImGuiTableSettings> self,
) {
  ffi.Pointer<ImGuiTableColumnSettings> ret;

  ret = _cimgui.ImGuiTableSettings_GetColumnSettings(
    self,
  );

  return ret;
}

ffi.Pointer<ImGuiIO> getIOEx(
  ffi.Pointer<ImGuiContext> ctx,
) {
  ffi.Pointer<ImGuiIO> ret;

  ret = _cimgui.igGetIOEx(
    ctx,
  );

  return ret;
}

ffi.Pointer<ImGuiPlatformIO> getPlatformIOEx(
  ffi.Pointer<ImGuiContext> ctx,
) {
  ffi.Pointer<ImGuiPlatformIO> ret;

  ret = _cimgui.igGetPlatformIOEx(
    ctx,
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> getCurrentWindowRead(
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igGetCurrentWindowRead(
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> getCurrentWindow(
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igGetCurrentWindow(
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> findWindowByID(
  int id,
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igFindWindowByID(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> findWindowByName(
  String name,
) {
  ffi.Pointer<ImGuiWindow> ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igFindWindowByName(
    _name,
  );

  return ret;
}

void updateWindowParentAndRootLinks(
  ffi.Pointer<ImGuiWindow> window,
  int flags,
  ffi.Pointer<ImGuiWindow> parentWindow,
) {

  _cimgui.igUpdateWindowParentAndRootLinks(
    window,
    flags,
    parentWindow,
  );

}

void updateWindowSkipRefresh(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igUpdateWindowSkipRefresh(
    window,
  );

}

void calcWindowNextAutoFitSize(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igCalcWindowNextAutoFitSize(
    pOut,
    window,
  );

}

bool isWindowChildOf(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiWindow> potentialParent,
  bool popupHierarchy,
  bool dockHierarchy,
) {
  bool ret;

  ret = _cimgui.igIsWindowChildOf(
    window,
    potentialParent,
    popupHierarchy,
    dockHierarchy,
  );

  return ret;
}

bool isWindowWithinBeginStackOf(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiWindow> potentialParent,
) {
  bool ret;

  ret = _cimgui.igIsWindowWithinBeginStackOf(
    window,
    potentialParent,
  );

  return ret;
}

bool isWindowAbove(
  ffi.Pointer<ImGuiWindow> potentialAbove,
  ffi.Pointer<ImGuiWindow> potentialBelow,
) {
  bool ret;

  ret = _cimgui.igIsWindowAbove(
    potentialAbove,
    potentialBelow,
  );

  return ret;
}

bool isWindowNavFocusable(
  ffi.Pointer<ImGuiWindow> window,
) {
  bool ret;

  ret = _cimgui.igIsWindowNavFocusable(
    window,
  );

  return ret;
}

void setWindowPosWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  ImVec2 pos,
  int cond,
) {

  _cimgui.igSetWindowPos_WindowPtr(
    window,
    pos,
    cond,
  );

}

void setWindowSizeWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  ImVec2 size,
  int cond,
) {

  _cimgui.igSetWindowSize_WindowPtr(
    window,
    size,
    cond,
  );

}

void setWindowCollapsedWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  bool collapsed,
  int cond,
) {

  _cimgui.igSetWindowCollapsed_WindowPtr(
    window,
    collapsed,
    cond,
  );

}

void setWindowHitTestHole(
  ffi.Pointer<ImGuiWindow> window,
  ImVec2 pos,
  ImVec2 size,
) {

  _cimgui.igSetWindowHitTestHole(
    window,
    pos,
    size,
  );

}

void setWindowHiddenAndSkipItemsForCurrentFrame(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igSetWindowHiddenAndSkipItemsForCurrentFrame(
    window,
  );

}

void setWindowParentWindowForFocusRoute(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiWindow> parentWindow,
) {

  _cimgui.igSetWindowParentWindowForFocusRoute(
    window,
    parentWindow,
  );

}

void windowRectAbsToRel(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImRect r,
) {

  _cimgui.igWindowRectAbsToRel(
    pOut,
    window,
    r,
  );

}

void windowRectRelToAbs(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImRect r,
) {

  _cimgui.igWindowRectRelToAbs(
    pOut,
    window,
    r,
  );

}

void windowPosAbsToRel(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImVec2 p,
) {

  _cimgui.igWindowPosAbsToRel(
    pOut,
    window,
    p,
  );

}

void windowPosRelToAbs(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImVec2 p,
) {

  _cimgui.igWindowPosRelToAbs(
    pOut,
    window,
    p,
  );

}

void focusWindow(
  ffi.Pointer<ImGuiWindow> window,
  int flags,
) {

  _cimgui.igFocusWindow(
    window,
    flags,
  );

}

void focusTopMostWindowUnderOne(
  ffi.Pointer<ImGuiWindow> underThisWindow,
  ffi.Pointer<ImGuiWindow> ignoreWindow,
  ffi.Pointer<ImGuiViewport> filterViewport,
  int flags,
) {

  _cimgui.igFocusTopMostWindowUnderOne(
    underThisWindow,
    ignoreWindow,
    filterViewport,
    flags,
  );

}

void bringWindowToFocusFront(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igBringWindowToFocusFront(
    window,
  );

}

void bringWindowToDisplayFront(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igBringWindowToDisplayFront(
    window,
  );

}

void bringWindowToDisplayBack(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igBringWindowToDisplayBack(
    window,
  );

}

void bringWindowToDisplayBehind(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiWindow> aboveWindow,
) {

  _cimgui.igBringWindowToDisplayBehind(
    window,
    aboveWindow,
  );

}

int findWindowDisplayIndex(
  ffi.Pointer<ImGuiWindow> window,
) {
  int ret;

  ret = _cimgui.igFindWindowDisplayIndex(
    window,
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> findBottomMostVisibleWindowWithinBeginStack(
  ffi.Pointer<ImGuiWindow> window,
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igFindBottomMostVisibleWindowWithinBeginStack(
    window,
  );

  return ret;
}

void setNextWindowRefreshPolicy(
  int flags,
) {

  _cimgui.igSetNextWindowRefreshPolicy(
    flags,
  );

}

void setCurrentFont(
  ffi.Pointer<ImFont> font,
) {

  _cimgui.igSetCurrentFont(
    font,
  );

}

ffi.Pointer<ImFont> getDefaultFont(
) {
  ffi.Pointer<ImFont> ret;

  ret = _cimgui.igGetDefaultFont(
  );

  return ret;
}

ffi.Pointer<ImDrawList> getForegroundDrawListWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
) {
  ffi.Pointer<ImDrawList> ret;

  ret = _cimgui.igGetForegroundDrawList_WindowPtr(
    window,
  );

  return ret;
}

void addDrawListToDrawDataEx(
  ffi.Pointer<ImDrawData> drawData,
  ffi.Pointer<ImVector_ImDrawListPtr> outList,
  ffi.Pointer<ImDrawList> drawList,
) {

  _cimgui.igAddDrawListToDrawDataEx(
    drawData,
    outList,
    drawList,
  );

}

void initialize(
) {

  _cimgui.igInitialize(
  );

}

void shutdown(
) {

  _cimgui.igShutdown(
  );

}

void updateInputEvents(
  bool trickleFastInputs,
) {

  _cimgui.igUpdateInputEvents(
    trickleFastInputs,
  );

}

void updateHoveredWindowAndCaptureFlags(
) {

  _cimgui.igUpdateHoveredWindowAndCaptureFlags(
  );

}

void findHoveredWindowEx(
  ImVec2 pos,
  bool findFirstAndInAnyViewport,
  ffi.Pointer<ffi.Pointer<ImGuiWindow>> outHoveredWindow,
  ffi.Pointer<ffi.Pointer<ImGuiWindow>> outHoveredWindowUnderMovingWindow,
) {

  _cimgui.igFindHoveredWindowEx(
    pos,
    findFirstAndInAnyViewport,
    outHoveredWindow,
    outHoveredWindowUnderMovingWindow,
  );

}

void startMouseMovingWindow(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igStartMouseMovingWindow(
    window,
  );

}

void startMouseMovingWindowOrNode(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiDockNode> node,
  bool undock,
) {

  _cimgui.igStartMouseMovingWindowOrNode(
    window,
    node,
    undock,
  );

}

void updateMouseMovingWindowNewFrame(
) {

  _cimgui.igUpdateMouseMovingWindowNewFrame(
  );

}

void updateMouseMovingWindowEndFrame(
) {

  _cimgui.igUpdateMouseMovingWindowEndFrame(
  );

}

int addContextHook(
  ffi.Pointer<ImGuiContext> context,
  ffi.Pointer<ImGuiContextHook> hook,
) {
  int ret;

  ret = _cimgui.igAddContextHook(
    context,
    hook,
  );

  return ret;
}

void removeContextHook(
  ffi.Pointer<ImGuiContext> context,
  int hookToRemove,
) {

  _cimgui.igRemoveContextHook(
    context,
    hookToRemove,
  );

}

void callContextHooks(
  ffi.Pointer<ImGuiContext> context,
  ImGuiContextHookType type,
) {

  _cimgui.igCallContextHooks(
    context,
    type,
  );

}

void translateWindowsInViewport(
  ffi.Pointer<ImGuiViewportP> viewport,
  ImVec2 oldPos,
  ImVec2 newPos,
  ImVec2 oldSize,
  ImVec2 newSize,
) {

  _cimgui.igTranslateWindowsInViewport(
    viewport,
    oldPos,
    newPos,
    oldSize,
    newSize,
  );

}

void scaleWindowsInViewport(
  ffi.Pointer<ImGuiViewportP> viewport,
  double scale,
) {

  _cimgui.igScaleWindowsInViewport(
    viewport,
    scale,
  );

}

void destroyPlatformWindow(
  ffi.Pointer<ImGuiViewportP> viewport,
) {

  _cimgui.igDestroyPlatformWindow(
    viewport,
  );

}

void setWindowViewport(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiViewportP> viewport,
) {

  _cimgui.igSetWindowViewport(
    window,
    viewport,
  );

}

void setCurrentViewport(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiViewportP> viewport,
) {

  _cimgui.igSetCurrentViewport(
    window,
    viewport,
  );

}

ffi.Pointer<ImGuiPlatformMonitor> getViewportPlatformMonitor(
  ffi.Pointer<ImGuiViewport> viewport,
) {
  ffi.Pointer<ImGuiPlatformMonitor> ret;

  ret = _cimgui.igGetViewportPlatformMonitor(
    viewport,
  );

  return ret;
}

ffi.Pointer<ImGuiViewportP> findHoveredViewportFromPlatformWindowStack(
  ImVec2 mousePlatformPos,
) {
  ffi.Pointer<ImGuiViewportP> ret;

  ret = _cimgui.igFindHoveredViewportFromPlatformWindowStack(
    mousePlatformPos,
  );

  return ret;
}

void markIniSettingsDirtyNil(
) {

  _cimgui.igMarkIniSettingsDirty_Nil(
  );

}

void markIniSettingsDirtyWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igMarkIniSettingsDirty_WindowPtr(
    window,
  );

}

void clearIniSettings(
) {

  _cimgui.igClearIniSettings(
  );

}

void addSettingsHandler(
  ffi.Pointer<ImGuiSettingsHandler> handler,
) {

  _cimgui.igAddSettingsHandler(
    handler,
  );

}

void removeSettingsHandler(
  String typeName,
) {
  final ffi.Pointer<ffi.Char> _typeName = typeName != null ? typeName.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRemoveSettingsHandler(
    _typeName,
  );

}

ffi.Pointer<ImGuiSettingsHandler> findSettingsHandler(
  String typeName,
) {
  ffi.Pointer<ImGuiSettingsHandler> ret;
  final ffi.Pointer<ffi.Char> _typeName = typeName != null ? typeName.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igFindSettingsHandler(
    _typeName,
  );

  return ret;
}

ffi.Pointer<ImGuiWindowSettings> createNewWindowSettings(
  String name,
) {
  ffi.Pointer<ImGuiWindowSettings> ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCreateNewWindowSettings(
    _name,
  );

  return ret;
}

ffi.Pointer<ImGuiWindowSettings> findWindowSettingsByID(
  int id,
) {
  ffi.Pointer<ImGuiWindowSettings> ret;

  ret = _cimgui.igFindWindowSettingsByID(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiWindowSettings> findWindowSettingsByWindow(
  ffi.Pointer<ImGuiWindow> window,
) {
  ffi.Pointer<ImGuiWindowSettings> ret;

  ret = _cimgui.igFindWindowSettingsByWindow(
    window,
  );

  return ret;
}

void clearWindowSettings(
  String name,
) {
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igClearWindowSettings(
    _name,
  );

}

void localizeRegisterEntries(
  ffi.Pointer<ImGuiLocEntry> entries,
  int count,
) {

  _cimgui.igLocalizeRegisterEntries(
    entries,
    count,
  );

}

ffi.Pointer<ffi.Char> localizeGetMsg(
  ImGuiLocKey key,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igLocalizeGetMsg(
    key,
  );

  return ret;
}

void setScrollXWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  double scrollX,
) {

  _cimgui.igSetScrollX_WindowPtr(
    window,
    scrollX,
  );

}

void setScrollYWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  double scrollY,
) {

  _cimgui.igSetScrollY_WindowPtr(
    window,
    scrollY,
  );

}

void setScrollFromPosXWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  double localX,
  double centerXRatio,
) {

  _cimgui.igSetScrollFromPosX_WindowPtr(
    window,
    localX,
    centerXRatio,
  );

}

void setScrollFromPosYWindowPtr(
  ffi.Pointer<ImGuiWindow> window,
  double localY,
  double centerYRatio,
) {

  _cimgui.igSetScrollFromPosY_WindowPtr(
    window,
    localY,
    centerYRatio,
  );

}

void scrollToItem(
  int flags,
) {

  _cimgui.igScrollToItem(
    flags,
  );

}

void scrollToRect(
  ffi.Pointer<ImGuiWindow> window,
  ImRect rect,
  int flags,
) {

  _cimgui.igScrollToRect(
    window,
    rect,
    flags,
  );

}

void scrollToRectEx(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImRect rect,
  int flags,
) {

  _cimgui.igScrollToRectEx(
    pOut,
    window,
    rect,
    flags,
  );

}

void scrollToBringRectIntoView(
  ffi.Pointer<ImGuiWindow> window,
  ImRect rect,
) {

  _cimgui.igScrollToBringRectIntoView(
    window,
    rect,
  );

}

int getItemStatusFlags(
) {
  int ret;

  ret = _cimgui.igGetItemStatusFlags(
  );

  return ret;
}

int getItemFlags(
) {
  int ret;

  ret = _cimgui.igGetItemFlags(
  );

  return ret;
}

int getActiveID(
) {
  int ret;

  ret = _cimgui.igGetActiveID(
  );

  return ret;
}

int getFocusID(
) {
  int ret;

  ret = _cimgui.igGetFocusID(
  );

  return ret;
}

void setActiveID(
  int id,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igSetActiveID(
    id,
    window,
  );

}

void setFocusID(
  int id,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igSetFocusID(
    id,
    window,
  );

}

void clearActiveID(
) {

  _cimgui.igClearActiveID(
  );

}

int getHoveredID(
) {
  int ret;

  ret = _cimgui.igGetHoveredID(
  );

  return ret;
}

void setHoveredID(
  int id,
) {

  _cimgui.igSetHoveredID(
    id,
  );

}

void keepAliveID(
  int id,
) {

  _cimgui.igKeepAliveID(
    id,
  );

}

void markItemEdited(
  int id,
) {

  _cimgui.igMarkItemEdited(
    id,
  );

}

void pushOverrideID(
  int id,
) {

  _cimgui.igPushOverrideID(
    id,
  );

}

int getIDWithSeedStr(
  String strIdBegin,
  String strIdEnd,
  int seed,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _strIdBegin = strIdBegin != null ? strIdBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _strIdEnd = strIdEnd != null ? strIdEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igGetIDWithSeed_Str(
    _strIdBegin,
    _strIdEnd,
    seed,
  );

  return ret;
}

int getIDWithSeedInt(
  int n,
  int seed,
) {
  int ret;

  ret = _cimgui.igGetIDWithSeed_Int(
    n,
    seed,
  );

  return ret;
}

void itemSizeVec2(
  ImVec2 size,
  double textBaselineY,
) {

  _cimgui.igItemSize_Vec2(
    size,
    textBaselineY,
  );

}

void itemSizeRect(
  ImRect bb,
  double textBaselineY,
) {

  _cimgui.igItemSize_Rect(
    bb,
    textBaselineY,
  );

}

bool itemAdd(
  ImRect bb,
  int id,
  ffi.Pointer<ImRect> navBb,
  int extraFlags,
) {
  bool ret;

  ret = _cimgui.igItemAdd(
    bb,
    id,
    navBb,
    extraFlags,
  );

  return ret;
}

bool itemHoverable(
  ImRect bb,
  int id,
  int itemFlags,
) {
  bool ret;

  ret = _cimgui.igItemHoverable(
    bb,
    id,
    itemFlags,
  );

  return ret;
}

bool isWindowContentHoverable(
  ffi.Pointer<ImGuiWindow> window,
  int flags,
) {
  bool ret;

  ret = _cimgui.igIsWindowContentHoverable(
    window,
    flags,
  );

  return ret;
}

bool isClippedEx(
  ImRect bb,
  int id,
) {
  bool ret;

  ret = _cimgui.igIsClippedEx(
    bb,
    id,
  );

  return ret;
}

void setLastItemData(
  int itemId,
  int inFlags,
  int statusFlags,
  ImRect itemRect,
) {

  _cimgui.igSetLastItemData(
    itemId,
    inFlags,
    statusFlags,
    itemRect,
  );

}

void calcItemSize(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 size,
  double defaultW,
  double defaultH,
) {

  _cimgui.igCalcItemSize(
    pOut,
    size,
    defaultW,
    defaultH,
  );

}

double calcWrapWidthForPos(
  ImVec2 pos,
  double wrapPosX,
) {
  double ret;

  ret = _cimgui.igCalcWrapWidthForPos(
    pos,
    wrapPosX,
  );

  return ret;
}

void pushMultiItemsWidths(
  int components,
  double widthFull,
) {

  _cimgui.igPushMultiItemsWidths(
    components,
    widthFull,
  );

}

void shrinkWidths(
  ffi.Pointer<ImGuiShrinkWidthItem> items,
  int count,
  double widthExcess,
) {

  _cimgui.igShrinkWidths(
    items,
    count,
    widthExcess,
  );

}

ffi.Pointer<ImGuiDataVarInfo> getStyleVarInfo(
  int idx,
) {
  ffi.Pointer<ImGuiDataVarInfo> ret;

  ret = _cimgui.igGetStyleVarInfo(
    idx,
  );

  return ret;
}

void beginDisabledOverrideReenable(
) {

  _cimgui.igBeginDisabledOverrideReenable(
  );

}

void endDisabledOverrideReenable(
) {

  _cimgui.igEndDisabledOverrideReenable(
  );

}

void logBegin(
  int flags,
  int autoOpenDepth,
) {

  _cimgui.igLogBegin(
    flags,
    autoOpenDepth,
  );

}

void logToBuffer(
  int autoOpenDepth,
) {

  _cimgui.igLogToBuffer(
    autoOpenDepth,
  );

}

void logRenderedText(
  ffi.Pointer<ImVec2> refPos,
  String text,
  String textEnd,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLogRenderedText(
    refPos,
    _text,
    _textEnd,
  );

}

void logSetNextTextDecoration(
  String prefix,
  String suffix,
) {
  final ffi.Pointer<ffi.Char> _prefix = prefix != null ? prefix.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _suffix = suffix != null ? suffix.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLogSetNextTextDecoration(
    _prefix,
    _suffix,
  );

}

bool beginChildEx(
  String name,
  int id,
  ImVec2 sizeArg,
  int childFlags,
  int windowFlags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginChildEx(
    _name,
    id,
    sizeArg,
    childFlags,
    windowFlags,
  );

  return ret;
}

bool beginPopupEx(
  int id,
  int extraWindowFlags,
) {
  bool ret;

  ret = _cimgui.igBeginPopupEx(
    id,
    extraWindowFlags,
  );

  return ret;
}

void openPopupEx(
  int id,
  int popupFlags,
) {

  _cimgui.igOpenPopupEx(
    id,
    popupFlags,
  );

}

void closePopupToLevel(
  int remaining,
  bool restoreFocusToWindowUnderPopup,
) {

  _cimgui.igClosePopupToLevel(
    remaining,
    restoreFocusToWindowUnderPopup,
  );

}

void closePopupsOverWindow(
  ffi.Pointer<ImGuiWindow> refWindow,
  bool restoreFocusToWindowUnderPopup,
) {

  _cimgui.igClosePopupsOverWindow(
    refWindow,
    restoreFocusToWindowUnderPopup,
  );

}

void closePopupsExceptModals(
) {

  _cimgui.igClosePopupsExceptModals(
  );

}

bool isPopupOpenID(
  int id,
  int popupFlags,
) {
  bool ret;

  ret = _cimgui.igIsPopupOpen_ID(
    id,
    popupFlags,
  );

  return ret;
}

void getPopupAllowedExtentRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igGetPopupAllowedExtentRect(
    pOut,
    window,
  );

}

ffi.Pointer<ImGuiWindow> getTopMostPopupModal(
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igGetTopMostPopupModal(
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> getTopMostAndVisiblePopupModal(
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igGetTopMostAndVisiblePopupModal(
  );

  return ret;
}

ffi.Pointer<ImGuiWindow> findBlockingModal(
  ffi.Pointer<ImGuiWindow> window,
) {
  ffi.Pointer<ImGuiWindow> ret;

  ret = _cimgui.igFindBlockingModal(
    window,
  );

  return ret;
}

void findBestWindowPosForPopup(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igFindBestWindowPosForPopup(
    pOut,
    window,
  );

}

void findBestWindowPosForPopupEx(
  ffi.Pointer<ImVec2> pOut,
  ImVec2 refPos,
  ImVec2 size,
  ffi.Pointer<ffi.Int> lastDir,
  ImRect rOuter,
  ImRect rAvoid,
  ImGuiPopupPositionPolicy policy,
) {

  _cimgui.igFindBestWindowPosForPopupEx(
    pOut,
    refPos,
    size,
    lastDir,
    rOuter,
    rAvoid,
    policy,
  );

}

bool beginTooltipEx(
  int tooltipFlags,
  int extraWindowFlags,
) {
  bool ret;

  ret = _cimgui.igBeginTooltipEx(
    tooltipFlags,
    extraWindowFlags,
  );

  return ret;
}

bool beginTooltipHidden(
) {
  bool ret;

  ret = _cimgui.igBeginTooltipHidden(
  );

  return ret;
}

bool beginViewportSideBar(
  String name,
  ffi.Pointer<ImGuiViewport> viewport,
  ImGuiDir dir,
  double size,
  DartImGuiWindowFlags windowFlags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginViewportSideBar(
    _name,
    viewport,
    dir,
    size,
    windowFlags,
  );

  return ret;
}

bool beginMenuEx(
  String label,
  String icon,
  bool enabled,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _icon = icon != null ? icon.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginMenuEx(
    _label,
    _icon,
    enabled,
  );

  return ret;
}

bool menuItemEx(
  String label,
  String icon,
  String shortcut,
  bool selected,
  bool enabled,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _icon = icon != null ? icon.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _shortcut = shortcut != null ? shortcut.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igMenuItemEx(
    _label,
    _icon,
    _shortcut,
    selected,
    enabled,
  );

  return ret;
}

bool beginComboPopup(
  int popupId,
  ImRect bb,
  int flags,
) {
  bool ret;

  ret = _cimgui.igBeginComboPopup(
    popupId,
    bb,
    flags,
  );

  return ret;
}

bool beginComboPreview(
) {
  bool ret;

  ret = _cimgui.igBeginComboPreview(
  );

  return ret;
}

void endComboPreview(
) {

  _cimgui.igEndComboPreview(
  );

}

void navInitWindow(
  ffi.Pointer<ImGuiWindow> window,
  bool forceReinit,
) {

  _cimgui.igNavInitWindow(
    window,
    forceReinit,
  );

}

void navInitRequestApplyResult(
) {

  _cimgui.igNavInitRequestApplyResult(
  );

}

bool navMoveRequestButNoResultYet(
) {
  bool ret;

  ret = _cimgui.igNavMoveRequestButNoResultYet(
  );

  return ret;
}

void navMoveRequestSubmit(
  ImGuiDir moveDir,
  ImGuiDir clipDir,
  DartImGuiNavMoveFlags moveFlags,
  DartImGuiScrollFlags scrollFlags,
) {

  _cimgui.igNavMoveRequestSubmit(
    moveDir,
    clipDir,
    moveFlags,
    scrollFlags,
  );

}

void navMoveRequestForward(
  ImGuiDir moveDir,
  ImGuiDir clipDir,
  DartImGuiNavMoveFlags moveFlags,
  DartImGuiScrollFlags scrollFlags,
) {

  _cimgui.igNavMoveRequestForward(
    moveDir,
    clipDir,
    moveFlags,
    scrollFlags,
  );

}

void navMoveRequestResolveWithLastItem(
  ffi.Pointer<ImGuiNavItemData> result,
) {

  _cimgui.igNavMoveRequestResolveWithLastItem(
    result,
  );

}

void navMoveRequestResolveWithPastTreeNode(
  ffi.Pointer<ImGuiNavItemData> result,
  ffi.Pointer<ImGuiTreeNodeStackData> treeNodeData,
) {

  _cimgui.igNavMoveRequestResolveWithPastTreeNode(
    result,
    treeNodeData,
  );

}

void navMoveRequestCancel(
) {

  _cimgui.igNavMoveRequestCancel(
  );

}

void navMoveRequestApplyResult(
) {

  _cimgui.igNavMoveRequestApplyResult(
  );

}

void navMoveRequestTryWrapping(
  ffi.Pointer<ImGuiWindow> window,
  int moveFlags,
) {

  _cimgui.igNavMoveRequestTryWrapping(
    window,
    moveFlags,
  );

}

void navHighlightActivated(
  int id,
) {

  _cimgui.igNavHighlightActivated(
    id,
  );

}

void navClearPreferredPosForAxis(
  ImGuiAxis axis,
) {

  _cimgui.igNavClearPreferredPosForAxis(
    axis,
  );

}

void setNavCursorVisibleAfterMove(
) {

  _cimgui.igSetNavCursorVisibleAfterMove(
  );

}

void navUpdateCurrentWindowIsScrollPushableX(
) {

  _cimgui.igNavUpdateCurrentWindowIsScrollPushableX(
  );

}

void setNavWindow(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igSetNavWindow(
    window,
  );

}

void setNavID(
  DartImGuiID id,
  ImGuiNavLayer navLayer,
  DartImGuiID focusScopeId,
  ImRect rectRel,
) {

  _cimgui.igSetNavID(
    id,
    navLayer,
    focusScopeId,
    rectRel,
  );

}

void setNavFocusScope(
  int focusScopeId,
) {

  _cimgui.igSetNavFocusScope(
    focusScopeId,
  );

}

void focusItem(
) {

  _cimgui.igFocusItem(
  );

}

void activateItemByID(
  int id,
) {

  _cimgui.igActivateItemByID(
    id,
  );

}

bool isNamedKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsNamedKey(
    key,
  );

  return ret;
}

bool isNamedKeyOrMod(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsNamedKeyOrMod(
    key,
  );

  return ret;
}

bool isLegacyKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsLegacyKey(
    key,
  );

  return ret;
}

bool isKeyboardKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsKeyboardKey(
    key,
  );

  return ret;
}

bool isGamepadKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsGamepadKey(
    key,
  );

  return ret;
}

bool isMouseKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsMouseKey(
    key,
  );

  return ret;
}

bool isAliasKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsAliasKey(
    key,
  );

  return ret;
}

bool isLRModKey(
  ImGuiKey key,
) {
  bool ret;

  ret = _cimgui.igIsLRModKey(
    key,
  );

  return ret;
}

int fixupKeyChord(
  int keyChord,
) {
  int ret;

  ret = _cimgui.igFixupKeyChord(
    keyChord,
  );

  return ret;
}

ImGuiKey convertSingleModFlagToKey(
  ImGuiKey key,
) {
  ImGuiKey ret;

  ret = _cimgui.igConvertSingleModFlagToKey(
    key,
  );

  return ret;
}

ffi.Pointer<ImGuiKeyData> getKeyDataContextPtr(
  ffi.Pointer<ImGuiContext> ctx,
  ImGuiKey key,
) {
  ffi.Pointer<ImGuiKeyData> ret;

  ret = _cimgui.igGetKeyData_ContextPtr(
    ctx,
    key,
  );

  return ret;
}

ffi.Pointer<ImGuiKeyData> getKeyDataKey(
  ImGuiKey key,
) {
  ffi.Pointer<ImGuiKeyData> ret;

  ret = _cimgui.igGetKeyData_Key(
    key,
  );

  return ret;
}

ffi.Pointer<ffi.Char> getKeyChordName(
  int keyChord,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igGetKeyChordName(
    keyChord,
  );

  return ret;
}

ImGuiKey mouseButtonToKey(
  DartImGuiMouseButton button,
) {
  ImGuiKey ret;

  ret = _cimgui.igMouseButtonToKey(
    button,
  );

  return ret;
}

bool isMouseDragPastThreshold(
  int button,
  double lockThreshold,
) {
  bool ret;

  ret = _cimgui.igIsMouseDragPastThreshold(
    button,
    lockThreshold,
  );

  return ret;
}

void getKeyMagnitude2d(
  ffi.Pointer<ImVec2> pOut,
  ImGuiKey keyLeft,
  ImGuiKey keyRight,
  ImGuiKey keyUp,
  ImGuiKey keyDown,
) {

  _cimgui.igGetKeyMagnitude2d(
    pOut,
    keyLeft,
    keyRight,
    keyUp,
    keyDown,
  );

}

double getNavTweakPressedAmount(
  ImGuiAxis axis,
) {
  double ret;

  ret = _cimgui.igGetNavTweakPressedAmount(
    axis,
  );

  return ret;
}

int calcTypematicRepeatAmount(
  double t0,
  double t1,
  double repeatDelay,
  double repeatRate,
) {
  int ret;

  ret = _cimgui.igCalcTypematicRepeatAmount(
    t0,
    t1,
    repeatDelay,
    repeatRate,
  );

  return ret;
}

void getTypematicRepeatRate(
  int flags,
  ffi.Pointer<ffi.Float> repeatDelay,
  ffi.Pointer<ffi.Float> repeatRate,
) {

  _cimgui.igGetTypematicRepeatRate(
    flags,
    repeatDelay,
    repeatRate,
  );

}

void teleportMousePos(
  ImVec2 pos,
) {

  _cimgui.igTeleportMousePos(
    pos,
  );

}

void setActiveIdUsingAllKeyboardKeys(
) {

  _cimgui.igSetActiveIdUsingAllKeyboardKeys(
  );

}

bool isActiveIdUsingNavDir(
  ImGuiDir dir,
) {
  bool ret;

  ret = _cimgui.igIsActiveIdUsingNavDir(
    dir,
  );

  return ret;
}

DartImGuiID getKeyOwner(
  ImGuiKey key,
) {
  DartImGuiID ret;

  ret = _cimgui.igGetKeyOwner(
    key,
  );

  return ret;
}

void setKeyOwner(
  ImGuiKey key,
  DartImGuiID ownerId,
  DartImGuiInputFlags flags,
) {

  _cimgui.igSetKeyOwner(
    key,
    ownerId,
    flags,
  );

}

void setKeyOwnersForKeyChord(
  int key,
  int ownerId,
  int flags,
) {

  _cimgui.igSetKeyOwnersForKeyChord(
    key,
    ownerId,
    flags,
  );

}

void setItemKeyOwnerInputFlags(
  ImGuiKey key,
  DartImGuiInputFlags flags,
) {

  _cimgui.igSetItemKeyOwner_InputFlags(
    key,
    flags,
  );

}

bool testKeyOwner(
  ImGuiKey key,
  DartImGuiID ownerId,
) {
  bool ret;

  ret = _cimgui.igTestKeyOwner(
    key,
    ownerId,
  );

  return ret;
}

ffi.Pointer<ImGuiKeyOwnerData> getKeyOwnerData(
  ffi.Pointer<ImGuiContext> ctx,
  ImGuiKey key,
) {
  ffi.Pointer<ImGuiKeyOwnerData> ret;

  ret = _cimgui.igGetKeyOwnerData(
    ctx,
    key,
  );

  return ret;
}

bool isKeyDownID(
  ImGuiKey key,
  DartImGuiID ownerId,
) {
  bool ret;

  ret = _cimgui.igIsKeyDown_ID(
    key,
    ownerId,
  );

  return ret;
}

bool isKeyPressedInputFlags(
  ImGuiKey key,
  DartImGuiInputFlags flags,
  DartImGuiID ownerId,
) {
  bool ret;

  ret = _cimgui.igIsKeyPressed_InputFlags(
    key,
    flags,
    ownerId,
  );

  return ret;
}

bool isKeyReleasedID(
  ImGuiKey key,
  DartImGuiID ownerId,
) {
  bool ret;

  ret = _cimgui.igIsKeyReleased_ID(
    key,
    ownerId,
  );

  return ret;
}

bool isKeyChordPressedInputFlags(
  int keyChord,
  int flags,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igIsKeyChordPressed_InputFlags(
    keyChord,
    flags,
    ownerId,
  );

  return ret;
}

bool isMouseDownID(
  int button,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igIsMouseDown_ID(
    button,
    ownerId,
  );

  return ret;
}

bool isMouseClickedInputFlags(
  int button,
  int flags,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igIsMouseClicked_InputFlags(
    button,
    flags,
    ownerId,
  );

  return ret;
}

bool isMouseReleasedID(
  int button,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igIsMouseReleased_ID(
    button,
    ownerId,
  );

  return ret;
}

bool isMouseDoubleClickedID(
  int button,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igIsMouseDoubleClicked_ID(
    button,
    ownerId,
  );

  return ret;
}

bool shortcutID(
  int keyChord,
  int flags,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igShortcut_ID(
    keyChord,
    flags,
    ownerId,
  );

  return ret;
}

bool setShortcutRouting(
  int keyChord,
  int flags,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igSetShortcutRouting(
    keyChord,
    flags,
    ownerId,
  );

  return ret;
}

bool testShortcutRouting(
  int keyChord,
  int ownerId,
) {
  bool ret;

  ret = _cimgui.igTestShortcutRouting(
    keyChord,
    ownerId,
  );

  return ret;
}

ffi.Pointer<ImGuiKeyRoutingData> getShortcutRoutingData(
  int keyChord,
) {
  ffi.Pointer<ImGuiKeyRoutingData> ret;

  ret = _cimgui.igGetShortcutRoutingData(
    keyChord,
  );

  return ret;
}

void dockContextInitialize(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextInitialize(
    ctx,
  );

}

void dockContextShutdown(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextShutdown(
    ctx,
  );

}

void dockContextClearNodes(
  ffi.Pointer<ImGuiContext> ctx,
  int rootId,
  bool clearSettingsRefs,
) {

  _cimgui.igDockContextClearNodes(
    ctx,
    rootId,
    clearSettingsRefs,
  );

}

void dockContextRebuildNodes(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextRebuildNodes(
    ctx,
  );

}

void dockContextNewFrameUpdateUndocking(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextNewFrameUpdateUndocking(
    ctx,
  );

}

void dockContextNewFrameUpdateDocking(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextNewFrameUpdateDocking(
    ctx,
  );

}

void dockContextEndFrame(
  ffi.Pointer<ImGuiContext> ctx,
) {

  _cimgui.igDockContextEndFrame(
    ctx,
  );

}

int dockContextGenNodeID(
  ffi.Pointer<ImGuiContext> ctx,
) {
  int ret;

  ret = _cimgui.igDockContextGenNodeID(
    ctx,
  );

  return ret;
}

void dockContextQueueDock(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiWindow> target,
  ffi.Pointer<ImGuiDockNode> targetNode,
  ffi.Pointer<ImGuiWindow> payload,
  ImGuiDir splitDir,
  double splitRatio,
  bool splitOuter,
) {

  _cimgui.igDockContextQueueDock(
    ctx,
    target,
    targetNode,
    payload,
    splitDir,
    splitRatio,
    splitOuter,
  );

}

void dockContextQueueUndockWindow(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igDockContextQueueUndockWindow(
    ctx,
    window,
  );

}

void dockContextQueueUndockNode(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiDockNode> node,
) {

  _cimgui.igDockContextQueueUndockNode(
    ctx,
    node,
  );

}

void dockContextProcessUndockWindow(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiWindow> window,
  bool clearPersistentDockingRef,
) {

  _cimgui.igDockContextProcessUndockWindow(
    ctx,
    window,
    clearPersistentDockingRef,
  );

}

void dockContextProcessUndockNode(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiDockNode> node,
) {

  _cimgui.igDockContextProcessUndockNode(
    ctx,
    node,
  );

}

bool dockContextCalcDropPosForDocking(
  ffi.Pointer<ImGuiWindow> target,
  ffi.Pointer<ImGuiDockNode> targetNode,
  ffi.Pointer<ImGuiWindow> payloadWindow,
  ffi.Pointer<ImGuiDockNode> payloadNode,
  ImGuiDir splitDir,
  bool splitOuter,
  ffi.Pointer<ImVec2> outPos,
) {
  bool ret;

  ret = _cimgui.igDockContextCalcDropPosForDocking(
    target,
    targetNode,
    payloadWindow,
    payloadNode,
    splitDir,
    splitOuter,
    outPos,
  );

  return ret;
}

ffi.Pointer<ImGuiDockNode> dockContextFindNodeByID(
  ffi.Pointer<ImGuiContext> ctx,
  int id,
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.igDockContextFindNodeByID(
    ctx,
    id,
  );

  return ret;
}

void dockNodeWindowMenuHandlerDefault(
  ffi.Pointer<ImGuiContext> ctx,
  ffi.Pointer<ImGuiDockNode> node,
  ffi.Pointer<ImGuiTabBar> tabBar,
) {

  _cimgui.igDockNodeWindowMenuHandler_Default(
    ctx,
    node,
    tabBar,
  );

}

bool dockNodeBeginAmendTabBar(
  ffi.Pointer<ImGuiDockNode> node,
) {
  bool ret;

  ret = _cimgui.igDockNodeBeginAmendTabBar(
    node,
  );

  return ret;
}

void dockNodeEndAmendTabBar(
) {

  _cimgui.igDockNodeEndAmendTabBar(
  );

}

ffi.Pointer<ImGuiDockNode> dockNodeGetRootNode(
  ffi.Pointer<ImGuiDockNode> node,
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.igDockNodeGetRootNode(
    node,
  );

  return ret;
}

bool dockNodeIsInHierarchyOf(
  ffi.Pointer<ImGuiDockNode> node,
  ffi.Pointer<ImGuiDockNode> parent,
) {
  bool ret;

  ret = _cimgui.igDockNodeIsInHierarchyOf(
    node,
    parent,
  );

  return ret;
}

int dockNodeGetDepth(
  ffi.Pointer<ImGuiDockNode> node,
) {
  int ret;

  ret = _cimgui.igDockNodeGetDepth(
    node,
  );

  return ret;
}

int dockNodeGetWindowMenuButtonId(
  ffi.Pointer<ImGuiDockNode> node,
) {
  int ret;

  ret = _cimgui.igDockNodeGetWindowMenuButtonId(
    node,
  );

  return ret;
}

ffi.Pointer<ImGuiDockNode> getWindowDockNode(
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.igGetWindowDockNode(
  );

  return ret;
}

bool getWindowAlwaysWantOwnTabBar(
  ffi.Pointer<ImGuiWindow> window,
) {
  bool ret;

  ret = _cimgui.igGetWindowAlwaysWantOwnTabBar(
    window,
  );

  return ret;
}

void beginDocked(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ffi.Bool> pOpen,
) {

  _cimgui.igBeginDocked(
    window,
    pOpen,
  );

}

void beginDockableDragDropSource(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igBeginDockableDragDropSource(
    window,
  );

}

void beginDockableDragDropTarget(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igBeginDockableDragDropTarget(
    window,
  );

}

void setWindowDock(
  ffi.Pointer<ImGuiWindow> window,
  int dockId,
  int cond,
) {

  _cimgui.igSetWindowDock(
    window,
    dockId,
    cond,
  );

}

void dockBuilderDockWindow(
  String windowName,
  int nodeId,
) {
  final ffi.Pointer<ffi.Char> _windowName = windowName != null ? windowName.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDockBuilderDockWindow(
    _windowName,
    nodeId,
  );

}

ffi.Pointer<ImGuiDockNode> dockBuilderGetNode(
  int nodeId,
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.igDockBuilderGetNode(
    nodeId,
  );

  return ret;
}

ffi.Pointer<ImGuiDockNode> dockBuilderGetCentralNode(
  int nodeId,
) {
  ffi.Pointer<ImGuiDockNode> ret;

  ret = _cimgui.igDockBuilderGetCentralNode(
    nodeId,
  );

  return ret;
}

int dockBuilderAddNode(
  int nodeId,
  int flags,
) {
  int ret;

  ret = _cimgui.igDockBuilderAddNode(
    nodeId,
    flags,
  );

  return ret;
}

void dockBuilderRemoveNode(
  int nodeId,
) {

  _cimgui.igDockBuilderRemoveNode(
    nodeId,
  );

}

void dockBuilderRemoveNodeDockedWindows(
  int nodeId,
  bool clearSettingsRefs,
) {

  _cimgui.igDockBuilderRemoveNodeDockedWindows(
    nodeId,
    clearSettingsRefs,
  );

}

void dockBuilderRemoveNodeChildNodes(
  int nodeId,
) {

  _cimgui.igDockBuilderRemoveNodeChildNodes(
    nodeId,
  );

}

void dockBuilderSetNodePos(
  int nodeId,
  ImVec2 pos,
) {

  _cimgui.igDockBuilderSetNodePos(
    nodeId,
    pos,
  );

}

void dockBuilderSetNodeSize(
  int nodeId,
  ImVec2 size,
) {

  _cimgui.igDockBuilderSetNodeSize(
    nodeId,
    size,
  );

}

DartImGuiID dockBuilderSplitNode(
  DartImGuiID nodeId,
  ImGuiDir splitDir,
  double sizeRatioForNodeAtDir,
  ffi.Pointer<ImGuiID> outIdAtDir,
  ffi.Pointer<ImGuiID> outIdAtOppositeDir,
) {
  DartImGuiID ret;

  ret = _cimgui.igDockBuilderSplitNode(
    nodeId,
    splitDir,
    sizeRatioForNodeAtDir,
    outIdAtDir,
    outIdAtOppositeDir,
  );

  return ret;
}

void dockBuilderCopyDockSpace(
  int srcDockspaceId,
  int dstDockspaceId,
  ffi.Pointer<ImVector_const_charPtr> inWindowRemapPairs,
) {

  _cimgui.igDockBuilderCopyDockSpace(
    srcDockspaceId,
    dstDockspaceId,
    inWindowRemapPairs,
  );

}

void dockBuilderCopyNode(
  int srcNodeId,
  int dstNodeId,
  ffi.Pointer<ImVector_ImGuiID> outNodeRemapPairs,
) {

  _cimgui.igDockBuilderCopyNode(
    srcNodeId,
    dstNodeId,
    outNodeRemapPairs,
  );

}

void dockBuilderCopyWindowSettings(
  String srcName,
  String dstName,
) {
  final ffi.Pointer<ffi.Char> _srcName = srcName != null ? srcName.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _dstName = dstName != null ? dstName.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDockBuilderCopyWindowSettings(
    _srcName,
    _dstName,
  );

}

void dockBuilderFinish(
  int nodeId,
) {

  _cimgui.igDockBuilderFinish(
    nodeId,
  );

}

void pushFocusScope(
  int id,
) {

  _cimgui.igPushFocusScope(
    id,
  );

}

void popFocusScope(
) {

  _cimgui.igPopFocusScope(
  );

}

int getCurrentFocusScope(
) {
  int ret;

  ret = _cimgui.igGetCurrentFocusScope(
  );

  return ret;
}

bool isDragDropActive(
) {
  bool ret;

  ret = _cimgui.igIsDragDropActive(
  );

  return ret;
}

bool beginDragDropTargetCustom(
  ImRect bb,
  int id,
) {
  bool ret;

  ret = _cimgui.igBeginDragDropTargetCustom(
    bb,
    id,
  );

  return ret;
}

void clearDragDrop(
) {

  _cimgui.igClearDragDrop(
  );

}

bool isDragDropPayloadBeingAccepted(
) {
  bool ret;

  ret = _cimgui.igIsDragDropPayloadBeingAccepted(
  );

  return ret;
}

void renderDragDropTargetRect(
  ImRect bb,
  ImRect itemClipRect,
) {

  _cimgui.igRenderDragDropTargetRect(
    bb,
    itemClipRect,
  );

}

ffi.Pointer<ImGuiTypingSelectRequest> getTypingSelectRequest(
  int flags,
) {
  ffi.Pointer<ImGuiTypingSelectRequest> ret;

  ret = _cimgui.igGetTypingSelectRequest(
    flags,
  );

  return ret;
}

int typingSelectFindMatch(
  ffi.Pointer<ImGuiTypingSelectRequest> req,
  int itemsCount,
  ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>, ffi.Int)>> getItemNameFunc,
  ffi.Pointer<ffi.Void> userData,
  int navItemIdx,
) {
  int ret;

  ret = _cimgui.igTypingSelectFindMatch(
    req,
    itemsCount,
    getItemNameFunc,
    userData,
    navItemIdx,
  );

  return ret;
}

int typingSelectFindNextSingleCharMatch(
  ffi.Pointer<ImGuiTypingSelectRequest> req,
  int itemsCount,
  ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>, ffi.Int)>> getItemNameFunc,
  ffi.Pointer<ffi.Void> userData,
  int navItemIdx,
) {
  int ret;

  ret = _cimgui.igTypingSelectFindNextSingleCharMatch(
    req,
    itemsCount,
    getItemNameFunc,
    userData,
    navItemIdx,
  );

  return ret;
}

int typingSelectFindBestLeadingMatch(
  ffi.Pointer<ImGuiTypingSelectRequest> req,
  int itemsCount,
  ffi.Pointer<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>, ffi.Int)>> getItemNameFunc,
  ffi.Pointer<ffi.Void> userData,
) {
  int ret;

  ret = _cimgui.igTypingSelectFindBestLeadingMatch(
    req,
    itemsCount,
    getItemNameFunc,
    userData,
  );

  return ret;
}

bool beginBoxSelect(
  ImRect scopeRect,
  ffi.Pointer<ImGuiWindow> window,
  int boxSelectId,
  int msFlags,
) {
  bool ret;

  ret = _cimgui.igBeginBoxSelect(
    scopeRect,
    window,
    boxSelectId,
    msFlags,
  );

  return ret;
}

void endBoxSelect(
  ImRect scopeRect,
  int msFlags,
) {

  _cimgui.igEndBoxSelect(
    scopeRect,
    msFlags,
  );

}

void multiSelectItemHeader(
  int id,
  ffi.Pointer<ffi.Bool> pSelected,
  ffi.Pointer<ImGuiButtonFlags> pButtonFlags,
) {

  _cimgui.igMultiSelectItemHeader(
    id,
    pSelected,
    pButtonFlags,
  );

}

void multiSelectItemFooter(
  int id,
  ffi.Pointer<ffi.Bool> pSelected,
  ffi.Pointer<ffi.Bool> pPressed,
) {

  _cimgui.igMultiSelectItemFooter(
    id,
    pSelected,
    pPressed,
  );

}

void multiSelectAddSetAll(
  ffi.Pointer<ImGuiMultiSelectTempData> ms,
  bool selected,
) {

  _cimgui.igMultiSelectAddSetAll(
    ms,
    selected,
  );

}

void multiSelectAddSetRange(
  ffi.Pointer<ImGuiMultiSelectTempData> ms,
  bool selected,
  int rangeDir,
  int firstItem,
  int lastItem,
) {

  _cimgui.igMultiSelectAddSetRange(
    ms,
    selected,
    rangeDir,
    firstItem,
    lastItem,
  );

}

ffi.Pointer<ImGuiBoxSelectState> getBoxSelectState(
  int id,
) {
  ffi.Pointer<ImGuiBoxSelectState> ret;

  ret = _cimgui.igGetBoxSelectState(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiMultiSelectState> getMultiSelectState(
  int id,
) {
  ffi.Pointer<ImGuiMultiSelectState> ret;

  ret = _cimgui.igGetMultiSelectState(
    id,
  );

  return ret;
}

void setWindowClipRectBeforeSetChannel(
  ffi.Pointer<ImGuiWindow> window,
  ImRect clipRect,
) {

  _cimgui.igSetWindowClipRectBeforeSetChannel(
    window,
    clipRect,
  );

}

void beginColumns(
  String strId,
  int count,
  int flags,
) {
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igBeginColumns(
    _strId,
    count,
    flags,
  );

}

void endColumns(
) {

  _cimgui.igEndColumns(
  );

}

void pushColumnClipRect(
  int columnIndex,
) {

  _cimgui.igPushColumnClipRect(
    columnIndex,
  );

}

void pushColumnsBackground(
) {

  _cimgui.igPushColumnsBackground(
  );

}

void popColumnsBackground(
) {

  _cimgui.igPopColumnsBackground(
  );

}

int getColumnsID(
  String strId,
  int count,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igGetColumnsID(
    _strId,
    count,
  );

  return ret;
}

ffi.Pointer<ImGuiOldColumns> findOrCreateColumns(
  ffi.Pointer<ImGuiWindow> window,
  int id,
) {
  ffi.Pointer<ImGuiOldColumns> ret;

  ret = _cimgui.igFindOrCreateColumns(
    window,
    id,
  );

  return ret;
}

double getColumnOffsetFromNorm(
  ffi.Pointer<ImGuiOldColumns> columns,
  double offsetNorm,
) {
  double ret;

  ret = _cimgui.igGetColumnOffsetFromNorm(
    columns,
    offsetNorm,
  );

  return ret;
}

double getColumnNormFromOffset(
  ffi.Pointer<ImGuiOldColumns> columns,
  double offset,
) {
  double ret;

  ret = _cimgui.igGetColumnNormFromOffset(
    columns,
    offset,
  );

  return ret;
}

void tableOpenContextMenu(
  int columnN,
) {

  _cimgui.igTableOpenContextMenu(
    columnN,
  );

}

void tableSetColumnWidth(
  int columnN,
  double width,
) {

  _cimgui.igTableSetColumnWidth(
    columnN,
    width,
  );

}

void tableSetColumnSortDirection(
  int columnN,
  ImGuiSortDirection sortDirection,
  bool appendToSortSpecs,
) {

  _cimgui.igTableSetColumnSortDirection(
    columnN,
    sortDirection,
    appendToSortSpecs,
  );

}

int tableGetHoveredRow(
) {
  int ret;

  ret = _cimgui.igTableGetHoveredRow(
  );

  return ret;
}

double tableGetHeaderRowHeight(
) {
  double ret;

  ret = _cimgui.igTableGetHeaderRowHeight(
  );

  return ret;
}

double tableGetHeaderAngledMaxLabelWidth(
) {
  double ret;

  ret = _cimgui.igTableGetHeaderAngledMaxLabelWidth(
  );

  return ret;
}

void tablePushBackgroundChannel(
) {

  _cimgui.igTablePushBackgroundChannel(
  );

}

void tablePopBackgroundChannel(
) {

  _cimgui.igTablePopBackgroundChannel(
  );

}

void tableAngledHeadersRowEx(
  int rowId,
  double angle,
  double maxLabelWidth,
  ffi.Pointer<ImGuiTableHeaderData> data,
  int dataCount,
) {

  _cimgui.igTableAngledHeadersRowEx(
    rowId,
    angle,
    maxLabelWidth,
    data,
    dataCount,
  );

}

ffi.Pointer<ImGuiTable> getCurrentTable(
) {
  ffi.Pointer<ImGuiTable> ret;

  ret = _cimgui.igGetCurrentTable(
  );

  return ret;
}

ffi.Pointer<ImGuiTable> tableFindByID(
  int id,
) {
  ffi.Pointer<ImGuiTable> ret;

  ret = _cimgui.igTableFindByID(
    id,
  );

  return ret;
}

bool beginTableEx(
  String name,
  int id,
  int columnsCount,
  int flags,
  ImVec2 outerSize,
  double innerWidth,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _name = name != null ? name.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igBeginTableEx(
    _name,
    id,
    columnsCount,
    flags,
    outerSize,
    innerWidth,
  );

  return ret;
}

void tableBeginInitMemory(
  ffi.Pointer<ImGuiTable> table,
  int columnsCount,
) {

  _cimgui.igTableBeginInitMemory(
    table,
    columnsCount,
  );

}

void tableBeginApplyRequests(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableBeginApplyRequests(
    table,
  );

}

void tableSetupDrawChannels(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableSetupDrawChannels(
    table,
  );

}

void tableUpdateLayout(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableUpdateLayout(
    table,
  );

}

void tableUpdateBorders(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableUpdateBorders(
    table,
  );

}

void tableUpdateColumnsWeightFromWidth(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableUpdateColumnsWeightFromWidth(
    table,
  );

}

void tableDrawBorders(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableDrawBorders(
    table,
  );

}

void tableDrawDefaultContextMenu(
  ffi.Pointer<ImGuiTable> table,
  int flagsForSectionToDisplay,
) {

  _cimgui.igTableDrawDefaultContextMenu(
    table,
    flagsForSectionToDisplay,
  );

}

bool tableBeginContextMenuPopup(
  ffi.Pointer<ImGuiTable> table,
) {
  bool ret;

  ret = _cimgui.igTableBeginContextMenuPopup(
    table,
  );

  return ret;
}

void tableMergeDrawChannels(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableMergeDrawChannels(
    table,
  );

}

ffi.Pointer<ImGuiTableInstanceData> tableGetInstanceData(
  ffi.Pointer<ImGuiTable> table,
  int instanceNo,
) {
  ffi.Pointer<ImGuiTableInstanceData> ret;

  ret = _cimgui.igTableGetInstanceData(
    table,
    instanceNo,
  );

  return ret;
}

int tableGetInstanceID(
  ffi.Pointer<ImGuiTable> table,
  int instanceNo,
) {
  int ret;

  ret = _cimgui.igTableGetInstanceID(
    table,
    instanceNo,
  );

  return ret;
}

void tableSortSpecsSanitize(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableSortSpecsSanitize(
    table,
  );

}

void tableSortSpecsBuild(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableSortSpecsBuild(
    table,
  );

}

ImGuiSortDirection tableGetColumnNextSortDirection(
  ffi.Pointer<ImGuiTableColumn> column,
) {
  ImGuiSortDirection ret;

  ret = _cimgui.igTableGetColumnNextSortDirection(
    column,
  );

  return ret;
}

void tableFixColumnSortDirection(
  ffi.Pointer<ImGuiTable> table,
  ffi.Pointer<ImGuiTableColumn> column,
) {

  _cimgui.igTableFixColumnSortDirection(
    table,
    column,
  );

}

double tableGetColumnWidthAuto(
  ffi.Pointer<ImGuiTable> table,
  ffi.Pointer<ImGuiTableColumn> column,
) {
  double ret;

  ret = _cimgui.igTableGetColumnWidthAuto(
    table,
    column,
  );

  return ret;
}

void tableBeginRow(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableBeginRow(
    table,
  );

}

void tableEndRow(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableEndRow(
    table,
  );

}

void tableBeginCell(
  ffi.Pointer<ImGuiTable> table,
  int columnN,
) {

  _cimgui.igTableBeginCell(
    table,
    columnN,
  );

}

void tableEndCell(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableEndCell(
    table,
  );

}

void tableGetCellBgRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiTable> table,
  int columnN,
) {

  _cimgui.igTableGetCellBgRect(
    pOut,
    table,
    columnN,
  );

}

ffi.Pointer<ffi.Char> tableGetColumnNameTablePtr(
  ffi.Pointer<ImGuiTable> table,
  int columnN,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igTableGetColumnName_TablePtr(
    table,
    columnN,
  );

  return ret;
}

int tableGetColumnResizeID(
  ffi.Pointer<ImGuiTable> table,
  int columnN,
  int instanceNo,
) {
  int ret;

  ret = _cimgui.igTableGetColumnResizeID(
    table,
    columnN,
    instanceNo,
  );

  return ret;
}

double tableCalcMaxColumnWidth(
  ffi.Pointer<ImGuiTable> table,
  int columnN,
) {
  double ret;

  ret = _cimgui.igTableCalcMaxColumnWidth(
    table,
    columnN,
  );

  return ret;
}

void tableSetColumnWidthAutoSingle(
  ffi.Pointer<ImGuiTable> table,
  int columnN,
) {

  _cimgui.igTableSetColumnWidthAutoSingle(
    table,
    columnN,
  );

}

void tableSetColumnWidthAutoAll(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableSetColumnWidthAutoAll(
    table,
  );

}

void tableRemove(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableRemove(
    table,
  );

}

void tableGcCompactTransientBuffersTablePtr(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableGcCompactTransientBuffers_TablePtr(
    table,
  );

}

void tableGcCompactTransientBuffersTableTempDataPtr(
  ffi.Pointer<ImGuiTableTempData> table,
) {

  _cimgui.igTableGcCompactTransientBuffers_TableTempDataPtr(
    table,
  );

}

void tableGcCompactSettings(
) {

  _cimgui.igTableGcCompactSettings(
  );

}

void tableLoadSettings(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableLoadSettings(
    table,
  );

}

void tableSaveSettings(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableSaveSettings(
    table,
  );

}

void tableResetSettings(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igTableResetSettings(
    table,
  );

}

ffi.Pointer<ImGuiTableSettings> tableGetBoundSettings(
  ffi.Pointer<ImGuiTable> table,
) {
  ffi.Pointer<ImGuiTableSettings> ret;

  ret = _cimgui.igTableGetBoundSettings(
    table,
  );

  return ret;
}

void tableSettingsAddSettingsHandler(
) {

  _cimgui.igTableSettingsAddSettingsHandler(
  );

}

ffi.Pointer<ImGuiTableSettings> tableSettingsCreate(
  int id,
  int columnsCount,
) {
  ffi.Pointer<ImGuiTableSettings> ret;

  ret = _cimgui.igTableSettingsCreate(
    id,
    columnsCount,
  );

  return ret;
}

ffi.Pointer<ImGuiTableSettings> tableSettingsFindByID(
  int id,
) {
  ffi.Pointer<ImGuiTableSettings> ret;

  ret = _cimgui.igTableSettingsFindByID(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiTabBar> getCurrentTabBar(
) {
  ffi.Pointer<ImGuiTabBar> ret;

  ret = _cimgui.igGetCurrentTabBar(
  );

  return ret;
}

bool beginTabBarEx(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ImRect bb,
  int flags,
) {
  bool ret;

  ret = _cimgui.igBeginTabBarEx(
    tabBar,
    bb,
    flags,
  );

  return ret;
}

ffi.Pointer<ImGuiTabItem> tabBarFindTabByID(
  ffi.Pointer<ImGuiTabBar> tabBar,
  int tabId,
) {
  ffi.Pointer<ImGuiTabItem> ret;

  ret = _cimgui.igTabBarFindTabByID(
    tabBar,
    tabId,
  );

  return ret;
}

ffi.Pointer<ImGuiTabItem> tabBarFindTabByOrder(
  ffi.Pointer<ImGuiTabBar> tabBar,
  int order,
) {
  ffi.Pointer<ImGuiTabItem> ret;

  ret = _cimgui.igTabBarFindTabByOrder(
    tabBar,
    order,
  );

  return ret;
}

ffi.Pointer<ImGuiTabItem> tabBarFindMostRecentlySelectedTabForActiveWindow(
  ffi.Pointer<ImGuiTabBar> tabBar,
) {
  ffi.Pointer<ImGuiTabItem> ret;

  ret = _cimgui.igTabBarFindMostRecentlySelectedTabForActiveWindow(
    tabBar,
  );

  return ret;
}

ffi.Pointer<ImGuiTabItem> tabBarGetCurrentTab(
  ffi.Pointer<ImGuiTabBar> tabBar,
) {
  ffi.Pointer<ImGuiTabItem> ret;

  ret = _cimgui.igTabBarGetCurrentTab(
    tabBar,
  );

  return ret;
}

int tabBarGetTabOrder(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
) {
  int ret;

  ret = _cimgui.igTabBarGetTabOrder(
    tabBar,
    tab,
  );

  return ret;
}

ffi.Pointer<ffi.Char> tabBarGetTabName(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
) {
  ffi.Pointer<ffi.Char> ret;

  ret = _cimgui.igTabBarGetTabName(
    tabBar,
    tab,
  );

  return ret;
}

void tabBarAddTab(
  ffi.Pointer<ImGuiTabBar> tabBar,
  int tabFlags,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igTabBarAddTab(
    tabBar,
    tabFlags,
    window,
  );

}

void tabBarRemoveTab(
  ffi.Pointer<ImGuiTabBar> tabBar,
  int tabId,
) {

  _cimgui.igTabBarRemoveTab(
    tabBar,
    tabId,
  );

}

void tabBarCloseTab(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
) {

  _cimgui.igTabBarCloseTab(
    tabBar,
    tab,
  );

}

void tabBarQueueFocusTabItemPtr(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
) {

  _cimgui.igTabBarQueueFocus_TabItemPtr(
    tabBar,
    tab,
  );

}

void tabBarQueueFocusStr(
  ffi.Pointer<ImGuiTabBar> tabBar,
  String tabName,
) {
  final ffi.Pointer<ffi.Char> _tabName = tabName != null ? tabName.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTabBarQueueFocus_Str(
    tabBar,
    _tabName,
  );

}

void tabBarQueueReorder(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
  int offset,
) {

  _cimgui.igTabBarQueueReorder(
    tabBar,
    tab,
    offset,
  );

}

void tabBarQueueReorderFromMousePos(
  ffi.Pointer<ImGuiTabBar> tabBar,
  ffi.Pointer<ImGuiTabItem> tab,
  ImVec2 mousePos,
) {

  _cimgui.igTabBarQueueReorderFromMousePos(
    tabBar,
    tab,
    mousePos,
  );

}

bool tabBarProcessReorder(
  ffi.Pointer<ImGuiTabBar> tabBar,
) {
  bool ret;

  ret = _cimgui.igTabBarProcessReorder(
    tabBar,
  );

  return ret;
}

bool tabItemEx(
  ffi.Pointer<ImGuiTabBar> tabBar,
  String label,
  ffi.Pointer<ffi.Bool> pOpen,
  int flags,
  ffi.Pointer<ImGuiWindow> dockedWindow,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTabItemEx(
    tabBar,
    _label,
    pOpen,
    flags,
    dockedWindow,
  );

  return ret;
}

void tabItemCalcSizeStr(
  ffi.Pointer<ImVec2> pOut,
  String label,
  bool hasCloseButtonOrUnsavedMarker,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTabItemCalcSize_Str(
    pOut,
    _label,
    hasCloseButtonOrUnsavedMarker,
  );

}

void tabItemCalcSizeWindowPtr(
  ffi.Pointer<ImVec2> pOut,
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igTabItemCalcSize_WindowPtr(
    pOut,
    window,
  );

}

void tabItemBackground(
  ffi.Pointer<ImDrawList> drawList,
  ImRect bb,
  int flags,
  int col,
) {

  _cimgui.igTabItemBackground(
    drawList,
    bb,
    flags,
    col,
  );

}

void tabItemLabelAndCloseButton(
  ffi.Pointer<ImDrawList> drawList,
  ImRect bb,
  int flags,
  ImVec2 framePadding,
  String label,
  int tabId,
  int closeButtonId,
  bool isContentsVisible,
  ffi.Pointer<ffi.Bool> outJustClosed,
  ffi.Pointer<ffi.Bool> outTextClipped,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTabItemLabelAndCloseButton(
    drawList,
    bb,
    flags,
    framePadding,
    _label,
    tabId,
    closeButtonId,
    isContentsVisible,
    outJustClosed,
    outTextClipped,
  );

}

void renderText(
  ImVec2 pos,
  String text,
  String textEnd,
  bool hideTextAfterHash,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRenderText(
    pos,
    _text,
    _textEnd,
    hideTextAfterHash,
  );

}

void renderTextWrapped(
  ImVec2 pos,
  String text,
  String textEnd,
  double wrapWidth,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRenderTextWrapped(
    pos,
    _text,
    _textEnd,
    wrapWidth,
  );

}

void renderTextClipped(
  ImVec2 posMin,
  ImVec2 posMax,
  String text,
  String textEnd,
  ffi.Pointer<ImVec2> textSizeIfKnown,
  ImVec2 align,
  ffi.Pointer<ImRect> clipRect,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRenderTextClipped(
    posMin,
    posMax,
    _text,
    _textEnd,
    textSizeIfKnown,
    align,
    clipRect,
  );

}

void renderTextClippedEx(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 posMin,
  ImVec2 posMax,
  String text,
  String textEnd,
  ffi.Pointer<ImVec2> textSizeIfKnown,
  ImVec2 align,
  ffi.Pointer<ImRect> clipRect,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRenderTextClippedEx(
    drawList,
    posMin,
    posMax,
    _text,
    _textEnd,
    textSizeIfKnown,
    align,
    clipRect,
  );

}

void renderTextEllipsis(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 posMin,
  ImVec2 posMax,
  double clipMaxX,
  double ellipsisMaxX,
  String text,
  String textEnd,
  ffi.Pointer<ImVec2> textSizeIfKnown,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igRenderTextEllipsis(
    drawList,
    posMin,
    posMax,
    clipMaxX,
    ellipsisMaxX,
    _text,
    _textEnd,
    textSizeIfKnown,
  );

}

void renderFrame(
  ImVec2 pMin,
  ImVec2 pMax,
  int fillCol,
  bool borders,
  double rounding,
) {

  _cimgui.igRenderFrame(
    pMin,
    pMax,
    fillCol,
    borders,
    rounding,
  );

}

void renderFrameBorder(
  ImVec2 pMin,
  ImVec2 pMax,
  double rounding,
) {

  _cimgui.igRenderFrameBorder(
    pMin,
    pMax,
    rounding,
  );

}

void renderColorRectWithAlphaCheckerboard(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pMin,
  ImVec2 pMax,
  int fillCol,
  double gridStep,
  ImVec2 gridOff,
  double rounding,
  int flags,
) {

  _cimgui.igRenderColorRectWithAlphaCheckerboard(
    drawList,
    pMin,
    pMax,
    fillCol,
    gridStep,
    gridOff,
    rounding,
    flags,
  );

}

void renderNavCursor(
  ImRect bb,
  int id,
  int flags,
) {

  _cimgui.igRenderNavCursor(
    bb,
    id,
    flags,
  );

}

ffi.Pointer<ffi.Char> findRenderedTextEnd(
  String text,
  String textEnd,
) {
  ffi.Pointer<ffi.Char> ret;
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igFindRenderedTextEnd(
    _text,
    _textEnd,
  );

  return ret;
}

void renderMouseCursor(
  ImVec2 pos,
  double scale,
  int mouseCursor,
  int colFill,
  int colBorder,
  int colShadow,
) {

  _cimgui.igRenderMouseCursor(
    pos,
    scale,
    mouseCursor,
    colFill,
    colBorder,
    colShadow,
  );

}

void renderArrow(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pos,
  DartImU32 col,
  ImGuiDir dir,
  double scale,
) {

  _cimgui.igRenderArrow(
    drawList,
    pos,
    col,
    dir,
    scale,
  );

}

void renderBullet(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pos,
  int col,
) {

  _cimgui.igRenderBullet(
    drawList,
    pos,
    col,
  );

}

void renderCheckMark(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pos,
  int col,
  double sz,
) {

  _cimgui.igRenderCheckMark(
    drawList,
    pos,
    col,
    sz,
  );

}

void renderArrowPointingAt(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pos,
  ImVec2 halfSz,
  ImGuiDir direction,
  DartImU32 col,
) {

  _cimgui.igRenderArrowPointingAt(
    drawList,
    pos,
    halfSz,
    direction,
    col,
  );

}

void renderArrowDockMenu(
  ffi.Pointer<ImDrawList> drawList,
  ImVec2 pMin,
  double sz,
  int col,
) {

  _cimgui.igRenderArrowDockMenu(
    drawList,
    pMin,
    sz,
    col,
  );

}

void renderRectFilledRangeH(
  ffi.Pointer<ImDrawList> drawList,
  ImRect rect,
  int col,
  double xStartNorm,
  double xEndNorm,
  double rounding,
) {

  _cimgui.igRenderRectFilledRangeH(
    drawList,
    rect,
    col,
    xStartNorm,
    xEndNorm,
    rounding,
  );

}

void renderRectFilledWithHole(
  ffi.Pointer<ImDrawList> drawList,
  ImRect outer,
  ImRect inner,
  int col,
  double rounding,
) {

  _cimgui.igRenderRectFilledWithHole(
    drawList,
    outer,
    inner,
    col,
    rounding,
  );

}

int calcRoundingFlagsForRectInRect(
  ImRect rIn,
  ImRect rOuter,
  double threshold,
) {
  int ret;

  ret = _cimgui.igCalcRoundingFlagsForRectInRect(
    rIn,
    rOuter,
    threshold,
  );

  return ret;
}

void textEx(
  String text,
  String textEnd,
  int flags,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _textEnd = textEnd != null ? textEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igTextEx(
    _text,
    _textEnd,
    flags,
  );

}

bool buttonEx(
  String label,
  ImVec2 sizeArg,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igButtonEx(
    _label,
    sizeArg,
    flags,
  );

  return ret;
}

bool arrowButtonEx(
  String strId,
  ImGuiDir dir,
  ImVec2 sizeArg,
  DartImGuiButtonFlags flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _strId = strId != null ? strId.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igArrowButtonEx(
    _strId,
    dir,
    sizeArg,
    flags,
  );

  return ret;
}

bool imageButtonEx(
  int id,
  int userTextureId,
  ImVec2 imageSize,
  ImVec2 uv0,
  ImVec2 uv1,
  ImVec4 bgCol,
  ImVec4 tintCol,
  int flags,
) {
  bool ret;

  ret = _cimgui.igImageButtonEx(
    id,
    userTextureId,
    imageSize,
    uv0,
    uv1,
    bgCol,
    tintCol,
    flags,
  );

  return ret;
}

void separatorEx(
  int flags,
  double thickness,
) {

  _cimgui.igSeparatorEx(
    flags,
    thickness,
  );

}

void separatorTextEx(
  int id,
  String label,
  String labelEnd,
  double extraWidth,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _labelEnd = labelEnd != null ? labelEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igSeparatorTextEx(
    id,
    _label,
    _labelEnd,
    extraWidth,
  );

}

bool checkboxFlagsS64Ptr(
  String label,
  ffi.Pointer<ImS64> flags,
  int flagsValue,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCheckboxFlags_S64Ptr(
    _label,
    flags,
    flagsValue,
  );

  return ret;
}

bool checkboxFlagsU64Ptr(
  String label,
  ffi.Pointer<ImU64> flags,
  int flagsValue,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igCheckboxFlags_U64Ptr(
    _label,
    flags,
    flagsValue,
  );

  return ret;
}

bool closeButton(
  int id,
  ImVec2 pos,
) {
  bool ret;

  ret = _cimgui.igCloseButton(
    id,
    pos,
  );

  return ret;
}

bool collapseButton(
  int id,
  ImVec2 pos,
  ffi.Pointer<ImGuiDockNode> dockNode,
) {
  bool ret;

  ret = _cimgui.igCollapseButton(
    id,
    pos,
    dockNode,
  );

  return ret;
}

void scrollbar(
  ImGuiAxis axis,
) {

  _cimgui.igScrollbar(
    axis,
  );

}

bool scrollbarEx(
  ImRect bb,
  DartImGuiID id,
  ImGuiAxis axis,
  ffi.Pointer<ImS64> pScrollV,
  DartImS64 availV,
  DartImS64 contentsV,
  DartImDrawFlags drawRoundingFlags,
) {
  bool ret;

  ret = _cimgui.igScrollbarEx(
    bb,
    id,
    axis,
    pScrollV,
    availV,
    contentsV,
    drawRoundingFlags,
  );

  return ret;
}

void getWindowScrollbarRect(
  ffi.Pointer<ImRect> pOut,
  ffi.Pointer<ImGuiWindow> window,
  ImGuiAxis axis,
) {

  _cimgui.igGetWindowScrollbarRect(
    pOut,
    window,
    axis,
  );

}

DartImGuiID getWindowScrollbarID(
  ffi.Pointer<ImGuiWindow> window,
  ImGuiAxis axis,
) {
  DartImGuiID ret;

  ret = _cimgui.igGetWindowScrollbarID(
    window,
    axis,
  );

  return ret;
}

int getWindowResizeCornerID(
  ffi.Pointer<ImGuiWindow> window,
  int n,
) {
  int ret;

  ret = _cimgui.igGetWindowResizeCornerID(
    window,
    n,
  );

  return ret;
}

DartImGuiID getWindowResizeBorderID(
  ffi.Pointer<ImGuiWindow> window,
  ImGuiDir dir,
) {
  DartImGuiID ret;

  ret = _cimgui.igGetWindowResizeBorderID(
    window,
    dir,
  );

  return ret;
}

bool buttonBehavior(
  ImRect bb,
  int id,
  ffi.Pointer<ffi.Bool> outHovered,
  ffi.Pointer<ffi.Bool> outHeld,
  int flags,
) {
  bool ret;

  ret = _cimgui.igButtonBehavior(
    bb,
    id,
    outHovered,
    outHeld,
    flags,
  );

  return ret;
}

bool dragBehavior(
  int id,
  int dataType,
  ffi.Pointer<ffi.Void> pV,
  double vSpeed,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
  String format,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDragBehavior(
    id,
    dataType,
    pV,
    vSpeed,
    pMin,
    pMax,
    _format,
    flags,
  );

  return ret;
}

bool sliderBehavior(
  ImRect bb,
  int id,
  int dataType,
  ffi.Pointer<ffi.Void> pV,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
  String format,
  int flags,
  ffi.Pointer<ImRect> outGrabBb,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igSliderBehavior(
    bb,
    id,
    dataType,
    pV,
    pMin,
    pMax,
    _format,
    flags,
    outGrabBb,
  );

  return ret;
}

bool splitterBehavior(
  ImRect bb,
  DartImGuiID id,
  ImGuiAxis axis,
  ffi.Pointer<ffi.Float> size1,
  ffi.Pointer<ffi.Float> size2,
  double minSize1,
  double minSize2,
  double hoverExtend,
  double hoverVisibilityDelay,
  DartImU32 bgCol,
) {
  bool ret;

  ret = _cimgui.igSplitterBehavior(
    bb,
    id,
    axis,
    size1,
    size2,
    minSize1,
    minSize2,
    hoverExtend,
    hoverVisibilityDelay,
    bgCol,
  );

  return ret;
}

bool treeNodeBehavior(
  int id,
  int flags,
  String label,
  String labelEnd,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _labelEnd = labelEnd != null ? labelEnd.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTreeNodeBehavior(
    id,
    flags,
    _label,
    _labelEnd,
  );

  return ret;
}

void treePushOverrideID(
  int id,
) {

  _cimgui.igTreePushOverrideID(
    id,
  );

}

bool treeNodeGetOpen(
  int storageId,
) {
  bool ret;

  ret = _cimgui.igTreeNodeGetOpen(
    storageId,
  );

  return ret;
}

void treeNodeSetOpen(
  int storageId,
  bool open,
) {

  _cimgui.igTreeNodeSetOpen(
    storageId,
    open,
  );

}

bool treeNodeUpdateNextOpen(
  int storageId,
  int flags,
) {
  bool ret;

  ret = _cimgui.igTreeNodeUpdateNextOpen(
    storageId,
    flags,
  );

  return ret;
}

ffi.Pointer<ImGuiDataTypeInfo> dataTypeGetInfo(
  int dataType,
) {
  ffi.Pointer<ImGuiDataTypeInfo> ret;

  ret = _cimgui.igDataTypeGetInfo(
    dataType,
  );

  return ret;
}

int dataTypeFormatString(
  String buf,
  int bufSize,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  String format,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDataTypeFormatString(
    _buf,
    bufSize,
    dataType,
    pData,
    _format,
  );

  return ret;
}

void dataTypeApplyOp(
  int dataType,
  int op,
  ffi.Pointer<ffi.Void> output,
  ffi.Pointer<ffi.Void> arg1,
  ffi.Pointer<ffi.Void> arg2,
) {

  _cimgui.igDataTypeApplyOp(
    dataType,
    op,
    output,
    arg1,
    arg2,
  );

}

bool dataTypeApplyFromText(
  String buf,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  String format,
  ffi.Pointer<ffi.Void> pDataWhenEmpty,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDataTypeApplyFromText(
    _buf,
    dataType,
    pData,
    _format,
    pDataWhenEmpty,
  );

  return ret;
}

int dataTypeCompare(
  int dataType,
  ffi.Pointer<ffi.Void> arg1,
  ffi.Pointer<ffi.Void> arg2,
) {
  int ret;

  ret = _cimgui.igDataTypeCompare(
    dataType,
    arg1,
    arg2,
  );

  return ret;
}

bool dataTypeClamp(
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  ffi.Pointer<ffi.Void> pMin,
  ffi.Pointer<ffi.Void> pMax,
) {
  bool ret;

  ret = _cimgui.igDataTypeClamp(
    dataType,
    pData,
    pMin,
    pMax,
  );

  return ret;
}

bool dataTypeIsZero(
  int dataType,
  ffi.Pointer<ffi.Void> pData,
) {
  bool ret;

  ret = _cimgui.igDataTypeIsZero(
    dataType,
    pData,
  );

  return ret;
}

bool inputTextEx(
  String label,
  String hint,
  String buf,
  int bufSize,
  ImVec2 sizeArg,
  int flags,
  ImGuiInputTextCallback callback,
  ffi.Pointer<ffi.Void> userData,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _hint = hint != null ? hint.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igInputTextEx(
    _label,
    _hint,
    _buf,
    bufSize,
    sizeArg,
    flags,
    callback,
    userData,
  );

  return ret;
}

void inputTextDeactivateHook(
  int id,
) {

  _cimgui.igInputTextDeactivateHook(
    id,
  );

}

bool tempInputText(
  ImRect bb,
  int id,
  String label,
  String buf,
  int bufSize,
  int flags,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _buf = buf != null ? buf.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTempInputText(
    bb,
    id,
    _label,
    _buf,
    bufSize,
    flags,
  );

  return ret;
}

bool tempInputScalar(
  ImRect bb,
  int id,
  String label,
  int dataType,
  ffi.Pointer<ffi.Void> pData,
  String format,
  ffi.Pointer<ffi.Void> pClampMin,
  ffi.Pointer<ffi.Void> pClampMax,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _format = format != null ? format.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igTempInputScalar(
    bb,
    id,
    _label,
    dataType,
    pData,
    _format,
    pClampMin,
    pClampMax,
  );

  return ret;
}

bool tempInputIsActive(
  int id,
) {
  bool ret;

  ret = _cimgui.igTempInputIsActive(
    id,
  );

  return ret;
}

ffi.Pointer<ImGuiInputTextState> getInputTextState(
  int id,
) {
  ffi.Pointer<ImGuiInputTextState> ret;

  ret = _cimgui.igGetInputTextState(
    id,
  );

  return ret;
}

void setNextItemRefVal(
  int dataType,
  ffi.Pointer<ffi.Void> pData,
) {

  _cimgui.igSetNextItemRefVal(
    dataType,
    pData,
  );

}

void colorTooltip(
  String text,
  ffi.Pointer<ffi.Float> col,
  int flags,
) {
  final ffi.Pointer<ffi.Char> _text = text != null ? text.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igColorTooltip(
    _text,
    col,
    flags,
  );

}

void colorEditOptionsPopup(
  ffi.Pointer<ffi.Float> col,
  int flags,
) {

  _cimgui.igColorEditOptionsPopup(
    col,
    flags,
  );

}

void colorPickerOptionsPopup(
  ffi.Pointer<ffi.Float> refCol,
  int flags,
) {

  _cimgui.igColorPickerOptionsPopup(
    refCol,
    flags,
  );

}

int plotEx(
  ImGuiPlotType plotType,
  String label,
  ffi.Pointer<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<ffi.Void> data, ffi.Int idx)>> valuesGetter,
  ffi.Pointer<ffi.Void> data,
  int valuesCount,
  int valuesOffset,
  String overlayText,
  double scaleMin,
  double scaleMax,
  ImVec2 sizeArg,
) {
  int ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _overlayText = overlayText != null ? overlayText.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igPlotEx(
    plotType,
    _label,
    valuesGetter,
    data,
    valuesCount,
    valuesOffset,
    _overlayText,
    scaleMin,
    scaleMax,
    sizeArg,
  );

  return ret;
}

void shadeVertsLinearColorGradientKeepAlpha(
  ffi.Pointer<ImDrawList> drawList,
  int vertStartIdx,
  int vertEndIdx,
  ImVec2 gradientP0,
  ImVec2 gradientP1,
  int col0,
  int col1,
) {

  _cimgui.igShadeVertsLinearColorGradientKeepAlpha(
    drawList,
    vertStartIdx,
    vertEndIdx,
    gradientP0,
    gradientP1,
    col0,
    col1,
  );

}

void shadeVertsLinearUV(
  ffi.Pointer<ImDrawList> drawList,
  int vertStartIdx,
  int vertEndIdx,
  ImVec2 a,
  ImVec2 b,
  ImVec2 uvA,
  ImVec2 uvB,
  bool clamp,
) {

  _cimgui.igShadeVertsLinearUV(
    drawList,
    vertStartIdx,
    vertEndIdx,
    a,
    b,
    uvA,
    uvB,
    clamp,
  );

}

void shadeVertsTransformPos(
  ffi.Pointer<ImDrawList> drawList,
  int vertStartIdx,
  int vertEndIdx,
  ImVec2 pivotIn,
  double cosA,
  double sinA,
  ImVec2 pivotOut,
) {

  _cimgui.igShadeVertsTransformPos(
    drawList,
    vertStartIdx,
    vertEndIdx,
    pivotIn,
    cosA,
    sinA,
    pivotOut,
  );

}

void gcCompactTransientMiscBuffers(
) {

  _cimgui.igGcCompactTransientMiscBuffers(
  );

}

void gcCompactTransientWindowBuffers(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igGcCompactTransientWindowBuffers(
    window,
  );

}

void gcAwakeTransientWindowBuffers(
  ffi.Pointer<ImGuiWindow> window,
) {

  _cimgui.igGcAwakeTransientWindowBuffers(
    window,
  );

}

bool errorLog(
  String msg,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _msg = msg != null ? msg.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igErrorLog(
    _msg,
  );

  return ret;
}

void errorRecoveryStoreState(
  ffi.Pointer<ImGuiErrorRecoveryState> stateOut,
) {

  _cimgui.igErrorRecoveryStoreState(
    stateOut,
  );

}

void errorRecoveryTryToRecoverState(
  ffi.Pointer<ImGuiErrorRecoveryState> stateIn,
) {

  _cimgui.igErrorRecoveryTryToRecoverState(
    stateIn,
  );

}

void errorRecoveryTryToRecoverWindowState(
  ffi.Pointer<ImGuiErrorRecoveryState> stateIn,
) {

  _cimgui.igErrorRecoveryTryToRecoverWindowState(
    stateIn,
  );

}

void errorCheckUsingSetCursorPosToExtendParentBoundaries(
) {

  _cimgui.igErrorCheckUsingSetCursorPosToExtendParentBoundaries(
  );

}

void errorCheckEndFrameFinalizeErrorTooltip(
) {

  _cimgui.igErrorCheckEndFrameFinalizeErrorTooltip(
  );

}

bool beginErrorTooltip(
) {
  bool ret;

  ret = _cimgui.igBeginErrorTooltip(
  );

  return ret;
}

void endErrorTooltip(
) {

  _cimgui.igEndErrorTooltip(
  );

}

void debugAllocHook(
  ffi.Pointer<ImGuiDebugAllocInfo> info,
  int frameCount,
  ffi.Pointer<ffi.Void> ptr,
  int size,
) {

  _cimgui.igDebugAllocHook(
    info,
    frameCount,
    ptr,
    size,
  );

}

void debugDrawCursorPos(
  int col,
) {

  _cimgui.igDebugDrawCursorPos(
    col,
  );

}

void debugDrawLineExtents(
  int col,
) {

  _cimgui.igDebugDrawLineExtents(
    col,
  );

}

void debugDrawItemRect(
  int col,
) {

  _cimgui.igDebugDrawItemRect(
    col,
  );

}

void debugTextUnformattedWithLocateItem(
  String lineBegin,
  String lineEnd,
) {
  final ffi.Pointer<ffi.Char> _lineBegin = lineBegin != null ? lineBegin.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _lineEnd = lineEnd != null ? lineEnd.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugTextUnformattedWithLocateItem(
    _lineBegin,
    _lineEnd,
  );

}

void debugLocateItem(
  int targetId,
) {

  _cimgui.igDebugLocateItem(
    targetId,
  );

}

void debugLocateItemOnHover(
  int targetId,
) {

  _cimgui.igDebugLocateItemOnHover(
    targetId,
  );

}

void debugLocateItemResolveWithLastItem(
) {

  _cimgui.igDebugLocateItemResolveWithLastItem(
  );

}

void debugBreakClearData(
) {

  _cimgui.igDebugBreakClearData(
  );

}

bool debugBreakButton(
  String label,
  String descriptionOfLocation,
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;
  final ffi.Pointer<ffi.Char> _descriptionOfLocation = descriptionOfLocation != null ? descriptionOfLocation.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.igDebugBreakButton(
    _label,
    _descriptionOfLocation,
  );

  return ret;
}

void debugBreakButtonTooltip(
  bool keyboardOnly,
  String descriptionOfLocation,
) {
  final ffi.Pointer<ffi.Char> _descriptionOfLocation = descriptionOfLocation != null ? descriptionOfLocation.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugBreakButtonTooltip(
    keyboardOnly,
    _descriptionOfLocation,
  );

}

void showFontAtlas(
  ffi.Pointer<ImFontAtlas> atlas,
) {

  _cimgui.igShowFontAtlas(
    atlas,
  );

}

void debugHookIdInfo(
  int id,
  int dataType,
  ffi.Pointer<ffi.Void> dataId,
  ffi.Pointer<ffi.Void> dataIdEnd,
) {

  _cimgui.igDebugHookIdInfo(
    id,
    dataType,
    dataId,
    dataIdEnd,
  );

}

void debugNodeColumns(
  ffi.Pointer<ImGuiOldColumns> columns,
) {

  _cimgui.igDebugNodeColumns(
    columns,
  );

}

void debugNodeDockNode(
  ffi.Pointer<ImGuiDockNode> node,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeDockNode(
    node,
    _label,
  );

}

void debugNodeDrawList(
  ffi.Pointer<ImGuiWindow> window,
  ffi.Pointer<ImGuiViewportP> viewport,
  ffi.Pointer<ImDrawList> drawList,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeDrawList(
    window,
    viewport,
    drawList,
    _label,
  );

}

void debugNodeDrawCmdShowMeshAndBoundingBox(
  ffi.Pointer<ImDrawList> outDrawList,
  ffi.Pointer<ImDrawList> drawList,
  ffi.Pointer<ImDrawCmd> drawCmd,
  bool showMesh,
  bool showAabb,
) {

  _cimgui.igDebugNodeDrawCmdShowMeshAndBoundingBox(
    outDrawList,
    drawList,
    drawCmd,
    showMesh,
    showAabb,
  );

}

void debugNodeFont(
  ffi.Pointer<ImFont> font,
) {

  _cimgui.igDebugNodeFont(
    font,
  );

}

void debugNodeFontGlyph(
  ffi.Pointer<ImFont> font,
  ffi.Pointer<ImFontGlyph> glyph,
) {

  _cimgui.igDebugNodeFontGlyph(
    font,
    glyph,
  );

}

void debugNodeStorage(
  ffi.Pointer<ImGuiStorage> storage,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeStorage(
    storage,
    _label,
  );

}

void debugNodeTabBar(
  ffi.Pointer<ImGuiTabBar> tabBar,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeTabBar(
    tabBar,
    _label,
  );

}

void debugNodeTable(
  ffi.Pointer<ImGuiTable> table,
) {

  _cimgui.igDebugNodeTable(
    table,
  );

}

void debugNodeTableSettings(
  ffi.Pointer<ImGuiTableSettings> settings,
) {

  _cimgui.igDebugNodeTableSettings(
    settings,
  );

}

void debugNodeInputTextState(
  ffi.Pointer<ImGuiInputTextState> state,
) {

  _cimgui.igDebugNodeInputTextState(
    state,
  );

}

void debugNodeTypingSelectState(
  ffi.Pointer<ImGuiTypingSelectState> state,
) {

  _cimgui.igDebugNodeTypingSelectState(
    state,
  );

}

void debugNodeMultiSelectState(
  ffi.Pointer<ImGuiMultiSelectState> state,
) {

  _cimgui.igDebugNodeMultiSelectState(
    state,
  );

}

void debugNodeWindow(
  ffi.Pointer<ImGuiWindow> window,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeWindow(
    window,
    _label,
  );

}

void debugNodeWindowSettings(
  ffi.Pointer<ImGuiWindowSettings> settings,
) {

  _cimgui.igDebugNodeWindowSettings(
    settings,
  );

}

void debugNodeWindowsList(
  ffi.Pointer<ImVector_ImGuiWindowPtr> windows,
  String label,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodeWindowsList(
    windows,
    _label,
  );

}

void debugNodeWindowsListByBeginStackParent(
  ffi.Pointer<ffi.Pointer<ImGuiWindow>> windows,
  int windowsSize,
  ffi.Pointer<ImGuiWindow> parentInBeginStack,
) {

  _cimgui.igDebugNodeWindowsListByBeginStackParent(
    windows,
    windowsSize,
    parentInBeginStack,
  );

}

void debugNodeViewport(
  ffi.Pointer<ImGuiViewportP> viewport,
) {

  _cimgui.igDebugNodeViewport(
    viewport,
  );

}

void debugNodePlatformMonitor(
  ffi.Pointer<ImGuiPlatformMonitor> monitor,
  String label,
  int idx,
) {
  final ffi.Pointer<ffi.Char> _label = label != null ? label.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igDebugNodePlatformMonitor(
    monitor,
    _label,
    idx,
  );

}

void debugRenderKeyboardPreview(
  ffi.Pointer<ImDrawList> drawList,
) {

  _cimgui.igDebugRenderKeyboardPreview(
    drawList,
  );

}

void debugRenderViewportThumbnail(
  ffi.Pointer<ImDrawList> drawList,
  ffi.Pointer<ImGuiViewportP> viewport,
  ImRect bb,
) {

  _cimgui.igDebugRenderViewportThumbnail(
    drawList,
    viewport,
    bb,
  );

}

ffi.Pointer<ImFontBuilderIO> imFontAtlasGetBuilderForStbTruetype(
) {
  ffi.Pointer<ImFontBuilderIO> ret;

  ret = _cimgui.igImFontAtlasGetBuilderForStbTruetype(
  );

  return ret;
}

void imFontAtlasUpdateConfigDataPointers(
  ffi.Pointer<ImFontAtlas> atlas,
) {

  _cimgui.igImFontAtlasUpdateConfigDataPointers(
    atlas,
  );

}

void imFontAtlasBuildInit(
  ffi.Pointer<ImFontAtlas> atlas,
) {

  _cimgui.igImFontAtlasBuildInit(
    atlas,
  );

}

void imFontAtlasBuildSetupFont(
  ffi.Pointer<ImFontAtlas> atlas,
  ffi.Pointer<ImFont> font,
  ffi.Pointer<ImFontConfig> fontConfig,
  double ascent,
  double descent,
) {

  _cimgui.igImFontAtlasBuildSetupFont(
    atlas,
    font,
    fontConfig,
    ascent,
    descent,
  );

}

void imFontAtlasBuildPackCustomRects(
  ffi.Pointer<ImFontAtlas> atlas,
  ffi.Pointer<ffi.Void> stbrpContextOpaque,
) {

  _cimgui.igImFontAtlasBuildPackCustomRects(
    atlas,
    stbrpContextOpaque,
  );

}

void imFontAtlasBuildFinish(
  ffi.Pointer<ImFontAtlas> atlas,
) {

  _cimgui.igImFontAtlasBuildFinish(
    atlas,
  );

}

void imFontAtlasBuildRender8bppRectFromString(
  ffi.Pointer<ImFontAtlas> atlas,
  int x,
  int y,
  int w,
  int h,
  String inStr,
  int inMarkerChar,
  int inMarkerPixelValue,
) {
  final ffi.Pointer<ffi.Char> _inStr = inStr != null ? inStr.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImFontAtlasBuildRender8bppRectFromString(
    atlas,
    x,
    y,
    w,
    h,
    _inStr,
    inMarkerChar,
    inMarkerPixelValue,
  );

}

void imFontAtlasBuildRender32bppRectFromString(
  ffi.Pointer<ImFontAtlas> atlas,
  int x,
  int y,
  int w,
  int h,
  String inStr,
  int inMarkerChar,
  int inMarkerPixelValue,
) {
  final ffi.Pointer<ffi.Char> _inStr = inStr != null ? inStr.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igImFontAtlasBuildRender32bppRectFromString(
    atlas,
    x,
    y,
    w,
    h,
    _inStr,
    inMarkerChar,
    inMarkerPixelValue,
  );

}

void imFontAtlasBuildMultiplyCalcLookupTable(
  ffi.Pointer<ffi.UnsignedChar> outTable,
  double inMultiplyFactor,
) {

  _cimgui.igImFontAtlasBuildMultiplyCalcLookupTable(
    outTable,
    inMultiplyFactor,
  );

}

void imFontAtlasBuildMultiplyRectAlpha8(
  ffi.Pointer<ffi.UnsignedChar> table,
  ffi.Pointer<ffi.UnsignedChar> pixels,
  int x,
  int y,
  int w,
  int h,
  int stride,
) {

  _cimgui.igImFontAtlasBuildMultiplyRectAlpha8(
    table,
    pixels,
    x,
    y,
    w,
    h,
    stride,
  );

}

void logText(
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.igLogText(
    _fmt,
  );

}

void imGuiTextBufferAppendf(
  ffi.Pointer<ImGuiTextBuffer> self,
  String fmt,
) {
  final ffi.Pointer<ffi.Char> _fmt = fmt != null ? fmt.toNativeUtf8().cast() : ffi.nullptr;

  _cimgui.ImGuiTextBuffer_appendf(
    self,
    _fmt,
  );

}

double gETFLTMAX(
) {
  double ret;

  ret = _cimgui.igGET_FLT_MAX(
  );

  return ret;
}

double gETFLTMIN(
) {
  double ret;

  ret = _cimgui.igGET_FLT_MIN(
  );

  return ret;
}

ffi.Pointer<ImVector_ImWchar> imVectorImWcharCreate(
) {
  ffi.Pointer<ImVector_ImWchar> ret;

  ret = _cimgui.ImVector_ImWchar_create(
  );

  return ret;
}

void imVectorImWcharDestroy(
  ffi.Pointer<ImVector_ImWchar> self,
) {

  _cimgui.ImVector_ImWchar_destroy(
    self,
  );

}

void imVectorImWcharInit(
  ffi.Pointer<ImVector_ImWchar> p,
) {

  _cimgui.ImVector_ImWchar_Init(
    p,
  );

}

void imVectorImWcharUnInit(
  ffi.Pointer<ImVector_ImWchar> p,
) {

  _cimgui.ImVector_ImWchar_UnInit(
    p,
  );

}

void imGuiPlatformIOSetPlatformGetWindowPos(
  ffi.Pointer<ImGuiPlatformIO> platformIo,
  ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ImGuiViewport> vp, ffi.Pointer<ImVec2> out_pos)>> userCallback,
) {

  _cimgui.ImGuiPlatformIO_Set_Platform_GetWindowPos(
    platformIo,
    userCallback,
  );

}

void imGuiPlatformIOSetPlatformGetWindowSize(
  ffi.Pointer<ImGuiPlatformIO> platformIo,
  ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ImGuiViewport> vp, ffi.Pointer<ImVec2> out_size)>> userCallback,
) {

  _cimgui.ImGuiPlatformIO_Set_Platform_GetWindowSize(
    platformIo,
    userCallback,
  );

}

bool imGuiImplGlfwInitForOpenGL(
  ffi.Pointer<GLFWwindow> window,
  bool installCallbacks,
) {
  bool ret;

  ret = _cimgui.ImGui_ImplGlfw_InitForOpenGL(
    window,
    installCallbacks,
  );

  return ret;
}

bool imGuiImplGlfwInitForVulkan(
  ffi.Pointer<GLFWwindow> window,
  bool installCallbacks,
) {
  bool ret;

  ret = _cimgui.ImGui_ImplGlfw_InitForVulkan(
    window,
    installCallbacks,
  );

  return ret;
}

bool imGuiImplGlfwInitForOther(
  ffi.Pointer<GLFWwindow> window,
  bool installCallbacks,
) {
  bool ret;

  ret = _cimgui.ImGui_ImplGlfw_InitForOther(
    window,
    installCallbacks,
  );

  return ret;
}

void imGuiImplGlfwShutdown(
) {

  _cimgui.ImGui_ImplGlfw_Shutdown(
  );

}

void imGuiImplGlfwNewFrame(
) {

  _cimgui.ImGui_ImplGlfw_NewFrame(
  );

}

void imGuiImplGlfwInstallCallbacks(
  ffi.Pointer<GLFWwindow> window,
) {

  _cimgui.ImGui_ImplGlfw_InstallCallbacks(
    window,
  );

}

void imGuiImplGlfwRestoreCallbacks(
  ffi.Pointer<GLFWwindow> window,
) {

  _cimgui.ImGui_ImplGlfw_RestoreCallbacks(
    window,
  );

}

void imGuiImplGlfwSetCallbacksChainForAllWindows(
  bool chainForAllWindows,
) {

  _cimgui.ImGui_ImplGlfw_SetCallbacksChainForAllWindows(
    chainForAllWindows,
  );

}

void imGuiImplGlfwWindowFocusCallback(
  ffi.Pointer<GLFWwindow> window,
  int focused,
) {

  _cimgui.ImGui_ImplGlfw_WindowFocusCallback(
    window,
    focused,
  );

}

void imGuiImplGlfwCursorEnterCallback(
  ffi.Pointer<GLFWwindow> window,
  int entered,
) {

  _cimgui.ImGui_ImplGlfw_CursorEnterCallback(
    window,
    entered,
  );

}

void imGuiImplGlfwCursorPosCallback(
  ffi.Pointer<GLFWwindow> window,
  double x,
  double y,
) {

  _cimgui.ImGui_ImplGlfw_CursorPosCallback(
    window,
    x,
    y,
  );

}

void imGuiImplGlfwMouseButtonCallback(
  ffi.Pointer<GLFWwindow> window,
  int button,
  int action,
  int mods,
) {

  _cimgui.ImGui_ImplGlfw_MouseButtonCallback(
    window,
    button,
    action,
    mods,
  );

}

void imGuiImplGlfwScrollCallback(
  ffi.Pointer<GLFWwindow> window,
  double xoffset,
  double yoffset,
) {

  _cimgui.ImGui_ImplGlfw_ScrollCallback(
    window,
    xoffset,
    yoffset,
  );

}

void imGuiImplGlfwKeyCallback(
  ffi.Pointer<GLFWwindow> window,
  int key,
  int scancode,
  int action,
  int mods,
) {

  _cimgui.ImGui_ImplGlfw_KeyCallback(
    window,
    key,
    scancode,
    action,
    mods,
  );

}

void imGuiImplGlfwCharCallback(
  ffi.Pointer<GLFWwindow> window,
  int c,
) {

  _cimgui.ImGui_ImplGlfw_CharCallback(
    window,
    c,
  );

}

void imGuiImplGlfwMonitorCallback(
  ffi.Pointer<GLFWmonitor> monitor,
  int event,
) {

  _cimgui.ImGui_ImplGlfw_MonitorCallback(
    monitor,
    event,
  );

}

void imGuiImplGlfwSleep(
  int milliseconds,
) {

  _cimgui.ImGui_ImplGlfw_Sleep(
    milliseconds,
  );

}

bool imGuiImplOpenGL3Init(
  [String? glslVersion,]
) {
  bool ret;
  final ffi.Pointer<ffi.Char> _glslVersion = glslVersion != null ? glslVersion.toNativeUtf8().cast() : ffi.nullptr;

  ret = _cimgui.ImGui_ImplOpenGL3_Init(
    _glslVersion,
  );

  return ret;
}

void imGuiImplOpenGL3Shutdown(
) {

  _cimgui.ImGui_ImplOpenGL3_Shutdown(
  );

}

void imGuiImplOpenGL3NewFrame(
) {

  _cimgui.ImGui_ImplOpenGL3_NewFrame(
  );

}

void imGuiImplOpenGL3RenderDrawData(
  ffi.Pointer<ImDrawData> drawData,
) {

  _cimgui.ImGui_ImplOpenGL3_RenderDrawData(
    drawData,
  );

}

bool imGuiImplOpenGL3CreateFontsTexture(
) {
  bool ret;

  ret = _cimgui.ImGui_ImplOpenGL3_CreateFontsTexture(
  );

  return ret;
}

void imGuiImplOpenGL3DestroyFontsTexture(
) {

  _cimgui.ImGui_ImplOpenGL3_DestroyFontsTexture(
  );

}

bool imGuiImplOpenGL3CreateDeviceObjects(
) {
  bool ret;

  ret = _cimgui.ImGui_ImplOpenGL3_CreateDeviceObjects(
  );

  return ret;
}

void imGuiImplOpenGL3DestroyDeviceObjects(
) {

  _cimgui.ImGui_ImplOpenGL3_DestroyDeviceObjects(
  );

}

