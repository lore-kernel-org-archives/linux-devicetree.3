Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4336C9D9
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502560; cv=none; b=ko2GfZQ6yjSRi8PH1DUxKDtF4VkkhHmv+p/Gz7T8yAOItnGIa0VYATb4v4aHf/AfdEGpaCjs+Ki6xnmAqPMGiC6MsTM08ZX8KE83YwzR3jTnd6stZugRHRr58XuR9G1d+UecDB3I+Xg/7lWfZ83WU/vt6PHfnGadYj7L1UC9D4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502560; c=relaxed/simple;
	bh=2V5ZooiLlM7dRgrqupuVdOFnXTZYP0IRthmynTtlcww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEkwBXyVAhrNRQ4jaieGeu7ShRDoyt/PXGer6wv2NQqcg2gDbadPGgl3XHiDIbnEoh076wYdO+XIcgrLMhUz9nSdHVr1AafrRy8UQk5vJuLduKumqV6Bd0z12dqJJsOZtPmHKAg7WHtljxcUgbYW5GEFPs9I0nh+9b9xMvI/UHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/siJOEQ; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/siJOEQ"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1363fe80fe8so4117516c88.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502559; x=1782107359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxO3SIwr8zcTEZ8tP4gC3esK2bDmRkRY2LStbTjG76k=;
        b=D/siJOEQAzI1Yld0JXFTyI4MPOavaSU7hcGCMcuQVHlx1X3qw6riUxhe71p5suXx94
         UfnsbqWQXreB2EhZBqtqA2ckXIpP8jbb2wWAG+C4DIXsDoqxl/UarBzonDIRLqRSUNek
         Z+6Is3q703O6oHaoQV8ebKkPy7+dXFnwuekAgZSTNNVCypij2/Bw3xWB9ZaPVUuAmf8/
         btIEPiUrXv/zQjssfM3XJU4cLtsOo3b23Zm9w4CAs1h4LDqHjM0zX2CsMF/cIl+ycIX3
         6+322ZXzhRrkO/U8LuBFEEuW1WRMut1SJKhWHbfHbMYLSPhX+7YBG0hkBXmbhhd9ewiy
         jmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502559; x=1782107359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxO3SIwr8zcTEZ8tP4gC3esK2bDmRkRY2LStbTjG76k=;
        b=W+0oearyaByowMkGzN0nN3HJWhlxhRAupyra9RK0q2Kl3S/4vyp4ZtVbzmUMhyp6Pb
         bSh26xMYR+8xLRCrYSyEkvNfQMx9OAjprmuNUDOEMijdOY4fi/B5vdTM7vc5RbmSLGcA
         ON/e6NuiLasae6br5ujQyF/tJmTDsbO5jJKz7Se1davvT/ns7TIaUKgbPIjXq8yNrPo3
         ij8XzXbqCan7jwUB184f/kacQFMzOoBJr8WCFZWaAPChkzRbLX7n9NiqVFksucG4jPCn
         DkolYraUBsQnP48vhCguvlxSKmIi50eYvzPGF8RAnGQ9PpZXi5NNDOeWL4NTKSOoi16z
         RKuw==
X-Forwarded-Encrypted: i=1; AFNElJ+SiwXo2LT1S7BhlSjPdgjT0+5FNk+94UGMHlFj60Gcj/1SvBgZcZJkYIdJ5nxx7eLMJb9mu47pF5yC@vger.kernel.org
X-Gm-Message-State: AOJu0Yydas1AtEQo0NG2PvYvzZjYT7BTc8BP+MGIWvCHl8J2YMSerzOY
	E9HfUNd8aOT6uFuEiVj+SshVu9Xb/prmdzVOgvseah3zlIDh9EiUe58l
X-Gm-Gg: Acq92OHBfFta+63hWzw3PNx2LoWhGostWk8UXfQCUBT/pCeXqCCscZ+S3/QXGbKvBOI
	cFF5hVAehdvFcefA8xa/5oMcwtO8bqUskUXTxFhPbOGXz8QxFxYY7H1exk2CDfD61r4d2kERqFz
	5qe9ALFW7rLOIlm7IRhtHI9fUVZV3VTYVT57HjsL+wndYUPuTH2kDe3sZy9wARFiTXOkI1S4nCe
	DgxWjyX6CnL7Eb69IAKINopIri7JYLShidnAvcdks/JFrKCt0DtqANMQA3M1JwCZcBYWc9j0qrm
	WNnYzeLT6cIp3O3aet1rOeo+X+V4L+MhT+moTf2Au6JKhVWQZnGT99lMx6JbxuwlyRrfPwPo8Ez
	wbNlaxB5XcMaWQd1dvtS3lF1dWFfVyzcCEaZAvZuT7fzzb4v1+rjwdxQjfMYIAPgfz+ifoFfjhR
	Jzd1gUI/L8UsRohrEBlBDEFU7gjPLhSLv0cuH+Id/RtMH4p93n+lwFSKvE/LmHhB32v45H/sw5v
	C/xI0gw182z
X-Received: by 2002:a05:7300:7496:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-308200c4e8emr6796107eec.32.1781502558263;
        Sun, 14 Jun 2026 22:49:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:17 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 15 Jun 2026 13:49:08 +0800
Message-ID: <20260615054911.48821-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

A previous series [1] added a separate phy-ma35d1-otg.c driver for this.
Following reviewer suggestion to reuse the existing phy-ma35d1-usb2.c
driver rather than introduce a new one, that series has been dropped and
this series instead extends the existing driver.

Changes in this series:

  Patch 1 updates the nuvoton,ma35d1-usb2-phy binding: the PHY node
  becomes a child of the syscon node (reg = <0x60 0x14>), nuvoton,sys
  phandle and clocks are removed, and #phy-cells changes from 0 to 1
  for per-port selection.  Optional nuvoton,rcalcode and
  nuvoton,oc-active-high properties are added.

  Patch 2 updates the MA35D1 DTS: sys gains simple-mfd, usb-phy@60 is
  added as a syscon child, and DWC2/EHCI0/EHCI1/OHCI0/OHCI1 nodes are
  added.  Board files enable the nodes and add HSUSB pinctrl.

  Patch 3 extends phy-ma35d1-usb2.c: a loop creates two struct phy
  objects; a unified .init handles both ports with parametric register
  macros; clock management is removed (each controller gates its own
  clock); a read-only USB role switch is registered for PHY0 reporting
  the USB ID pin via PWRONOTP[16].

Link: [1] https://lore.kernel.org/linux-phy/20260604101220.1092822-1-a0987203069@gmail.com/T/#t

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG
    support
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  67 +++--
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  68 ++++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 263 +++++++++++++-----
 5 files changed, 378 insertions(+), 92 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0

