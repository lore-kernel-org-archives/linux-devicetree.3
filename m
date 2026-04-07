Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ABA3A782F
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550377; cv=none; b=CEYGvr4l9AWUWOn2Qmh3N0xruoKvZCN/VWze/HDiooxrePZwGT4lBWspLrJh9A8iY3rGABqp3PlQZhWhefNnniRx+Tq6d7606A4krhYf4UW4OE3C78hwo+YMiBVuEFNFTGBWeRfAAodFF9Mf/SNfGfOA1lzop4Z1Z2qCIcoqO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550377; c=relaxed/simple;
	bh=P60e433P/IRmmrRLLAQOHXv5D73fLkqt9Yaf5YISuyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIZCzZuisEN3u8CxuTRDoWlcFsE4+rwHZ6YxybTRULRB+7OTJuBwUb3KhvJjoD2Hm8HNoKOY74bGn2I3FqkrN3nG/jbSCRtZ8aTm559FPry5IeU68lR9ndcRultTKDsH0y7qPR3NQSTPntk/eLjkAwetvB4hfhD+Fmk6n1+rYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVPE06Rn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVPE06Rn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2869009f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550375; x=1776155175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=fVPE06RnhB+KnepdJsMxqMRxZ1cc4pJXf58oO9OaoFFgt008XVkZmGX6GpktHqHUA1
         uvNrGpJATNSSBNGiL5Yd46FOJlm3Ym9U+un+RBGihOKaRphtj7KWHx6fmkEAgZyT+q/M
         c/nXAcvAacFfj1ptwL7O5X4RWJniYOeUwDvcoI91lZf3s45o/Oy5R24fatk5FrYpn62q
         YhJZEpZ+3O8ejEMpyHe5O0stXDkXM4DpXORn9XW+JglT/FRcusK/fI11AkJu/evtrzxH
         QRmphIp7LNOlcZZ0AEGBYuYcx8w4DYz14QiADWr/su6581m8mtjJ1gxLlJ+8RAOo1LuW
         r+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550375; x=1776155175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=EUDdMlR67bi6IDKKOHFPz+hVXJBUYa/gB0CTj3lHa8qJxxPn1QIauztmf7mrjRy/Z1
         Y3pxQq8h1f+gywW1N4MANC5pihp9Iu59jdytpBOLacg4UC8imbR3kqnGivETU0sZKpuL
         Cankt5wna5eZjzpGxCtff6IymsovGeKUATpOdhJr4JH1tH18QlgiEFLhZmsD6M1aMC8H
         Yt8QyVJAWnjxYxdE62VEyGDA4/q97+YkZ/Bu1D/ftBqWa8WjBFPsrqhOVPNA2lWoVLFW
         LKMtRddEn162cZq4ToAz/HnvUsx8827CfGoAl2VVI2b6hO6l6CpktBwwI1rwW1jgvTzR
         j3JA==
X-Forwarded-Encrypted: i=1; AJvYcCXZFmCoAokpmhNeIErW1tB1abLvyLWjFuxjjet6Au+Dwh/WT0BR+6nsPLg/542wipK5llGey4AR3hAr@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDvIIPQk8TlHbAI0TCaQRvBNCn5V0sXe+KDv1iO+rL/BalPGB
	/SPqJAj8vjRSOX34TJrwenp/05H89OA1S6Be/IZkD1KH9QvvAHt3Z9CY
X-Gm-Gg: AeBDieuy1EDPl1hY/6gHkJLgUNohERVBIvT4MRSinVGxCdKq6Oya/bYlyB4uHXTNCdR
	zpbtoQCfmsJhsjB5dg4ipFBQ57L1QUfvvA0ewyWPkPxGZXFDnSisCnp2LPqLoDJ4rc9uR/G8U5H
	A5XWzJlahmUeDe+IuaJs0UfaBgEa2VzSU36iVT/u3H9YqwHVMeU8q26bps667dL9YxvO9VlZ83V
	Gn3vBWagVoK9bjc4okpoAzWXIdY4XzXCqdFfVBz4TnXzzj88z6I9xkXFsoqkqAHdl8uvcGdi745
	v+C7oUa+MtU7ZibhbF4/7NUoC/QJNu+XQSdW/0LuW7lQPFCNKAbDs0Hsw5dNXhUWgxZ2Cb4UZVi
	5BuODayZjVaYXB0RXRH2lHEPeUORihy7FrFsQ5i1QaXnVBlKMj+GhaTv6cH+Z5heXBVrgiiOpIc
	icy+UGf0SONDZgI62zeds4+fpkZYyDKpZHLuzReNBJ2i1ZF5Ih6ChhF+zcAaEgj8lA
X-Received: by 2002:a05:6000:1883:b0:439:f605:afde with SMTP id ffacd0b85a97d-43d29314e93mr22324658f8f.51.1775550374535;
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:28 +0200
Subject: [PATCH v6 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-8-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db350c8f53aa0f314183b3173fd76..a7d88564630f3332270ba5fe47b078bb14f564e5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
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
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

