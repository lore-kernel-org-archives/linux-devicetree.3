Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD53C9EDD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828901; cv=none; b=XJofZivzP3y0o45lneE0UlLxTL2xN0PjRLunWuXYWkfuKmPprPR758kBfmvklb+TA5XS2FwZbxKy2NhxqBkKk1YFAznrwkupNUIRWU00v46+3F916k1FIzj27ouBJBu2geOgzYWYmSAixaO8UBovBy9JQBdlPtefcXVoX0vYjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828901; c=relaxed/simple;
	bh=KazPXkOf+br4bp1cxqinwcaXXuaNW8H+zds6OLhGIFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oabxGnjqbhO4Rvsz5Vc5CP69TMLXLMSbdYxdemHwwC4iBcgtfdqPpm11TaYRaKJTpZD3Rl48D9JiGBv1GPB+Fz4WoZfjbpyC6p9IsZOPc4mExRCwcgnfxnkqlz4q8E65r3qD59sW/vAklNz8EN6F99+AonQ8VdhfB83K4xeXpO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IGEX/we1; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IGEX/we1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785828897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DWMTuq9NkCnrgokFcLH3C7+v8FiIoP6xFMC71YOuo3Y=;
	b=IGEX/we1QDJAsgCIQRHFTugI6JeEnyAKDp6+LNwa6ghbmAFdvduUPZL3I/3lhcGFlwJufh
	5CD8OSL2wmoekN11h15y1hViiMEuh/vieEU87mSvn1zzC2MzII3lVtLCvpcT+fjND/AvOI
	u/ryaZ/YyiBWo35SAqtXEqjTfsvisQQ=
From: Junjie Cao <junjie.cao@linux.dev>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/panel: Add support for Novatek NT36532 panel
Date: Tue,  4 Aug 2026 00:34:17 -0700
Message-ID: <20260804073419.84727-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series adds support for panels using the Novatek NT36532 Display
Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
for MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT.

The first user is the CSOT PPC100HB1-1 panel found in the OnePlus Pad 2
(OnePlus Pad Pro in China) tablet: 3000x2120, dual-DSI in bonded mode,
DSC 1.2 with two slices per line.

v2 has been tested on the OnePlus Pad 2: the panel comes up in its
native 3000x2120 mode at 120Hz over dual-DSI in bonded mode with DSC,
and displays a stable image. The only wire-level change in v3 is the
page 0x23 0x51 write going from two bytes to one, matching the stock
firmware DT.

Changes in v3:
- Kconfig: select DRM_DISPLAY_DSC_HELPER, DRM_DISPLAY_HELPER and
  DRM_KMS_HELPER, depend on BACKLIGHT_CLASS_DEVICE.
- Write the page 0x23 dimming table entry 0x51 as a plain one-byte
  write instead of the two-byte DCS brightness helper.
- Spell the page 0x10 brightness write as MIPI_DCS_SET_DISPLAY_BRIGHTNESS
  with an explicit 07 ff payload instead of the byte-swapped 0xff07.
- Drop accidental MIPI_DCS_* macro names from vendor-page register
  writes.
- Make the DSC config const and copy it into the panel instance at
  probe time.
- Support an external backlight via drm_panel_of_backlight().
- Report the panel physical size via the display mode.
- Link to v2: https://lore.kernel.org/all/20260729160804.912826-1-junjie.cao@linux.dev
- Link to v1: https://lore.kernel.org/all/20251001135914.13754-1-caojunjie650@gmail.com

Junjie Cao (2):
  dt-bindings: display: panel: Add Novatek NT36532
  drm/panel: Add Novatek NT36532 panel driver

 .../display/panel/novatek,nt36532.yaml        |  83 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 431 ++++++++++++++++++
 5 files changed, 536 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c


base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
-- 
2.43.0

