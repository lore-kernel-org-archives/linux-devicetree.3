Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF027456
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431898; cv=none; b=k56leVl/sk33YQs6m7vUBpDmRAwsMA6Pu2lhnGywx9GojC/KmvxdxCEljS5k2azZ0Xh/N1S+7Q8wkx0YF4eCqA24j2crTnK73eRBPVbAcg/e4OrnHmP0+LacURzvHnyTNU0nCAU+Vgk9rfVl8F5tIK2HTPTrP1eVdmbPjlDSf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431898; c=relaxed/simple;
	bh=q9b+FH1tX+CFKTerqTUoUhWtb98VM2VPpL/yyLjCVLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nKUMiIhhXa7SxPydjOQPhdIPUUlceMgkCEGB56SJ0yYOkEW3GfakBlBNhadmIzDqZICcYN1bV/thKqxkhjcDYrNb2DxP/G/VaKmMGGJtCtv0b0JRjNlLlRt9UEsRFozhABmZFkdF0Ak4+DPZybI8etwVgIYnuMAopjjjidRIru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaRyGWS4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaRyGWS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47171F000FF;
	Sat, 26 Sep 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790431891;
	bh=KUQkDfe1dlQHuc+TjtZoa9JN6JTUsbLT3hL59Pkv+W8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZaRyGWS4+aJ3lTxB3S5F6tBFaT0PD/6o0FWNF67z9Udhs334vR60x1rPdvxcQF7eV
	 K++FY7T/ZP6unOdtw84sKprNswDEnY1aLVhRQR3uMMDv2m1kdL/VkpLwrWi1Dj6FHR
	 BphH5CMUOj6DTTxAZGIpbBELAQZCY39oXkEW6S5ikk9xEErrlMODE+Y/ou2J/ojOxr
	 ClUov2UVfVfGiFRle5RTtEbpExyghGk/SNlsHv22DLrv8wzeYeFHGFGjZCZdksN76i
	 jVu353EuFnzYq6pX7O+ElKE83Q/U37gCXVOOR3lybLx3OEIX+sajhIaxUCesuMVP0T
	 07FYHiXmDDWoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:11:30 +0000
Message-Id: <20260926141130.A47171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing swctrl-gpios schema definition causes dtbs_che=
ck failure
--

commit 2895c104a8a87260afe61b3db500946505dbefb6
Author: erebion <erebion@erebion.eu>
Subject: arm64: dts: qcom: sm6350-lena: Enable Bluetooth

Configure the required regulators for Bluetooth and enable it on the
Xperia 10 III.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index f3ed6445c7d35..9be0e7ceccb55 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

[ ... ]

> @@ -424,6 +466,73 @@ ts_int_default: ts-int-default-state {

[ ... ]

> +&uart1 {
> +	/delete-property/ interrupts;
> +	interrupts-extended =3D <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
> +			     <&tlmm 64 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-1 =3D <&qup_uart1_sleep_cts>, <&qup_uart1_sleep_rts>, <&qup_uar=
t1_sleep_tx>, <&qup_uart1_sleep_rx>;
> +
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn3991-bt";
> +		vddio-supply =3D <&pm6350_l11>;
> +		vddxo-supply =3D <&pm6350_l7>;
> +		vddrf-supply =3D <&pm6150l_l2>;
> +		vddch0-supply =3D <&pm6150l_l10>;
> +		swctrl-gpios =3D <&tlmm 69 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this property need to be added to the dt-bindings?

When running make dtbs_check, the swctrl-gpios property here fails validati=
on
because it isn't documented in the qcom,wcn3990-bt.yaml schema. Since the
schema enforces unevaluatedProperties: false, the build generates a warning.

The hci_qca driver parses this property correctly at runtime, so there
isn't a functional issue, but should the binding schema be updated to avoid
the validation warning?

> +		firmware-name =3D "crnv32u.bin";
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-pdx213-ups=
tream-3-v2-0-b4612e3eb536@erebion.eu?part=3D5
