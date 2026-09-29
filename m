Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993A340412
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671491; cv=none; b=g3mml8uhEoq/fdQQtVrmkX3uYxYh/mPTLfxCxdAKbNAVf4C4IEe7/YcmbruKp5tQlBiwABZ1NR/Arijua0TM8LUfpZq4IjL0sv6s5Jg70fusQcZAHfyuDFE9fqwS1G1AxkTVb8sCdrcpY9lKCBVAC8HSdXX6V1/bh4CI7DM3vLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671491; c=relaxed/simple;
	bh=ZsFRYiUIso1SjmwxFFCL8ptSuLO5UTI+uLX0g3yUHh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VE/huvcyyxkaTm7QAjeJmHiISdEIKX2GiG5WehsVbSCJLnN3a2gADeU5MYBE3IUUPluN2AWWs50e7ZNokj1jbYFBpV2yBpiFM4aq/Zuttdsnkix4JCKGYlkC0ZcXmcHeUnUPMotoMGQeY9ABGexYwtu+A1GzaAvLo+0k1rh/ytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZHMwlKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZHMwlKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877431F00899;
	Tue, 29 Sep 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671485;
	bh=5AIwSSIs2/AWAfCfCKU5NuGt4dJhBN6Jrf80amFW5VU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZHMwlKzfbkjaeCQtx8GnEG8WyQ+2KKO0Cf99cM8vSDEBm27zcLfyy1/AxhTI9Pw4
	 HEA0cQ3ZZHCLaMORe7tEBEVSoBGkzi4B20LIQIAPmyo74PIr7toovPHOQ/z0pvCmmy
	 uQ/P4a/9PpvvWdRjt38IKPfy4OwBBXdXNKY8SvDdhJtuEQmSttP2Eh7UOn+PshFzjB
	 74BoiVVEnh6UUwZ8b8BOP0XgKn5gwhz5wsaWI7NPuVIVJ1qs9SMrTR/nFQacn7iX5v
	 huTZQf/9FIKExxV0jLMW1LyIi2GKIcSa4bjE+ivW9kXT+h3Bh70bfaXAas0z8ct9OQ
	 6jAxMbR6VAjaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 08:44:45 +0000
Message-Id: <20260929084445.877431F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dts: incorrect hardware compatible string for GPIO expanders
- [Low] dts: devicetree schema violation for GPIO node names
- [Low] dts: unsorted i2c child nodes
--

commit 9c266369a865f519d07da1f291fbd2938e091d86
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra-evk: Add GPIO expanders

This commit adds the EVK GPIO expander definitions to the I2C3 bus for the
shikra-evk board. It describes the TCA9538 and TCA9539 expanders used by
the EVK boards.

Link: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498=
ea44@oss.qualcomm.com

> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index da484887110b0..ecc6301179400 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -11,6 +11,38 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/shikra/a704_zap.mbn";
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +
> +	expander0: pca953x@38 {

[Severity: Low]
Should the child nodes of the i2c3 bus be sorted by unit address in
ascending order? The node at unit address 38 currently precedes the nodes
at unit addresses 20 and 21.

[Severity: Low]
Should this node be named gpio@38 instead of pca953x@38? The generic node
name recommendation suggests using 'gpio', which helps avoid dt-schema
validation warnings during dtbs_check.

> +		compatible =3D "ti,tca9538";
> +		reg =3D <0x38>;

[Severity: Low]
Does the TCA9538 hardware actually support the 0x38 I2C address? The 0x38
address natively belongs to a TCA9554A or PCA9534A. While the gpio-pca953x
driver abstracts these expanders using identical logic, should the
devicetree accurately describe the physical hardware limitations?

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
> +	expander1: pca953x@3c {
> +		compatible =3D "ti,tca9538";
> +		reg =3D <0x3c>;

[Severity: Low]
Is this address physically possible for a TCA9538? Configuring an offset
of +4 requires an A2 address pin, which the TCA9538 physically lacks.

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
> +	expander2: pca953x@20 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x20>;

[Severity: Low]
Does this setup actually use a TCA9539, or might it be a TCA9535? The I2C
address 0x20 natively belongs to a TCA9535, so this compatible string claims
hardware at an address it cannot physically occupy.

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
> +	expander3: pca953x@21 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x21>;

[Severity: Low]
Similar to the node above, does this represent a TCA9535? Address 0x21
is the hardware address for a TCA9535, not a TCA9539.

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-shikra-gpi=
o-expander-v2-1-98ea5808c4a6@oss.qualcomm.com?part=3D1
