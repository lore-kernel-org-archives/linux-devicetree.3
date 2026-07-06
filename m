Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95B4E3790
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330507; cv=none; b=dLbUKACDhkDmNyXMb9Co4MfL1kt5aoCn+0O6e35gbHZhyJda1IFciwofRW9nFUVchA654IFFAbTiDcZcLYHa1ixX6Y21scDfcFPxX0yKCeeIwRRCfbZXgu+cZGZeyFhCWzekIAXXuAN+bh/9uaIgY/ZlTAnsk+JMuquD2Dezys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330507; c=relaxed/simple;
	bh=YxfzF4NLpxTdbwnrEpFDJDgVz9m0arHwW0oHfP/qPtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYuzFf03R52ykL/MUJ7hpChYEMx8TUTFUF8Sxtfz+pzTRDJiNX3dyluesrJ4rBvQDrWzESlY1BtZG/qOlDEWkD2Zs0F/SjhCbShEfrJ2j6Hdke9hEEUHWyJrncMxRi3hPF1kfoV9PkaFdVFUMYECiU5BsrT2JMlbKcEVogN3fkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an3JLmni; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an3JLmni"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bab44440so14490585e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330501; x=1783935301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=an3JLmnikiByIGDR+fnm8YRRhoG9SxdG9caba51K65QOAMJXAgfqkoKWXcs0wMwtyC
         LNYUo7UN3zfggCvo46bopSOnxXxxn1lLqnmE5Wo/asHVk50QnsWKGY1onvuKi0DOySqc
         qJCrGzceN7idfeMw4eO6GNpju8tRl5ud2x9MLtGs6OJYs6jmqhbI+rKH3gQ5Qxswx1zM
         SsCN+OBXVU8PDjpOr+E/YcwCMa2tGPhpUb/xmXW6TPffr9Feh2mFw0lN3HzkkVFjAPxA
         1LipPwbAke6QvEfcLG0PK/Mu/IVhsvEEiZdRjR17gBld5AyNDS2leZztzmJK5SxGJfMF
         Xxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330501; x=1783935301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=ihN8/raCb7f/6BMfgXdYEbLkx0riETpITOiJQiKYqYXiMPP//k7HGp/yff0A0HoD9J
         oaXQ/vpkZYDt6vAr6cJu3rSUkWfrOXzFhjRWwr4QK7VQmyIUQVeAr+ceOr/gAI1JwaLL
         71wyKF7vEd/JilvVdR8i42UYRpZdFIrJofLWACo06o21hZ4nNEsA2aKuy/D7aL3bhQho
         Bm/+5HQb4Aba2t00eQ2va5Fonsi4i3uCEZAzc9yjnxtlKKoyGUHLXeJYO+EiM5ourRbn
         p/lfmDhK3U1ebJuAfum61gLWMmtbmn2AAMzf+1mgtX+HQ7LY9qH0CTdOdFhkoiQirsNJ
         OnMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqcSNP+R0NiCuVmqQf4CdgW6EfrO/ByowbfETiqq4SKEMLxWjcwtvVZ45ZCX5h80GVdVLi3/NAx2kZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp7lflBGa6gKRTSgJbSTiruPpcji3USV0Gc8Imx3p05Y/oA1G0
	WUwbCD6IlCikI62o1utCKTYFv/97n6nRiuzaH+1OyfWDBmmrQrZ1HLdI
X-Gm-Gg: AfdE7cno6qJGtNY3OYyZsTlFRbqwY0VIwceLHE0Gf+ZpfM5ZjwsVAw/KOK3f4LjNbax
	ddDCNu/UOFZ3dA7vsScvepWNIsBD1K3aNtX0t8Hr09j1GNagKCK0uU8DTLSyn+lk/cjG4uTNhrG
	26Bx6z1TPdSi0kkVym6j5HAweLCcK4XGYg73eQnCuRTCopBMux/cOWyOHtqyObgdMGw+UgNaJ6b
	4bAWbfsv3yiPlg65PTO1+CjZxtLxqqC28CQVK5zq9bSsLMfopYAztVZSoDsFh0Gwcrz/lPsnL/m
	ylZzF5C5nK68wR9XXOhJdSwqe6l3EukVGtRCSCB2ttPwav+ZwUQWEwGlRyGR2kjHUnhjLqj3XjJ
	PMRf5HlwJsqYIKgG1MBJGWVMCKDmOnXBTAVDJ67F7tdgWQ/1pRNTe5Z6nWVcNTynORmRIATAZ4l
	HXLZtxioXkzgaFrxT05M/k8lo2JA5NrMAQ4YHPTCbUqyAMEFTAm9DLogqWUzWlibaNYSxJccujx
	JESmNgbD0/qtAjtNXbt7Gk1NQ==
X-Received: by 2002:a05:600c:1d0d:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493d127f020mr90286025e9.1.1783330501114;
        Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Mon,  6 Jul 2026 11:34:39 +0200
Message-ID: <4cb1d292b7899c72cbdaea212dcefc04e6705dda.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 7a4c7455a162..0bc9fb44069e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -454,6 +460,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3

