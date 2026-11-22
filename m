Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378493;
	b=GWtgGqbRZnqlroS7IpbvGnRqMz3+9qZCEpVkr0MFOeuAAEbLuHSgA4BNsP29syuF/P0J
	 J3r5V0ngQnUzm5pM1Ab0kAlqRWaKBbL2FKrw9HTzkSouDvYW0irN1Fqh3ygwfVZtPHEEE
	 NN5w1CxMEIdnBL+0LwbEtnm0sH9fZhQEyermGswCHf3YWAujvDXZ4Vx2AFb7J83BaAHBc
	 ClKxGYQ2j/Q4GhRgKCiLe//Gu8ekdX6KRmYHpV3zpd1h9A8GZTv4uUcuXWUh88EKjSLe4
	 hYfF6Zg89h9pEkh4hk05h49XrMtvCgxuPI/cYbZj5wluWslIRDdvLhZLV2p/q+18vZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
	b=UhecpOHVN/UUDNvHKBePdhsNXHbhUg7J0O73bafjh3GZfnhEUe5CVetjMPO28DohMBqv
	 Nnr3Cd2OzgjIxYs2L82nlQf7xz3rYBboKcV0n0EVQxQDDgOesJK5Dc4kbUBkBLeZayaGK
	 +MAOojCMLosPpkakwoL9Q/KwuBahBywCKzvW5IbWFMuVp5ryhsBK47Yu+CuE64J4lShi/
	 fQGxe5UZhwnB49kECRJaCrvmq+UBWNnCyGRuS3YycoywchFxgEcqvUV+57FxdYAXc+EWP
	 xzL+0SVIMasj34QTCQndCOMKxSS529s/AzygHqrXIe2bkN4C/K4Th/rlULUqUDm+DLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2wgH2KH;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3028A606A335
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3028A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2wgH2KH
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so3748340a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378492; x=1795983292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
        b=v2wgH2KHkoMEBCbDMNy/CLvF2i/ojO37ANtTooF92PR8zfLAXMphuBNEDpUMves8zg
         dEftMPYnv3oKDFloRDc8nXQXgF6PCq/sFo5qlVXD5Ut7Qa3Au73qHnt1wrsS0rrrw+gW
         GsXy+CZ5cLneeQR3oO3q2jMdI6Ekxw9JBF9mjRKjOwuTEVqiiFsN9ZpchUrIcoZdIPy+
         je0dwgfKlOSoP6qeJ4dLUYRfLPfNmnYpvoB7LOwJxIzZcQVDexgqLFgVUkNsBYAXN/9/
         ZYVI93gSOqpEYNWpaERq12nOPAinictzu8ttCnpYkCgIj/8JHI8uQZGAoOgdD+kEv/MZ
         zQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378492; x=1795983292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
        b=V+KQsFh7dntSvKRsSICqTYorzhJ5KX+pLlWtKFuTS8GGYElh+dShUOyaUS7kITmvOo
         cvQS8QCBzbL9fagep3+1QIoB0n5CU7W19nJQEFdr1zrrAKEjG1/zTEqzgBqPQU9bNF5S
         UGuAQao9DiOdQZGj2K1SXpL+Y9rJztlHP+ivnJjD3qDbSHKXWK1ALaltDmi6pgnqx4Qp
         PMVUYApOig/oGNPZ5PwF9J9EXoBAPQha4kNhR+M1fAuAfgdmgE0+TnBwCJpiAaXG9cLp
         1Rgs8dXTWBwV8UftjdxudECBnwo4IxcUT9nEREW7tpjbk2oKaG6WIfQuOVttnAQrad41
         iMTw==
X-Gm-Message-State: APuU4Z/aKRuQ9/gaZNKJwOeyc8S8pLxi2R+FfB77QEryMGdEiw2CE5+G
	IcU/9KTbnQf6FtD9KvGmowVQitGQGeaa4J4Vrk+PlOpF+RJBozyH4k7X
