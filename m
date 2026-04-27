Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBD3D3D0B;
	Mon, 27 Apr 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300179; cv=none; b=RJ9aZoHP1hJVQPnnmOOipLwd01D+gLZ0+PQynr+YCjMnZFvRDG3vH46Poqd++ZfkbrKNZFYisb+aTRg/gUVmjaE5419LOEcoiuPWFZ5dgB1/P1ZKQWRc+nrMGo8TDgvH7Egh7D70asvUIItFXCbmenmi4u07NleqyZh94NpRnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300179; c=relaxed/simple;
	bh=//KCYd4sUbFf1VGVKterjR2zPORTkGpjGpP6pVIc4gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7rVoTGxBHuakc8m7Hgpjv9UjowYYWeouocI4XZcFombLV7ngs62OYh2kXkidvN+nQIolQZ+14b1a7/S1y9IaJtoAJWZsvf1SP/M2mcHGF3FtXsupiZndLZ9KhdYHUX6W5RjeNmXzi5OcXnLjRdvArII3322RHBcgwnXQRakV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OBm2Oc5R; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OBm2Oc5R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2BAF0C5CD4B;
	Mon, 27 Apr 2026 14:30:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD899600D1;
	Mon, 27 Apr 2026 14:29:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77F8010728201;
	Mon, 27 Apr 2026 16:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300174; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=IMFvWn4bMUcIXQpx/OE+bHq9xpHDeiZjz5kCAiCvPSE=;
	b=OBm2Oc5RhoK+jY+juB43n1SFGuNEXi4M5PKpopAuBMfJF2QZ5rEgo5rDJb9ZCbItBMWI8J
	KSvxANLmV2wspDotACNXnb89PvoNj5lYp05ZGiliReQBRGQcWLsDnMr1PZNkR/ypRl9CYl
	qa2WEQ2QBXFR4/AGck6xDDzPlk2Xx0zxe40tKHVROBXiz7oTR+GUaNF97+TyriGFY39Q9P
	4JN7wxtK6mvvTOA1w61Y4qD6iLo+j1W/jrrmoc3Z3aeUJWDIiVeIBTBUnNNl5R0/oj8Pb8
	D1ZSCk/h+K8GkuPWcJSrHL1ANyQTc3aHpepTgr1a52goz1l0ok9XBqwoCFn0FQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 0/3] J722s: s2r: use ti,j7200-padconf
Date: Mon, 27 Apr 2026 16:28:58 +0200
Message-ID: <20260427142901.341861-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

The first patch adds the ti,j7200-padconf compatible, and the next 2
patches introduce k3-j722s-mcu.dtsi and k3-j722s-wakeup.dtsi, preventing
using k3-j722s-main.dtsi for something else than main domain
peripherals.

Changes from v1:
- Add ti,j7200-padconf at SoC level instead of board level.
- create k3-j722s-mcu.dtsi and k3-j722s-wakeup.dtsi for mcu/wakeup
  domain peripherals.

- Link to v1: https://lore.kernel.org/lkml/20260420131735.3833993-1-richard.genoud@bootlin.com/

Abhash Kumar Jha (1):
  arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible

Richard Genoud (TI) (2):
  arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
  arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to
    J722S

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi   | 24 ++++-----------------
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi    | 15 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi | 18 ++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi        |  2 ++
 4 files changed, 39 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
