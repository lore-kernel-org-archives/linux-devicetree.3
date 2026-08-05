Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9C46C848
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934150; cv=none; b=NpxPEDESrBGB042O8BrxqIQMtK8xfr7uqxGZoHGrg4Es02B10Mg1bJ5Rs0H+9oUFZ0a6HmoamMiO8HSRz4GWOOHOaB+E5vCvpg6sqa13j1L6AcmiKeADKn+NSxArA52T7pFztFY1X7escRNWio5vdEXb8vcfu9Zltioqhjv6jYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934150; c=relaxed/simple;
	bh=9wj5VEE05Op+54W2UUQxxa9q+aQlo/yUYRFz87bQOk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ba76A262D1o2poP3wGHB5KWHFCY4PlBrw3KjuwRb3Ae2wJ3br5EhtI7WnQcDUCDFSMoKQ7mrMbIbyJufKI6UZLaqRy3Z1CbZlHZAR0Xsk/YgulHG6DZxgNC2afQS5/q6xkoHYy6TyiTrFI7+2MfPsKIoVidNtYXClo8zCZwmG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUX0APyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUX0APyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D4C1F00A3A;
	Wed,  5 Aug 2026 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934147;
	bh=X3nGZoS4laacRt20dnQz7oJ1/GiPtRTAZx1oceeAF7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lUX0APyh693QihBtHIZoU8Hoh2jGAeRDDndO0Djatrrk4+Op2xUYe9Rd/J4RVIzXC
	 H9K14stqrh5r7vGvmPYawkZHV7UsDj+h0/WE5KpbDSeGeTWhHQs9q85QwqJtB/kM7O
	 HPtDjTgbSgPSeQeUr8vHrjR3ID8A5R7jS5WKQqX2AebYuI5Z/2PqhqdAmeGRzBBi/5
	 bwq8X81SKCYvxDSGr0GjX6y51wBHkPDcXh09JkaBF3sHDT0HQNPa2LiLOPfumbo5Gv
	 AYc01sjNPqGR/prrtE/DKCgvR/LB8uPr1yRHX9RwSpz2hOgCOo2kDL1g3CM7vXdPDX
	 9ulG258QKP3KQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] net: phy: dp83867: support setting output-impedance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-v7-2-topic-dp83867-v1-2-1ca79eb54eef@pengutronix.de>
References: <20260804-v7-2-topic-dp83867-v1-0-1ca79eb54eef@pengutronix.de>
 <20260804-v7-2-topic-dp83867-v1-2-1ca79eb54eef@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:49:06 +0000
Message-Id: <20260805124907.38D4C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Inverted error check on `of_property_read_u32()` ignores the prope=
rty when present and causes probe failure or garbage configuration when mis=
sing.
- [High] Passing a pointer to a 1-byte variable to a function expecting a 4=
-byte pointer causes a stack buffer overflow.
- [Medium] Meaningful code and commit message mismatch: nvmem takes highest=
 precedence, not lowest.
--

--- Patch [2]: [PATCH 2/2] net: phy: dp83867: support setting output-impeda=
nce ---
commit 5d72fffedcf9773506f98861b65736e9f8be835a
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

net: phy: dp83867: support setting output-impedance

This commit adds support for the ti,output-impedance devicetree binding to
configure the IO impedance of the DP83867 PHY. It introduces a fallback to
this new property when nvmem is unavailable.

> Currently the dp83867 supports setting the io impedance to minimum,
> maximum, default or a value from a nvmem cell. In situations where there
> is no backend for a nvmem cell, the value can not be set to anything but
> minimum, maximum or default.
>=20
> Add support for the ti,output-impedance binding, allowing to specify the
> impedance via the devicetree. The existing boolean bindings for minimum
> and maximum take precedence over this new binding. The nvmem consumer
> still takes lowest precedence.

[Severity: Medium]
Is this commit message accurate regarding the precedence?

Looking at dp83867_of_init_io_impedance(), it seems the code attempts to
retrieve the nvmem cell first. If that succeeds, the early return prevents
any device tree fallback logic from running:

dp83867_of_init_io_impedance() {
	cell =3D of_nvmem_cell_get(of_node, "io_impedance_ctrl");
	if (IS_ERR(cell)) {
		// DT fallback logic happens here
		return 0;
	}
	...
}

This would give the nvmem consumer the highest precedence rather than the
lowest. Could the commit message be clarified?

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -542,12 +542,19 @@ static int dp83867_of_init_io_impedance(struct phy_=
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
> +		} else if (of_property_read_u32(of_node, "ti,output-impedance", &val))=
 {

[Severity: High]
Does this condition check for success properly?

The function of_property_read_u32() returns 0 on success and a negative err=
or
code on failure. Because of this, the if condition evaluates to true when t=
he
property is missing (returning a negative value), and false when it is
successfully read (returning 0).

This means the driver might use an uninitialized stack value for configurat=
ion
and fail the probe if the property is absent, while ignoring the property
entirely if it is present.

[Severity: High]
Can this cause a stack buffer overflow?

The variable val is declared as a u8 earlier in dp83867_of_init_io_impedanc=
e():

dp83867_of_init_io_impedance() {
	u8 *buf, val;
	...
}

However, of_property_read_u32() expects a u32 pointer. Passing a pointer to
a 1-byte allocation into a function that writes 4 bytes could corrupt adjac=
ent
stack memory.

> +			if ((val & DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK) !=3D val) {
> +				phydev_err(phydev, "'ti,output-impedance' contents out of range\n");
> +				return -ERANGE;
> +			}
> +			dp83867->io_impedance =3D val;
> +		} else {
>  			dp83867->io_impedance =3D -1; /* leave at default */
> +		}
> =20
>  		return 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-v7-2-topic=
-dp83867-v1-0-1ca79eb54eef@pengutronix.de?part=3D2