X-Gm-Gg: AZFdTZf9VAqsraLM+6TkPQ9g1DmV7ZxPg5YY5tU5xrBFU0pvN/6Zciko+fSFREKIWu6
	fwNV6NTXe2ebQha1V4Wr13k1cLlMGw3IMRLENUpN8PVMFt45TAt7bV/cP06ugU3z1YGQY0CtmCX
	CLkCCAm4PuTvp5q3nZqdqjgmrgOFILiLEkNKM6CI51xqUWPiKfWQR//PgKUwFprT24ikdNJRMtJ
	WBnhpjl7BFBGhsZZhJo1cLbPUq3ZKWq7cu6UfH1pvvpECbHs0ESy0MLG8xaMgxTjRQeZzpV47Ng
	9N+fjOxh4hdgxqzd7WkGODGv12HjsVHCe12ncKNMlvreD7vQ1AYL77tBPOWf6LVB/J3sWErZNy6
	sVlKjxKKA6g/eAC6NcEgkw9xdNABPKOT/QQcN1bjBf1QvNGnbW6fyEtHgPWFYAJ1KO+6QJ3wqVV
	tUU+V6CyV7JYclSYnz5v08N7Lv9raSVzjbGJC0YeqTSTYBu5ZtX2wAYaGJ5x/mECyVD2WVXo8gq
	M2lqmYAFbjjyaCHGED94CnCmyCH/VVcbbdCHj35p8QLiEHtEc0yNNk9dwoE9rQpV4H9C5Ke7fC9
	46vvryGyG4UEGcuAh6Hwrb0vNKaylG1nnuERqUib6MIiaj1jAukQXl5kxKY8iwgaTTaTnrBh3Hm
	Sjwbowa6h4w==
X-Received: by 2002:a05:6402:4585:b0:6b7:63b7:4e7c with SMTP id 4fb4d7f45d1cf-6ba37e8f6cbmr6765670a12.17.1795378491456;
        Sun, 22 Nov 2026 12:14:51 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/18] ARM: tegra: tegratab: Add audio codec and sound card configuration
Date: Sun, 22 Nov 2026 22:14:00 +0200
Message-ID: <20261122201407.23742-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegratab supports RT5639 codec for audio processing. Add its node,
configure the ASoC sound card node, and link the codecs to it. Enable
i2s1 and i2s3 in the AHUB used by this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 911e5e9d8a0db..07091ffa6df19 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -989,6 +989,20 @@ gen1_i2c: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		rt5639: audio-codec@1c {
+			compatible = "realtek,rt5639";
+			reg = <0x1c>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			realtek,ldo1-en-gpios =
+				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+		};
+
 		fuel-gauge@36 {
 			compatible = "maxim,max17048";
 			reg = <0x36>;
@@ -1346,6 +1360,18 @@ hda@70030000 {
 		status = "okay";
 	};
 
+	ahub@70080000 {
+		/* HIFI CODEC */
+		i2s@70080400 {		/* i2s1 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70080600 {		/* i2s3 */
+			status = "okay";
+		};
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
@@ -1619,6 +1645,41 @@ vdd_3v3_com: regulator-com {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
+	sound {
+		compatible = "nvidia,tegra-audio-rt5639-tegratab",
+			     "nvidia,tegra-audio-rt5640";
+		nvidia,model = "Nvidia Tegra Note 7 RT5639";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOR",
+			"Headphone Jack", "HPOL",
+			"Int Spk", "SPORP",
+			"Int Spk", "SPORN",
+			"Int Spk", "SPOLP",
+			"Int Spk", "SPOLN",
+			"IN1P", "Mic Jack",
+			"IN1N", "Mic Jack",
+			"DMIC1", "Int Mic",
+			"DMIC2", "Int Mic";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&rt5639>;
+
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_LOW>; // check
+		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
+
+		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
+			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA114_CLK_EXTERN1>;
+	};
+
 	thermistor: thermal-sensor-thermistor {
 		compatible = "generic-adc-thermal";
 		#thermal-sensor-cells = <0>;
-- 
2.53.0

