Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC6303A37
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276947; cv=none; b=lPJv3YYG3IYIVVlEmSjDiyOApZmZ31Y+B2i8+xO3cjl5pfo82vdKIdG8oPONm8Lkgxvx0q+4fwNKiRe3W9COi2/B9HO9bhlqmrSOu7MgQUuIe32z1q+zo5bCk0EF5dleEYan7JkmM9BbjXop+2dqYnYz9uKT7xLqdrfJ17VzFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276947; c=relaxed/simple;
	bh=JLBMVro0M7Xx5NfFieOvPbsEVCzylddzxRWw17ZNnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtRAPnkugaQXvApHOHPbGrJNRZAt5cEr6ODA3nP3nMtbTp+dEoXYCtyXeONKTp31bTwA5YofEjqNKdK3E+fDvZrsUAQGZOAQnK+tnFAWZ0G5pAss6BvFelD1Nc2bt+fskBdPppi5qbuYvzCovCGM7R+fIdO2PktjeKmob8og344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzRKMmWw; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzRKMmWw"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30b6dad2382so584995eec.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276945; x=1791881745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooRUwN+Yszisn0zKNz84eRSvZwUXnnz/IiR13DCV6g=;
        b=WzRKMmWww+ycADqj21L6etL44+3cAkE5ugprY0/T/U0mT2yUnaufYH1udPKdaHc/u+
         XUffM/WSixTj9w1ChALYgZgcHHaS0sAychRuvQg/FJVn4PNz+pSmA289fteJ+K9uz+E1
         +UexavNVGYCY/+pji0Rzt762TZt18EZT3toqFpZ8KKhg6tZ9vF3joygrSEws5RTTicFD
         Cv3eGhcnj9UodhVPICRcpjXARU1BAbG7DxYp5ocPys28edT5ktWa0SNPE/nAxQ/3F4Zv
         cthKAPZSxa784az0ex6dPgSnx2LRJRVwJaAfXAHoXM9op8fSuFK1vKKjKRGd64zXkKB8
         gDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276945; x=1791881745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooRUwN+Yszisn0zKNz84eRSvZwUXnnz/IiR13DCV6g=;
        b=IpNYAUIbtTMiot/nxRMAFUna4zRpB9uDkuyPjDL9vifRd+2+aHLu40Yq7mfZECzdeZ
         rq7q8nRZFQE9GaEzw9Na8ZOkbVaGWs80ZV6/VNYtEUZ+m/gtPbMHQ3V6pwZzxgqgazMx
         CS0iCYkmK6P0zC3YW+fyrWQ42PIZDIkUlkT5BCc3dUXimJP2beyrqjC9fDvkKYXyIs9m
         cLETY2tQ6gp4uCvIUmrJ4B6ytVzwTd+7IR3yoaManlZw/A6Qv3REz8EDeIHjyYTTo9ms
         KGo1zY+ga9dNcvvm4+dosCWeynqo2Mg40pB8E5JVpJv9QIFtTD37miupujQocI5uzy9N
         /rHQ==
X-Gm-Message-State: AFq9FYI2zOl/1cEMwQ7FMmf7pJHMgPXBV/xXwgfrh4yjWy2ya5uxmaHq
	ZzY0tCb+Qvfe+EzqEkb+B9l4RvVdmRSzDuEPWikzAYmWX8WVfMd8TcwrsDZf4nU+
X-Gm-Gg: AYBFou2K1I/IxqtC6vy7WnQQTd+SbcvFo58YO+Trq7OTanyhfUZfryWGQe5sTChRIcH
	88eYQkT2mRfHjQbj22htAnPtDMzliyTv/ciJxDFD1zPGWIB0EBgPO/j/r2SUo9nIk3H30U811mp
	MQ8OLO+KdeUsPP6XbMD8LUpyalTAeNKF9eKVEf+XNzQaWONx3z3a20gKOPO6FefR5bTUlZt8qSD
	poDrgAKDMB0HmPQFrBHsZLtMatowGMyLLy5JQ7rTO+IeVsMR+MEgY1YR16ueoOP6vOIYH0wKsab
	0JiJA2S4DmrXl39/Zzi3TAoSHjPuGm6Nxr+aVDWhCVn1mz872acMMV2fKDjHeCfv2ACT1ARsM2Z
	gCPqyjzhtXWfGQQuErcHl5R2re295m5755YIwXvR4pa6ccFfIu508DmXd0FGrch89fsw3AohK5E
	Z+F1XwrCY2+BThf1L4niw1Y4BwEhFLj2QH06hJAjxd6jLIFh1xc8kGajNg1Y66+pqZbhz9iVuAN
	SSj4Jkcljx+ua1e
X-Received: by 2002:a05:693c:69db:b0:346:7c2c:1d25 with SMTP id 5a478bee46e88-3514e32db2emr884832eec.41.1791276944875;
        Tue, 06 Oct 2026 01:55:44 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f6dccsm7008620eec.7.2026.10.06.01.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:55:44 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Tue,  6 Oct 2026 16:54:23 +0800
Message-ID: <20261006085425.40450-1-kaipeng94@gmail.com>
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
 - Battery & charging status (broken under EL2 mode)
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

---
Changelog:
V4:
- Add -el2-dtbs. (Sashiko)
- The "audio-routing" of "sound" is from x1-crd.dtsi, audio doesn't totally work,
  and I didn't see any improvements when I followed Sashiko's advice,
  so I just kept it the same as x1-crd.dtsi. (Sashiko)
- Tested in EL2 mode:
  Successfully boots with the kernel parameter: "iommu.passthrough=1",
  The above features work as in EL1 mode except battery status.
- Fix missing newline before "wsa-dai-link". (Val Packett)

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
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1484 +++++++++++++++++
 3 files changed, 1487 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
-- 
2.53.0

