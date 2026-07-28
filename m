Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EF441DDE0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231981; cv=none; b=tJZ0YmNozYXouGjgRg9nrY94wnEFxEysO2V+3KcX9LLwYoCm/f+xswIWCVzJ+vQ1QYjeluYpdyXw4bA06S4A8b/zVqtNNC3jCzc1BhJcrFD3hxcoZxgbS4oPXFXnlejn/IstD4JrtKxUOvrMqcqfF67kN3Iaf8O9KoFPJqLs1Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231981; c=relaxed/simple;
	bh=XR5yUvn+I0cca0+qmiPOTiKqJIG9NueLMNwIz8LetLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ubb9P+mGlJccH+HI5QhSpEJe1DvqRoT3IlyG6GrAzhQJxVLVEP7ls3D5NxsSXQgcvw88e+auJJ1SMfhYKsAMbJ8jD3W/dQIYFHEizIrCo4Ta3H0M4N47tIcc+yJnvhfa6gU9kJLypVoZRdRDxfKhHYCrU6l4/RRE/95JVRKJF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEwnYkh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEwnYkh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830C91F00A3A;
	Tue, 28 Jul 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231980;
	bh=e030KLhmFu+lNyOMh4TMHraDnfsl3heQ77IpJ9k4ncA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEwnYkh+5F4aErKBJXRc/yPlftTSs59igb5z8Og+66gRp/h4pc6si6S3wK4AYFqnc
	 15FvTQ9okIGeTeIbsAN7dDGswlInDbT/PDGXFQR/uu7BWMXqX52z+6GsyJXxpNOK4g
	 vARoqEacbmN6wzK2uPuyaS/Q7XdrK63NBc1vCiH71tmGAex7jLIhN4Q5ZerSZBVkHD
	 IkhEBJg/4dMYn5pK5X+Izs/+cjv2GY8XVtOwYNQU7j9kzcDOR+3rCIsA0APTvBm7xs
	 5AFo47AQEu+Y/c2LKz3R6sgPIATcPmrdS/aZQ72/uF3geeT4/A5OqKtnO8k6kLnHMJ
	 XTpu7Th4QB9bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/5] phy: core: Add phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-1-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-1-ae811e2f0799@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:46:19 +0000
Message-Id: <20260728094619.830C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly introduced phy_get_by_of_node() API bypasses the usb-nop=
-xceiv compatibility check, leading to infinite probe deferral.

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition during PHY =
lookup returns an unpinned pointer, allowing concurrent PHY destruction to =
cause a Use-After-Free.
--

--- Patch [1]: [PATCH v13 1/5] phy: core: Add phy_get_by_of_node() ---
commit 2964f1957e7138a13d72185f47a72cbb1e4e193c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add phy_get_by_of_node()

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..ebfad5325072e 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
[ ... ]
> @@ -607,54 +607,69 @@ int phy_validate(struct phy *phy, enum phy_mode mod=
e, int submode,
[ ... ]
> +static struct phy *_of_phy_get(struct device_node *np, int index)
> +{
> +	int ret;
> +	struct phy *phy;
> +	struct of_phandle_args args;
> +
> +	ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
> +		index, &args);
> +	if (ret)
> +		return ERR_PTR(-ENODEV);
> +
> +	/* This phy type handled by the usb-phy subsystem for now */
> +	if (of_device_is_compatible(args.np, "usb-nop-xceiv")) {
> +		phy =3D ERR_PTR(-ENODEV);
> +		goto out_put_node;
> +	}
> +
> +	phy =3D _of_phy_get_with_args(&args);

[Severity: High]
If a caller uses the new phy_get_by_of_node() API on a device node compatib=
le
with "usb-nop-xceiv", will it bypass this check?=20

Because the compatibility check was left here in _of_phy_get() instead of
being moved into the shared _of_phy_get_with_args() helper, it appears the
new API will skip this fallback and could enter an infinite probe deferral
instead of correctly returning -ENODEV.

[ ... ]
> @@ -986,6 +1001,34 @@ struct phy *devm_of_phy_get_by_index(struct device =
*dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
> =20
> +/**
> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by devi=
ce_node
> + * @np: node containing the phy
> + *
> + * Returns the phy associated with the device node or ERR_PTR.
> + */
> +struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	struct of_phandle_args args =3D { .np =3D np, .args_count =3D 0 };
> +	struct phy *phy;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);
> +
> +	phy =3D _of_phy_get_with_args(&args);
> +
> +	if (IS_ERR(phy))
> +		return phy;
> +
> +	if (!try_module_get(phy->ops->owner))

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
here between retrieving the phy and pinning its module?

The _of_phy_get_with_args() helper retrieves the phy pointer via the
provider's of_xlate callback. Typical callbacks (like of_phy_simple_xlate())
drop the PHY device reference before returning. _of_phy_get_with_args() then
unlocks phy_provider_mutex and drops the provider's module reference.

Could a concurrent thread unbinding the PHY provider destroy the PHY object
before this caller evaluates try_module_get(phy->ops->owner), resulting in a
use-after-free?

> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	get_device(&phy->dev);
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org?part=3D1
