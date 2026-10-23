Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778846;
	b=IwnUaQeeOquS99SEwlwn8KmoGmuwdbInVtODcVSB3/HMvgXjdboGUx+ob8qk7wJV1ZJy
	 4HYK1FvqNRF1cYoO5SaBHalZm3UVeViscEtFGk0hJ+eHpp3aQBBwwK3hqans3VIZUPlR4
	 PTSaI7UhtUAffYj4Nemf6nLknN1Tgc5GyHd20LSi2q1MVbifkeV34/q2xgxn/coJuni00
	 I4VKENJTQWUMJEaYaqxvS3q8wnfgUxe3QuMDQgZxf1lD3E4Q1fJbVs3PcOvggAL+m6gD5
	 8ojTymBZ8D7bLFg2LT3exqogPBBubb/J/UYAIFH/06wdDTbISSWElHBa2+j014UcUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=txl2YxthedvIMMSIevEpBIv6A2VeEKzSw5KVzhLjaoQ=;
	b=zdUlH3TrtilxHxIoIhEgQ9QvZu8VsFWT2eq5LBjUSppq1rwWxH1rVzNi/Df6s6o3ofPa
	 e+F0QPHZ49KPNc5gbjWmFryPIbuDQXASd4RrggKduvzPxpPwSn85TZhCIpGCRZ0NbN/kC
	 6ltfDw5p8JtaBZ8uSUciDNgw7j3dBgqa6Y/BlamhIBvr0ZoeKx0UwkOZ+AFG30vJrb0vs
	 pwGPDkvA08zp52ID2k5fNaKEvcRJvU9RuNAO8SWvj6MrwXDN1NA1oFO0QKZd3Wg1VojZq
	 iOUUPVkbxByexa7btfK+rxs4T8mg9An/35pnk3jLZGONBv47DZhwC/hu/shJHIMvrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="st32/fl0";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23C606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 18:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D23C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=st32/fl0
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so1739099c88.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778846; x=1793383646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txl2YxthedvIMMSIevEpBIv6A2VeEKzSw5KVzhLjaoQ=;
        b=st32/fl0CotkbJ/OCE5OZBsuikCq8TNCARKbaZPMZmNMM8Q/AzAzYnKX8SVrs8xv/2
         P159Yefa4xVs2scYVb9on7cYzHbx1n8xvTUT3hJ8xt3fwr+JzTkOIuSM0BJ/8NOZTOhl
         dDTmbuUOj6tv5mSux32WHtgBFGrA0qB57zDMgCFX9oYTx4CZWGa43QUov7Kdo4RG9zpB
         j1z4ZqPaMkCKGcAdjP4xHnW0a/Eok44V860lLwczEnqcszEbdfLD+tQRd6oyFDULUd1U
         XmPUXjaeEy4Hi2znNGs3iIBs+MqA7vFfMEfeHWNw/KhNkyxRGhMrEca/yc9apnwM6FLF
         D1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778846; x=1793383646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txl2YxthedvIMMSIevEpBIv6A2VeEKzSw5KVzhLjaoQ=;
        b=oCbO5mL8f/rO6HvRuNXsLbZ3ds/qSgNp0JSBIHPU4zyqu9ydkYZZaMsvhQoe6ORd2R
         +7eAmK/WmWZT0g96/4au3oP56BPTPApOMq/5COCIUTUSH3LlWkChq7lZvHiXyesg+YVv
         ee9wFkhXh1Ejr8YKvm7w4DbyaPZYsLmUHCI7lkFMoGdILTBVPNU7FUHgh7Muu54MpcfQ
         tRQc9qpV4oI5VF3OiHJYGp7aNBiGx3OQTuhj5d8BHRZDIoHW6zIJp8mTGfi8gwC2b5ED
         qOp9WqXKaHizWpRhm6PRBncz+SglSfgBJbBUBd+ltBpNul1X7rdiOqhC4QijKf++xcEB
         0tsQ==
X-Gm-Message-State: AFq9FYLHg/d8Yn2vMOh3pS9+PBV2eTUhnjflyxrb6pXro/LQmcGokLsh
	JTHgTZmEaHH7agjRPkm3xhiR/BCsIxPpO3xXl+siH7p/7MpCjJVdWH6jZJ3rYW3uW0Y=
X-Gm-Gg: AYBFou1L9+guHkTdNZEslbiJttgeTfUVnyQ6OnbH6VJjSIJ/65BuBBVpmT/xwRbjGM8
	q+GvfxCdjoSRP3iAEeb3AEK7jaKi58G7U0Tvmc7lERC+Rbca1cV1zFqc1HhaahTJwC8vgc0qkDE
	D14ePdjSTwaNHXmS+5bT3FH3Tr6iglExNR6MBuC7uxgN2J0qwzedokynGcoUKVxe1TJmxlEyBuw
	+bRCP1hpIVoAOEOCVai6JCkCTJEUPd3DF+0A1wdEjhlXFU0kHL+BoF64+iwwhVGykSzXW8RL7EG
	ffVQkiT9rwfahJ6gKBJ+f+1VverLK/KrqgPmygXm+0az/6K6EK6S3WKgFZahHkV3J5ZFhhXcUoY
	4gjipxRBtL4WAjXsRURyLVqBi94s0O0SR0Z442deC6qTmFzje7b90gOHLUrsjwmXPyrrqHzVDIU
	+gQH54g62N5RYfsA0ikLkQJ1Q0TrKg7TolM73aZLSSNKDHjo2V1zLaQUTIAFod2cKjE1RtTE2GG
	Q2cKUvX5scovJfKkIJ2D+Ea4mOIMOX+G+KtE2VQ9hNE5Z66kkKxp2ALK9VOhAXFBuDZxGWkHLiW
	bQQ5J4RF
X-Received: by 2002:a05:7022:ea8b:b0:143:2719:f800 with SMTP id a92af1059eb24-1959a382eadmr3584289c88.40.1792778845045;
        Fri, 23 Oct 2026 11:07:25 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19886f790e4sm326318c88.0.2026.10.23.11.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:07:24 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Sat, 24 Oct 2026 02:05:11 +0800
Message-ID: <20261023180513.36417-1-kaipeng94@gmail.com>
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

Tested on linux-next (next-20261021: 9a482184) / Ubuntu 26.04 LTS.

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

- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1541 +++++++++++++++++
 3 files changed, 1544 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 9a482184d910775cf648863148944945b74e2815
-- 
2.53.0

