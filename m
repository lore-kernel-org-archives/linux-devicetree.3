Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377828;
	b=3nDIoqupbybr3pYNaMWbu8pFIQiqwApgYEtKq421BQHDDbxzA32AMdja8r2Hor7l11dE
	 veNirhGCeSTNNMto8zXC0tAsmLGtPFz64EjD6nr9rRH0rybbCGCWumsQaicfMbLMotVPO
	 bJzmuaHrx41R4jHpW6scKKP3euphZtJw3eEt5BytNeGGgWJhe8PmoD4QzLSXfcGh0/MfI
	 F//20hgFCU1srWyeBT8gK8TnRFB9hrB8k0bkYiOdPEr0C977uqbkOXR7bjhHtgyfcIsw9
	 NSocKTHxpIYZNYoyVQKc5vjjmJN4XslOgLxUKF6MHQeIgQ/2OxXCllmy7Cxel4A0kCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=25+PS3jeQ3+Byu1PiL0gfnCwGzqf8CViIRDcQ03VcGs=;
	b=naE0/b7QHnULdboP7F0lNA4VMJRXRl8MCd5Th2TY53jSUDbNM5+HXZIjMO6B+fGMrwLR
	 OYv996wAIIHEgId1l3AZbdCaSa4Z96BIOKWJ+wlSp9FysL514mdx3eNbD5azy4/xZHuM2
	 AASDlkMo8F4mas5ruXeZ7S5y5LdYILpEuaYhrU7TP+IWQf3sI6AZMTp4z+9LIsymARdve
	 ydizl31D56+qYF1vJbFTFAs7gFA43ZkEA7cTtDGvgrg/BlUvnb0kbx1R09miq5oVEOs/4
	 FMIlWyl5LOQYCh+e27fE6JO1xMG4dk9u8IEMqhbsaFqSlGYK37LQSzQ4xJZaxYG9q+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0qblSyp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A93606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0qblSyp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89DD1F00A05;
	Wed, 11 Nov 2026 06:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377828;
	bh=25+PS3jeQ3+Byu1PiL0gfnCwGzqf8CViIRDcQ03VcGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V0qblSyptQWVSgyYZsf5O6DWxF+6/PgLIyTpJ7fHe59w1PrMcyzljWYJWnq/Y56zv
	 11i5P0vxFZvyl9tN1Efhn6PVDc3un8ifIiOr9tQWrbftwTU+GtACZsuYVoL0MrPWU9
	 wduKT66L+k+dsBNHY8A9SEkwFOyGoXzWDV3bKcHE4Uo+Z3F9mDD/fp45p8QWEY/FIA
	 WShwD8JrsArE01CacFMwWyR9GJ/igYw5VLaJYpmP/rHXn8Bhj1bSsQOiRfAE/+YRi6
	 wDXbKBipGOYvvGZNdGaPE50rTEqw0E1rEdPCIlxUot6nK0CqfD920AN3+pXi65MrVG
	 1huhm9HWSRcQw==
Message-ID: <sashiko-outbox-208423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-ventura2-dts-update-v2-1-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
 <20261111-ventura2-dts-update-v2-1-bce5b5dafc1f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:17:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: aspeed: ventura2: missing vref-supply violates
  lltc,ltc2497.yaml
--

commit caeadf546c0d6980ef4365a1de76028a3b8cfe39
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

ARM: dts: aspeed: ventura2: Add LTC2305 ADCs

This commit adds three lltc,ltc2305 adc nodes to the ventura2 devicetree and
wires the i2c3 channels into iio-hwmon.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> index f3dbdece30767..50e652cc37a17 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts

[ ... ]

> @@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
>  			reg =3D <2>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> +
> +			adc@8 {
> +				compatible =3D "lltc,ltc2305";
> +				reg =3D <0x08>;
> +				#io-channel-cells =3D <1>;
> +			};
>  		};
> =20
>  		i2c0mux0ch3: i2c@3 {
> @@ -583,6 +590,18 @@ &i2c3 {
> =20
>  	status =3D "okay";
> =20
> +	adc_op_fb1: adc@8 {
> +		compatible =3D "lltc,ltc2305";
> +		reg =3D <0x08>;
> +		#io-channel-cells =3D <1>;
> +	};
> +
> +	adc_op_fb2: adc@9 {
> +		compatible =3D "lltc,ltc2305";
> +		reg =3D <0x09>;
> +		#io-channel-cells =3D <1>;
> +	};

[Severity: Low]
Will omitting vref-supply on these lltc,ltc2305 nodes cause dtbs_check to
fail?  Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml lists
vref-supply under required unconditionally, so the binding schema needs to
make vref-supply optional for lltc,ltc2305 and lltc,ltc2309 before omitting=
 it
here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-ventura2-d=
ts-update-v2-0-bce5b5dafc1f@gmail.com?part=3D1
