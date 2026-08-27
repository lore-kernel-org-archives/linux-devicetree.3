Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D165C3F58D9
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834974; cv=none; b=p6BU40ianXt0xW/3lv0sO9BiRwF2n+Y24FyYETAXwpNzOctqIdphRqzta/s6wKDG6y5czBqVp5+Skst8/a6uxCmTe8MbvNap26dpbnxdbYYCHiK7Q1xnETMmLIlDDxcW2kZo2AqcrRyshtaktQtC3OLskpO/SCPWa5qT0LMqJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834974; c=relaxed/simple;
	bh=N0lYGoGvRnx0vb9Q0okfVpLUSXR1wMzXih1br/EuEz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qqyIsP8sVp9IfPOaOCtq8VphItyfHDgIzC8IfiMECt/qkXcJ4atVHkF13tqwQPjoktMkhJ0h+w09yO4noHDKnVMZUOg/bDIT9rySCEvUaasJ/5InU5Rxenx6vFfgUJ1cI7poMJaG16wY6dPrgFeOn5D+xeS4bIH8UEgHGTU40zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQBlaIzC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQBlaIzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D1D1F00A3F;
	Thu, 27 Aug 2026 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834950;
	bh=OB/YIimSD/rR5vZoAF5tLQmMzpdFq9l5Ung8j096Gh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cQBlaIzCXrgdgebIFtRTRrdy301IgKcyuTiINDmY6w7Xz5wbT5Ez53PUDE7NxQoJT
	 TrZPLtRocuib06kMU5gzL0NTkR0Mt6TwAqvxl1uRVOVOuAMY5kT5SqrnTmhiu94iA6
	 ZI2lSbmEG7ICyZuferYx4mfGaeeTpyyhy/mf4FJvVWR3HGPa86DlgzF+sihCJS25Um
	 P/g6T7H5Dt7ETXx8DZAtOgSlW+bfx4SpAKPh9kDkp2kDT30Otvw3V/uiuQLcRR4ylG
	 bHU4foguXQDHN7Aqv+xb73u0Jb/47kaUQJqrfk8depC8CXiORRVDC+rWvDmHZlX52C
	 Bk6dY9TLhVv6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] net: phy: dp83867: support setting
 output-impedance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260826-v7-2-topic-dp83867-v2-3-a97b4cec6e93@pengutronix.de>
References: <20260826-v7-2-topic-dp83867-v2-0-a97b4cec6e93@pengutronix.de>
 <20260826-v7-2-topic-dp83867-v2-3-a97b4cec6e93@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:49:09 +0000
Message-Id: <20260827124909.F0D1D1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The bounds check for `ti,output-impedance-ohms` is dead code and=
 fails to validate user input due to premature masking, leading to silent h=
ardware misconfiguration.
- [Medium] Implementation contradicts the commit message regarding the prec=
edence of nvmem and DT bindings.
- [Medium] Semantic mismatch between the `-ohms` property suffix and the ra=
w hardware values expected by the driver.
--

commit 2371852a6bc6ccb808abdfecb87e3c77ba5c83df
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

    net: phy: dp83867: support setting output-impedance
   =20
    Currently the dp83867 supports setting the io impedance to minimum,
    maximum, default or a value from a nvmem cell. In situations where there
    is no backend for a nvmem cell, the value can not be set to anything but
    minimum, maximum or default.
   =20
    Add support for the ti,output-impedance-ohms binding, allowing to
    specify the impedance via the devicetree. The existing boolean bindings
    for minimum and maximum take precedence over this new binding. The nvmem
    consumer still takes lowest precedence.

[Severity: Medium]
Does the implementation contradict the commit message regarding precedence?

The commit message states "The nvmem consumer still takes lowest precedence=
."
However, if an nvmem cell is successfully found:

dp83867_of_init_io_impedance() {
	cell =3D of_nvmem_cell_get(of_node, "io_impedance_ctrl");
	if (IS_ERR(cell)) {
		/* If no nvmem cell, check for the boolean properties. */
		...
	}
}

The code skips the error path entirely, meaning the device tree properties
are never evaluated when the nvmem cell exists. This makes the nvmem consum=
er
take the highest precedence, rather than the lowest.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdb..973b70f11c45a 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -542,12 +543,21 @@ static int dp83867_of_init_io_impedance(struct phy_=
device *phydev)
>  						"failed to get nvmem cell io_impedance_ctrl\n");
> =20
>  		/* If no nvmem cell, check for the boolean properties. */
> -		if (of_property_read_bool(of_node, "ti,max-output-impedance"))
> +		if (of_property_read_bool(of_node, "ti,max-output-impedance")) {
>  			dp83867->io_impedance =3D DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX;
> -		else if (of_property_read_bool(of_node, "ti,min-output-impedance"))
> +		} else if (of_property_read_bool(of_node, "ti,min-output-impedance")) {
>  			dp83867->io_impedance =3D DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN;
> -		else
> +		} else if (of_property_read_u32(of_node, "ti,output-impedance-ohms", &=
val) =3D=3D 0) {
> +			val =3D val & DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK;

[Severity: Medium]
Is there a semantic mismatch between the property name and the expected val=
ue?

The property name suffix -ohms implies that the value should be specified in
standard electrical units (Ohms). However, the driver reads the value and u=
ses
it directly as a raw 5-bit register tuning step. Should this property parse
a value in Ohms and translate it to the correct register setting?

> +			if (val > DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN ||
> +			    val < DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX) {
> +				phydev_err(phydev, "'ti,output-impedance-ohms' contents out of range=
\n");
> +				return -ERANGE;
> +			}

[Severity: Medium]
Is this bounds check dead code?

Because val is first masked with DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK (0x1f=
),
it can never be greater than DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN (which is =
0x1f).

Additionally, since val is a u32, it can never be less than 0
(DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX).

If a device tree specifies an out-of-range value like <50>, it will be
silently bitwise-truncated to 18 (50 & 0x1f), bypassing this validation
entirely and potentially misconfiguring the hardware.

> +			dp83867->io_impedance =3D val;
> +		} else {
>  			dp83867->io_impedance =3D -1; /* leave at default */
> +		}
> =20
>  		return 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-v7-2-topic=
-dp83867-v2-0-a97b4cec6e93@pengutronix.de?part=3D3
