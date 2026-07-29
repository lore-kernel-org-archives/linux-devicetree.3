Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB333A0E80
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347503; cv=none; b=fyshl0HxOG05EUGS8I2nJBE19+Td0jbNY3l58ln1+LcilH2SvTEG13XblhAlnVGRNlI97JqmkeMTbtMxLlV1jP1ikl60bYnW/7qj4tYiQTW425DPlKI+p02iGT0vwfoJn88DcKay8BFbuibT9x2Xftw1anGNdj0R0iP5H12i2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347503; c=relaxed/simple;
	bh=rTdlcr9naP5lTolqbDHtyC24zFNrMnM3yE4w1hSezWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oL5AAR56uhfNdj6ZfCeaUk3O0vc/BINwpd6dJEph6Mp5kkX4fxS2ASONU5NqvSOnkEqWm076k3WGlEzlhOLcQZTVW0TQJB9KRresGg2s1qCsHZ5prVI0pK8w6IrPtHINDTSHZtubYvT7EHE9Ape6R1qYPGKq8TdL3VC+YO+dYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG4iya3z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG4iya3z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7919235e9.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347498; x=1785952298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=VG4iya3zBfdzUEaSXeqPXJ0CKpmlMQ88YDwmGtTKCAmPs/H+vBcjNl69B+p+EhAy5P
         2LMv53Dn3EgT9BoNIXLMYV7Gcnw4xNVUqdpIkI0r4n3ZSDiZJx8Yt/PWTEL6bYORsCJT
         5V3CCtrv4RNbwSoG9rnmq9sT6iacStrtTRtk88+x9Fz4YoGTGxo3QG7YG56v88OG+Kp8
         gbkyMdQ925rf3Jj+aaTI0tXorB3QOp9ZMvxvuHtjNhg4ibWtfmmfSwcMP34nHDFTGqOG
         IKguipS6/O5u9B09Lr3Dv9Y4A1/Jz7b7hH1nL4hHe3KJdvtWuV4DurZOadElHC3MphWs
         vfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347498; x=1785952298;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=DVGQnE2/5REUI68BYFCi/Ox+2kmODmc8zpDgdZDy7+pRr8Gh+86ZyQQmu6VpyEUXfE
         Em58kDIzkcBUkiLrAIcpWupahdWdbamwhpkOOJzRTk0NQEpdU4j0Jy7T7TgY9f3ojUUr
         KO+xXFB5m+gU1+4T3VWfQ0TQPlwZLhja2pT52QAaX+ThsUcoLP9xi3VtKOoBtdrVaFYG
         rnJjcEdjBq4TGQyoD9H6m65ZTgr9/D+qk1lC5pTVY2NOx+aqf3NHjglqiBGC6eMFy7nM
         etYPhvdRicxa5AA1ehbsfzG5u+WIk5yFr5mpPEyrTAWEBx5yboZROeNijSE0skV6P4oO
         u1xA==
X-Forwarded-Encrypted: i=1; AHgh+RqWcDVDIUMJJEfHprYtBZ/q3AGi2UIwTJNTu8b0MPVYNpcxUVvy9+wb6Q4cxbLBb5mRMiy3cGo65S43@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRSLpbeTqitFkk1B98XA+Lyt2sMpGEPEp1+BmIlEDYSHBocYa
	shZ1g/efC6a31lvUB2slJHOYJ+G64bBqSD07BAgo22oRcixrz7IBTDZY
X-Gm-Gg: AR+sD12K1E9mtRuHncFJ5qyj3rRD1qTuGPbjXb5M+p4HuLBdhQxRzjiVwunmHFjkNqp
	21tbycbXm1x3bSevusuLDgcpFvL+w3CwdbAgGcR2CSQyQlw85VsjIQf5MgJ8fceKLKGP2DZjKkD
	z1saMmR68h9bz/NMVo9fFVq9ljA5kFe2SErIXC5R/NWoYdEaI5cMIZQdcy1yBFs2r9faQHBYhW9
	e53zhIuxxza/5h+UFXbqxfOE1c9bWT7kJcvT49EKAwrMaPJtk3e4q2pfXRqWxYOatL5ExLaQ8TB
	EUVdBxTAHqb5wdqn6t78v5O34g55SM2USUr9Qx4EtNln20abTBdjMQ5mr6AnTdr8YA0qjY/Afgf
	Q7j0kzoQUJ3j7wwmYIra0jrdQFEwR+3T6PNhT7vwC3m4UKSdkueApIgglFU8+6Ghf6EYs2Jdx01
	oDAYTeuGo5xqT2Hl3/KDMyRlfYVvcMEJvDiAdh5+lFpFGqJkNfZs/xfjr9tN5KB8IjqSOT4J15G
	i/vzDfxl2311D6mw19GsQ==
X-Received: by 2002:a05:600c:4693:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-496c643bc85mr87358905e9.17.1785347498162;
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:37 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v5 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 19:51:31 +0200
Message-ID: <20260729175134.92909-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

---
Changes in v3:
- Polished meson-g12b-zora-p1.dts.
  - Use proper comment with /* and */.
  - Use the new bindings with function and color properties instead of
    label in leds node.
  - Include dt-bindings/leds/common.h.

---
Changes in v4:
- Dropped unnecessary sentences from patch 1 and 2.
- Renamed "wifi32k" node to "clock-32768" as updated guidelines suggest.
---
Changes in v5:
- Add Krzysztof Kozlowski's Acked-by on patch 1/3 (given during v3
  review, was accidentally dropped in v4).

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0

