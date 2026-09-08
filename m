Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1D3AB496
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899114; cv=none; b=h4YdER+Jm3ainyQYGHU3NDC6cvagJxv53moSPYf9MBjMXW4ngkEwrtzSbQMeANjuUwT5N3ga+1y1WqXllQc1k13cyJHjV8vpZu+iDQK0YI+KBvIC+3+13vFmAWDuO14oqT3CG86xqG25kbjeCGn99vnYW3mdNULCWo6RhG+Z6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899114; c=relaxed/simple;
	bh=mD6zQHBP72bUE5l0vztI9pBH3Vn1a5P9nyQEMHUZnMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NAw2lcq6/+LmcShmZ6aK+6PSQDTnr3Qm/ryU8tbOj/1Yg0waYWc/W0Vt762fqZuJgs0MIBRVFIjYyOKsa34ccPmq3q8gETqnSW59Vr1FcgGjM65Lb7gF2Z6oy0o1siqDG/z91mR3MQALAtF1jZV1pNQLhGHNWWhCh91nu0vULLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAeTd+Ar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAeTd+Ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4211F00A3E;
	Tue,  8 Sep 2026 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899113;
	bh=ywBd02Blh3RlFnvZRUhz/5/BxrR/c1p069IdNmWmN8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AAeTd+ArHfFOxcQ26k9ozKq30aj8rGCRIUrRq5ICGEngI2acsp5KQw9FK6pUlqym8
	 rgOjn0LIqWAx5jF/tMowdnWkada57XwjXCiyca4Qi0zEjucobjpvqAlkwaLzeu53Ub
	 Z3QeZAG+oiue8REZTwSNNVU2laTNbmlXoJZir0qaXdJD6UJu7o6c0oSUWo6inqzNu7
	 1oU1Su6r/BW6TA4+xCQJPmrrEX/KKaP+JGHsVx9wB/NTezGayENb/P8l0Z7GCBm9Vt
	 KimVHEmXdqBWWTy5o+3zcF+e/9zct96bVhL/Qrmxi+OOP/JRCKkg6QPphW4Ksj+utP
	 dnayZ4I5U+Imw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 20:25:12 +0000
Message-Id: <20260908202513.0A4211F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect usage of devm_regulator_get_enable_optional() causes unc=
onditional 200ms boot delays.
- [Low] The `#ifdef CONFIG_OF` guard improperly restricts regulator managem=
ent to device-tree platforms.
--

commit 6d9389913bb995393df4699729d85576835ff23d
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
net: phy: dp83867: add regulator supply management

This commit adds regulator supply management during probe for the DP83867
PHY. It enables required power rails and sleeps 200ms if any supply was
enabled to meet datasheet requirements.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdb..dbeee7cad6f0c 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
> =20
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +#ifdef CONFIG_OF

[Severity: Low]
Does this restrict the regulator management to device tree platforms
unnecessarily?

The Linux regulator subsystem is firmware-agnostic and safely returns
-ENODEV when supplies are not found via standard mappings, so wrapping this
in an OF-specific guard appears to skip the initialization for platforms
using other configurations like ACPI or board files.

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

[Severity: High]
Does this logic accurately detect newly-enabled regulators?

If CONFIG_REGULATOR is disabled, the dummy implementation of
devm_regulator_get_enable_optional() unconditionally returns 0, which would
falsely increment count to 4.

Furthermore, even if regulator support is enabled, it returns 0 for
regulators that are already enabled (e.g. shared supplies or boot-on
regulators). This contradicts the commit message's claim that it only sleeps
when a supply is "newly enabled".

Would it be better to open-code devm_regulator_get_optional() and check
regulator_is_enabled() before enabling the supply? That way the driver can
accurately detect if it was just turned on, avoiding an unconditional 200ms
boot delay per PHY.

> +		else if (ret !=3D -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +	}
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +#endif
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet-v2-0-bbe3389d0652@oss.qualcomm.com?part=3D2
