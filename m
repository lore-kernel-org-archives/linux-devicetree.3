Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E740B108
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739637; cv=none; b=K57tTwETJvB9BLmm5FGKIG3EAtLA320jeIWWubXuAk3sKa9gNdDht3P0dgy2hAy7gSvjZgCWbyZ4lECDlPuYeA13ZzPIR/gLVKi+6dj0nGMdewXaItpNavoyGTSrLHgSadV9ysuF+6hF4OMa+D7Hf2GCeQBu/LAA9eZJZCpniC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739637; c=relaxed/simple;
	bh=tc8CBC7yWLWV98Sv5tM7kavAdCskW1MCuiXz0dRlpZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3xB5kJtRk6IoF4oPgkuMpeMpxm/EFzo3JYSPU80aGLpI2JwjJl7I6/Gq+Vxigw+1aN8bk0oNE4T3FY/amiS1FlNIDdzh40zq7uTqdIA/hTWR9b3Ibu6COT43F2yQakQBzTRKfTu8bDjTY48KR8bKsQULZtbd3+ZMPsnyvuFiBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1KHXwhP; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1KHXwhP"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a40bcc8d69so8247604b6e.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739633; x=1785344433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgA41dE5svnack/ZQuUDCns5DU9pgXg/CTTJbIOl5Ms=;
        b=s1KHXwhP+aYyyQ+lW1jgHyGpoeIUY8HAfKDXbvXZBA0n9Gzy1A4u3ZKwl5/WQr4UqF
         nrARJaLos3DoKE+mLUDtB5hans5GTIt6JW5J+1eHsQHVnttR7o7oevl//RXNj6zOK9hx
         bc0w0LPYARWHX5GrSz8ScjQ6w2WuGjVfJiCYtEmfQzymheUylqyjZqjRTq0ymTh98KU6
         MwpYt5RG+jnXRun9pPmKR2Ro1D+4c/UNlRIRQyHULxtkD+bd4Q1FpNHPqAfis7+JR2Ev
         IW6kSY7OLS4pgMZq98WPoMvY4DZtxkBahKbku1A4XVUWoQg3xs7EP5+E32Xnwnl3QAib
         q+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739633; x=1785344433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgA41dE5svnack/ZQuUDCns5DU9pgXg/CTTJbIOl5Ms=;
        b=B9ofjct607xn0DanZxEVDneobzAP/oh1YuxER63heDHNbTSNClhCoTi+Z2dgv4J52A
         KfAlP0rHqzS6H18JdNd67kC35/+IZVfFm3pb4o6bNOMPqaEzkp/yMLuOO5rbcQIs/Vn/
         9jpFCyuIYRM1nV1FffuIU6ktFuyKowiywq5X4vNaZjVVBOjufbu6F6fJe60rWrptSijp
         F8/+XASO866etTc1PCTgzgaKOhqYk5HEjRJ2AN9Ebn5SccwP75rYO4Bn1vpG7K3scbdV
         b/QcF04vdl49l/6TVL6E0BVvm18follMAVow4NgPG3aaD3PuOJr6qycKCAT5APyAJkTW
         GuVw==
X-Gm-Message-State: AOJu0YxHklr2t+wOBCIJgH5JbxVTBmpzxl/w9Mu2oo+/I51m5K1rwlGU
	zwLP2O1u1UehU/I+PdCx9WC8AqTLtkC9PqG8KEAYWQBYD09MGfUH4mek+PqFBQ==
X-Gm-Gg: AR+sD11IEksJDiXJKypgygNEnaeFkx322WHsiTCVPA5rsZQQuwhzGvK85XIFZL5oqBP
	zxotO8G0sXVzNDVs4feQr33JfDWrwq8opjDcTswEgXcvoAkkxyoDNJ6e8alT23k9PppJ/juSCGd
	urzi7p0CAOBam2Xt6NxGNxMG1F8hVXNFuErFrDFMrfsiipapcKRylBDg1IVWxklT6vng+Tf8P/K
	b774ifAUU3xLufXwGkG/NygN+Dzsmj+qjspmcy5958gZsv8voWA9SV1GeUP3UK0eg1lDvq+XjDN
	FeHL1GfaOCbbK0u5J5M4ajy/IguaeLu1o7lQzquWXqEMguMG2M6Kn0lZZFaYhErAbp2gbbkyEmw
	eX0RHh+NfbBJ7aiuKtYkWxz89IuWQGNq+0WcTKPfkpGovzutnP4pNz2jY+BDehTcWbzqUZJNCsd
	2Y
X-Received: by 2002:a05:6808:444b:b0:492:cdc2:80e0 with SMTP id 5614622812f47-4a4d049cf4emr13247601b6e.23.1784739632359;
        Wed, 22 Jul 2026 10:00:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0e9af0afsm1399619b6e.12.2026.07.22.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:00:29 -0700 (PDT)
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
Subject: [PATCH V9 0/4] Add Anbernic RG Vita-Pro
Date: Wed, 22 Jul 2026 11:58:02 -0500
Message-ID: <20260722165806.161020-1-macroalpha82@gmail.com>
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
 drivers/power/supply/sgm41542_charger.c       | 1118 ++++++++++++++
 7 files changed, 2558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

