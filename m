Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68751FCDA
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068311; cv=none; b=XHLCedVomNx8hRKFXjive6ujizrnE9cjU7TT8eZpyrGE22Rm8Go6ebNSwhn/paDEOCHNL6yiUnADPf/aTsnhn2spDszaGZGZecyNY73ElsY4cSZagc5dI9pwuqVWsnjQUiX5BW/pWBJntXRwRitM7/R26oEHJFDdPI8UDMNdmzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068311; c=relaxed/simple;
	bh=kFSjQTN7e9mQ/iprL/j63ffU303qzce0+fjzIMoCTdw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RK1JL/zojJ2Nq/tAr62IfGDVA52LP3groCJ6Zr7bzuaoKPVy1No+pFAX6Z7lc9z5YUhds97Rgg6iEHhlxtaBDTUuKVmMWlNaDAhAfzbd1SrXqPMbFGNa30bR3/RKX7d9rZuxfqwNvAimE8xbdXNbGo8w+qWLimP2EyL4YkQIkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9atJ0lc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9atJ0lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FC51F000C4;
	Thu, 15 Oct 2026 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068310;
	bh=bmlOKhLUTHwVjSqec6tn23OBoXJFjuPaec5Of46uAr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9atJ0lcAc1n6d6MlKi0BoX7imgDn4oP+Im/205DBfnBvwllT9TajHsc+mCiVRnfs
	 Z3neM4+eJrKkI4FiGJAtugsZIHkAD8JxJe4zsAy5Bh1DvunoEZ//hurSqSVm3o5rml
	 hovjD9RUsFX7TMNRClCp1SaWrvmEmIOGLq+4wL4aheKO3Lx/IX4S1NS/4CEOQIM2om
	 MSdcy/6M34AF9GLgZVarv59jOhNrQDDWWsOAWT5h0u9A4t3vlldPyZIcz4ZUMClUbY
	 XoSaDJh1nCrxUMm0AbjWm17LtTjhu8ZqH3dnmdDj7ZVCB/tnyGGU+dp8MomHxHhNwJ
	 QBItz2VIaW2wg==
Message-ID: <sashiko-outbox-172857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:45:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: qcom: tlmm node name and input-enable schema violation
--

commit d33a306deafbc7e2920b017aacb1c37a8d11464b
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: oneplus-kebab: new device

This commit adds the initial device-tree for the OnePlus 8T.

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage=
-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm=
64/boot/dts/qcom/sm8250-oneplus-kebab.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts

[ ... ]

> +&tlmm {
> +	pm8008_default: pm8008-default-state {
> +		pins =3D "gpio93";
> +		function =3D "gpio";
> +		bias-pull-up;
> +		output-high;
> +		drive-strength =3D <2>;
> +	};
> +
> +	pm8008_interrupt: pm8008-interrupt {
> +		pins =3D "gpio112";
> +		function =3D "gpio";
> +		bias-disable;
> +		input-enable;
> +	};

[Severity: Low]
Does this pinctrl node name violate the dt-binding schema? The
qcom,sm8250-pinctrl.yaml schema enforces a regex that requires node
names to end with "-state" (or "-pins"). Using "pm8008-interrupt" might
cause a dt_binding_check failure since unevaluatedProperties is false.

Additionally, should "input-enable" be included here? The
qcom,tlmm-common.yaml schema explicitly forbids this property, so its
presence will likely cause schema validation to fail when running
make dtbs_check.

> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-kebab_dts-=
v2-0-e783463bffd3@fhannenheim.net?part=3D2
