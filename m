Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811063;
	b=soE7Ksfz84FV2HloXvGxj1PtRPBEXuUYivkRiGtyFqPSyDU2aIFcXZaARiIR8eGSK8Vn
	 phMoJAoRDHEKMMJTVWjckgdrdhxfDQyPUYyna4fjHZtOBqSUwxbQdNt2bnmMKdDfiguzl
	 hY4up7RD6eu9ERa2GMLIRCN0qhlgimz+bYj9EW6qiuBRzkrq89aJK9c8UWa/Wvx5xCW2J
	 ZXyU8l+89ClXGbbKAZ0GSQ7r63VygAJzmkP0l7v4HFQj6vGL1FW7HgSRkieua32oNrhNv
	 xt4vJXmoK/oCF/UoiGCwQ3mxRmTpCqgEcq1tFfFoQ/w+bs3tHLB7l+rpBCLKxYmFnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aSwauafY/FmQez3/D9TyFpQRVrZ/NFTcLTTDYA5XbGo=;
	b=GtahH8WBfg7DGWFzWfYK5tayjVR9YzFY5eCFjUoTA9BxOLUqJsiw8aW5a3fp5EaoeMOY
	 AZ7tBCRFaptEGrjZ0GpsLC7NDDjgWobQ9UZK/ZqpBK7zZEwTqtGMVyoEpYpMfFAlQ/SKl
	 RrJYLeVFl03hO+AzW/ua4w6oEl5br1HswXrFr+nDGXOuBQ4DFFBF1DRrIbRlLdOKzTOO3
	 bcJBzCYSto/jFApOsYd3dfpIiM5x7gQN78BWnU7WmMdDJv7djHnFBbAKMq33jJ3bZkVe9
	 7SjgLDFkFzn5SlaC+w5FuCicJ/Sr1v/C8GNsWhC+fLhHiQVWJ5ikJRqa5iT8CGV4bkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qiq6KQbe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED21606D82C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qiq6KQbe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E62E1F000C1;
	Wed,  4 Nov 2026 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811062;
	bh=aSwauafY/FmQez3/D9TyFpQRVrZ/NFTcLTTDYA5XbGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qiq6KQbeVs+x2HWFF5wnRgby3YJ+ZhNv/L81fAaAeDwcnZNriVHXK9TeIgZmkpi3o
	 BHGQzrpM/TzuJ/cmUCg5UH+/OFNz3Wi/5oq4PbcJZ9A/Jk8R+K+wNLlOjMvDZYjgZY
	 UgISobiANUHCE8KzIxaIWvkk6yatl+WP9Wb7I3UjESv6bTuPnYppuJd0KaY3SugWti
	 HSeI0JLdSqRnCMK8OY7BGTfQX5uCwSCSlRtUZoL0GlKja8dUra5GaZDQZJryHEYmHA
	 TQIjKBqQ2m5g88X3Zux1gJJGhuTCqGGojrNjLUIdEBZbHcgFCvI2odh9N6pBaSG0pu
	 WxNxheUicIyIQ==
Message-ID: <sashiko-outbox-197687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-quarkpi-ca2-v15-2-2347608d717a@163.com>
References: <20261105-quarkpi-ca2-v15-0-2347608d717a@163.com>
 <20261105-quarkpi-ca2-v15-2-2347608d717a@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:51:02 +0000
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
- [Low] arm64: dts: rockchip: duplicate headphone DAPM routes in quarkpi-ca2
--

commit d54c424e615a629ab7734226a9aad65a4ab9cdd8
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S-bas=
ed
card computer, describing its regulators, storage, display, USB, networking,
and audio peripherals.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..18b7e639076ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> @@ -0,0 +1,1240 @@

[ ... ]

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det>;
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
> +		enable-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_con>;
> +		sound-name-prefix =3D "Headphone Power";
> +	};

[Severity: Low]
As reported by Sashiko on v14 [1], in analog_sound, simple-audio-card,routi=
ng
connects LOUT1 and ROUT1 through the hp_amp simple-audio-amplifier widget
("Headphone Power INL" / "Headphone Power INR" -> "Headphone Power OUTL" /
"Headphone Power OUTR" -> "Headphones"), which internally routes INL and INR
through the DRV widget to OUTL and OUTR.

However, simple-audio-card,routing also connects LOUT1 and ROUT1 directly to
Headphones:

	"Headphones", "LOUT1",
	"Headphones", "ROUT1",

Should these two direct routes be removed so that the DAPM graph does not
define a parallel unamplified path bypassing the Headphone Power amplifier?

[1] https://lore.kernel.org/r/20261103-quarkpi-ca2-v14-2-290990440b67@163.c=
om

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-quarkpi-ca=
2-v15-0-2347608d717a@163.com?part=3D2
