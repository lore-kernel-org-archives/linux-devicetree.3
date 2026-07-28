Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CD2EEE90
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271268; cv=none; b=u/Fb8Nc9qmhEjtN7giQpDTqyz3V0JPRDczZKWH0NzukrLhGvH5ZTpwizHD3rIaZvGO4KsVpwvbktLQmZxsQt/Jw8PUTtN5FlKUgKFoR+sTOQrt+4U5K/rEd5ANLMvRqFBtV+P1ZdnNgn2X38yUkM9QHrc1JApcq7Od5dtUGebo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271268; c=relaxed/simple;
	bh=/sAXoHqHXoaqorMEt5TZxrbZdxEuLTOOVbYqwU9j0cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3eVLCLZlzQmm1+i1es1oqpF3ebRPd7lMqJaly/gkvdZy4zz9NAluJM0P1mHaoAViQPuhLUTE7NhYwcNkIIvIrVE3WiY/N+07iOmw3kQAkZul/qHHNbX7/mSkqBoVUT4+X2IKNbM8n68XMlAS5mVluXgEftVilB0oMdQMc3n9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MET6qrql; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MET6qrql"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a4836dc117so59344b6e.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785271265; x=1785876065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OT/SOjp6aWTENeT9cUlFqRmQfrzJFAU6CgEj3+vtA4U=;
        b=MET6qrql3DlkLXz2+oJ+/i474COOGtqfLJVvbIaHf41EqlPzoTITp5H95DgASOztzf
         L5cVqA42VvQgBdG/0xNMjQcNxXa64JlNd+6uLuaErW/qWqinlrXvWosbvwvChok4W+ng
         ripqX5S+T32zk1KdJo95Xek68wp6/J0aXDk0RumqXyrtiaAyOmmKEVJ0WsG/QLXtUbNF
         RnzSDIupelLW4nk+RrSL/lCsIxXki1xZQN1Nke80vm1EMkHy9uJc07Yz2OFlNzoqyDrZ
         8imVnTsROjmnZFV63nG3wPccy6hPPCn9AIx/em2aXd/gpq2Vg8wUoM120W6bXjyOd4IC
         Wb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785271265; x=1785876065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OT/SOjp6aWTENeT9cUlFqRmQfrzJFAU6CgEj3+vtA4U=;
        b=Afs7vbkTtiNt77m8ejGD8g0HS5RycbV/1mO4+5V968mG4ha7ftgH53nLQTmU+c8s15
         Obh26oAqmOUnX/0GKEu5yYWcG9ARe7nUt1yEml1vMm934ZFHcRpSPImP1uimacPN2cF/
         4peCjcBaerP/y1XD5cqpsBFUmGt+Y3fiHKSn9W34OhbOTIyq5FGJ80oRrmY69PH82w3g
         Rfvk7/0XDS1SDHd8Na4ZorzmRL2m9aimIejquj04Um1vQm8J/OdPYNGFYS42Sf+Kfwkr
         wdpR4jvmwKnubVYJbk2k8Eiv7nNXbcctrVYf8Z6K5zzFuiO+7qBPBRkaLpn7GxC+IoK/
         +c2Q==
X-Gm-Message-State: AOJu0Yz94wzIWucGk7E98B7U0bdUmc7l+WwSd9rB9c87zHfRcW5N1zP+
	a9V/FFdM7S5c+qGAVqjqmmT5eSKC3MWrPph/qx3qdbGdnOkS5tmNavWq
X-Gm-Gg: AR+sD13SJVtqUCrTy/hrGGvxRSgZb9Om/zRhAWmVixqeDSlC1yJwxqrKthKa4gTh5kt
	KXnQ7wwl7NYGpV82DVBc4SqPoaSNT0kpdocbHE97kGPK2aC+8Y5ULI+hb+ryA3e+QzK+SW6DkmX
	Lf60003lPSGhWyYCkqfJcsEIeVV5ioczgRlJGUMHJiO4qyJORUJFc5n7b6AwCWqPia0mXKOBaM3
	Wt+Li8A+KORo7EhTsQauxpDbG7qVhlWHSf+YiW83kaPfU/11Xnh1qACMI4ked91Q9hfYtnKJh/o
	jS5iJj/BTfLVQm9+Y+D0Y5G42R1ayi+euuEDa0AqL26iye+pMOYJcIYJDc3cOZmGgRP7w2wiW+Y
	5uCEmaNa8ApUcCT+g6YK4UPJsgsE3ZTb8pXAXey1ZSFl9JDrIEzZhxWFGgIbpJgD5I3+fJSPyCS
	74qyuXU9JuF2102ojqSWEgn07OYbf/BsnETr0+gxvSHitGVDRTLeE5E8vtYa4Hztbh4AgrMPnuP
	3OGdrAsWCI//yjtTJw=
