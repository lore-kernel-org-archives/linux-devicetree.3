Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5B3A450C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567201; cv=none; b=q+C83MNKaLAi6l4d6haaJI7lxtdivEaDRXMyjMiFOHkGaEnd729uFuuquhA+rm2OxAtslSAf+WJKpYxUeMfBSzAvcTpMZm/UOWnBnRqlTlXWpObm7YWOAKkf/U5LUhcXmbyN3qwF9qwii7F9hGXy1kBiUd3d4gY6kPE3m2o/TcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567201; c=relaxed/simple;
	bh=Z8sKP1dPVrA1fu/4bg7DrY5xY/2wOA6PX/K3W1Kci3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXm7Ktxm8Av9T9sfvtVrB1A7HCoxyrw+EeNzWsXQ26OhsJIZN6DJ3KsnGBnGihphUC6o88kSUQgyG6p8iXI4PrmNZC07i2KX8EljeqhUrGr0ia11cb1t1osNsQH1brSmprzu0fjtKzdmD+1thoz2drnzi52ZjylnKJ4eN/THOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+wGn6Gv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+wGn6Gv"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1600d040e4so488802266b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567198; x=1788171998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=d+wGn6GvIXxHhuvy9oLEGKP6qBl5mdW80lNfiKtcjgtsEilQBvzSvJ3KzpxJ1xSsBR
         3itXHtVVF3l0z3Q5ibLhRR9FRo+5aMfUUMoemab3J+wsTtmEWThQcpHMon/L7JdXpUoO
         0BnddIEIQQolLvXXxb9gkHfRTihctaSGNrQNXge8vRk60rwoorvk5tcQatQ+9+/6wi8O
         jVlec0UnSHkPD94R6sVpo6+rlp6YehZzevc+RJomU4BYBvEEhVbR2wNMOMsznJ1cpnJl
         BA6zj/kFKi8/uK5ffEbww7VYK0us9xPGkAWFIfZGhqERxsCoZThbAPOzXWIeNs4AEQy6
         hhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567198; x=1788171998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=bdctEJIzdQ50UB+dl+JI8ln5Xxq2wgbLnyyVGQf5t5XNRF6ZmMw3IowjnX+h596BL+
         w7+xW9wCNAFHqahy5XkqkFYAWgfHuapj7PuBe8Z7t36EvrvJP0uXFNOjg4cfsnE5T57i
         vJuU3LcSloNpQTX0UT7GQdSWlBkMt/SocrZH7urXu90gDqG/BfXyyJwUWqtMH97YKd+H
         0oWEDBtgECkm2FI2RuldZfCLR/MPC1EhWp0Cnu+dF1k8NWmJ8PKEv+89mk8w1L7H68pp
         njlmhi9uIGnDLMmOcp/jJFEz1l8NK96PhufhZ9c9J4rP0jCVo5A86OLejMgjxge0nzox
         HlmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl1x0bXGdabOBqMI4djTe0RbO6G8nkR7IGCyqY72Mqws89qfoRQ1UQejR8W69SWzpyhwXot6rhOxJQ@vger.kernel.org
X-Gm-Message-State: AFuF++ndKTCuN0Ai2glYHiooeYO2Ujrr+lHsoocDH2K3paiWqmDPz/2B
	fBzECdNmDgkPfAvmkl9xaZoR80V503hvdA90zdGkE3MmG/8TilnmO1z1
X-Gm-Gg: AR+sD11oAO3+vPDxt4+ehL5xrcG5KLrhQCeYOU9EeMB8d8sSb4S1t2XmKT+CF36DpKz
	CobD5T5AFEtuLRco9KDTXz66pWbPwBJ+XN0X/DYY8FiEyR3hjHjGEsc2St2rvX1Q2eCTb6OdNuw
	7YbM0a0JXGqKWpPsj//kFmQzsnW153eNJz0qwSxYkN6inqAIEtlprd9tMGjBREy/s4eMwIrpRJv
	Ik6MxJhMwMQFGb6oKrnz9m3fPILtMYu6R0mEzWWSswNm+qyBpaBlKS/2yAI6h1dDozIAgRhE9ot
	8Lmk2AmPeuqpHEqyRnL7/rgFKy6T2vNLTGXNzVWUPCtnc5GyxWm/1aus9v3NJSAjERjmBPHJfex
	AuO1OPvaTkUe+vD3lVqdC8quiqoJILSuzwc0+G2UCQKEAoaNlhV8UCN8MpiI0jVHlsjjvpF0twK
	5M2lUmMGYOoilSwJfjI0XrsO7UU9pundHrXypYZ8n7sIQefB8yJes4MvevnWK/csLw/FWpB11XP
	rwUUSExL4B8VIyqyd5ElM9iFlaqKGE=
X-Received: by 2002:a17:907:9610:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c246d582330mr2376009666b.1.1787567197725;
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 12:26:27 +0200
Message-ID: <cover.1787566980.git.stefano.r@variscite.com>
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

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio propery
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  64 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 637 ++++++++++++++++++
 14 files changed, 1480 insertions(+)
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

