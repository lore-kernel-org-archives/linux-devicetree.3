Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E312D7DD4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513682; cv=none; b=aeL+q7n3vtQV9OZ91W59xsCIqGy0CrJufivNm6uc+xr9RwvV+46WSgQifIgjN2dMYSfqHuTw61l/KCdn6cEJRztLiIaPxim9Xd4iIU+aiIZuznVPqfd1ldH4x9k7m4PDzjsVwoCz46moxXBWoMw2Gc6VY7QNNApd7xM0blyUKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513682; c=relaxed/simple;
	bh=tOTdNeNjYvV+S1Sl/oFZIUbe312XWCO0JJe6b8PVaxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KKuQxtyjRx11yJKlRWri3sSH6XTIqQLREZKJe1rSMlTsyDDThXdNB+YqKuASd+QuTkOtrcbtjUSrD7ZWuV8sd+MDr7KJjvXfs5BP76eN83uBxgXRmSZqOjdZT86HAfhYqorjLIB5vK2fTUvxXn7dwD0otUhqWMz/PyUiaZv1V9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpyUVNC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpyUVNC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9B81F00AC4;
	Fri, 31 Jul 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513680;
	bh=MS163L7aHyuRkSDy7K7mi8+CMIQoWpWbYyGIGDJiNj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpyUVNC3UTCrOlk1cScuG0Bzbd+A3c8+tWGvPXGfnUYmr7cPhrWX3fJzE3hNkUbrm
	 CtY7ZyADwwFiGktNYsKIZpO3G1eyRLSfqnQFyiAMmIgZ3jZP9s++V+hc0hbDRaQYlj
	 ZgOKjeeCITocB3Bs0tF8p/3wfhZshGLIlEFpV+vQYJzfR9NGzgnhmCEZKzk+oXVGWM
	 UFX8IE8K1gWcO7yWU3X5+RVIoz/6k6LVQ8i/kX/tW+fTK285ngFZtervOGSsBWZz7+
	 eHiZ7oNE6wf73LG5vrhPSwnsEweDf1H6/TXVzqIuzHSwvaTJ1lmkTUFr+NSj2WRAYy
	 PdoOhC3BDrC/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/10] nvmem: layouts: Support fixed-layout as the
 nvmem device node itself
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-4-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-4-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:19 +0000
Message-Id: <20260731160120.9E9B81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double-parsing of nvmem cells causes device probe failure when the=
 provider node has `compatible =3D "fixed-layout"`.
--

--- Patch [4]: [PATCH v9 04/10] nvmem: layouts: Support fixed-layout as the=
 nvmem device node itself ---
commit d3f11032479fe63790d2e2a677a2a7e3ebc199dc
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

nvmem: layouts: Support fixed-layout as the nvmem device node itself

This commit allows of_nvmem_layout_get_container() to fall back to the nvmem
device node itself if it is compatible with "fixed-layout". This enables the
cells to be parsed directly by nvmem_add_cells_from_fixed_layout() when no
child layout node is present.

> diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> index b90584e1b99ea..efa631ce7283b 100644
> --- a/drivers/nvmem/layouts.c
> +++ b/drivers/nvmem/layouts.c
> @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_de=
vice *nvmem,
> =20
>  struct device_node *of_nvmem_layout_get_container(struct nvmem_device *n=
vmem)
>  {
> -	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	struct device_node *np;
> +
> +	/* Search for nvmem-layout child */
> +	np =3D of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	if (np)
> +		return np;
> +
> +	/* The nvmem of_node is itself a fixed-layout node */
> +	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
> +		return of_node_get(nvmem->dev.of_node);

[Severity: High]
Will returning the provider's own device node here cause a double-parsing
issue and device probe failure due to sysfs attribute collisions?

In drivers/nvmem/core.c:nvmem_register(), both legacy parsing and
fixed-layout parsing are executed consecutively without checking for
duplication:

    if (config->add_legacy_fixed_of_cells) {
        rval =3D nvmem_add_cells_from_legacy_of(nvmem);
        if (rval)
            goto err_remove_cells;
    }

    rval =3D nvmem_add_cells_from_fixed_layout(nvmem);
    if (rval)
        goto err_remove_cells;

If a provider sets config->add_legacy_fixed_of_cells =3D true for backwards
compatibility, but the device tree uses the new "fixed-layout" compatible on
the provider node, both functions will parse the same of_node children.

Could this lead to duplicate cells being added to nvmem->cells, causing
nvmem_populate_sysfs_cells() to fail with -EEXIST?

> +
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D4
