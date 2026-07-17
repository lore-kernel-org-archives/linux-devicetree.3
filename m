Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35D63E9C1F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284188; cv=none; b=k8geSEoXLMqf6dkF07a//ph0Nuzbkb/kGrcDK7r6i1Q0ljFY32nbtTcA0mIuixQooJ+fqJ+yCTTcYJ+mKm4rHU90Z+cy1l2te5DayT7i24Ozu5lgHBSQD5jeer/A+ntV/BuRb/5yOJ4SDsTNxjCyi0dwKP1VYaqRudKQTULmAd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284188; c=relaxed/simple;
	bh=Y9Mgf/wObsu5bH01+fY7QOGJVcJqNiSbSPNUNqnfhZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QlkL3drMj6xpMJ7CZvJNlEfVanFLMwaoq3ky/5YZFMIvVoSqOBeMOCM2exRBjt8dL3eix+9DLpvja26GnX5P3fJGCrN7wQ+8NnvTdiU3lkpT8uMtIaR6wGu3BFJitWD70G47b7A/dxbtx3SrBQ86Ja91uI+f/nHJj2FB/AOYWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmufmYvq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmufmYvq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so42542365e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284185; x=1784888985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=ZmufmYvqIRKfwfl6dIduXEnIF5wRwNBOQzwt0qBjifH5wIhwV4Nn45RSwgTk3ToYjL
         Sh/kMtWJLoRYBwT8Dh5ZhKw5xsYLkb/BiRgnPv9QpDUCXVd7McdDJYRElEJtJ0Bg3lxo
         2XGbGaFkGAdDQ3DDyRiDgqECPV5a+PTe52ko3W11JradNNg7NxK3mafkpJTvORvr/YGQ
         RhSHiIER3/iXeFe650yLN+YBRWdXKPz9Mzr65P6V8K5PGTp+opGxRv1Bh5MhjcWFuNkh
         ElOnmmG9Rj555juZd6Hxcffm7//x8KhXwSN6Jcg/rFXdJZoOMyZH5JvisBr77bt15gDk
         si6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284185; x=1784888985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6hKrX+f54qW1llsOGRsC3hsxY9DfQDweyuPaxBt6U0=;
        b=K12ZiMwcT2fNHqEOi3T/BZUNI4ys841/CsNm33YBLKPSfmwIRkQGu6THZ5W8e9ay3m
         kpaP/P88Q+y+/59QyERoQuJZPsq6kVVzP98lgMuRbCA38hpqjybyN8rIe7R7iUju4BEx
         SDek8I6UdfnpjkPV2WinhoODrOWOtZss0MQcefHupEOJ0oqSl9ookzQBabt9qSBW/6eV
         nrVGeywBhsmMP70nrQ4J1dsfOPWMp1LaFkJah6C14HEel60f7RKoV0z9n9D8zXSr0fbu
         PhPlwnsRu6AfB95iOCqZH5soqqREbDsVXHglt7qrXZH9nb2WH1+NzcudV2IukshK42n/
         +QhA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3mOQCBUwp9ukN4XrXePeJRLNRrOwZdAOGI+mQ0a7KNinAYMULFwQPSkqRLMpJbFqhJjKhkW5+WYIW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+s1KHw0Y4f1g3fT45a3JqufqqARiGEkUy04VFbsVv5GXK/7Y
	FbCnIRagPpxffpLmEQjrOOjzQlF36SicP2To+keFPzU/0Gbv/Ty9fVls
X-Gm-Gg: AfdE7ckSQyQx9rRsbsWGt5UihN3OHIkE6qUMjvtGovVzT4e21mkU4pLJB4oP4Pn9Ja9
	bgC5h2NhhpoJ9enrQRbupWtLjhPC2OFzSzpOG2jqhx9URsQ1ctpwaJAdUxBAUl0u9+JCWdnKAVZ
	VlRfYui6EXfTyp+qpwxdAYs96IdVFxerpnR4yTuYtXPAXDWo0GamwuVXjqWe465i6QTKzI3v35H
	ha7BitkfXQLk55WPXU+/WeFyH8kd6SQoj0i8GV+g3SqsnAhhNMqFfGsQcNaHxLWiA81R/JiPkP3
	s5THQv6QgmW2JDBKApW9SypkCQldA7k/2buaBZyqbyFDSMShAeMnuaWrqgzIsuIkcuCsRR1F+G/
	ZtPOD4mGN+vdHoh8+xsFTtgP0sjaoOWANXGs3zhVRnMOvO+B/YrZhhyhi0Ltol8xM4cK8CjwC7e
	cARKC8YIekq3dxCnBKMBCIBjcXWttJ0EhSqOiLj1qZvpSKoOqCEDUzQE8NjyXgEsWnBScyfMt/z
	AQJhY8Rvsfv/gc=
X-Received: by 2002:a05:600c:46d0:b0:495:3e81:770f with SMTP id 5b1f17b1804b1-4954a3f398amr21164725e9.15.1784284184783;
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:44 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Fri, 17 Jul 2026 12:29:36 +0200
Message-ID: <cover.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5->v6:
 - Fix regulator typo

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d089adef10f380cbdf65cbb87a59a9aab86cb0d2
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

