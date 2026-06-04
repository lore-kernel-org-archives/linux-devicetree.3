Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236230D3FF
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611027; cv=none; b=ohqnlxwmzOgSTYb3qKF6JRdsF/X4mcCgVZZQVoTXQSD+PT3NwvU5aecAiuQc+GXy8SawUBaUnk3UAH9QnWvVydyyIA6FcTOti0nKdZikOuy0sSWBH3VMknYuTexguAlyI9C3mEmycuES4XnVHQe3k1LJpZJuo8dE5XyPJPoBo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611027; c=relaxed/simple;
	bh=LqUQSnj+nu6G5O4oj3gc3zcuISEvQMKa+1dlmviZrNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBOMczRCQERy5vUnINGuecI5P6gnzcjgaJ8pWYR5nHnYevgG2DrpUT+9hxe+lTe1NQN0gZuK7/eQcfcmX7mRp0Q5FKMAOGBnCJYTg80RjfYSGiYX9VRCGG3leVLWajowxQPABiI3RJsIQWxBjkQ0SFymSfDmko+CnzMmy8BGj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMvSDhrB; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMvSDhrB"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69e2c792289so944339eaf.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780611025; x=1781215825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVLrBm4vjTwY/MxerVmyF9GI1R4+t/U/qrvJT7nuGR8=;
        b=PMvSDhrB5BWLTZZrvDLmGhl0aTSdyirgn8jetYHMqtqDyEPv3tibObnclgZfBOtc2A
         ZI50xYNwWyJxmHLNQddJwv/vxADxKxafz5Lob4QhJ8pLG+gkZmYbDQxA9Hn8EDJ4e4xz
         +cNTdESpBHqUIFjI7DQokD0KNcK715vTq3ESkW9Urs957QlC9HbF7gjZJjT7cEfhdEeo
         po+z9QOZNaxwFNPdI+VkyVBOPe0IB4wojpJ/EFDXDekzV+DU0pusPECbH4BVomPrwqKM
         S73sJOFmLNZGRfHhgTh6NOhsAkBid0vaK7sbRuOMkFFG3r6Z6EUElQbMxgZGcqFL3n4m
         YVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780611025; x=1781215825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVLrBm4vjTwY/MxerVmyF9GI1R4+t/U/qrvJT7nuGR8=;
        b=GoNqt2Uh70ST+eVs4llurxBIND8jw5ujfhcGlUPwoMHkUzJrcnrZHSBeM8ZptIEfR/
         fVfV/zOASU6lmj0GOl8qSpXkR+T8LBR+L3IeiCneItz9jzBhqIrYTwrZizsrUQrCdI53
         /OyVmz1/iObDMOL+NjjokvESUpRlfLiaJoBU7waALzR8hrCrSkJShqsICYl7ySPA+wH9
         RL6xI7MNnGUHd6J+j1XoOE+eEfi/znOsvN7L7P4vJ37McEDHM4zzjeIUJD7XziX45Bsm
         YUHWl8yAXMypJ6ZYbZdH1/DspTFGs8vGr0ngoDrEzZse0DakTljUJYSlKV5z8tRxmFKK
         fx0w==
X-Gm-Message-State: AOJu0Yxu7vilXxoBT5V7wBalk14Kd3llgXgcpl0toes3dA2RV0UWc8Y9
	cb3qNoSxkkykIXZjSMO/F4QLpgXEDsOHhQAYNjhURprZhJTFN5EAy046
X-Gm-Gg: Acq92OG/MKp+XCj0baZGkCKp5jEimnCtUmkmceB9mZkSVFKjFpRA4sFAjhjN9DuXLRR
	BBX3RNuV6xnDN+fqWxfDuV1WiRHs/JDmmtzteVe6H3HufTUUEzfKvGdN92QXKF12bK4l0j7Us6B
	XXfwxmiUzfqMrPtegmFcH2ACVAG22x0p+dsoG73jLwhWneQkY7oAYHcXXZzVdbkDdeVhOM+wRRQ
	jRnPE8V1WipwOzKdOBClA7LFuB1qKVmIN+znBzhM8BGVehHtM55XSjrM46GB57bVotHNl/sGtUs
	WYqbUqcb8SCIxleXdNwjTdAWn7sSAe85RlhpkgIqrOah0yU1xJrLwsQ9SWGvsOK0thBt31nvp4Q
	knaG2FJJ/eoqzvVP1X64IKXngy4Z+RGTVBBLJEXGH6udpLy4rrjmD4URo764KuLxWJh1Vz1VzQV
	768Pm9Nuka8TkZYehpkyXAlBN7XqeEO/c=
X-Received: by 2002:a05:6820:4c14:b0:696:2480:dee0 with SMTP id 006d021491bc7-69e68c07645mr532433eaf.34.1780611025055;
        Thu, 04 Jun 2026 15:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d84c0ce2sm6802987fac.16.2026.06.04.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:10:24 -0700 (PDT)
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
Subject: [PATCH V5 0/6] Add Anbernic RG Vita-Pro
Date: Thu,  4 Jun 2026 17:07:55 -0500
Message-ID: <20260604220802.119107-1-macroalpha82@gmail.com>
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

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: Add Anbernic TD4310 panel
  drm/panel: anbernic-td4310: Add RG Vita Pro panel
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/anbernic,td4310.yaml        |   66 +
 .../power/supply/sgmicro,sgm41542.yaml        |  104 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1327 +++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  256 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1075 +++++++++++++
 11 files changed, 2855 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

