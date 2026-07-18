Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5BE221FCD
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373468; cv=none; b=HQmg5bnXgDpMOstoJqyTg/4vhKUMIkgrtqgWvPWoRkxzm+kooMEoDacSUH2EggP116F9zoFRybIBT0iZSVbW7TM/z+xd4a3akQrpAv9RLHTYEcycsFBHCaIcjBiLQXhlidmpxqd8U3dMWMHLg9ZOoS0NyVb2DvImfYzbRSNvURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373468; c=relaxed/simple;
	bh=7IOApvRSiN/6o6v2ekhTYWHcYhoZQB9D7rD7ca5bQQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8Elq9bvIm2+ueqWQPzTsAB6BbFGpiC4epjetSk4D6yfgZfOqrIEoruCQA9s4JSebubOgGiE7AQlUopHdVn6Hwuu24UsE7o9NDU/gKIY2BQAqWhoAZKsemas7/MmvgmogVUMmfwkLrRWXeY68A072lhNX9EKfAovtFfgsH6PRe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mieulab.com; spf=pass smtp.mailfrom=mieulab.com; dkim=pass (2048-bit key) header.d=mieulab.com header.i=@mieulab.com header.b=bBR39izv; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mieulab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mieulab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mieulab.com header.i=@mieulab.com header.b="bBR39izv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mieulab.com; s=key1;
	t=1784373463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nrmn9JnAUSFb3FQ2ARJKUpkkcIgVFhmL+iD3YNZEr6g=;
	b=bBR39izvKO+1yCIHI/DvLs3Nh+aEIWvJlMDVAER4IbmPudR0PefsHliyiPErIo+a9zrPk3
	taHU+rmseiz2i8FSXpcBfqRgnJVPf+T7CJevJHjaiFUqakU/AXQw/DZiC9xWBWxUhW2ZLl
	AklqRQiONX++pp+v4au/OY9Plqqngy7tCliJUBjreTUfFV580ZppJGEJ/f4qvZr4c3+x20
	G/vNVT4THw8+c41G7w3wGC67rBwI29J1wYICaNSAcBPfmrLK/OZ8lVaFRP6n25+j0PkS5n
	exQmVqVoyZzCub3qCzGaJnB3MJSkM5YTuxwthQ5hB/91baUL/NGB9c16d7zfYw==
From: Zinan Zhou <zinan@mieulab.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Zinan Zhou <zinan@mieulab.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] drm/meson: add HDMI support for GXLX2
Date: Sat, 18 Jul 2026 20:15:25 +0900
Message-ID: <20260718111527.119231-1-zinan@mieulab.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This RFC adds HDMI transmitter support for the Amlogic GXLX2 family,
observed as an S905L3 (CPU major ID 0x2a) in a FiberHome HG680-LC set-top
box.

GXLX2 is unusual in that the display pipeline, clocks and HDMI PHY follow
the older GXL path, while the HDMI controller register interface is
directly mapped: DWC registers are byte-addressed from 0xda800000 and TOP
registers are 32-bit registers at 0xda808000 + index * 4. The existing
G12A access callbacks implement this layout, but using all G12A match data
would select the wrong PHY initialization for GXLX2.

Patch 1 proposes a dedicated amlogic,meson-gxlx2-dw-hdmi compatible
without a meson-gx-dw-hdmi fallback. Patch 2 adds dedicated match data
combining direct register callbacks with GXL PHY behavior. It also handles
the GXLX2 value for the 297 MHz PHY bucket and adds the compatible to the
Meson DRM component match list.

This RFC depends on the separately posted common Meson DW-HDMI regmap fix:

  drm/meson: constrain the DW-HDMI regmap range
  https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/

That formal bug-fix patch bounds register iteration below the directly
mapped TOP block and prevents the legacy 16-bit indirect interface from
wrapping. It is intentionally not part of this RFC so it can be reviewed
and merged without waiting for agreement on the GXLX2 DT ABI.

I would particularly appreciate feedback on two DT ABI questions:

1. Is amlogic,meson-gxlx2-dw-hdmi the appropriate block compatible name?
2. Should the DWC and TOP windows be represented as one contiguous MMIO
   resource, as in this RFC, or as two named resources?

Evidence and disclosure:

- The GXLX2 addresses and 297 MHz value are factual results of analysis of
  the HG680-LC vendor kernel. Firmware SHA-256 and focused behavioral
  evidence can be supplied if useful, but no firmware, kallsyms dump or
  disassembly is part of this submission.
- Public Amlogic-derived GPL source documents the ordinary GXL 2.97 Gbps
  values and public GPL-2.0+/MIT source documents the same direct DWC/TOP
  access mechanism used on later SoCs. The implementation here does not
  copy a vendor function body.

Testing:

- An equivalent Linux 6.6.18 implementation boots from eMMC on the
  HG680-LC.
- 1920x1080 HDMI video was physically verified on an LG 27GL850.
- Two-channel HDMI LPCM through the display and analog stereo audio were
  physically verified.
- The downstream 6.12 port boots from eMMC with working Ethernet/SSH and
  has physically verified 1920x1080@60 video and HDMI LPCM.
- With the generic Meson non-CEA mode-range change already present in
  current mainline, 2560x1440@59.95 video and HDMI LPCM were physically
  verified on the display's native timing.
- The RFC port builds on arm64 and its binding passes dt_binding_check.
- 3840x2160 at 30 Hz has not yet been physically tested. That test is
  required before a non-RFC PATCH v1 because it exercises the
  GXLX2-specific 297 MHz branch. It is not a blocker for the verified
  1080p/1440p use case.
- No other GXLX2 board has been tested yet.

The initial RFC intentionally contains no board DTS. A downstream-only
HG680-LC DTS is being kept as DO NOT MERGE until the compatible and resource
model have received initial feedback.

Assisted-by: Codex:gpt-5.6-sol

Zinan Zhou (2):
  dt-bindings: display: meson-dw-hdmi: add GXLX2 compatible
  drm/meson: add GXLX2 HDMI register support

 .../display/amlogic,meson-dw-hdmi.yaml        |  7 ++--
 drivers/gpu/drm/meson/meson_drv.c             |  1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 33 ++++++++++++++++---
 3 files changed, 34 insertions(+), 7 deletions(-)


base-commit: b0a652436b892eb9a036a031b33099dca036faaa
prerequisite-patch-id: 0a689485bbc3c1d77d52aeee0b81e4943d1e904a
-- 
2.43.0
