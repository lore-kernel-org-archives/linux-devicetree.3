Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670849AA22
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326771; cv=none; b=GGDjF3IjX0DXs87W5W37lZo8NFFYjJ88p1iUvWkSpNH1bxCVcdhXeThPSy1YvEjmDQy7PeCo2GxStNpdHjIwMmjXyvXAf5WQUEw1MEFmJd3/zDwpfyJKOas6sc99Z8DD31Ui53F7TKq+kn7smwZdeEf+bMPWUFTt4Pokb6fXgY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326771; c=relaxed/simple;
	bh=Nukw122yROk9xDRYamq2giXRAL8IsIdNMGYZGAIWjvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7zA93fB8you3N0C+EK6YjIzsqv1Y+QyC+Sw4ubINVoekl91JIVws9PB4YcgeYOAj1kgjaUkJ7iIeytTGAG9e2YVunP1Tr5QkmygPEiQbU3XcQtVqUcRV7iz1u98a6fVHs0cX9X70WzLAY1Owc6E9IO6iLKkyjtGChGbQH8unaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq6TwMcB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq6TwMcB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8131885e9.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326768; x=1792931568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=Aq6TwMcBbijWoiNIQ6lLzznbFSb606mfoqm9IJgOLOoajRL5T8/lfFPQ7zKE2haPvq
         sv7ju5s+pX95kHZHaN14f9Qh2DJQYlb1dSMRuxrtP/L1HLjLwnlcIrN/m+ZFZofoaOvd
         QCwJFg/CAqRaP3ZEAO3PEpGvfbmS+QbWBJ6Ef0xJwnJQhL0crbU+nLiyH/z3PLkaZVDj
         PF0r21wEpzN5EF2AMIRsmV3Vvy27cfKvJzFQSNB8nm7V4LunTGJIFGHCeBYda9jgdc7f
         wWdFdALA/ENiNL7ETzRjyEvHKenmlyzCc6WKWG99WnjjkSfhlzl11Lr6C/Vi05DuW4D2
         IvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326768; x=1792931568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=CgX+7FwHDl5VHmb0Ek5M1WCRAgroXO26SvISbHQZbtE253vCcLzSoCrW4aZH4uPLZ9
         O0xmO8F0IInSHfKk4isRykj5mdt62w42/fXObhgYDXJedKAu3oAnvzRrh7sPR9TKjV8O
         E/O9An3rknWVgVz5woQtwJkg+LpXs+OaoOh99qbZryao2CoSyNSj+RorWsjZouuG/6CF
         FJZaUY5WpqdCjoxtyYMjx/0WSt7K+4lEShD/5c7G898cHVrZWXkXEW3krhSmA7G8DGas
         qSQaUm3jQAUgmiF1cppZuGbC/ZegFAJRKdiDKdeX7WeaK+7sAryY8JxzYCTCdeoYP2Vf
         Akzg==
X-Forwarded-Encrypted: i=1; AKwUvBzb2RElUvAEOeTHCt568Tjkz0XBYOPvRdKkRwgtef8yaOYfdB4yepcTI/FB8qTAOZj9JJUfMU7nwhob@vger.kernel.org
X-Gm-Message-State: AFq9FYJuGKAMdTmHJ7GevvDJyD76yrH4VjLelP1Y/rfvDYNrMNz4bR7g
	dZY4ZaXl/uIq4vB9cUCsfoLh5K8tMA1r41kVzXMqnp22YXoO009CQkRY
X-Gm-Gg: AYBFou1WF2TjxQakL53ga9PQzaX7Kz9Ja4Iqe0ai30KIeal5B/zP4L4BXlXgKuqxII5
	7cmoyC/LH9dsingByBHhm25DqjYqRSz5LCoQKWPofyuDBKMKbJ7PJupZdXcxN+hjOZU48HsCDH8
	pTHaU5BHZ8xMrySfCQzgH7bVRKb3fl7TSGjm99mZ+8Dzx2Y1P1HZJFfSSUYtbtmJJP1y+JFh9n4
	ElPd1MlfqTi0K9KkV01CE1SxivlaowEaG2rIf6jfO97pbQnGcvuquhLI6uCpQfcKAmhOW+1mFmY
	AIGjQH1rgZ1d82HkQvXPJOOxJ8+DPaf1vItNvsltFqJ/K3qtuTvaxTqfHIZzdRqgIwXyAsTHmqt
	fIGOnYVCnC5AIy4pcV+56cE7SsEX3getQMz0rMLwk9NwYhWKoZ1t5CGZyQP9MNZEyoKnpJD1v/t
	b/G1GTYKJqJmYcNv1AqDeGkaVGR/YmWn5//1BR2wk2RDPPEcKNWI2QHL7OOUZdQkwS7mx8IfNTD
	NchtKghosgGoHl1L5S23nDbGjnx0xPnwq2SNhP2d1+By2gVjSoBnbxWyKSfYt05IZ4gZ2ibqw0m
	IAnzwZ8yeLSzXXKDmoo02g==
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr108377035e9.4.1792326767681;
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 2/4] arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:25 +0200
Message-ID: <35386d3fe663aa5e42dfbe904b554968ab8d5f7a.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index c1e6c9978275..437a23840898 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -224,8 +224,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

