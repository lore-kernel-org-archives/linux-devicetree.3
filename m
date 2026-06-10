Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2540E8D3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102795; cv=none; b=nVSbM8G0ZRIhNXuFZb8O/RZZryZE1DiKPGCBkyMYWsj6AMBrMuOi6ADd4IFf7BO09eNN+V6YfB9BZxQ8uPUjH/d0YFI+d+sKZzCL68R8IldBx9x7M2f9uxajGDKbDICPxkNvp8JozGAHetIRWXaI8rV1xaVCWTZD+lHkvKatrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102795; c=relaxed/simple;
	bh=OKTe7omCj9grCxjw2F3wP0XQ36dPupaiHcnzd1MlMTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxO9YpYEN0SXlESfdoZZE52313fpXoY4FP6K8QqrHEFa04H3JV+Kn5zd82Z9VBh4WhKdlBvijXnWV+2V0qvarPn6y4xL/csvfvt9VpWfW1PW6Ll6/+yCUdBLek5jw0gAWeYnh+/MPCMqy3813N2kmXoxqnuo6ViEcVEDDaPn1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7qZoZPH; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7qZoZPH"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69e46524711so4230356eaf.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102793; x=1781707593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4QzymakmUc/p+ikIBv/t3ub0s9V/aIeCfFGF/Aix5c=;
        b=p7qZoZPHdF+Gnic2kYuHhTR1tKV4NBiP2VvT6hRagF7b4Hf39bhmxgII8uLymFAmde
         mAmFyY0Ag7KP2zL50qH/zoqfOQd5Y1s8ofF1LeyjbK/6mjkwwCj56uhgF6kySQZvDWxJ
         qouh7LcOc3Cqun0fY2jxHUZ7eEs0P1yP1ecW9nA4WBhdzFkP666SBrQvqBlviLThChqC
         Ad6WxYWyho8GDqg/ZFQnVH0f2hJhdAwlMaNlQRfMT7gg3VlFsTZlEKr3aq6rX3C8Kjk/
         ueTNkIojljATwKSfBG5bYdTgutNoMnaUdakynB/1e1HhuMW6G8ArqiX5vnGI8YKF722v
         CWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102793; x=1781707593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4QzymakmUc/p+ikIBv/t3ub0s9V/aIeCfFGF/Aix5c=;
        b=klMilZUD4OjNY3X3RaC1SDrvKtgibjdVPGLL63cWiR1iahXD6s/Pac4hUkcPGyXzv6
         GgfiFHJc59BtETHhYDX7zF7hLc0vxcQjO3mLEnZBX5VJ+ApzA41wA7/IdA+EACtLaesz
         JLmW5UhrkCNo1xkcpIRt/qKqPlikPWM8Pxt6jOBaNwvQM5GWqKCC3Diveav5GyHvloHT
         Gxpe5QVqHOgVHPifta5k1Fj7+lp+741zXX6kZSUO5b2aFpUhDH92x7rBeZ1bDgD++57X
         nkUPlrAX4ZBZZg4azKQvWo48+ACIXk0tnuvlc8amCPHVG+nypP7mRL+m9BofVQNhcY9O
         RvHQ==
X-Gm-Message-State: AOJu0YxaT+MCH9Nvk/p+Ld++66JVjBFIO8IThsQDSYpuYQbQdPY4QavU
	isyPU0R2t9M2qrphyAG5Gmay1Klrar9v3icaGHxK3cqjO+KSaSArF00p
X-Gm-Gg: Acq92OGxh8bQXEWzGzA8f0wFkVorfOHaBPfd23Lax7jExJ32yJo/HJq6RDsqwQCjN3X
	3pRdD16jTKb2h/c3HWiCuyvMWLeAFeLDfQRBQKuEI4A2Jy9reB3TdHYeMmWg7XUuF3JV3LDrj/M
	tTwkfvejuyRpBQYAFKYWdg2Nv3Wh89PyTg0huNbgJrJkwn+Qg8mNxUK4CdMIuakegyvdPvtlXjd
	1alua7Y6ClE/ExzEL5H7UOurzAh2R555AFbpubKhHP7r2VTLWvpGg3WWRnTPkOI8zzKVQn9TOOg
	XXYabafvlosqWi+4zdt6TAQroJBZErsgrY13mApjyxzWwWeABoWRpdNA3gEABjutIy6adsB+WPn
	6gzqLS0spS+EYdhjPG+JRqddbEaD77KBQ4GtQOyVI0IP/WQjrBhA8n9d1hdcl1Imp9JO1263t1n
	X56GhbEpqAZMMutBPmRvHwqUUnKxepiHQ=
X-Received: by 2002:a05:6820:212:b0:69e:3a55:a628 with SMTP id 006d021491bc7-69e68c6f45emr14348471eaf.44.1781102792633;
        Wed, 10 Jun 2026 07:46:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4644ddc2sm12069165eaf.12.2026.06.10.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:46:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V7 0/6] Add Anbernic RG Vita-Pro
Date: Wed, 10 Jun 2026 09:44:01 -0500
Message-ID: <20260610144407.438846-1-macroalpha82@gmail.com>
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

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: Add Anbernic TD4310 panel
  drm/panel: anbernic-td4310: Add RG Vita Pro panel
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/anbernic,td4310.yaml        |   66 +
 .../power/supply/sgmicro,sgm41542.yaml        |   96 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1327 +++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  257 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1067 +++++++++++++
 11 files changed, 2840 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

