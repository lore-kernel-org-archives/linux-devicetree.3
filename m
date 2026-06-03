Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B847884F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488009; cv=none; b=fFCPia/i00fjzVI3gZkQSeWs8iFhlrwIOoa4LfO8yjg9gTltMDnP37mNs+DXwjf5XQDdYjjmIvT0E6iBazTuuy2ErWLBCO70fTz9zNlnH/+X2tmwp2rSpDZo2ygpCCY/vNo6Au6s36G4kxWIZadJnQo5ZYN1+b2BY02dWjCxNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488009; c=relaxed/simple;
	bh=tBN46t+bJZn9dqVVJ8aJQkMtOkuEumelLyFBGqz72DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9uG1C+9exUQn3kWa21+XCfEkj1j8F6mLMFLgho9bUh0GbP+a8ySGrlW5cYMAeknLLhv27FQqMe4F1mTe73R4PyuaeEQjk5KxdiQEdlzhq/6E1JEQrquZggnJNkiFmJ/j3PyzRKQFPOUTsFCSgubjl94TOY6sqwr9YeVP2M17Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQyMt1GZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQyMt1GZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef82204c6so2641359f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488007; x=1781092807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=HQyMt1GZ0ZbJcE+Ide3oCRZ0lXSiwuexKWqfBdkZKg3XYFrSlx+OqyXb2cWXFwvdhn
         p3NgpvPti8WBU06T3PFW6N8Y6wDrd0XFgE6TkNSuYNM5RwikB/xwbonQp+hK9+LGfGay
         DtWNnQhhL7/19B1uVIf5ZnPkvPahLiLChcJESsOqhRSQAXwvkg37oJVqb2Wx9tvpnU2r
         kNMIanYcJly6dHQ4HgUBzcFTg3qRztAELpJM3uQZenMm+3kssGAeSUpLZ4Vmjg+OWKnc
         oAVx2B+u/KxxwIbhVPlOp75BABPw/1qKeT6Z9e3tYbVHjd3zM97oW4whp+5rBClUQ9sj
         ngkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488007; x=1781092807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=cQqVnruypt836qpdUIeucvDRzkV3h+sssho+pE6/TsRBeIYrYp5/lNaPNsrb0+1sO9
         jaxgq8whH5asGntVmN13I+E04xwJMrc14mTW7o86JJGkdtjxx9dh90jsmTIWdo8d1xoo
         A29RH8fuZfj+xr6I+oKxuJI447Gk1PV2pjmJlaAJ9v+CJ8lfnSTeAsFatG+Nq5ngs+e0
         Fr8jnS//OWHQLGIcml683I5BZklwv0Tj5xL8J7cal+EYByOzyS1OBTU1UGELEg/JXYBl
         gBJNQZ/o7EfAvDM2okLDUdiufL7UHDa+CxGEXPCQvZjG9hPAS6zS3b3/KNE8PQFP7cXe
         2u1A==
X-Forwarded-Encrypted: i=1; AFNElJ9aDdPOc7jfthSyCrRKV20IMisxXCdXWyLI63PzX8n01B5yBMkHEzgXK5hIJigB3P8okRn5m9+7GnTi@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPJuRR8RIGVYmKjVCznnLy7QXfMdH9XNH2Th1TFelSv6OmKrd
	nAWXNLO7C9bRQ3yvlEFQxD7eXc0m6YJxZgOlGNDJpX8egQbjMC/4Nve7
X-Gm-Gg: Acq92OHFUOL2z0ie4zimi8DFvdaeHlfkpS+mNA/YPF+zTIvPbmKl+tqzrDhKjypeatk
	fjd6X2M6ubBA6sDiVwg0Rng/1Vl6ebyhGGGVmPzuEwVIWDlkj9Zn+tQwFcFiyuS4L+PGs3WVYtM
	g8vHWFE6EfihPpblNjjNSNia2T3GG+/AjFyQXj1W8H1HIZrvrCbTiyxOEF4nCgR4lGQ2Z/j7vqI
	2R3tE3aZ8mM72a74ymdvSzOCTZsK1oKfRXfa63IDB7f+lYAtqGVdwNNC7VGQVa9GQLSctY1+DBV
	IGjPkH5S9ZELmRvGaFMyli+QCmSOslekIUPz5BV1jacjAmbds7vrl52f+TRLIBhtQ/2hgLZ3Siy
	bSloL3lG2AmdvdoWAx2q578OD8e+qZYBjmoJJyj5qPx+ZJWHftO5GaJVjdhhW3Xo2RV55819jAj
	1R6yAUp3sMd4/1XENULyq2gGDpVVGu+gBm1NTjTWkM+dRA/bpLc622kWwMbbNYijyjmcHkRtrT7
	pLm8fh64IPqBkD5lmTgje0+/35EocwXEUt+byLF+MbAyBTM
X-Received: by 2002:adf:f247:0:b0:45f:f142:d571 with SMTP id ffacd0b85a97d-460217a50fbmr2915483f8f.13.1780488006448;
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
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
Subject: [PATCH v1 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 13:55:44 +0200
Message-ID: <8b56416fbc765373643dfb0300c3661564e68ba4.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 3dda28be92f8..fe1699649414 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

