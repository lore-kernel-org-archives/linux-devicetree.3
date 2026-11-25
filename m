Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607287;
	b=SHjUEfQJMgHjJPUSt5p7kdbMnjtwQ8RIdCYRcIDoVKmY1i6USqQQePdUQVgUS0QJf2mn
	 abr1bYE+SCfzH8FOI+hTcpk1zVpU7v81WGuzMroTRVQPbzzsfGDk1wGW07MIOlIG1nr68
	 Zem14yr2/P01Rw0WdkvYRezppMFkLmoR3V1i8qsENzEmIK+xof1ZWIpwNsUpgAveDv0pX
	 z2Ywn2w5eECrkMYcSAvu4lsSykGUCy6w/3CVTi+RJhoPX99vr4+eQgieRthqCEc746PXM
	 TDRB+gc637MXbSuPGV19smr8V8DYDDXXKxXktg9CAqikMrqe6/AXQ3Gtqy97hZuCdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
	b=XnFYD/PyvUjb8h9uKbIlGjEVWw+7s5cutOFrvML1c8VUdJuaDlxL2Uad+7yKh6AAVePC
	 NJUqD49xnGyG9S3ANbDi/aP3FowMS7QzeZN6x4VzpYPuei+vhDdVr8TRWp7ITRMoUCoRN
	 z6PPf5QCrd2kRpa5lyLDb9wz47ZAtwsn2o681GgmwJiVBMiK2ehvZ1ILihDLG7ovO0xEZ
	 P1GO89fC8keWtQOkB2ALseIuAdt11/ZiRLqJx/ULkLd3+VRw3OFeFVRAj8Jp3FB3IBo1H
	 8a8AmGzN7rGk8+LOdjdXwJgaT0HX3/1wc2bXFCotCv/z2Xz6F9EbteDX+JNB27AZkvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SOd/SHC2";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A2606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOd/SHC2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so28176615e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607285; x=1796212085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=SOd/SHC2/qmpdeMOhbgqoGZxaq4mJVoIhZwG9XfdLjT+KxSBTT7h5bVZbvgevpsqji
         TZtNY1pNkT2igqKTwkzfXxg75vgVeg56qVrG9vPUKsoV6KSrhHmKuKH3pnbVPgiM1W17
         iGmjUl9dxtRJYrXnSjxlCb8HkMY4Lsu8CuPkFVra0szY32DDgtzO768/DowbyydBjc8t
         EPqORUPqEIZMWBL+MoqkNGFMaEUy2Ymowy1kTeIdr8wDktrHDUle7Ql4IFXddMVMTAUJ
         /WeVNccqUcl7L87CMj7OW+UDNgAHzOZIcbKBIBw37OB36vIadbFY4Xn3DXlJZ1VTqHdV
         erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607285; x=1796212085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=SUycJLQRfWXBGZ59YoLB3PPw0j2CWZORRUsTyLkIjSGTueomK/vPo4iKuNWr4mWhso
         FWYtG3ml6bhlSisxamDFBOic1zE887waZrImmsPF2CaGpBOwr2g9s4xL6KPnoIXHloTs
         +2GdraNXiJ41nCYiie/sNMWX2IiqgrTQ5ESJuNvsHTcz0MS+q4qQu/NOVvrMsBbe6Fub
         XDwtA2lH6u1qNlWf3Gk/6G+ioIKOZni8x+NtupA5/kzDZqv3LGtL2k/728Wwcx4mUS36
         yS404dg63/B4EsVPhqndvWvQocUt/iUH1dkwb6XrDopA34qhAf3jz3UanopXQPejAyNk
         0Rmw==
X-Forwarded-Encrypted: i=1; AL+hErEkmr1Mo84d0fMLkak18tgQewgOaPTssFVmMSukK1erQz/TEZKNi5mIBinbbzBj5nsad7e//dj5L7Gx@vger.kernel.org
X-Gm-Message-State: APuU4Z+oeubxZO5wNHecxMBll+UqyKEPkk5rSclzcmRNudTo67AUzUcF
	m/SaxznQnboe3wVr+hT+AMnC5G8sN2El6bvUPFvVwUpGnggFAVETlNSs
