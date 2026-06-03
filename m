Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77447AF66
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488012; cv=none; b=nOUnGTk+pTP0hmkJXXXYpCffKLUS0IH12G71ENScaq1xwZJcDEtAI8SU/4vVqphb/dZoC9Tr+Cd5y8srbtOyUYCLoU+gmn+CMxMygiR/HDR/hG7UHdZksCEdpDlcktmPR+4vXLGXgd4SHpJLcwOawErbyApb62Tuj867e9kGkqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488012; c=relaxed/simple;
	bh=wimjAcDb8Tyk/BPEjvoL69eS+sd1AkHx5mZi/bDYjg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkqUOCjTd0zHDrDOT0VKWfX2e3KU9brjNLEN/5uDoI/I5sXyCVxpbIjNeEz5mbAGwAINNiWHOlfDQZFewkcH0OqTsSWHT+3XZvSfOD8VY2trLpPci7uT1Cp72CAvCpb2J1BCBSpTC62yuQvSJOlmfQN1FLtAyEEl0fPGDLLaMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6+B65kx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6+B65kx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46013161068so1720944f8f.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488010; x=1781092810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=h6+B65kxK9EU9bbnK37anjBKPj6oLIDpM13Ki2TepxV6cblp+tvzEFUPO+xnOqe/rf
         T7YKJQEgl6lU1/pGlj+cjTiSjfgboUy3qpHTUlpT6NHfT6JA7ufYt0JDf6ziwQX9ilKB
         jNTmOSuPgtZ8vE96Km2oi7HvI/OY+vUXUFarBJPhtn3rFgOqowfMo48QV4CiPQssDktv
         0ZfX+I+qXRPJd7mfjPPqiu1ltqTocxUyqt+GfEsu+tKzBT2ft+zf4CGi7LzX9kEE+LB3
         ZajfUzhk98Bk4ypfnh0CyvOTQNswJuaaF7r54HXKrh1rp4Cv+1aovaYDtW1KPRXyvkBM
         U+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488010; x=1781092810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=Swtho7ceCPRlN14aVParTI9EBhbOMwMOT2If0PRKwJqOAeK230/t2dmhJavXIH8S1a
         fpkYjqVz6i8lFqmg0Y2SGihalnItBHW+Q5R0TR0qJvyB5l8y2L3Cn5we8u+DGmt67wnq
         lyfZ2mberJP57ri6gK5nvYkfDTOCXCiUkBSgqhEfLxiTDX3+v2UeqMFDGIPkK+nfQGmu
         sL/yT8wqOp0l16FzOWT2tvlG5Yeys4wDG0r7fDOL+1NHN5EQBK9ZASzgzyg/MvjyqEFe
         9RHifwBrGnZpSekMmKF+oaWtLFGHqHn7ydRsbP5Jg3QkQKCoIkq3uWRlGq9TclTVhlpp
         h/Kw==
X-Forwarded-Encrypted: i=1; AFNElJ+rAkICKzuI664E3FwwhXsxULpYlyVEBqmKtSCaZB3qWCIIvMLM4C7p8H1gAjk3AbP2lOXTqqodJOh4@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+EJWNPi4YV8yfwc+nfJjw4fPf/tEPSGXIcIsWFkMEpBc9eL4
	yqO0OUwmZ2tj4kEzNrFOFV/PE2o0Z7kV3vOeEhgegfUFBMhtjPZmni6B
X-Gm-Gg: Acq92OGhy1w6FeLR3rceW4Lz26NosIsTqMfMORpCPPG+/pRa4dCeyI0o+PWZCgAwe/m
	i3p1heYMKShmzZnSAyh/YO1XBhq0PKmf6Eju1cPQdMB3UXTLXFi3/Jp2YtGNxWAdWahIJn7LcmE
	wguh8ssnNhj201qEP5jw3fzO4dQlnrIPGxFGEfwXqn+Cr2U75E6cbj/TECI2zsv3i4VtVCcx2i5
	A8AQEovRkcKAV5HOqsxHYtl5Es7mcaHigHZ4dNX8oKlaUaXzjN3VPNfnWapgVPZcGafswhIR7vN
	jYdxVISdkPb5zeruA9RT1SvNdnWF4b5Ye6eAMYnGONOF14kxGxARxMMeo++8pfViWWb0LmkJ5Va
	d0BM8jCHJPgaB2zNmfjZJPiCoz2TTMfLXCVhq85S9iB7+puNJrbLXgwc5s7yJJBl7tblLTyyZ+M
	/zlqoaQaR9KRNNwpU4W2hbdnNEUvKKM1p5uCnKPIeJiXndPzo5yd/oSgWfBcguss0PDOy6Gtqcj
	3LTc+qLeHf/ia3LqirMriOjibzWFNfAEmhcTcK7ji5ThfFZlFTxoCZCxo8=
X-Received: by 2002:a05:6000:707:b0:45e:945b:276 with SMTP id ffacd0b85a97d-4602181e987mr4347469f8f.20.1780488009730;
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
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
Subject: [PATCH v1 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 13:55:47 +0200
Message-ID: <3801266c8e0fe7a7913dd2e376d1d58001548f84.1780487415.git.stefano.r@variscite.com>
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

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9622f77f8f13..df4409af26a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -321,6 +328,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

