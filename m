Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635272;
	b=UumRJhYakhRuFVZfO9jRiBFlRM/uzRlnljWKu6eEWGgjbSKD0xp7HXsWl4jGcOhxsnwB
	 vpikC9hZSwVw/dE0Og/Kdj1oOhoZuOk0vcOJ1bPDv9LdxQ73vS2R/hoScM8iACsGRagtG
	 lpTxdJjbtjbNOW/y9w7KpoHeb/lkP9epzF9a23a8HuJI3XDwwl3AYRuS5nmG3n/yeKyrq
	 B5+m+qlLbiPup/BpzYU8RbgWoAlQhTrz9XJYLyYkSl3Rz2dt4hf/ROT/4ZVkI9+ClimhQ
	 F4tZPzsoYam6HOyQZJd9VLBi9nLDi1wfvBExtlXY4hbxCs46kZu4utBZh+tDYY1jKBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f6/FHPtzu6nnH0V9kTMo4kGHTANIyP8f26/xvSo8FWY=;
	b=sbNIp3udaNETG+5e54dsfAXA3wXz+y9b1SqZvzr80/I4E6/P+o+bKWZ/yUqbwkl8U5kj
	 mmELYlWWum9/Y3CrD0dmx8xWuNxPGLIKWx8q1WrYetmnR8fKiGET+f2XXPLz1U2tZfyJy
	 MnBIncEnGGMGTMiYEcsBANwKLdAD87ffLgDgG3kDI08klDixVhigfPQADNesRVM6DW0p/
	 4AR70n8N+zB+Ybrq9NnJOWJEQzrRndJiLaAgmYJ1fiStmpAKiKMFn5l3SXkB2o36X26rd
	 u3tLyufjziPUwkz+36enNDzdICsPELX6lG51hSKne1LvprINlU2RDg7BA0euZ0OZqNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhCtzrAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE1606F235
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhCtzrAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49AA1F00A16;
	Mon,  2 Nov 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635272;
	bh=f6/FHPtzu6nnH0V9kTMo4kGHTANIyP8f26/xvSo8FWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JhCtzrAZZDey5D9Jyw9vYUvB7DXLVH9cW2sNYwWUOXn9srfvVtR9Mt4A6Wl9dckjW
	 7Pgokq2I2rE/zaK/C5fTu8AvZokHCIKG9/DyS69dLxZVJ3ZTwk7HvCHgIZio6LAE0F
	 nbSebBNPSsutaOiFnA7NjRDXBQdpqYAgkhjmq25PST6+8jUiclpWRadGrjMvXBoTb6
	 N0pfn49RhyoTeDd0Iv5S6ABLt+Udt+lwxB92E+i5sfJe66u7nkBwWOtvJ+6ccWsyHr
	 JchIY/mMvECNWGjZuIJlINghbVeeYROF5JvHoHnvjQ64esLYjc/w22SZCzc0/pTREL
	 bBiLm8Sb6kqcw==
Message-ID: <sashiko-outbox-193719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-quarkpi-ca2-v12-2-d749d9bb2bf9@163.com>
References: <20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com>
 <20261102-quarkpi-ca2-v12-2-d749d9bb2bf9@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:01:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: rockchip: misplaced hp_con pinctrl and duplicate DAPM r=
outes
--

commit 07118101f721e520605d0c72d4bd5b261e3be1ae
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..c9cd01ba3869c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> @@ -0,0 +1,1209 @@

[ ... ]

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det &hp_con>;
> +		simple-audio-card,name =3D "QuarkPi-CA2 ES8388";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&sound_cpu>;
> +		simple-audio-card,frame-master =3D <&sound_cpu>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,aux-devs =3D <&hp_amp>;
> +		simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,pin-switches =3D "Headphones", "Headset Mic";
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",
> +			"RINPUT1", "Headset Mic";
> +
> +		sound_codec: simple-audio-card,codec {
> +			sound-dai =3D <&es8388>;
> +			system-clock-frequency =3D <12288000>;
> +		};
> +
> +		sound_cpu: simple-audio-card,cpu {
> +			sound-dai =3D <&i2s0_8ch>;
> +		};
> +	};
> +
> +	hp_amp: audio-amplifier {
> +		compatible =3D "simple-audio-amplifier";
> +		sound-name-prefix =3D "Headphone Power";
> +		enable-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: Low]
In analog_sound and hp_amp, hp_con configures gpio1 RK_PC6 with
pcfg_pull_down, which is the enable-gpios pin requested by hp_amp in
simple_amp_probe().

Because pinctrl_bind_pins() applies pinctrl-0 per platform device before
probe(), if hp_amp probes before analog_sound (or while analog_sound defers
waiting for es8388 or i2s0_8ch), hp_con is not bound to hp_amp when
devm_gpiod_get_optional() requests gpio1 RK_PC6. Should hp_con be moved from
analog_sound's pinctrl-0 to hp_amp instead?

Also, in analog_sound's simple-audio-card,routing property, LOUT1 and ROUT1
are routed both directly to Headphones and through the Headphone Power
amplifier widgets (Headphone Power INL/INR -> Headphone Power OUTL/OUTR ->
Headphones), creating parallel direct and amplified paths in the DAPM graph.
Should the direct "Headphones", "LOUT1" and "Headphones", "ROUT1" routes be
dropped so the signal only goes through the headphone amplifier?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-quarkpi-ca=
2-v12-0-d749d9bb2bf9@163.com?part=3D2
