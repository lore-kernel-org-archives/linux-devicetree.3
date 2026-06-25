Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8A35201B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384483; cv=none; b=hIyc6SOnHf9aJElcai3RPKN8pwZqzB8U43pUNgzyftimOC6xMWsC/XlV+1YevK/bIJ2BiWtjLHb5D1Vrz9lMpcw1FvquNpv38x+wCBTXtw7V39wtoUAg1Cwc75BlKwAI9BQ/DwvgW1In7SKuyiD6k9TGSPyEbP7GFeVZRulKuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384483; c=relaxed/simple;
	bh=eNnisl9qtnyVoa9BbRoub00ZqcY/iztZW2x9ofj5vdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUi2yFPlvf4Y2ADwgsZEsi3w9gFEu/55ioRwmMLXa+p/pKGhuTR2qWfRdilMK8okqdF8PFSNgvcCgO8jQXY77gsUXFV4WZs+fEmn0a4FLKT2JYh19kJFB3NhO5WHc4jVsEhZmS5SpvPJiDNvQtXeg0AkHDkrqXe413ooa9W8ugg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aqepoqgq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aqepoqgq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso13127115e9.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384480; x=1782989280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=AqepoqgqOnZbkMrgSTxsgdIIBdlq1ZLzX3zklC8IGQEhX+UeVWlixm1ATnudyfznLJ
         825/Qf837PEVjo+amQ80YzRxRe+EyoRpSEdqd8k0JM052tn5pZlsYnofztyhJwOGVK9E
         vfDT8UvQZw+Spjp0s5b10rthlfo0azDffbkSyCkYV86+h2uzz0P9azeH0yk6/GouOd2N
         iFhVJHsiVOStLrNzD3AT8jdWpi7O8tPoXdCNG0ptL1XQzI73gjaEELtdze//gs0xNSfU
         ycckfVAWW5nH/xIeFdKf3uuypDjBTOyWoD6cH3SzNWe0Dce+mW5Y9435oJNf+WgBCqbP
         H2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384480; x=1782989280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=pGkueZWv9zN6/5jO6dkfDVY0YmDI7NGoWn2fWMfdBaARDn26D3FvCvwd2HbiU6MlJK
         5a+wBkaQiLlte/RA3zzXm0gn1hLo3p9hctoDFnMYlEb9vfJgh+iZjCzAJZOMpXLwZrfA
         OP0BAiU7dGDd3E0MsJdoYFzhao62vS+/9uSNLR+drRl4XfygDh5mRRrdLPYMzjlhbomj
         vDji5TbsiniLZnWv/r+Lb3DdZBwFNZTlTNQjIQtm/wMDmiEkUxerYMCPQwYS1CSTMR03
         1JxeaEZfbEj5E6MPe5X9GYAeN53z/RKJ+qP4ZSZ+zyZFQ5FEcrEU8XQ2pKYwlkC+2WB5
         3tLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pEjlLJzEFdDwZd4mpZFEt4egUGCcgkTbNun8dCMBAONX2wwnF4Duc+9kn3OiEmZjnLcgkuvIeuxLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRg2K0U9pNqiewuXH0IHp9CmPYuUdqeVpXtDqOYYpZymDBAa/
	RVYT2xaFPB7hKHtZ3iwf9MHOgApaBkqQJ1EC940cuvH33zfkQ5LF4vGs
X-Gm-Gg: AfdE7cnwwkfITUlGo2Uk9M6Fem9GQWYciwuW2s01VG7KPPrljkmX/UH5GIOxq5dB0ja
	NZxoKfomS8PCknn8SWzKsAye0WU87kpxEdLLtZLdg1H3m2Iq6BXQXKcG3WGrTNsca1GsF5Q6srA
	TvJ6s0v7WHojG9Dhoy9+4uVQJD7FGo87k4WPNsFgJz+Z1tCakR4j249cwT0U4q62FHoCn2rED/C
	WyeAHpJE/524Zhhv88MqweYjnaJfIx646VlhnkvAjAEkOQxtwQwwG5kxScBRgNh4Cn0vUxT+cge
	kmEeyeius6VHb3hNPdS6TCNvx78SxaYGWIwOwIrx/mUWzs8JEOMIoaQpH7jOqD05pEymvwE2O5c
	vAX5NOZ3M7zk1OGK2mE3dk1fMzIZ8WRDC9gkVy0mrsHFEb26l6uqguhc9QGUZIAd7Sw/5HZYhAF
	GE2tnkOA==
X-Received: by 2002:a05:600c:b96:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-4926686b3f3mr25232275e9.6.1782384480165;
        Thu, 25 Jun 2026 03:48:00 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/3] pinctrl: mediatek: mt8516-mt8167: Convert to Paris driver
Date: Thu, 25 Jun 2026 12:46:29 +0200
Message-ID: <20260625104742.113803-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl registers of the mt8516 and mt8167 SoCs follow the layout of
the Paris platform, but their pinctrl driver is currently modeled on
the mt65xx legacy driver. As suggested in [1], it is possible to migrate
them to the Paris driver.

In the process it is also possible to completely drop one of the two
drivers as their register layout is identical, they only differ in some
pin functions (mt8167 is basically mt8516 with added display blocks).

The Paris driver allows specifying two base registers, gpio and eint;
this way it's no longer necessary to have a syscfg node in the device
tree, referenced as a phandle in the pinctrl node. This also fixes the
following long standing dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

The new driver has been checked against the SoC data sheet and adds the
capability to control pin driving strength and R1R0 pullup-pulldown
resistors.

This series is sent as a RFC since the changes could theoretically impact
existing devices. I am pretty sure that no device ever used upstream
drivers though, not even the Pumpkin board that's present in Linux
sources since this board lacks the associated mt6392 PMIC driver that
is required for regulator management. If for compatibility reasons it is
deemed better to keep both drivers in the kernel I would welcome any
suggestion on how to name the new driver, and how to adjust the two
bindings for coexistence.

These changes have been tested on the Xiaomi Mi Smart Clock X04G and on
the Lenovo Smart Clock 2 CD-24502F.

[1] https://lore.kernel.org/linux-mediatek/296b000c-5970-4668-bd42-b99ca78d598f@collabora.com/

Luca Leonardo Scorcia (3):
  dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to
    mt6795
  pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris
    platform
  arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris
    driver

 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 -
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  15 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  12 +-
 drivers/pinctrl/mediatek/Kconfig              |  11 +-
 drivers/pinctrl/mediatek/Makefile             |   1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 345 --------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 770 +++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 562 +++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h | 512 ++++++------
 10 files changed, 1018 insertions(+), 1217 deletions(-)
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c


base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
-- 
2.43.0

