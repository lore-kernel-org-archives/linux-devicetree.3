Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296158;
	b=IhEKZpIgDAhc7OzyyFxb+klVi59FsuFHt8w9ZhxN6AIVP0fvIsviaBlUd1rEvi2PMZZo
	 hnm8OYnVu+8xp8oCUJ46fVKhfWF2RuRO63wS5R2GKFNYlnOhDWyKyNpyRblLfblkJ5hbT
	 mVVB4bsozrMzyES4TqKTiBd2xe8vS3a+Rv1p2Y1MAwDdVXm2DMxwlfDWKQykmqyr9XSU3
	 doCjyiqN35uJKhDAxuW5IlC6UgJU277q2caqHiuVkstlL1SOKg2qNu/FQEnKV7YEBD/S5
	 uimUPyC9cbSHJ/Gu1dUPSmtHzJ1cMIz1Ske1pE7ampsZ8PhNYqYkegUjXe1eV1Cia8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ihiIOEqqt2d05CGrdSMuF1O/rE1WtGVQoegjDhALxbo=;
	b=l+ZUp5Nm2z64KznuebuXB7dgj6czVpEhhT2w6MjL1K8EWGGAiwz87/UfXdS051OwMoYo
	 E4WnAa0pEDHZ/4NCCLnuJq1KPpqajCTsAalY6Y1P1a+HQj/oJBWQWLi4LGV0sNiJFqEFq
	 25HPhtNX1m3QtmEzcdEk/dMpfpQf08C7qQmPeZmzC33s5aK/Is0EVe+9itTMVdg8Ug9kP
	 xc9iXcZ3U26g38wkSoiXvoYkMVxGWUlAbDSFDTEX0aj0OC7eQcZU8b23FzXZzGjBK2fjq
	 YH/gNb1moMgWNTnW0wxdfoJX9QFVfWn7yQY7KIb2/+3DdNPHgIRW+dewENvXhctg1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=okbJpqcQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66147606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=okbJpqcQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1B71F0089F;
	Tue, 10 Nov 2026 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296158;
	bh=ihiIOEqqt2d05CGrdSMuF1O/rE1WtGVQoegjDhALxbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=okbJpqcQ/+ZjNbxPcmsOysYz2msmb70lzbEIpdnMkE1usROGU0ig09S8nLr7kjrwY
	 vbtUEeM+RI1Bx6vmEc9ilZSFaSjnWJVsjar8cC4+LvJixorLZ/JbJUKaoilNss72nr
	 Rjv56p+rIcu0HEcFTUqiKjK4zluFI4nUIk5SJVMoBrWh8/e49IrQBmVou89clY8iMm
	 kA9g7ENyNPugbhuI6RIvo2SvuIYBTKoMEp9IyCkesZ9XpByYdRCzpc+tEn5UXyuh5/
	 JhOKNXmTFIpG7kHeNuHrgKagvMoJzNYW/cnFxm3q9DuY8U2NuuOoCJ0WR5lWJxH3oO
	 BvW4Z7YZhKbiQ==
Message-ID: <sashiko-outbox-206521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: add the SPI NOR flash supply
 on Orange Pi 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-opi5-dts-v1-2-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
 <20261110-opi5-dts-v1-2-582b63d074be@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:35:57 +0000
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
- [Low] arm64: dts: rockchip: flash@0 node split across dtsi and dts on
  Orange Pi 5
--

commit 2c756f3dcba3203200378627107b75dba49f9ae4
Author: Arun Iyengar <aiyengar1990@gmail.com>

arm64: dts: rockchip: add the SPI NOR flash supply on Orange Pi 5

This commit adds the vcc-supply property pointing to vcc_1v8_s3 for the
SPI NOR flash node on the Orange Pi 5.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> index d76bdf1b5e90e..d67c876c80138 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> @@ -33,4 +33,8 @@ &pcie2x1l2 {
> =20
>  &sfc {
>  	status =3D "okay";
> +
> +	flash@0 {
> +		vcc-supply =3D <&vcc_1v8_s3>;
> +	};
>  };

[Severity: Low]
Should vcc-supply be added directly to the existing flash@0 node in
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi instead of splitting
flash@0 across both files?

Both flash@0 and the vcc_1v8_s3 regulator are already defined in
rk3588s-orangepi-5.dtsi under the disabled &sfc node:

arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi:&sfc {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&fspim0_pins>;
	status =3D "disabled";

	flash@0 {
		compatible =3D "jedec,spi-nor";
		reg =3D <0x0>;
		spi-max-frequency =3D <100000000>;
		spi-rx-bus-width =3D <4>;
		spi-tx-bus-width =3D <1>;
	};
};

Since &sfc remains disabled on the Orange Pi 5B and 5 Pro, placing
vcc-supply in rk3588s-orangepi-5.dtsi keeps the flash@0 definition in one
place without affecting those boards.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-opi5-dts-v=
1-0-582b63d074be@gmail.com?part=3D2
