Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB531E845
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435669; cv=none; b=YXKt02y59xq4k093xw/1FKXFgYUB693Runo/byj9l/mXoS8aV/OtmrzEsQIbCMPsHgGOQWOaO4Ang4VreZEX5swe3iXjihwrZNPuE+pFmgJHElQDpgsI4djEW1pEZkkBeSM88yagznpibLv7LX5S7SPF6V0j53LPXmE3kQ2/P2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435669; c=relaxed/simple;
	bh=+h4Q+5sdnZ08mrguPLcT2WErdJsDVwe9F2NEjI9i6l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRhqFU64onMDyKj89H+PjYGFZmuHjrjvVeyPvqCvbco+HdkyaxQI+HjTetPrGplflxBjyg2TBcoXcuq3+0R2bzB37kZeetDqZDpIGHTMS2kbai+0I/EN4MF6QR/rxJGsBz+Ye1HyXhU2O/SB8gydPQNc5bapu4TQEmjJAnftCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoztwPml; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoztwPml"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-486539875c1so351945b6e.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435666; x=1781040466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIuVsum5u/jtIKFcQXo9Dzpm5tHPCbQA+WWkBGyWbio=;
        b=hoztwPml8NOT9nhPNgTiWAATO+ukE0yAPkOKtCRvgWlWbYKsZY6NNmJKOdNs6wIG6m
         sGVAnc26o9BpKJ1HlDFA1MxQo7tNHh11nltHqvA/F0WbecXDFyfBHXpnsRgjiKQqB3g2
         t946UpN1j1BWtqe9fuvO9RDysNvNm8shscytZ/Kga3smfEOt2uZB6nfjXnnKzP8RP+dZ
         Exbv5fSX3S5TpV37/HQXyOqFWPNO99JP3xETcpZUlLDAuFFNVQVuOKJjHihCJCFfiVnV
         Qubq8FoDu3qssnaC0qFprSNyQ+PtZkmfb5IDz6s+QvW8VOO0w1hvVzLcKD5sHld2xMwa
         7/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435666; x=1781040466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIuVsum5u/jtIKFcQXo9Dzpm5tHPCbQA+WWkBGyWbio=;
        b=RCTx5reBhlefW9JInMV42Q65dmF5fojMyCMrWRsJbla2ANVGr3mLfsTCb14MGwFIup
         H4MML6W2sJd2/4ljS4f66lx0eZlmNGsgQIVTSSuTivUcvmI1krn2DPZfqjNJeFR7cxNv
         oir/ergwprFrVAvzdcK1HEGKUC9PwqAjIm0MdN8YAAJh9b8ejW3+Dsmvzs+fCXr63+OE
         bq6umQgiz5t1qEBiNzJGymew6P1XE0i3Iq1pk5Cyv40fhuhnwMllu3xBdUQPnZerN/X+
         Yuw/5oAPDsHrtfO8T8RUXsNVqAN5PamooqIuLwPwvFUYUfa2SNlKUK+IpZdJe/p/6egR
         GcEA==
X-Gm-Message-State: AOJu0YwhrgE6jxXGH7S5oAhhMlAzyoamzKbrrY1pZuXaN4FRcm2liTp0
	kEPTWzGkzHHZMHaZe5FTHQUMJ6a6V5uGZQS+NFpXGSh0D9ogTZr6Ynui
X-Gm-Gg: Acq92OEnXSYC4H/pqFVQxwIWleMSP1V7AJrXrP/csO4NXDk1s2XQ9VB2QXl64mNeqJ4
	ZIaMrp55OciegEfe35sErvPq9aVDveWLeEFbdxUf41CZfTb7YST9F50j8W+BrHV9O/Lq/DOMiV9
	XHuOg2jr8fWmlZZNH5vf1pp+UDcg127nEDGwKe6b2EiwAmAtW33qllAQ2nFZOWEr5EXwzBpTMaX
	8xv0PNYB+QIsz1itCpePBYuxJCF84iOGc/yUlAEnUTbMio+NNgeCRG2gHU88sbMKCVLaGTrombi
	nNXqZPZxllTD341T8e/51BSBqSqI2rGw6xLBfoaYzpJhKRK/sZPRUH3pJMBQ/oOzpsisufPa13t
	jcGPW6K4o9CNq3eGAX/vxcT8H6iQeJTO4ehJUnE1FBzlJtt+90ciLZfhumseqCc2vzUuQE/C3a4
	1W0BnhNAppEQccXC5AzYWUhQV3EbrU+M4=
X-Received: by 2002:a05:6808:2225:b0:486:45c7:34c5 with SMTP id 5614622812f47-4865a963134mr374870b6e.17.1780435665685;
        Tue, 02 Jun 2026 14:27:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a53bcsm216722b6e.3.2026.06.02.14.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 14:27:45 -0700 (PDT)
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
Subject: [PATCH V4 0/6] Add Anbernic RG Vita-Pro
Date: Tue,  2 Jun 2026 16:25:06 -0500
Message-ID: <20260602212512.418166-1-macroalpha82@gmail.com>
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

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: document Anbernic TD4310 panel
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
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  254 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1065 +++++++++++++
 11 files changed, 2843 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

