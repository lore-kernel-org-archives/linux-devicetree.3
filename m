Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069B52ED56
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872746; cv=none; b=KveEmpZ+YZVTUITjvTDArh6nLFbiTuhATWyWxKKHqq12FeaEsv+yz+HwBFy4O2PXCTds/md4KY32+gq0xfk5xZXWVBEkqvwFlrpI6Ge1ir9t5v987qNRZ1+7neqiDTTJWgLL7lcdKmEG+r+G//gycGBDndf1zLYaOjOjmM4MQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872746; c=relaxed/simple;
	bh=ZhtLn3TWqOvp5v2Vg1A7U7kOpXy03Q7QCNFETA327lU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dhkFZCcSOHAP0YJJu7L/7sxV0DwU5qTCqk+DabrklZvlfkyabmgCg1C67bbjnaQjuQLMSOkd403tL4BuWXPS547MAYD3nH1GNrxMBF8COm8tTkj+B0QF1X2FGuOohcW0+sa6YhHZziM0/BDOLgcvgV4rJmG061dskto6E9bsg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bmKghT1t; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bmKghT1t"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843e397f74so5190169f8f.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872742; x=1789477542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=bmKghT1t7a5gYveq5B6dATCh2XOahAbz8ZyR8KmKA96ChhTIjCQKYRnc0YWeF7ssAM
         Z2dTi9GYiam2aqWEuFXUHY1DNmKG/Lwn4+CYnfaKYziYXUFYdTLnsNTTmpuMSNEoV9Ys
         c/sYwgGwpHGcrrKcHtZg2xNjsLO7fmCfe5SHulTqT0QUgkRPa9BZFgoSNEysAGIFUuzt
         7G41BLhngUOSMjcXDBv7EeT8dzH3e/V/EXFEMsfaMxyIPlvyxgbuUCYGJcffToXhySPo
         x2htp2o08kbyPyiiDRpoiCbugtbK4sHDN/dfICNmwYhtnsHjbQExaYEUSuqEcc5mXNUl
         o02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872742; x=1789477542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=nfcaGsblbaJA12T4MByDZ+iefWVzzhSmvpJQg7p6it1j/W2gNKzsXvS7fpU8zuc1HU
         tFCjcRi00utdE9gQsspU2CptnAdxJTAtIbD6MECN0/UGPKJLwAddP6AYaW+RQsTzRqFw
         Z1paPYhLIxGSvvaS8hvsURfEzW/ttZQDrouUd1m9BASMl6P0Zz4CLODHqN8AeWDu1qRH
         kn+OfT8VXplYdFS0IVym/z8V/FOyeyblodf3ABN+ZRFpJ7Tobdewvbu3etRy1uenBuQI
         r5K3nNkE20YjOTpMyC1Wlakr405qcs71PeAIQRUGClNOW01Li3hZB/hactHlwpqG6x6I
         6p9Q==
X-Forwarded-Encrypted: i=1; AKwUvByeq+UteZZkbdT69TFYZ30G91bKq4A+0P3BEiq75lxbLxFPntvaolD6IIhslTaHz0q1+Qdu/J7FcBWN@vger.kernel.org
X-Gm-Message-State: AFuF++lqawEauC2AOa75+K2sNJEvB0d5byFaBalQcXwGb9mViiKx82o+
	Natkh0OGB+i7nkgdEx+E91C0HfI2z+BGDcXZZm54e4diiH+j1rAbs9VRXcOTRDhVDVs=
X-Gm-Gg: AYBFou1/m0IUEhSA3k8xQhfsgkD0I1UXsBxF6dzqaRuWNr+gfcBnbqKbEFqWa67ju+q
	hD7QFsc4P7qVQlmydRhle28QuO66+BLoLqSZjKUYABNV16MErreWxgiiioQZ5xQdX1aeefb5D+E
	evP6uC6LYfj/PIo34EJZYHxj1M4SIw99o9OR+iPFhMWyJUVXd+Bfk+RzPi5CveTyAEQvTl4K2zs
	zX5yFem0ws3dar1grJrYyMlM7SW5VtBZu7u+/14OtrmrDLyZZEeqRpJEIXox5lJbblL1+Ak1vAJ
	Wt9xoFpLBWxHtGFCaCDhHIn/DkMP/FFjeIkKoaAEHfpVYeOEyMT2bXK8Zxvuo1GWdLkMSYseOCQ
	89x0pYJwS0OABKwoToZHOwt76jVQhFCpwOHfjLBljXg9OLoUVF9U8A8RWOIvlnOpzDthZetRd5G
	Q17/6LWeI+2TMxqJrrneMmV8qgev+U8Y4SqtqU0EU7yWJNb5wy4ZJvopqjlso=
X-Received: by 2002:a05:6000:603:b0:485:a517:6287 with SMTP id ffacd0b85a97d-485a5176ca9mr4823534f8f.17.1788872742207;
        Tue, 08 Sep 2026 06:05:42 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm27618899f8f.15.2026.09.08.06.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v8 0/3] Add RP1 PWM controller support
Date: Tue,  8 Sep 2026 15:09:11 +0200
Message-ID: <cover.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver via
a function. A subsequent patch will add a new device and driver
to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V8:

- rebased on v7.3-rc1
- dropped the syscon. As a result, reintroduce the .remove
  callback
- dropped the reference to syscon in the bindings description
- Kconfig: the driver no longer depends on MFD_SYSCON
- added a new header file to export the function prototype to
  read the fan speed
- added the exported rp1_pwm_read_tachometer() function to
  obtain the RPM
- dropped a now unused local variable in the probe function
- link to v7: https://lore.kernel.org/all/cover.1784539788.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   8 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 452 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 +
 7 files changed, 558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3

