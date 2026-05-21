Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05936405C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354234; cv=none; b=Si7axkgwkDi2RITHx0FwJsw5VhOEbW2EfYCRTdKW6tbRvfJwF8ERi2MYp+6R5H7oIwpV5hej12hl/gCM0qfpBH08/FCbaXNNsT8By0tROZD27bQkP8lmkrT8P6vfOdgJuMJdT+Z26kHMtP325VWnO7FV3jODxImbq7mrprPTtZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354234; c=relaxed/simple;
	bh=pQEhhq91fwbtVUqeW3eqa1lnF0aujhYjaxkeRr8WY/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JALvXO6QXgum6jfbzJLljSHz+Z8nA2QL6TA5VVVcPQw/c6SskIpvZG871eDqPczXbM0ryjMvXfD0TaaPjXBEuIlRjBnQ4vibFXW8sEdOahOEyoOWK6FrlwfmuswaunWoJON1W/H0ds2wL2laBBu2LHi2XU7HEp0AhZD8LxT5QWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5F6Z2B0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5F6Z2B0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so83108215e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=K5F6Z2B00+BP9egUUn3a6gcl7i16MpJ3eXx5RiIi/oBzjoALsvXwTYWksv8OExq+vJ
         wKFDtNuVT4I89BHPq1BA8VHP+DuEeCwcb+91YLW1SZ49czTHW4zMYxjDEtcsIoTOmUD4
         7F39iN2wR/6xmxKG1jIJiic4iB9zEU4jY8TMOaldDVm2ezgVJ5jKhFeAYRJXcKIzum+A
         LMNKXBS/7bwTg4o5pfyh9lzYm0slSC0Guf0ndOd28dMZss1vQkv+FgRGz8Gdl0mza/Mw
         31n23gt82fvH+VlNY4C6KxbYDwGKJ8TLvB1TDdri8o4zp12YiaXUVN+/02HYcBLfaXzM
         iNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=Vo8qp+/4v4T0kWtGuEUsNpd9+yfXMVOVksW5WAVxIux7EFJrJ7zAEjKlmYKCthXPXI
         fOLiVCKKbwy9AdjdjFnPs0PWXC9ijC51gYSdqwvcmnD7FQLJjpa2zDivKhTLlZpO/daO
         ATGudLRXlWyS1un8qRDvkfMcVYVJeAejuhi7ymNbERnRaCSDd0aN48f7TBc90cY/v3Il
         6kWajkB4cHoVFYV2Ye+li7/FewzHSLaBx4cz2ToI4sYQN7TuTUXNcaWN+Rzr8+BaOLRE
         ECFOOlGskqPZ3OpG9LXvMKdqw/tR82LU4ZREUrcC7RQ5pvtA9ZjFwvrzoL1/lmYNWNmU
         cwdg==
X-Gm-Message-State: AOJu0YyL6n9nvjTgexSkSAbaV0dQ9Cqu288wY9ejkP2YpoFOQv6TxHru
	fdRIbfENQw0/YFTP9gGiN9wcp0MyaomB6Yl4lccWUftgd5JuAYxye8Uf
X-Gm-Gg: Acq92OFUwjpqhW0Xft2v2QYzf31liNm5oFnn9tEil/2gp5Qo4wHZc1O6Esg52Vq9Fi0
	qzFTl4I2ryDO9FLs+70dwkjkLsDx+NR9NnZ7pLljH/rmF3iOu6Dmz7AnhVh9dFomvzfv9a19DqL
	3D4viA5vL5N1oHH2s8X1vQ7PJA79SOUgjP3b+BBicNX/MRZpTbils9vpPnBjlvFej2Nl0iJqfDD
	J6LJ0bpGVcFxaIUccQGjKugBii/uckoDWGU2BjE0VE4Y0HjQdlhE4XNwikLaDGCstMXTvXS2Dzo
	hugUNlwkcA4k/xG5qFIx/OX5iTyYyoTtdsy+Uu8XpuRIZSqo1zjBmvuFmaCqeusuOy0tQINnxLa
	C2ZIwLpKmt4PZM9ClGjy6vqaDBAKIdlH3K86qVQvZThDhUTpK74EMbyHXVkr0Y7adglVwFZJbNy
	QwS9YtEkwBeGsWhiv83u0mDhjOCFeBNt5Trae7YRxqCwvyrGzd+Ut06gm6PKb0+/aRT6qyxuubg
	Lg2AE9NCS1D7BT77npTq9sf34MQTg1Ky9ZX2MA9c0+a8sLx2SZ5G6/pau1Qz4Y/Rw2R/lQbWV/0
	A6u1VSj55LvG
X-Received: by 2002:a05:600c:45c6:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-4903602dbf4mr24843875e9.7.1779354229452;
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Thu, 21 May 2026 11:03:44 +0200
Message-Id: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHDKDmoC/23NTQrCMBCG4auUrI0kkx+sK+8hLkIytQO21URDp
 fTupgVB0eU78D0zsYSRMLF9NbGImRINfQm1qZhvXX9GTqE0AwFWGCG5C4G724MujlM31oZrUGC
 sa1QAycrsGrGhcSWPp9ItpfsQn+uHLJfrG7O/WJZccFv7HaL0Rkt1KFsXcNz6oWMLl+GDAPGHg
 EIIq0E7I1Ep903M8/wCdVXtpPUAAAA=
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
Changes in v3:
- Changed QSPI_1 4bit iomux node name to 'flexspi14bitgrp'
- Deleted the cdns,* properties from flexspi1
- Link to v2: https://patch.msgid.link/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com

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
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  289 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  393 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1852 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

