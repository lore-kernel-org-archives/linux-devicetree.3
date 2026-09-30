Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B65449B2F
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757598; cv=none; b=HEhXUAbzibNReYjuoZCc4ilUcFf4JXh7whTuTDsFvh4OV/7Nzrb1O8eIvscgy4dmORwUDnYy+gE0y8r0v0BSJRfpz4ii/0uDLVTukCHhcNwZU6VR3qfHfg4gUhE6bPT+qSwwUBYxQYeMfXSHE3SF/smEr14nsLOudAGJ3ZaWAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757598; c=relaxed/simple;
	bh=CKwFKnvNGqJJ/q15B+A+DcP7BJRvr0+1X4UoGOdQS7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4Y/OSL0DrCz4CRZMIoWhSvGnJis3e+duZiFKECD+E9OUQrDcLJ8FKlsBIEB+McGlIwSoewLDrYMeF3Y9ywb3z4iM8snzkoUReHUjW+SBtBdBbVUMj+k6MeE94AmQOks2jGqDA/e8HkTmprVqE9WwkBmp+hLSoeWusR95rNw0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBcJKsnH; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBcJKsnH"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so212204f8f.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757592; x=1791362392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGBjcoy4aeNTw10s5CjkbJAmRuqjAutFBgcl06eNiGA=;
        b=JBcJKsnHQRqMNAcnd413MyS3kW4bHzpbnBDdQacfmEb04UddtkB9ngar9tkELCmSxI
         tiPOjtzX2w5+K4hcWQd/vNR9HpTodRcVGTlYoxaareTrh0bJOmaOYittId8n2W+k3G1a
         HHPsvs+x0iV+0F20h7BcmSuIHEiInxaxzFctuJlB95nXWfTo/M9ukGacvI+Z32zEjlul
         OIBG+fE22qeCgdpeWenHjPzTMsRGHZlB9xchHHQbzIz3qdyjmOep3TpqNjmd014cuXki
         ep1h+X9oukOcMGsIgdtdguz3KISd6NsJs+S3uIYBMNmxKzR0R5RdJXw3HFIYL3Mu5JYI
         4QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757592; x=1791362392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGBjcoy4aeNTw10s5CjkbJAmRuqjAutFBgcl06eNiGA=;
        b=VlB+BAh522FaDHxjWd5NtaqPTSIMphumml/mM5Wi2zSkhga/H0cKbAurr3L80l6ljB
         6T7xDASq7VDETZ9cNk07a77+LdpNQvg2bLaNTszkbP94I270uKGTIO7jcxiGap2Et5u3
         ak6BHwybdQDfzZ2Zhsu/f4i9T5gvBjFRU5+TYQazGfUmYXKOp66+42f+Q6UAvynFyuyC
         PQgQnviNdW4/mDUp0yxpqO22q2jrqWWoB0vAqGfompcsDwy0zBpZjeN6F5qDH+/xP9hX
         1e9iCA3kQJQF4+p48qNJuaccUth59em/2D8BraV3glebCwyV81zlVcuAeBlqGLGRK360
         T35A==
X-Forwarded-Encrypted: i=1; AKwUvByus0wUk2ivJB42P/qAx27gOTGMhH9C4ZPkddowoZO7G04AvZEK1011q5St+hur1N3b8D6LtVGmET7h@vger.kernel.org
X-Gm-Message-State: AFq9FYIUz3YoAsESYux/M7+zObQA1rh9HXjao70Fbqafp6LlW7BCcQOd
	PwE9vDCqiOAGsm7vWWktHZSiuF3/aRFYzrAt4oeGQUbgsAD2nJCCrjcP
X-Gm-Gg: AYBFou1IYUz0efljNafTOxj/VJ/apIVi27J83WbJ6+4C53Vmd+aewupuS4zQM8WbDnx
	wnVlUTjeWT3n8YPmGlF65dbtUE/QbBcgG3aFDSZVUff19CbHf89qf2bnc+aEjFA908oNhHM/rYV
	RRMxq7qvDPnTA0Ke+w4UDlUn6KZoJs3Qf0hoDUho7VBT8Hy+7SgBZC12dWQRXlUi7fJGtcVzFOr
	3dbc9KOw5kHuWb7WrRvrrpC+re4/sT1phO8H40Gl1xFtBG6SUWkWyqAUTolHGbn03aIob6fv0um
	fUglgeFBOvZebN3U6za0KcFLqRVXjrW5OPUY4Z97CCiiil3CKA/LzD7BJHynfBpl3AXvOp8BN6a
	rY8Zp8oJ+V8K/s4czXKHsVSY8RVH5MFK3/Cx/6iUYAgx51YjxY7z9r15hAs/fcCVG4hIQrrfhCB
	3JzSM040nH3STK6iaDyPnqriD8nsusW/FjhsvbPnfL2EB7QNdvXzLtKaulbyBZ03Vbj3+9h/lF2
	Xuqj/SD7RxE36A9Kq5MRSuZhMhfe4u86RlBb5ffDMWkgu4syrREM+p+
X-Received: by 2002:a05:6000:2301:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48b02522f7bmr1523610f8f.33.1790757591711;
        Wed, 30 Sep 2026 01:39:51 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bfd2bsm1757325f8f.11.2026.09.30.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:39:50 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 10:39:20 +0200
Message-ID: <20260930083922.484885-1-sander.speetjens@gmail.com>
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
 drivers/rtc/rtc-raspberrypi.c                 | 279 ++++++++++++++++++
 5 files changed, 323 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

