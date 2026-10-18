Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8DC303A04
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335633; cv=none; b=uYuuqG05F1nbtMCXsixJAEF1joLJ9zI3eprGtYL0q4Rbh043klP2/wm5ZJf++k2it7JyCraqiuBHbVNslgoKgAFpMVtW5TJiCOcdn1PLHE8uju8u6N6q/wzQQHmy5DRsVvhwAVwnDYEjgoE1eYRmV2uEzj4FUPd3sz49FnLyAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335633; c=relaxed/simple;
	bh=xRbrP2eD9E7EByFwpgV/lYFTol0PMFEEMAgvqN4yRm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tP/DXYrbWz3r+a8S94ZaHNK5WO7YetrgTwnxaRYTMIRU1OwrtbVR3GBMXMFt2QDX6SGhwUnJrTigjTviQK2+wHyGLA4knIgFzOImS6BiTdw5XJhXHVLVkW83Z9LkVR9ynNLOF8Cp2T4K9sKzc9g6iRwy65wxUR4aI81GADb4qHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAbOKMWr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAbOKMWr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so9444065e9.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335631; x=1792940431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=JAbOKMWrojlBhoiJxEKOC/G4S3wJv9zZy+Wb0ivUempI8yBF7fvn/FkTxBzyUCLctH
         Xxh1C+xIaMDGro5zd4lhBLI3JFz09R6hrhUGK8yzgH4UVtg7UjxGxLsv9AVZDAqsoaJg
         T7HR827kyxphZwwAjs/fLcmLEATU21exfV0TzkzwBb4sNoralEWR3zmtxuD5YRReRIOg
         0kZYq3H4EdXx77OuPViCjQkm7YCXtu4wRU36rBtgTRnRVdP/Po3Q+DLo31vRKejHf1st
         O+DiZX27+ec7P10iNbX/LpyVNZdw1wT1GBnl8+ktE4Ec7K0A3/TAu/k66IgwKh2mdxUu
         dV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335631; x=1792940431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=JjC2RKPBgKkXgOBK1KXyyeUooSL/Ek1QLdKLnUITRJ5I/xysyQzgBBk1MY7gJhDBvY
         0ryYjUDJ9gLoMeFYXrymQC4fNCJ3RFTgcqN45OuZrG2KzuhwTIprEQ6SeEdZKG/aliRf
         i4DdP/3T/d9yjcfjiuwVIvtGwxgqD66JVtU1gK0hgZZOfMcchGKKUWeARfotpw9W2vLu
         m85Yw0ybR7dBGfvbopi7P/HPlIwG+t6g6G7wR3psIY2u/JPZaGBUqaO68aoVP2rZhAmc
         9moK/aPpJOQBz3Sw/MHFWH68RW3EYktv2oQrsHPtFRfjaqStZDDtc3ivTaJln2EZOA8G
         boRw==
X-Forwarded-Encrypted: i=1; AKwUvBxLqb7lug4L5PxFIy3QlylDMDipsbjRN/oXteXPkgav4Vf7SSXDK36G19tIMAQwmjDN3gWTc8GRfEkF@vger.kernel.org
X-Gm-Message-State: AFq9FYLjtLaxeEyBAcEq/oVN5CIbZcisdT/0FzYnyqEIXd+t7L+PBzAI
	E4h/BwLHz1b+tjlO9q2wusyEwIQQrJS/lNmRD2n8EZtgD8rHLaKZtwvHdfK2wnWl
X-Gm-Gg: AYBFou0ozFew7izbI9gUJomESPPEGwYTH+66OBb64eitq9+bcYDzwQZNnQRS2PYB5kT
	q6rFIn2BTPgJeu8X0eg7U44WV3wkebx0/J2VcwIgoezCiQlgLG13NugVmEwyhP7ntPgWbYrQQ6y
	dj9DqutCJnHEsF3vHa03DUtRS07w/g8s+neXtjFE/3eBBp9BI7MqzG3vwPSpZIr51VCu0rhjCm6
	rVgbSFXapwb8TN0gLpyA9g8Y0gjQfv5DDxm5GZ7UPjeIK06G1FlEJzbN7Q/XJkTZvE4cK0mfS1B
	nDQ3Z0vNws9lSHOHAcIjU9xnPU9Hq457MREIrtN3T5UzGGYkCVvBf/EHE4QAZc4lSBUiY79SGtU
	Dw7ovQjjQtSavsbMmKBCQx02SFKHIpC2RRcOygZvImvPx/+8rCGJkqfxUFbVN5wPqZttmzrITih
	aIjXIxIUaEQkn/UnmVeiyz1et9V3vzX1CztZvPAMu/u5k9qL48GQ0kL+lYRpTPmco8WQB2U87RX
	UvJjadOU5EE/VCcn4dU2A4zje/gQprGciAggMTE4Ab+Ow==
X-Received: by 2002:a05:600c:c170:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a1d76060a7mr97201485e9.20.1792335630619;
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
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
Subject: [PATCH v13 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 17:00:25 +0200
Message-ID: <20261018150028.1047172-1-sander.speetjens@gmail.com>
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

