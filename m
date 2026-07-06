Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91E38D018
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322367; cv=none; b=SVuzSNqSQYTThyx26IHgn19D4thAcFZ8VmMKpVX+aPOaEQGG4azN4Cid3ExAy0IEGfcboYeFUVACgW4+E9LJZY1gB4CjrMdWskuBoydqQAcem5TVxlCvx0ATGF1DGXLKq4MCWkE/V0uinhlU11HAbxMI+Dzs5g+KMEhtdm6bb8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322367; c=relaxed/simple;
	bh=BlUcClODoiV9G+AltRK0o9+/KQRHJksrWH+RzUGWiKs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OblKhQ60XIhgbAYblWyIrTA/vtgKzbzWUz2Jhdl62DLm6coco5LU6qlPdlzOuX1ls1wDCXDBwPoX/88ViSzv69lVb7xahawKyRaNB5RJVPwhR9IR8ncqsPhrzQ9ngmPJJD0Bn9p2O0aP/Odm5PSxPK91DBJ/52WcnBV4JXdT+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2vF/aRvD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2vF/aRvD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c126e47a82cso309803666b.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783322352; x=1783927152; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmUXCOCPEQve7uQszqWLNxUchTVaCM6v+Ik51kX/11I=;
        b=2vF/aRvDo8KRuhYiyLQCjpiRY1qAB+5FRDz38i2lQy/fjorPUIVt3fcJLe7wFPc41a
         9uxk8zNGFlQqWiABYx79Ep2pLZju3EkhEaRJBKZdXBq74KSbnGyJDLOdBJuPP7RowDsR
         3nS6jO0uec9GaD/XXLu4cHDzRn2naDofBymW5CWtP2fvpV4AXcA/yoBV8xUT4g7StHld
         du+/iDdn1wTwG7+4b9v/seNXKuaGdu9q8wmFtNYMTLHQaaY6G86lD4WPbsx8+qdTa6aD
         JdHWtMXiUXrxCv+kzOtArnLE4m9EiX4pJSgEtvhvCtLTmX55KniwLh4peSjeBS58yLW/
         iFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322352; x=1783927152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmUXCOCPEQve7uQszqWLNxUchTVaCM6v+Ik51kX/11I=;
        b=mJzpT+BH4/9bczpZqCw6ZSb/ZMdBYX7ekHhvJmpG+BxqJaE+KMq6Vje5xvW/7QmZK+
         BVWeUKVPwldLQX6gNrbLOP9JXOwCCPy9laKGacmbv8uIQ1CkAI8F1H10lGmGMZwbiK4U
         U8y+4Xq/M+8+5cozRzWnzCkvXXYUcqPcEiFSyEGuVXExSPCcmA3kCvAiBNWl56gDVQzp
         /Plte4+ha2O4zGMADs8SGlvRySYYPXUu11LOhl8xpGp38+nYFs/kxRB+EcN4OXhqK7/V
         O/VrqZ3GIl8tkDKBXFq9pCMhPQt4qJuumwLajVVWYRYuTjPxyxpOl6IScgnk/yIf65nA
         16nQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5WjIhRLNcity32nzeRLXrSdX0Rggdy2bcBGEr5SR1QR9SyJnyEfsaqEqyfu9LThITcXqfxTthTiCI@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZvbsTVwj4ozhhS3b5k2H2KhnhCYFLz0U2WkqC1GwnoUC2ZAs
	ermVswqMwZ/H+vh5lrxrX37iv2IMKUZI3cfdS/mLkbyJNT/1IHazRtAEwgcNKmkME4w=
X-Gm-Gg: AfdE7clkXi6iwMlxpqF6JNkJCgvtI1bivc77gbcyc/BvhNIstMEheaqKGH26d/dnL1B
	Krq+UFeCFLfv1zjdcVuS9FShtUW9pADE/ISv6LY2u3BQ104HwSkKlu/3PgJXSIIULXGAa/JXmuA
	lb5nBtS29ASaC8zHswa15WHWvtRaoLFelMG40/UjqDxYTNc2haYao1CCebupAbggIYpzif8RoA4
	dqJb5oyrDkyLvjEZjwABllX8nQe8p2mjmymSCVe8UFueq67FCG3K/wV8vBrf/LejzadlwtBcTj2
	+G/yLTMPDaYesxOfMUq0wbi+f+WLBHczXPsXyPAzNjdNRv+kF4l8c3imRt/+7lih0kPTPtl7Z1E
	opwDts3ZhSlcCWke4ym08ce5XKIfQ5LaXD2IUSm3c325NhJN2/A5Xb9pyBopkgs/8WDn3iLGO4i
	1ihgsLX2cZNCvrcq2XdUJFaM/6Jmr96v899v4BUWz+ShcYF2cCV1l8tIzKiw==
