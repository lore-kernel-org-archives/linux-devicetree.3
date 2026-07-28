Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592F41BA83
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232040; cv=none; b=OCTMX/NlO/pQvPaUQ9PBf/2UBa5SMr5vqD5HbR80m+MCmD/kuyc5MO5QsFLkRdEaD1X0WuMpH/NW6S7dGznt/DIWNnIdRXGgyZhx8pmiMkdypKeO32ioDfU4SOQUZqYR0zvCueftNa3uzZY9Ot1kXB+vrP8DTJVgC7ych2+cO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232040; c=relaxed/simple;
	bh=kkjWKVTfFU4QU6LMvv8473ma5LW+i1z4WOyIorY7RzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qNU3Ag2E0kvsmmlnQA8GVF28NjprMFFmWeHvH7XVRjWDgFHLkJ5V/CHH39tW5omfxhVAcIbgKCgtPHOGjgNWUPTRVViiPNyV4JtYmzvv4OEjsIiM4ksv6AkWKSmxzxbx2cAYlQ4I9IHcyF2HdVaNmDe9N6F/OXRU4alxi5Ibs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gr+ZM4Or; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gr+ZM4Or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9A61F000E9;
	Tue, 28 Jul 2026 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232039;
	bh=lERqEYS6Gzq+ad1gPjbOjs/4ZFsYx2p2WYpj9z+Mk5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gr+ZM4OrD8ODjGsOjBfeLdhnDYDkZ0wLlHxE85E9FCnx5IavsLfW72bM+ilgB23Rd
	 1GMCiFXOWvzugK1e/hX00tmtlCarH0PjiG1Iump1cBsav/O7uezALd6a9JtNEwY2V4
	 /GtMq/klG3riRHpn7XBytZu5AGRaGbOjpl2NRGlShtK5dB2nsepQj5b1kgCePqnI07
	 X91RYz0qyFylTgV7uYsjLFYdIctQd2FQP2fdKZ+NJj9MBhC4xP7uAY+FnzqmWo0cV4
	 nuuFnsNexUj4iSXku5sJpO2tAnwMXpWfIukUmzAcKEsoarQU1tgTvdWgrQnSFkQYP6
	 rGD1bTZZhF2UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:47:17 +0000
Message-Id: <20260728094717.DD9A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A TOCTOU race condition exists between looking up the PHY and acqu=
iring its module/device references, leading to a Use-After-Free (UAF).
--

--- Patch [2]: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node() ---
commit 65a24031fe496953334387cf190f1425a8b31168
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add devm_phy_get_by_of_node()

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index ebfad5325072e..7af24f2f4120f 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c

[ ... ]

> @@ -1029,6 +1029,40 @@ struct phy *phy_get_by_of_node(struct device_node =
*np)
>  }
>  EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> =20
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy refere=
nce by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages
> + * releasing resources.
> + */
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_no=
de *np)
> +{
> +	struct phy **ptr, *phy;
> +	struct device_link *link;
> +
> +	ptr =3D devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy =3D phy_get_by_of_node(np);

[Severity: High]
This is a pre-existing issue, but does a TOCTOU race condition exist in the
underlying phy_get_by_of_node() that could lead to a use-after-free here?

Looking at phy_get_by_of_node(), it calls _of_phy_get_with_args() to look up
the PHY. Inside _of_phy_get_with_args(), the function temporarily elevates =
the
provider's module refcount, calls of_xlate() (which returns a bare phy
pointer without incrementing the device refcount), and then drops the module
refcount and unlocks phy_provider_mutex before returning the raw phy pointe=
r.

The caller then accesses phy->ops->owner and calls get_device(&phy->dev):

drivers/phy/phy-core.c:phy_get_by_of_node() {
    ...
	phy =3D _of_phy_get_with_args(&args);

	if (IS_ERR(phy))
		return phy;

	if (!try_module_get(phy->ops->owner))
		return ERR_PTR(-EPROBE_DEFER);

	get_device(&phy->dev);
    ...
}

If the PHY provider module is unloaded or its driver is unbound via sysfs
concurrently in the window between _of_phy_get_with_args() returning and the
try_module_get() call, the phy struct could be unregistered and freed.

Could this cause the subsequent dereferences of phy->ops and phy->dev to
access freed memory?

> +	if (IS_ERR(phy)) {
> +		devres_free(ptr);
> +		return phy;
> +	}
> +
> +	*ptr =3D phy;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org?part=3D2
