Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91B20D4FF
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 01:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743566; cv=none; b=N7f1+/4ZoLKPYiwuzq5+JBDrzyFTx1kVLZ+81RR1UT5X6UVkx4BKLW5Sqk4HddvMqWIpJvSC+rYL+B9yrt3CPALH5PuURbHvkxoxpC+6ER5oadGUQvnn2Nvxi5JywMnilPD+zp5OVPSpZNUyszixOzoZ+29TZOaZIk2faIwH548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743566; c=relaxed/simple;
	bh=BoXJP2WJ5l6hKQpOIeK5EQ+bE6Frp335z6QpHq7Am+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C4y2n3L2e7B/oqK1PgP69WXsKCehXod/IEXOvbuSpk/M6adphPG8G45LIDz28G8HtCg2LouW6XDC2csVEEnXI/8CVE9/YWM46Fbg5xj6yuDgjRqGc4lkf1ZPKaix2Yymlq2nr1lV0G6FYtTXgslX+HJUAzNQZagc/2yDNxxNhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/waIKfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/waIKfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF5B1F00A3A;
	Mon,  7 Sep 2026 01:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788743564;
	bh=E7klcHo14pe+AECjaHm4wcyyuMaM5J9E4yBR7jAHvFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/waIKfkeA/Hgmx9k3FmXZ/ZEwaZiM1pkcdhe2iW9dOcQ+kiol6Gf9QD76FDdZo6R
	 i9HAF+X+hnEW6SU+m1pZjH3qTttm2J+SMThfgXnSaFSACC3P7G5jWLdxIF9KTwNCfn
	 AHpWZ4kJO44sDP8ALbJHamu7VacCWy0pHGJ+ZqVVDnRVF+eojc6UwhzoWOwyzE1Bqe
	 t595REcOCW7NI5ty4rsEV1jCor+8fvXlGrU56Lf93D4+pQCi2lGBFxOxFAOMJ9tFnl
	 zJre+sii8VdYFQXXDlTPL7S5prqiNCbhtjhdLa3QbPQA5lRPWjmY2P9HZKKEi3QioY
	 /nRZJ33hPWqIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907005933.230766-1-rosenp@gmail.com>
References: <20260907005933.230766-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 01:12:43 +0000
Message-Id: <20260907011244.7EF5B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Replacing 'nxp,pca9555' entirely with 'onnn,pca9655' removes the f=
allback string, breaking device tree ABI backward compatibility.
- [Low] The newly introduced compatible string 'onnn,pca9655' is not docume=
nted in the device tree bindings, which will cause a schema validation fail=
ure.
--

commit c8f9a287a2365f46a814726f590cf6561513d0de
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: marvell: armada-388: use onnn,pca9655 compatible

This patch updates the GPIO expander compatible string in the Armada 388
ClearFog and Helios4 device trees from nxp,pca9555 to onnn,pca9655, and
removes a stale comment about I2C matching limitations.

> diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/ar=
m/boot/dts/marvell/armada-388-clearfog.dtsi
> index f8a06ae4a3c91..4a61e9d1a2c0d 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> @@ -131,12 +131,7 @@ &i2c0 {
>  	 * 15-SFP_MOD_DEF0
>  	 */
>  	expander0: gpio-expander@20 {
> -		/*
> -		 * This is how it should be:
> -		 * compatible =3D "onnn,pca9655", "nxp,pca9555";
> -		 * but you can't do this because of the way I2C works.
> -		 */
> -		compatible =3D "nxp,pca9555";
> +		compatible =3D "onnn,pca9655";

[Severity: High]
Does replacing nxp,pca9555 entirely with onnn,pca9655 break backward
compatibility for older kernels booting with this new device tree blob?

Older kernels lacking onnn,pca9655 in their OF match table might fail to
probe the expander0 GPIO expander, breaking features like USB3 power and
SFP modules.

Would it be safer to provide a fallback list to maintain the device tree
ABI, such as: compatible =3D "onnn,pca9655", "nxp,pca9555"; ?

[Severity: Low]
Is the onnn,pca9655 compatible string documented in the device tree
bindings?

Running make dtbs_check with schema validation enabled might fail if
this string is not listed in the gpio-pca95xx bindings.

>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x20>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907005933.2307=
66-1-rosenp@gmail.com?part=3D1
