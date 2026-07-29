Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFD471CE9
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334361; cv=none; b=I9X1vQ02gii1Sw4LPlL7bi2QP1gA2qXMLEcfIVyDnzq31SOhB3A8f7AW7eRN6neJmktblkNQflugJMWMJdiMerchbjDWNqxdxQLts/551MfdrZaUZQP4w0GEdUHCAcPTe4qz7rXvCBZkKHdJxb+sdlh0Erck0G72QoRmgosn1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334361; c=relaxed/simple;
	bh=wPPwP+eOorMJ5Dz2eWGFt/Z+17XkDaW61av0R29ucAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gG9IqOHlbUSSKRm0e33b2nItyZWpRIrDLb+ywta603gAAPfiluMo1g6gO9x7ZaN6ieyrE0TlkJXAaDT+0aTdg/wzb5YlFyGyb1WQgYKJcJ32CIXi9dO8h+FF9OjA2aYzLbF0RyVJCunB8Gu1QEKxjBcHY0i7ZyLe2Nw63ivkGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw2EueeV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw2EueeV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f97d310caso986654f8f.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334358; x=1785939158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=jw2EueeVF8MTaM2fVsulLqscjMKoeapgbA25dKl++iUlQg9SNyJKRclLLoD7VcmsX9
         YMwbg1cFYxCroyNgPoO6aZ9qZ/BS0Fp/nzYEEiWbWlMUzl6uwLryXcxU03xbDlHb6in5
         2i/iRMyiam4SBwAH8I2D5C2QYtXlp+11FmaRqUEVCXqIYDahbUi7/8YtZcBkGjRRVUwv
         IqdzMNZFP8ZLzWhY9HTo+/JcOIUIzcPYweMAQ0nlAMgcfmhJVlA3IRexfUqUHwpsQ9lX
         hj1f3jrvb8bumrCtf1QfNN2R9B0vWglWSkLJxDdGwhdl60OGVLOIy4QNbp/gbn3bI+gx
         AinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334358; x=1785939158;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=Bp/9c0FcWMY8dZSUdjwZCN4kfeUO4KRh2aL3eW6Y6lAP1u4AUukHhkpZ6WEOxTISpE
         /b3H259u57vequCrKHETE/PeTnv0k1rmAus6H4lm+3Llzb6zA/BYegJ1YdEVheoBvfrK
         9lg4DbOCbH+G/ODPsBzl+YxUVD6XVX3vj2xCNJKFMB2f3BNUc5I08MZLkwdFvFgzpLQM
         9EsWsAYg/rB+eBER/v34QFwso31DyMG4mzvCBNswhzjChBRDTbokZqCUDcf3QFx1Mry9
         Tamd4T9PUR+nrhPb/qI6npgeBYoZLA3Eg8N6V0jwnde9wT03BExdoKnPQA4WdgcGAcw7
         +cww==
X-Forwarded-Encrypted: i=1; AHgh+RpNcDjJeAAMg0N0sW9DbuH8KPZJQA5WbVhjbaiXmWBLYvY9rEkjsei+vj3riR0HFwHPVd5ET4MZ/vk6@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXnIHdzk7djREe6BYfzrAOJVkXMChbg+OvDehlK1hwUDXA/Bq
	Raxw/SAlXT5H8RYpQx7Puy83zkQ1OGDLpvC6pLBnSG8Y8P0aUjXm1X/z
X-Gm-Gg: AR+sD12vXhXc/6mh5pakTr10hUVoa9lvZQDQqR3zXIxrfpy1NE9NPM+WMAU185bce9d
	XD6jHWSbfprZVHtu1cJ1xZyVVxdOyGcxo3eZle700S6uy2vN6Ke9qRCalpOmR/+VGn4S+pa0pNv
	hADfGZc8r2cd22cxRPiv9FRx06oyVX3ACEgU7lk8dYThFVWykGESNhx1huaxGepR80YR27EVh5g
	f9//qn6ApPW+tA/4Wvn9GR+AvB5OBkyMv5Y8cY4FzmPO/1bj5A2zPnHEU+G5chB67/w9/A/7Nf1
	ztZ2ijdHEBFblKJg/1D5/+JnJ0Shnam3rmZ97pU43xX/5GlyxhUzc8bN3mcPw4uUwq86/2Z4GfH
	9ABYkHtQ5lGSWpjRlSjsLlkInYHhQV51ok0q2GBqlE5VwAKOVEWZ39TTaJ11aqXP8S2BmazRDFy
	LvOpRvu2Hl0YbSYAOit+5HGZSaTLDLqfZlYCudFlyqaPm8ccH5QZtj0yclq/+N22H5hDFJ2tMfk
	F8bZ+dzUA95K8G7VGfN5A==
X-Received: by 2002:a05:6000:2c0a:b0:47f:9464:86c3 with SMTP id ffacd0b85a97d-47fb1ee73e1mr8634331f8f.57.1785334357591;
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
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
Subject: [PATCH v4 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:31 +0200
Message-ID: <20260729141234.65037-1-robazzalberto@gmail.com>
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

