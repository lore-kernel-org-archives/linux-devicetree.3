Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C81F5847
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011805; cv=none; b=fiAQXAzZ0Vq4p28SISrm0W08j81If/f+XBjAmicZ2JQDXB2bzrp8+umgWoH2KEQ63ghguDnb9EgdoMTlY1+Km7J+YYeEJsEkYQc80q3wwvZl5D9aGMKMWzoYJ/vvPf0WZNnpO0bVPyI60e0akfbB2Y/MFjgxgFmh0lf+ls33i6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011805; c=relaxed/simple;
	bh=qgli1bjVuf7GXloYvSqY8vuAmlkuWrDFwY+V+BYkcg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kvn53yUORhvfPIMWV9b5doc/YF12GPnXmIaFvje/UU/dFDFr2s5YnltcFiWA83Ns3am8m3YH+ktGfgayOkVcN7WaAu6+R7wwfzbCs9apd0b87e8aTjquyIjoYiey29iJELJMVA0OKO8eFY3L95rAcnHoGXb6hIUIdb1pYe2U8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Lp+cmz2a; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Lp+cmz2a"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso60342755e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011802; x=1778616602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ9fQnRt00TekxovwoSAoZ+jmlPGuMt3XEpbArETLcw=;
        b=Lp+cmz2amZZ7MpehAJ6ijiZ3TqmRdI01cHr4gWnTapg4sujD+H8JKqMXJ09asNlySY
         IHdZzIabz2EGgYGS/Ju1cy0iG7YasDjYxJJ79PlKTJsSIcJOky0yTfALbFTsceNzW83F
         ORpnyJXNyZCAp6bOkEUK6Pdo1xDAtGQAHbCPeJWJvIkmFAtwzmDTgNxmMZW5upSslqRE
         2Kb+PXc7tEezMZZrH8pMsIBLHaJSBjNSIhkq/dVFEWxmyrCrtgMPSvgsGyGhaP3PwSCH
         6T7i3XPKMMgbqY/CLl9P3jiJnZbf5KFMxW7FLboo/lBisXVxhZPtysiTOX5GL6fLxLlC
         Twdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011802; x=1778616602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ9fQnRt00TekxovwoSAoZ+jmlPGuMt3XEpbArETLcw=;
        b=HK0X3k87GH3jcQ385VI9GQMdqQI0Pur4pL5hdCN/75u9gtcLFd8XI3uh27R8AivBvd
         6mnv76HoqmefHRof7e9itdYVq74fEGyc2v7u3X2XJ0QjsL2U5JIeS4WdwFVsCX3BmE3F
         L9M9zCJGqhx21ZFidfIx0pGJYlEZ/sQ50ptxQXdfBJE56GgJXLmEDS2v2Gp7/vEr4SGN
         /bil/MLS8Pph2bj8thl9QC8oq+CL4YnlPI23PaHcg3QXX6IJSR2+HnhHlfEiMcSxtp5i
         Vn4wEBCYalmDuj3LvjAOplLhQHbzLoIgDBP5U7G84O54JfWgvtqPBTFjQFTEMeA0Pl9u
         25aA==
X-Gm-Message-State: AOJu0YzapWru3kax5J10VLuAEMp4oFKFoJBM0sMRPYxIYq+yswkraAq/
	U9duSO5VQmf1nvLSY3uYo/L0JOCizxJ4cWJAVxEOXNWc/oGF1tjG09H6VHjuLfucM7c+a2fz8hX
	uvz1oPos=
X-Gm-Gg: AeBDiet4J74KJZjHLB8w6+nZS+qpDPzw/8W/+8I31JHL19P5O8qJl41puHQe+caRh02
	eSgn3lX1fIRm47reUHBnRQczM9SXPRZxtx6Z0o+es0zCkkSaQW3Acf/KOGF3FfDawhxBhrDoHCL
	TZ8jX/2g5oEc9GOrPPpQdjCRcBroXhFeEQcfloyOkX6DzDuxL3eDIq9R2tu3AjpEtGtuONEqMKT
	HZ7Wzf815N4D0Jeoxqd7VcPbWuYUOuQOwHcgAk92FeAE+A5nUtnwzhm22mMXnz/xy0GuYnStIat
	Pdn/jpJyczD1Fbf0Vb3iIcgn9o7YPSOdkSbvm7cDT4gOSXj0NdPrQqYyKrlhuwATgoyFc4g8MAU
	g9D3DzEHDt0aQgT7N+voPeShC66izc3G8y1dHtpSPdmR9v5eaxpHJORD2eGZiGoBvYBqGpovwvy
	L8R3MRB1kqyPoWG91Dqg2DpJnnKhkhkZL+lKcF6qqCCSh6ZhdzUmEccushvp+TmsveP4g7WBQoq
	OXaFmYrr+QVeqKrJP6N+lEv6C3XtshSqUo=
X-Received: by 2002:a05:600c:4f51:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48e51f3054cmr12700415e9.18.1778011802176;
        Tue, 05 May 2026 13:10:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:01 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Tue, 05 May 2026 21:09:50 +0100
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5O+mkC/4WNQQ6CMBBFr0Jm7ZhSWiCuvIdh0U4HmQUgLSEaw
 t2tXMDl+/n//R0SR+EEt2KHyJskmacM+lIADW56MkrIDFrpWplKoYxhxYVSa63C5AljT2i4Id9
 7ciG0kKevyL28T+2jyzxIWuf4OV+28pf+EW4lKjRB+7puLDtX3XMNV6YrzSN0x3F8ARCW9p26A
 AAA
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

This patch series adds DT support for the IMD Technologies Ltd
(IMDT) QCS8550 SBC and corresponding SoM.
The SBC DTS supports the following hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board
  PCIe switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- SBC regulators (carrier-board fixed and GPIO regulators)
- M.2 Key-E (PCIE0)
The SoM DTSI supports the following hardware:
- PM8550 PMICs (similar to the SM8550-HDK)
- QCS8550 and UFS

The IMDT QCS8550 SBC hardware is capable of the following but
support is not included in this patch series:
- USB3 flip detection
- 8 MIPI CSI2 cameras are supported using 8 IAS connectors
- MIPI DSI Displays via a DSI/I2C connector
- Microphone input
- Speaker output
- Fan control
- RS232
- M.2 Key-B (also on PCIE1, selected by toggling the on-board PCIe
  switch away from the LAN7430 upstream port)
- Wi-Fi and Bluetooth via SDHC4 using an NXP-IW416 (SDHC4 patch [1]
  is awaiting review)

The DTS files were written using the SM8550-HDK as an initial
starting point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing
the device trees against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM DTSI
Patch 4 adds the SBC DTS

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
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
      dt-bindings: qcom: Document IMDT QCS8550 SBC and SoM
      arm64: dts: qcom: Add IMDT QCS8550 SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 827 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 ++++++++
 5 files changed, 1156 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>

