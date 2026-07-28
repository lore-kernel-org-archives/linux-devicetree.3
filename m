Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276540F8D0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229814; cv=none; b=e/WV579Vc6j3rwrH7gy6AWvZjqvlrdoaPXUzcQVKlo87exYPwMxr5zTLy3M0RwWgHHK1PLi6HbzUuQkul8ordXJL/enHl5oa8THgfQfUe6576gM534GgotFVYQ6kqEF0PEK3y8ptBWXqC2QE1aaJLwX+juGeyq9VmFLqMKJ/MoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229814; c=relaxed/simple;
	bh=+2XvbNdVHY1cCpzyYNDeoNAvF2SCQckOVnPPf+RPfD0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sZBjy108ZhbgHqOLYNqYIC5lDu5XmkcTTd67TrtpkbzVGeDb5ITncB5ynKS03IyrvirHXaLNizZ/Vy51qSWBL2cMlVtuuZqtO4F77h/5eQ/Rsy7ZsXS7x+cvLgzpmrkNZB7ynZdsPZyrUDzaFtRbi8+8c545x6YHADM7aNViqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhXKs408; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhXKs408"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419DA1F000E9;
	Tue, 28 Jul 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785229812;
	bh=GXqVPt1Jz4oeRQ1XX6kj/jFvLj8In13Xpe4b7vSoiIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VhXKs408M3oxVyRzvTCNtorVEm4kbP7eNe0ANNN/BGpcj1C+T5KkDe4PSnaQBfLfk
	 MhVJAYi27yXzZ3nQHmUW3FPrnKb0Ykmgb/GvG5eId62T7BTw8D5Ag6HK3VGdGZOQ1U
	 CPAhoO37OCRnLjlSULXRTchYnozLJLdiMomrAkxIAZY+rSdgWCg0ZzrvjdT71XAK1E
	 jJhCRXfdoeUBWeMXpuJbzGG2BEvxf+0LHbffZLvODelBaR9eWaQ5BpMsKXauTSVNJP
	 7A0WKilTweR9PRR9rwhZWiPoE77gTJMwm2rWoCh3ZdrEtww8dmanLcHeDrbu4DIrw3
	 K/n7TLBFKyTdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-2-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
 <20260728-topic-sm8x50-next-hdk-i2s-v1-2-2393a0fe4aa9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:10:11 +0000
Message-Id: <20260728091012.419DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Device Tree Misconfiguration - Pinctrl for SoC I2S interface is =
incorrectly assigned to the external HDMI bridge node.
- [Low] DT Schema Violation - Invalid clock-names order for dai@16.
--

--- Patch [2]: [PATCH 2/4] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDM=
I ---
commit bf4f513e744f0c756ca7054358cd98929fb84150
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI

This commit adds the necessary device tree nodes and configurations to enab=
le
the I2S interface for HDMI audio output on the SM8450-HDK board. It configu=
res
the pinctrl for I2S, sets up the q6apmbedai DAI, and adds the primary MI2S =
DAI
link.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8450-hdk.dts
> index b37998cd9a2c3..6a6d8346046bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
>  		vcc-supply =3D <&lt9611_3v3>;
> =20
>  		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&lt9611_irq_pin &lt9611_rst_pin>;
> +		pinctrl-0 =3D <&lt9611_irq_pin>,
> +			    <&lt9611_rst_pin>,
> +			    <&i2s0_default_state>,
> +			    <&audio_mclk0_default_state>;

[Severity: Medium]
Should the SoC I2S and MCLK pin states be assigned to the sound node or CPU
DAI instead of the external HDMI bridge node?

By assigning these to the lt9611_codec node, the SoC's audio pin multiplexi=
ng
is tied to the lifecycle of the external display bridge. If the HDMI bridge
driver defers or unloads, the SoC I2S pins will revert to their unconfigured
state, which breaks the hardware description paradigm and might cause runti=
me
audio issues.

> +
> +		#sound-dai-cells =3D <1>;
> =20
>  		ports {
>  			#address-cells =3D <1>;

[ ... ]

> @@ -947,6 +952,19 @@ channel@44b {
>  	};
>  };
> =20
> +&q6apmbedai {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	dai@16 {
> +		reg =3D <PRIMARY_MI2S_RX>;
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "mclk",
> +			      "bclk";

[Severity: Low]
Is this clock-names order correct according to the schema?

The qcom,q6apm-lpass-dais.yaml schema requires that if two clocks are
provided, they must be ordered such that index 1 is mclk. Here, bclk is at
index 1, which will cause make dtbs_check validation to fail.

> +	};
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm8x=
50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org?part=3D2
