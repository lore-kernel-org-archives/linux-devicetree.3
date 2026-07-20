Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93023D5226
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540446; cv=none; b=YUosCKwuoiLTEy21QmreUWtgqm6i1i3u/vvLlwUQafNrDWwsLCjQZWwijS/UiQ3hXFAvssuJNu4ofrxMO4MvFxsO9LnDOJ2bDpROQ2vblhnWx97Yg8SvCbLZQhQtAkO9tHCxYSLpy1a7d76kYdigMXIGFLJ2iVUawOQVaqEmRsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540446; c=relaxed/simple;
	bh=XBZjd0SYl2Y548z0ARMPGLiYpC3DE5EZ46YkWEKytGw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eQFQf6/vjDUjv0+7coOGX1I7pn6aleqWjadmBI0fM18hCaRgZAGzlxYtneMLTg0JkTpX446fOnXXDrLqaI4GXvURwpo/LVNGTbvK2Us0F9a22BRUJTTabxcqeMP8XxtvawZnk8QBx+KSTodSKnC4qrEKqnVfe50+Gnjgwh7dWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zgt/QY39; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zgt/QY39"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49546c690ffso23628045e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540443; x=1785145243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3u1CwozotVn5LDWLD1V9wVLi4fj6wktLd2vv686ZRBI=;
        b=Zgt/QY39MVCzeqtKXFZQl4FMSThS16NZJpTvHtLRqAPcflNEMPEXHZIizv7+b5RU15
         HgdNSMUdOSiW1JdTSaODUvSZFhYeVeGDRMIDwA6IO7tQRF7EgtrVLC40xY4T+cWq8kov
         /msyeNOgOfdaKfsQLx+VgE7H5es5ZF8kojzHWYsqwSeGMsR1TG/5fupOE5mXh9MEj0fm
         0IhUi86lL6d7q2hWocKNYtwj155MF+ioUMlEpj/kArPLZq4tLdzKOVd2JWno1hShMrbc
         t1uyS/V6KhkJi4cwrsK6AEGGws7r5+Fs+NcAeqnx7SV4GiiIj4+cS7Kk6YYIEKVWcRnC
         +sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540443; x=1785145243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3u1CwozotVn5LDWLD1V9wVLi4fj6wktLd2vv686ZRBI=;
        b=ZjmiuEZPxXWyjx/fADEQmTtu/CHPFhvceojakHpg6DNttT2UPKfqc9FhJoM932fkZn
         viHpi286p+NYkXJCTS/HUaB3ygJyjjYi87xlZ9kvBoQUNtqD6m7Rx1Bs0B8HRcZMb5Rz
         /s5l6taJldi8SZUcxyK4DwtRQbJYh2a8AwxNbQk6dHwr7VOwAPn8AIVr3arbagzxH1qF
         XYDpFnmcSjxoEmnCA97tlYMJyiduSITJtNX+anHriXu9YD7zPX8K0wUmaZE+wK6bfZLw
         de1GkY4GMBjVi4V5Jt8PxWsxDXplqzk23qGjlYadpeVZLD6vzfnVUIQda8i15ev7p41N
         7wsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWNUYk3lLIgmkk9KnfPuft+JUm4SPqwRepF3zdGWPr+3bXq4AgHMirMqNEpWQMjhb8oojiyFopwaDy@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQq9Vj8QN9CHZb4+95H/z7AeHwOUjqckdT6sfI0M7J7LCyAAH
	OrysQarTP+vEkYYK0eDs2HoQhz6McSp32DeP8kAw2yu32k4LoBk7GZSPnqvFH3bRGAQ=
X-Gm-Gg: AfdE7cl7WOQabhI6l+iE8SAL3ujjAqbodUexMPOYUnimHPamrWJ4phVuqOBTc/VZ7cN
	IZV+yNvydrU//ZXTgK+9Iqkekcs2pyn9RZypuPq2fNpKuEqZLnYCMjclge/2qmNnqt5eeNtZAbU
	qaymbfjrE6YKBITbAavZ2c+Ch80JAootBwr/VdJHfe6YP15K8GIlQ6Dh9h1MeLwU9ql09a/daX8
	sZ+Qqonp/JcM+VdtBx5uN811wsMZS6vKzDgAq5hIp3fsJsL7ir7aIxw5KKjj55yqeR86JQAUJNg
	tQ2saNDUTUf5JrJndl95/qZJ0SobpxYf6pn0VKBoq3XtK1pfa2fF9HsTQFqxY6tyxT2hhb+aQcC
	AWepG6qyEgphshEzGfPACBCQun/MwItMD9gpQwg6rMlAs4dZrIGUsjSYNkNmKGUf/EZ/jyT3IO3
	Pju2btwgwWvIo=
X-Received: by 2002:a05:600c:4585:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4954a50b811mr138696825e9.26.1784540443117;
        Mon, 20 Jul 2026 02:40:43 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm15082875e9.3.2026.07.20.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:42 -0700 (PDT)
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
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v7 0/3] Add RP1 PWM controller support
Date: Mon, 20 Jul 2026 11:44:04 +0200
Message-ID: <cover.1784539788.git.andrea.porta@suse.com>
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

CHANGES in V7:

- _tohw(): use *wfhw = (typeof(*wfhw)){...} to initialize the
  structure in the disable case 
- _tohw(): fixed the offset_ticks calculation
- _fromhw(): fixed a rounding error in the duty_offset_ns calculation
- _write_waveform(): dropped the goto in favor of return in diasble
  channel exit path
- _read_waveform(): use *wfhw = (typeof(*wfhw)){...} to initialize
  the structure in the disable case
- dropped rp1_pwm_remove() since this driver depends on syscon
  and cannot be removed/unbound (added a comment to explain that)

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
 6 files changed, 525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

