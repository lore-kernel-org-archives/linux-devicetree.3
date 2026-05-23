Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4B23FC41
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779535504; cv=none; b=RF7s1Pwbz4hg2nvs+hHGc/xR0bySLL2b/EkdGuqjpL1r+SuaW1QykcBxATPjvc5zuw4QYuKMHROVEmSkqHMUo3AEWsholIZggNLZ/9upBGVqcUlvq413sSVI0+9OHI3Sx3yOOJm+j1Xo/iLLzGzLvn0OvF/cW2viNJdkLybtg8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779535504; c=relaxed/simple;
	bh=hwqZ1g/0v+AoZa3nBtQm1kDiJoWBAlcUs72xfuUJoz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oGXUjzHODG5dc5tFT9dVMBZltqng0UiUj97T7nbXFJngrH1UOWyfOVTXQPrEnutiUVZGvs8ENHLF4lZkl5xMXFTYbU7z54iROpv3AqbTKhu1s1lm3FLp4hyVJbTDKflclHU7MR92rImlT+WjKuJlyhj6QSa5iTX+AzSa4gDH8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7zuKBzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7zuKBzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C7D1F000E9;
	Sat, 23 May 2026 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779535503;
	bh=Smk951sGRnnev2XeGwit69Ee0DjVrfdAgfDXwwb39hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7zuKBzVvElBS/EeYT1+4BfAxE9MQmQp41t8ADVYDdpqAkMy/k2U1owaj3AOXeS9v
	 BLGGbFL/f5RD6odBBow0dbMZLwJS9L6VMAHQhmqINjtwIVpJQLR/f9GLAouJh8Mstc
	 bAz6AB5uje3yLEIUE0EzPOqdomQuOLj759Yi41iJrR7gjZAIgPPHJcAYGmJC0+O3PA
	 Xia4sD6uBZBOxrSGGQMqfxa9Oi6IZv/AABE8zROVNUjrna/LtKluBiR6a4c7TVTROK
	 MaHANmmWVYnQVwTAGpjpNBcmCtediVV8kKj9UuHWz775Xk23xvq2amLJcXMWn4kBA4
	 p2ZPVGSy6cbyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 3/3] arm64: dts: qcom: glymur-crd: add Audio sound
 card node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 11:25:02 +0000
Message-Id: <20260523112502.B8C7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The WSA8845 speaker nodes incorrectly use the `reset-gpios` proper=
ty and directly share GPIO lines, which will result in ignored resets and p=
robe failures.
- [High] The `&lpass_vamacro` node is missing the `vdd-micb-supply` propert=
y, which is required by the defined audio routing and will cause DMIC recor=
ding to fail silently.
--

commit 2f0fde1acdca88bc05fbbb5ed700dfb37ffa6d5c
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: add Audio sound card node

Add the sound card of Glymur-crd board with the routing for speakers,
including playback via WSA884x smart speakers and recording via DMIC
microphones.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index e784b538f42e1..6c272fb6081a8 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi

[ ... ]

> @@ -444,6 +492,12 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
> =20
> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};

[Severity: High]
The audio routing explicitly maps the Digital Microphones to the vdd-micb
widget, but is this lpass_vamacro node missing the vdd-micb-supply property?

The lpass-va-macro driver uses DAPM to manage the power state for this widg=
et.
Without the vdd-micb-supply property here, the regulator framework will sil=
ently
substitute a dummy regulator.

This will cause DAPM to report success while the hardware won't receive the
required microphone bias voltage, resulting in silent audio recordings on t=
he
DMIC capture path.

[ ... ]

> +&swr0 {
> +	status =3D "okay";
> +
> +	/* WSA8845, Left Woofer */
> +	left_woofer: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;

[Severity: High]
Is reset-gpios the correct property name for this codec?

The wsa884x codec driver expects either a reset controller via the resets
property or powerdown-gpios. Using reset-gpios will result in the driver
finding neither, leaving the speakers in hardware reset and failing to
enumerate on the SoundWire bus.

Additionally, if this were renamed to powerdown-gpios, would the shared GPIO
line cause a probe failure?=20

The left_tweeter node below also uses GPIO 12, which would cause the second
speaker's probe to fail with -EBUSY because devm_gpiod_get_optional requests
exclusive access.

Should this use a gpio-reset controller defined and referenced via the rese=
ts
property instead to properly share the line?

> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "WooferLeft";
> +		vdd-1p8-supply =3D <&vreg_l15b_e0_1p8>;
> +		vdd-io-supply =3D <&vreg_l18b_e0_1p2>;
> +		qcom,port-mapping =3D <1 2 3 7 12 14>;
> +	};
> +
> +	/* WSA8845, Left Tweeter */
> +	left_tweeter: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523085511.2532=
669-1-sibi.sankar@oss.qualcomm.com?part=3D3
