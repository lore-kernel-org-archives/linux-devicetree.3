Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92F3ACA5F
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321339; cv=none; b=ubwhpSp/LdJKeoEAR0uicsdAdk4wVndua3Q3NnEjWgTRm/uHXP/7BlrhPMXxf7YDgJz7xqRVz0YRsltlPrm8AiqCmvhhxS160I7ysXelsmuVYZ3IJ/kuwoqKU4WqII7Lcz+iAc1EroKQHZq4mS7s0fmzR18ffZZ07y7r93G+wvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321339; c=relaxed/simple;
	bh=AaXgyiufmG2txv/z4DS9BokgtnIeBwBe4qDLjnk9FDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XMzn2X9M0NakKVQsujhP3HVUtZ16waUSx2OE7IztL0tA1skfFLDYu1X8BjUJis5Si0ACPGQDF8LOvajuQN2uOC/EHjHvXyFWxFn7dsul5SiQkaISwPZL7WiL2X972gkhYE8dht/H+wabU1SDFNCBJrXZ2Wdq7Qza7GUu8Vw6gN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td4RxYmw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td4RxYmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C666F1F00893;
	Mon,  1 Jun 2026 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780321338;
	bh=wvXmsgXbmxMgWI5WYjbGUdcRaBPTRrfZOEOUEqEXRag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Td4RxYmwVegNLx8vtkB44SPl85Kc22KNu10Eo8TYFyfWVobVOS97K+SF04RHj95Uz
	 oSk2674yeCSn33sNbr7HSdkbl4wgorvQrpdRs3eTW4YlNlVm902Ubaz6Lh4mxcUzvi
	 PSYSNJxbYSeC9i02pxK3wTMBGBsul1He0Sn93wSy2ZQG3lAQoznEa/wrKWhNgnAvbf
	 3taNpAMkEzXZFjzDAZwJYCLD8Gq73SqM3S5DVNbd9fWBZth5sZs7neq0rMiPi7IP2W
	 F6+CStFp/hqh/A4qur/UqFKMRcBcfVMrsl2A6/bab1HR/Y9qkGRVZP6iDHlDoCMmju
	 NumxNfulL++fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add Vicharak Axon board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601132529.139172-2-hrushirajg23@gmail.com>
References: <20260601132529.139172-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 13:42:17 +0000
Message-Id: <20260601134217.C666F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `enable-gpios` property is invalid for the `rockchip,rk3588-dw=
-hdmi-qp` compatible binding and is ignored by the driver, leaving the HDMI=
 ports unpowered.
- [High] The `rk806_dvs1_null` pinctrl node incorrectly configures `gpio_pw=
rctrl2` instead of `gpio_pwrctrl1` due to a copy-paste error.
--

commit 9e5cc3349cf78765922014a014dd0a775c777bef
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: add Vicharak Axon board

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> new file mode 100644
> index 0000000000000..fecd13a52e88a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
[ ... ]
> +&hdmi0 {
> +	enable-gpios =3D <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
[Severity: High]
The dw-hdmi-qp binding does not support the enable-gpios property, so the
driver will not parse this.

If this GPIO controls power to the HDMI port, will the port remain unpowered
and non-functional? If this is meant to enable FRL, should this use the
frl-enable-gpios property instead?

> +	status =3D "okay";
> +};
[ ... ]
> +&hdmi1 {
> +	enable-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
[Severity: High]
Similarly to hdmi0 above, does this enable-gpios property need to be changed
since it is not parsed by the dw-hdmi-qp driver?

> +	status =3D "okay";
> +};
[ ... ]
> +	pmic@0 {
> +		reg =3D <0>;
> +		compatible =3D "rockchip,rk806";
[ ... ]
> +		rk806_dvs1_null: rk806_dvs1_null {
> +			pins =3D "gpio_pwrctrl2";
[Severity: High]
Is this pins assignment correct? It configures gpio_pwrctrl2 instead of
gpio_pwrctrl1 for rk806_dvs1_null, which looks like a copy-paste error.

This could leave the actual DVS1 pin unconfigured and susceptible to
unintentional voltage scaling from floating signals.

> +			function =3D "pin_fun0";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601132529.1391=
72-1-hrushirajg23@gmail.com?part=3D1
