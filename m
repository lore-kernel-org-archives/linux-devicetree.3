Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32916404BF4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877777; cv=none; b=TCYzr1yU4SAtl5egIgI3oZH3T0HGqHtXifoCp2PMOCpHhjxkO/Wzv52euC+9owzgpnuA5EI7tfd631Vs7BZwPROF2VbdBQELLbbBU2UhuenlSYTfZ1AFVr3jO52FvAGqZejwqqsuqXlZ1NmKEMoh9OZJiNbFCxsQjobVu6rHcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877777; c=relaxed/simple;
	bh=H9nqS82m/d22SMD0u7lRelgemI1E4L9pzmRCrgcmTSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kSRK6ivFsVJpgTF2KNAswyZIhL0PEzGu16U7LIEVGgC0qt9iTQ4ab9k9Pd2P+0Mk7yq3viNH68vv1/OM3nSvLT0b7EIaZxOF9Zm4w1BzNLDhF5CTdsKAbyI6uz4/blz+np+wNT1+2VETYT5dkwCZnd7rDYLPbwXd14SWZ9aifZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu9rBH1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu9rBH1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C979F1F000E9;
	Tue,  4 Aug 2026 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785877776;
	bh=QEoNqKl434OcZ9ol7VN+iY+WCGKC5wklOthnlL5AtoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pu9rBH1kiEntXN6r6rePk7bmacoaz7MXBGqkCHADxeTUiYczwKuM7jM4AE+u79+hf
	 3OlYlDvFFXR0jZzkd2XeDfljEouqPRAeZs4qm0J3Sq3NsQOzzCNlUkOIXX2u7ZAp88
	 S6eszK+cD3HULtRp3L0bAwV762mtLwfFDV0Bz04E5cm3WscU+GssOjFcGZVD1AqtPp
	 kW9Lw5P+hLiJHnsWK6U8MO6Xse3e9UzXZ5Z61X4EDauvSwPGwSMi14n1v2SVy/JPN+
	 JxGhTKSddZ+TMXw9c4rYtY+dTvrSEHSvu1Hkb+5xnH4RyDgyd+XuPLRO27ns+R0Qrr
	 kLvmsHqTWY8og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] video: logo: allow the boot logo to come from
 the device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Pedraza" <maximpedraza@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260804225617.264861-3-maximpedraza@gmail.com>
References: <20260804225617.264861-1-maximpedraza@gmail.com>
 <20260804225617.264861-3-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 21:09:35 +0000
Message-Id: <20260804210935.C979F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Premature freeing of device tree boot logo memory creates a race c=
ondition with asynchronous framebuffer probes, leading to a NULL pointer de=
reference.
- [Medium] Unbounded kmalloc() allocation for device tree boot logo trigger=
s a kernel warning and fails for sizes exceeding KMALLOC_MAX_SIZE.
- [Medium] Silent fallback to searching the device tree root node if the /c=
hosen node does not exist.
--

--- Patch [2]: [PATCH v2 2/6] video: logo: allow the boot logo to come from=
 the device tree ---
commit f460a2fda249375abd332c49e9ef32c7cd3a3f7b
Author: Max Pedraza <maximpedraza@gmail.com>

video: logo: allow the boot logo to come from the device tree

Add CONFIG_LOGO_DT_CLUT224, which makes fb_find_logo() look for a node
compatible with "linux,boot-logo-clut224" under /chosen before falling
back to the logos built into the kernel image.

> diff --git a/drivers/video/logo/logo.c b/drivers/video/logo/logo.c
> index 91535f8848da9..7f8b04ecfa987 100644
> --- a/drivers/video/logo/logo.c
> +++ b/drivers/video/logo/logo.c

[ ... ]

> +static int logo_dt_parse(struct device_node *np)
> +{
> +	unsigned int clutsize, npixels, i;
> +	unsigned char *clut, *data;
> +	u32 width, height;
> +	int len, ret;
> +
> +	ret =3D of_property_read_u32(np, "width", &width);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D of_property_read_u32(np, "height", &height);
> +	if (ret)
> +		return ret;
> +
> +	if (!width || !height || (u64)width * height > LOGO_DT_MAX_PIXELS)
> +		return -EINVAL;
> +
> +	npixels =3D width * height;
> +
> +	len =3D of_property_count_u8_elems(np, "clut");
> +	if (len < 3 || len % 3)
> +		return -EINVAL;
> +
> +	clutsize =3D len / 3;
> +	if (clutsize > LOGO_DT_MAX_CLUT)
> +		return -EINVAL;
> +
> +	ret =3D of_property_count_u8_elems(np, "data");
> +	if (ret < 0)
> +		return ret;
> +	if ((unsigned int)ret !=3D npixels)
> +		return -EINVAL;
> +
> +	clut =3D kmalloc(len, GFP_KERNEL);
> +	if (!clut)
> +		return -ENOMEM;
> +
> +	data =3D kmalloc(npixels, GFP_KERNEL);

[Severity: Medium]
Could this allocation trigger a kernel warning (WARN_ON_ONCE_GFP) and fail =
if
the device tree provides a valid boot logo larger than KMALLOC_MAX_SIZE?
LOGO_DT_MAX_PIXELS is 32MB, but kmalloc() without __GFP_NOWARN will warn if
it exceeds the maximum contiguous allocation size. Does this code need to u=
se
kvmalloc() instead, or restrict the size limit to KMALLOC_MAX_SIZE?

> +	if (!data) {
> +		ret =3D -ENOMEM;
> +		goto err_free_clut;
> +	}
> +
> +	ret =3D of_property_read_u8_array(np, "clut", clut, len);

[ ... ]

> +static const struct linux_logo *logo_dt_find(void)
> +{
> +	static bool probed;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (probed)
> +		return logo_dt_data ? &logo_dt_clut224 : NULL;
> +
> +	probed =3D true;
> +
> +	np =3D of_get_compatible_child(of_chosen, LOGO_DT_COMPATIBLE);

[Severity: Medium]
If the device tree lacks a /chosen node, of_chosen will be NULL. In that
scenario, wouldn't of_get_compatible_child() silently fall back to iterating
the children of the root node (of_root)? This seems to bypass the strict
constraint mentioned in the commit message that the node must be located un=
der
/chosen.

> +	if (!np)
> +		return NULL;
> +
> +	if (of_device_is_available(np)) {
> +		ret =3D logo_dt_parse(np);
> +		if (ret)
> +			pr_warn("logo: ignoring malformed %pOF node (%d)\n",
> +				np, ret);
> +	}
> +
> +	of_node_put(np);

[ ... ]

> @@ -32,6 +184,7 @@ static bool logos_freed;
>  static int __init fb_logo_late_init(void)
>  {
>  	logos_freed =3D true;
> +	logo_dt_free();

[Severity: High]
Can this introduce a race condition resulting in a NULL pointer dereference
or use-after-free for framebuffer drivers that use async probing?

fb_logo_late_init() executes as a late_initcall_sync during do_initcalls(),
which happens before async_synchronize_full() guarantees async probes are
complete. If an async probe caches the logo pointer via fb_find_logo(), and
then fb_logo_late_init() frees the memory and clears the pointers, the async
probe might dereference the freed memory later in fb_show_logo().

>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804225617.2648=
61-1-maximpedraza@gmail.com?part=3D2
