Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAE517BD7
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548118; cv=none; b=Ye62Y7I0bbC5WNSl+q9zFr0dD2/AxEgMXuWrZO37HU25Z7ZKbSemuCxWMlBq3JC1iXuOlz4D61GBTwXTaMfpWnxNvsCG+gn0R11LBMYFNh5S7tsa2kN1N39aMl2BnUFH397ykuQsMNYsyuMvMDEHxgS91TzSspAvDsq7lxhk678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548118; c=relaxed/simple;
	bh=lz1bDWSEOHfTj1yT+Saar44q2+Vmm+cjgfjxmjfx4w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0vNwy8r96ktEC1VysXqrB0yXFJYBCiWKnR6jEuO/5zwxOZ9/oBQtdmtPzB9lVREV9cM+S0f9lkmZq2778RWthDFHWZTLGDXvllAOjUTNAaYgqwxcWXw2WQ+tbyG8fRsKunRwWulkEA19Scy88acBH4lwcXOAap+ONKx4xywqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehh+SX4L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehh+SX4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1BA1F00A3E;
	Fri,  4 Sep 2026 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548116;
	bh=te4Wf7Kv/gAk3GhQYkO7Ig2ul4Ld3CbxpAhI/aT7QWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ehh+SX4LVlp1V1MNmYcJkiG8v7ayEZySgztZMfFCc/9xeqW7ozp7g1yoma2R8rOhV
	 NNaEK7WpUtEx+ec9RFlJ8Twh3A49n5lwpX6maoRQH/d8K8adE7vgxcD/cJBeqb3BPW
	 QuAzbX8cgnqJImLDBs4l51ahSCA0HD1UnbLvCOdLzJT2i9CpJAVHwGq7fqkdsHBk5Z
	 sHsi3I9HvpU2P5C8ZrYHtLHqgauoglNjbvUklPSRv5wTgYjWYrn9EAVDGLk0RZYgav
	 51nIZH5j6tAXb7nIdKhl4SGA2dVazmYse/iyCU+mAJXgHSRhj5l/PDa3Tvrl8uAATQ
	 GuQR52EM2vJmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/9] net: phy: dp83867: add regulator supply
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:16 +0000
Message-Id: <20260904185516.9C1BA1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Applying power to the PHY with its reset line already deasserted v=
iolates the DP83867 hardware initialization sequence.
- [Medium] Unconditional 200ms boot delay per PHY on systems without regula=
tor support (CONFIG_REGULATOR=3Dn) or with already-enabled regulators.
--

commit c4d914d3e47d5ead4a045bf92dab75bb76e60c07
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: phy: dp83867: add regulator supply management

This commit adds regulator supply management to the DP83867 PHY driver,
enabling four supply domains at probe time. It also introduces a 200ms
sleep after powering on the supplies to satisfy the stabilization requireme=
nt
from the datasheet.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdb..e03b39fd080d1 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -719,9 +720,40 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
> =20
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +	static const char * const supply_names[] =3D {
> +		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
> +	};
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 count =3D 0;
> +	int i, ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supply_names); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, supply_names[i]);
> +		if (!ret)
> +			count++;

[Severity: Medium]
Does this increment count even when devm_regulator_get_enable_optional()
returns 0 from the dummy API (for instance, when CONFIG_REGULATOR is not se=
t),
or when the supplies were already enabled by the bootloader?

If so, could this cause an unintended and cumulative 200ms boot delay per P=
HY
on systems without regulator support, as count will be positive even if no
regulator actually changed state?

> +		else if (ret !=3D -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +	}
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +
> +	return 0;
> +}
> +
>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
> +	int ret;
> +
> +	ret =3D dp83867_power_on(phydev);

[Severity: High]
Does calling dp83867_power_on() from dp83867_probe() result in power
being applied while the hardware reset line is already deasserted?

The core PHY framework unconditionally deasserts the hardware reset before =
the
driver's probe callback is executed:

phy_probe()
  phy_device_reset(phydev, 0)
  ...
  dp83867_probe()
    dp83867_power_on()

Applying power to the DP83867 PHY while the RESET_N pin is deasserted (high)
violates the power-up sequence defined in section 6.6 of the datasheet, whi=
ch
can lead to erratic behavior or initialization failure.

Should the driver assert phy_device_reset(phydev, 1) to hold the chip in
reset during the power ramp before enabling the regulators?

> +	if (ret)
> +		return ret;
> =20
>  	dp83867 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D2
