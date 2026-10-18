Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999E344D99
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336262; cv=none; b=jwb4SARRc8CtecjNCHZwPDzZXDQLyGSeyi8fimcRVlzh6ls348Ab0UxvFZBELdne1UBRHa00nrDEaS1q1Hy4OxQzR38+1ul+v89x5sGoeOvnTv45MTB4xeLBVD2ZaG7YLGCepX+NqZV8T2fMWoHbg94FaM/mHDeEY6Yotwsdm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336262; c=relaxed/simple;
	bh=xRbrP2eD9E7EByFwpgV/lYFTol0PMFEEMAgvqN4yRm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SI7cff/rR0QHt2fffJL5oJNs1ypVOZIW/bBhUklYUNsuffeN2V3kZvfKaMZU8ONjlnQH4dUkAbByF1fC1EasiGJgJnW55SBxRBhe+/NbMSm8Zt1kFqE1r7wYm2pnWECwQ5/93Fkow3jvjuQ5hGobE3Dt4dQPYGq6fVPALS4KJ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwGEeVcQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwGEeVcQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dc202a60eso164838f8f.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336259; x=1792941059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=KwGEeVcQwepLVz3SC1MSELvXhg55cvyt/OlWfSXbAhnqNFOQsc4sPepRgPJpcdl8Bl
         eYRc9++22lrwal+QHo7TY6Nj2FXwgDW9HcILNba7lHIQ3mNPxonXxb4D2ugQIiR8M9iP
         bpGNNm7AIrHoebI84ac3ZTUS0X3UsP/wCuAVcjpcSE0nx6Gmn0b32/x9UvcCTa1rDmBs
         Z0kQxnKOJeRdEcfxH/pSE7mItoSYhiSTzyfTYZ4X+QwcrPj+UuLIc+2ZnupV67DNZgpN
         cvUv0npyU7x44zsaEk7NxrpNpbg78JnDqU1Sqz94F5mzv/gr7rtXCp4GZSDqORihab0Z
         tJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336259; x=1792941059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=h6HTPQlU36W6nDTYkfEDB2WuKYAWcx2zCeJOEBLej6tbIhJmBxhg6f1wJXYtEUEpJw
         5yqdswlFmrce9Qz9CzMiEYUMLIZjBZKxEJZl30SKuUW3sOnoC0FBkO3ZTLYSR1gfbjGK
         YrPfTt3UtJLGno714yF+2Ulp3ixUYXsCiepHUEoX0G+AmBwPMlXj3B6IFMEVQKj2QpaO
         X6IryaQcI+ze7rYOecqImS475ns8kMgCmIy9FL/ctYA6Jcx/hkuFOZH7YTLj7Y6ECYho
         P8Xxq1eCyA6scMFT1t+YpZrDuBTTCUYYO4nMHoVznfoFbfJDZz3yncs8j/IpYVsaSmAS
         19OA==
X-Forwarded-Encrypted: i=1; AKwUvByB+Kbovl3d4hb5EwNXND5++uQm/aOXO8R760qwqDDhtzwbp/PE7O48lPnThIpWkLRTM/7x3vYC7EGt@vger.kernel.org
X-Gm-Message-State: AFq9FYKMiEaDDz+zdJGJwRa9DpvXBV/qIBgqSntlDfWXiGSiExMY6Mbh
	46HBpV65CXuSF1zK+UEobqx0OP76qbpbv7QNUncOXe64HqGyGPknLQWR
X-Gm-Gg: AYBFou1Et7R4o6/aD4eGwSjGX519l8qyKDNl0L3b0IQi74k6WGq1I/CNaXxmZltgr60
	zWV4UvR0t/77qhsK1102ygh0iPy3S3s7yRherv4LQNv5nfyiXkeY8AzqZBi2JKXvghTGpM+FLYF
	s2PfmO5thCaRMOJP9XuspKTEhF4nyEsLGF1zRQKX3RHkrsNBhLA9AbThu+bVEwEsnY4O4bSY2h9
	aeSaJ+y8RlNj0zLyL6lN5N7Q+8yMkCZaJPACJd56vBPoJM9u8Y8UYF3PAGTuGiQ66jvYOCgat4j
	2O0PZfd9qBXRJbByMsjC5Px3E9BXEfjeJTWliWRbi3g2ltswTAM/KV2se/lj6T6AHlzK7v4o8BE
	u5me6+X2k1yF+/WIe6UpOASMtzpwgRW9W9aUMn6EgMgMFyxd1DOE2CpArhRtw3xocyFMMdAgfOa
	msgmazsEpUPuVuMzZBNYofCY3YT9PYpaZppSLEVNCT9l8NmdG0qPl1+h2S8/eWbqdK04RLHp3FL
	ct9soWNn2FEMpU8Jp+8idB0gELvmCFHXbz1IyzvrRkZNA==
X-Received: by 2002:a05:6000:4b1d:b0:48e:eb:56d8 with SMTP id ffacd0b85a97d-48e07bb307emr8915118f8f.12.1792336258666;
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
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
Subject: [PATCH v14 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 17:10:53 +0200
Message-ID: <20261018151056.1051330-1-sander.speetjens@gmail.com>
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

