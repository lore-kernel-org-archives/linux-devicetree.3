Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576293;
	b=3QsOU//S5vje1xsd3rZl26L3gthpDWz0o8Ri+qdrSuDmsrAPgRMVDLQmN7JlMJV9SRCl
	 PcEyKDQ2u3KO3MuAm8aR+Kt75Ag+B4nhirg9pnbbxDKra4rjyP2RvfNONr1VV+BJYbSQr
	 SPK0bMRDhPxl/paigvoqhskra3atWL4XozpnerglREOocmddEkqJ/277KD6ARWS6oNmrg
	 jpwbGeJ2BmwKzjEbsBZKGsdOBqLWoVfps4uAD33+y3IHs8VgbVW1HhpDFtfcMObuAmepO
	 eHRyRdRsrgxjIKDgsq8wA2n3ucdN5FwRGzje+OCFvM4XE/GkiB8Ghr1mCHLBRNePW9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qDEkJ+y7fTxS070doIg4meeeWl+CCzsZV4heyjcpoSU=;
	b=qovGxlKk0cDaKA1CSRQO7R9/+t+dd73CwHtZCIoP51ZjfNwFBIE73zgpHTnck/Ej2U5U
	 MlUAG2dxLMhbI79Ia9QDiPAU1SEYZMZ1JZ7lxEIKzIZ4jxdNLAzhKvReK3E/Qdyr8vh2F
	 jJnDDh/U4nC+l5k5go3AI0tK/SbJXb6ZXrHe+0MaUydnL2LAWg2SUCb/F+SQyghnSXbxw
	 pLWYLVYntCg7C/EnOHjf37uxbzTEoDENySMZKTenWSE8/ge9aGupaVhJmMt0TgMmwfxSQ
	 UOOzJ7zYIOU0nFOhoIwaUtZJd8+f3tmwnraXNBA85ZuD8XWicVD52gEldtm9us0wktA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1FcLBzq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B344606A32F
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1FcLBzq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611A91F000C1;
	Sun,  1 Nov 2026 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576292;
	bh=qDEkJ+y7fTxS070doIg4meeeWl+CCzsZV4heyjcpoSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1FcLBzqM8BVBVSfwWy4Lp7mzUQquycCHMhsTyTBhGWnVGGBZswcnGdUFRF7+vdyJ
	 yd0TpUOgQSJq++xnMSgMDsJuUAsK2LMVSer6aHzN0cbNjszAFFkWsjGOUMI5S6KeQU
	 zHSq+s9cr/3lHhmTyZqu5xahZ/x6vTI1rVD/VZuDLnQkrDZwf+DfqIaRs2U0NrRuv6
	 2A5wPfZ4u3wFAWIuAPrA2E8CEW6XuXPMK1wGFb0EVekHQDZm/tsN0AKtzcALe9yBnM
	 nnerBFyPGDxDmpU19Wrkf1LI3kb/chod8FVrEpTuFMYe+6cFsHbZCXrejSwfAGxdJu
	 /SNV3O0puP4HA==
Message-ID: <sashiko-outbox-192758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:38:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: sm6350-lena: stray unused regulator-lcdb-dummy=
 node
- [Medium] arm64: dts: qcom: sm6350-lena: invalid led-max-microamp in pm615=
0l_flash
--

commit e7731bb19fd5c211a5eb8caeb5f7301cbd391239
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: rename touch-en-regulator

This commit renames touch-en-regulator to regulator-touch-en in
sm6350-sony-xperia-lena-pdx213.dts to keep fixed-regulator nodes sorted
together, and also adds a regulator-lcdb-dummy fixed-regulator node.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6942a117d41cf..9295b2e6f179f 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -46,7 +46,16 @@ key-volume-down {
>  		};
>  	};
> =20
> -	touch_en_vreg: touch-en-regulator {
> +	lcdb_dummy: regulator-lcdb-dummy {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "lcdb_dummy";
> +		regulator-min-microvolt =3D <5500000>;
> +		regulator-max-microvolt =3D <5500000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

[Severity: Medium]
Was regulator-lcdb-dummy included in this patch by mistake?

The commit message states that this change only renames touch-en-regulator =
to
regulator-touch-en, and nothing in sm6350-sony-xperia-lena-pdx213.dts or its
included dtsi files references the lcdb_dummy phandle, which results in an
unused always-on fixed regulator being registered at boot.

> +
> +	touch_en_vreg: regulator-touch-en {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "touch_en_vreg";
>  		gpio =3D <&tlmm 10 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Further down in arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts,
is led-max-microamp in the pm6150l_flash node configured with an out-of-ran=
ge
value?

arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts:
&pm6150l_flash {
	status =3D "okay";

	led-0 {
		function =3D LED_FUNCTION_FLASH;
		color =3D <LED_COLOR_ID_WHITE>;
		led-sources =3D <1>;
		led-max-microamp =3D <1500000>;
		flash-max-microamp =3D <1000000>;
		flash-max-timeout-us =3D <1280000>;
	};
};

In Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml,
led-max-microamp specifies the maximum continuous torch current, which is
limited to 500000 uA for a single channel (or 1000000 uA across two ganged
channels):

      led-max-microamp:
        anyOf:
          - minimum: 5000
            maximum: 500000
            multipleOf: 5000
          - minimum: 10000
            maximum: 1000000
            multipleOf: 10000

Setting led-max-microamp to 1500000 uA on a single channel causes dtbs_check
validation to fail, configures the continuous torch current higher than
flash-max-microamp (1000000 uA), and causes qcom_flash_register_led_device()
in drivers/leds/flash/leds-qcom-flash.c to clamp the torch current to the
500000 uA PMIC channel limit:

	current_ua =3D min_t(u32, current_ua, TORCH_CURRENT_MAX_UA * led->chan_cou=
nt);
	led->max_torch_current_ma =3D current_ua / UA_PER_MA;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-pdx213-ups=
tream-3-v3-0-cdc3be96d257@erebion.eu?part=3D2
