Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD220E334
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930483; cv=none; b=PXF34mnt0nt4GXboD4xDv/tFv0nu5VB44QfAJzVYON6AaSsBjr/d9qLtk5uznj9XjhhYXWCvuxg82NAyDZjyob7aHFsIc9Fl5j0AvaSbwAS6GlZlCcmG+wb0sBbJMvulugJtIJ2FOutVibVKBBHkxC+QBhZOmPFf5GL+/CVG42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930483; c=relaxed/simple;
	bh=CyVz4jCh1pH6z3BK/XK0LUvJzxaruyLegyL4HMwlnIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RspYE8Y6+rhKOWOM3w9Pa2rNNqmDf4vjArUgBYVFLhkamj/v8v/H40Nux0d1Z9APlIeqmzuHbxtNvhLc1mEKozySiZiv/QG0voYfi5aJkR2Q9KYrCI/QFSsZ8nOWRIk+RW8PxUzNd3iGnBdwTw7IKzB7D4h8FeEePX3OERHTvDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFDI6RNB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFDI6RNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6351F000FF;
	Sun, 20 Sep 2026 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930481;
	bh=lIeSUYeTGPUWbcHvKpQiWQw+cVCOURRow2X5XaIf64I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kFDI6RNBjEFyepa1AzsNd1wyqwywearHfPTXD9KFlUifP8qmIEpWUl4WC271Gnl+E
	 P4AcWIfikRUXeYALXC7H/OnKgrjkShi/AYVoVE0jDhL/KQ4V1CyIB6TNYAm7beDWTb
	 YG9Dh8f8W91ewCL7gdNu0wFvb8XxAA3/EnJ4uyq/CRFNrKScLCheDYCSUeUtI5b1eJ
	 gE/W9YeOIJMVuVQ6c0BfH0/eext93IWUzXgUQ2bD5yfm/gpZfEUDDiFmFM1mJL+1yx
	 dsZdyxnwSAWeDIRFmu5oo/ib1WK+69EUB/ytkE4cIhc6hrNEhybYOT4ZoOKy5MIA+K
	 68oYACZCCnm6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxim Storetvedt" <mstoretv@cern.ch>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920184148.31541-4-mstoretv@cern.ch>
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 18:54:40 +0000
Message-Id: <20260920185441.5D6351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt-bindings: touchscreen@5d node missing interrupts property
- [Medium] sound: incorrect audio routing for right speakers to same macro =
output
- [Low] dt-bindings: invalid enable-active-low property in regulator-fixed =
node
- [Low] dt-bindings: pmic-glink missing qcom,sm8550-pmic-glink fallback str=
ing
--

commit 2d1c565b5f3cc1fc06395b66ffcf702541cf9a0d
Author: Maxim Storetvedt <mstoretv@cern.ch>

arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees
   =20
This commit adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the
Samsung Galaxy Book4 Edge. It uses a common dtsi derived from nodes that
were able to work on Linux.

Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcud=
i4j2wogtr@4yecb2bkeyms/
Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/

> diff --git a/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi b=
/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
> new file mode 100644
> index 0000000000000..51ec68bbab141
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,x1e80100-pmic-glink",
> +			     "qcom,pmic-glink";

[Severity: Low]
Does this violate the pmic-glink devicetree schema? The schema requires that
"qcom,x1e80100-pmic-glink" must be followed by the "qcom,sm8550-pmic-glink"
fallback string.

Omitting the intermediate fallback will trigger dtbs_check warnings, even
though the driver matches "qcom,x1e80100-pmic-glink" directly.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-GalaxyBook4Edge";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",

[Severity: Medium]
Is the right-side audio routing mapped correctly here? Both "WooferRight IN"
and "TweeterRight IN" are mapped to the same "WSA2 WSA_SPK2 OUT" macro
channel.

It appears "WooferRight IN" should map to "WSA2 WSA_SPK1 OUT" to maintain
discrete stereo/crossover separation for the right side, instead of routing
both to the same output channel.

[ ... ]

> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VREG_EDP_3P3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 70 GPIO_ACTIVE_LOW>;
> +		enable-active-low;

[Severity: Low]
Is it correct to include the enable-active-low property here?

The regulator-fixed bindings do not support this property (only
enable-active-high is valid). Active-low polarity is already correctly and
implicitly defined by the GPIO_ACTIVE_LOW flag in the gpio specifier. Leavi=
ng
this in will trigger a dtbs_check schema validation error.

[ ... ]

> +&i2c8 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchscreen@5d {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x5d>;
> +
> +		hid-descr-addr =3D <0x1>;
> +		//interrupts-extended =3D <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply =3D <&vreg_misc_3p3>;
> +
> +		//pinctrl-0 =3D <&ts0_default>;
> +		//pinctrl-names =3D "default";
> +	};
> +};

[Severity: Medium]
Will this node fail to probe? The hid-over-i2c binding requires the
interrupts or interrupts-extended property.

Since interrupts-extended is commented out but the node remains active (no
status =3D "disabled"), the i2c-hid driver will unconditionally fail to pro=
be
without an IRQ. This leaves the touchscreen non-functional and the devicetr=
ee
schema invalid. Should this node either be properly configured or marked
disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920184148.3154=
1-1-mstoretv@cern.ch?part=3D3
