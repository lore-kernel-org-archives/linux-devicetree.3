Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855234EEE5
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143022; cv=none; b=d+wfBNP5rdPS4Y4d4r/5ceRPKxT94ZBlqtYfFGMwf7olHEAb9KXg535ogJbfZxIPu6LUYhynMrw3wlFz3sLQv53OGwEvepS8SH9lSISbeeRvSjWTv18fb3B/VHAYYIi2GnexaqbSNc2AIymnbK05OMbAEjuhlmY1UIjmmaLYPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143022; c=relaxed/simple;
	bh=wYjkaztJPkkAcQ0jT9PCsm2QXXlGEWa08QwMutUw3RY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bhiMnJAaLYsENj3wYXl1c8Tn+DrtDCi0yhmFOZtffIMFf7HJsUZjDOf1Zp2Z0FopKhaJILJ7V76HWq4OZJ+jeHgYUMmbusrV4I1r3g7EkW2dZgk0JXsIrpJo80hjDSPpGNR2H1hXTCBU5Y+qH19Pw+I+y+TsC96dfdq9yA+09gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=aKYlTPHb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="aKYlTPHb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso4554795e9.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143013; x=1778747813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzmPPnLiUq2BrCsYjq94RBYPrJIGWFqYE7ZaauY/i/Q=;
        b=aKYlTPHb4pdAxph21NdmsPQOREuiJYqbeZDr3U4DB2PI6dirbztoR8am80Bhzjxd4i
         G/XfC8I8NYI387bJo9SshrbqPVUaMgW4YXi+65acGhQddwAq0kArnfVQEfcYiFDondg5
         wsqRAtaE6qpoVjGS7dg3zYs8cihzNPKqZT491h+drwJkYfCgsN+dtVk1iME78MUnT6m6
         SK9gqtUOUJU+phThrwONYz5P+MnJ/81jX6IBGIMpS3rP68gxI4PXeGcRB6ipnHmmMOrT
         WMV+Z/cpiHNRSizgRgSvxAP4HJy/GJed3LHHfGCcpqLYYm2H6Kab0sQuUES/kWjx0hMa
         6e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143013; x=1778747813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzmPPnLiUq2BrCsYjq94RBYPrJIGWFqYE7ZaauY/i/Q=;
        b=M4203lLCOykPlAdN6gW3Y8cvOqy84yot64m3d2LJDoTWKbaJgF+iRwSPxHWseXBYuU
         36GNXMVvaa4meKd904KdvK4T6CgRjCfSVVG89Xd58nqPWeF6E2owNH8sPF+akU41m36X
         0IvuLUPy+27zjQIqkBRbUP8A495Wo7PwbOfROKaKA963VjOYVuxKt45lBXlT3rCutw3Y
         EMhjupBZsxHDiJafhB4KezhOgFnNI8h74krItNHz+BcAlLlv9QJ0VEregXp13Xa59dAh
         TWWSFUwbWc2W+l9WD4w3LBZp6sdBel8Qenn2VOqHbF27bZ+/DTUdOti+NZTjOlb9y6fT
         Lgdw==
X-Gm-Message-State: AOJu0YxikAy7Nd/Cz0HWyBIKNVj7e2QzFGEzkLnxkidYCkI5wU7xfm0A
	R/2fwrC7T3V6kWbi8EUnlybTu7pGEiX6gvXNOVNsMwZSu9JQXSXkpgljdf+MYvxVFco=
X-Gm-Gg: AeBDiev/XQIEeMqG2c34c2NcATidLcq7LaMXcbRtybtCFs3mK7cwhaIY/iEynamwKy9
	IH7EvU1CMXcHFTjBRjxR/kBFCtxqPNuaP/nV9rlo8zGHtj2levXvlZlI/WFw4W/zihl0mzHxrb7
	cv/ru+Q1yUw0IwcPOzFcn8ZjoKzRY3zjiNfRjwyxAIns/7tKtwgDxzI3zyDhsxXVAF8IKfb1Ve6
	Eum5mtT2M9HrkL6+jxu85Lyh2vzkWFOJzMen5APeuS/fnYzWmD5uEhbLygvxIyL1tiytyQio9Q/
	dbR066Ks1nrYMEeuvGnm/+b5GJtNs3SVgV8DOQAJf2e+iw5rSka4n9Bmm1THcnw2VCWLvcEHm5F
	VyASk+Y+NTKAvqQk0swraTvh1M7A3CBBAM3HPSGmdKORo4l6bAyutEpWFZJ1c0jsZKQguELSJgX
	XOeJRFPzxrOe/LdNw2u1zF8bsWKRvGCB/dR8sXVK/8pLEXPc1LmgrOAr2WhIOUozfPDCpfuDGmS
	0t0d2PYLEN9AUa7Uc1nfRzZE8efROl5zaU=
