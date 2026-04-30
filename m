Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92EA3AA502
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571266; cv=none; b=Sf0XSPLkpnNJyLJQPe7XQswmyeiYAhlqu1CivhJ4pYEHDG0HnbcAfE8s68cRSrPo+Bx8FYdTpS7Rd4IWN4e5ZYKbCn7tk5acWx97cLsa/pelVw9PCd/AbSvkPvfIgysMaq1nWHoY5U6wUPXF9Ps5RVgdxv7qwZNGTTZQZxZNK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571266; c=relaxed/simple;
	bh=HpS3tu/4Ze7sR9gDX4heP6NH6jx5x3n6hiVs7K4rwHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lid+GvGHZUZLEc1R8/51+0coJ02QlN0o32KGpbcws1KPPxNWRZbBrVT0BjgKF/y0ADCiz95fylhjhpn7iZrvv2DlaFzVtHctO6KhiyhMXLvDef+NEvRXxg5QajIKIgvhpkJw1LyOULBIenFUL510WycoGqOeeC7qN9ND8agEdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UXIboP3c; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UXIboP3c"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so10195475e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777571262; x=1778176062; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vazd2QkVpnLaBHZCRGcJYbqmcBsD9o0dHNYR3gel8s=;
        b=UXIboP3cIqN10+XWLGMSuhNXi218QAf9gcYmFxW9rooynGYKq5Xk6voBPwQ6VaSKjD
         VkADUmGHs9xJ66FD9JR+dioShjo4moKld5UF4aRy3LclPhA0YS7ZmzU4Ymc1MYRpSd63
         fqWVqJo7wWVCggwIJHCfNN9z+GYYJ94nbudpbcKeEl3tF9p3THYRWxSyWWVcJie2uA+2
         0yIQ6LYYUK7kGe56pNFTEZaYrMW6O2IaKMd8KiQ69GYSK/tkVAxqzZKGjLcNO2aV6C7x
         pWmquL5e/kCx1HxWSWrvyr21EhGtsXkcv6shYBOjzm3pC+tkb9T/oDrAvKgucqT/PdYy
         k3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571262; x=1778176062;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vazd2QkVpnLaBHZCRGcJYbqmcBsD9o0dHNYR3gel8s=;
        b=NZhzp/fjTq3o0kdj9SyvYviMpGOSm21L1TW2XsbCN7BVvhoz51LlwsyfWEyStXDpWc
         iUpsop0gHqfikEgtyj0MVosk1OLfh/kXCwvwZQMKSrzXDOp5CWfTvBz0z73yu5CMG4V3
         ErUCTJOtdU2yaKbt+loQL4i2YSpE4qIS8KRuPgzYb3F7LAZpfozXj3Kregh+QOC+IP8+
         WLPW4iODEhZYVf1pFmbKtvnOkXP9N4doVc2zIWQeZPc+CwmLhr5n3SCVmUHFGyZvoKEJ
         SlFKmdQgQnxvHl08/08Rq5EO6YLO5B6OkSsQN4WEO+T22RruchEEoMy9LEOcwYuv767T
         l73Q==
X-Gm-Message-State: AOJu0Yy/cwMBNXBSq7ao/rYjFFVnQWfMi2rUv3DjRzChHHxyROX5XpJL
	ehY1MY8Eovk16uGnuHJKNhFQrwyGkZQ7ZkP3Y0UHCwaiyHY5SxToZX6Hf8WM5Lx5Blk=
X-Gm-Gg: AeBDievkufSOyYHQ8BbHMdA3Lk8FsF9rsCO7T8176JMv8vSRTw/Yo2aty3IBIhEf2sb
	gUjCSaU7WCq/sQg7297ncaOIypnmcDjjpYnrRldGJPhsT8sT6B8FIdDsbkjA8+8tE0kGkshIwJ1
	bHL8T8VdF2bh8Q0xzFdsuiSGt4yaCMXWjOa+rrloMw6+YPpmKxNZBcw/3STcf4XD8ZCmeR9h/+d
	ds/YQHozdILIhD/tkHt788UN/rkQbZ1lZmhdnvgGbabrOPyqyes7PlWkITcn8X8HRwu0ZeyUYuD
	FWsFSqQhSZ4rMURxbf9b967kzh3/BWpk3Ul1yxVIrDnnvF5hN/ASa2ee8rtaGTT5sd4M8VBCumu
	vyxLzz9KLgYUsxKQ91tRYJ9Mbf1/jbVGAQ+k3XnzlXguGHsrDD7s6bBIax8rFVAiHS41Z/zqfpE
	pIvsI6RArGdr+hxC2rRvZUqCNhq6dCMuQU+nAvWULBR63NbpuA+xJWnKjPXYo74IqwiLUS3MDqt
	W8SKcr9xufmMF+sl6nxIb404G36jIrqP0gPNJSffJxKoA==
X-Received: by 2002:a05:600c:5254:b0:489:149a:f9e6 with SMTP id 5b1f17b1804b1-48a844640bdmr67159235e9.28.1777571262495;
        Thu, 30 Apr 2026 10:47:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fd90:2598:5764:5f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm174449435e9.2.2026.04.30.10.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:47:42 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Thu, 30 Apr 2026 18:47:00 +0100
Message-Id: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSV82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE2MD3czclBLdwuRiC1NTA93ipGTdorRkXZNU8+SktKTkxJQUCyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AAv0UzdrAAAA
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

This patch series adds DT support for the IMD Technologies Ltd
(IMDT) QCS8550 SBC and corresponding SoM.
The patch series is RFC due to the open SDHC4 patch [1].
The SBC DTS supports the following hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board
  PCIe switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- Wi-Fi and Bluetooth (SDHC4) using an NXP-IW416
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

The DTS files were written using the SM8550-HDK as an initial
starting point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing
the device trees against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM and SBC DTS files

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (3):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: qcom: Document IMDT QCS8550 SBC and SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 845 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 ++++++++
 5 files changed, 1174 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>

