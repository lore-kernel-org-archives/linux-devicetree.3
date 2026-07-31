Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1843C1D78
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486131; cv=none; b=ki7YB+d7X7f/Rf6SvqZ9Mu8vyA7yzskdOOZVDv3/e1KyDMvs622COoj9L9eMks8pI7gqB+22hl4JDw3scWNU5SxS3WmnMPo3VLcockRCODsyZamxOg80TT+kyR0e4CMVOmHU59VcK6lRSjlcb3PbKuJh9ICZq4i+/ddslkG+ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486131; c=relaxed/simple;
	bh=gQIp3JmBEkZ0mVKuv2eCIGN6ZujtaKN/BdrCg+YisF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZgVhQbY0UjKqgOpa7soT/leop86xJrh4zHCJtPEVW2mu9/XvHgaQOSoatPw08vanbwFqMaM73QwU4F4aoaOfFnnpezN95P/tU4xq6Hjww3wKPBJu3DTRtu7dtwMEfJhSWsJWBQvtQTGY3C6fz8aEziB06Hbazh8sko9ABgAsrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTidiKFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTidiKFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BBD1F000E9;
	Fri, 31 Jul 2026 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486128;
	bh=WrnMGKH7YMIfqX8x87boXBY8rNqFtVOVomNATBgIt4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nTidiKFUZW76HPkHIyG9rCBDGNjZzU2fzgGVcmw9Mrls6njTszwZUbnBBeQBm4Dph
	 fuitGg8UZlqZWYSP0oCbKjEDeAjM4bk1r/pX+APrxO/rd0d2ZwhdgglwDjJUC4fTNA
	 YYXx2f+AzD2lXbPn01FEkgSHdjZmJKI6apxI3JddF/whzDHZpuTWjC/ZiyG7lgALAJ
	 KPOUbZe5Wkbbj18Fn4ppdzGi1Rx44+lDj/jzywMT5W9/Is/5a2NUWhn/yk+F6poCjn
	 pN6hR84Z57dAV0oUCLyehaWMoqQzR6Y1KaU/m/h8scjDdCLCKBEzPszFGGPK5PN6lT
	 0dQJtl99yJmZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-topic-sm8x50-next-hdk-i2s-v2-3-42c1acee5a2d@linaro.org>
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
 <20260731-topic-sm8x50-next-hdk-i2s-v2-3-42c1acee5a2d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:22:07 +0000
Message-Id: <20260731082207.A3BBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The SoC's native I2S and MCLK pinctrl configurations (`i2s0_defa=
ult_state`, `audio_mclk0_default_state`) are incorrectly placed in the `pin=
ctrl-0` property of the external `lt9611_codec` I2C bridge node, instead of=
 being managed by the sound card or CPU DAI.
- [Low] The `dai@16` node uses an incorrect hexadecimal unit address of `16=
` (22 in decimal), which does not match the decimal value of its `reg` prop=
erty `PRIMARY_MI2S_RX` (16, which is 0x10). The node should be named `dai@1=
0`.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for =
HDMI ---
commit b95de62e9eeaef3502a18beec3e036edf4b8259f
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..b62d387b9afa3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts

[ ... ]

> @@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
>  		vdd-supply =3D <&lt9611_1v2>;
>  		vcc-supply =3D <&lt9611_3v3>;
> =20
> -		pinctrl-0 =3D <&lt9611_irq_pin>, <&lt9611_rst_pin>;
> +		pinctrl-0 =3D <&lt9611_irq_pin>,
> +			    <&lt9611_rst_pin>,
> +			    <&i2s0_default_state>,
> +			    <&audio_mclk0_default_state>;

[Severity: Medium]
Does this place the SoC's native I2S and MCLK pinctrl configurations in the
external I2C bridge node?

By placing the SoC I2S pin states in the default property of the external I=
2C
codec node, the pins might be unconditionally driven from the moment the I2C
bridge driver probes. This could prevent the ALSA/DAPM subsystem from toggl=
ing
the pins based on active audio streams.

Should these be managed by the sound card or CPU DAI instead?

>  		pinctrl-names =3D "default";
> =20
>  		ports {

[ ... ]

> @@ -1072,6 +1092,19 @@ &pon_resin {
>  	status =3D "okay";
>  };
> =20
> +&q6apmbedai {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	dai@16 {

[Severity: Low]
Does this trigger a unit_address_vs_reg Device Tree Compiler warning?

Since PRIMARY_MI2S_RX is 16 in decimal (0x10), should the node be named
dai@10 to match the hex-formatted first address of the reg property?

> +		reg =3D <PRIMARY_MI2S_RX>;
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "bclk",
> +			      "mclk";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-topic-sm8x=
50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org?part=3D3
