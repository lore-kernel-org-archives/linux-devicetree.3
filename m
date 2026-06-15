Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F53F926D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533558; cv=none; b=Na9xNpV6LUNLuqDxNhk6WeG7+DzZRGoSjRrKSpLOEnzE1ZmRahEfj4OYmRj/vOB2jeGbxSJFBmrflktdGadpEJIjjxZ76e/2ZrFZfaQnbjGmdpLc5iCNCgJxbu7y6f85XVIxDqqEa31CUASnwLDclUMLLZ4VXnA62BRNsIk0avA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533558; c=relaxed/simple;
	bh=vGkYE5EbNX67cgweAxxpCRWreqIevxM1P/7Qp2YYF0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VA0U/QHls7mXUMmV0p3KbsFB97JptfZF530G4sLkmU6ai04iSGvLnPM7SOUUQkfFvhi0SBJ+7uUGkffyGQFMkwQ2DDe81zuubEnhkfE7EfxDCux3vA9WPWAe12Nw/vxEk04Xu1aq6t2QAcPuGzKTTll2JqNAefR2v5MsIaZRegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej6Sbxdy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej6Sbxdy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac10e337so23710175e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533554; x=1782138354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS4hKl08e5fFQM7CS+6rOZwYJSvHMZdWZRds5aVjNjQ=;
        b=Ej6Sbxdy9Agh2wmxQ8UyI1zkQiO1hIwy1/rW+LYNqr4hNj2pPWDmKuUOlFHTTDCoU5
         olWZLcc8dwryyHWxo1h2eINwXw+gsTsK4xP1nCJ+/dZC2Nk0GHEeniTd9oDR+A1zZhgJ
         fvz/C0i5fvSye2JbI/RixMZ0l4VO+i52T81F775IfX+wrambfCRN2QlzzHwA4BsBcKJo
         Qa0tc96l1DEnqkwb8mMgFJTdjB+CSfc8KFiaLgiOHGCtd6Cp++RdYF093L/a1pIRMIWc
         tr3AtIKHrTku3Ml0bB5fAxZR8KWuCdVsy+6y2V5U6zz4a9ilndtxPI2DKTz9jEKZ5qEC
         YR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533554; x=1782138354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS4hKl08e5fFQM7CS+6rOZwYJSvHMZdWZRds5aVjNjQ=;
        b=lMLNiawOG2fvMzkGPH+1CJNIowN7wAOCA68UeFTRgI8mMm2LglSK5EHSYY+jBb/9OA
         700B6r8QenDZ98pDGWRunKBVrwjBHTw4z8YOjGtCUGSns7TWFmfeh9cTFIcrkUDO7B1B
         PjM6utAOE3+MKmaFiVAZUTrt6dAmk3DVTJB6pLJEOiRrQiFWvUaCQndqixhPIwic76QJ
         iTTvkmamPJkF1eZQ/VaQ8RFkfE2SB8IiwDU032mzfLkg0lALfZDdojDPrTjtmpW7GLd/
         XMOw4sVYB91nQU/85vETh0DyHJBb1W3um9Qp5ZJhGRiEkqkVkTOhKF5bOALFf1xw8jnX
         QkHw==
X-Forwarded-Encrypted: i=1; AFNElJ9M90fgzWFTEx6ZhZUxOyiQpY/JLrE2al4Jp/HLQSyXL5ifb9kH0lJC9Wa3W68hGfNXjGLBiFKZDaLq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/6l7IO4rDH9k+HX7KNOyQXEvyAYzfA+oK8rvTaumW+v7S5UA
	iJTgwaWkIg6GtWVC/JfYi++fvr/RAaXlJgWmrGzTHe9QdIzjsaiU6luZ5AMk5A==
X-Gm-Gg: Acq92OHQZQMW+6tsOhH1lSTHgYRCMraiwD+I/yf7KXyCp2DSKmJVP7dEJO3ATHg6AMo
	EcMpIfpJyfYE9BHPgY5Jy33G1F5xTq751V3IJRFyxY+EgfgJiKvErkGZZsMYs4WW2FUnovGB+CE
	Y4Tt/JoQtXCIWxu5XqMLGD5ssbG4m8t4uX7khHMYSsiXs7jhos9empmAi7UbLFriZmR+9/r6GoI
	UT/qYDZ7j+aOLFZlM5YGUeJ0PSwUEY88twdNal+Z6i2d1WM8kthnBRpQ5rUmE3BNq+1XO0tNdvq
	nnAJZy3ZqfNC0cgyQRQfmf61M63stg9bvvzxt1ve1L6LQfqxiOj/dsO92glQOawbbiqGku4IYA8
	J2QAlUrEtJl+/pZmZe7GMRv10TkexYXhZvox/8jUsNUbD3JhPgRcZ5kmrba6ZAjvf3lPww8fZZ1
	0AZaofJ9mb1iAWSaHnYYlbQom1PE04GjYsng==
X-Received: by 2002:a05:600c:c0c3:10b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-4921fcb3ffemr112530735e9.0.1781533553436;
        Mon, 15 Jun 2026 07:25:53 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:52 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v5 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Mon, 15 Jun 2026 17:25:44 +0300
Message-Id: <20260615142548.1373799-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device
tree.
The fourth patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
such as PHY modes and SPI flash partitions.

The NPCM8XX device tree was tested on NPCM845 evaluation board.

This series depends on:
https://lore.kernel.org/all/20260610121822.2524634-2-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-3-tmaimon77@gmail.com/
https://lore.kernel.org/all/20260610121822.2524634-4-tmaimon77@gmail.com/

Addressed comments from:
	- Rob Herring

Changes since version 4:
	- Split the timer0 clock-names cleanup into a separate first patch.
	- Remove nuvoton,sysgcr from udc8 and udc9.
	- Rename apb: bus@f0000000 back to apb.
	- Add no-map to tip_reserved.
	- Rename spix-mode to nuvoton,spix-mode.
	- Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
	  as /bits/ 8.

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 413 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1126 insertions(+), 19 deletions(-)

-- 
2.34.1
