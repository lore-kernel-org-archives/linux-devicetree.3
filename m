Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB03B9DAD
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900827; cv=none; b=u7roWZbzZF7VXlkh+uTTCEe/GrfFGFucX+2KtFU8Lb0bXITa8D4LdYlSj15Hdoi7XUdX3I7K7odPYu19oU2MpE3rg1Nf/RKG035uxMW7RxPu3LbiBS7X/dGDe5DiHZgiSyrIRC9s7/+crdpz/bTSZrW+sjD4SWFBXmflR7V/Hr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900827; c=relaxed/simple;
	bh=BI+5aQ0+LBfg4aAnZvaEZICWpSHJyKque700BIPcUjs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m5wZ8pVySIQAtv8xjEl15HUHZ25kvoqygK6/DUmzP5DAc1NcxAu5UwI/76T8hrW/KqnUW4nuYvpeCvA5zZDHO9fQAs/xMycDdZuADOtsrGsER6u6MbDhb+6RVlpF3TrhtADLTA3Uy421dZM4NiZe3wZq1LarSLpypk5N3a72eGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfCIgtGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfCIgtGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DF21F000FF;
	Tue, 13 Oct 2026 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900825;
	bh=Vhy06hrRUceGRvbs++YMTilBAjCcyiNSffAft6ImOqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NfCIgtGzuHupfw2B59BH36CaW9fYFjoxGMuoLJ2Tx5NO/E22JuxooUJb8BRLj319T
	 bvFPqdmVt7v1D0SgG5tdlDk/tYVO9/wAU44r3bSUa/F6z0sRC4oJoGDcStV6LmfAhc
	 Ccc7PW+jYAJzNDoB3fSOqW05TTuC1mymrYX0fAlY7WR1WxkFhm8V52xIu4UtDhhnxR
	 hFp1e0JCIccNztBn2WybkIwHt1JGqzuPHLyEwEzP8vft6N/tMTlWGoysw+7kp8nJ0H
	 qr6krXIW82CeTwj4V7SPOYhueT9XUT8o9VGKqquqngGqxHPo3P66cdFkNdpeCqBN08
	 G2eF+kiK2HkUQ==
Message-ID: <sashiko-outbox-169889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:13:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dts: rmtfs_mem node lacks unit address matching reg property
- [Low] dts: virtual i2c-gpio node placed inside memory-mapped soc bus
- [Low] dts: framebuffer node retains unit address without reg property
--

commit 6c9915e6435fc32203fc912dbc6609069cf97bc9
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree

Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
in 2021. Add initial device tree for SM7125 Samsung platform with
support for various basic components.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm6=
4/boot/dts/qcom/sm7125-samsung-a52q.dts
> index 0000000000000..ecba5be8164ea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts

[ ... ]

> +&rmtfs_mem {
> +	reg =3D <0x0 0xf4f00000 0x0 0x202000>;
> +};

[Severity: Low]
Does appending this reg property cause a dtc warning about a missing
unit address?

In sm7125-samsung-common.dtsi, the base node is defined without one:

		rmtfs_mem: memory {
			compatible =3D "qcom,rmtfs-mem";
			qcom,use-guard-pages;

When a node has a reg property, its name should include the corresponding
unit address. Should the base node be updated or the name overridden here
to match the reg address (e.g., rmtfs_mem: memory@f4f00000)?

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> index 0000000000000..7c5d062bd0809
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi

[ ... ]

> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		framebuffer@9c000000 {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&cont_splash_mem>;
> +			width =3D <1080>;
> +			height =3D <2400>;
> +			stride =3D <(1080 * 4)>;
> +			format =3D "a8r8g8b8";
> +			clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};

[Severity: Low]
Is the @9c000000 unit address appropriate for the framebuffer node since
it relies on memory-region instead of a reg property?

A node must only have a unit address if it has a reg property.

Additionally, should chosen retain the #address-cells, #size-cells,
and ranges properties if it no longer has any children with a reg
property?

[ ... ]

> +&soc {
> +	i2c_17: i2c-17 {
> +		compatible =3D "i2c-gpio";
> +		sda-gpios =3D <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +
> +		i2c-gpio,delay-us =3D <2>;

[Severity: Low]
Should this virtual i2c-gpio node be placed at the root level (/)
instead of inside the memory-mapped &soc bus?

The i2c_17 node is a bit-banged software I2C controller without
memory-mapped registers, so it lacks a reg property. dtc will flag a
warning that the node lacks a reg property but is in a bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-sm7125-sam=
sung-v4-1-3233901b48bb@gmail.com?part=3D1
