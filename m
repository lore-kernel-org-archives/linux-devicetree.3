Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593533A9CB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784786904; cv=none; b=Xt8eeEXwIbSuvtv9wEEjqlsaGh2HaywbbBFkClttPTX21b5JocRA1jH67ncddbpFNjW604TrF0IbVCgiiG+FHwBajBtWVIizLhL+wa7DgbsIFnDu0jLVKrJ5nw4JZFuqd15Fab4HTSfdMi3QavgD2HN16Yjg1Gf1tjdhQkD4I9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784786904; c=relaxed/simple;
	bh=PyrWdns1OrOzxEPcfbY+R34j4aE+Z2Ud3FTa8IgPb7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F2Uipg2UniVvsm/TBesnAZ5f0ycGpS73fCQi573TQDmYv+F6YBnASa3mZiLNXT87RAGrmI48xxafw+yjkuJ+67SuKAEh9yGRk1CpbEci8A9nOxOIEq4ZdxxPq0PYvEFQs4krCcKBiGppV7nFKgdZgfYyU3E+1bztaB6uOuDBVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSMjpX6z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSMjpX6z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so3443105ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786902; x=1785391702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjXGzvZcsEIuIReWqV3AthYPTgXMH2ZnkuQulSBosYI=;
        b=dSMjpX6zDmwv9VF08XBefORxhYuMNZ8TaNMIJ9lbzmZE/K/4TubML4wbuU4jxizGfK
         0UUrk7CEF37RJg7se+0oPlE/kNWj2wc3W7iCbu9UWdCF4QE1kxCymFmNtZb/I79U+aqX
         JDzSAplkBs5/Gwz/byEGBEthjzjAUBI2otMXKprUU0IEY+NbfApqA+RFKqeNEsaPvBMk
         Qk1LrY2Nc7wSftFHkV384gOSGmvsIatfMQgl2mV6oePxk9p7O8P3V+wZouhNx3OK87Xg
         SodqkdWkw882zl50bSrUwErGZJBbkDXZ7vr8rede7GS5l+joNTL2kRzQCM4kxV2//LxM
         LVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786902; x=1785391702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjXGzvZcsEIuIReWqV3AthYPTgXMH2ZnkuQulSBosYI=;
        b=L0sPKw2/f9ky2WKi5kyqT4rVA2vS66ccZnZQ+dU9AtQ0TQAlN1Li0TyMcb19gYArJY
         mTt8W4E+zB5lV7yJb1iPD6mssRVs8jKg5/whRt1T5b4UXgEVZLxGlOf6iBMEPeuQ6WLc
         6Vj4EXD2LSEsCD6BHBFEqmqw+SRRIS4YlNnNQlzelmQxD9+JuyB3HeiINHdXYW/n2lF/
         FxNmSZH72CoKZXIWT2BTCXIv7dLkJBlGd4EvCGN3fCEsxSPukQ4Gg0HVnXyoX85ug5jd
         xWy2D4eUr7yU7ktyOHL9TMf7s+czfcj+k4UeZmQpvTXneVUoUgGl8zg8KZmiNHNl7imk
         bYmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ssi1p8nybEMbeAEvtnD2Er1HRph9QnbTSaLeefd4sPKkGCaN0G8Feg7HPZ42XlmYiwdSd858pcTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPLupqmGEA8BPdBAlYtU7C5jOZ6kG7Uu/CpororgEAJF+6fcP
	qXIrTFZwpd8SsrBPXayAQFozsJF/bJlzVLAWOiuBvxNeL6BpEyzFg7EW
X-Gm-Gg: AR+sD13t46CEfItEGE2GCsebDV7frLS7fC3qdAGk6ZA+4wRm1lanFgdk1OM2xylXQgA
	Brrw8X1Q2vmhesffDpSGQSNwWC73Cn9vpinVa/45eEKMNR8nqVz6ZN8Vudy6fkzFWa93Xw+3no7
	HMCLdkXg7LhiPbyHXX8O7dLrzWQw3aETGYjV9i6M7oEwF+mFY/8W7rMR72SCzAlpAmhXh05CWs3
	/rKgusrGOiy978Yyi1HioTQyABTIi0wFkW3UVSYOLyb/nRsIEjM1ee0V/MzbdgYyiB+Rx9AG9fq
	cSvVp6vKGliLuknKp200c5wwBwmdw4S9HQYUPd7H+TLNRdORk5jWuaw139WBoaO9SWf5Opp+Clc
	E53HGVbuqk0t60L5c6c86JWcxE9y1Zta2jjFRctdN56fbk/cFUVaDCXSgmE5fh2pcGBn1iCcORN
	2C3YX48kEyIejlTSjxPU63iAMZyVZuEQwzp5cQnZ0RZ52XXvP3J/m4v2EyNfxS
X-Received: by 2002:a17:902:c402:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2cfa6b740b7mr21724555ad.13.1784786902450;
        Wed, 22 Jul 2026 23:08:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:22 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 0/3] watchdog: ma35d1: Add support for MA35D1 Watchdog
Date: Thu, 23 Jul 2026 14:07:51 +0800
Message-Id: <20260723060755.1596858-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces watchdog timer support for the Nuvoton MA35D1
SoC platform.

The MA35D1 watchdog timer hardware provides a programmable countdown timer
capable of triggering a system reset upon timeout expiration or generating
an interrupt to wake up the system from low-power states.

Key features supported in this driver:
 - Standard watchdog operations (start, stop, ping, set_timeout).
 - Boot status detection to identify watchdog reset events (WDIOF_CARDRESET).
 - Power management support including suspend/resume and wakeup functionality.

Series breakdown:
 - Patch 1: Add DT binding documentation for Nuvoton MA35D1 watchdog.
 - Patch 2: Add the watchdog driver implementation for MA35D1.
 - Patch 3: Add the watchdog node in the MA35D1 SoC DeviceTree file.

Testing:
 - Tested on the Nuvoton MA35D1 development board using standard watchdog
   test utilities (e.g., watchdog-test from tools/testing/selftests/watchdog).


Zi-Yu Chen (3):
  dt-bindings: watchdog: Add MA35D1 Watchdog binding
  watchdog: Add Nuvoton MA35D1 watchdog driver support
  arm64: dts: nuvoton: Add WDT node for MA35D1 SoC

 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml |  55 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   7 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/ma35d1_wdt.c                 | 357 ++++++++++++++++++
 5 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
 create mode 100644 drivers/watchdog/ma35d1_wdt.c

-- 
2.34.1

