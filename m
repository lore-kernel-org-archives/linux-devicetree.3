Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870F3DD50F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500283; cv=none; b=ZNiDs73V5HH8KX2yzF0cfJ9hKJMAp8/C+G31/rSJrHfk8CfSXWJICqjiM2GkylOUGH0Adh+InzbbIInoX79YwYJ/37aUAfWTxsg2xlzl7a4yVopStVmNN8v7/sJladPbIcBXEO9UNyIifnQCN0nPyN7v5FzIvyr1CuvnkVG6ZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500283; c=relaxed/simple;
	bh=pwnLdAL7wp0rmLebUr1pKIcbrTLNSQRBMwWuio2DBUA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OelS5tOaTmF7TiQ9AR7MLTLPoe//RPYAC7VFZAWiObDWAUoEL7c9JznCyPW55/QtR79AhP/Y8jItX5S+E6jleAhQnCw+qtUfFAv1tHmOWVqY6RbPb5Gq4ithK7FqDwIoPhmT8zxiSjr4wRmRJw6qjZp3u7jZraPxjBy055SoQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AdLnftGE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AdLnftGE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3275285f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500280; x=1781105080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=;
        b=AdLnftGEO1xCzY4HC3+jrsk73p/0uUDVJ7NTNiBA1Vp9+V503W7EyKWIjN25xrlzfz
         /Xz7BPqtQgAPjknPDQLfLB+Yt/qNajs2D6Wcfc4GwhhCWfjNy9+93tPnmzI+UMBVT0ri
         bAcvBfD+8bRKQzR4jZilG47d1fGWMUhWGkU3ev6OSZoPMq+q46M8qi+NRQxb3vukRyBe
         /rBfwIfK03INgM0imkJmuruS+S9CnWsxcGc9nSuN7sk4NBmZYyJOrrPHBc1A0JXBSxy7
         P9DTCwnhEXgflY7seyovCS5+qRn0OTl5eFg01Rs/2CKME8gO9Z9JTWWhbSe2Z/d4gIEw
         BFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500280; x=1781105080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=;
        b=d5v93rfphNGEHyNxn9SpJnx8B8t0UgiOkhRSLrnY8ngaNKrJyHxLOwWOH3LdhR43DB
         m4tNsv1Q4S3GlrUJGjHCzLCXhuiHS7wehNffnKp8mp4hQ74+iaVeJtlei+iUyJ9XzlNm
         /s9Qp9jwVaBWBdAyuxmxZQUuSr4oBTMFeB0+BTrzB2QyrLE1bCsTanKe0O5+w5ph2QZA
         zx5hxM4Sl6dEgb/8mFsha0QOUE9Rb+YNGpHMD3Kl4AQ478UxQgt9JOOpfFE9FyKJD6vZ
         WAzv3nCW/vbVTODO1cCRvSmvNSxbETjz0FfyK18LKFDFD4WyZbuJxWyN/RggwI655HID
         LDuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5sCab0Eo7KgAzUYFXjF/QwCzoi+wyhZrzlTOQIH55HgBdEy0d5QbOFx/SZ1LAZRzObPjuJ6OLrNKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmlIZ6gO+6jw0vKjiQOBKRWqEN8GWxWKpPFdatt23UVACx9jh
	mfE+Fbu0Bc3HgicvSQ4LGsx9zJp6ib9UaNkK6Mq7rL6Jze/oA4Zd6GiBQ2md06sMf0w=
X-Gm-Gg: Acq92OF/XCfR7NZWdK22kyTMmvhmuBU4RtSDNH1xDvY2XGZ6BGicbWsSkNp8DmsdWMT
	4AXs+iuBh37/64Ad6tjFU4eaZGlMLkDw9Wr1K/uefRLwrysycXYqSaPDwDX+IN/oJaT7JCL8EIX
	OyiYUtVOq00x/qTqnPHPzlPYgIKcaviR9/TMjJ+dGRNRn7MVAiCfxz6uN/neDgy4iPYQpv25HCt
	wgbSQpKnrY3kd+qZKuV9b5lR9fVErP7DnFl9pf2aUKnzKq97uI1TGspPAKqntD8m8Gpvym03Kph
	hWiRF/+mzP/hXoZj+N9jY/HcPLOvprUGJgCh82N4E2AcCGJMMQFzkHnh4NL9Y+e/rnUnKobeXgq
	a7oIhcKsbxbRvMKM5eGstTeT3HAGwhO+Z4kgk6qo8PKjnFyTUYsYIw+S+A0tS/bEKT7E+1rdO84
	SGzEUhzvjiAo2kP2vqpZslaixrl088T893ZS+DsD992UA=
X-Received: by 2002:a5d:5710:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46021844ce7mr4341301f8f.25.1780500280187;
        Wed, 03 Jun 2026 08:24:40 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm9185525f8f.20.2026.06.03.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:39 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add RP1 PWM controller support
Date: Wed,  3 Jun 2026 17:27:43 +0200
Message-ID: <cover.1780498640.git.andrea.porta@suse.com>
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

CHANGES in V4:

- s/rp1_pwm/rp1_pwm1/ in the DTS, so adding rp1_pwm0 in the
  future will be unambiguous
- the driver can now be compiled as module. Since it cannot
  be unloaded (due to syscon registration), substitute
  builtin_platform_driver for module_platform_driver.
- preserved the polarity bit when setting up the channel on
  rp1_pwm_request()
- rp1_pwm_round_waveform_tohw(): capped duty_ticks to be no
  more than period_ticks, and adjusted offset_ticks
  accordingly (best effort)
- the syscon registration is moved at the end of the probe
  function, to avoid leaking if the probing bail out
  prematurely
- fixed the erroneous casting about pwm_chip/rp1_pwm struct
  in suspend/resume functions.

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 422 ++++++++++++++++++
 6 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

