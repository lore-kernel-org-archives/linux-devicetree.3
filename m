Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582847279E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842161; cv=none; b=rmYpG2lkZ4YmLiUzVFBDVHQpAYm+XpVfIBCzo93NeEkL6Cz7H+PLn6OZQ24XYeJiJ7z87YRfFW7OOpVhVw8YC/K0WfglP2/9S5cUYkyIeiFK1HBIMAqUw5NnuIaPD9Ok8s0QILPOb+XoCHLpTinGdU2+SM+8DgGDfK/h4fpxNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842161; c=relaxed/simple;
	bh=AE9piC3ZJIVgnZZvOh4UzzLQvqXylhoIUDIYukgk3Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oede4lqGGU68MdXmQuKGcXDLgQelCZMkBF3vebvFznFjgwTKLdNkl+xcrG5Yk+wh9VgshO0sV/wxYDUtfgq5qtoRI33SibwOoRPN1EkoA9ct83EGEzBm1W3UoJG4ZYdhum55cdfku0//TpYqyBGi83eCCEtYHsBunNJJvwT1WUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUUolopT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUUolopT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso81013495e9.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842157; x=1779446957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=kUUolopT9xsGxxplp2VXQOi1IVUEFxzVppzxo8mllLj+Ze5BtSitl8aPJRXIWaVhWH
         XEWDN7KG+CCdTOsOlIiMZ8HjFtdCjtXVlWeyL/WJQ5nvUNjvb+FwZxXTkhxJPqDANwRJ
         FZh5fqnGPQEpz5GvKcoTOFmOcBrywmIHgNtVNxilfF/b4uHwZeAhrsGZqXqCpPMczL9O
         /D5882D1cWairbXuo5wS8sWZ96LTyWY0q21nf4vMMaCQwPoX/DaecshakvLRW4Swpw+N
         3RMs4yQqAtC5NP6wwzXsSSUuvFO4ndTU8Dmsjt0Tany5rgz6pbfuPgC8iYylAu1cVxpN
         8V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842157; x=1779446957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=BurQgcgl6EDR6BuBhyawahgiebsAZNTbuHfVeZTNG+of1vagp6dbyBNNnUXhXi35PZ
         gSqzFAJJhm6oszTFVVOm0Ty4fMgjJF4jW4Lv5jQqvX1MGG6lNdIbgetef+/2rIULIwVm
         YDsVUBsuaS7A/ts9PPq4XtsYXE8xMaTeDraz0kMGBzCGrofLMGtbgg8mlme7H6pSn1k6
         o1inAq5DwIAtUVc0JXWtStSuPR9qsdP8eMt+eUisDeVTC6mtwZPQvEN0m0dexUb2gvSn
         oBa+EqU6YFVpsJa6EWHZLfxJwUb+0mKlGjIvocuW1039JQqsb7Cj/fHgtbzjbqi1qQhP
         YyOg==
X-Forwarded-Encrypted: i=1; AFNElJ/5Ki+NJddXE1l97+hPl9PjDxB5kyanodBZeurNCFBIvjsHbPR6wmLV3K07X9IvwayeioeA3z/lrFVc@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbotTfLrFgOpdE3+/wQanME1S3Crpq8IMG7pJ6fS0ccRigi71
	H0stx4cgnTdQ128bIqWKZRCNbJBM/zyhb1C7272HxRoYHQu7jIuGE0Os
X-Gm-Gg: Acq92OFsxFa5TE8ER7Cqxs3SJw91t1lklEw2n0235u8dMO/xpgMs3KBpCqJZ+l6a2Kf
	DhsIjLAgXlIWu1n28J0RZpWjK6JvR8cnQH9/6GDH6rjaLgOSnwIyxPL/tRVaYUQXNw0fUQibyrg
	351TwnawWHZhT0aHJAIEh5GW22Di5Z0cLf4+HziMxsKfEJxkvaKj4q58okDBsGr7V8Pm+FYIji6
	4+7Y8OmO6mLhQZIfrxGWpxFpdNVVr+5Kvj1ZyzXsty8RDb6fp313eB0J0JHLu8vLjDh8TC2wnNk
	TeHRliDSwOuqgEmrN72mxfTHfgrRfd8OmbJIHFxLjDdXSgvqlYuw90rQuLN2hpRWALKe7Ozl0+p
	SJP/AIT4NJmZjXH9eCYfkVWwJd/1yBYXMP8aVYMkqZybqoVkjBcgrYy/5i2eH2rxpLACnmCLkKy
	3KAxpVOKv8EF19TFE0EO5vbUBCqIuAnKp3psrHimvvlraKNWKpDoXTm1HLolAes8rYeTTaXUNLN
	NN2
X-Received: by 2002:a05:600c:34cf:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-48fe651588fmr49447535e9.24.1778842157464;
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:00 +0200
Subject: [PATCH v10 2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-orangepi-sd-card-uhs-v10-2-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW logic
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..bd40bc9011e2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -202,7 +204,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +321,21 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0

