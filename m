Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658523B47E0
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830706; cv=none; b=qgzNUez9mCuNU0M461bYzTqL0k0/oROuYeNCIVqxPgNQYYX7gAZKB/t2lz2wiS8WTHrdoEiY8LTC4rVAfvTkKyROqMMAP+6BFYi6iBCTu9pZ5pe13vb6Gs2LIm5zG3mDVxsGh90UUOvCPmG+TwBbB7yqJYgjvRAgCovgu7sd+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830706; c=relaxed/simple;
	bh=5TC4QUkmHNSuCZ2vUe0sGphN0X9xqPnoYeY3/7I13LI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=orTWHod+xey8aeWCo0g4WkzpvL/Od2591V/uk5HpB2JrCbqs/Liv6dLRUOuE4VybN8ahB7GCZvx+aBMlPU5s0tOglzInwa18heWgr5BkShdLp7N3whZ7+2Hk0MDVqu4wnRw9reNAVfnyxzTGLMqHsbu/sy1J4UECrk9LUWrofMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=G2X9ssKG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="G2X9ssKG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so10364545e9.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830697; x=1785435497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+qM9JtyqJg+akUv31zNMEze1Szte9cVGCmVCVGIRSk=;
        b=G2X9ssKGby/OWH7sc+2HxFFHpQK22MUeonOQu0dUuiJb1BwjrC3hC9vVFqLqAIIphO
         Hxo5bQFbl9xzr7rXNZb4IT/UwQ+2WmFI9gXTmJ7OSsxwVNos6EVosRCkeKhbH46NGPyk
         yGQv8Axbt2Ebp29kwP7p2CWy/uLUtum8hChp4oEiark8QL86kvOCK9n4NGy9F/BKJFP6
         C/tMDSOuF6UCMfjerIp5xwnYhaHc/NoiCiDr0sfLDeOzNzOLkvQIw68QZ8PDJ2mFBgOW
         q9obWGy7J651kAM1h7ozF4zNWLUm6amoL1VE1TIAJrYzRM7zDmnFbZLL2Qx+554fFQW+
         B/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830697; x=1785435497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e+qM9JtyqJg+akUv31zNMEze1Szte9cVGCmVCVGIRSk=;
        b=IFYfv4xvJDYKL5xJvjeeW3K4MtoTrcT4cCQY+rFCUO6Chf02jhNTmsn6RKsKNumyR+
         hNCVQVe7kRMAq9iqAcU9UHxsWtQZHJuFJPqKfHYp1QSxPZ+R+y6jwnymVgsKrM1E8rMg
         gBg2b/9b29dcJHfBaBeZXgAXzmwUoI7Em7dAMEWT7adg5ymR4ogdSskrhkdbWM0w/1dw
         7mkLPhw2t0D+2+JmvDN3ewf6Wzo5LALXqcSDBAGQfKXQVQXg4ZP8IGqtYZ2aAz/v6TtT
         FnZM08H7ujtQ66qvazNCFucHR6Is1Rs4D4trBKqpwYn2oaHR31ZRlpED5hTH+44pk0YR
         P85Q==
X-Gm-Message-State: AOJu0YwVNVDl4ZE9kQ+HyOLJlSmBnf1cHi5GA6mkVtx72scLwT/FwBjc
	fZFrruoh0ETjGqOweALDT19wiJo25kqfSgg9y5Q0G+PSODs/MDrvQ+AXCAeLFcjnEbE=
X-Gm-Gg: AR+sD12A229QBcKWvnNYTZ2Yjr8mk/C3L4Tu+pxWT22xGBgukQ17cd/hsdymYrHiiRX
	ZU6VnVyu1f30zqW/t768RsTu3JKc52JvDDqK/nLMTJ60gn/UXMI411LHpdkPsItYmctjUHro4bW
	5qBYsW8SOZAkOjaf8tcBZGeTnkgw4p5hRTeKfcVSRyz6ZsnkG4gW7izBgq2UAs1Lbf4kEUFV4d4
	rM7XQmWOlHIcWgDHyHB2RFP3C2ZcTy8XrtWhsGCAMwyoiIJjQwfl1GZW99yHTSLpErmLVK7k4uE
	cXXO/M2VYsjfnDgFEV96Hf5kt7TR/u+2qiomaIupGWvF5Qn7Q4n89hSD0qndyzoANp1KEfbRepd
	5FqDZgxGC8OYRca8NauX64NjGuKONc/ELRUzPlgagU9BDw2PYlWJ9UHGuBAwncW9wKiiPJFH37i
	Z/8wfe3ST3KKxYXGCVqxBLbpy0W9W0nYjiPIQ849oll/Itx9c3ESv3jGpwHge8HJGa0jn4CgaHC
	7IgenHQTJrJmY2CGkIxifKVv2/UzjIwyKUdwSVlx2X3ODLYRFqOYg==
X-Received: by 2002:a05:600c:1d21:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-49573cca1b0mr46464305e9.9.1784830696700;
        Thu, 23 Jul 2026 11:18:16 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:15 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v5 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Thu, 23 Jul 2026 19:18:06 +0100
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5aYmoC/4XPO27DMAwG4KsEmsNCEvUwMuUeQQeLpBsNiRvJM
 FoEvnvlLGnRGh1/gvxI3lWVkqWqw+6uisy55vHagt/vFJ3765tA5paV1TZohxryhSe4Ue2811A
 TQRkInERKQ6KeuVNt9L3IkD8e7Om15XOu01g+H1tms1b/AWcDGhzbFEL00vd4bG0wCb3QeFErO
 dsn47XfYGxjkoshsmZ21vxm8DsTNxhcr4mMjBhtwj+ucU8mmK2nXGPQdxINt7ZEP5llWb4AvQk
 uoY8BAAA=
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
- USB3 (No DP alt-mode support)
- SD card (SDHC2)
- Regulators
- M.2 Key-E (PCIE0) 
The SoM DTSI supports the following hardware:
- PM8550 PMICs (similar to the SM8550-HDK)
- QCS8550 and UFS

The IMDT QCS8550 SBC hardware is capable of the following but support is
not included in this patch series:
- USB3 flip detection
- Gigabit Ethernet
- 8 MIPI CSI2 cameras are supported using 8 IAS connectors
- MIPI DSI Displays via a DSI/I2C connector
- Microphone input
- Speaker output
- Fan control
- M.2 Key-E UART and SDIO (requires DNF resistors to be fitted)
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
Changes in v5:
- Switched to using the M2 Key-E connector binding instead of pinctrl.
- USB role switching now supported using the on-board TUSB321.
- GPU ZapShader enabled after u-boot patches resolved it not being
  able to load.
- Dropped PCIe1 since the PCIe analogue switch cannot be modelled in a
  DT.
- Applied style improvements from Konrad.
- Link to v4: https://lore.kernel.org/r/20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com

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
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 401 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 315 ++++++++++++++++
 5 files changed, 726 insertions(+)
---
base-commit: d36de2e50966f3dd9ef3482f1faf649b3d697714
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>

