Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87048380C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256149; cv=none; b=lC+RZDAuVgk7P+TygmY2C5cfhTHbvclA9SBkMADZzuFPeD76TUGyMNhc+LnacMFpvc3NQ6CUyBkkw/SFSLJ28ftSVSrTFYHAiIzS7YzP8ZbUt/6LOsU2QNT5FDVN7vmpwjaXVD5Clr4EkLlrPRaNCGyLnYkAIUgqqDCcBOxhCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256149; c=relaxed/simple;
	bh=kPTOZqyJ+bUaS6nWmMWMRPMUKRm2JvBCA3sd559mBoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OoLqJ6S4QheHgeXz1modxuEPpYmAKlA7a99vLYdwdOqDdbN9bJMxt5AWVZ6yBOMdnq4FZee53jiSyhyVk6uvvusXGLMGaXzklTwNnkXwwfn62dyqY5TvuCXqWX/l8bw6dG92+7X+jdqAgLoD+D5MI30eLBmqyJWgLrCw0oBGStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsQH2RQl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsQH2RQl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1693568f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256141; x=1790860941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbOHcUrqzD3VKthCx7J3x5Mps25Ab6sTBEfuEjyv3Oc=;
        b=PsQH2RQlxa/HArHPjKWngtSz7BAzIayABd88w8qCiHuTEGbAYpR8xoMctwfgMi1PgH
         nUkPbK+s0WfmYD42lEUOVdqbr6TXDYXyRP0AUDqqLAg1QssyfdHjcmjKkhG7Z1FST68r
         Z6VU+dc7C/BQI8jUiJrxllyeMgf/8/T/LSJeqCi0clV/pRO/BoZOLdk3XWfRlFpoOKD/
         ZPq/DZ9yAwGui3IVqk1nDlo0hg3wzOPGfN6/bncA3eitOOAQnNcuJ5f4sqEai3/BGeNK
         ghI5+tQc2NIdLmpp71huPBE2SEixkQGmr+fgMILYmOhmywSemKzX/azZp0w6a0oIHNaq
         dCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256141; x=1790860941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbOHcUrqzD3VKthCx7J3x5Mps25Ab6sTBEfuEjyv3Oc=;
        b=RcA64v13rBJvRdLMyQES7wCcrI2gqzsT/4I9r3AVLGcyeZv71ATsNP/V3DFudmL7YL
         w8OiM1jwEFVrwpNZ5hSWG4ZW6wS9ScfVuZxDPtPyjFn9twvfExbdYcccDkdexWGSCagN
         SE0C4KuiO9go4rCX9CWY+cCdv5vdIKqV3t1dPeHJ6/Sv/X039Ta4HWymdL8/4P4u1/a0
         kTpvruzQFhQuRLONI+kE/eL/2PnKECUre3FTh0jxvHr2rZcRDSmhp8AKGhkcN7RNm/Km
         kbvVNBziVfYvsPGAjDboi/XGEUOUkbHfkejf2BcGyzusgVirmRbHG72cH/e6wAYFdzLo
         7hQQ==
X-Forwarded-Encrypted: i=1; AKwUvByTuiQXmNbH01aqAlpY2SQDlrkC44DlgNUc5R19YjXTcmUTT55ARHythTnHcxl5eO1byow51HuoF60d@vger.kernel.org
X-Gm-Message-State: AFuF++mZYPzGFsr1HclgTztEKGJOSILBmmflw3uU+KKxD50gBELu1F/3
	AMnWzro4CggRi2VFK03eR7lQhUhVbr6C4raRU5x8iFEpSVPiMqONUhws
X-Gm-Gg: AYBFou0j5j/M/IEEGNiHvbyP8OrxmAPVAUhXV/F5bKSvZhNxXJsCkA03ZibWLh9HkU2
	4+3C/ShLJQofG/86N7kFrmdQ1OaA9Sa3ZUMFprjPiRqt4evsuixFxb6wQqP5h91sQK33mjPghJO
	FDvDkaI+fqLBLEVh0UHWqHjW0xznXqutjNE++mo4x65sIo9ViajVMTthkmNNN0hEJ4Zcfk31R5I
	DzBaBTNbWYZ8t/bFyBkep93s6dbSJuiaFcK/D3wNVO/omzMGSQoHJNHxG9z/iSEsjd/VKx14x38
	XPOZnhtMOZKsCl4WpQhc1r6G/6yiYiL4/6o+Z31n+CBFkVl3/RiJGRyMO61LZqSfG7S2XcWI3dr
	O3H6LDzYP+vKWN5PFQcqpOD0xvjCOUUpMAv4qqhCD1FuSEVL6ZGtVqOybjhRk94rXmMaPrQc8Be
	hUsOY0H3VmbM/SYFmowWjZletNL9PfYwn/TCTftLpiLTzNUmhtl+KYh+G27XvcXlO6Ufuwt8Ta4
	GWztuJSUwFjEpF+UxaLJkdehmO6Bkdempe/HZwdaiXBgA==
X-Received: by 2002:a05:6000:2007:b0:488:5fa4:e2cb with SMTP id ffacd0b85a97d-48872abc779mr3687759f8f.26.1790256140353;
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm14642949f8f.16.2026.09.24.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 24 Sep 2026 15:22:15 +0200
Message-ID: <20260924132217.1281752-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 244 ++++++++++++++++++
 5 files changed, 288 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

