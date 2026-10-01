Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974B35A395
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821471; cv=none; b=X5N2u+4wtbc4wL4/q2mheTxvZHmmCxEq6QjxTdjevxGjFvNk6uDNuSWNy/GU1To8m+ussGup+BOzujHXvAFoTZQTu16Hu/OnE+5ZUE2n4UcfDr9bBKzExR4UY2X78KcR01qyHbGSZRm8GY/JbKNhEWLvdgtVpeC6u6uhB99ifP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821471; c=relaxed/simple;
	bh=/6YE8tCBr0BJ9oADX1bZOmyuq86t5AUN3+v6O1cc6Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDqUVwFoREojjB6D5bPh08tiWyH8OCCnSNnD7xcpmyvC0OZLWn6zD/DEdwSczj5r9PgOSfB5/wdwBgZhHqZjGUOGjZPKzVUq5T1froWLrU2sSIJV4fwpIDYEYZ0Lhr2C88YzUWkzoI5ThIfRPyjbF8bNW2GVGUIC+X/nsP3PKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCqYEG71; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCqYEG71"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso28507275ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821470; x=1791426270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=eCqYEG71HmNBY5WpgwuIx5/Fyuv26RRHZNJuqe68dyVmnFHlZTIUEVzqDzYUqcthvD
         lI1b+M41dpIFMsK1VuCBknPErVl8IlxQOlmbizaPWQGTH1lAZRD8SdBzl8b9mBhaS5la
         euiLRGRDmb8ruyau8/9SJoh49TSIKwchN8UVaMUhqX7/aJboN0lvNlIKGpHbH8CCCoO9
         KLlKx/qH+mmBnnc2bzlMvWGh/k6JpBpnl7uv58y+LS1LWqG1KgUstVPkR7JVIhvPL0lA
         +5TixfSoyKpmsCaUNzwxA+uXCcycGVe/iGYyi1DKKbf7ZXuqERWCy4jRnZnv8ob+S3f9
         aWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821470; x=1791426270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=dunG0Sky6RIbVB2O0BcNKPbAzmvQ+VBOy/UyPXRpfQZYHlOpzLjJ2958tfiDKMACiO
         mbP3qPd9Jg5YEY9lrfl2Fw09s/JOjTCpy6L9xqhuBwiebAmISadid0y5BhEXNerWV8jd
         XnBb5mNv7aboW5Dq1wq7LSp3zfT8fMANVXZ5Zz+RCPjMMzBQwoL/RfZpWDCW0Ws3LmCt
         H1VvtuMj0xfzlsqI1tWcIgPNHzNNR5Wqe6hUhPtxcgY+/VfOTdOg6vUKnyFXjSIEW2zA
         CyvBxfmCW6X+HPAyyNUSfLvKiHmE1UqKTsZI1a5iyOtJYry2XBW3tDgTHVboR3adO7/q
         OTPg==
X-Gm-Message-State: AFq9FYLRlTTIH3RlLVhDcBNAlN7Hluw3KuELTiGNX8JUyKkICKyWQDgH
	UUMbopBK1xgHGYedGAXXDwAUsseh5u84o2XMKs6fxq9PtYw+rzV49upF
X-Gm-Gg: AYBFou1kQ2n36chzxWqQO5r/dcCpYqGcsdlKeeYuhPjihwLXWbdr2oITQGFKNDom+on
	H04fdBMvtMQhffuligVHykIn4FIhfYLuRH43A/Pq8cgBzcd8cS5z4dJyG2TxmdeR7AY9c9PYpyq
	8qxZF8N6RecRzQ63dDa8uGIX9aF8SDQrSDKW+HRRJyZh6RdZJ2GkieL2u4V4fk7tMyoeo6nUW+8
	pyaTEQwunPx2vbLBOe+pYJ0hhvNQV0Zgt/v87sXPbw/aonkp0X0XGgsZZPdMI25Z77jK1uhXko4
	KBwaS7kxndZhtci5EUhS++dvEGps5/1brJr9QF4WU4L6z8I9Kp2ca7XpjQnNzxHbtWXUYlhviZT
	9zxWNHxzEiTIkXbcV/NZWrZpG2K/uqe3e2qPOcPmWA9dswAb0wB1LFiVTZq6K2ec8I60J0AVfbq
	DcsWPNqcYwfhum8wTC1XqPCbgcrTLkMSctM43AbqkZYMCKinFLcrHLHM5lNxLqOA==
X-Received: by 2002:a17:90b:28c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3a4d18bde23mr2612397a91.46.1790821469669;
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Thu,  1 Oct 2026 10:24:11 +0800
Message-ID: <20261001022415.913959-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what has a binding today.
Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks is not ready
yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extracted from the Android
firmware; the file will be added to a public repository later.

The touchscreen values below were obtained experimentally via evtest
and may be inaccurate:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

The battery values are taken from the battery label
(5000 mAh, 4.4 V max charge) and the Android DTB
(pmu_runtime_chgcur = <0x320>, i.e. 800 mA safe charge current).

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Changes since v1 [1]:
  - Added Reviewed-by from Andre Przywara for patch 3;
  - Replaced the dummy 1.8V pio-18 regulator with the real PMIC rails;
  - Dropped reg_dcdc4: no consumers, the kernel would turn it off;
  - Dropped AXP323 aldo1/dldo1: no consumers - the board is verified
    to work with both rails disabled;
  - Renamed bldo2 to "vcc-dram-1v8" (needs to be kept always-on).
  - Renamed cldo1 from "vcc-codec-sd" to "vcc-codec-mmc";
  - Described AXP323 dcdc3 as the RISC-V management core supply, like
    on the other A523 boards;
  - USB: removed the inbound 5V rail from usb0_vbus-supply and dropped
    ehci0/ohci0; the port is works like peripheral-only, using
    usb0_vbus_det-gpios for VBUS sensing;
  - Dropped the iio-hwmon node due to invalid values;
  - Commit message wording: those blocks "don't have a binding yet".

[1] https://lore.kernel.org/linux-sunxi/20260918165414.1129076-1-iuncuim@gmail.com/

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 386 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 412 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0
