Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82296358D32
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081872; cv=none; b=JkAIwreNd0R5LRtv0dKNRvccJPHV6iLTfphARARp86jTuU80hdpZu8+CmozR02zdcWBaoFXgsrn2r+ZPtyYuPC9zBtV/O2DXgMZ7xOh7th+TfcPZ7PvrXUJnvy5dhao6FYJCb+0OJ8ldtpCauR+hKQVcgzLgkcrkcRFm5UW7Q+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081872; c=relaxed/simple;
	bh=xnjqgJXyoGJWYozez/m84uJbEX14HWPu6Q8EGhsKd1Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trPYszNRindJXq0jwGjoOBwSL/CgxGi5ljA/0OejYSoNFCwmMsf/2Nqmw7sHs8rNjAt7RaAIqd826ubs6UAc62X2OGJISqAATe3WobyR1kmdVQcAhCs/u+1ssLMr8UrzotDeDpDi6nhVPEXeDClqWHbUOgrbYDpRY7WeLePHvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=LLvXReHY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="LLvXReHY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac10e337so54703925e9.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081869; x=1781686669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGxADFJpFtsaw/tpNTJBftbgVulNnvat2Rp1ypoxt4Q=;
        b=LLvXReHYs8reLeturs8OrpJU7beEUCGVI7dgyLy7c3QFOMKEbISVtMf1rsp21ylF5w
         TkGztNtrsSNu0CJVoYv2i24JjpFFNB8QdbmsyBT1IjF4ZQAIuPGb6d0ucMTjewiWaOG7
         e0umDm8kFHh0tTzhvUVMVt/1xH9atrJyW1PfWOGIeiOQwTGHRTQpro3kWxo9xQUXZ4la
         IVX9cc3AlMGBOm+s9pwjqkA375kf9NaaIX9VjbIUdakwnxnpXxNK+jhpaxOT6Bpsk70N
         SYFgFRIklPhuWhiLX99DinGDM4PTJwTe++Nrreo4BKGVqBNiuX18Ame127wiioY899K8
         XUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081869; x=1781686669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGxADFJpFtsaw/tpNTJBftbgVulNnvat2Rp1ypoxt4Q=;
        b=LNMPFhQMBERXFG30+WfNnI0RGhIBrh6vNnpv/sTUuNK5q2M6PjBzY4v05Z8WWgee+5
         e9WtvuqLEc37pShHBr0/GCF2b6VmgpWB93i1fgZ4mnmgQyD/Pe4I9F6aaMczmBMnAH3i
         kXuzm162EQoqkNobk7BBBzFPYo+tg+OajeDpB7MehUjNR7O5H7QuqGgmg+eK5zRhkgmR
         LnDKwzqkmuWWksKdVDbMn4i2iQwtvenWpTYBilAkERkuOmQdoiNGl8JrIm9/Af3bsI5w
         lS3hrwbtHfjmNRjpdzia+cNCAgcrYZIuwBvndMJzV7M3THGhg2HBj7RH87IhTxGNHqZ7
         omiw==
X-Gm-Message-State: AOJu0YxiYUAA89on4kpLSEiVwjR6kn7N4dG2ni+sMzJ7fNUnLGQOIbsM
	CajbIAx9ZLlXyRvoAQ2sCbQTz7TO6HsP/RtsdJbc+aGg+EwV8xxZGMJko/g6jGgZatA=
X-Gm-Gg: Acq92OEKB8qwYnD73s4UeVz0RQ9G3jUi6HqrxzA1gPti3Vdg63Ntc0ooSRwMsWquGeo
	Rex9aAqRnDxWwS/UyaPqhlcgUKHUrIPHIxqXzVuEA7thK8r693O29We/3M62MHH76TGw0vMz/ga
	QykCrScZFICNGppbk33Bk5gjaBalc7yDOSu/uNTQqUe4dBrBohKCyNqt461eSMzzOyk1tN1lvlM
	BpLS2EEDNYa3KSP9NCCqypnU8dvOV1+otDGfojFonj8VWaQT29/DjagrM17f/ojTK8+luvYUS50
	NFDo2Logx8eaFoDqkVgaTDgvmuQ53gLyN8yjBHuATEWD/2tQBRFZjGbA72nNW8nd45mh23dqenl
	L0kmbmMMPoVMyVOOboD01bC69E2aorhVwIF9d8KahrEnf3sfD0sDT+qlF9k54efAzFB4MpcW6i+
	oypJVPrjlQ7WTcafhG6q/LGD8HVXMdnXvpVGqP+YjoftEtqj17Qz4LEVGCen0RFLIxnCSu9rBX0
	GkbA3MzGJ5ASZdJ3Bgg9oIyptmurxuYXw==
X-Received: by 2002:a05:600d:644a:20b0:490:c6c2:bdc2 with SMTP id 5b1f17b1804b1-490c6c2bdf6mr198982075e9.4.1781081868535;
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Wed, 10 Jun 2026 09:57:44 +0100
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgnKWoC/4XOTQ6CMBAF4KuYrh1T+ktceQ/jou0U6QLQljQaw
 t0tbDQa4vJNZr55E0k+Bp/IcTeR6HNIYehLEPsdca3prx4ClkwYZYoKTiF0OMLdpVpKCsk6iI0
 D4bWzjXUGsSbl9BZ9Ex4re76U3IY0DvG5fsnVMv0D5gooCGRWKS29MfxU1mD07uCGjixkZm9GU
 rnBsMJYoZVGiihY9cvwT0ZvMHxpo5Ej55pZ/tVmnucXR9sFbUgBAAA=
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
Changes in v4:
- No code changes.
- Collected Rob's Acked-by tags on patches 1 and 2.
- Resubmitting due to inactivity on v3.
- Link to v3: https://patch.msgid.link/20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com

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
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>

