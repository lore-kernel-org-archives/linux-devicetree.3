Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A478A2F1FE4
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307566; cv=none; b=Gs2/M+19MhpTi8GjPAVcDwBnlEyFFQEGMNgL8UUUjqCWfvKhwmJqARETNvi4A+NvX0vHVC2jdHgJ7J1OtG1vI3j/eH8B3ny6K0RRXG7YWubFd41FhdABcQZjVtfy4xIDdnacWxe1CVuPXVnfuIZYswz19O8MVYNCF7wlGkoZRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307566; c=relaxed/simple;
	bh=UtKjADk2rPeLePZUyAblyIugJRkeY1U111MtwFxEW4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8Mf58a6a/Rr2M9QZ6GjtMyHmQknGDqJYdakTCg27tWqldpa1S2qRbzyqeQ8rP6EBWyTQL+PXIa29YTtopS2J112iD8VhCVZ0Z5lz4GcuqQ1zxvXL/CBvIppnViA62z78iRxCCXS3CG/t2B/Bgv0gMrSs3l4wRq9C8nGP9Ui/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOWg1sLj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOWg1sLj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so510682a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307563; x=1785912363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XzqpL/KwNW7VWHUSuueZGeJItvlfPLClzRtDIOx/B9o=;
        b=XOWg1sLjw3t9p6pNHq03Rj3pJdEMtVOkLRG3Lwo9jdK04qIjPQVRmhfjUjJVdIXmpM
         ps7oBrEKIBu0ImBSWyBIGQOtCfzM1MWJlbWDjy35arONmvMM+G82i7kw49cGAm2+P5F7
         3siRc8gvO1Yijxt5fWlqWLX7TA7+C4ttPF/vdQQkhSwiDYw7yyawOvfkkuvkJbmoIyC0
         E32zj1lb9zUdOyb5PgNFvM4j2qebFE3U2auJZZMwoKZRhBjl6i6+2hPxLImo4AqJX04x
         T7ikRGp/NCV4NmGQvEkEjCXtvonWeQ/FdnwisfldbDNhVXSt3Kp2nStrQ+Ui8hMihixZ
         3OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307563; x=1785912363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzqpL/KwNW7VWHUSuueZGeJItvlfPLClzRtDIOx/B9o=;
        b=bUHB2FaYvnlc5I78oJ3fPHH0XbomkFl9sDa26+ZMfgcGhenzJ+ZRyEHSU+yVZqSEmD
         skEpvWCszv0nA6Z9/yT5oYTtTMCvuiyaSJdmu9WWcjy47Hzbvg3oWPtaHj/0g1ieUk1f
         Wirly88Xy6hJPCbyDOnit06xH+PZjiFLgJV575XkDHsFOCfCz01yUPk0e8/iHWMgfVWT
         ROcgMzh+nP8anvMUksyYZ3jRTZ206IycBdxDwuXhY3dGzFurjXG8N1fzOWRVenvhyaWI
         IzBkP9MTVe65RhCZ7uT6HSWW3mcnxps0DVXAA6K1RzlbS6+mObfwSyKeBUV/CIayRy2z
         09gw==
X-Gm-Message-State: AOJu0YwC5moI9cznRL2f41J4Mn/wYhIEAaCVj/fLGMjtPM1QVchAKo33
	E3EU5pVLleNuzIv+qitD46YJQh12Znjz5iayEUdKfRjugrSYR7YdjX3Ftnpwq8qHaww=
X-Gm-Gg: AR+sD12pr8TZ9NFKGJaZXCOgs+TwWPBfFqabXzobvjeex9uG09EQMokam7wDHG5XMfh
	m1tYkXHN80xTJ0yMn8eaDepN5+effI5c1c96fYF+Lh3RCYXMQ4va8mglchrcfhwPNcycTw1T2bS
	sXOFjQJqngxcWnspXWGfPnsE51I3nWIPwzTs7cUUfYd7Mc0IBlcCOiBYVU6GW3tMhyhspR9QAst
	SveLOqvtEBwRAwqh9zZcjv3hq4hHL9kPqVNQR6uVBXIMtFtGgHEn02MrwPKhBwHXa4s+r7Og23f
	2+5zjcBCW2o5FoINDxhCZcysbR+PJT+uvdr3GL2wQUxtw9GTL33why3IZCleMgdijMQlraiKESy
	bVNXtPXp2taj/dXHT3SZznYPur7dnYrJ4TGnNiY5IdtIPIyg5ydRHgHkNPEw9OFkhRN2nQXrtYx
	briiF/CFhVNKcbAA6Q7Wq/8YFYTrvSnaZ8+kRL25l/Z0N/QJ6caYu12B/Ye0CpY2IDowPt0aGgZ
	BC+VoE=
X-Received: by 2002:a05:6a21:9e0f:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c8ba63ad14mr6402910637.63.1785307562881;
        Tue, 28 Jul 2026 23:46:02 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba35196esm480673a12.17.2026.07.28.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:02 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v3 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 29 Jul 2026 14:45:36 +0800
Message-ID: <20260729064538.19564-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next / Ubuntu 26.04 LTS.

Tested and working devices:

 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

---
Changelog:
V3:
- Re-sort *-link and its sub-nodes. (Konrad Dybcio)
- Keep a '\n' before 'status'. (Konrad Dybcio)
- Remove 'output-low' from wcd_default. (Konrad Dybcio)

V2:
- Fix Makefile entry ordering. (Krzysztof Kozlowski)
- Use readable compatible string. (Krzysztof Kozlowski)
- Fix sound card model name for this device. (Krzysztof Kozlowski & Konrad Dybcio)
- Re-sort nodes, pinctrl-*. (Krzysztof Kozlowski & Konrad Dybcio)
- Remove those regulators without consumer and lack of a required value in DSDT. (Konrad Dybcio)
- Remove ADSP/CDSP fastrpc memory. (Konrad Dybcio)
- Add iris firmware path. (Konrad Dybcio)
- Delete usb_1_ss1_qmpphy/usb_1_ss2_qmpphy properties of Type-C. (Sashiko)
- Delete usb_1_ss2_hsphy. (Sashiko)
- Remove unused pmic-glink orientation-gpio. (Sashiko)
- Remove node related to WWAN. 

- The Webcam is a USB device, can be probed without any additional
  node. (Sashiko)
- Using reset-gpios in swr* seems common in X1E devices, like Lenovo
  Yoga Slim7x, ThinkPad t14s and Microsoft Romulus.
  Because speakers do not completely work and I could not see any
  effect of changing it, just retain it. (Sashiko)
- Also, the HDMI audio is the same reason as above. (Sashiko)

- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1483 +++++++++++++++++
 3 files changed, 1485 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
-- 
2.53.0

