Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68E70836
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571588; cv=none; b=n8vEVTgFrJZyEMLEnmXW7T47YBsVD4cdIApr3brcgXwiJtfpInyazCIBC4TWriitUkSghL3WSHkwpiF3F+VXDY0dn6htx0qxFmRpBZxAsQU2gQytLEpCj0nEcPw97vrs5DYeZQVP6F9iAbPPugpfLRpd/P3+MqRtYLAQ1Hebozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571588; c=relaxed/simple;
	bh=oOPF8wGesowHZTwgzTTwlv6PG/+pRbuklz/XtIB7O/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKfu/VgNybxPJV8uvuQegAOyL1JSJnOUJ9gDhbIlGEBRI8peI1+J1RM+l3JYnnSoUzC9naVhTdrp1fwizFgZdFlJeKK3LT96x2MkckHKiXCgkB1L71sD5OS8hz9AAAt38EfHrNaSF09vhcyGi67SerFK0YecvJlu3/FwfuZ8syk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOU4h+qu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOU4h+qu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49249707788so15349685e9.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571586; x=1783176386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=XOU4h+quX5ih1T7B94efGI1rwQI0n8nt5wE5iN1iqGb5/3tzpdFR1S4AjHoyxFCGjf
         3a5PZGZINsFCpTO0hl1Js1b9Z0T8mpP4iPdW/s1fCWlyHMcmhLjuDkSjTLobh+RzDQcu
         +oa81x0/qqJv1CP4o7H0/3CL0yLEqXiP6XOhb8ulY8IJbYwZ2bPxV73eCCiFNsLs4fKt
         isnxqHJVCMyzXl5HPMj92tDa9Vxl3XbvovS7fsbaTUOVvF4C4YEbEpz0z/rgjFUoMVqx
         +UznI2hQmZnwpglVRPvcKGt1qT+nFWpDKpn7D83B7O8kejdzpZUDbWeISpoi4CVzvelm
         euOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571586; x=1783176386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=jTK7hRG5SLkXhdcxlkzr93mpcG4WRTv81e2fnULNDNoufHO5ewFP/etVik+z985Y9Z
         S2qn4x/I0Y9umqc2kHN6giQVuI8AF5fMShabtE+SN0Vpioob7sWhA7cmCNJTdqASJjZZ
         YbWYhkF1kvlFi5PEIiQ5RMqp5ew6hQgH/jNlZwO7vJhossFqYbXuefB3zQ5o0pq0dMfr
         mixpvYdkL7QZRnD8fzhcFqtJ2U9xKsollwhe5RUcDmeXusgd58x7ET4EKEQ9mqQy/RW+
         efni/NsJzWh3KuTrjnp87mteG7sFzsb29bwfuAs4BX9iyCJSASU29h1WzqbPLA9GfMI6
         Njrg==
X-Forwarded-Encrypted: i=1; AFNElJ+CXIfh7hw4Iogy5ZVAbApHcb9q3jHzGK/X/kZOfK2PS0Jt2/BNG2CuBu9h9xglVsF1MIYTrQKYZRqZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXFsGon/NiVaRs0ytQLslemp4F3HEu+KXeUVx7BfrFauFimi6
	oUBkQvTQ3s/fdA2rtpT9hye29/grvzJ8tGC/Bjysb5sUw8s/22Oh+Wxv
X-Gm-Gg: AfdE7ckKtm6ntdYfvFuG68a0jPXY50CJQIswZCfaMKLNli6Q5QO4fR6NpiFoBJKsFck
	O8qKDUxLfN70mlQutuV0DBAqA+HWtvpXyFiUe3dAvFbT5kAac9mCPO46UTzeEOoZaFCYgw3Mr67
	w93y/XSzsADdBomE299q5JCY1fmywBbxu+DPpZdbA75nREBjadfc7UU9BszJHTWdf0LKKIShK5C
	qD22fgfiJAicTPLUJ1Wl3CV8nJphTTKZ3OaCzoLCRAaIz2wDCzkYVGwDjW686X4Dx7D35c6saVE
	/h/6De7Phci+auFrpiRUNyW21MG13wZmftziS1so+4xzg133JLfQp/6ftmEsjvV0TFYJMU5XV5a
	LaOexFYxxTfyfjlxUYw/4yI1nIlRXy4CktBtN1ddd4pIaC1e9OOymwCiVusPfcf/ifGw5gExj8l
	K6KTOy0rd8I56ANXor7A+Olvq1APx4hRO2NuUvSb6r4pwM1zUxwi12DqDtnR1o8MKhl62eLCnYv
	QJJ4MYeOJ3BPN9Y7Ni9dr/mGxQ=
X-Received: by 2002:a05:600c:c4a3:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4926fc8822cmr82329145e9.25.1782571585491;
        Sat, 27 Jun 2026 07:46:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:24 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Sat, 27 Jun 2026 16:46:10 +0200
Message-ID: <cover.1782571383.git.stefano.r@variscite.com>
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

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1082 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3

