Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34633D1AA4
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880293; cv=none; b=GnF+o7PNcig+3NFVEpkyLvvq5Q8B+QwauJe7oRz6VTYDbPw5M10BWKLiAvlmq4MAc8tWvXSFb3gbwziyjks2NCpvXWHVwxwFXxlHE1FhPWZ1OPZ+ATqR/yZkhpEGsiz21wbBLZfVY0IgIJ18XZVW+rplEw43BK4crQwtZf14IOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880293; c=relaxed/simple;
	bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWCDntQQWCyaCgzoGJX2ckGSNQDKhbQEpGvyi98toMeSdLaXbGJQBd+0mXYs2GZrqAJ5v/ToayQmWiw5JYAArXeOPuF+M5r7gSkt3CEM6VpEXBTm3H3VbM4V4ktAm0G0P9+IZg7a0SMImJSfcbXLFjfLY9VDw64+u2ESFwX3DVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9aJbK8X; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9aJbK8X"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so1168165ad.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=i9aJbK8X7QYSNvIYnLeyEaVGBTyPwWWTNVQBWN1Y92vsXRRUGVF4Q3wAWekK/8hZjt
         dw0hnarz+miBRfFt7wIOh0R65ilMbf57nXYflCdoOk2d/OMESzOyWr7eLviyHSE+AqPa
         b/JF8HPRIcg06dcPJYPIXXMlFyr59aB04fERdkclGXUFS7mNFt4ywFDS+e/f7km9LjAr
         jeGkqiVoIeywmkSOabud2Gf1pOB0yXeTkqQg0tBZe7V77oh1psLyNsG4PEmgz4CnBZkp
         UtAu4yIHhO+zkDML35K8FExVGlX9knV0WWlIQKmuZVWsiqMGoy1PUCIIECuKnhV13p32
         ebaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=0M56qe8AE6bYzh/7MQ5RsJJgEebvb3e+JqvOSs+O4MUUXIKFaprRRuKnegCeWZQ55l
         S6749FcNDR6yQCF4Gr2IfbmfSaVbi/WyCBjMr0KKUxLUZQ7ijsHNbm+DPcxequBjU8KJ
         4fVi4q7+NO5SbzFwPxz1EeTJaGBGrHyR4CqfakNvXlZ2//1cmmi3tKVmutMaoOoGYVcR
         O1x4bULSIaJd+M2Rw1P8VhxfwVpt3SGdbJsFoxzz/7x+iC9yB0gCswLOP+55N9W4hGcw
         Lo5VSGAc1ZcJTZTXDWkS9VeRy1zXScdUj69ZdUo7TVkuwZL96TZEF1KaPHeRkXw5fMJn
         Ct+g==
X-Forwarded-Encrypted: i=1; AKwUvBz6vkZHWv4sluTT3KqmaeaZtRi/J2b8ydqZO9MbDZy9fBcLqcjJ2ahUgJ9gKdvPF/mifSHCJg7ep9C+@vger.kernel.org
X-Gm-Message-State: AFuF++k9KoxvcL5s35qMWMA+OMABFiwZoLhaRfQPkS76lkMf+nm1LoMG
	qTn7Z0oToNGzZQFHoPS5sDS0aXHWvBPaqugVmpLeXw9pT3oZN8BqL9Qz
X-Gm-Gg: AYBFou1pgVVOMv2kXqeGkoUmF73lYz64BPrgqODjNNqvNRWFyqgVdH+cUR+OEbrwTqg
	Df3FaGplpK2dlbxhz5g730CyOSEuRsYUKYpXz0fUndgTOE7kSVOg38ldCIoJ605pJ8ccqGjpIMO
	M++UNYHUOv8PN4ZKAWZYC2/ysGWgSfKWiwvFGOa5kyVGFyUg7o+YfbOWbeVpi6ie/246tn84Aon
	y2Cbb7OFQSfX4cnFORim28xfxazR9QrlHL/+Dqjt2OizXUyQuP2ufL0zPMp/vIwLTlqKQB2JZdu
	Z6pIvK8qBLDwaSTU3PDnKpAdlnw4n0Dqo9RNNIWh/YE9BBHmysGvy12EvPH/ys4XxIXm2XFdukN
	ve/5LjYHKjl74p5L2mymRCqzfMtZD1MXwcauR9k9JCyWDY1f2nj9bIPC6IC3zt/aDk5nLYtYnWV
	kuS7P2luAPs8FkZ0bCiS3//R4eTiXgbIPjvgDhjNq7t2obs6lMN+BIwH0U7HKR83u98YZtjU/a+
	jDLuSd5AbCFqmf13MIHzLzXO2x/yTawnKOEA24rNhuLyKh7U+laA9dEhauUismOCdLh7pwnLyry
	839hrK6H1Xi5zeUCn1bWHsaiiaq9Nv+PSFBBnRW31xHpx1Tpg0FAJcL2Hg==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};

-- 
2.55.0

