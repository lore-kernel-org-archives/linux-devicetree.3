Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDD3D953D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090679; cv=none; b=kPLdkVLF6FP0ZG7gcaq+4S/KU6UhaK5835WnGFxUJ5pzeqLZgyrTBy43IwOPb4LxKF9lDFPis1PYmtfZgESZg+bsFVeCU7v9ohKZ43FjkWr7rPaqrvktixPN0ujaP4X2cLq8riTv4VqI0JzS647peWNCYiH8NIMz//Lh3om3XoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090679; c=relaxed/simple;
	bh=H0fA7UXVvTZNMGM0szq2vnWgiH9jWNQNaiQNMYqM7dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fTvo4QhzkeevcsmjcbqfM6hnc+rIbPxVeESO78Dz9U9yUj69o9jM+1hisouweOrqttl0DYz/XFSWz6R2jqMZG2+ifPboVeXba6oaTiSXb+OWvaqliWnPgMSkgZcYDhe+YoarVM5stciMwOdQMDI00aGfSS+bZUxPU3rB0fzC/VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf8x1uE0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf8x1uE0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so1220905a12.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783090675; x=1783695475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=Xf8x1uE0KyMoZCiPIH8/6n4+u3x8UdBpC4g5ZejnrWJRkpPAi9VyrTAmsT54w8Nen9
         QyUQi6IPECoqaIxTl135WtjhzO96q9RWgDm/w8tlzUlmF9tkdlIKykVWQIeGWpLDMmXB
         iX/37hmYmpge9XdSqHzLp+63+lE2cCBYIVOgQBWiWtjR8VApxbP4lDyjz7xjaVnqqpXR
         EmmMshpIfwUEFCTHYuJ7jt4PaXKwTaCJFHJ8RraB3PQb6uT9SyONqeyfJNzdmijWP9D1
         XqFZAnEGoFj1/mHq0wgT129ipcLF5D26IEWzvpjtfcjheokloi1W9RPBm92PgrZ5ST+V
         6osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090675; x=1783695475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=c5EU1hKkPmIsCB4Qc0tJwB5zawGyLIFdEF2af5WQpWHWuWo2wNZYOWk4I2+f6Pxz1Q
         MPPH8wPU35V1n9Usj4oTa4vW5soduxYEHLwQCgy5Aqmid2ScBJ18M2fD6a2JamA0UYRR
         SqKPFm1o+K3csw/dPG/vZ+Rl9AzZBecqWK6VhiTgZKwGsSJwEvDkySMBay5ntrY+doy9
         NhA+h/qiLj263tcZNA0wn7C7HbBsMMSLKG6SnTI+gWzqh3SaO5DdMSqjOi5evh3eqfBB
         75yBwi9S2zwYAhEdofN/TSrtZTX71LWDrbAjGJuxpzYnhXcXtG7ZRK9eUB7vSSujbi5H
         vkPA==
X-Forwarded-Encrypted: i=1; AHgh+RpKlcNLhmB67E2dadfS7wEqYUUq/ExGdej0VTqNPmyBNCLJex1ZwC3E8ewCyCq3/KsOMFETgYnuCy8L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32KTGjWU0DzVeAgIgqIgyEyMUxmINNKyxmk+VAHjsl49ZJA7j
	sl2fR1sIT76Xq5MCyI2bMaRfyRP6RpXp8OY5xkQNcC7w04J+Pwe3b/mQQD9LLw==
X-Gm-Gg: AfdE7clzK4R/5Chm5W8pKvdVqgC9ivpXvLQvYpKwu9pYo3qPQx61GnyI6QbFf2+7vky
	r5Kzi3OS7S4hJblxzcV6p5ZVpOeO0xAUv3m2D8BXPkmx08XgqUlpKNGbNAryAXA4qQqZGp2HLjL
	Jw19hz/1oS7LEQsEmpFOTpE6EO7eeIpYQKeiTEpXd58Jw6elsuCoK0Xk5KUZ0UiqPMiPIS+zq0z
	qLTEn8wuA1ib9BN73lyZ9awKnEUMtwlR9olEpF9uptF23Cb6HVZoTpMyFu8noztwvBRrQvR8lxS
	z8EbHVplInLN5CWzqJmCKdsrHahMZJCc+i6KlSv9DNIISpdQSUvgGdwF9w2+xW6ScFr1Us37v7N
	V/qS1SM8uqgTgJ3IgDw+F2hQ/vwkVArJqxU8DpSMxZhm+vuYoqZ1xaVM6d+RuKly4fW1rFDalWn
	1SN1AXvP2W/SBCIl8nLV2nXlzMhb/o2P4tt3KrB50qFsfhLBwf2o4g6E8RQoE1Jv0+Wsb96R+Jm
	hRGNDXenR7FqcpryA94tTnvkoY=
X-Received: by 2002:a5d:5f42:0:b0:46b:cab9:f697 with SMTP id ffacd0b85a97d-47758bca818mr13901139f8f.24.1783090208322;
        Fri, 03 Jul 2026 07:50:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4ad4sm20087616f8f.11.2026.07.03.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:50:07 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 16:49:22 +0200
Message-ID: <20260703144922.231608-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC block control node on the DART-MX95 SoM.

This is required for the NETC Ethernet ports to be enabled and used.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..174ded589d6f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
-- 
2.47.3

