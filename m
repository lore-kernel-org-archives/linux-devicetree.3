Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D191A680E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 02:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155862; cv=none; b=hm6OxYu/kGLHSYGpH90T4+ra/22VNSMrHnE7rGG5DRjfDn4GnbE/3P6cSKDEDAL1C+dhx7s/Fkyu/DLdrap3S/pokIreRGaPlanS6JuVdIMa42K+wotE0dY48wMsAYlzqBAAAvglS/dPES0QQVNGMU2NaRd+CJ7xoCwYTY/xmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155862; c=relaxed/simple;
	bh=/Q6Q2TqDS+pcmIzInZcDgFJp+qWoU9/603EF9Oc1HB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o/YsVltj53Aig93WnZSnOSoYF4CmKazXggR8Gu5KpHTBPMuDkGdla4g04gw3G+wMzc3lQhktrGycjQxFyjoANS4VCrycej6F8rR8+YpalxOI2CFtNw8/Ni/ZlBweq9S/ANjpHl943sOIsHho+L6zJ4kNnymVsHDIudBaVOlhBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsqtDJ7W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsqtDJ7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B990A1F000E9;
	Sat,  8 Aug 2026 02:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786155861;
	bh=7qMF55eKxnIMkvy3/V9GPvISlOep0HbpdV3AbhcYiro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fsqtDJ7WaBNM3kplSJXs5BqLNh71i0RDFf2Fzx1iIi3ntZfOgwp04KudlJE614xvm
	 Eaz9ZuG3kjTGuGhg+2VIjXCQDSIMWZK8mOMP590Hapt4eAuJ7RB3psR5dH7FGV4FvC
	 1F6b31U5A05sIIagSmJY5lA7hQkdnR9/REe7ccUiZgPRJT0eVZwXSHtqrHWOsu6hfD
	 GCeTOm7RlFZ9lTAx0uXY96AUMJE86Y3JjpSY9BbCzfTZZBgf7QIk5pwhCzku6S9i1J
	 WqydC1NZCrzeOVTh7rX3pLrDFTe1eZPzBxhAWtedfwkqhEriiFZAZ1k0V6aROn8xot
	 aZ3QHxh8SI0aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807021001.239389-7-jorijnvdgraaf@catcrafts.net>
References: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
 <20260807021001.239389-7-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 02:24:20 +0000
Message-Id: <20260808022420.B990A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'wake-gpios' pin (gpio7) is entirely omitted from the pinctr=
l configuration.
--

--- Patch [6]: [PATCH v4 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NF=
C ---
commit 971202c103843632f71a5371f28acebc71b278d0
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

arm64: dts: qcom: milos-fairphone-fp6: Add NFC

This commit adds the Samsung S3NRN4V NCI NFC controller on i2c1 for the
Fairphone 6. It configures the clock, power supply, and relevant GPIO pins
for interrupts, power-down, and wake functionality.

> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3a..bdba848275db4 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -601,9 +601,22 @@ &gcc {
>  };
> =20
>  &i2c1 {
> -	/* Samsung NFC @ 0x27 */
> -
>  	status =3D "okay";
> +
> +	nfc@27 {
> +		compatible =3D "samsung,s3nrn4v";
> +		reg =3D <0x27>;
> +
> +		interrupts-extended =3D <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
> +		en-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		wake-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&rpmhcc RPMH_LN_BB_CLK2>;
> +
> +		pvdd-supply =3D <&vreg_l20b>;
> +
> +		pinctrl-0 =3D <&nfc_default>;
> +		pinctrl-names =3D "default";
> +	};
>  };

[ ... ]

> @@ -825,6 +838,22 @@ &tlmm {
>  			       <13 1>, /* NC */
>  			       <63 2>; /* WLAN UART */
> =20
> +	nfc_default: nfc-default-state {
> +		irq-pins {
> +			pins =3D "gpio31";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +
> +		pd-pins {
> +			pins =3D "gpio56";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-pull-up;
> +		};
> +	};

[Severity: Medium]
The nfc@27 node defines wake-gpios on gpio7, but is this pin missing from
the pinctrl configuration?

Without an explicit pinctrl configuration for gpio7 in nfc_default, the
wake pin might be left in its bootloader or SoC default state.

Should there be a third pin configuration block here setting the function,
drive strength, and bias for gpio7 to ensure the wake line operates correct=
ly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807021001.2393=
89-1-jorijnvdgraaf@catcrafts.net?part=3D6
