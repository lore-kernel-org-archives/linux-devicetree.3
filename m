Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07944BC92
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618328; cv=none; b=T4JVS3Ma3cMgCol4hwCuiaM0IgYfZnN6C9KPKv39uEGlznQfR7DucxNh0HvolHcuvslAv/ES7EBIgYnJOoFRCE7K/KUoj8jqVSdbKAWOu+FS74PDtDEG7sHJzBSxeRcS9EgcplumdO7rPN4nI59Tfft1AK4dFC8YMhy8+snXQas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618328; c=relaxed/simple;
	bh=WaryOFsFpLQJuxPb3BqX6L5y3FK3kqSo+MuACGxKhkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=grQVY3hKc1SP1ISBQHfYcx8IO/deOTXWWzQ/KsPvsEle4/Y0QWd6jksRgHi1B74VcxgCMJgBXcuLgxeTWOCYRO1AaKayhZuVKYBC4oHHVdMiQrem0fa6alqpH42gbP7j/DwIfB0twCpFa+eweP6M8WTlz7wzPpLPEFq43huYfn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i38vL4U3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i38vL4U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E8D1F000E9;
	Thu, 13 Aug 2026 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618319;
	bh=Nnjp4jhm1Be1hgStigF/bmziZqkw91yEwWo7UXG5Iq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i38vL4U3u9wIlSbLJksbBp5a60Hrnqltgkw6IcS1tWrJ0gr62uTzJ/fk0hj28nn9q
	 Ee7CAsAXKiH0rQZgZTl97oDNKS3R9k8xbnEiys2Y6RpVJi7r9Q5WN7RtgK09xgqsk5
	 F6DQmyPpJvH+eqYNB+w9+zSSYtEpQEuJyzMTMeiEl6jGH+VzmSFAg8/pQX9f7NOMl8
	 ceXXjcheqdQeHtZqBrvWvmPSHKxQxrVySii7BDQkfTSSMz0I2mKQXikg9sjPlvQqFE
	 Y7M50FrUBRXL5VjQkBa6v4R5VQD9rlXXS+ddNX/6GMvjcU9eu0jbAgpeqtNMMaxgYk
	 IZvaxFX5iQEfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/7] ARM: dts: microchip: sama5d27_wlsom1: use
 fixed-partitions for QSPI flash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, conor+dt@kernel.org, "Richard
 Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, robh@kernel.org, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>
In-Reply-To: <20260812104955.485667-6-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
 <20260812104955.485667-6-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:51:58 +0000
Message-Id: <20260813105159.15E8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `#address-cells` and `#size-cells` properties were left behind =
in the `qspi1_flash: flash@0` node after moving its partition children into=
 a `partitions` subnode.
--

--- Patch [5]: [PATCH v7 5/7] ARM: dts: microchip: sama5d27_wlsom1: use fix=
ed-partitions for QSPI flash ---
commit 2272ae3c8afd10d0823376b2412b60934678478f
Author: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: ARM: dts: microchip: sama5d27_wlsom1: use fixed-partitions for QSP=
I flash

This commit moves the QSPI flash partitions into a new partitions
subnode with the fixed-partitions compatible string. This change
aligns the device tree with the current MTD partition binding requirements.

> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch=
/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index 0417f53b3e964..062aa02a98edd 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -240,34 +240,40 @@ qspi1_flash: flash@0 {

[Severity: Low]
This is a pre-existing issue, but should the #address-cells and
#size-cells properties be removed from the qspi1_flash: flash@0 node?

Now that the partitions have been moved to the new partitions subnode,
leaving these properties in the parent flash node can cause dtc warnings
(avoid_unnecessary_addr_size).

It also violates the MTD binding schema, which deprecates them at the
flash node level when a partitions subnode is used.

>  		m25p,fast-read;
>  		status =3D "disabled";
> =20
> -		at91bootstrap@0 {
> -			label =3D "at91bootstrap";
> -			reg =3D <0x0 0x40000>;
> -		};
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812104955.4856=
67-1-manikandan.m@microchip.com?part=3D5
