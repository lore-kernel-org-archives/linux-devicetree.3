Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306403CA49D
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304155; cv=none; b=tx56qNnDtjppdH5HXsXWeZKvNZs9AXi5GqULKNBUhIQcil0UzI4XSGVxXnhhJSFDu97GGlBpuofsqxZOR8Z4iQxRoDX97E1isB+8gB3XTIkkGD7Z/s2PF4We18JhvmQ2fIq9sIzhUfkkVhyViV3f0u1h4LQYS2/qrCsfxWA/igw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304155; c=relaxed/simple;
	bh=wkRLCF16/K99dGcxif3bLF2NmMhzv5EL0cdTHlxzkCI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=stfyJaZ5wLLESK6KdItRVPJnf92QqXUPRmAT23ct1HvrToPsGy/R+HjklO6qv3CES7gHG8LG/IydPMoG2NUxxIqcCDcvcQ9PDX4U3pTR7LbGZZK7LDyA8vaHJbbPU6PXeiwj+eek1eF7lvU84/PgXT6aruYQtaNEm9RK9cz5JB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX4rhhtk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX4rhhtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCE11F000C4;
	Sun, 18 Oct 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304151;
	bh=3EsmPyUBeKJokR/qycScvvpF/b6L6clNaSaCclu7STg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kX4rhhtkLKFi1QjwWhfvy8C5Uo1zQlaVc2BWMCxVTTPt56quZDrnEVr0ZzFj3QVxE
	 Nig1yYfoG0yDHkzJ3+T7fBAo5qR3fjPjQlA4Yb1q1Y33Jk9+wndIcnZJLl7sEaC+Zd
	 Bp7P9P+7eq8iTupVGkNB+pxRYDrr5duDUIe3sLpjp56Ax7bMTGNr2t2SI645nJ/NsV
	 sKSXjeIQGG2eVXBF0rIPy+AJB3aw9dsVf9pFsFwlOgMgDGVJnqWIob/5R7Dh6+k3rb
	 I9CGHu3tO27eksJXJG2JQgbz1XgUBZdNZqwKqRjzq17g5/kjunCH9u+DP4i3nUZ5eo
	 9zzltIBToiWRw==
Message-ID: <sashiko-outbox-175982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-11-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-11-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:15:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ASoC: apple: macaudio: macaudio_be_assign_tdm() skips idle_mode =
for 1-codec BE
- [Medium] arm64: dts: apple: t8103-j313: jack_codec supplies merge into on=
e /regulator
- [Medium] ASoC: apple: macaudio: unreleased OF node refs in macaudio_parse=
_of()
--

commit 802339e5380e3a87c88c58c583fe94106f5d49a8
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes

This commit adds the TI TAS5770L speaker amplifier nodes and Cirrus CS42L83
headset jack codec node to the M1 MacBook Air (J313) device tree and wires
them to the macaudio machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/d=
ts/apple/t8103-j313.dts
> index f8b2b1637b9dc..ed0eb358809b4 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -55,4 +55,91 @@ &typec1 {

[ ... ]

> +	jack_codec: codec@48 {
> +		compatible =3D "cirrus,cs42l83";
> +		reg =3D <0x48>;
> +		interrupts-extended =3D <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Jack";
> +		cirrus,ts-inv =3D <1>;
> +		VA-supply =3D <&jack_va_reg>;
> +		VP-supply =3D <&jack_vp_reg>;
> +		VCP-supply =3D <&jack_vcp_reg>;
> +		VD_FILT-supply =3D <&jack_vd_reg>;
> +		VL-supply =3D <&jack_vl_reg>;
> +	};
> +};

[Severity: Medium]
Do these five supply phandles on jack_codec resolve to five distinct
regulators in the compiled DTB?

In arch/arm64/boot/dts/apple/t8103-jxxx.dtsi (included by t8103-j313.dts),
all five fixed regulators are defined as direct children of / with the
identical node name regulator:

arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:
	jack_va_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-va";
	};

	/* CS42L83 VCP and VCP_FILT */
	jack_vcp_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vcp";
	};

	jack_vl_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vl";
	};

	/* VD_FILT */
	jack_vd_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vd";
	};

	jack_vp_reg: regulator {
		compatible =3D "regulator-fixed";
		regulator-name =3D "jack-vp";
	};

Because they share the same /regulator path, dtc merges all five definitions
into a single node, overwriting regulator-name to "jack-vp" and attaching
all five labels to that single node, so VA-supply, VP-supply, VCP-supply,
VD_FILT-supply, and VL-supply all point to the same regulator instance.

> +
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j313-macaudio";
> +		model =3D "MacBook Air J313";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		dai-link@0 {
> +			reg =3D <0>;
> +
> +			dai-tdm-idle-mode-0 =3D "zero";
> +			dai-tdm-idle-mode-1 =3D "zero";
> +
> +			link-name =3D "Speakers";
> +
> +			codec {
> +				sound-dai =3D <&speaker_left>, <&speaker_right>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 0>, <&mca 1>;
> +			};
> +		};

