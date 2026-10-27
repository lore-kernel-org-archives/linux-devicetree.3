Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088575;
	b=VMPMMcLDM34zeRPBAR4vB3z86QwXcJgfqTz87FBx3w59Ii2qxJH9kw87ngulmBtzAr7g
	 oGBLeLTWyq4FWGw+t8S17rT9f2RN3TGgkvc04jUHNLjBECVP5AH9Th9vfiz4e8XSQYDbD
	 URehixf3RFWY4FXFwyHwKWEnTd0mEILuxJI/0QcNbX6LHrIvaZ0UFGcJvNvkOZY4wVZdg
	 ZDi9eqfLwjw2URQ4LZ6iU8GjTyE0ZIuzlxQ7ERRUL+/ghpaFBHXlbV7uhkSHX+7MyBE/E
	 YfmzzXcQw0gn4wsPgQOspdHlAQSBEGzhiOydfhRB92j8DzYsMP8GB12i+eaNjYrmPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
	b=j4DfRwUIt4K6XPGW9JbenaUzJfEnIZ2X5HT26YAE5jeT7mBlAp0bXw3C0PBJK7Rzs6kC
	 DLyW9I1TAL5AhdjaqLoz83CcLOpgPAvnoCeurTeyxd38Dt4ZhU3yWmBaquasIcOYmNBKC
	 pXklpAyLt6ndyi+rHnDdIJD5D0uzuAh23aKNbrOa6k6RZekRF69l+UXUsKNJfI9z+kiMr
	 VEmDVEi0rm8zMdoRvAujvv5tXXxtkxbuV7qsny0S/hGN97O/NSsg7sHGO9LNbLzmI+Vzf
	 nprPl8XSDVY3ztsoQ/E+bqmKdgy4NHEOw3LJsVB3zTwOqUWPqbz/dZCWrnguaq7E3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/DANsdY";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43948606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43948606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/DANsdY
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1408698a12.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088573; x=1793693373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=A/DANsdYOfMZdDcFo2VhxZS4HLmDEhEXfo+5iHr4cINMUqrSCsuSj03eR9mc0wM/Uv
         rb3o4QNYpdlEbFwP0jlxP0rAbPOih3gJMmHdlz3riMA4GifVw0n4tYakhiA5aMz8sXvD
         eP5j61jOAYuj0rXjJ6Uy+8nFlcE/iWV8H0GmNBya3NjBrPDdrx82tFjE26NGk3pavMYG
         4vVLkccHH4u9JQ6vTw25myiGN+GbSslRyKOFctFqfz2Qor9BPtXqcynU06PF3MVD07js
         vZXzYl+GVvVWtw5Y+eHAlpfGqebCu9TTlyoEiymQwGo8eahElkpax9V6EaJnKwVYEVAd
         80/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088573; x=1793693373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=fXkvKlggQPTY5a5srBjxNmt95urSQlK9dEo3D+X4VekH1K9EwUbQttrJwZQVj/Whtq
         3kZOwY3ZjxsbCyrMKrJRRq831xtMH6BBJNHEOMWRYkvHQ6Ui3ustkrU8+VSPM8irxQPE
         RlSVphlhaq9rlMszlCZeJJU25b/qcO8lYbpVkgXq/if1S8AeRDs5xlpt5/R4EBSHcbe7
         GZyUXZ32PLDdRdo/LWm4nmtu4rD4tQFt56nt4quEL29BNwL0crAmZpDnxhG5FjdHuspa
         FKZp9lQKUkih9Uy4SJzQLxsfKvs6efzJCmzrXgTUOnxzvKHiNXiuzC9fN/OrWOok6EpR
         0cbg==
X-Forwarded-Encrypted: i=1; AKwUvByckSaeEwJDdqZ6kvMValkhz7Ho8qxgMfMZo5vyMCtAPl8Xs1hPmvnv/ZQUF7eF6zWICkzyF7y8XZAu@vger.kernel.org
X-Gm-Message-State: AFq9FYI2ZPDoaOG8Yjgk/rzx/tFdvUiyJjmefoHbMngrASshBce0XS8q
	zo1S8RBkeTipNu64tDh4R54QARq2CU6czfR7IKBrCmx6XkJFZCXZsxWb
X-Gm-Gg: AYBFou2tMFmYyYeEsPerZMdnMlSzlZlJeRXVVBr8zCbc8K68HOtJQ8bJJ0mwD2/cZRE
	xdpS8NldINOMPigAqy05j0W5L07hF4cEnY1+JqyFOnPj+6Y86+uaAMch1zliLNTV+mSjL7Hbu66
	bwp0JVX7bVXWV7oxx8r+YAI/fROkvaLz98PqkzUFhlXGyBF3F6cVOn3LygEAxVIUX8DNn8Xn3cC
	6jR0HJ0KOFsrMeb+Q26yzZAqyikzZd+1QT0xMncm8MFSMZKrvkwzPjGjn8CZU69QE/23BYZQFhq
	F4E1qCD+u0M7LuQU9pNQEn9ksNWQBY7gnaz1R+wQJrDT7e4IJ1yXRJwDHx9MFxQS8P4bwqgK0Lu
	gzXBAkME9U8aAGmYL06mCUdxAggnhTYZz6v2EjlEPDMZ3G61uVgl92lpxxQwhkfz0Y/1/79VaGI
	jQm61PV9895lYwLTkBvz6bHJdH+RkXiO9Ksb8yh2CrBrxw9fMO6b7lmrR4gOyFqM8ZuxLiKeUHH
	2fU8sEZM+7el2C8S1GUShVsnw2+/cUUmyqXHeDINDPtTChgkJ1vJ+MTksLpWKUv9mSTnetMFIAZ
	VDTbHu/gOCq8+GrO6Jq/ltS5w/1aktlhjUr0xeVKe9tnZ6Q=
X-Received: by 2002:a17:90b:134b:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3adeb0ff8b8mr7038477a91.54.1793088573225;
        Tue, 27 Oct 2026 01:09:33 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:09:32 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Tue, 27 Oct 2026 16:07:53 +0800
Message-ID: <20261027080758.3990418-2-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has an on-board SD/UFS card slot,
but the SDHCI port hasn't been enabled in the dts,
so we can't use it after booting.

Enable the dts node of SDHCI for the on-board SD card slot.
Add the pinctrl node of the SD card pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..ad60be5d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -396,8 +396,47 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-default-state {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sdc2_default: sdc2-default-state {
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
 };
 
 &uart12 {
-- 
2.47.3

