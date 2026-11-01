Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570908;
	b=KSrWbwuZSE0yPWlWKZnS4bm+xUKjHdrbXjljQx3Zkf1p6HsmxVoyHDyUBt+tbkipmBS6
	 dNorX20GbBabVJ21k3YwHUFxO3twSjbNfqhB4fDLehEjiARMSjdOLQa3+X8eDWb3G5Be6
	 mZsON3GFU4jGIPFkslGIwHeQz7LO707ztancF6th2yozXE+FtUsq0DoN0RbbAdjcvfXUS
	 Q6gz/Gp5uN3LnLpIjo/F7vRSqgsIpwI0lGO6xbfX33eE7Eo4PvPDm5iKjG+AGTuwN3oUi
	 sQ9O6nNpcRHC3GxWnIXwtv2iuBPtTNEsQPtPoWtlDc0HpF1zOxIahHLKjarucpqS1uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570908;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z5ITduMJUGkmT+QAS7EEqOJyZGewDGPTKk6Ow0R+TV0=;
	b=pbBzskX/KOK1h6BtXFhfVjFmL2eNu7d0OJ7xlVXL3nzZ+72dyZD2xANqf6Ua3Z2blbnN
	 X4maFUrPOFY3SqUXRi8Z/zX9u00YmWvDpdzQYHjQ7r3Kuy46WYkkFJFo6i4XF3S0C7qzj
	 X/6ZSyHq6BI8/nGqyylI/RmKmoBAH7Dw3Xfq4CDWsUjE0p13EeMG+g37LcDE0keZxKPVv
	 +RnHrZv4f9C98DvOjFKCPJOnoFGELL7FLNFJLr6ecSk0ZUuixn6zhMehcErCuMVrZFKD7
	 zA3RaqtAU2ByFOAKzLcNtqQUrOhaHWsWeS6FK/enurn5JgMnJKEuj+4WJulHNA46Tgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQY9h0Tc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072A606A336
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQY9h0Tc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1BF1F00A15;
	Sun,  1 Nov 2026 22:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570907;
	bh=Z5ITduMJUGkmT+QAS7EEqOJyZGewDGPTKk6Ow0R+TV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQY9h0Tc/0ZOZk8I/obtXWZn0PrRoP45j5We1EGkHlF0VD6S8A9mmx0pNKy0rtL8w
	 Btg9SPE/CEphLoYv7Qy/VlR7FFsa0OE31sP2Bz21ya9jTPDbHkWkFE09cEiES9zyhO
	 8fh7l2T+TyGdSpXDrx2DcAT8zuC167iMkS4FLvXM6RpZeiLe2Y5+13Yj9OfiLehhbw
	 neA8ryjWo1YEg5RYoji9mR8GkrEmlFvMgc4TxhT7diwQJBFHVhBEkDUKJJ0qAws3K0
	 Iw5YrbI5xe93CF+bI8hKCGhdpJog1ZTvUDOdRee4YX8L/Q4f90kvSsHLGAq7ErXbkN
	 2npymL1BLhuow==
Message-ID: <sashiko-outbox-192700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add support for NanoPi M6
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101-nanopi-m6v2-v1-3-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
 <20261101-nanopi-m6v2-v1-3-e401ea64b394@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:08:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: rockchip: wrong MCLK clock in rk3588s-nanopi-m6v2 au=
dio-codec
- [Low] arm64: dts: rockchip: commit subject names NanoPi M6 instead of Nan=
oPi M6V2
--

commit b98c017b6747ab0aa87e4af9234cbf5396581d64
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

arm64: dts: rockchip: add support for NanoPi M6 board

This commit adds the device tree for the FriendlyElec NanoPi M6V2 board,
including support for its Everest ES8389 audio codec, regulator, and user
button.

>     arm64: dts: rockchip: add support for NanoPi M6 board
>    =20
>     The NanoPi M6V2 board is an updated version of the original M6 board
>     with the following changes.
>     * New audio CODEC (Everest ES8389)
>     * New Ethernet PHY (MotorComm YT8531C)
>     * 1 extra user button
>     * Misc connector changes on the board
>    =20
>     The codec_es_3v3 regulator enable pin is hardwired to the 5V input ra=
il.
>    =20
>     See link below for detailed information:
>     https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2
>    =20
>     Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>

[Severity: Low]
This isn't a bug, but commit 2640aea473b4 ("arm64: dts: rockchip: add suppo=
rt
for NanoPi M6 board") already used this exact subject line when adding
rk3588s-nanopi-m6.dtsi and rk3588s-nanopi-m6v1.dts. Since this commit adds
rk3588s-nanopi-m6v2.dts for the FriendlyElec NanoPi M6V2, should the commit
subject say NanoPi M6V2 instead of NanoPi M6?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
> new file mode 100644
> index 0000000000000..2ac00f2de6844
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
> @@ -0,0 +1,90 @@

[ ... ]

> +&i2c7 {
> +	audio-codec@10 {
> +		compatible =3D "everest,es8389";
> +		reg =3D <0x10>;
> +		assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +		assigned-clock-rates =3D <12288000>;
> +		clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +		clock-names =3D "mclk";
> +		vddd-supply =3D <&vcc_1v8_s3>;
> +		vdda-supply =3D <&codec_es_3v3>;
> +		#sound-dai-cells =3D <0>;
> +
> +		port {
> +			es8389_p0: endpoint {
> +				remote-endpoint =3D <&i2s0_8ch_p0_0>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2s0_8ch {
> +	i2s0_8ch_p0: port {
> +		i2s0_8ch_p0_0: endpoint {
> +			dai-format =3D "i2s";
> +			mclk-fs =3D <256>;
> +			remote-endpoint =3D <&es8389_p0>;
> +		};
> +	};
> +};

[Severity: Medium]
Should audio-codec@10 under i2c7 use <&cru I2S0_8CH_MCLKOUT_TO_IO> (or
I2S0_8CH_MCLKOUT) instead of <&cru I2S1_8CH_MCLKOUT> for assigned-clocks and
clocks?

In arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts, the codec endpoint
es8389_p0 is connected to i2s0_8ch_p0_0 under i2s0_8ch, and the included
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi enables i2s0_8ch with t=
he
i2s0_mclk pin muxed:

&i2s0_8ch {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&i2s0_lrck
		     &i2s0_mclk
		     &i2s0_sclk
		     &i2s0_sdi0
		     &i2s0_sdo0>;
	status =3D "okay";
};

For comparison, audio-codec@1b in
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts uses:

		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
		assigned-clock-rates =3D <12288000>;
		clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;

With I2S1_8CH_MCLKOUT specified here, of_clk_set_defaults(),
simple_util_parse_clk(), es8389_probe(), and es8389_set_bias_level() will
configure and gate the unused I2S1 MCLK clock branch rather than the I2S0
MCLK output driving the codec.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-nanopi-m6v=
2-v1-0-e401ea64b394@gmail.com?part=3D3
