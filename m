Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DB31F984
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272698; cv=none; b=hVsuX4aZdEHJqKhfAktuu524oZPxRzcGmIbI7iYus5BzIxXS9lcVT9RPmCxWk7bgjuf7dbT2SiwDKd82hmxx5NA31CVp4Ru/O8Eb34PXM1lJJBu63h2cJCZ/tnMQTRfoJ28nTbiKEvad7ch0U4j/EMSc/x2unhVAQ+1IyWKIyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272698; c=relaxed/simple;
	bh=7RAWRz8lfOfarixxNlkFfs+YNhLZePGK79/sjOHb0aM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Xo9PLZv5hKT6GXTHHUwPkeYZOE8aw3K9RU+8+XrSmOWhtuImkC3RatEvII5uP2OG7TbXndTm7Ebj6HbSE3cfTfNFyS7eNlTPceFPaRJ4/AqV8GEAYld0AlK8V0pR3FAhwlW2it4oR4/51unZ+MJpKo61jZlVYq7BEeDPZLSWjA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gE1sjFe3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gE1sjFe3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so10609445e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781272693; x=1781877493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqg7EuxMIGmSumS+tdgRe8gbezZdZWcHGXgl7mw39zw=;
        b=gE1sjFe3wDeow1UANpXJowHeT8qe/uwAhvvEzt5VPJybnWZBn7QtGJiyQdhuCL52wS
         O5ZZb30mEVmthfXKlmIaBfDjCBk+mPjfCvELC3cYT4Zk1s73/+w6jZa/1wwIqjvNlTRq
         bavVIvEGbPprnOVSeWJ9rU6qKTeIhBw/KzmyT2BTGtw+njq6WRvFeduwTTQYb5/VLOea
         gkHIY0cWJ4kbU/C/da7L/s48dOhhAbDTW9Zbp9kYl8sLw4GHyX/zC4E+sUJ8jQPMK4ml
         JIOD9paiWNSjgXr5Pcv969nuyT53eSb33RD0IS1Q9/GsCpuiJ4w0EYUHy/P5yqB4BKL+
         Q0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272693; x=1781877493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lqg7EuxMIGmSumS+tdgRe8gbezZdZWcHGXgl7mw39zw=;
        b=qp+GnSuGhV8aM0ut7W47XEF8Ei4TqO2ClbbkKW3A2ozOihwbBDC6Qu8lVDSI3Z4T9o
         pKZCe4BqC4wrd02sqWaXIgymofsvTXu6zqLCSvMlJ5s/ZyXK6UUNWACZoem48hiuN603
         iksYsv4TK4onEM7/ZXrFE9+uesnBDfdE0v6cdgovQuTYv1FsUEMASVJV4Czpa62N4/yh
         5CwGc8osQFmHalu9dt+GrSv/jcVZ94fjzLjVYDxvAu7AylYG3Rouh3r2T8owOye+mips
         PuouXHnYw7JX1W5+rmugnSD1MBbCQoJ7wPWxxL8HJCCXA/g/TGPU/it+rKpxmg/IuoHo
         hnRg==
X-Forwarded-Encrypted: i=1; AFNElJ9/gFFmffkTjp/7VzqIJnOFln54VU3/+wnfMdTt0eZc6oZr+vf/fwVcf1lR9DAzTE8T9efbgyq9TexM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTllFHXivND36A9yA0KVM2LwLBYLOhIUNY+dZ6X5t4DNstW5IB
	pwL2HT7tlXMfvcfGEFNOCAX8tAeKufOY95Oa5JRmy9QiJey8lJowhnO3LiGZENeJWa4=
X-Gm-Gg: Acq92OGkFiGfuNMU5DHYHl8aETiubyMOTwjr0m7b9c1VDA3R8xslI1UnaczKUe8a768
	9Vw1OuBBEBaJ1AOTOpoX3OEVddz7PMKA74X2VlSRZ7OFEENdMSJ0B7S+KbtAK+iFCAjibUyjbAO
	bSAjn6pymz9RrdLLS3Yof1vtoLm0kxWPAO6NhnvDl6Jo5P2ccbyZ7bmt/3Vy64aJRKIFmOHbuoo
	a/I4dPhftZV5ZSvcRPBRZRETFuELVy4Ib3lhyLybBW4OHffJIKdqRYfl8n173ummkooGYQow/Jw
	b0m5JJuOFpfBeYWVhCgKigD3OI332gma6AO4ovsNfoB/I8wSeRyTXWHiT6ZkEsPuS4v71H2h3RJ
	GjsZXo9tPDXff1Fg3edne/2zehVW4sg3YUYY5QMBonxO6G9dx8oWQxE2XnaY5+/qcmnp0sY387l
	bZWkn4CFWq01Pf0TMDaC30xAas+DOaJYQ=
X-Received: by 2002:a7b:cc8e:0:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490ec4c1396mr28431285e9.2.1781272693533;
        Fri, 12 Jun 2026 06:58:13 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c7ea21sm157969205e9.1.2026.06.12.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:58:13 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add RP1 PWM controller support
Date: Fri, 12 Jun 2026 16:01:25 +0200
Message-ID: <cover.1780670224.git.andrea.porta@suse.com>
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

CHANGES in V5:

- period_tick is now capped to U32_MAX to avoid breaking
  monotonicity
- period_ticks less than 2 are set to 2
- fixed two casts in fromhw() that could led to an incorrect
  truncation/underflow
- when disabling a pwm channel, first set the polarity to
  avoid unintended quiescent level
- in probe function, fixed and error path that could leak
  an invalid pwm_chip struct


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
 drivers/pwm/pwm-rp1.c                         | 424 ++++++++++++++++++
 6 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

