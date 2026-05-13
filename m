Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F86385D72
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705926; cv=none; b=lyGvTCSDaWzvSFHFB+hT8Miuwdi0tetHScmNsp7vqLnh9cQbQlRHuBtewbUDZdw0ys1CGksooGNyYYdp8BAtHief/eGRK1DXhmDtYZsw0hBHsJN9HpCpx0Qujv05q3MtOXuumiho1PneOL/b5P4DdTuACCLPQJOSkrjhrjCA3+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705926; c=relaxed/simple;
	bh=bapKIArZUi6akR55bHzsNLNT9h4HDKHEzRRjPXzNL94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fp3BFknCf1AAxYYa9PxF3/IvLGwLYP5E+BHKZOZI3pR+6AZi+yxfXZ/3LmkAR9OKkoD/FzFp4EXhWTEDhKmR0nlBZ4btcqtc6bDug8Kya4Ny60vyvxOYGMSpm+aPPLlw0ONehjuQ/0s3427kYj/oBOhMLBydoqspURIF5+AoLhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARfbvKvH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARfbvKvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FE1C2BCB7;
	Wed, 13 May 2026 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778705925;
	bh=bapKIArZUi6akR55bHzsNLNT9h4HDKHEzRRjPXzNL94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ARfbvKvHJ3JhD+JAJowI3WzfWzwhE9g0/Qm+6ZygqYOkM0AiLr3M4QYbEBU7aIyv2
	 ll7X1RHfSWeBTp4tFwep4OBzy3KgUFPif0HR9P7/rqjbPKrqUQ+tp7FBCLbPAk9JKo
	 0vURpEu4NLNG4OGh06PWSelXUPNQATL9JnLEBm+jctbuQ6QwKrmoEbPCnkW9I2jgON
	 GSFTJ/OakXgIfVQW0IlofFLj41sRdvtQ71pEg/6rYrpzqX+LOb01HIRqS02sZej+je
	 bK/bYTV5BiSOi2xy8Z5pOu3Z87Mpc33v263YM0Nk4Y7g2Im3jLsp5B59gU91oECCpA
	 qvNpQ/nq6n1zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/16] ARM: dts: mediatek: mt6323: add thermal
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-mt6323-v2-13-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-13-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:58:43 +0000
Message-Id: <20260513205845.54FE1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The thermal zone node name `pmic_vts_thermal` contains underscores,=
 which violates the DT schema validation rules for thermal zones.
--

commit b08a96e273f3be780a8e1efc4286fbc9434906b8
Author: Roman Vivchar <rva333@protonmail.com>

ARM: dts: mediatek: mt6323: add thermal support

Add the devicetree node for the mt6323 thermal.

> diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6323.dtsi
> index 435936b477fa8..9825e15ab4e49 100644
> --- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi

[ ... ]

> @@ -274,5 +286,24 @@ power-controller {
>  		rtc {
>  			compatible =3D "mediatek,mt6323-rtc";
>  		};
> +
> +		mt6323_thermal: thermal {
> +			compatible =3D "mediatek,mt6323-thermal";
> +			nvmem-cells =3D <&mt6323_thermal_calibration_data>;
> +
> +			io-channels =3D <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
> +			#thermal-sensor-cells =3D <1>;
> +		};
> +	};
> +};
> +
> +/ {
> +	thermal-zones {
> +		pmic_vts_thermal {

Does this node name violate the device tree schema validation rules?

According to the thermal zone bindings, child nodes of thermal-zones must
match the regular expression ^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$. Because
this name contains underscores and ends with _thermal instead of -thermal, =
it
will fail validation.

Should this be renamed to use hyphens, such as pmic-vts-thermal?

> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <1000>;
> +
> +			thermal-sensors =3D <&mt6323_thermal 0>;
> +		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D13
