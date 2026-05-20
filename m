Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA202C21E8
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284038; cv=none; b=FAPzBia6broUdOk7fh66bpeUNandorEGDygC4YB8cQHHyQLiC9WM0tIRuWOdopPG45rwdWwUpn7327XaByhDOlIcBTxQzfmQcnWJNBVBHkHhqHR9/9DABsvI7gqIkKCfE25uI/lftJjN1QXcpYy+i33ZHT2C6/HJP8o4I0o4mI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284038; c=relaxed/simple;
	bh=DHQAQ4SaIjuaILfG9Rqgh+S0/2UMIQOk5eN1qoDZABo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKM6ugSdDUZB/9bn7y9x2Azq05pVnG0H9sfM1xEW0CS5mgdLaHv5rmz7tvifSPguPbuxUHA0Kd9YNP+tahE1UBLSrNWX5droK6WpL9PgPnjzU7ioqOR0hVSY4s0dAaYId/kw473qABQGI3Xoq/8/VDXIumapBNBrXJgEJ2UJqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgrIxODQ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgrIxODQ"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-479d68a9063so1665415b6e.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284036; x=1779888836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8VFkrz+3X6WvrMnbva8csF6woSOVooZmSXbZ1kevyE=;
        b=pgrIxODQfdDFgLkjhFsmouRAOh3Y4wNwhZh754gp+f9dNM0QzmbZDojdcWStZgfror
         drsoHXy8BXEy9Qkb5lpZdc9po0lGfG7FMX3HmlovYvAp4m0FrB8BDEnrb88gytyH6Fr1
         Y6eB9xu2MirNB44U0I3IQ1RS6JagyrZMtpKSwr9qXqJsNUT4dYFqHc7kdNUHEUYhmDe4
         OD6S9MbkCqNA5wumoJrVHdiTLL5OeVSbAwsgJKs1w4uAgwdWqrJKJv4WZBQYFxuaqQ9I
         /VUYFaMyx8U4aG2GVpbONLE3YBA2H7rLbimbmWraHXanihTTHBwaK0QplmMEH48RoQhw
         zXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284036; x=1779888836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8VFkrz+3X6WvrMnbva8csF6woSOVooZmSXbZ1kevyE=;
        b=n6Bg1TDUafaie4Ehs0Kr6zFkKr2sOJ9qPHrqAx8a908//k7WQM/xgMdSP4IA6GFOBG
         JpZhPQnXWGTSNHqqs8mIIsnK0psOkeg1ifd9rGOpa94KYfE2QF4gEy/4LkX+p9FqqYjG
         G6OimuxPPV7A6hd5PXSDTapNbo0X5QxkGYORfwoSRHCDyq2pMhw2i+Sl0eUghl39oYi6
         lXKvRfF4KK47tmgySUGBgVQV86TwWZoU/cnAq1dqtp0Uxw0yJY6pcoGzbSndLBGCCKjy
         OBCgF5i/hrNNC2hL1ZKrPxHIs9ds4wD/A9dR97JQ5+VJWdW90iDbQW101UEhmjWQhhvV
         FZ4A==
X-Forwarded-Encrypted: i=1; AFNElJ+e5eYvCoXhqrq58SsPczDdiK2canxEz32eB7hNEfaIcFngBt8G57vHpX8uNb4FJQn85hui+oQhUKMu@vger.kernel.org
X-Gm-Message-State: AOJu0YyJlPFahYvDbnZO/TSxFqp6vJ18dno48SOgSOlsqrxCAV+sFan/
	0FXWltlXAntov9Wrphd94CFMnyuJy+g/rvAOvaOxiJPzvn4KOCspKXJB
X-Gm-Gg: Acq92OEB9vxxe61ylSkOuJ9XcV/hCh+GIkCDPBqVktEBn/wAMzqqsTlvhGqy71gz24i
	kF5yIr5P1woxI9oGzoYZgXKYZf/EwdSjGVLppSAVuRMXMt9lFCTQcxwUeGzHYFfDjZw5/MQdMbn
	XvZmVQO1i7544sFriSNGR4wc4JJ/7Tjlf/kYdkJYk5iV6f9ikJtIxZ//spLYwtf7OT5e2XioJHd
	5KCSnUX5Dysu+e18+obH1TiOHkMk95pL405zudRx/oV2fFQoAoeyIy9xXGQ2OkNEv0bKI0B8dlW
	K6h5v8suIKkB6AXeLZKqbSSSfS+CmZ0FZd0ZZsQ9FplVQgfkrMXTa1v4bxpLweRwBxfjcrZS8sk
	90aro/8w/5CXTrWCi+pwiHfkDCe83p2Nd63/C5dy/gvc9zPx+9N5Gk4BzAWGTwqHHLujPRSZH64
	ezFfX9u/lCnv+9tDbzBhMsGgPNvs0U1/ficVsOMu8=
X-Received: by 2002:a05:6808:e412:b0:467:ee:7a2f with SMTP id 5614622812f47-482e577d4f5mr11556422b6e.28.1779284036073;
        Wed, 20 May 2026 06:33:56 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:33:55 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v6 0/6] leds: Add powerdown gpio for is31fl32xx
Date: Wed, 20 May 2026 21:33:37 +0800
Message-ID: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

Patch 6 resolves regression caused by prior changes,
and fixes the 22kHz PWM output functionality for IS31FL3236A.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v6:
- Add fix for 22kHz PWM output regression on IS31FL3236A
- Correct typo in vendor prefix for Integrated Silicon Solution
- Restore hardware shutdown state upon driver removal
- Link to v5: https://lore.kernel.org/all/20260508131139.1523597-1-jerrysteve1101@gmail.com/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (6):
  dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
  dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
  leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
  leds: is31fl32xx: Move pwm frequency setting to init_regs()

 .../bindings/leds/issi,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |  36 ++--
 3 files changed, 211 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.54.0

