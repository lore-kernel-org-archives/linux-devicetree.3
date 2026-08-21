Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3638E8A0
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315291; cv=none; b=Uw+ArIr3r/Q6CvmyGUujpCAansdR90jWo72gcPnoxIuMwnkZF/OoP0zXxa5W7pDQBQppd7RXVxziO9iMWw/FoIt3JRg2QCNU1+HGGnHc26Ywt3+ZlF4b7qlUuOytaI9d+2+YGijPooRmLqW4E6pSTB5WvOy/1Q9l71nyOFOWaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315291; c=relaxed/simple;
	bh=7HjWuNo7DNTNj7Ool2zN1yMEnn5DAV/xlNVqhA4KaBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIyUWAWeFLkYfToUA3osYpNW6eInHWplRWBj7eIZirl9Dj2UHH7Nrus2SBLlrld7vHf7Zxsz/aiF7piOv8i8k+hlbhZcg0jpPumvDcFFCkbznjw8SuvfPx1yash6xjXZcrATpIl84xKLuwAA2uYd+fnNOUst3VJq9WtyORtbUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ0BjUwx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ0BjUwx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so1909876a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315285; x=1787920085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=BJ0BjUwxWwgN5DAaKvmg7tm0Cdy7hwgKBCHIM4zmWOBozyRnTYrzPE2Wi3cngqGdx5
         VCidWzr0w9CTM9PTDcVe19Ge/Dr/+pDux++EKQUJAhPja9NH/lEiexgmejmOR6Z2Myxg
         XLHijt/CdnJoS5TwwP599VnM91jOXIoeBe77/D2dtgXBMOTNXXA1D8xlZwW76WIEHFLM
         Yj9at/MIwtVAAfwp3UJqMtw6yqJJpaXnasDYJYLdXTJqLXgY04RoW7RM44zUZrdJ2/+X
         PwNcFDsEsr6NCkKEoq/NnKSRmIYJ7RjFQfHOeppNSTlM+AFtfbWGIgI39gNKAM75mTsF
         i1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315285; x=1787920085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=FHbOItElz8FcJbdlkV06S5hC4D/UZP6Pij0NJ8fZxXteS1lJ91WPLdV+unoEj+qy1b
         emn1cvsvjYZ4VApDyddPzgVMvhA5NQUdp1R3vTLV4dRNgrkQ0dACZg5/Ox0p5tIHDYQw
         7kMai35t7EMIucxzM8cUzgTr+vud3nx195ZgKMqgrpSN5bgiRPw+8xU32pVNZwpFAIoY
         Htxf9X9NPpvClBIoBYyTcUfuQyVp2sXrovZ1qeWt3+LZcN6JBnr+qI0bpsdOB6038vjk
         zQnXVo1ZiGLiA64jndtS2qFtQe/wgBVlX3XTqrT/g9izFtJ1a7JUBtqBfhtdL69WXO6y
         NVnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro74ey+jBUg6eETlNunjxcumunJKq46gH1ovFU7+MU0ngD+OZ8Bzq4gsZDPeQL+oroEG0Ni7vVCkefU@vger.kernel.org
X-Gm-Message-State: AFuF++lGzpkdBHdXWYubhNs+JO+UbxLOlvfQTzDS4qK1fTBGo3bqSnYh
	fDt0a25ebL4SfSrGK5RR3v1FGQABar4JWTqzydrUWLYi+Br2sfFBgmFb
X-Gm-Gg: AR+sD11Xt8hZof8YRyhI97TvkTQBGFrqU3zR7WV5CnpEuIagZStslkylVx/OH5ToNqx
	Xg0A3aTZnyaeslVFgaahhmGici1UpgQoqLrVZy4cPrsQqq8rY1Fc+2v5wwY/DmQTdPa9n28Oq7n
	JTopP91QuaOIW+KQUl6tWnPp2CT3W/aJrvx0yoLL8yK/aS51jiOdGhvqvX1sioqZ/5s6FvpExGQ
	Tr9f4X7R9PdmNAjNH/lB46OcUvUhxbcwVScKBg553cO8HtvQn7WUaBxLLOYyDINpvxkw3Os3zxm
	mmpFubxXi6Urk/sH1aUzYDiAE4KIQREwryMshvHkmwzZY3E69rVs1e3YRH1LtFVsxkfKIOS6JaL
	+bKAvVQUqmFiYOzHFvhfIwlGolYB9DWHnlvMvXp0IFBEaDnZ++UU5UDyqCwv3061KqkioAZU+e8
	iBG5U0OefjcYegLiSZYGOi/AGyTwEurqd7KEKT9vlzagUAVSEMamhkdp+esAitFPltlpDucnBXN
	fWsbh5w8A9FFeKLdJUW03YaNvMIO6dRWCgBsXWWuNBUDmmNpfuNSfrw0w==
X-Received: by 2002:a05:6402:380f:b0:6a3:9e00:8ed2 with SMTP id 4fb4d7f45d1cf-6a42f27795amr6967378a12.16.1787315285116;
        Fri, 21 Aug 2026 05:28:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Fri, 21 Aug 2026 14:27:49 +0200
Message-ID: <cover.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 378 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  64 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 633 ++++++++++++++++++
 14 files changed, 1471 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

