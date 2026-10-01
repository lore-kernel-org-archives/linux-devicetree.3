Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34C3E2773
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857415; cv=none; b=KJS3q53XOyc/ZdlFrCcRSo1UoEpHYo/YSMK4JHfW6v6BTxWlUvs0wfLduGRwsSouH7N51ZELX0RlP20xaV3zboW8QDMRRONIpk6EpdnQ56kPWckMwVlC1/icjgQ1kK9k5klJqWco3ElJRdugQEtmtI33XPxGRYB/VI5bwOH8wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857415; c=relaxed/simple;
	bh=PezMpHJ664zp60FcbDndqK/LrtEhpZk6Pi5b0XXdgwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WKLeg54vd9Au055JZ3pCB/4escUeg3pxwuTTyQhuwKbLMNIp3sU4AJCfY3iieTu7GGhb4+E9ImNSqAXA0BuWiOlCgAAr5b0AL9d+oUJaJOCkZE5kHgL8Cw63ECBCyrul8UaC0GZvDQUSEO0nyEfPD9UKq9AqVGvv91fxAZSxKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0o8uy48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0o8uy48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4381F000FF;
	Thu,  1 Oct 2026 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857413;
	bh=s58Py3TYg9FrImMUq3I8JtbeKMqNF38s1QDL3GwLLzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0o8uy4805dowvdvxa7o4Z23fqsZKYw4B6BVorsCXa0S/L1PAP2b7Q9MV/9WRp4y1
	 //8Ec4xrCyTUF9oHYrbnLZoYvtUI2OGb9K9ZVchN/ssorG+JykvyNfDVn2697AHk7s
	 5tvgFm7f0OM9OUtK90gmoQzExOrkhmzAbSaAx1acpBqBt1P0w4byfm2ng9NG+PtSBH
	 9jgp1WeQsEqHm+ZcDca1ImmYPGQN0+vmQyau7hHhXuUW7ntXY7hz2ZW+d5aqNeSNUb
	 JYEdyl1aatll8BP/6SQ3ISN/kW1y/SQcbFoxKcQrYFNt/LhXLk6Y9tLCQm5z1coNYp
	 gXVEO63y4o0bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930122305.293686-5-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:23:32 +0000
Message-Id: <20261001122333.4D4381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: mxl-gpy: potential overwrite of upper bits in VSPEC1_L=
ANE_ASP_MAP
--

commit 6afd4cf52cade8d4300f55c200c7e05630214098
Author: Robert Marko <robert.marko@sartura.hr>

net: phy: mxl-gpy: support MxL86211C lane mapping

Configure the MxL86211C physical TPI lane to ASP mapping when it is
described in DTS. MxL86211C supports per lane configuration. Leaves the
hardware reset configuration untouched when the optional property is absent.

> diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
> index 790075632fc3f..f716da0ffe890 100644
> --- a/drivers/net/phy/mxl-gpy.c
> +++ b/drivers/net/phy/mxl-gpy.c

[ ... ]

> +static int mxl86211c_configure_lane_asp_map(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 lane_asp_map[4];
> +	u16 val;
> +	unsigned int seen =3D 0;
> +	int i, ret;
> +
> +	if (!device_property_present(dev, "maxlinear,lane-asp-map"))
> +		return 0;

[ ... ]

> +	val =3D FIELD_PREP(VSPEC1_LANE_ASP_MAP_A, lane_asp_map[0]) |
> +	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_B, lane_asp_map[1]) |
> +	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_C, lane_asp_map[2]) |
> +	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_D, lane_asp_map[3]);
> +
> +	return phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LANE_ASP_MAP,
> +			     val);

[Severity: Medium]
Does this potentially overwrite upper bits in VSPEC1_LANE_ASP_MAP?

In drivers/net/phy/mxl-gpy.c, within mxl86211c_configure_lane_asp_map(), th=
is
performs a full 16-bit register write instead of a read-modify-write, which
implicitly zeroes any bits outside the 8-bit mapping mask.

If bits 8-15 are used by the hardware for other independent fields, could
clearing them lead to undefined behavior or state corruption?

This path triggers during PHY initialization when the maxlinear,lane-asp-map
device tree property is present. Would it be safer to use phy_modify_mmd()
here to preserve any reserved or unrelated bits?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930122305.2936=
86-1-robert.marko@sartura.hr?part=3D5
