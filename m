Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96B3C9457
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830023; cv=none; b=P9K0d8xPbQ4q15KD0kXslyaoi6UpHv4bRn0p8hTOqS1YrMiXtG0kQr2OYbZ2RLI1fM+I66pU8AIP9BSxLtUdxns2X1qGtWJnVZ/i7q32Dr38K296Z7TIiurDRF/J2qFfvB/uEXkcR/4HGHLUFqDYUEe8i1lSG9yorCbWnfSt32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830023; c=relaxed/simple;
	bh=FvZG1pUZPT0gg2fu1jQuMRQEO44rTILWevO0vYX6yYs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pPyNXXSQTSk8qBVH9AiANoijz3E/ZYS90mJlrY2lF4SmDJv81uXDYXf59I12mVZaTuIUCQyg2a+VcktnLPX74i2j05X7zO9OFlipzUS89+3404PRML1jEeZibK6Qpvzu8m6MCKv2KXzRmBA7Iug95rFBtwAYI3K2AL6SeT1/etU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dfpZ2L9s; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dfpZ2L9s"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so17866355e9.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830021; x=1776434821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JW107L/IStc303NYPPlArrLCZGog0RXg1/LldkbGac4=;
        b=dfpZ2L9samQyLf/3c1FEFXMm0gQXGfclu8X6X7kDsbQX088y8e2qkcuOA64WsSiZjb
         sCIj1ATYs03hajMnMXlhahsuE3mOa5PPi1y2j1vQrobYIgbynIlahohAQswLOyg3WSlQ
         jBTle9e5tHQczQnqpdgR3tS4GEKHybGqXfo08BdB4BGWfCnbqRbYzS2r0xKRtezrBrme
         A6/yfpCDl5oKkkfsrSRmWVGSTckXGcsFZ56SdLJ+jljuFJftwhYRAro4XhZr9cP50lKk
         xNxWYhwOV1/sohKsPDbwy3BrvM3gQztNnbq9EdeYA//Pxdjux6UZJRqGKU+RGxfXBNsF
         4vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830021; x=1776434821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW107L/IStc303NYPPlArrLCZGog0RXg1/LldkbGac4=;
        b=N2VE0Z1BET+nqSdBfc94YC5pZOFAfTm0TSlAqsgM7Kyx/I1svqr5BKbTZbG/wJEs4C
         txWbMffihp1i1GZuyuVQh/UiFvtyxISNGl7WaDwt4TrWS6GGcV0f1GZX2S1/Ks9NIbJR
         kK2qlhg67M3pBB/oeFaU3FB4omaFBOLJvaHfc9pspNrO+/u2KaZ+QhILXMM/jK1CTJDq
         J5JFNOIx/aaI2UTPsK82uhm0SLIYYpEGVoU1i6N+yLLQlU5bt8acEW+tcjJGH27GIPfV
         cEuFC1X8Y9ZAWfsVcJVgLAf8lB0SBdSvATU+dG2soj110/wrxyTWgyC9xNqN28VpAR1J
         n65A==
X-Forwarded-Encrypted: i=1; AJvYcCVLD899VBt1hZSWaULZZjSoCuHyoFzkeQeDOtbWFVisHTPznSyKyvycBPIfeP6fYy7uYniRn6v/xlfb@vger.kernel.org
X-Gm-Message-State: AOJu0YzojoEOeoZYl7LMRi46XAnRCNjMg3NiPXsXUGUEyqz9wxVoyzZm
	Q/L4VR4oJ1H6klVaQKlnjlRaXZzZo1EGjRPm1Cw7ULrOVT00Sl9lnoDlB7UU8j0iUVQ=
X-Gm-Gg: AeBDietrZntrRbaYxmKDwd/fGjoGz/poZFoqKHw9uK/fmokl9f4xSkoNpjHJ+/Y0cYv
	lRxezpugD1HdEWccg5Ub5mXznv38vv/91jF3WbbAV4sNjw3GCmyc9OciKfqEonHnSuhsWr0QJI+
	mRauQ1nH01AWINZi6LDrJhIuNYhO8s/Ug/7sO/pAIMk0eKDlriEbP2OLEZlJkV7EkIbAun4ZUjU
	h5O/fRAxNlXndCP/y2SC8SuM4vaBiMHFhnUsKaUML8Kia6woR6KrpvfxVUapQrDHPGge6DXrC6E
	Gvw0fmWnv11dAmugv1tgRVf52V1tPoh/RQJ84BgoFPpqn8b7Eu7Al883jlSlvQ0Yu9tyyJ0dRID
	EoYTWXqR8PUcubciZzz/Z+5yg3hqHGvPeBXAiDh572c9avrP2SYYCO8IXiKHXi67TNDZrd7uWKX
	Qtejl74dQDrc3jNZip8pRrkUblRYe4GhBN770inWjw4Go3JagVLg==
X-Received: by 2002:a05:600d:1:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488d67c720emr38283325e9.3.1775830020792;
        Fri, 10 Apr 2026 07:07:00 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm8549422f8f.21.2026.04.10.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:00 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add RP1 PWM controller support
Date: Fri, 10 Apr 2026 16:09:56 +0200
Message-ID: <cover.1775829499.git.andrea.porta@suse.com>
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

CHANGES in V2:

- bindings: added syscon to the description
- bindings: changed additionalProperties to unevaluatedProperties
- dts: reordered pwm node to follow the unit address ordering
- Kconfig/Makefile: renamed config option to PWM_RASPBERRYPI_RP1
- Kconfig: added dependency for syscon/regmap
- driver: added 'Limitations' and 'Datasheet' paragraphs in top comment
- driver: all macros are now prefixed by RP1_PWM_
- driver: implemented waveform callbacks instead of legacy ones
- driver: dropped hwmon device registration for fan speed (this will be
  handled in a separate patch with its own driver reading the value via
  syscon)
- driver: added new regmap/syscon to export the registers.
- driver: added a comment in rp1_pwm_apply_config() to describe what it does
- driver: added a comment to rp1_pwm_request() to define the purpose of the
  last write
- driver: new clk_enabled flag to deal with the clock on suspend/resume path
- driver: clk_rate is now obtained during probe right after exclusive_get()
- driver/Kconfig: module is now static only and has suppress_bind_attr to
  avoid racing with syscon consumer drivers and with syscon unload issue

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
 drivers/pwm/pwm-rp1.c                         | 344 ++++++++++++++++++
 6 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