X-Received: by 2002:a05:6808:1a23:b0:497:e0bc:afe2 with SMTP id 5614622812f47-4ad5b7fc059mr2142437b6e.4.1785271265131;
        Tue, 28 Jul 2026 13:41:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9162:e42b:cb94:2d55])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6efc5c3fsm129884b6e.13.2026.07.28.13.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:41:04 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V10 0/4] Add Anbernic RG Vita-Pro
Date: Tue, 28 Jul 2026 15:38:28 -0500
Message-ID: <20260728203832.166402-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.

Changes Since V1:
 - Updated documentation filename to matche compatible string.
 - Corrected order of allocating IRQ in charger driver and switched
   to using devm managed function to allocate work queue.
Changes Since V2:
 - Corrected issue with naming of panel binding document and added
   fallback compatible string.
 - Switched to devm helpers in panel driver. Note that
   devm_drm_panel_add() is currently only in the drm-next branch.
 - Optimized setting GPIOs for panel driver.
Changes Since V3:
 - Fixed numerous issues identifed by Sashiko bot, mainly relating
   to unclamped or improperly clamped values from within the
   charger driver.
 - Corrected hard-coded values in the panel driver unprepare routine
   as well as correcting an improperly checked return condition.
Changes Since V4:
 - Fixed errors identified by Sashiko bot on charger driver that could
   result in an improper value being written to the registers.
 - Corrected some error handling in the panel driver.
Changes Since V5:
 - Corrected minor errors in documentation and added default values.
 - Further corrected clamping behavior in charger driver.
Changes Since V6:
 - Additional corrections as suggested by Sashiko bot to fix potential
   edge cases during probe for sgm41542.
 - Corrected an improperly shifted value being written to register for
   sgm41542.
 - Changed a MV value to UV in sgm41542 driver to simplify function.
Changes Since V7:
 - Added PM functions to sgm41542 driver per request from Sashiko,
   which stops the hardware watchdog during suspend.
 - Switched from device_init_wakeup() to devm_device_init_wakeup().
 - Confirmed a state change in IRQ handler for sgm41542 to ensure we
   don't update input current limit except when the vbus goes from
   not okay to okay.
 - Removed panel patches, which have already been accepted upstream.
   Please note that this *may* cause an error about missing bindings.
   See commit 0fd6ead8270270d859a28d0196a4b47e7d6845b8 in linux-next.
Changes Since V8:
 - Added linux/bitfield.h header to prevent compile errors on certain
   platforms.
 - Added regulator to Kconfig as a dependency.
 - Added mutex to IRQ handling function.
 - Added update to watchdog enable field in suspend routine to ensure
   watchdog status "goes back to the way it was" after resume.
 - Sashiko complains of an issue if userspace updates values after
   devm_power_supply_register() is called but before the hardware
   limits are set from the device tree. While this is possible the
   threat of a problem should be very low given that the hardware
   limits are set immediately afterward and would overwrite any
   wrong values from userspace (should happen within a few
   milliseconds). Unfortunately, given that the function to get these
   limits requires the power supply be registered in order to read
   the battery node, it's not something that can be easily fixed at
   this time. Since it's an *extremely* unlikely edge case, I think
   that's acceptable.
Changes Since V9:
 - Made a few minor tweaks as suggested by sashiko.dev.
 - Adopted new init function for __power_supply_register() so that I
   can have the proper min and max values from the firmware prior to
   exposing the charger to userspace. New init function is part of
   this series here: https://lore.kernel.org/all/20260720011144.1280219-2-vincent.cloutier@icloud.com/

Chris Morgan (4):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../power/supply/sgmicro,sgm41542.yaml        |   96 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1327 +++++++++++++++++
 drivers/power/supply/Kconfig                  |    9 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1127 ++++++++++++++
 7 files changed, 2567 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

