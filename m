Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342619;
	b=egjkM6dtrBY3R8t7zcBiCqcSgh3JhhOVRcfkqHlsaKpbtLBjuI7LJ8WIehsJJy0+aCJH
	 DYrjSmQU2NMt19XZUxid8TLFx/ZBQNY/48RGaT9uZK2r0hX7HOhVD8vtCXK+8xXy98osL
	 WvLPcdX6WnOu8QAuFfbP2XFKGr+CSb2aw3sBLKLtpM5pjiGtIpTCdROwb+cCyl1e2ykvx
	 FAOfs0w0RwnM3dsaoFdnN4HMYOTBvYz8b1C0010SkusH5gX8Ntn0f6+WsbnRoHMxz3Gcr
	 dVRxUyEtSPL/+LPaj6pSb4lUUF6J9KlqgIQeKMfaIJBpMkMO4Pp5vFkmEsb8tDSsHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
	b=Co7fpntlP+Y8v2gUWGCAB7bYK7yi2FScA278+X6pbnC3pp0A6B+ELh1vfhm/Cx6rMRja
	 /jOdCdre16dj4b4ADhafY9mWRs/lQG4NELzF+NTATJpw3fXgvx593yTMSXxf4cLs/iIyk
	 9TiPNETUC9x3nfKYwFb0RWDLalIOfIWwxKX0R8PMGimRlcPC3B4BEdhfQU8VYk9lAsWkq
	 pxgwncOCCIjP1ww90jsWkIrTTTqinFMdh7rM8h1tNzOa5ncdta/Ii/EAhGtCI2rygGQZS
	 DBAoax73kibQg+8VTDKlvvik8Ma8GOzlTZAshQLULt19nh19L5bQ2KkOk9nYM9XscNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVZKgSWg;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EEB606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVZKgSWg
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so460873c88.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342618; x=1793947418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
        b=WVZKgSWg29WUI4vvLEcCsTVBsKeM/SKWh+D8nQjXB2/qhKd5FQj7kn7ptcVN5LqJmv
         NvOObdvjoZ2agwcpCjw129XSb49A1yybCOVw0FXujKK3hVro4iC/5uI8hvHox2nFGDEI
         rbqeEL1oCOyQnb37nAUknWVsFp8XoN7RPGeYUGP8tbMea6ixvvsM6u32JV7rs1ElK2pU
         vyneib3CIKiRpdx/L9U5yenyst0Bh4QEwGil6CobmxOUWwhkFP1+Twy3+3IcixRQNvsG
         0SRjG8s0BHgpUqo//jVm1Lh7DrgDQJdjsMHL1ec0Yckdfax8z8mJPlqsK6aFTIoy3fSr
         4ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342618; x=1793947418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
        b=TGJecPYxzpJZiVJD1Z+wEYmteQUKF7eHi4JldI12JAaTwg49YfwBGRz7yNwD8e70hA
         0llHNMRvR+h6MpDtxx1DPZnTrmPQP4R/ccF6ylIrkvTGJNncZI2lvQ89vrfSF80neAxo
         SnGwQOFKKhq48zIeyP8yeKgN8JHYiCz3SsN0nn+rujmu0+iC4JIDK902bmzmX1LbLfi2
         GS5Uf+vRh5yXMLtWCmKcEsmXZa8l0Sn4ndn3hDgmin+CbJqZp4vsEr3Ckasai5V3/KzL
         0iTL00TCcd9TbXeQn3QNAkXamxkoXg41pxxXPIhQf0B4jHWukItgxTv/qQpyewuUuHgH
         dCHw==
X-Gm-Message-State: AFq9FYIXrbvFnoYrqdeUjXvZ++ctgJK0Veq0LUouHTX5ehVO0cfd2Dqe
	4qFKhLc3HQ5WTpZh5Qiuue+DNTkHbY8YqnveZRh8PN/uy8/PFAshSWa3WFuYnUeC5nk=
X-Gm-Gg: AYBFou1ntimQvITNIChIZ2dFUSVMGDqTBisWMSn5oKOZy3wutoje/sz52oPsntIcriO
	CcvK1NEmYmy/hAAwqme5AAcR2lU9ygHvEp6xw6SmjQS2t1lM1IJpVcFXxRnc7ASHgUKZ6YanYME
	tDwY2qBOoU7CQ9AAOuPBIxSbACEH1xbOezAkZuTtnOnz0aEdJdvwBQJBsWWgDDOH+xtG814BUHE
	gtpxOv5l4Emi8sUosKz9NACm8exm0AMPUPDx8wpTPa+kUmZ+HQCgwIF8/gMd4qCwoyVSGnLufPa
	1c5ACaZXaFlvq81xLDYeEf85akfzC1cz7Gnr6tI4PlRIrGG+2fFvl593pTRQm1F1ed78zaxkDkl
	AhFYPzbp+KcOiZGV4vrypsVaVhLyEx5fFPx8PPQs4NSpttuccA24usEElA7T4FMo56wye+himz5
	hfzYxcA3vMdMT2VrhpsRtNzpXiQgPzN4bMN0MdfJKdfFzYS1W0FYvy0UaU3pID1Ax+C0PXUFyPM
	iRjjgNGQoRAntHZQ9y/TCTpYyqqtqRNObeyw6K1Eb39uw15f0IqdCZEeaQjeTJatAODuKQBJsLH
	5sk0ezC5B8Y1Csaf5os3npr3IEqV6MCrhm2zPiHrjAh7D7Ypcpw0IRY6KA==