X-Received: by 2002:a17:907:3f9b:b0:c12:34ed:e0fe with SMTP id a640c23a62f3a-c12e6c0c080mr308164266b.60.1783322352134;
        Mon, 06 Jul 2026 00:19:12 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm679184166b.35.2026.07.06.00.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 09:19:11 +0200
Message-Id: <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com> <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>

On Mon Jul 6, 2026 at 9:03 AM CEST, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.

Until Qualcomm decides they are ABI :(

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
>  arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
>  arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts      | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
>  9 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boo=
t/dts/qcom/qcom-apq8064-pins.dtsi
> index e53de709e9d1..e95da761234b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> @@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
>  		function =3D "gsbi7";
>  	};
> =20
> -	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
> +	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
>  		pins =3D "gpio82", "gpio83", "gpio84", "gpio85";
>  		function =3D "gsbi7";
>  	};
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index 95be1d2e214f..06c0af0aa317 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
>  				};
>  			};
> =20
> -			spi8_default: spi8_default-state {
> +			spi8_default: spi8-default-state {
>  				mosi-pins {
>  					pins =3D "gpio45";
>  					function =3D "blsp_spi8";
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dt=
s/qcom/qcom-sdx65-mtp.dts
> index 07c10c84eefa..2c0590617ac4 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> @@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-max-microvolt =3D <3700000>;
>  	};
> =20
> -	vreg_bob_3p3: pmx65_bob {
> +	vreg_bob_3p3: pmx65-bob-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_bob_3p3";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64=
/boot/dts/qcom/lemans-evk-camera.dtso
> index 4600d5441cce..a4c6d39cf777 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -14,7 +14,7 @@
>  #include <dt-bindings/gpio/gpio.h>
> =20
>  &{/} {
> -	vreg_cam1_1p8: vreg_cam1_1p8 {
> +	vreg_cam1_1p8: cam1-1p8-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_cam1_1p8";
>  		startup-delay-us =3D <10000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm6=
4/boot/dts/qcom/lemans-ride-common.dtsi
> index 40f88498999b..cefb8ff00806 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
>  		regulator-max-microvolt =3D <3300000>;
>  	};
> =20
> -	vreg_conn_1p8: vreg_conn_1p8 {
> +	vreg_conn_1p8: vreg-conn-1p8-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_conn_1p8";
>  		startup-delay-us =3D <4000>;
> @@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
>  		gpio =3D <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	vreg_conn_pa: vreg_conn_pa {
> +	vreg_conn_pa: vreg-conn-pa-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_conn_pa";
>  		startup-delay-us =3D <4000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3ac..e5a57a340cd8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =20
> -			gpu_speed_bin: gpu_speed_bin@240c {
> +			gpu_speed_bin: gpu-speed-bin@240c {
>  				reg =3D <0x240c 0x1>;
>  				bits =3D <0 8>;
>  			};
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/=
arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7393978926e4..0796d9dbe158 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -136,7 +136,7 @@ ramoops@81f20000 {
>  		 * ABL is powering down display and controller if this node is
>  		 * not named exactly "splash_region".
>  		 */
> -		splash_region@e3940000 {
> +		splash@e3940000 {

Please read the comment above, newer ABLs explicitly check for
"splash_region" being present.

Regards
Luca

>  			reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index a350a8ba48fa..c50ce1843703 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2927,7 +2927,7 @@ ws-pins {
>  				};
>  			};
> =20
> -			lpi_i2s4_active: lpi_i2s4-active-state {
> +			lpi_i2s4_active: lpi-i2s4-active-state {
>  				data0-pins {
>  					pins =3D "gpio17";
>  					function =3D "i2s4_data";
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/=
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> index 7eecd9dc3028..70c130c5426c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> @@ -46,22 +46,22 @@ framebuffer {
>  	};
> =20
>  	reserved-memory {
> -		adsp_pil_mem: adsp_pil_mem@55300000 {
> +		adsp_pil_mem: adsp-pil-mem@55300000 {
>  			reg =3D <0x0 0x55300000 0x0 0x2200000>;
>  			no-map;
>  		};
> =20
> -		ipa_fw_mem: ipa_fw_mem@57500000 {
> +		ipa_fw_mem: ipa-fw-mem@57500000 {
>  			reg =3D <0x0 0x57500000 0x0 0x10000>;
>  			no-map;
>  		};
> =20
> -		ipa_gsi_mem: ipa_gsi_mem@57510000 {
> +		ipa_gsi_mem: ipa-gsi-mem@57510000 {
>  			reg =3D <0x0 0x57510000 0x0 0x5000>;
>  			no-map;
>  		};
> =20
> -		gpu_mem: gpu_mem@57515000 {
> +		gpu_mem: gpu-mem@57515000 {
>  			reg =3D <0x0 0x57515000 0x0 0x2000>;
>  			no-map;
>  		};

