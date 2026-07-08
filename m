Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC444E055
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515240; cv=none; b=q4QHzdWFj+pyTIkeuK5rNw4bCJ4oOu/3Jl6voS0CwFiIDgp54MMWL8txxSHoMcsr/GNoViPaK9vHE/xvcPlAKTTZF15dy6GIITwEAmbjCT5D9blOzWPoddBTAO1PlsAHLFzctd2oY1jJgKfEjSyOCt4h1NHASnJQ0W6DOla2M4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515240; c=relaxed/simple;
	bh=GNSlvejKH6BCmYXWfXMHHQdYyZl5eaamMTR2CJlSvxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HLCJ0Kx9KIsL6R3EKTGCYg4Hm6MZ4+SKs3VbMCvL9mvgYdzAquc2ydSgCbH1A47ex8lt69g+n4mg5XUhpB/OG/1k/LSvV3db2wMRPK+Kn5ojrmXLYfPewSYlpZzw6siM4hTNdkDHerjTx/wwOgPQIFRs3Q5KhP3raMsMOQYGpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BS8dpISN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BS8dpISN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c1950518so11491385e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515237; x=1784120037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RSaJMjeaGB6GcB8fb52mqXxqJO7LMKxD2/vBnG8XFY=;
        b=BS8dpISNic99moSAtleJryFGZWoVihL+K0Nn8xIbRuC3s6XXb7FI4qT7VHemrP+XoX
         kuNJ584CNcRAyn/5RQDx4emigpvKnPD/8HKSiepKJYPem8ae33bTCs5RBb139Xx4eCNr
         U/YDU0xFvyYWaA1GypIHDq4EVezwtwBQwDlFBNOWwgEJJ4wHIlOlB421+JNOTvwg1sGi
         0ESREhEreLBavyTy5jOohyYsaw47VJ7DELz7OUcGEwcP/Kzr/8XTAVv60E8zggcHlDx5
         TBrN3mrAw/alAKjQAahDzVIKh7F7jtinTT2pLq+V2MdYOIWJH91w0yOlmv9OtCRL8Ecq
         vO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515237; x=1784120037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RSaJMjeaGB6GcB8fb52mqXxqJO7LMKxD2/vBnG8XFY=;
        b=T2DGNK2OO6L55k8KXruuryZGuQpG5qE07x5CtT94gkm23R4Ivm2D8AxfcpicJ6sWL4
         2nYOMFRbViCzhLXmUdt4UjqXI5DzwC3L4sQ5LWxzD4imeKcQXX+M2xJkKpmxQVMTzVmV
         7wVYz3A8e37x0MBsekK2/pv9D1wabtu467/Jg2AFbeG3iXelxOFiTwjo1DSTvxV24475
         2aM3nk9S4bZr+IVNDXhNG2sQtw5N4iw7Fo6xQ+LtxxzO61yTPfEJSBxLqckgoK9DHEu+
         LiKe54tgv1svfj1j8dxGdK8EmqkvFLhzxxLoxHmpTtx83t3Fw+Z50tn3pjco/tRSVYQo
         xkeg==
X-Forwarded-Encrypted: i=1; AHgh+RpgNkmW+kPRoK+bQnX4PYNqsqympM95uPaB/+lW0JPPJzz/CFaa6NWmxOp3iK22I/+EFXxZl8QiqeVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fE+hh2jWuK6EoVBhkgOvVxktmceGWmu+j6nHAGP3ZrWVFlz1
	uv12+aPByo94e9X5PsQ4uneXH5YquSza8paz5iVizsC9Vm3pSHLaUVC3Ed+plg==
X-Gm-Gg: AfdE7cldzEF+W3b5AeLXK3E+6RweStM1cFmbt7TS7bYrHfZqmNctTmqSQlNw4b9wfT8
	PGwDKG/vaxL9wW176srdUpCuwjMHo/H285ZaJhHV8x/M2PHn7boOwWuYDxnelBPj/HXKjnozvfE
	Wdvguev6rP3q8IKctgkvTYCHRbe5aL+TPLmsx88gCaGx2a05YgkYttROBOBa6JrfDWzTZ3CTnSi
	styqRTMNePqMwtgFzng8Cf/yRmRBbcu5+dRxkTBlBMCM32SWsgpqSmexAK9MmdSLLbCij42P35J
	Q10iY8HiAhz7qVXeeTRQHDN1VmrERGLV0J0eZqTv2R0BczzGNj6nQyCcgjrUOyYenpTuG7X5PbX
	QP7GVCsGDmKhHiBMynIH2KURySnyB+vLzrC94l9XC98BrGAPUSkp7/Peo//7gXHg3+0aIXk2980
	+RmPxpb68kEesSt/496z7JJG8=
X-Received: by 2002:a05:600c:6208:b0:493:e542:ffd5 with SMTP id 5b1f17b1804b1-493e63706b2mr24744225e9.5.1783515237090;
        Wed, 08 Jul 2026 05:53:57 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:56 -0700 (PDT)
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
Subject: [PATCH v7 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  8 Jul 2026 15:53:48 +0300
Message-Id: <20260708125352.1915040-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the remaining timer binding issue and adds device tree=0D
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation=0D
Board (EVB).=0D
=0D
The first patch drops the undocumented timer0 clock-names property.=0D
The second patch reorders timer0 and PECI so the APB child nodes stay in=0D
ascending unit-address order.=0D
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,=0D
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device=0D
tree.=0D
The fourth patch enables these peripherals for the NPCM845-EVB, adding=0D
MDIO nodes, reserved memory, aliases, and board-specific configurations=0D
such as PHY modes and SPI flash partitions.=0D
=0D
The NPCM8XX device tree was tested on NPCM845 evaluation board.=0D
=0D
Addressed comments from:=0D
        - sashiko-bot=0D
=0D
Changes since version 6:=0D
        - remove IPMI i2C device.=0D
        - Add FIX enable property.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 5:=0D
        - Add no-map to the tip_reserved firmware memory region.=0D
        - Drop the unsupported snps,eee-force-disable property from gmac1.=
=0D
        - Rework the FIU0 boot flash layout into nested fixed-partitions=0D
          under the bmc container.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 4:=0D
        - Split the timer0 clock-names cleanup into a separate first patch.=
=0D
        - Remove nuvoton,sysgcr from udc8 and udc9.=0D
        - Rename apb: bus@f0000000 back to apb.=0D
        - Rename spix-mode to nuvoton,spix-mode.=0D
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch=0D
          as /bits/ 8.=0D
=0D
Changes since version 3:=0D
        - reomve tmp100.=0D
=0D
Changes since version 2:=0D
        - Fix dts warning=0D
        - Arrange node order by ascending unit address.=0D
=0D
Changes since version 1:=0D
        - Fix commit message=0D
        - Fix dtbs_check warnings.

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 3 files changed, 1117 insertions(+), 19 deletions(-)

--=20
2.34.1

