Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E5C4DE718
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606348; cv=none; b=I98kd+yEFP6WkMSi28e7YlxSsQMuyGyXZvRSjwzYA9dUfVCGs0MchpS/I9rWf9T3aJQ/bIv4fo/uKLsmHj9s+AK5xUSF7naZS6gyzI+Pa0nb9L6bo2FGN8qpSCqxtxS3w7crjNLiIoy1iZu/W2rWYPh59AcFtjnMjtr9nBwYB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606348; c=relaxed/simple;
	bh=yzaQoMK7OpMmVpyo12PL8FGsA8XQ/70qtYYwV1q1/bE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eeYbWRYy5QLipuZYWQY2YGgN7JaBXM/jzdp5vvGq7BYhDRegDFWzvC99sc7fVhAwwSEGXjjEMVmRE1bEYmarHNZBVagR+8EGmFs9UrgZuW1uhd8uMVoe1WP88crEREzQuOwXeMCd+xoym2LMxi0xaBKCtTl9d0bzbTpKLqJKgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TzGi60nJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TzGi60nJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso14204935e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606341; x=1791211141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=TzGi60nJJAeKEAl3NvWH1kuxg9APE4LRYdNFtfGJz4c4Rsrav8kNps+S5qXgeLnXx+
         IAfYALSzTV5V9nd9wkarDVnr+WC6j0aanuMi8qIZf/wmxXzmHok2gGKfHHWiRkoMaqS5
         Tbdctam3Wx1IsWWF5/+wzlPMR+3sviq1C394Q5idVfg6qbQqAg9OVBcHu2X2NyECmtWN
         RkhxRkXwt5WTAy9X2E8dnm/bDbaGggj7nopIymbf9CuIhd3V3xmMxRx5scGfyPEjMfPs
         QIC/Ge8aT8vVm160XxE579ik4SHMS4z1EuMMU8xooSnS/mPrnP5ZRRTBtq4sxKfOHDLw
         IAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606341; x=1791211141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MBwtpeeZ1KqqImP/HFCVixak/oFov7fCW/o5bl69ADg=;
        b=IUPTLYyhEqK6JcDAE2MSYOK8kOSe54tcvBGnhct11F5wd2+twTatsi5Ftq25iFRBDC
         CctklWCtkjkALmFiO9XQII165iKKK9zNYWZhgG0mA4R8Xr6WiiPHX9fbTphm1VzLaPhh
         d7atundZI22xDcyP2FlXSncz/H2ro1K0InVP8m2M3AvJ/1cxI1hwMAyjsE0Db7fQDb+b
         C9O67fqQJa07OR5tWxBjTR3iaLYvQcl28NMvfuLSb6jGZGT6K2pLkqpHOTGT3SoYJh61
         Dnu0750ygQwgsxLriRAIOrq9uyi57O51TqPTFfelf32+9RmO+Y7e9239Dw61OIg8PAzF
         qDOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOriEWm74VlRr1mpWqSeeMigfq32rbpKE//5lPq/TMjD+wMJpq9yIHLBIMHjW1LU6GqvL2y4By04Jg@vger.kernel.org
X-Gm-Message-State: AFuF++kHKuNpik85p0prGAik78rK7KEpxfKHn8HH0X5hncJDVvWXPb+f
	MgyL+r5BTpagX59u+2NbOPh/2bcS4g76V9ICPwu+7hXBADms/9XDbE5spk0tUsAhSDA=
X-Gm-Gg: AYBFou3dVYe4CIZJt0MN4Gv4ia4iTY31Xie7HZnFFRutxPLza+NkxqdXAeBffF3hd/j
	8RJ9VnhJ4Dg/ifJsGANuBl5VGPoB8agte27n7eMUteVTH0cSqSUuVZk2VjKbz5Effw6Tds7vXCn
	hKZ0gqYD3UblAMkcwyheaytiP54QT0YXz8geU92jYlkY23GemVhww3C9foeq4ZWHmmYwrxu+cbh
	ZAACw95kYVomr4Ncim3eHJw2KhIG53oA0mu213Lrb4VU7AYxotRuPbfSH+Qk0qay732OVdLwh8e
	zKosjMQLsyYuWAM9IWWBt6Lgo+gwOANAIOxy2mig+8dzZmIlCs9CQpgpSIE0bahi2MSJ7lM1zAc
	qpF7cnZ20n/ZhP46l4sPF1lWOtdLDlwhNLJDZgX8AVhh2a3+L41sEbLsh9x1r15Auy5sHFds7sn
	Z9vyiOwVrLbCTeFnSTE6majevkmjWGXMH7MGGHpVjBaG6xC3YQGnQBuH37z8UhVDqi4lvjBpqaH
	iN/3uwb
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr222403935e9.20.1790606341440;
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm141007155e9.14.2026.09.28.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:01 -0700 (PDT)
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
Subject: [PATCH v11 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 16:42:39 +0200
Message-ID: <cover.1790606188.git.andrea.porta@suse.com>
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
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V11:

- capped duty_cycle in rp1_pwm_round_waveform_fromhw()
- fixed a conditional in probe function dealing with an unitialized
  local variable (base instead of rp1->base). As a result, drop
  the unused local.

Link to V10:
https://lore.kernel.org/all/cover.1790603500.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

