Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A9348463
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910660; cv=none; b=oZj3RutiyvxROGzjXfY4m6B1kQAVVrny7ZJA037fhlN7CZyEypQyI1vnaXR/bPgJHvBQPRMku27UhinXk5B2wBB6WlwWOIAelsFomSK+wwqXkUgYLAU9af8YNM+44VvhscAy+i0KfXZcyGWv30sJvw4PFytxaPInl7OhpECe9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910660; c=relaxed/simple;
	bh=En/q0heF3qYJlklctPna/yGfSfPsTXtMUWQ44otHp0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/rj9XtXUGDTqqK5FUfMRilI4aHmMGAs/4SMlzeXWbrtUTgFDPvIRTYD2VysZZVH9sabymGXEdKkpkbPMxERSIgAS83N3C69R2fME7k9qnHynS/zewnkQhzwBsybl1SQjNwBtNd6ZlYKiTGwSatv0QSrirbdbACbU++xVgTfMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moT36xi+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moT36xi+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so43677795e9.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910657; x=1781515457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=moT36xi++VHVCOXqNWZZ5IpRh/2CPb0RCqUr7BYkJZbHmOtHE5vghQElDrgBSfsaaK
         4yp67mRwQVwuQuwMQby+l6R/adYks2ktz5f9QLOXYdjQJpg1uRrwtMhKxhM0geAI+pj5
         fc+8P+J2UCN3oiM4OYoNYp2egR/bTBOE0IEH4scUUt/JOu5DRb0NwXzpftlXoP838ORl
         CnmP+4g/JX5lx42BUpbfdKpYoWSJiCTxGO7E1E1LrHa7ZZqcOs/5EzOqLpT931mBOPb/
         5F0SfnqwoJVXCSpCF0q+mrMO54B3DyapfVGZijR8KodtQhZuekZvwDiY01g84VKYFgD/
         KcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910657; x=1781515457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=iWdrnGqTr/iWE0aBM+GKv6McRnSqFG0HfAXJgoev8D1FBfr9YMi/sk9gOg2ob/X93C
         VOyt9IE1WjkQ23lKUu5UlygYHg/ccJBy8wUR6LG1JKci0Yk8QEjWFOib2kFpSYdr60EP
         sTPEQuDtO4M2XCQVMNMizrkA7tB7JJ/EUNxHNjwUWFqXIVK4ep9fVp8OTznTEf960PQm
         VVgV0TRGAnuvA9Xg4U/GcqO+emdq4mepe8CoW3WTGOettgf2gwdmBaRyleLxBi1KBYdy
         BB3umGZdFnsX6enPG7CN9+HFERzCxh/9PbKuFTS2/6phHAayv/17uEa/4n3IvWKTekwM
         tDpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZLlcnxgyl/CG25JB4NCbJ1lCFF2GLWge78/w7z8T/ObjUKGmP+gpVhrqGWgeqry/c5AA6irJMO3Z9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AxSYsFglmQ+7ECgn1ULosX6jqKoQLhCBig9/Khd/X1f7IFOf
	6HV5+vtXq2zQPx2uaPM2Tq8KyU9Bbjn7JCgXcZHcjiUxlmIZ2Hra2LjY
X-Gm-Gg: Acq92OGlA1D2YC6uo30roQPgZ1UA9cAeqAWMN22bwZngQvjKRwo8KeHczXqKFzcrKiF
	Uc12YZ47JsHa5LSul+t7D/sdQydSo0VFcKSuPuZuuAOgqX80v2+pm55fiYBOU2/2ekh1NA431ms
	N4hBch44B618lXJptp1GkeIW7HHTwp0J++S7HQVEL9vKv8tglu2BpkbcxDPVR6TN85bXnG69W4I
	e3C1HbeNlOzWra5JZaQEUh93FzdvDk0ufKi2miOwj/b4AxaYTn67yYP9JjtBneU1g59G2lANUs4
	LqL0hEp1nvP8ElGvk/p1maenoRCy2LFiDuFQ0EVa0OjEucBdADUCDQkzLkFaj/qk76KWeAc4Zsg
	GOpbC6kYcKm6GL5285dLT5yior7PWqhaqZ0uWAHNJ/F0pgG2ne14CIUKrWYEj/0v2WVWxq3Uq3G
	eHZ/AOJXk9rlsh0r+de9ogK2uhSjvAdYX4tTPUuNxWW1KKVknYfDwap+p45CRSlQeYQ6FlcAC3L
	Zxzcj740BdfN7ajOc+C0CyKfmsyT1bOXSuIgnV1dPebABRC
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr233896345e9.29.1780910656960;
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:24:08 +0200
Message-ID: <cover.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 716 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

