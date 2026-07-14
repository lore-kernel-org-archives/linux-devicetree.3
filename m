Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83426FA5A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046866; cv=none; b=cqQdF1ax9Eq7jnqtVPMVO3zWQNBCk2UergsZarBPgD+1K0Xs6zojLxINfFPNvtYmRfCX1Fh/WS6zXgaVnOOGHWdOKL9pn3xnDuN7YzQvWnYR+Sa2lwKI8VfGdHrUCtG21xhxfCoS8kPxDTpOAlsBLPPme3P1nT1FIVYymttziuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046866; c=relaxed/simple;
	bh=pfbliwIyP0P6ymSlVtFlzS6ExrlQ2yEYQFBgukATFxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6c4vQ3xCJ7nSrc4B3he18iL0/wr3QtVkx27GuNU130CpVGc6HW3vdBj0EUDQyfcLle3tquRc6frcZjp4PlcQPpev/5Ady1I4wPVSHfU46JOI2gyCzPR5TOh75AuUMPBK4UnCNzWa72uoc0Jpn5rFeRD5aXy32v7LOD4IlMnnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjA+M/AH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjA+M/AH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47dec32798aso4629411f8f.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046864; x=1784651664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=QjA+M/AHIjhLUTdCbCSLwpxamdLe5qThBLuO4kMu5ryRoFEUf8hTBvdr70y8GftzIl
         Bv2IhRrFFd6FJoFsIBuFRld62xO6V4lMk5oXVW7gGOpdGAYcySUP0TwCaS30sSWJus4v
         winIIGacZgPZ/LZM/DxCGfyNoQezZoPo77WMuS+vfOa4sMF0xDOfTbw972X0x8aWDwai
         OVBXR5q78jlftX2NEKCk9eGjKvAoT49bRRNMsp800FV1pDWkjWVo3SknZIBSzZAC1bJ2
         jWvAqanWBAEYf6joovCY8bXtssHOVcMlCMj/LhR7szAyzTnc+iM8uDcUEyZefA1oECe7
         TeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046864; x=1784651664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=TANkY6NAlBxLUAWi/k5IysEqKQRVJJdytRZCL+bRg/v4bZWs9MiSmES8hjzuLxoYU7
         1RqtWAGHm2KZnLZG/zYPMZg7T/dNOtcLPlunLqImD8nJLnwKb9AtIzWR2iczG+hV/aL4
         4roTnCJSnhFMC/CqD5ylg4cwVE0AJpdtqDemwWcvMqf/EgMruWol8oB6dMuyFsX2iMjx
         tBXPSjYp1teztkwSQZ8fx09Qtchqpt7T17UbrjP8lQKlFDAvz4m/r7kgq/MqSP8OnMzq
         jDhujOdvMfmBqlnCakXNxWRiDG214zrRlL/ntibaOemLp+r4EW9/HVfMQNeEpTAwTK35
         YVeg==
X-Forwarded-Encrypted: i=1; AHgh+RqT5wTSGkYaZnQP85hD7LQO9hvNQiTfGK5ae4AgYwM4WHy498J11UbZ+WMnnz4kBwQgwvLy+ijnsq8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4MCmwEJ32jmUsJhN4FZUUcZ41IzcN3tjIlBbdzc53Y8ztpPh
	tummPKcypHXVil4S5MZyUifEnIJUM40Z/kS40yDu4Er4uSG5SFOZZUjl
X-Gm-Gg: AfdE7cmKxaWv9spb11hSMQRCZuMtjlSt61mAylG0FsKLwRkiQ9GxAHGfPr7KIUr5Ffz
	ILX72XmVSeTlWRuLh/jHoawPMW613hUkRHkuskeAP0Ct2/g9TPpthSCW2RNXfvfl7ZqzZRNP81H
	gfVMRjvYJYVkH+8z55bBuNIgB+viaVTU2/2sz2ti8qMK62sMGKUOCiQ/bYOtpnCgX7JCUHGMg22
	tMSuHicasbJSRSF9JkLbqSuBjaTms8w+EUq4tjzi4IXI90ejUZHHOkglNGRIXU9EzfLRmwLW9GE
	7/+xrz2IQvNB28NPAHjCgvCz60HnNDy4uV5ibif8a0OcXVCA3UON3xhsqnIe9YtrdSyyfSmpJ1a
	8HkuxYU3n6VNwMey+qdcVma8CLgWeN6WmcUd/Jveb4KaXIZg6EWtORpjYQVY2HfN1V22w6AI0U+
	3/sc2DoSXK/0SOGX6wkvdHOr8m7m+nCGFmvZbuk6KQZp3oigAxJanSTpQeJ7y9KO+iaig8f3A8J
	QAB4YQdYu8ZZ/Bzdepo8Q9gYlwJFVqMsZ7R
X-Received: by 2002:a05:6000:230c:b0:47d:fa32:c895 with SMTP id ffacd0b85a97d-47f488aca25mr3891903f8f.50.1784046863533;
        Tue, 14 Jul 2026 09:34:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11213909f8f.18.2026.07.14.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:34:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Tue, 14 Jul 2026 18:33:50 +0200
Message-ID: <cover.1784046629.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-MINI
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Fix CAN interrupt level
 - Remove unused ecspi pinctrl gpio

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 516 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1081 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

