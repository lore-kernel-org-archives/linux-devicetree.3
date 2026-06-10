Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BE3BB9E3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081944; cv=none; b=Sdn0TWzzfaDjHc/P0VKZpQsZChxMHh7dVQjMyq8K5gWFihArQYbHxx3qCv//0gymWp7f0Mhz6mFpyttj1DN0ev76M0oo3umDhh+WPepM1Ff8yDvaGDxB1mA92kmZgNIIF9bnyg4G4wfCbqWD7gksyXHnupzEU0inl0bODzs4QSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081944; c=relaxed/simple;
	bh=bq7/ysKrio8AyjnSv7hYZVdMF6W5WSM4l6pq71clwwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Egzk0EVOm8wdB218tJPDrtJUIdNNlylgIaMdcq/DZYvyWayRQ41HV1IqVkVeM8tqIOsPH1tqQ964jXqCsQcg4ImXMwSt3iWfWFgY6K0dXSGO3JiLrl5ud6AW50LEBTtLYELWLfdiC4lZeaZ3rdYY5UnpOHNn6Xy9UHkbMkY3F/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfjGcMI6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfjGcMI6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso74996715e9.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081940; x=1781686740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=LfjGcMI6OZJyl0TAj4OpCFptusumm6DDdR8cnGCAlfJLRu8X4bmIEhV5POu2LYqO3m
         wVJMTvjFX2aYfSc+wBIsvXUQ7zQIh02lgXnpJeZmv7vesP9BB7miasPvmKQWJLjGbpXd
         UUWCcQtr+QzV1Nncl35pLJ5VY/i5I9FUw9Ri/tnSi3FO9cQ/0gzspg6XlV7dRxC+YnWK
         RTqXZ3448iM2Vz1Z0p6kfnnqVqjp2bnKLHZjYZ9Y3yYf4Iyh2qUfKDe1BewpJLv8Z2zg
         wm+na5K7by/RsjuVkRfBOIY3Z0yGzZKrbYHV8rAJRSodlhAXedMk8dqJuhgB8bYI6Ax0
         hR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081940; x=1781686740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLesgstB5gI6rcvkHIFMofsHFcc9F6itDz0/iaXQyDQ=;
        b=tB466IYRiYbTKS+morrKR2SG6zL8aZRK3OWuJZqhRBSJjxD59ZpEjFnh++AO9HQqWj
         ZOZLAXUnX/WNmM0S60gXoa/BG6BdF57/fqFkLQgCHP1+US2tv816kjmhRAE0hQl0RGFm
         ahAxrIOkNAOQaYnqBRk6mbA1RaUS/yoU3ZbAMmuGFg+vEIAFx6mwoxKyBsLxkHJzR1Am
         5gYo/4AoDka1zI1ptvV7D5URNKKLQq9WTOsRzDN8RWCYPUpUUVLbGd/69wkk1SZoDRub
         UE+6wY+0a5CcD/2isqeETuYYnxYYGwBEShfpwDa9BMeuXBXIBVv5QPtg44fXIcixc6Bv
         BycA==
X-Forwarded-Encrypted: i=1; AFNElJ/zsjEOg1vlxP6+Irz1UBqoFq8Eik8z4+Xe1zcgzf2dxBb0vbdUPz0LrMqxq3YiudV8UIdeaDsb3lZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tO19Bn9bWboCWTuOgSMp0+qGjiV8Gs83gcpye8FEPD0UL2dH
	DTTkAHrk6etZp3nSnao2ZNlZ4GMWzNw0ZXkAlYuYAgiqdtagCNjFadX8
X-Gm-Gg: Acq92OEWLhGpEfBgJHwz0d59EdubqZ66zJAYqb3hbUjRpChGmv0LgR+4CwaecGtkgEC
	AIG2gS393RvDjClTC4BzPDLHWJSzQ+jmdy2DdzNR5hGNDLNHFbiWlcT5LIiVvtXLsIvbum+bfQU
	7DdQBv/BwmPrI4AJ109DeXcwMXTobIc9gTaTSJF/SFFXjdtF0fGrMOugdCMP0NV7UlOAp9qE41b
	zINICAUseR6D67aIy4HHwn9GjBv3aU5WJV3413Stv05mzchnqHVygZVbr0Oz8NhWTZ2JwkVmUqX
	sJ5iaV0Wb54IN8zwPrmUotc1DksCHVnvtLBtHMK+sG4FdkZqlzaIu0dA9doOnK+87u1Eqb//w0A
	eSRq9wunO1KH2h5bL8d4MOVHz8WfqbNynDz+4qXRtvKAhiFY8l7pP/i4IS7ABbZ3YHyvEoXe5fW
	r0Ujlkn0esefFnEQpg6lIYd8IRjyy4ryrQRbnw6kWCNDl07Sn8iy7tfpljM+WQWNjRd8GqUflnr
	5RaqfcEOBN5c0dYJfoNzmcXHJVuPuGTu8FPWyWN4HU5vj4H
X-Received: by 2002:a05:600c:4e09:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490c25acd18mr424540885e9.14.1781081939502;
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:58:59 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Wed, 10 Jun 2026 10:58:52 +0200
Message-ID: <cover.1781024557.git.stefano.r@variscite.com>
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 559 ++++++++++++++++++
 4 files changed, 1083 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3

