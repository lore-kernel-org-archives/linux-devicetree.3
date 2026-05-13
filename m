Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDF63F413C;
	Wed, 13 May 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679310; cv=none; b=QdPG4pqWuTgH3RTrVbnXbATcWFxFXoOU6FZb7st8hiDiac7FR50ik1NEVi3FcbXgW2teRBiyXZZSNM/5nopDLXXm8kLbu2EqV8P2j5XR+qzieLz5/1vOZFPCvGm5FuArfjz/K7DBQNJY0Gp0YJIDv4nwSBRdYLtAWdlCCIbd9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679310; c=relaxed/simple;
	bh=H9EBgfH+lV5rWacyg1lHuzWtpGQKgNhKzTbQrV6d3pA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S55XWYst/z2kCytzYfOdLiTOXTjH/GE6x4737+kfIWSxtnhezIWV47TEJ/P40SqB6+BDq6qQ77xAAjhlGyMZEIV5fEAYLv3+nlDu8uvx0VJjsaqV+S/ceZOhSvWRihMa3A+NrCUHgU075HCNKK09cVnJfyZZdZgIzJJzEHnyXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=dqcGHZiQ; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="dqcGHZiQ"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1778678735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mMkApyIviwgjNGP53yywhnyZBKW4nkYb6GZmulufeM4=;
	b=dqcGHZiQN58x4IPPdCp2jAbA+C0mABFjwNoaFF883c04K/O8ROemh2Jjl6HWQXt8o+NT5L
	W4J8KLTktYm4/C+UcmfGS8L1AMP9sEXv5/73q+iJz6rL7V1clY08wmVlN6Fl+IGsCR+Tsu
	9r8W799ZwrVz1HuDpfOsvxihumCY1E8F1FoxL45bo2z7exQrQ9mxHMIMhY7fQKPkzlVFdh
	JvXjmzZa5uoe3awod5uzfvGxXQ4SUxvW0sY6HZ20jWFbyNZz6b4QKw2xFyZMZjGcaoFaSW
	wzwAGBwZ84uitc5N/NX50nv1cd58/NkMm+9WC5PeQHZD6NbLBvut3WP9xU/P6w==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
Date: Wed, 13 May 2026 15:25:31 +0200
Message-ID: <20260513132533.589783-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There is an onboard level shifter for the SPI signals that causes
additional propagation delay and renders the SPI transmission
unreliable at 20 MHz. Reduce the clock frequency to a safe value.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 0924ac50fd2d..75ae46642782 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -63,7 +63,7 @@ &ecspi2 {
 	eeram@0 {
 		compatible = "microchip,48l640";
 		reg = <0>;
-		spi-max-frequency = <20000000>;
+		spi-max-frequency = <16000000>;
 	};
 };
 
-- 
2.54.0

