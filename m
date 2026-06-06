Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFE2356D9
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780781621; cv=none; b=F0kwY3iXiKdqm6/WB3iW0/cpiXW8r21+yi6J171DJtnjmZal8ecRBCYo0K3YkhQyhZ6l2MdGgxLL793glT07kTSBZtsHz8HGsk5ermNLCG2IkuSq+wzrQ8nHbIbnp0tabH/4BUqyWtkyS//crGr+cLbiTf/AlCnJx4CzBPKnl7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780781621; c=relaxed/simple;
	bh=lRO9c844CaMNlzNsRDCP0bApzHPwAT4CEGfwq0EQypk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwsEyyShL0a7h4uas+73EWMPfAsoP0ybgusoV4dpaUoLvmfXm+dFT97kaRiev3lEJ1W+a5xHgEm0bP8ruyI8dYIMsHs0WK5n3kdzwgrJJfI0R30Cj1GBhmoUzlJQFoE4ONeH24fZQTklRm47TDg1jILJPeXpuPc+Wq5wdOOvdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsNs128/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsNs128/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178C41F00893;
	Sat,  6 Jun 2026 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780781620;
	bh=xF3pOpioUMhvB6pF92Ncnh0XnX4GW+twhlRgUC7TnHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SsNs128/Jv4ozex6rFgMtrMoo//978gpCWeBKKsrkc3KED9wVh3SvErgY3trV7PZW
	 /SAJgFIxKoaajXlMv8TDVqHFTz5h63DSRx6IgJRp2eg642Zxq79NyMSYIdwubZ7ufW
	 OX8DcplhKZsailsh3IPXMBIIclUyYeSNOBZnOdvR1uhNNa80NR5YVO5xT3Sm7hmkOm
	 75Dlv+YVUaCUHdYdpLUjcYy0NgzB3JRky8WknL2qrNt7fXK39VKaj1OugoMysOMnwq
	 BwubCmE8uKfrOgfa597VWyTYg4rmjgVOPQInyyv8arxqlPYeBlazqw34R6SmIta3dD
	 Ow/2/oI+vKwtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 21:33:39 +0000
Message-Id: <20260606213340.178C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing pinctrl configuration for the ES8316 headphone jack detect=
 interrupt pin.
- [Medium] Hardware interface mismatch for the AudioReach SPDIF endpoint, m=
apping LPI I2S pins to the non-LPI Tertiary MI2S DAI.
- [Low] Mismatch in interrupt trigger type between the Device Tree and the =
ES8316 codec driver.
--

commit 078ec2554bd70bae155ad4d9140ebdc8a69a5dec
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
   =20
This commit adds audio support for the Thundercomm RubikPi3 board. It enabl=
es
AudioReach, the ES8316 headset codec, LT9611 HDMI codec, and SPDIF endpoint=
s.
It also describes the sound card DAI links and LPASS pin configurations.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/=
arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index f47efca42d48d..3249176b4c778 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
[ ... ]
> @@ -727,6 +755,23 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/qcs6490/a660_zap.mbn";
>  };
> =20
> +&i2c0 {
> +	status =3D "okay";
> +
> +	es8316: audio-codec@11 {
> +		compatible =3D "everest,es8316";
> +		reg =3D <0x11>;
> +		#sound-dai-cells =3D <0>;
> +
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>;
> +		clock-names =3D "mclk";
> +
> +		interrupts-extended =3D <&tlmm 63 IRQ_TYPE_EDGE_BOTH>;

[Severity: High]
Are we missing the pinctrl configuration for this interrupt pin?

The es8316 node declares an interrupt on tlmm GPIO 63, but there doesn't
appear to be a corresponding pinctrl-0 property to mux the pin and set its
bias (e.g., bias-disable or bias-pull-down).

Could this leave the interrupt line floating and trigger an interrupt storm?

[Severity: Low]
Is IRQ_TYPE_EDGE_BOTH correct for this codec?

The device tree configures the ES8316 interrupt as IRQ_TYPE_EDGE_BOTH,
but the driver explicitly requests IRQF_TRIGGER_HIGH when it calls
devm_request_threaded_irq().

While the kernel safely overrides the DT configuration with the driver's
request via __irq_set_trigger(), does the DT need an update to match the
actual hardware configuration applied?

> +
> +		everest,jack-detect-inverted;
> +	};
> +};
> +
[ ... ]
> @@ -1006,6 +1061,96 @@ &sdhc_2 {
>  	status =3D "okay";
>  };
> =20
> +&sound {
> +	compatible =3D "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model =3D "QCS6490-Thundercomm-RubikPi3";
[ ... ]
> +	tert-mi2s-playback-dai-link {
> +		link-name =3D "MI2S-LPAIF-RX-TERTIARY";
> +
> +		codec {
> +			sound-dai =3D <&spdif_tx>;
> +		};
> +
> +		cpu {
> +			sound-dai =3D <&q6apmbedai TERTIARY_MI2S_RX>;

[Severity: Medium]
Is this DAI link binding to the correct hardware interface?

The physical pins are configured for the LPI I2S1 interface earlier in
q6apmbedai:

&q6apmbedai {
        pinctrl-0 =3D <&mi2s0_data0>, ...
                    <&lpass_lpi_i2s1_clk>, <&lpass_lpi_i2s1_ws>,
                    <&lpass_lpi_i2s1_data0>, <&lpass_lpi_i2s1_data1>;
}

However, this DAI link binds the CPU DAI to TERTIARY_MI2S_RX, which
corresponds to the main LPAIF Tertiary MI2S hardware block rather than
the LPI I2S1 interface.

Will this cause the AudioReach DSP to route audio to the main LPAIF instead,
leaving the SPDIF pins on the 40-pin header silent?

> +		};
> +
> +		platform {
> +			sound-dai =3D <&q6apm>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-rubikpi-ne=
xt-20260605-v1-0-7f334e16fea6@thundersoft.com?part=3D5
