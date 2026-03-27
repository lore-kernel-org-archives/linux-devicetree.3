Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930283D34B5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602551; cv=none; b=Y8USax1rlB80nGFl1cmBHqiv5sfXF/Pb9Bo06/SC/Zjaz40IACNihJglSaWew765SdLX2SwtX81mHc0MMR9huAz77uzY5B3JRxM1IXddo1dWXmUO0GJCgUtaypgG+pbu24mjhWCDtRMQ6XK+tWT7CnQPieafnotIdZjiKm5fouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602551; c=relaxed/simple;
	bh=+uF3z6h7Dg/hyeyEZd8Z8rhwZCvglZs6FhC55w8ugzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6mWZJHHuhcwB+oNaV9sCKLQRgZwoeC8Kp5Oq2jdJ9CDnberT4Kk2RnlcHI51x9fUs8mYBPGY/GMurwyEjeBcT59KfzZiVy6ZF1SQ1eMdoS3Y3OSOepCfUmqTTGsnrqyCrb6mo8s8yeXXTD1or2WL2KymJsZ0JTOqp7f1+KUx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azZfHWSA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azZfHWSA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48704db565eso26495475e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602548; x=1775207348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=azZfHWSAV5T/wsJQNGXrtY5blwFkadsR3inGZOwxfNpnZxIoqEUcuh7TtHlb2xrGDN
         jvyBZhBkOoFZgvyyuL0oZESNHLh0YjcLeqm9DCAIZbgQ7ViPZ33/CFDlUv88wqvmR8g2
         bzENpt1JCb334QKXFLxuU36lX/IC9C+zBy5R4vceal2eDP9gC7G7aqUch3rFXCevfKdV
         GfdN9xRMQKKyf82jukc7OBf9GBu37nnwR83+vSBPB78RzgXmGu0h8OlozrxIm77pM9Wx
         A9v+RFY0m3R3VG6YI5jyQ0RsirGf0bG6SIcbh2G+NChHM3IlSKsoWEtJaEnv0vRY0V2A
         T3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602548; x=1775207348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=nQe5cumjFFXo/CQYXHcvNzYkn1gBPJQWp7E3+WEwtI5XBRePeK+cXj2IfwqqYlYnPM
         azhLNnNUaLh/vQFxSf9jA8McFZYWVuMbJnqloU/UsXTqB1MUu+r+J/sZ+pAeLX5M4D/d
         EsJ1a0714dGnvfuld2FsT0Dpg2v7HTCYdhkaJK5ll+z7ZXysO2ZxzPCo+sC/MPJWfn1/
         gLGc95iWkUBA3OMMtGF4LLQ0LivEjdLEHpBZaNgbA9PUVYElJDKDUfsNHPPBbSdkfZiK
         KDamJWESnilhtfNPzqBasGDpMVHnb4LPcySryZao7rIU+9mEqoCDK7/jDQjw9vO7S9uX
         rAJw==
X-Forwarded-Encrypted: i=1; AJvYcCXswJjYLiZgBxLzNgXKsKp4mCIDyVl/r83YX4D2+jU9mfQuPms2wAl+XDcGcgRt6SnnsaHBqJkF8jz4@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWXryf2ssfMId0yvQ6pLvoGY2nMdFeI124AT/nioGXeDkz+0Q
	7pIhE9feyPDPKeVid/sLU6NU6YT9FZt8gkzXl0xUcyR9m0BRB2gFedrv
X-Gm-Gg: ATEYQzxCJ2W0QsdbF3XldMXe4u73kaa9PExKIkKyc1QIYdu5DkxEgZHvch3oKntB3vh
	hMLRSwZRxq4DhVX7K6AjE2CbQPk9pp2gflou0hUoWKYvzS5ferk8NJwGoDXZdbM8Nz+3eQTml23
	tTHzFQvNL37NoCf4u2Hv6zVEw2mRoDTc8mVJHsnC/uiRibcUql5v3jCl/+3nA77JTd4ZVsZudLT
	71el9aMnYT4BbpfGyp+eECBaofrC31jtlNzRGg23nd2cwpWMrSYANWUgqcLnOlvTy8OMVKR74di
	Q/1mmx+36jbx9ch/7NKPdsBZ8bwxZ4vc2dU7tl5V+ii79bCLzaNLBXTL6uNjQeluYY/qtIyNu/s
	ogDyd3ZTODUA/zvFCXNI9CXn7yETU7Mqb1z2TFph4TucCPqbaDs/4Qej1uaLdelVnVMhdBb5rrU
	C3wbdyUd0V2ewpzAJtUJUg/erntdLvdSFyUvmnF8KLvwdgXD+JsPd5nkqbuOicpWW6nL7oa5cAr
	OFZcM383DWJ6HMJkFiCQcN8+l1zvEVzR4q111EBdtlk9yMs
X-Received: by 2002:a05:600c:6387:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-48727ed5618mr24598325e9.27.1774602547562;
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Fri, 27 Mar 2026 10:08:53 +0100
Message-ID: <cover.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove clock-frequency property from eqos node

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 461 ++++++++++++
 4 files changed, 1122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3

