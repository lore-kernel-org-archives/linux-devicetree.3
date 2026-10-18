Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4F4A7CA6
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334275; cv=none; b=RMJaUfav7um3BHkszYZNBNxKct73aqwoF4IpinFAgZRUqDq6ep6qcB/nt/2UXP/uj3msr9dHPrdde5t3JwQ28BwUnXN/BCTTrGv/ox+dOE/93gHSwC0IjlNbCX9n6Qev2aBnIv6juExJJfBZ1Yao2W4aFr0ub18DBYHk6dqEUIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334275; c=relaxed/simple;
	bh=xRbrP2eD9E7EByFwpgV/lYFTol0PMFEEMAgvqN4yRm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+Cez9Nzf9XthjfAHlK7puFNCGiubDP5OgS1eBXWRUXMfW0PJteUnef0W1AB9rCmUUySlbRl3gkZwYgfnHk4lZ6eDqSNrAKB+uqDLUB4Lripzo24idub2wiH3NAeA5kSThMZdY1TZcXFA3i5gYUG6bKEEXh17RtgPzVwuZRSYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+3m8bUY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+3m8bUY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so3059375e9.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334271; x=1792939071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=c+3m8bUYh6UulGm7vgmxrs3uD8Bz47hgZS6PryrarnPR8gxkHqJM/ZLBE5WvdmpzrZ
         4jaWy+Gmn23YiFjfWwFO4G7edsNhFON9cWw+hNbw5g8jR6FpIEh5suy1AIAl6Bf3tpFl
         V33xHYStDLYnUY/MFPK/m3T6cpeTKfTwSDmuTBJaojsN0G1q5pvytr7k6pQLIa/iFQmG
         iriBtmsmORBVsR75lf6PJMyiWAAfR2R1scHQvv2iG+W/K0bO4aTwaiinRd6MBidProLU
         UYa1u1Fmbe43BoWdA28YZ4/2P2urzD1/AwNh1BhSPw1dle3R0qUaPqp9yLVee93kfkd4
         /vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334271; x=1792939071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=d18IgMh+/XPGNm7R/jUYgtn46uq0s5bW2pGQPj90K8Hgxs9/XrcZFuPDPpa5uB/Edv
         1cjuyOiuTtj6DzyOz4jpkZpDwlLk6ump7gj2BpCMJ0qqWgZyVz/M1sm2nzJVZH72dttz
         rCPOk4usw/W2hEzSltpylVS1AzUy8zYgUmCKOeWfpSakfB3ryUy4OF3Ji91XImtzIvon
         uCDKMLLqIVwVVFNjLyQaTi6Qw3VYvZTuCUOaVfSD5I5OcLpfYNtTTrbSAoqSPhVcrw+r
         1VxGhPUe1soEJPE/RARFeze+n4RRmnvxD/tbEABp2MpGFse+YLDJmVh/9ElNXCsQUgg1
         vBYw==
X-Forwarded-Encrypted: i=1; AKwUvBxzTFzRTE74tC26cXL5ct3r+NuZx1ctIztLfUxXhN/axauXCdkceznZkXKvZBUQniHuVs2LHZe1cpDe@vger.kernel.org
X-Gm-Message-State: AFq9FYKmM9RWtvDi7PUzaaHXqXFWwq0uz7iA4AizQNrWRdygq/f9cKt/
	fN9VY6kdte6WxDxAIY+/iLZQzjZ/oV9gGlpzBhE8MKZ8pIqGegy158DT
X-Gm-Gg: AYBFou2xgZbszFI7dc4Kg6OXdMZkqeiqf3w2mHWVsZEAZNnnhT2nis3PM/inEy+xA/+
	PkpP+mCDTRTwm8SASN+mtdnyLaEtu4hItGlRLaVruN4YAQV0XtVPk0rfUb+eKXochigCF+SD4i3
	hA6jyKb1CUYInUWOALsg+gKFkXOLGjh/BmsTGZYKVRzxwVO3feb10uYQh3mKZ6B5Q6F4bnOTjPx
	q/51DiJtfNBr3XS1Lt0ib0XVPO1zDHNccOViwjFKsOiT0haKrHnfjRiJ+jh/1hXtTdcwIXgOFNU
	5tAn7Yx9jYE3+8tSwXMhVGUhsJGFhGv2GLVLAxxZOC0SYUMgqUFROeKGUpe15FXjzapPpVRinkQ
	OIijfnSD3550xvsyD4gbGmi96x3w/de52weDNEQPK3mZMmUbutkxDeryuKUyOkdCUCt7EpjS7z4
	lrf0fTNIDyeQgFok5WnCaH6Cyj0zGgUMKPU8Nv5Al+C57LmNySn9z5ARBsIFFIm8xhcayoR38m9
	wtnMoJqvHtSSjC8coWANqigIRgN1iG6fKMmzGee9Lx7Sg==
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr12571315e9.10.1792334270968;
        Sun, 18 Oct 2026 07:37:50 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:50 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com
Subject: [PATCH v12 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 16:37:09 +0200
Message-ID: <20261018143712.1040152-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located
on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2],
"There are no plans to release a public datasheet for the DA9091."
So we are stuck with the firmware interface for now.
PhilE also states that "The firmware needs full control of the DA9091,
sometimes with extremely low latency,
otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (3):
  dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 .../devicetree/bindings/rtc/rtc.yaml          |   1 +
 drivers/firmware/raspberrypi.c                |  24 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 278 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 324 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0