[Severity: Medium]
Will dai-tdm-idle-mode-0 and dai-tdm-idle-mode-1 actually be applied to
speaker_left and speaker_right here?

In dai-link@0, there are 2 codecs (<&speaker_left>, <&speaker_right>) and
2 CPU DAIs (<&mca 0>, <&mca 1>). When macaudio_snd_platform_probe() ->
macaudio_parse_of() parses this node in sound/soc/apple/macaudio.c,
ncodecs_per_cpu is num_codecs / num_bes =3D 2 / 2 =3D 1. Two backend DAI li=
nks
are created with num_codecs =3D 1, and macaudio_get_codec_idle_props() stor=
es
dai-tdm-idle-mode-0 and dai-tdm-idle-mode-1 into each backend link's
link_props->codecs[0].idle_mode.

However, when macaudio_be_init() -> macaudio_be_assign_tdm() runs, it takes
the single-codec early return without configuring idle_mode:

sound/soc/apple/macaudio.c:macaudio_be_assign_tdm() {
	...
	if (rtd->dai_link->num_codecs =3D=3D 1) {
		ret =3D snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), mask,
					       0, nslots, MACAUDIO_SLOTWIDTH);

		/*
		 * Headphones get a pass on -ENOTSUPP (see the comment
		 * around bclk_ratio value for primary FE).
		 */
		if (ret =3D=3D -ENOTSUPP && props->is_headphones)
			return 0;

		return ret;
	}
	...
}

Because macaudio_be_assign_tdm() returns before calling
snd_soc_dai_set_tdm_idle(), tas2770_set_dai_tdm_idle() is never called for
either speaker amplifier on J313, leaving the SDOUT TDM idle slots
unconfigured while both codecs share the IV-sense capture TDM bus.

[Severity: Medium]
Also, can binding apple,j313-macaudio with this multi-BE dai-link@0 leak
device_node references in macaudio_parse_of() when probing defers or fails,
or on driver unbind?

First, in macaudio_parse_of_component(), of_parse_phandle_with_args()
acquires a reference on args.np and assigns it to comp->of_node before
calling snd_soc_get_dai_name():

sound/soc/apple/macaudio.c:macaudio_parse_of_component() {
	ret =3D of_parse_phandle_with_args(node, "sound-dai", "#sound-dai-cells",
						index, &args);
	if (ret)
		return ret;
	comp->of_node =3D args.np;
	return snd_soc_get_dai_name(&args, &comp->dai_name);
}

When speaker_left, speaker_right, jack_codec, or mca has not registered its
ASoC component yet, snd_soc_get_dai_name() returns -EPROBE_DEFER while
comp->of_node still holds the reference. In macaudio_parse_of(), the
for (be_index =3D 0; be_index < num_bes; be_index++) loop populates
card->dai_link[num_links + be_index], but num_links is only incremented by
num_bes after the entire be_index loop finishes:

sound/soc/apple/macaudio.c:macaudio_parse_of() {
		for (be_index =3D 0; be_index < num_bes; be_index++) {
			...
			ret =3D macaudio_parse_of_be_dai_link(card, link, be_index,
							    ncodecs_per_cpu, cpu, codec);
			if (ret)
				goto err_free;
			...
			link_props->codecs =3D devm_kcalloc(dev, ncodecs_per_cpu,
							  sizeof(struct ma_codec_idle), GFP_KERNEL);
			if (!link_props->codecs)
				return -ENOMEM;
			...
		}
		...
		num_links +=3D num_bes;
}

When macaudio_parse_of_be_dai_link() jumps to err_free, the cleanup loop
only iterates up to num_links, missing the comp->of_node references acquired
in card->dai_link[num_links .. num_links + be_index] during the failing
iteration:

sound/soc/apple/macaudio.c:macaudio_parse_of() {
err_free:
	of_node_put(codec);
	of_node_put(cpu);
	of_node_put(np);

	if (!card->dai_link)
		return ret;

	for (i =3D 0; i < num_links; i++) {
		snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
		snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
	}
}

Second, if devm_kcalloc() for link_props->codecs fails inside
for_each_available_child_of_node(dev->of_node, np), macaudio_parse_of()
returns -ENOMEM directly instead of jumping to err_free, leaking np, cpu,
codec, and all previously parsed DAI link component node references.

Finally, once macaudio_parse_of() succeeds, neither a failure in
devm_snd_soc_register_card() in macaudio_snd_platform_probe() nor
macaudio_snd_platform_remove() calls snd_soc_of_put_dai_link_codecs() and
snd_soc_of_put_dai_link_cpus() on the backend DAI links.

[ ... ]

> --=20
> 2.43.0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D11
