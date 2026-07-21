Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1910336888
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653891; cv=none; b=AtFaBg8elWjmA/4ZA1YiL7+su6B7CVsds0hVd2MqmiB1ngIyr4zRiCPnvpvrtaVip1zS6Ur7kXCsQo5Lg+KJZtGidojp+bszDqJo9usAxoprzEPzzZ1zVEk4dy+bEQXVQF5mKpofSNzt//+K2SGRFUDwXx7nUzef8R8dCcsAD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653891; c=relaxed/simple;
	bh=lQnMkOuUnPonfXMa46l7+19hzXp4E6B/OknMiv1bs3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIgdHrWDSPuveimMrE195gwp11Uq38wRrcJBPxz7X8KElAU4eyY67qNAkj30iWhChJ4d44l3H4NMuW0Ln5EbT7ZmDjr4ELcK3L1IT8kSOXYLlEVNtxYwq4hShS22Y2MTSX+PRn+d/WKJHC+4irBpuvGR/IqdZo/ZW4w8W1iSxvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcPHm6W+; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcPHm6W+"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43ccd4f6f6eso5443275fac.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784653889; x=1785258689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzhjVfvwCu9RsziVFmoEaGvP3wdKmz3SRFarpVmt0Fo=;
        b=gcPHm6W+VQC3NPdDiEjTAiOVNYWiPF4goLL7kDW02HICQSmEygsrTsZQ8nRg8VGCiR
         4XM5esZOTNPwt8mb3m9NqRce1o32kD2eopdOcVYdfaB2p1qWVCxrYhmTYErQJ2LaN9E3
         2KvoSAU0J1tX4I2zceof6/qsJ/a6kGvMRlHm5xN/onbYcPnUHeyd6SXUh8zo7wYRKnqp
         /y3TqjXeHDTEjNYLl2Yfv+F2UC0R5dISS3+cGdml9wzuKoKA08+hjWeTkWjQHLaKYgcj
         aF3iVGcqlUE2GcvTjrko9hOgQ9pn47W/2k4hjypG+xx5+88JH+n1yYJ20ajm4b6oN0RZ
         kWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653889; x=1785258689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzhjVfvwCu9RsziVFmoEaGvP3wdKmz3SRFarpVmt0Fo=;
        b=G2dgFrYttitrWhDycJxdQqqFApLdXXQMDo6yoL4Zviug11TnURMQ9BpIBKhRXP4O9w
         AmBwYN3SrR19lJLL+fYr2m24/w5/srnbu9xXkw3HwK8ZuiQW35aWcjoeO3Q/FGUOt+ZE
         EIxkpEdw3RYdefu8sCZZdjEcR/KAgNarfKr1LrHP+Z6a5i/N8pDPe/kVW0vRkRV0bHBS
         uv7nhmg14QTcpSt+7cscbHRY2V0ZVzKK2SdWP+oP+N+fJn9PgYBvtFUepvdGoht3pz+6
         aYS7EfPgM5OtOI7tfizplv9jU1X9WILP/NLuMBHQg2U+46Ud8jydNN7tj/UlbvMrD2K9
         QNWw==
X-Gm-Message-State: AOJu0YyFleXlyVGMrLeCRtO6ZFFsz2rSXNyV+dbxdm7FolkVAiFuNmh2
	QdCV1fqv6aOQfA4ja9ETJ/9DtoELcgjh6+3BfxRNnrX6Bwpu3D205Xtl
X-Gm-Gg: AfdE7ckqnFkTI1KcX9LvjbdLF1i6YoS3Vlt9FiMN7xYmtGtXMhFVw/7r5BBKB7izdVb
	uG4XT+u03DfS/al/h4fILhp5CZuogzC82tnfifCjuq36edKB95IH3+FqUi4hAB5n1cL93tCxzGN
	Iqn9eY9kQSWoqMhY5zp+IoQG06BzzN2+xy25KCiYJj0WwWKRYHyUo9++/pH9rBMyn6sVQd4XR/E
	rxb9jz52ioulJkg5qUDMK6PFeBYZNcVjkRVKmlFCOwFaf6N9t5WMl8QmHpE+7muKRFrVzjrLDDS
	sIYOoHzjh+fVp7MKzAo4Y1RqI+UkUhoK3OGk5HhpaUQrPB9pqwZHrlu3rxn35+30PS1YV94K/g8
	avq6K0SLV6JFMJp6u5SVO2+ho1RPUJlRnqrYMLUJJ14wRFx8umI1XS1BmlYkZIIjzZ39KUTgP0l
	Hi
X-Received: by 2002:a05:6808:2225:b0:495:f79d:8bd4 with SMTP id 5614622812f47-4a4d03a59femr10829527b6e.25.1784653888497;
        Tue, 21 Jul 2026 10:11:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cadb50sm10213953b6e.9.2026.07.21.10.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:11:27 -0700 (PDT)
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
Subject: [PATCH V8 0/4] Add Anbernic RG Vita-Pro
Date: Tue, 21 Jul 2026 12:09:03 -0500
Message-ID: <20260721170907.131731-1-macroalpha82@gmail.com>
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

Chris Morgan (4):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../power/supply/sgmicro,sgm41542.yaml        |   96 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1327 +++++++++++++++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1111 ++++++++++++++
 7 files changed, 2550 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

