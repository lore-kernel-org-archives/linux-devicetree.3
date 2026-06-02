Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BBA3939B5
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401101; cv=none; b=hun1YZkB2EUK53RR82SQRCicpRtwqXt4pgxyqZ7rvJqc8GFuHBF+t31VFvNKBGIFUvI6cNX/QEW33FXTUrTFNXZB/iu751lJULgoBgR/a4u/4fjW9QyHYbUg30PRUTpq80l0z57OZVcJk9GeA/Eel/vBHrrVVeasayuHK6FYqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401101; c=relaxed/simple;
	bh=Hm7lcbuEa3gIiNAfgN5UVderGHMXjjcL7M0W+ZyYo00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kg8JBmrOFv7eErY8tI4g4dGihosD29xoLXEpXIOudWP1PkdbCoxVHs0FLGaNm7Fnk2ErGcWuovHWA27jXudn9eb5EqJZHS3TeGHokMpUketeFwDmt3Qup9QKwZfEQu0xHFyxQDwVBDu5aANnezgNwGoozvxNuecvvNambPqapeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpLzbMRx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpLzbMRx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3829253f8f.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401098; x=1781005898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7im3CUG3zSzSawz5dX5Ezc+o8cBVuqZtJiTJ2Y8aJ68=;
        b=CpLzbMRxwHQfcnaWyekPcl65fB1rdxxUvnfBUhYCUmSwzexBZ7CgHJhHXhv/VhDFs0
         +O0nRdZbIr3jq6NX8CmRq8O/8+YhQ83nt79Eo8lI+0CE/67kpXcHFUx1N/q5mzZ/r1zN
         GXSjkmITTT3m9uMcn1yveEyZnAJH+/oUO7GPGOjHaYrxLGN3MphBTI2S3XWlwZDhjFAW
         QfjxH5hmjPB+C4otPQWavjDQ155ygwy+WzSz/Pw+/t6yK0I6BBeFGwfQbYDuZ5hYqv5J
         RcApcmCCoHl79hCP391G9BCHxsLP8uRjGVcq2CanL+e9bGZkLZMKq0m8GvctMr0WfqeW
         SOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401098; x=1781005898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7im3CUG3zSzSawz5dX5Ezc+o8cBVuqZtJiTJ2Y8aJ68=;
        b=bFs1qG2xUFpaoBar5xwVjLBrFUUCCNLuzUAMwH3pmuwkurd+4F1HJOIp/O3PIhrwnC
         SkvX77mC7jvaOgtHWy5/eyoX5grjTeoHP2z/kTpMv4cabskW2ZW5qNWdFGASW7KgvBI4
         Is1oMI1XHbIto4z5e1gKTXkm5JqsPhSdocDpjzRwr0WYoKOyqVq0DXQYpVOnDKR8cDI6
         qwGOIyNCoyyikOxkNFOF0cX4LykHPqtZR0bs6SL1fapJwhLSuKiFeVctW8Ie2zDIelFR
         7PnCtxvXYay03g+XCRvXzGHmRWAM0Dc+tI1TC0GUAaQPKwzLBdpSOONOUJv3VXrdqBx0
         IPDg==
X-Forwarded-Encrypted: i=1; AFNElJ+y2e1dX+sIm1I+26dDApMTwar3Bl5JSniAWnqBnUDK/Co0+fZSYKUzKn/egL1U8sxI6wqcVmJde0V+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ksg1DJZe2rK4gC6JaCvcJWP9FukXnCFpzSHvElRE8KHRyFTt
	A6WBcZvGTBegSe2p+5sYw8SRJd0sBSrvqO2lFOswjqZhGa0U+hMydrgq
X-Gm-Gg: Acq92OGT25MfBgE+K8jtSz/606+1AjElTdfUPabUC+gKyKz1bJR/RgqaGhGds46kWw3
	4NQhdMW/LuFwl6cu4K4Pe2mGTAKwenuiDb63JS5dCB+4IyANIkNBaBdCuKxxwJTEnYyfonxKEdn
	NUdND8s4yK4Lvbk1EmQtqLO1I40CqSeXFwkIDOH+UBOC8KF/Pj4D/GoCUThZbGcuq7Q9iM1WSte
	EgZMDjZHcTt6FwzlDgF83yusKy1/FJ0nbxriQRuJCDj2OW5b8opPthCgPr6XuC2jKy7Tc9nUVPO
	V6eI1cW3IFXL1sP1KJs89auy5C2fXKeHrt0swaufRFv2J1wflxN7/IGj3ZhduR3SqpI/etIvZPh
	a2iwMOgHseeN/zNNRCvi81R1Zy3ZSebgCsl2ukCzx3B+ye+t7Q0gA8/5Ezl9BJYEBhvT8JbSqBo
	wrWdwymCshFKW3hZW10wqmxMpPQfQYTQGBPaxZ
X-Received: by 2002:a05:600c:3b10:b0:490:b0df:9eac with SMTP id 5b1f17b1804b1-490b0dfa72bmr59783675e9.3.1780401097928;
        Tue, 02 Jun 2026 04:51:37 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:37 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: ti: k3-am69-aquila: Add display and peripheral overlays
Date: Tue,  2 Jun 2026 12:51:23 +0100
Message-ID: <20260602115123.1324474-9-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Aquila AM69
platform. The overlays cover display adapters, DSI displays, and OV5640
CSI camera modules available through the Toradex accessory ecosystem.

Display additions cover three configurations:
- DSI-to-HDMI adapter based on the LT8912B
- DSI-to-LVDS adapter based on the SN65DSI84 with the Toradex Capacitive
  Touch Display 10.1" LVDS
- DSI driving the Toradex Capacitive Touch Display 7" and 10.1" DSI

For the OV5640 camera overlays, both the current Toradex CSI Camera Set
5MP OV5640 with a 27 MHz oscillator and the legacy CSI Module 5MP OV5640
with a 24 MHz oscillator are supported.

This series depends on the Riverdi vendor prefix and panel-lvds binding
patches, which have been applied to drm-misc-next:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3764568dd2e621850c8c2a34dd8a88096ae73e72
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362

---
Changes in v2:
- Fix missing main_ehrpwm5 enable in Capacitive Touch Display 10.1" and
  7" DSI overlays for the Clover board.
- Reorder remote-endpoint property in DSI-to-LVDS bridge endpoint.
- Reorder supply properties in OV5640 CSI camera nodes and rename clock
  node to match binding preferred node name pattern.
- Link v1: https://lore.kernel.org/all/20260529120853.636015-9-ivitro@gmail.com/

Vitor Soares (7):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
  arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1"
    display
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras

 arch/arm64/boot/dts/ti/Makefile               |  43 +++++
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 155 +++++++++++++++++
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 155 +++++++++++++++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  |  18 ++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    |  19 +++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  |  18 ++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    |  19 +++
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 +++++++++++++
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 158 ++++++++++++++++++
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 158 ++++++++++++++++++
 13 files changed, 1152 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

-- 
2.54.0

