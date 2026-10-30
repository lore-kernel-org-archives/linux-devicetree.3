Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378155;
	b=IOk/EzK78stDmGucFslcglX2wUFMXHv4IojSAqOQxUFLDFh3Yb3Aukv7t4tQl/bd18D6
	 WK+/Um7CaWJ7TxohClTLBFsOwyZFlnIB4uDX2LEl8kveXyzJK9nFLq/HjlMcbuMMMG0hz
	 ZLyns+cqgvhNzknW2yD4M/Z3dmPK2MoPP4uZ36GLV61DIiNgKwenRmwpqQ10flvwOwtpp
	 fkMOHRyrt9Lg958oeHj6m4Ns2rBzvrG6s7oDa0ofene4VObh7r7az9jxUWhan4B+p2rPi
	 Jb6CF2es2F1k6tL7VpgMm4s6SO1DYu4fQjGUGSrfEmZOvbI9jzlSnFTwvaXosFLGvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
	b=TQ8ly94Oj+WFs0zEy02qf4G+Hj9K04wkzNo9jAEJbqP7EdI4RdAltTUXOvtp4jChFckU
	 6Uzachy5LT1i2VqyWr9A3s1hKo18Y87D4zAPdTX6vDDROSr+kM2WsR37ecSTt8VCpWG9x
	 JMgFJsuRs+hKGRuNNBlxJ9tua7HpFEeRHEAQkGaTLfJnjuTu/1Buhnv+YPU02G2rO58Vi
	 zra0D3Zd8sFrLG6KAfhcqScfsuTXW7O08KiU39/L6Yas+tK7S+bfUpJM78V75cmKW/kdk
	 IX50UNquSANz0vAohqkCJ1y1WHjdTzbphw96aThs9JOXsM1iUqr5ShtgGYnjSWFvYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hsRGFSSW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C2606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hsRGFSSW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8438395e9.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378153; x=1793982953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=hsRGFSSWo8wApRPKJHaNm6BbRbpz7q6s9AOrNTZBhYQL1B6V9gWecyn4zjjveUMsf+
         RV8gOsrxn6DwVt/VnKcI7rAFdHt9esplQ8tYcjO+5O5qMqQPgoutG3SQlf8bNn0LXRZD
         hMERcILGw5DQDrRZdN+/d8NxuwzIQYvi6S1n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378153; x=1793982953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=fZCqTCRGyJTsGEFzbkhNv0znPsP8aHontj1MmTPyn0zgnPo9mrlI4Hw3jf+UlNBiNy
         Hg6RdkLgoU1fpi5dhQRt0Lmps0CgFnVjwOs4hTQosrI3o+MgIADaTc8ppV+aXI7sfCTA
         VNV9zYMEqZGd7k7Wxezk339SrQBt9dnFY36BlClAoxDVAY+Iu2zlL8DirVxovY/bTeoR
         j4KNY93XwDy7cSP/qr9bbMbHCH0nG+3i3eQn/kZJGXgiaUvGvOoACei/f2T59TdnWThL
         8/bTZW3Isyr1Jrw+cbPErnidKpciH/TZqOg03iN1ayFTNIWjR5AJrkonmRk1lOLb3FIs
         EDUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpZxwjqO62m+REYs5odOCEmaerzfp24mSPkqJ7WQXU/x2X0/QQJvOv19P/RXG+z74RdRnYKMTiOoTb@vger.kernel.org
X-Gm-Message-State: AFq9FYLU8Ey1O2G+vk6LqwbFvg+5p7TmlerZWaR5SM6epOj4GVdvVlAd
	MGG/G1KtHelCIWmrnabrAflZG1ZaTBSIx6f0p0cmV3cICwgN6dHDnrWlDbu3g2ykVNc=
X-Gm-Gg: AYBFou2hvz2EaithURYwEVywY2k5R/JeD0gO3pz8Jq0attk00JGQS+hcLS9bmFrsvC8
	tmfP2OaV9n5ruzOdDAmStn3WkHkmX1MFBizB1q0XqG6SSIQgBaZXTp8c58Ap1xfn18zKIVJ7Azd
	TOece9rvusmPWZ2PlB6y0+E8rWjdIpLOoVtlkOxVLWPtM4u2iuhbVnOVe6NizbnhizgzqGyGiDy
	rLjpF7yYfhpwOY/1FlF6b2hwEsCsi0e2L2XAPKDIFE09YjggzfWdcjVc22KwTtsqbuZfbAcIuLb
	sVGISUNE53Aia1I7JKjo4/8sd4MsGiicTG8vKY058gBVs50TkD7zql/z5T+7nt2+2R4nEFM6IVU
	SzjgTiewnh3ow4w7aDDWF/TBI/RCmz+xWk/+REkffCHxu68mWeeWpXoqAbAmzQSTOz4AaDBQUCg
	j/H1B88YfDpDMvK1TZGqaZolq3Ehlhtwzr6E9rVpV22frCqZ8maw0gf6j4Tn60X/UcZKWJYHxaV
	mOPVRYsb62MGV2/CX2rE+P6WdqvDuGwuh9PykIkcgIEWr53NHhg3HK/6v+7n4PCG5juyns2QGFW
	StuJqqD3bEAJ8whBpbsrOJgvP/iXUFfwTJb+cG/co0J8xudM+lkS2PfAORFstUYJWXTCIdeEt21
	LkOKr6sxA6evKAe+RqpbYrLhb1liQpUT+L/z3eLz+n3zgugZdBnj8xmg142NxED3CT8yArEDMOQ
	hB2D6hB1uUB49C33gUoatbNXUq0Q==
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr66801575e9.4.1793378152471;
        Fri, 30 Oct 2026 09:35:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:39 +0100
Message-ID: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Engicam i.Core MX8M Plus Fast
Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
SoM.

The support includes device tree descriptions for the SoM and for the
C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
LVDS display (C.TOUCH 2.0 10.1" Open Frame).


Dario Binacchi (5):
  arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
  dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
 .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
 7 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
branch: engicam-imx8mp-icore-fe-ctouch2

-- 
2.43.0

