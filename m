Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608B13CFF7E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489681; cv=none; b=m01+qzT2ZiOZU9PRt0RLFEE0VIng+SBAPGmXXAB15KI2aBnXpLzcHI8hTZd+it8lAP6HfO16oO0RBbPP730gUtwK8qoTOzcb+sWoQmw7+LPyWb2c+MfenrQFS6sy4WixRkL52UjiHuVpNFDdIqTSdm5zWwMB5orYvJo+xWtpeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489681; c=relaxed/simple;
	bh=MIH0ATHC+38xHlXDPli/E7afDZIgbzPqgBozK7mYzwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THYa8ubiRAye/DNBQt2lJJ4VcrRTYcA+ZziiwrSfv8GMhhq37P1ufmCXZ0zbd09iEJGgjlA6BUb/9nAcIWuntcc2iqr2f6AwWoVo57wOxNsGm1s/V/cPxKXj0K+ScRshpN9Wp1QwMlUL0kqptz8pqSfqiQch1yUC3AG/VBh3Q7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBO9Rexq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBO9Rexq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-459bf19e87bso233167f8f.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489678; x=1779094478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=gBO9RexqhK3OdEDLTgPD03SPCo5K8HalLCyscvbTNbWLEqxJlIZJBquAgC5UTKjSXv
         A2TmzfzWV4vAdLTeQUCD84D9TUyOzA9bbGf9eGo7a2vpe2poOuBxOc66GC/kHFV7UhPR
         1575UjevTPnhxI/756xRgmARA9z3fkiDftRPHgxAz70fIwd1LxhN3pamE+ZPvQVO6Gub
         33H2WNtxzjOp7OwthCIFxWkaWcU4t/+pOl27BTZqChonEfYKLm/0WCS7enOyJ3WydJjI
         gB0ABd5Jqk/fYYugMBQvypkg5UuuOfX8xn8FUHz4dWEq8SbfzDB8v29tD1ID3Ajbmp8N
         88+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489678; x=1779094478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxFL8JcBleXAhQJnczy/XDAFmLI/O3K8Gh9JfAxOPq4=;
        b=e/FpR+Woir26l/B/zaHnL1DUl1wp8HKf+Ubx4Wo0NjXASGcVgst9uEscy8Gr1lW3dZ
         YqnxgkAEu6Lnr2+4R/0lI8nL/vvs3atl7u6ohcC9pLsSBYVFWMQaY0WYTyt5Xv4WChq2
         Gmh5L3Lwsc2C2cOS0ISJr7+CawN6k5VUukFEmKy+llEt+xmoGIZmCSqominMmW5IESlk
         p2FnjJ9GBh0onWfWwFG9xCkhQ7zcSqoRaCeEIX7v8vGjrYv+svO5akdSAHj6l6d/xzeJ
         81FCvxgn4dSjm+sEwatXR1X1hgfOySPujqWB6z5XmJxSNebHGIBGxhxRdvrCJLER007O
         XxlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OrJwPq5ThULHtsgL4E7BgzbWLyty83pG1eEIz3vN7iIep9FhtOpaUTA/wzONBIjnkfjIrEPn6RZJY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3H6Qsp8LjAxcIr5MHVa1rw7zPsnm6mqwRz3rW9RCj/bRyNqR
	cVEuty7h+O3inOrxTeo+3WnEDzo2am97ZGqMb99ud3EaGfhweBktNVAk
X-Gm-Gg: Acq92OFh3o5BoFZx3729ULdjEzA/QQAsP4djXqBTZY3qyN0Y8a24KXbGuccJf7YrML/
	PvGjhUBu+R6CG3wfVCuQRsRg/jE99DPyF1GsO+NG/iUXQ6SqWS8WzvS/xZIHrYZ+OlswV7vvrII
	sAk7vd06Dd6Yzdh6XN6Q32gH8luijjfy3pm3fGKBtVNNW9zhK9peBw18/zxYjed+TVLe4kMuUkg
	Q84zSIrHEHoM/oYq3kKNJ5CdbTUHQc3oaRgnvJ6WVXYG43xV4BXqjuObHJfoUOyV7dd2SEBBSNX
	18hUkHUMwzuTX85wi0/cEGdiqsbTweveOaufO6LYuRBtfw9qHh4Y4QEBYMBTWNzm47xMM07O1IM
	GeRN4SSM1m2TbQ26bVTfKMbZU0Tjafmkc2udxE/KHmgghoxQNDSaxQ8ZuY4MBXNhtnmRwI51AFq
	IG2qMV+cA5M+splANNx++c4EwHRwjPHiCeVMDy8Zvt0F00eaHZVkwAunzsPNd5ywQ/Qg==
X-Received: by 2002:a05:6000:178d:b0:44a:b3c4:a04c with SMTP id ffacd0b85a97d-4546310a50dmr19851770f8f.30.1778489677417;
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:01 +0200
Subject: [PATCH v9 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-6-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
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
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..1ed76e0ff806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -202,7 +202,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +319,22 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
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

