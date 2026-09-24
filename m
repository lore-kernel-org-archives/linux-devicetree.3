Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDC486B95
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256549; cv=none; b=HUjqYBmzvo4uBkyYP6sZ2vys6sLN6rFxlAram31T9iHCjDDcYAAvtvH/8sWWpdaCbuzVQX41oWbujni50liDSvwxfVaMk1Y/I+W1o+L9rLJTCcMcpr+u2kKSTXBtmoary2Bh4SXPNt4/vkUc1hJY9CiXC3bgDwALs/2fZl6OwWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256549; c=relaxed/simple;
	bh=1J2VXxz6b3DXw5xWRhx6j+iu16HMLSPEGu66iYTyJxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ihCPtHeYPHW7jnbeu3Dw7lo7jYAHR4MPf0lkQRYcCWlAG1VDXTlt1XrvtAOfISjwE7q476+aHunNF5cbGYlcFTQK23T2wYuXC9EgJnzwKRhASvW3Ot2wCUkFPTQxemW8le5koBJzIhs4fS0XuolzKmWM+zrWSIX2I2ysBSNcJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAP0f1fl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAP0f1fl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79681F000FF;
	Thu, 24 Sep 2026 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256539;
	bh=fIRN2Yw18sqjz9m5SQ2P2fHeo7IgzTB72dnByHEkR3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SAP0f1flKDERJwK64o6v5noo/l0IoZBDwpfeOAbuVF+Jlma43vaEDPa/hcWGdW0jX
	 RxUy4orPsyCSu3hj9uq7dhZGR8e6zKXm8QMFL0xkULq/Coh8uckebQDPWvkBqQ746L
	 t7e8Z4MaeqDZAC6uoiulY0R3fXEtnMRpr84BAt2c2poo0FBQqI06MxyjUWdD0UbYo5
	 5vfoWDHtjoeLtQzzqTP+aB7ewjQyhbzbREWlX290oC2k91zbmE9ts0yuvUw+W3Ppaa
	 RheJ+uq6v29BDtkLNd2njORylq3+nSyMK2lzcwUpTOVoEijiSzTuAJ21hzIzQmjvMv
	 DVmNL/RhgddLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dts: apple: t8132: Fix ordering-related
 dt-check-style issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yureka Lilian" <yureka@cyberchaos.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-2-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
 <20260924-apple-dts-m4-dt-style-check-v1-2-3ec651d75baf@cyberchaos.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:28:58 +0000
Message-Id: <20260924132858.D79681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect property sorting separates #address-cells and #size-=
cells
--

commit 9b49add5f860afd912c50de5f1749b0ac03afeeb
Author: Yureka Lilian <yureka@cyberchaos.dev>

dts: apple: t8132: Fix ordering-related dt-check-style issues

This commit fixes dt-check-style issues related to node and property
ordering in the t8132 device tree files. It also groups cache-related
properties for better readability.

> diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/a=
pple/t8132.dtsi
> index 1ea488ce6e1c1..350ad7b3772b8 100644
> --- a/arch/arm64/boot/dts/apple/t8132.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8132.dtsi
[ ... ]
>  	soc: soc {
>  		compatible =3D "simple-bus";
> -		#address-cells =3D <2>;
> -		#size-cells =3D <2>;
> =20
>  		ranges;
> +		#address-cells =3D <2>;
>  		nonposted-mmio;
> +		#size-cells =3D <2>;

[Severity: Low]
In the soc node, does this alphabetical sorting inadvertently split tightly
coupled properties? The nonposted-mmio property now sits between #address-c=
ells
and #size-cells, separating the pair which were kept together in the base
commit.

[ ... ]
> @@ -365,14 +379,15 @@ i2c4_pins: i2c4-pins {
>  		i2c0: i2c@3ad010000 {
>  			compatible =3D "apple,t8132-i2c", "apple,t8103-i2c";
>  			reg =3D <0x3 0xad010000 0x0 0x4000>;
> +
> +			#address-cells =3D <0x1>;
>  			clocks =3D <&clkref>;
>  			interrupt-parent =3D <&aic>;
>  			interrupts =3D <AIC_IRQ 1062 IRQ_TYPE_LEVEL_HIGH>;
>  			pinctrl-0 =3D <&i2c0_pins>;
>  			pinctrl-names =3D "default";
> -			#address-cells =3D <0x1>;
> -			#size-cells =3D <0x0>;
>  			power-domains =3D <&ps_i2c0>;
> +			#size-cells =3D <0x0>;

[Severity: Low]
Similar to the soc node, does alphabetical sorting in the i2c0 node scatter
these interdependent properties? Here #size-cells is pushed to the bottom of
the property block while #address-cells is moved to the top.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-apple-dts-=
m4-dt-style-check-v1-1-3ec651d75baf@cyberchaos.dev?part=3D2
