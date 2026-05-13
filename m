Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773813D6CB2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656814; cv=none; b=qj29b1i5XAQaCHBo2BulycdmicIH/SbV5yzk48JyFy/G3g3pxzDv1l1+AIzgv7HI6U35/F620RB1giGrX24JD37+d4f8ZcAW1NzyJMTxMjK9IRHlnADpbaHhYJcsy7ElgBFINSdikH0ZXUUpwLJxdOz7syRgUUWKEJR0MtLSu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656814; c=relaxed/simple;
	bh=ExUGzDRkh5CNTth78Z2QLGpcnnEIRHjJhoWikXky/gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ef7r+8fMVBnMAD3Jx6dhP0AxvP0Pj0FPadbL3A3lExtbLqggH79yKdqEhI4ZmE0xL2TlOIQQeV3vL7DxoCeonvOJi6oTxQKPFkSCkRYJMD1biKbTXFRT/n79LEWLJRD3PZ7uza3j44lOpEHDCLp+dpYOpYNZmoOOpa4LgZIsEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mINsrdPm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mINsrdPm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso43541545e9.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656808; x=1779261608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=mINsrdPmNvjJs3yPCWrP7WA8YtqBHVdU5espEKSlfIpWIvyKgMtppE1F6s8xR45Gz7
         /soT+3XSUdnKWD4s3bimm5KbwFtzNzu6qSmB4odbi7xWLsK4v893d38mZ3iFffnMVR7L
         rkv8MSO3kQytQpCAJgtOu7t26JzUfMaL9fojMzUxVpcFV+xQxlzh0/wbPcvPNXc2IzVh
         3fOsVo/M2Mb2vV87s+cjQud4Y+ujsTmt9Um5PCA7BKONj30JPqbhW8jLsUIwdKyyS+1j
         ESyvpI+cZowWg+SIqw7NvxKeC7uQ88Muck0JRriLM2j4yfGCfQ6zY9GWvoDE5WBS3NvI
         4hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656808; x=1779261608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=TGvCLUNVnl7LFRJo6lAKi/AcVgZwGDOFjaoaAuGDQig5XTjdLdnaCsFwNuATkk7Gwr
         uIS5JWUZxmXKrZIXFVTogE1iI8rHVvflUQlYRtAMwHf0NumRNKRqddAbUR4lzHh++4Z5
         cjKUUSHWXN3CidhNOfcyCq1Y0wHtSAndhAYOB9fJm/7gHq0MLE2z2/q/DQH4DeePpZt1
         tMZI8fKQxj/X4UpF3dI0afgMMz9ajfyrnS2LDR65uBobWTxP/xuGfb+/dnP4fd/MGO2v
         yX0X69Soy6M8hUuMCTJx77THScZLVnFmM0nVHCjic1vzPKVhi4kF3u8H333kJgUqBbHg
         ayzQ==
X-Gm-Message-State: AOJu0YxRRz+HgG3ewk46MHA8ni8nxtCi8U16EBk8PPSCZz+I/heoJKTp
	5CltgKozVCb/i0cDfdBZDV/NC8RvSnoglZqF9L45tyyIj9pgw3NqE2d8
X-Gm-Gg: Acq92OF/s1mAvdOCaS2y6RGZfzQINlU5jzUeOw0v5/jhU8uBocNBIFQo47m07qRvLky
	/T6kWMW4BEhXe0aiC+QhBOiw8z//7ouo/KHdGat2NZ4AaH1nSk/Xzc2Z+n5TvS8dGV039J3CxDr
	GVZ57nH9BIrSUxytCV7ltwUE89tCH/md9GV6gNuWOh+RhqAzwuoPwlMIbXyBCSVn/PzzsuI55JA
	xhWZlwTvP+5IbiSXAtvKWAMPMzn1ekNmchfKXgcPz7MJCs4iFN/MOPhYr7qT3fPalngx7yYXYuz
	5+yqCriP6h/H4e3WAjOojADp2N0vv6YRT7trhka902kYRu8KAfzUkg7ZhkywaXHFNH34zhCuUWO
	mCdkynBrVcMNr79HX7GZdrPRIpH0D1QF6QxD2yPnuismGwVfSvrH3K+pGJGMUtg9Bf9/LMJ0ruD
	c9mQCzrxRgFXS4jjK3CJRqCDzWXv8msEps9ZZFYPVKiGFdYZU1Fc4bHKWr81GMPR5UOA==
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr29001935e9.28.1778656807922;
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Wed, 13 May 2026 09:19:53 +0200
Message-ID: <20260513071958.29574-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controllers along with their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b24b378b1b220..953c0ff6a0d34 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,14 @@ led1 {
 		};
 	};
 
+	reg_pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_vcc_4v0: regulator-vcc-4v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC4V0";
@@ -272,6 +280,36 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0

