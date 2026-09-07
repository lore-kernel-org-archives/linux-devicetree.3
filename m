Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA10470112
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788020; cv=none; b=XZwhfgxH7cWECbs6i4TmG0iM8zxQqBF3p/DKcmWZHep8a0tkmtIk01VJta95jdrNWz0yLoTw5KzpUOy5URELVr1JjeANP7yb6M4kpMBissyWnhWzfxZf+twC931eevzqWAnym3xdiCDwynFICakoPCylMAXceg85p4KnHkfw+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788020; c=relaxed/simple;
	bh=V6gS1PvB/EwO7Z4UPcwKzAghJiuM0u+kl4yt8egSosA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k5pLSAaxfKSFkIbd+R7kNEXb+xhdk58pYvfQ9CZXc2P6C8Ixm7yKJCu58trN2Plr0OkDpbyds52zlhaHtqeJLq/FerFTd8fcOnm6kojf2V4dGiwV4VCUPwMJM562MtyGV7tcTVvO6YPqcsTPFaedI+/9Umz6dbJvzzsufo2weKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqproT9x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqproT9x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994101F00A3A;
	Mon,  7 Sep 2026 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788018;
	bh=hAyAx2JkMI66BdFdAJFBfvGw204+kQ+PkvH/BgilsYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HqproT9xSBnpKyYvI32/ZnMTwhTVHe9zgcAnK+ohicuEkUej8+XywbuzcB1NYEa7F
	 AOlFeTCo1c/4/kQ36dbx0Fv+kJgq+H2gIgU+fVp4OBSaps4Jv0rCIYl2tfQ8BIdEnD
	 BDt4Ppx0CWFhJ3LLaEgOdPfwu6t/pnyNWSwbfyabd8vIM9I2xb5JkIgVMhb5kjy1zk
	 ARGpuOT3q0XjwkEJCrpAwrCsEeVSQhejX0O304RxjEt7rrqwnclb4K7VBlqxVw1NHM
	 TQTSQ1OYmOFYtvcikSC4YFKwSsSe5vZ/7SonRXVIu2c1mft6WtBAQylRs363ekfAfc
	 6vaJP1MmjSaYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907132617.1198548-6-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-6-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 13:33:38 +0000
Message-Id: <20260907133338.994101F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Deprecated `#address-cells` and `#size-cells` properties used in MT=
D flash node.
--

commit f35337ebba269a3b16d4cec0dd59b117f17e49c6
Author: Robert Marko <robert.marko@sartura.hr>

arm64: dts: microchip: ev23x71a: enable QSPI

This commit enables the QSPI controller and describes the onboard SPI NOR
flash for the Microchip ev23x71a board.

> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/ar=
m64/boot/dts/microchip/lan9696-ev23x71a.dts
> index 4012ea7d07bbd..985ca31e74e76 100644
> --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> @@ -463,6 +463,21 @@ phy27: phy@27 {
>  	};
>  };
> =20
> +&qspi0 {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <100000000>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;

[Severity: Low]
Does this flash node need the #address-cells and #size-cells properties?

Since this flash@0 node does not define any subnodes (such as partitions
or otp), these properties serve no purpose here. The MTD devicetree bindings
in Documentation/devicetree/bindings/mtd/mtd.yaml explicitly mark these
properties as deprecated at the root of the MTD node.

Compiling the devicetree with dtbs_check will likely trigger a schema
warning due to this.

> +		spi-tx-bus-width =3D <1>;
> +		spi-rx-bus-width =3D <4>;
> +		m25p,fast-read;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907132617.1198=
548-1-robert.marko@sartura.hr?part=3D5
