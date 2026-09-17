Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F43D4E3EF3
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647931; cv=none; b=b5Pm886v7wh6185/eTQJt+4fxXdbnbD/uMfxblvk2kRo0EsGbquydFxPfpY3VZ2/ExFTCZ6KcB3h7MPFjyoXwpc5glfjkBzHdjxK566GcqA0qZ2IyoRPJnPIFL/aceUW0Z/Q1DkZME4c+g2bGmhyzKZ2GvyoYdBC1yHUjuzUxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647931; c=relaxed/simple;
	bh=DTJBxrOGBZyw8FjjT0CEPO2tUaetzH9hgNCTJwsgJkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMPARU9+UZw1hDPAyuv14VfOWiucHcRRvdvnQEmzZLJ4xDWTeph/46JR9l3fGiz2QSU2vMqXJ90gJonDriJ25b1BW8i95dpb+J6S1tY6ts5VNCUHPGRltwhCVv8kcsJ4icmAs2J/zLI90w6gJyVwmZGkLGBuOTPwzTOqePG1wlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrIazyI6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrIazyI6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so267362f8f.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647914; x=1790252714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDcuQ9VeUxp2M+Co3neI32LPx9A6FG/PXs1DV+w7hSE=;
        b=DrIazyI64uG49Otlx0ZHxJRirOkrQVhdHlh5HCCjJ78H1yEajzvozT7vKPJIB0oWe5
         /XvoI0SeQ5KvEuouied379XPiUhLp1yblsDhyyeRRW6PTIPFCp8nzz8ICGIGR53LmZyb
         HgtBzg01MW9g8htb/QocT+qXzUFp1wWGjNLMPUsx4iP/lK1OGEZlGLRsplb4zAR1sXhg
         wm0x36iGHW3rcdaldcZhMLBgYezaRGvPPWyYNSnlMvssjaBKVIZEBdXYWNdSeO3pr0FY
         ybkuRgG3IDsl91YKkUPuOooNmAmQaDqj1ClBFAQIYTHzEbviB1NaWZx3CmdTCaq+Qp+6
         SuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647914; x=1790252714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDcuQ9VeUxp2M+Co3neI32LPx9A6FG/PXs1DV+w7hSE=;
        b=Jhg9KvDgIZz6fnxhpQkEk+zHRSOfWMUvbvZtblil9uDi/GJ9MdPP3CTDttKF/TQnY8
         WKo3icb6N90OAaGCEC3EoBNHiH/Z5mMhZcik33+p9n3dB+91hnfxai1hvUuEQ4dm9dj0
         OZGS6YjwwujsUnbI9TvlYTRV45233VX65HNIiYkD/vl/aD0Ym2TOLk83+SFjZxxAuNG7
         uw6D++8Sxw0B3cBJMk3DSBgVrqxb99itfrRQjBETJEDpT+zrMpP5cZnVIHPG7VScMQo3
         YrhItOXdCwyvHMlj7l5kRpHjmwyOLZ7Are95aWzgzzL4yxYNtAc4osLp1U/UyR0RU1Zx
         gZZA==
X-Forwarded-Encrypted: i=1; AKwUvBw4QjLXVpA5vnW6Zz5fMVDjyNvusstVbuH4vSNdHx9uVlkreEkhU8S/Rb9teivX1/o1y4C/DVUm4e1H@vger.kernel.org
X-Gm-Message-State: AFuF++keSaWBDGHb12Lk1OHG+vymWLylNOSriIzB0Sm7m3q2qwMzBi7+
	t7sysYNBoUJieY9s1nPIr92AJi1lflouSkfnzkRDiKORZesmTAlRS0UY
X-Gm-Gg: AYBFou3UjfC0rbb4DI/LA/KqS1+qHoyrAmgUsRW9PiDNfiaon2jIv9QuqNn9VHcA7Nw
	Gxl5PSgBQd+YQkzn9HM3OXwmLjAKnoY35ku98L9ysJam94baJphiNYyGOGr74xgRPobFOJ720R8
	IzT2HZrXPAEXurcupZ2o8drD3vjRjQAkl5FMuQwBqIaTBamcS3Tr4u04ChE1d3TIbgY2+SaXfZz
	2+mo9u6vytVJnkSGFkpDKdhxFa6OXTtcQYM9LOFG48VlbQrK16Xsjv4b3tU4T0bJWs52EL2i2u8
	1RrzXv/KO3vAlpVw7Qr35UqLMFKzvuyqfT/lRrLArC6kKxl+334uGCX8bpQ7U7m2BbQXsm1f4Pq
	M6dQVeA6qYRO5Dz7hGMqgx61MgT4g5wPDYaB/FYDZGzBJrkRUG6/k60VENh6iwbGyCm4zQ0Sn/6
	3z5DAMPBtln/7K0DfhJZSNrHf1d3DLyUC1mG62uo+KUIzLPhkPoSMNY3giS6oLEugFQ1gi0q04o
	Ip52ZSy4K2wyj2wo0HjJCu6PiulJS4iK9wHj9Mm9gxsxDN4FXybf7CZ
X-Received: by 2002:a05:6000:2502:b0:487:a87:24c9 with SMTP id ffacd0b85a97d-48713ae6895mr5484888f8f.3.1789647914291;
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm15276567f8f.20.2026.09.17.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:13 -0700 (PDT)
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
	sander.speetjens@gmail.com
Subject: [PATCH v2 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 17 Sep 2026 14:21:42 +0200
Message-ID: <20260917122144.703221-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2], "There are no plans to release a public datasheet for the DA9091." So we are stuck with the firmware interface for now. PhilE also states that "The firmware needs full control of the DA9091, sometimes with extremely low latency, otherwise there's a risk the supply could just cut the power."

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
-------
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   7 +
 drivers/firmware/raspberrypi.c                |  19 ++
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 277 ++++++++++++++++++
 5 files changed, 315 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0

