Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4E3D25CC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929690; cv=none; b=X/0flvys6dE/+t3KPhrLdK8nhPaLHF16ozNqsJhcF2X7DtnG8oZz79gkZpL7I9TSgfB+xRSDqJSmyWP3Vts37lCAO5jvEHK2xBzWr8bcSh8fxinyzoMpYDRfZU04nlnbWIdndL8WnmCDLCU2myZpYXj4e73Ro2BujhKZ45UJp9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929690; c=relaxed/simple;
	bh=UHxREuj9F00lQFOVYmXg4x/fQ+irWSfd6iuqsfguGx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVB/vQd/CJTXyLaD6aNa1VYFQdrTAwPlyRXzBlByglrzrH1DDreixg/AigcpsiN4vImWRqgQO01MeAEClkMc/C9o9xhcK7dEveButb2kOqJzlhyCnw1xHr7cBH9TNJG6P+CJhuEzl1NMKxF9gvfriIMZQ0XnkQzIpG9wnSHIxMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEkfuLca; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEkfuLca"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3264679f8f.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929687; x=1781534487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=WEkfuLcasrNAd1qJM7cJrnDdY7rWDAYNoc+twRiTv8ONGQarWDC+XcH71L+CYmav1B
         vl/REFiUjy4AdqK80KJHTXltocZecB8qEXzBjt3pWSkqZj228i3va6BdTwKf+tmWgngf
         9ItU1fJJn4aPzbR404j/TPokYqsp8nXfMXP5jCeQ5MzVF21dQWlg+NZYZYT/+GKhdWxb
         67DHlibbcLjO7NBFno6i4Sb081ZFArWll9hRxL/6DLNom0a3IW1LSBECwgqeh5mIVAF2
         zpNh3EcSatuYwGF8/D0lbddW9vUqiEm2AqbN9iA1Zb8sJAGSgPSyy5rKiKv+uRMbX0SG
         OUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929687; x=1781534487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=oo2dJXE3/wfQQqX+VsyI2Oxsf6TBXgW8HMZAR1FV282uvOpeygJiL/woNMT6US/kQM
         SLFipqYJ6ICmYkoMqZCg0tkVe6plKr//Y3YSouhtvCTxzXhmsFORTnCK/zsTGYfIHoge
         1CjybdTqmnRSFSvABXcCEJOK6Gru76qwQQ+5vRyk69UBzvaKNPqW4Sv32sSo5inOqn/0
         7zM4ZSTFW/4nE1a9Ud2/H+jI+6DNFBIHCh5bES7nYpkMaA84K27NCLgQTJnYlkITxvb6
         aUDJNihYRbbRDAKcPYajECatwiRZZs9IZS2UcfplEcddOW87CfKZLj3AM5CFuSeQEyFV
         7oWQ==
X-Forwarded-Encrypted: i=1; AFNElJ82DpPRaC5BT+4iCRWt51CXpOp1lozr7rPDgtYErjR+e7zt8nlDwhpFu6fynj23suX1m9899xaNdZ1+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4LI3SSJeQwXuYNgr1A7XHhCWNzx8ukPoxKs2vX1ftXycxdBz
	wI878wBTh1q981Ogr8ugfxC4QisjEmqxveeA/aGI9kbBxljf7OibSMTD
X-Gm-Gg: Acq92OE6i7T5VVgD5zfu4ax2Gcbo5ZieyzZFw7DIGiu1YD9qT8XAKiMndmVKKfSpbMh
	QabVekHTaZkVgDsoS+5ic8YTIRPox1OmOfoCmbgDvTmR3KWjG/BYVUd51UCXqGzMJS4aMwaw9fQ
	4MwJ8SH09rlMwAJciZu5m5lAn9ibEsKNBXO2C28O8AtA2fZ03Mws04720HvnUuRfUpNTVxS8Dfp
	dDlo4LPv+LsZScaqBGVcMI5TPssPcy511MCAq3R7bCC10IswwJqbfHKpZ5Wz396RgkYliMRv4/h
	uaXA/vlG1EFocd6dkiT4Vx2yyIUzgtQQv2ATp/Wdto7daTx/1vuV6vgDwkPLq8KpusIN5RuZZ2e
	no3XHtXFu7TGPuea9GrtGalDw7z7ILT164bPs4DWWUolMpNuY0EFDbem9og9PwuFl5m4+FXWCWZ
	mmibMWFr9+bBfRYPMfF7SwnqsmwjcJwCYENTTPDMasj2cj2X66xUNvZJSNj+eQj9KwxVBvtR9LN
	lUiPYy4MDDmRMgK/JuMHH3S2wJdNkhD6A+4JJ0TatJ/mTdL
X-Received: by 2002:a05:6000:1787:b0:460:3210:434a with SMTP id ffacd0b85a97d-460321043camr24884499f8f.43.1780929686745;
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
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
Subject: [PATCH v5 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 16:41:04 +0200
Message-ID: <967fe38da37fe50ba69f20f6286d4fc97a6cf523.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb27853ba281..7cf58198ef14 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x400001c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