X-Received: by 2002:a05:600c:a30b:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48e51e1773bmr83934275e9.9.1778143013299;
        Thu, 07 May 2026 01:36:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Thu, 07 May 2026 09:36:39 +0100
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdP/GkC/4XNvQ6CMBDA8VchnT1TSj+Ik+9hHNq7Ih0AbUmjI
 by7hcU4GMf/5e53C0s+Bp/YqVpY9DmkMI0lmkPFsLfjzUOg0kxwoblsOISBZnhgapXikBxC7BC
 kN+g6h5aoZeX0Hn0Xnjt7uZbuQ5qn+Nq/5Hqb/gFzDRwkCae1Ud7a5lzWYPZ4xGlgG5nFh1Fc/
 WBEYZw02hAnkqL+ZtZ1fQNbE1kLAQEAAA==
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

This patch series adds DT support for the IMD Technologies Ltd (IMDT)
QCS8550 SBC and corresponding SoM. The SBC DTS supports the following
hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board PCIe
  switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- Regulators
- M.2 Key-E (PCIE0) The SoM DTSI supports the following hardware:
- PM8550 PMICs (similar to the SM8550-HDK)
- QCS8550 and UFS

The IMDT QCS8550 SBC hardware is capable of the following but support is
not included in this patch series:
- USB3 flip detection
- 8 MIPI CSI2 cameras are supported using 8 IAS connectors
- MIPI DSI Displays via a DSI/I2C connector
- Microphone input
- Speaker output
- Fan control
- RS232
- M.2 Key-B (also on PCIE1, selected by toggling the on-board PCIe
  switch away from the LAN7430 upstream port)
- Wi-Fi and Bluetooth via SDHC4/UART14 using an NXP-IW416 (SDHC4 patch
  [1] is awaiting review)

The DTS files were written using the SM8550-HDK as an initial starting
point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing the device trees
against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM DTSI
Patch 4 adds the SBC DTS

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v3:
- Dropped backlight node since it's unused. 
- Dropped regulators which are dead (no usage or not gpio controllable
  whilst also not strictly required by a DT node). 
- Dropped SBC modem remoteproc entry since the modem is fused off on the
  qcs8550.
- Reformatted commit bodies and DTS comments.
- Replaced open-drain properties with bias-disable due to open-drain not
  being supported by the tlmm.
- Dropped tlmm entries which are unused.
- Dropped disabling of LPASS codecs as it was unnecessary.
- Dropped bluetooth usage on uart14 and removed references to uart14
  since it became unused.
- Patch 2 renamed to "dt-bindings: arm: qcom: Add IMDT QCS8550 SBC/SoM"
- Patch 2 commit body shortened as it had information already found
  within the patch 3 body.
- Link to v2: https://patch.msgid.link/20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com

Changes in v2:
- Patch 1 relocated to be above qcs8550-aim300-aiot instead of below
- Split the SoM and SBC DT changes into two patches, with patch
  3 adding the SoM DTSI and patch 4 adding the SBC DTS.
- Dropped the SDHC4 node in patch 4 to focus on the core
  SoM and SBC device trees. 
  This allows the primary hardware support to progress through 
  review while waiting for feedback for [1].
- Link to v1: https://patch.msgid.link/20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
William Bright (4):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: arm: qcom: Document IMDT QCS8550 SBC/SoM
      arm64: dts: qcom: Add IMDT QCS8550 SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 392 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 +++++++++++++++++
 5 files changed, 721 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>

