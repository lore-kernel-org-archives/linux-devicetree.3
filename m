Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E0233924
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600970; cv=none; b=uFhd6udD4WqGaYpkbtUrlFVNVOptBoUC34yhXh+bxgFeP4oKXFiUYu5lVplfs+Om1bWcfwbx9QhxoKbB5FrMYeinO+v2wvgMwWCC1J6j7wxkV6LKhIJU6/HubFHKWooo/DVtB923pjTnQAFOjY5PxqSKycnyhI0y9XsD85v5dJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600970; c=relaxed/simple;
	bh=NXhel2UqH3FfM6IWtuPkKIxSixjXpHt63O3FvqS3onM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZCBRruyo7abK7QW5jpNWv3j7qMy24uWZM11mNnzZT/qRh4bxsgppeqPqhTiAMYtfIK8cPi1LrZ63nRLvXhVfjYz57mDj0uJWbSjvldBeJ7fdm0aG9BVcyFC+aJwE0FB9pruGkfyfmF9atVhLevUK4v5fwnCjLbVYvukTFGrpbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCmJPA3S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCmJPA3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBF51F00A3D;
	Sat,  5 Sep 2026 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788600968;
	bh=xsTO61X40BL6yaPUoDN2Cc2gMpcQ3PceDeAcLojP8ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RCmJPA3S3+yTYrWTbFrYqgYxk6GbaAI3W6phoMqSO/t4vE7Tv/Bl3gAx8f6aJeMpL
	 8g2T2BGlcYVB9DbXV/Y3uR7/qdpWoDCIX3QIxhZD0aXtZJPetzhetBHpJq0lCam3fy
	 yprufWTneG4XYFnc6dbzkQF0kQvlCaIqFev0M+39jwj6vQwmYYKE/TI45AG1JQdujz
	 011nTZgToV5htiVt3zYRHr1YtORntGz6OSDK1TpEy5BQfZrFXCHlOEEn+wfSELJA9R
	 oRS8Fqt1bGpcUnxazous3WbwHjVEn3eH6GDn6MefmUd3lXo8RvhXXlcCWr60LvxuHX
	 uL4P58URyfkag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: ideacentre-mini: Fix the second
 M.2 3V3 rail
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 09:36:07 +0000
Message-Id: <20260905093608.2DBF51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Encoding a consumer (M.2 NVMe) power-up delay into the provider =
(regulator) DT node as 'startup-delay-us' violates Device Tree design princ=
iples.
--

commit 74fe38037d977753f0083d520b231c28126f164d
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: ideacentre-mini: Fix the second M.2 3V3 rail

This commit switches the vreg_nvme2_3p3 regulator to the PMIC GPIO and adds=
 a
2-second startup delay along with an always-on property to work around M.2
probing failures.

> diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.d=
tsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
> --- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
[ ... ]
> @@ -173,13 +174,16 @@ vreg_nvme2_3p3: regulator-nvme2-3p3 {
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
> =20
> -		gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		gpio =3D <&pmc8380_3_gpios 5 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> =20
> -		pinctrl-0 =3D <&nvme_reg_en>;
> +		pinctrl-0 =3D <&nvme2_reg_en>;
>  		pinctrl-names =3D "default";
> =20
> +		startup-delay-us =3D <2000000>;

[Severity: Medium]
Does adding startup-delay-us to the regulator node violate Device Tree desi=
gn
principles by encoding a software workaround for the consumer's (M.2 NVMe)
initialization time?

Device Tree serves as a hardware description and stable ABI. Encoding a
2,000,000 us (2 seconds) delay here describes the consumer's initialization
time, rather than the physical stabilization time of the regulator hardware.

Once a proper M.2 PCIe power sequencer driver is introduced, will this node
continue to force the regulator framework to needlessly block for 2 seconds
whenever the regulator is enabled?

> +
>  		regulator-boot-on;
> +		regulator-always-on;
>  	};
> =20
>  	vreg_v0p9: regulator-v0p9 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-x1-ideacen=
tre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz?part=3D5
