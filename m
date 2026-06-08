Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570483BF684
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912645; cv=none; b=K2lnYaouTnTwFPvSEoQ0ayKeTKz/UjzMGcO3091gurmmlFGdM50A+38x1RlfAuyW0Dkkmx/SPXGIfEXqunFGTqrkd3NWZ7tMsLQabR5EuSbPFnRKElB9vkVFSdoJdnb9kV5iTMU7U8Nw+FINY3CzIsfUKXtPyn5F+kdkx0DETgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912645; c=relaxed/simple;
	bh=WBgC/I6XjiAI6oZ36An82ssyib58SxH2Q0FmTxSkU9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPptbaPpRBBzsklo82Jaek5ZrCYol4PDnUNwc8QJoncySm0kFEqDFkYwvxYRcut9GjNno6yoze3i/TmdIB3DC/BebMC9qrJTfJ6CvtbNMR5CXlvb/UoeglKv8S1+q5PaboKuSiM0SVRzz//Q8cNn3v1Be20j3VgT2p6ngHzS8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dga3lfSO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dga3lfSO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-460166910e6so2055911f8f.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912642; x=1781517442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=Dga3lfSOhuPQn38oPl2tPdFfb5Ve1EzB51A43spUlm2MhjVu/NXptAJbtgoeXjbnY8
         ttuH/IG3APauX+l9r8fLe8B8qr2gL3+rBYnaO9r0BW9ly2ri8CWC/rpJyAMPzxq53LFK
         N5owHr0poB6rCZ6sARtpnbFFQBeu5Oe9mVp4teA6kgn9l0wVVxcSmYmu+UiVMU7u5Wre
         Gh6WQWDBwqw3bQU016R/uP3y8Dm0Jo5ZERyoJFccmVsiEolcECHcrW1xEKR/OgewWTmb
         /CrLXNT7nmun89AjgG6eJP1NE6tsVhC9jyt/nXhFKf9EsM3oGyifTB59y6WijOApgm9c
         6HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912642; x=1781517442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=HIEqbjNekKkExvYp33jgZyPGt1usPvac7l20w/Nvl+Z3vRWbPn5QI5LWsjFTaOEfcg
         ilRNNNZaecB3XwbI/Pd2JFElxz7Njf0CaYtjFTO/hp4JVl30nJeEhNXBsKNNIuRnwN3R
         OdWaNYiqGbeDcCoex8njnDZX+nrMKk15P9pNaugoX4bq/RUb5EiThoL34QDZtYogK0cq
         ++4wdp2iJEc949X7ye28d6h6AT/oMywpjnnZ7ceZEcnHNjhnyrKJkd8BQeSoAEOZ+dLD
         YDOh9l31aHtjVRsQip8rEtTel3LIvW1SHZuhVswmAikF7IotG74gXIc6bsNtLnaH9IpJ
         jw9w==
X-Forwarded-Encrypted: i=1; AFNElJ9illWXYhcqSyqfwx8G23NwZ1o/EJ4kjWDL5xyuYHh/guJ2qVP+9Ixh08guykrpG68m3Tx5PPlO+Q0/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XPIzNHa71U4PAMt4fjFScV/QoX78Byk3kJ0qK7bPdWjab3K7
	toJeEYMp7hyXF5TpCc6CftHX1093J7r2uLF2ab1yL675ZWaDM7MCCBhA
X-Gm-Gg: Acq92OGqBPl0NCoXQ3snu8W5fe5gxvQMdpssPondSFCB0B9hc3kNeMzZUU0gzQDteA5
	dPwwvRjFyEGUE9UCttWuNc7jVX8doYdMz3fnQ3CB6Yrhv767yu68ui/b7H++vl21K5xJoT0an8C
	LVMe4f9AegL2yVjezs4D9tyMplLaTv3aGQvdXexhicNxqEbFnthjZKf+odzLKrTSb+tGv3WEEZ2
	kaDSsJiKGaq2t3oJTPF5WUDc+8pUwYY6PseheVmyI2KOr+sFXZGF2N9Bw7tqXn8GvFdkpaFmHjl
	8x2LYQY3yylMe75sa/G3o28vpFLLFLNkCl8PzNofL+UoO5STmwNcR52UaVFx1AN04xk1Bat9pw/
	IY60hs3O8ayFw9MB0eWzOfHCaVYG5w5tNx7eL7XyW4JlolVYUbymzJAj7M5z18ICXS4COttSoFz
	YMq2kGQlCa8w5MrmnQCFNRoWc9t+CrNwv1rIUTsWDG4WqNtJDZVQVDzWhuSYY5SBtQ68/2luQ9I
	lGSDOXNQhvyk+xodHWSHBwFdaYz/dxfjYqYlyf1bG2ZCfKU
X-Received: by 2002:a05:6000:2990:20b0:460:25f3:b25a with SMTP id ffacd0b85a97d-460306301bdmr15689749f8f.34.1780912641650;
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
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
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:57:10 +0200
Message-ID: <cover.1780912513.git.stefano.r@variscite.com>
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

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

