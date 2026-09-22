Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7FB382387
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042740; cv=none; b=YZXGnLt1ZATG9q1rmW2Gox93EBPdeoZIaP9R5n0NV9YFuPh8Hjc4Hb6zHIDeXcf+gsPuCNR4DcG2nncAn8oQ6YSA3tXlmM7iWmLX52aVa6xg2tiF1vHwTv8M1QRmZYZcybsaqTDhXyF6Jcg5qJ5cYHWnifPxDfulL2k9k0qAWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042740; c=relaxed/simple;
	bh=2py56lcbzdcI2AR5xj+pW5kkc58nQt/RG4dMVOnzZL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NB7Oq8mX8jX9fUeOF+fTqWlne9B9SpKBVe1fGMCALNMQ4yanHpn3A9Ze4dtz4TI5HmO4amKaZ4ZLt5qyTIOTBDNtWCf5gbtHAhGqaR3WsZ9uG0wSNRVGhtxMQ0GYp33uqJHAkyvbMLgLUgKYfvCyfccZzaoWEvYqtgj8aKX3oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6SzAcgu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6SzAcgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70EC1F000FF;
	Tue, 22 Sep 2026 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790042735;
	bh=n6mK8dHzc3yr2SqgjrwZyFcIjB9te0FhFTqlm/KahPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6SzAcguv1WbSnADZJoUP19w00N0fmTNsia9vP/QxEaFF2OFPfdOuNo/7sQSkQ/0O
	 vPwLSAxy4IZJjU1hevNaW8vX3+nFyNx8r7fifnFCLa3J9QIs+7+z1xtWsG5qSY3NdZ
	 R6c5X1+7XLfSR8NwFQPon/9Tc4WVsDhEAidze508bcbxQjFWtjWXeiyqGPT8LoFaug
	 M9BzvhQg6DXjhGEPvDDkjztEbR2GCgGgR5K/ya4ul3aMiVxGfdhnFsg4D/5+Lf+M+P
	 DBrEnOaGVyYm9vvDtBVoj7SaeLJtdQ9Nr90QK7uz8Hv6nariuI8Sxz0znnK9LmoaHh
	 Qg3uyElMvIKuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: qcom: pm660l: add analog audio codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922015801.32373-10-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 02:05:34 +0000
Message-Id: <20260922020534.A70EC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: qcom: board properties hardcoded in generic pm660l.dtsi
- [Low] dts: qcom: pm660l: sound-name-prefix violates binding schema
--

commit 331a31ea9c73f1abc1441342a8c3c461afc91cb0
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: pm660l: add analog audio codec

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/q=
com/pm660l.dtsi
> index 3f8b9eafe1641..5b406b83043c2 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
[ ... ]
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pm660l_codec: audio-codec@f000 {
> +			compatible =3D "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg =3D <0xf000>;
[ ... ]
> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

[Severity: Low]
Are these properties appropriate for a generic PMIC device tree include?

These properties describe external, board-specific physical hardware rather
than internal states of the PM660L PMIC. Including them in the shared .dtsi
applies these board specifics to all devices using this PMIC, which forces
boards with different headphone jack types or micbias wiring to use the Dev=
ice
Tree /delete-property/ anti-pattern to unset them.

> +			sound-name-prefix =3D "Analog";

[Severity: Low]
Does this property violate the binding schema?

The device tree schema for qcom,pm8916-wcd-analog-codec.yaml has
additionalProperties: false, but it does not define sound-name-prefix
nor does it import a common schema (e.g. dai-common.yaml) that would permit
it. This will likely trigger a dtbs_check schema validation error.

> +			#sound-dai-cells =3D <1>;
> +			status =3D "disabled";
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922015801.3237=
3-1-mailingradian@gmail.com?part=3D9