X-Received: by 2002:a05:701b:4189:20b0:182:6c6c:d876 with SMTP id a92af1059eb24-1ac5cb1a331mr2023312c88.8.1793342617792;
        Thu, 29 Oct 2026 23:43:37 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:43:37 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v6 0/3] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Fri, 30 Oct 2026 14:41:46 +0800
Message-ID: <20261030064149.14736-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next (next-20261027: 151a134a) / Ubuntu 26.04 LTS.

Tested and working devices:
 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display (with audio)
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU
 - Audio: speaker (partial), mic, headphone.

Known issues:
- Four internal speakers are detected, but only three work. I use Ratizux's tplg [3] and
  alsa configuration [4] on my desktop. I also use amixer & speaker-test to verify them.
- The system fails to resume after closing and reopening the lid, but resumes successfully
  when suspended using systemctl suspend.
- EL2-mode:
  - EL2-mode can only work with kernel parameter: "iommu.passthrough=1".
  - Audio and Battery status are broken under EL2 mode.
  - Bluetooth is broken under EL2 mode.

Also, some notes about eusb*_repeater and EC; hopefully, this can help others understand
why I configured these nodes this way:
- eusb*_repeater conflict between the DSDT and my testing:
  By using `i2ctransfer` to sequentially set the modes of 'eusb3/5/6_repeater', I can
  observe the corresponding connection or disconnection state changes for the
  right-side USB-A port ('usb_mp_hsphy0'), the left-side USB-A port ('usb_mp_hsphy1'),
  and the webcam ('usb_2'). Using `gpioset`, it can be verified that 'eusb6_repeater'
  is affected by tlmm's GPIO 184, while setting GPIO 6/7 has no effect. And webcam
  can be shut down and reset by toggling GPIO 184. The DSDT places GPIO 6/184 as a
  'ResourceTemplate' under 'USB3'(usb_mp), GPIO 7 under USB4(usb_2), and webcam is
  under USB4. This conflicts with my testing. So, I didn't add the unverified GPIO,
  and the connection between USB and repeater follows my testing rather than DSDT.
- There is an EC device under i2c5 at address 0x76, with driver probe failed.
  But using i2ctransfer I can observe some data changes related to fan.
  The EC driver appears to require additional work, and it couldn't be included in
  this patch. So, I didn't add that node.

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git
[3] https://github.com/Ratizux/audioreach-topology/
[4] https://github.com/Ratizux/alsa-ucm-conf

---
Changelog:

V6:
- Add 'output-low' to 'edp_bl_pwm' and remove the descending brightness levels. (Sashiko)
- Add panel and backlight control GPIOs to fix corrupted display after resume.
- Correct the pwm period.
- Add SFA14-11 to QSEECOM allowlist. (Jianfeng Liu)

V5:
- Rebase to next-20261021, pick up the following upstream changes:
    arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved (099cd579).
    arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies (d9d07e23).
    arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies (4458dcd3).
- Add 'eusb*_repeater'. (Jianfeng Liu)
- Add 'displayport-2-dai-link'. (Jianfeng Liu)
- Remove 'usb_1_ss1' and 'mdss_dp1'. (Jianfeng Liu)
- Remove unused 'audio-routing'. (Jianfeng Liu)
- Remove 'kypd_vol_up_n'. (Jianfeng Liu)
- Link to V5: https://lore.kernel.org/linux-devicetree/20261023180513.36417-1-kaipeng94@gmail.com/

V4:
- Add -el2-dtbs. (Sashiko)
- The "audio-routing" of "sound" is from x1-crd.dtsi, audio doesn't totally work,
  and I didn't see any improvements when I followed Sashiko's advice,
  so I just kept it the same as x1-crd.dtsi. (Sashiko)
- Tested in EL2 mode:
  Successfully boots with the kernel parameter: "iommu.passthrough=1",
  The above features work as in EL1 mode except battery status.
- Fix missing newline before "wsa-dai-link". (Val Packett)
- Link to V4: https://lore.kernel.org/linux-devicetree/20261006085425.40450-1-kaipeng94@gmail.com/

V3:
- Re-sort *-link and its sub-nodes. (Konrad Dybcio)
- Keep a '\n' before 'status'. (Konrad Dybcio)
- Remove 'output-low' from wcd_default. (Konrad Dybcio)
- Link to V3: https://lore.kernel.org/linux-devicetree/20260729064538.19564-1-kaipeng94@gmail.com/

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
- Link to V2: https://lore.kernel.org/linux-devicetree/20260721082410.18275-1-kaipeng94@gmail.com/

V1:
- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (3):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)
  firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1565 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1569 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
-- 
2.53.0

