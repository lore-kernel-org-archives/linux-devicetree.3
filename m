Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1821DB13A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251804; cv=none; b=L4WNl/gKKeb/4U8lImoBjd4F7cCsI80SEYylnzjBl7e3Y2N013sauBdx1M2CbcA5UMBtAwM8r7xC6f+y48bhkfaXEDs49BR8lzV9yScdENEh6QeOD85/7A4/G3x1aT3YXHDbRAX4WA/rWKGTHwBa1TpwMRlYQ8EmPntottiXL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251804; c=relaxed/simple;
	bh=gCfxWeJ7Lv5iUGV/b177D6lgB3v1AXGrvpn6dtakou0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Erd6W/bW6xooK7Mk4RhoE74cYL1vJY882tNpwidb2Xn00Qxl2Yo52LvDi5TQUjXRJwZi6ZGNrnMVjaWE7ckcRay4/21iPfjq/FES36BbAH2rg0I1hd+x6p6TZjuORAzlgAvc8a3EGPd8SzhlakFAuq+56jil7H/+OJGq4aF7ul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpiIzJy4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpiIzJy4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2738079f8f.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=GpiIzJy4kmN1PG8ZZRyyIyK9VntaU6dbvnfRtUvDmpR+yteQgVwm4nxLnegvGaBIgx
         IEzwisHgVwncPYCt7RxSPhNrEgSOU/vdoSK/7Yq/O5qOPNYHvBzBu1YH4yqVQ8FuAk0J
         5SJRVCEFPOi40ibNadCZFnoh6ICZlz51Oekt9JC7U20wmb5ldBixS6vdgjNW6Ur9E3h3
         mFtIwVmKt4iIoK273QJry9xYOypVdtNtUM2IBGzmKUqeulQvBA6f0EREsGxXWgjlfvQh
         yno9jxdYNAmQNGg+ctDWPJgUPE6jDF72tcXFhALJZZTIMHSmQOCSRQ3uc5pSJ4SS+HwY
         mTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=d/jjwEOZEMbCp25m5Ulde6vjqYQs76LkXFd1pUw0dzeXf0rFiNi97hIHJVqngKygCl
         y/n12D0mj48Mb/8F49NxTxGY9V0aMyPbycxNfFnK36Yq6/NtS8SkHrLeRkU8RvqNKK9B
         DFatl1TDTO0LYn59oqAXgupA4i2gK9QzkghEuwfqvacfEt6RsLyK6NTfop0u0htqVld4
         6qFSHIU7M4Gmx5maqmQQr/w8WgnCFVv9FTeDtAeQEasIwFn017g4STcOvM9yMlJgpjby
         WvqWHprdpnx1z9lwcxgWoevaK9Qo7iapFKqb6oIak5T4uJpldzZ0p2eqwjKQ3jx7P4+H
         di1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqUXsI+fuSAgAWZ8rjvfxTFfDQF5Q1qBH2ySOeQKsbR1FXp6moZcE/6Qj9utAEJpPH+SlhEQ2rDhDWK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XuNyPMkgnr3450FOBrdADTQO8qcs1mDFzdx4ynWAcr4846rY
	rNn3v42fJUwbbDx/O5NBeKm8kkfXA5PyOTVJsHCiclR0Q0bTe2cxilNA
X-Gm-Gg: AR+sD11QVpSzi9eMbgdIWgNCDLurudFWCNWzh+6SVD5+Wpu5UW2fTf3JGZX0Uhk5eFm
	IYyBp0/ILGXxnuAghHWe6H0QpCStPi+7E7Xi19DnsxKlksOGRS6JZKidkYosJGN0g94KdW1HkNa
	df/GeKhpgFsdbsQpNdSvMK9k5KhTAG9YaxN0JCGnZR4o1F0L/rQp6FoOdeE18n8Cae9L0U859Mw
	l1Yyy6O2hT6SJ3PdXlRFcH+DzpLRZJUCZ9bgQpGyKsplebGgK7PPbra+qVFD4wg7F24P6JKfWJ+
	WK/xEb4vNUPr1CbDedYVOc6FKlaNe+CDqNiwKK3k5iRfhbSr7igmFnS5COMtDbDjFspip+TVSvc
	Lo0T102cVaN5/H7L2p99fCxZv7PxN/Lfb83xWr5G1tLMekGB7YVu5v6UXgaU53FU8THMVsan94C
	PBr7ti9WOh1qlZTbbJvcnZP5wHpdS5qV+lKDy1VdVGbiwHBQ==
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr3577209f8f.11.1785251801287;
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:40 -0700 (PDT)
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
Subject: [PATCH v3 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:33 +0200
Message-ID: <20260728151636.236393-1-robazzalberto@gmail.com>
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
- Polished meson-g12b-zora-p1.dts
  - Use proper comment with /* and */
  - Use the new bindings with function and color properties instead of
    label in leds node
  - Include dt-bindings/leds/common.h

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

