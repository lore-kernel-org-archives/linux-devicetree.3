Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE571C2AA
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098129; cv=none; b=udUryCycCycd27TDcRjE8c7H69cwl0OqwkHVxIBFvKH2r96Yv5nS/qZz532k/zfIPx1rOC0JJPCaQaavrtZJXWJHezDt3KtmvEnnbL/JDCvT5mBC1QzWzZ3pyFAUEBBykafh2aCRzw/fjHh3VNP3qxNYIRgcxsi6FbD1JEIzO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098129; c=relaxed/simple;
	bh=JJntkUC9rBut4Ox3VlLSu6avviUJ1OqJzK+qpFIyVRg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Mnp5MVcGhe1O05y1Nys8hxqKEI6ga/AroWsK9o8N5Hsb671Uw5uJT3Mn4Ju9gHcGz+JUm6J6ZQIz1+JtUcGT7/ZE3TlSWGaCYWlu6/I558/nKkLe+TC+domga1MiXfN16/iY+TVRDC0fFbEGzEf1exDY3Dpc2uGR0oZdO4oE+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JtqtdeH/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JtqtdeH/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so18173375e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783098125; x=1783702925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/1K0BV/G7Gec3azOultr+oMUL4gfypJwfwS0OJxpVY=;
        b=JtqtdeH/3/Zw1T9WgVatOVDLfv5RmS4eyNm2nTweAFP3qH63Rykzd5Ips/R+JcoVDg
         cBl1BjmJlOSCwLwYAS3VvteW0q8qVfSNYyY6f4NzyXszgP8JMoQjhm/LsNhbBc8+8/4A
         zAix9djFdduiaDoN5LVb9J3M6F7nb42xOR1abnHwQYq6s+vWdsLfHrL0TljpBN5I+2xp
         Xn6dQyxhOvjkpum60g3YE40hQNJcn7uag7uT+2mEEYxqUVFBCkWDPnX5BaPXkXCMzHhP
         lWQ/J4jpH0cMW+FARYddzOk74w9QwMz6Z7e9nH8sFyGsxnQuKGlEEa+JrPyPlyh+eNaU
         Q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098125; x=1783702925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/1K0BV/G7Gec3azOultr+oMUL4gfypJwfwS0OJxpVY=;
        b=jyKbCSqYUrVmBl2BD7R+guNmqhkIM/rL8mNtE0lXvDBE+ujBWC46rhT35lqGyInQE3
         EGU5xOKxJjxfhNSHbdifvFEP+sJaYe1kgB8QXR0pDYPW9oYpMmKXUKW0+1kQJOE1gDMs
         DttFl8fKHpggAlfRQxMHICSRtQw+pK49pI9dhfbiVVjLNf+O2EIM9HzsoioyXrpFiAg5
         SHmjvw0KPERzK79s56av/p151bmYyJc77Uyit6l6kEmaV3SLvikMkJnz3G06oyGd/roJ
         n3oT/9Sy8V/Cn/QP79SIyq4BCl8gXeo4oBUu23YHQhWY/Z+yVhfLczgwAxA2I6hdoRI2
         pUDA==
X-Forwarded-Encrypted: i=1; AFNElJ8Eb5kRCYEeYH6sVizhwd74dGZ/wRB73P8hF4hiM5BXHYNz4mw2RnkZO9CWeoTr42lzwHj5Rupm9M+k@vger.kernel.org
X-Gm-Message-State: AOJu0YwZA+G1rQMWhpXDpiodHRL5n4Jno/CWbiDjlhJxMlq7B7KHWKRg
	hDOvMoRHvfRwGi5zF1tT0isOfsS9scJljq7vx+v3OxzlWJcvBMg9c2u7AulZuPsQpXc=
X-Gm-Gg: AfdE7clrEcj0Y+1ZLnIuT31PIZnh5RwSOZBg67OWu2eFeKEOGWkfY6D4EW4n55V6RE9
	D7F+3kpy+Ejo0WOtqp5Le/jg9RhjG2aSlnKS6/Fa39TzzbTH2kbGd6UcherYXRDFk5CrHYApdZm
	K+bSaCMYXKCF/U0zqIvmXSQ0FcKa1fEoh8N389iAm9WGQChGd4v73Nbw9BR4u/WBSZfQM8J0AGn
	n37/OirVaJ8M8QtwyGq0MqAMDycD9UImYp0mliwRIoPXQStzxFkSwHUqaB4GK4fnbBvSMf1B0DI
	wldsbudhM6kybc6QtHKpCpXM8X+N2+4+tT1pMKtRIHtWuK1/JgzBOhDh/7RcPNVn8cm2q/OtpfI
	txbHfq96yHEJKezCR+wC0pBr06ZecHfYQ/cmBGI49F+aSkPehs0n36KSjNFYmWXNbSCCsotYpGQ
	2/qEg1vMQKO7c=
X-Received: by 2002:a05:600c:6287:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493d128b6e3mr24185e9.7.1783098125539;
        Fri, 03 Jul 2026 10:02:05 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63172fesm252158015e9.0.2026.07.03.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:02:05 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add RP1 PWM controller support
Date: Fri,  3 Jul 2026 19:05:23 +0200
Message-ID: <cover.1783097764.git.andrea.porta@suse.com>
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

CHANGES in V6:

- dt-bindings: added Andrea and Stanimir as maintiners, Naushir if
  you want to be dropped from the maintainer list, please just give
  me a shout
- dt-bindings: added dmas properties in case the driver will support
  that in the future
- _tohw(): fetch the actual polarity in the disable case to avoid
  potential glitch due to garbage data in the passed-in param
- _tohw(): fixed a compilation error on 32 bit target due to missing
  64 bit divider helper function
- _fromhw(): division by clk_rate explicitly cast to 32 bit for the
  divisor
- _fromhw(): fixed an unsigned underflow in ticks calculation
- set the atomic flag to allow calling from atomic context


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
 drivers/pwm/pwm-rp1.c                         | 435 ++++++++++++++++++
 6 files changed, 532 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