X-Gm-Gg: AZFdTZf5P+Au36nBnjhldB/YpQ2cP5/h3x5+aGvhKaJXCpcneZdkJcvPLFSMlhioTAo
	BayQA9iObnFFK6KB7PTqJX0mSssdbQGXvVCjkFaKnfLeJOy0GK8qylC4MgXNJeia0dXmFSyCZkg
	JmXU0AAUwqO3PJFCSjnGJ6znpNCOWD0BFD9cT4o8haM99BFgx+55TnTM2krU+9AChAiM8auAfqw
	8AE9yAhkAhNOTL8i8xLv9PxtmMS4jcvaaHUwTm0meQDxKFhzFJMPTaHQOhc04BXANau0WNfTwKE
	8uvMjw4ar+NJbTpBpuQc1KORUKsWO49tlEDql5HvArON59AK/iNcGEprnlPFQkSWGDKdsPeoWKS
	dzlKox+hmxhRPQsxzugy5xdl4TrNjGXm52oPS4Kc/GqjOrRdVw/nte+XKn5SCJxQkO3Ymx0NBQY
	m6ms+gSrR0kccIqYLqy8Ki/JSaNWHiD0jVfkqTjSsaumacd3hWtSSuS11aMA3bfHLkAhCl1pYTf
	HJbsmTTYxkVVfg3l+QTKIcQDuT8iM1Kx1uG03nFGMdcShOThwdq4FL9y+ElD9idF+GCFw9K/Rtm
	c+ZVi0CAclNNbDJnjZm4HMZyuEfhNMAWkzFcribA/YUxFcU26EaaYypmr78KkaH2GlZwkv37Ws1
	y4EuDBYNiw2jWN0xrmyE=
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr350066075e9.0.1795607284755;
        Wed, 25 Nov 2026 03:48:04 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:03 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:55 +0330
Message-ID: <20261125114757.654051-1-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a device tree for the Firefly AIO-3588Q, an AIO carrier board for the
iCore-3588Q system-on-module.

The module itself is already described by rk3588-firefly-icore-3588q.dtsi,
so the new file only describes the carrier: the two RGMII Ethernet ports
with their RTL8211F PHYs, microSD, the USB hubs and ports, the PCIe 3.0 x4
slot, the M.2 PCIe slot, the PCA9555 GPIO expander, the HYM8563 RTC, the
fan, the LEDs, the recovery key on SARADC channel 1 and the three Rocket
NPU cores.

Besides the board bring-up itself, this series enables the RK3588 NPU
on mainline. The three cores and their IOMMUs come from the SoC dtsi
and are bound by the Rocket accel driver; all this board has to supply
is npu-supply and sram-supply. Testing details are below.

The first patch only adds the compatible string to the existing "Firefly
iCore-3588Q-based boards" enum.

Tested on hardware with Linux 7.4-rc1 (for-next, e19bd795e8, plus this
series), booted from TFTP with a RAM-only initramfs, without touching the
existing image on the eMMC:

  - eMMC comes up in HS400 Enhanced strobe, all existing partitions intact
  - both GMACs bind, RTL8211F is detected on both MDIO buses, and both
    ports link up at 1 Gbit/s and pass ICMP traffic cleanly
  - the GL3523 hub enumerates on both its USB 2.0 and USB 3.0 side, the
    four type-A ports are its downstream ports and a USB 2.0 device works
    on each of them; the onboard FE1.1S hub enumerates on the EHCI port
  - a microSD card enumerates as UHS-I SDR104; no card detect events were
    seen, so broken-cd is set and the slot is polled
  - both PCIe host bridges come up (both slots were empty during the test)
  - the PMIC regulators, PCA9555 and HYM8563 (rtc0) are present on I2C
  - NPU: all three cores probe and report "Rockchip NPU core N version:
    1179210309", the IOMMUs attach, /dev/accel/accel0 is created, and
    a runtime probe through it passes
  - the devicetree has no deferred devices

The hub RESET# lines are wired to the PCA9555 and are released with
gpio-hog nodes; describing the hubs themselves is left for later.  The
display outputs (HDMI0, DP0, VGA through DP1, eDP, DSI0), the Type-C port,
the ES8388 audio codec, HDMI-in, the camera connectors and the 4G/5G modem
are not described yet and are left for follow-up patches.  PCA9555 line 3
is used both as the user LED and as an SD power enable; only the LED is
modelled here, and the card slot is powered through line 13.

AI coding assistants were used to help prepare the DTS (cross-checking the
board's hardware description and some of the edits, mainly the USB hub
nodes). I reviewed all of it and tested the result on the board.

Saeed Nourian (2):
  dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
  arm64: dts: rockchip: Add Firefly AIO-3588Q

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-firefly-aio-3588q.dts | 434 ++++++++++++++++++
 3 files changed, 436 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts

-- 
2.43.0

