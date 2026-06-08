Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E03CEBA7
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913393; cv=none; b=DNt7Sya3nTCvccjJKKd7bpZsIEWFYAJaL6tkx8F6FvYyz6zFkGpHpe/fEtxg3k23rOhVTc/KkxBLWsIdLRT4BCwTXVtsbOqKVgMJxyaw8XIqbl64pbDGkvYb6tMkC+MZgE3dIJ2rzoEbRNwjI88TRkqbqNJEAaoM4lpsbGNOzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913393; c=relaxed/simple;
	bh=ypFUAnhVJLC4cQ8FT2d6Pjh3HsG2d2OBvhj5whf+qVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psuPUOh4KknP0xrNURy2LGkpcQVwxsc+BEOIG50jM9iGGNIMRrLzR0A4DuYEn6JUE7YX0CjZ5oRi77Tbf0anGp6NXTJv/acgFnwMtCtOv6A/4s8BeLyeH9LIAS9CujBq/orYY1si6EvIL6nD9Nql4q5qMZudQgLk5IWi1EBrqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc+3xCe4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc+3xCe4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6804495e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913390; x=1781518190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=lc+3xCe4vA9CezkAd3pi+qeP5pkJAtg8pXyDLFP6HvMa0wDwaK02SJxxaMCXKcGbdl
         IVMG+hXFNXsuGzGg5k0IFrUlyRbqHSMKVdYP5yX4SKAxVH7wFx6oCyn0WfWxw7ss/exU
         TsCPYwVlL6QaF+7gmLiKO+u0qdYgc9jCMr8FRIJDedZRBG+esHkfkycAM4oMpa+IBkWC
         2B/mV2mtH4/O5luG4TxQdezUuVCIZzbiZPhDJvqPAfDn8W3R12fVeAAu3zTmcM8bz5TQ
         u4vQscpKWeVqILjRlFXofMT5LMuJ++mrNsFSLG0NNrLDWNVtXJqGGi7eJHu5I7+p5Ffz
         Qzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913390; x=1781518190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=lAmRrwy4tx9otX384KZ1zuz286Yzkhfe+8DFj9zj8ogFuxtyN2xfEuGTDgPigRpDss
         sYQkYr3yHEaobALZiryW83KzWdGDfDuneUJFqirym0HpD5oRcbq2Ob3+IGnQfoTpHOmj
         G/PG+O+ymHAT7NzR2kPh3Y6F4nPKBNkiNCGUJZUY8NSS1fFgWQ6ce025Bj62WTesQKwX
         Dk9MboYMOsTqaj7HshKkXpaJ4vAtbMNGJgHwjqMcszmu5gIj3kw8SMdzyb7QG75teCIS
         nPN+p40C4YPejGp0kkbtV98XRiSb1dak2tfPXtHfNIN8XAcgZdUkgqNRkjuvzZDbiarB
         YTkw==
X-Forwarded-Encrypted: i=1; AFNElJ9bIAsEfV2FLkFYjahOYM0/LP9ghQhb3eE4VADprn/QrACug1OEZxZCsW1QlUcK5AT5CnU3ylUSE+11@vger.kernel.org
X-Gm-Message-State: AOJu0YyIo1A2pO/g8N/AOlijuo9f/M9AI6WmZzMq5zjCgybg97xqm6eD
	i8gJFvkZ/kYK9NVplP8lalnbD5991K+Yawgxn53BHnGW/GGjJoLmlJzB
X-Gm-Gg: Acq92OGE+KkswR3aAHbBOi5hOEMBhFM43Xx78iulRLe5addYEP2Fg1V973Q5shUmm07
	Sr0Srrug5HPR0FY8uijz64rFU83tGW/Gdk89PSF4UTcfv3yNRqeO72sROEIaBW2A3k5p7WmMOfj
	OQvAY0IUTaiT1P2jUnT/eRCKkq/z+w9xkKCYc6TQ5kpbxbU/nMG3oB48HFyuQRugc1IiLzrLxlA
	TcbBJbM4+sfOx3k3Rmkyn3e2P64mJEakWdPJsdDDZ4MyiqZE068HVEGeWhRFdu8GLVE2aK+eyhE
	SawkiSJuGip+3jXIA0Ndx52cKuNeOQmP7GRG0PM9m2kf9ClXFIh5xEkB7Ed9nmpggeBcLvmTfVS
	KkwnmH+RADDNmEucNbcIpuy+uln1ft6YK706BzRQyos+zZ3MhUiLab+roiwf0Lp1KWkPg2Kt83u
	eoS1ozxCgp9SXtohw/JhtSuzzg/+wAEHt58ojiZ/SvZuEJ1L0iNVMqQhQnm3KmLPCT7iOHhzjFE
	pl3TE0QLd982/d5g7NytfzFcEufRYWFGTvSzvkfgfoQYDVx
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr270847475e9.7.1780913389760;
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
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
Subject: [PATCH v4 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 12:09:29 +0200
Message-ID: <04c6b83abda0bac71b14f3d7f96315a1dd843f53.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4f1d61c55ffb..e1b78ed167b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

