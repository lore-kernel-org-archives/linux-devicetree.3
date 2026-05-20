Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C61F3D666A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276649; cv=none; b=rW7MnD2lYiotTyGYz/RfC9BrD6S2rBWBmtdzZiNB+9RGuQ4Kjz1L9y0QtGXX0pPGtSqYVXhRcvb/jpMHcHMF90qF9tbatmg2jf0SLrQgEZBHQuUFiTGHW7m0KcMpMPgXhj+Jr0d2dDJ7cfrIsCIqLtPH5+1viMw+CC9D2TJwTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276649; c=relaxed/simple;
	bh=VcQBA1oRltE3qeDz0h4JQrgj/SUOKJVV9RlXPu1m1Ho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4ZL/9luDLfXgjTLXQv6XO8VVzQAaR1+8Zq4q0aTDKHwV1qsBl/5l3cc9IQ7tOn08WRxkE/FPSd8eKSwLxVKjdFPT+qfukhNYNw6F5ZZ82RmmRQOxs/Akn4jdsaoRpVmt2i3CcaDUiKouIHRivqMjSUNViQmFoo0tJxlnlHeZzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUi2zs+z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUi2zs+z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so36705605e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276646; x=1779881446; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=UUi2zs+z6RJONFkaOxlkwBdMeSNDz3lF1UJtaRvC+zF9kgF2yVVPak8CtU9wq9AWJR
         lJ20dcElHZxjetsd0rFLCx6Tx4ytV6QKSkatFMrbaBFC6kghP/jKwT/t6UJzzSKfBRl7
         uB8N405H1MTrLpkwRRTf8rliW6Yh1aJ+FMWAJglq8kvIkAapIEMpMk6pblZl/gE7IYh6
         gVPczurjvqXz7EMvIbikX6D4ANH7WhHjyHYjhazqrsxl3e79ATjbk9+FhKV5vLsIk472
         a/DEkWnn+IDZCO0dVm1ltGdGhDxgxPEYeu0qAb5jrtvsBOk2/jRs/auOCUFAS4sM4llG
         mnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276646; x=1779881446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=sQ8Rl/O+6MH94It1q3c5yuJ6PXcLVSTN4D1UVYmc5K+AK58nYaOS8mXgpyUqTIDt7H
         1LePIYCZbu0FcpYh8IghnCGZRJC01xJnco+kpTiVoofplawCzesVlX1/MLn4FdajqbJ9
         6n/V+G5lS0G2BYay+BYhhKoLUGfeJU18IqLp8XLKKEhvU0H5ipaa0t9v2bLMEWwShzi0
         pH1L+ZveP/xU81k768DMZbU0OO6GHVIggV/Cxoj4cbJlwh5GPMa+5HYmBqkWRVEt+fRp
         27KKwYg7mrjcSSakx4XqYTPV0j/GrMLx6N7oo8oRSbTigambrpI50uqWED9IHcDug05D
         UTMQ==
X-Gm-Message-State: AOJu0Ywwzj/A6qtWfZuObQfl0rx/p8uu5LhvHFXXgzwIXgAJGYeA/r2t
	ckEM1mLfuo6XAhF9dRTcAHnWlrPf0zXmdDwEwluSq+cYHMH6w6hH6DXj
X-Gm-Gg: Acq92OF9tWd/UL+yd/yakd5rTg2pvprTQ4kXsvpioQvJfHen/1R+OcOLt6eGzy6PAiY
	khGPr4Y2NAHAUe4BVC6F9OAmndMhASYUP6fiqjSft6ddaOIa9Vp2Lm+MnFBjuUwF13TX2af7OqK
	WIp3BcWpg0Zfg0l2STny8oid6beP3xMT4eXimQMp9+uhHTD3UcYYs66Xco3eO9rAp9wpgk66yWY
	kIOaJvO7U6LmkmFryixuwLmAyYQCl8AniK7dYxlZD+C1ZrBlxLIVII5tIDhMd2eDBjof85oQklT
	+y6chtDwcMsuXyEoduQgLDaN+WhcWs0BOQzWiYGAIorU+7E1YwfwcHz6An2r4F//vQXe+EDpezC
	6LcLIv3f4BV+3EEPKBCTlKVbrRuecCcym8P1ppSYvZpMwtFp9VQhlyKQjIdGpXjbAegMIm8uHm8
	zzvNng48sdvSulLvziyJjNtGqO6pgXi+KuIBbWkNs24+shA3qZNVSw4xHaOH9LdrsensWpYAWa0
	pBA37MLi8kmTmwcTuJGzQZz3LOFAbMR3RL7tJ5QsJx1dSkvE4AkSX4iaqlNn/sUsfYGh7Rz9kCK
	Dg==
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr245274475e9.18.1779276645662;
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 20 May 2026 13:30:31 +0200
Message-Id: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFebDWoC/2WNyw6CMBBFf4XM2jF90EZc+R+GRdMOMomAtEpqC
 P9uJXHl8tzknLtCosiU4FytEGnhxNNYQB0q8L0bb4QcCoMSygojJLoQ0M0vvjvkITcGa6WVsa7
 TQUko2iNSx3lPXtvCPafnFN/7wyK/6y9m/2OLRIG28Sci6U0t9aW4LlA++mmAdtu2D3ufFpKyA
 AAA
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.15.2

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v2:
- Add 'acked-by' tag from Conor to the bindings patch
- Reordering iomux by node name
- Changed Francesco's tags to have the Toradex mail address
- Link to v1: https://lore.kernel.org/r/20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com

---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

