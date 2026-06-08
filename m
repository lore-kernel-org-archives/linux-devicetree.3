Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D17381AF
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941457; cv=none; b=uba2mHYuLlQ93DZKJFftfydMnM3vF3GdtBFAz0rEQqmqJXbTv1CvQMdEPjzlZTmOO96jEMRnpXgPdjx7b+370I8NgEAmal8twMd8v929Mhj9pinkO3SNMxTtN0uitz/0ZsVnpHO/Zi/7eCWk2CIq0VMlw+bFWUnMwh5JtwG6pAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941457; c=relaxed/simple;
	bh=q1wPiEKA5iubCC1ch3/gsk3Dcou+/8FpqzYqebVqeyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVQY5fgp/rYMfefmmAJflu+11HZ51ub58uIKNaVHUxMMGpAMeyXgF117ULo3Ql+rakbdgWAuIKKl1KV8LSsT0AoQM2vNOii7r8nea7YWsEGLijbwebtvaI+ekDpkHSCCT+qT3UcOud2BlmSZdCg7FLX+j8nRkI/PUalSjmRrlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5HcikKH; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5HcikKH"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-486b93fc7c8so760336b6e.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941454; x=1781546254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVSlvqqOMvr0bzIovKyMDYV1sRHWvTORPbcBmLSFAzQ=;
        b=I5HcikKHceMBZetEVB+TQTGqJzUosV5dG8ET73lmrWPDtMe3XhvUG6PvloERJDm1Em
         4d7aODGNU0mzRSGCG+l1VBg5XAvEeP8czBW87v5QMU7WnjiLfbVAmPIJk1IF6JmYj12b
         LKqvycieSrMpPQRIEiRG7b24ER1TUbO2E9XEa8exvNOrCRRtjM3MFmQAp/zCUMeR5yUh
         iWZ6U1QtNzgqIBM2EIFUGcitQGZeW3DAf/IWmKKhDrquG1JyrOGgus2XjI0tQ3i4mVqD
         hIvQIMe1xI3i1Pq7FKt/7tQtWPO2UW8MamwYnadW1qcetpzyzqsLahbfhXOQjlF3T2xe
         u1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941454; x=1781546254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVSlvqqOMvr0bzIovKyMDYV1sRHWvTORPbcBmLSFAzQ=;
        b=BjGiVqGsIVmE8zwlnoxKt3sVxqwKx9xbqHTT8/dnqIMOF4gGcJBKQuYmpL2F4atUWl
         FE4FPOhSJju79tFVOGIl5+kKSdrbwePLFvN+ZMO9MIfCwEPNig7XJZqvKWEUskJPISGE
         XcfXs7Fu1QKU0G6zoG4Ks0sMXjw15lIShsMiLoW3RXpWfQnbZM0P9Ge6E9+T+L4iKHyf
         0+NUJt1vwbHfthnyJ+nvoQTT7BGS6EaF1vdZtUUmk6ED5xvVgmRB9ARpQD0GEjgf3+GL
         bkUe6lgjw8/EdOnzDyjx0DgGYdoEzFdxXUgDBMJp42+txcF/40p1HSZHOoPYlaf67fiH
         L/0w==
X-Gm-Message-State: AOJu0Yz8K9JPInc53NYBm1xnecGsKa2Q3Dc296eI1gLfW8k9Z5I3hnxL
	VjZHbDzqYY/ym6zutaYR9hrRVnnJQrZ4xPvfZqRw+vARHKiIV65fCXOr
X-Gm-Gg: Acq92OHjsKbJ5i/YkvZwrN6uHyaapZ2KuLPHpsLm1OIaQINYmfgpJGBOiSemct/lDQj
	RKNTqVJxYLu8Lykz6ok3lEPJFe+gqpV5IIYuCAGjDhPq3G8nn7jfH+Idbh55MCxbjI5nSslsBC6
	J8IlDTnTlynOPkOaDVvEvhPr8H794mwFUmBJU1fV2xX5AoEopGE5u195z+UHwtnokQTeKreIqKe
	cmEreug8zVS4mQw//Nu5YwLh4qzD1qUkBnqT9WiJf0KhvJLMDEFTA4Skw23kWVFgAIWOm3b8A96
	834DTufdSzoiud48bEi1Pf24FD6YhWIAPG18Wzwpfzzls90jOzh+2STAI7P5p/0SNR+sH3Hx11j
	MqHpoV5pAVALsiTTlsjryzChLP3vyMargCNAZMn31y6Vaa/aQ32N4QALZYmIZ2qSJf7lhDtcA4n
	780pTq7xmqBQNZg97Qc7lHD2pFGB+vx/4=
X-Received: by 2002:a05:6808:1185:b0:47b:c2a2:1c89 with SMTP id 5614622812f47-4868dcb287emr8786503b6e.21.1780941453860;
        Mon, 08 Jun 2026 10:57:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8297395sm15214316fac.11.2026.06.08.10.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:57:33 -0700 (PDT)
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
Subject: [PATCH V6 0/6] Add Anbernic RG Vita-Pro
Date: Mon,  8 Jun 2026 12:55:15 -0500
Message-ID: <20260608175521.67449-1-macroalpha82@gmail.com>
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
 drivers/power/supply/sgm41542_charger.c       | 1057 +++++++++++++
 11 files changed, 2830 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

