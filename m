Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE33A6B6E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448416; cv=none; b=CSu5QbYTHNXbYARKzoVMZdLGwyISfBvDV/H8RfWN1zva/BUp7PF2mm1ebLFERNn3UrCG0LPXE1DqRbigPwnwYvH18tHbeaSyGbA54KNrsx0SBA8Q1U4js572RTwjrt3m3gOAH3fiFIngLHm4L2fk+bVOS90VEP8IEZpnMMqwi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448416; c=relaxed/simple;
	bh=/oQGjSh7hhpJGZL5WTg4XLWkyAqB7kuxYI8X3iFjlGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ID0h3P69JxsH4XJab8BdQUeqCniF0vXC3oLxAmEPmMQaSH4NNcmkHaCFHZKT6nPVVNiTvIodgHjQZIOmUHuBnyvTEpE4ANfepAGG9acCYPf6LB6uc+kNIemj/QSnTbY5zGz90Gjc2vRMoxOYLxQNW3LHu5CyQNIyghE7M+wcx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM/XG9rj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM/XG9rj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC461F000E9;
	Fri, 22 May 2026 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779448415;
	bh=MiFiIivn93pRRx2JtGhi3mfd1dXqlFFjKHOuLV0JuPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fM/XG9rjf33wj4D3eIoezw3VHvhQw+rNMf9OeWb5YoPTAjzpYi/I0kkM5greWvfme
	 z8Rgvk0BWKJt+tMRB1RItwggqXL3RuflB9yPnOPJ4yiJIAdzZocGpB9VspZcy7hvyo
	 FQvZ7h7oUpGnS+exDoMFocMrMCjL3HWF/UKmNYj+6bmPVx0Jxfx5OVXXcXV89xn7yp
	 u5J8MkSNGzw4MI4LmAYR/L/eRTgSpzF419eTXwle7oQN3IpXKZObB+p0D6MH05oZpi
	 sJA0+tNXWfANTW3gKgovyjpta8rUteJH27xqx4QOKRNLBk+al4b4rrUSMqA3FLIrWW
	 ULyCW2Il9ruLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: sc8280xp-arcata: model the
 PMU of the on-board wcn6855
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgZGUgQnJldGFnbmUgdmlhIEI0IFJlbGF5?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-8-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-8-dd9d477407f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 11:13:34 +0000
Message-Id: <20260522111335.1EC461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `bluetooth` node incorrectly retains the deprecated `vddrfa1=
p7-supply` property instead of updating to the required `vddrfa1p8-supply` =
during PMU migration, causing a schema validation failure.
--

commit 76c3a5c815bb3aad1ccb11de6a36790f3b5d30ec
Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>

arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855

This commit aligns the Surface Pro 9 5G device tree with other sc8280xp
models by adding a node for the WCN6855 PMU. It reworks the inputs of the
wifi and bluetooth nodes to consume the PMU outputs and delegates power
sequencing to the PMU driver.

Link: https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d956=
4@linaro.org/

> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.

[Severity: Medium]
Does this description mistakenly mention vddrfa1p7-supply instead of
vddbtcmx-supply? The qcom,wcn6855-bt binding actually deprecates
vddrfa1p7-supply in favor of vddrfa1p8-supply.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts

[ ... ]

> @@ -820,20 +892,16 @@ &uart2 {
>  	bluetooth {
>  		compatible =3D "qcom,wcn6855-bt";
> =20
> -		vddio-supply =3D <&vreg_s10b>;
> -		vddbtcxmx-supply =3D <&vreg_s12b>;
> -		vddrfacmn-supply =3D <&vreg_s12b>;
> -		vddrfa0p8-supply =3D <&vreg_s12b>;
> -		vddrfa1p2-supply =3D <&vreg_s11b>;
> -		vddrfa1p7-supply =3D <&vreg_s1c>;
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply =3D <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p8>;
> +		vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p8>;
> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply =3D <&vreg_pmu_rfa_1p7>;

[Severity: Medium]
Should this property be updated to vddrfa1p8-supply to complete the PMU
migration?=20

The wifi node was correctly updated to use vddrfa1p8-supply earlier in the
patch, but retaining the deprecated vddrfa1p7-supply here in the bluetooth
node will cause schema validation to fail during dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-surface-sp=
9-5g-for-next-v2-0-dd9d477407f5@gmail.com?part=3D8
