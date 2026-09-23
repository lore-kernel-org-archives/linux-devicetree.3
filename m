Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9FC4A92D7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169227; cv=none; b=ewt4ggKvT800MzdX+v8I+RkZVq7YOCKeJ3nhympnyLk2tjAhjDf2t2i8QT7PSnLLiSd8+8uJGmV2dcyOrs9qcQ35qhaMY4nr5qQWmCPybbdUhJRKX150JJJPEhVk48ImuZ/6eqGyKi9pMcU4Jib2VkvvEgcW+I0VjLidK2gggSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169227; c=relaxed/simple;
	bh=jFZ9QklyccwNP+P0t/i751eWiOibowSv0+P2kl/6mtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhKDid92oFAEgYGLmqWiad0Pl8ugFj0kmrRnTQjTnKtVqszhY9WBgfEnlEokaKs9QtuyrfDoig6TVRHsRA3xZHW9MAc/gmjFCmkdwBHRNvGCF2+Jgzo3TY1L2uU22Bjk8TYo//Hik2aBuYHFaAZXevxEiXkPjTIGs5sukusNgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4wodJ10; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4wodJ10"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso7751585e9.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169224; x=1790774024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEL/ziy119TiL5y3r1fCl+gEEEgKmW5ZTGC1Lv1U1dM=;
        b=A4wodJ10OKE3BhoVP/wokdnaPptKp8twxnn0f9r9V2pHgjHsZa6qDrQLlrPMiDnKFG
         ItfkJ7mbDNWkvYYhBerg4a5HNn/AR290A4UcrY8527WGmZi0a20x0Y84Hd0E8GVW0NYg
         uefwfieHHsrdWQ8MJvNW8f0D0ZbyGJqbxz7Su8pSH3jfDnH3TNSBlYrmbVBxWn7dVlgV
         N8mI/KfBEy7z+7iOXCDWE6MuQyQh4bg328s1R2qVmblmvHse7JYzEecXpOz/XdrECw4j
         qsAtPkPxfAJhNrkW+Ct+zxgJiPJGOp95v1hzywh+L1YmUi/jffFWIqxWG4jJ2BuC9uEP
         yklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169224; x=1790774024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEL/ziy119TiL5y3r1fCl+gEEEgKmW5ZTGC1Lv1U1dM=;
        b=IE722SGlUInBL1JbwqWL/pG7h7UefSn6xdGod7SeSErlRz6rErUK4oMY1mav1Cukaa
         ZRvFKplDx6Kc2ArqJpLexmkow6Zq5wApOHYhpjBLQu13mOAhGedlneYnTEj0oGxGsmg/
         rdPBremAwge+UBR1ASv5MorW7R/KpyT0CKfGHS7xYLmQgUroRp+09anMZ+jkhWls7OMh
         0p/DkeRMH6M/ATu/vR0wGGWX20x63yX3TFhThMrK496Q13gxlYYlvAPKvo94Hvf0rh2e
         r454bHfq5s9xYaJVL1tYrXFHaHwfocl2lMkbFEkarX1lJEqIx4ol5sKunXRVRWUmjasT
         j2CA==
X-Forwarded-Encrypted: i=1; AKwUvBxv/kuKvVYKb14sv5JoXmZCd3tmDq76M+OYXRmKv/qiQUnIlv5VruI2ulMD2tVLpezLCXrF2KEArof/@vger.kernel.org
X-Gm-Message-State: AFuF++kQOwvPxzI2P2jUXW4DrNyu5fAKzRcTd7er8yqwXWRk3lQ4sUF8
	sO6qgKhPIe/R/MN1SrTLCGuQ0CwyGPpAPO40/w31kKOiWDuavK7rzjlZ
X-Gm-Gg: AYBFou1ziFnyxAryYtb+Z6PrpISj8l8QoEeBFZXNxRDe8Fb5SJCVC+waOC0fSWCaNz2
	3xxSgBKOu7BvS7+1CnvLNQjIe78FSnjfQjUCMiU+DOcWC2dTEyJEVEalfxaWVUT61Ah7FTeB7TL
	3C0ES3jJ7xk5gqc9Zh0UelKKzYKEyq9WYtjZgCeO1o2/Hm/P0J5izFm9ayt8nW4lDpjYVAjjqWj
	PGonkQx0OqrB65yjavHAEx68LAgMxgYRlK5uTGTvo2jfyg4sFgqJVZIaGSLKt7war4PX+U/H0Zn
	1qumR9FAs5F+p58VRWczKEw2Eq1lurf/Hdi/oNOf7/gvOP7LfFApJuI37IGiAC9U2w7CgpulUBI
	cgvJpF9yiDXjz7W/1U/EfGCclG2u6vGl9HlOqsc4CO2QjBl6GuyLC0lmGtnpUv6gnKNhLGB8C0Z
	T8+2jSaY0tUdO/k2FeJv4ht+eohbLQWd9OnyLBGCb+QOzjNT1iRMzdkh+SiznNXFd+As4MJPqNc
	Nj10asIj4r5gT4B2RD7e4+TYsorpxrbMY12N2Dg0BXyhg==
X-Received: by 2002:a05:600c:1d14:b0:49f:ce73:4a with SMTP id 5b1f17b1804b1-49fdf34f0e0mr36303145e9.34.1790169223305;
        Wed, 23 Sep 2026 06:13:43 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm57230235e9.2.2026.09.23.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:42 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 23 Sep 2026 15:13:21 +0200
Message-ID: <20260923131323.1099979-1-sander.speetjens@gmail.com>
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

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   8 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 242 ++++++++++++++++++
 5 files changed, 288 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

