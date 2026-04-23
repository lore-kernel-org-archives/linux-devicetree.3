Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F23BADBD
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932850; cv=none; b=s0oTPlwb2pz64rMQ8cixkaezy6Ybho9/p0F2XBPja0KYjOBAWLaHZyB1cWfNA05cibNSMpelHb6+mjlINbaSUhotCKr4nOs8t59DCZTD5wU82hPbuJqauGHQIlZvsT6baBztgVDgNlOUqBPE2R2q7JjFHLolylSZPi32SplE0NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932850; c=relaxed/simple;
	bh=Sw7pGrtm03rFb4w9v39tqqiV52NCp2AS9QRYBO9QZEI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EUAjrVLc+o+dboYFDvAnhYIguF5O6QAF8KUkiLE1uWrukEdw24MqVk6eMbV0XReWCFkXoxOyqEI7fWlweoOnKnPxKQNe66pqT6KMM1RBOaCTuFzXCw3rgQ2LyesUkqhXPKjeBXxAbR0ROUywpW48B/gx+DL7YwkluLbI37fBfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ESfXel+i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ESfXel+i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so60252595e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932847; x=1777537647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ9c/QPUCIYiqT/6G4zjKY9VFibIqgyzyOicvyBMlCE=;
        b=ESfXel+iXEhRu8or/8B/CHlG2qgtSM62kF7DGBx3hjExRqRl+WrXFfdZlPjzsaorKC
         JBfinXWjSlvnQGE2p7cC/YHkGoh7F08x1AwSkOq+hwRdkomRygM5qyp/H6m3Phcviyd4
         px0HMJKigULib8w7RAO+A/zgSylw7rPBM+Y5E+hnEAuYWU/xdVjkA1Dy6MacGQTdlIHL
         mj3B3wsrlu5gHf+puzWtwVioG7XmZ6KsWbLvwkQ33yCyionpR2ExWm/HDoCDgow81nDb
         VdxzRl7SscSMFVLHI+Wb5MbhCMiw5H7IISwH6elm6rbkvUQ0lm3Qg66amYNTeJ0ubPHz
         vyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932847; x=1777537647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ9c/QPUCIYiqT/6G4zjKY9VFibIqgyzyOicvyBMlCE=;
        b=NgkpUjAg30Oz0AR+cXdDjm8V6vFsB7VMCbkI4wUPX1xEo1aO0lE63EbbLNkehwMKmu
         6DHd/69wRoP7VNfgLGZOAAjjwmNRHzeJUxxQnwXwkpK83021cX+Inl2Vmtc2bfP1auXE
         L7Atis+MeSBTVkXR8fJ+uprya6SHYM7wM0hn1yR0r32VtX7acml1kGnjllOZbQhhLXbd
         EJCxxi2569OaGeX6qyvK9XaWxXW/knNwwOI4Vxl6smAYcMFxnPkIomtH351+jO9gxydL
         p3IMfMXd7jWT8X0fi3htuFw3TP4tYx38hyGL8cW9PO+GU2rZebDeK6gjidI2ISqLNGP3
         7wQA==
X-Forwarded-Encrypted: i=1; AFNElJ/l6vJG4kLWWZj2NygzpZTnbPB62N8YHdTX6O4M/yAd5R9qtXjZbosMUswrGczsyZQDzj/FQPGx1ACd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YXT7Gm06F7TXJJp34q5ZQmcW0EOSxnhG0Lpx+LQeN0wjoyuT
	J+3Pp7w162Zj/GafLLkfnbA30ffuVbd75p4hun2DYPVkDUXgWnhMN8t7LCNVf0vbK0M=
X-Gm-Gg: AeBDieuQQhl+TLDz2i/PHaFd/koliJ2LhQz19Ir3YE1Bv9VIDNu8HiO70p7Ob3nRK09
	PnMGz0VOAjR7G7M3VV4XePl/hkXjuKVNR77QQ2MC8eO5HXoIHK+N6IaXzQJW1W+JiR0AcjpRuaM
	5AMKWNoPmq8IpVXZ/S4R9u6T0qNfbtCkhDkXKILJ65XatBTo8jyR/PhA+L9NdhzAt8hK5ZncA2w
	Au6CkrbNcu8ctFXd2sAlhMNpFzg4dX5pddvoVNwIRLRdp/IK9fESjrTwEKg/EWm2xDRn0FCnOX/
	UzqCxEu5MKjRHdvGYYOS0V6CkdSv+cw1SnRUcWqK/SG/720m9+a0HgamN2kSXlQWhQXlg4w7ef9
	zTZxfP3k79HMRGybOqdiyr8mKUw9f8KSiPb5gqFvhQhEqXhE5IzKxBwULME42ptHC//cDigERoR
	LovL0SAcaZCpDI67MIpl+PWeRBdfFW/liJ+Mi9kAcH21GoGBisYUT0ShopjKn57KRB3YNrIo38P
	IxkQ9j1xOYmOJ3M8g==
X-Received: by 2002:a05:6000:4313:b0:441:2ba8:79f with SMTP id ffacd0b85a97d-4412ba807bamr4088356f8f.37.1776932846520;
        Thu, 23 Apr 2026 01:27:26 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm52641843f8f.3.2026.04.23.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:26 -0700 (PDT)
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
	mbrugger@suse.com
Subject: [PATCH v3 0/3] Add RP1 PWM controller support
Date: Thu, 23 Apr 2026 10:30:18 +0200
Message-ID: <cover.1776932336.git.andrea.porta@suse.com>
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
syscon registers. A subsequent patch will add a new device
and driver to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V3:

- Refactored all the register macros. They now have RP1_PWM_ prefix
  and follow the register name.
- Dropped the tab alignment in front of struct declarations (use a space
  instead).
- Added a check in tohw() to test (and bail out quickly) in case that
  period_length_ns is zero.
- Probing now returns an error if clk_rate > 1 GHz.
- Added a check on minimum period ticks. Return 1 to signal round-up.
- Fixed inverted polarity detection on edge cases.
- Fixed rounding errors (in both tohwi() and fromhw()) in inverted
  polarity calculations.
- Dropped a redundant check on period >= duty.
- Replaced memset by inline struct init.
- Disabling a channel now is faster, skipping the duty/period/polarity
  setup.
- Fixed an error string (s/Fail/Failed)
- Used %pe to signal error string instead of an integer.
- Added several new sections to the Limitations paragraph to better
  explain what will happen on edge cases.
- Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
  selectable periods.
- The hw period register now takes into account for the extra tick at
  the end of the period (subtracted one to wfhw->period_ticks in tohw
  and added 1 in fromhw).
- Added .remove() callback to free resources even if the driver is
  not unbindable/unloadable, to avoid accumulating tech debt.


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
 6 files changed, 500 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

