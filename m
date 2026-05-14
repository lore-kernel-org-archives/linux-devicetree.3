Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7F38F248
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756105; cv=none; b=U+53W3JxaRajS/SKd70Rl9K8Qqx5eQuZpyGbFZMxXtvfy/pIKNA/FRx9I6PmNMJbPBLdPZtebX+1t5QdRKWR7WCOdjd1O3ZXF+VNJ2cI0XmSfVp47Ab4M96oNHWqijGR+KpI0VvJ+DBfPYKbJV3PH9+kFbvmxUvnNIdzepR9i6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756105; c=relaxed/simple;
	bh=aRJbIDXi3nshwHa0dq6zvqz8+u75C4Vvh5cVqGz31mI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dA9Fq1xyFTsfdZYSn26BecJe1JFu9KriXdv01Uu1JEZbi5ECAWtdLgJPEVdmS3i0Jg71AweADy1LRDWC8Wq8boT1908a3F+rOK12YDT/gvbIHMFiVjCHsq1XiUcemtZwdR36YtOBwWWUBkYaXCN0Gj4VFVsnuX5YtBN1QdIqIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzViy80N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzViy80N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F1C2BCB8;
	Thu, 14 May 2026 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756105;
	bh=aRJbIDXi3nshwHa0dq6zvqz8+u75C4Vvh5cVqGz31mI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EzViy80NuYBMUIDxC5VSfBBU6DUKlNmcaoFNaY+FiGwGPtWSJErFd625Sf7rjkOd/
	 WbZ+sNwzxbFo52Et7in7xbSgx7hmxEHS445M/ZBqDZ9nV1ziq37P8VjFj9wDcCwAQy
	 sPxAKA0em6EoAJNO61U4NMjx7S7qRwtLARnKxpQO+6exhcuPTrt6xf9JWqhWdH5R9b
	 fhu9LH3Y6Ru6Jg8k8mD1YcYd2gQLUj9lpuulI6ldgnoSPIKLK5C8Q1Qtk0K0lLMK3D
	 Z5Cffu+kNeHaH1O0gZ0cTpdOSDbNRXXaH+nQQVVfhdsW4qPiMz0vxMKFR70EPT5BxD
	 M9HbyeWauxBlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/16] drm/tidss: oldi: Convert OLDI to an aux driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-beagley-ai-display-v2-12-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-12-9e9bcefde6bc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:55:04 +0000
Message-Id: <20260514105504.C05F1C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Dangling device link pointer leads to Use-After-Free if auxiliary_=
device_add() fails.
- [High] Improper cleanup on `auxiliary_device_init()` failure causes OF no=
de leaks and potential Double Free memory corruption.
- [High] Unchecked array bounds on Device Tree inputs lead to buffer overfl=
ows.
- [High] Hardware access proceeds despite `pm_runtime_get_sync()` failure, =
causing bus errors.
- [High] Asynchronous runtime PM suspend is cancelled by `pm_runtime_disabl=
e()`, permanently leaking power.
- [Medium] Resource leaks in error paths and device removal (Device Tree no=
des and Clocks).
--

commit 9cc9bfd52317bd0c6d94b12a2ebe2e87339428e8
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: drm/tidss: oldi: Convert OLDI to an aux driver

This commit converts the OLDI to an auxiliary device/driver, created by
tidss, to allow the driver framework to handle enabling and disabling the
power domains.

> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/t=
idss_oldi.c
> index e925ddaa4fd6a..5331732ac99ee 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
[ ... ]
> @@ -251,6 +259,8 @@ static void tidss_oldi_atomic_pre_enable(struct drm_b=
ridge *bridge,
>  	if (oldi->link_type =3D=3D OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
>  		return;
> =20
> +	WARN_ON(pm_runtime_get_sync(oldi->dev) < 0);
> +
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);

If pm_runtime_get_sync() fails and returns an error like -ENODEV, should
this function abort?

Proceeding to access hardware registers after a failure could trigger
asynchronous external aborts or kernel panics.

Does this also need pm_runtime_put_noidle() to drop the usage counter on
failure?

[ ... ]
> +static int tidss_oldi_probe(struct auxiliary_device *auxdev,
> +			    const struct auxiliary_device_id *id)
> +{
[ ... ]
> +	link_type =3D get_oldi_mode(node, &companion_instance);
> +	if (link_type =3D=3D OLDI_MODE_UNSUPPORTED) {

Looking at get_oldi_mode() which is called here, if the companion reg
property read fails or is out of bounds, it returns early but fails to call
of_node_put(companion).

Does this cause a device node reference leak?

[ ... ]
> +		oldi->serial =3D of_clk_get_by_name(node, "serial");
> +		if (IS_ERR(oldi->serial)) {
> +			ret =3D dev_err_probe(oldi->dev, PTR_ERR(oldi->serial),

The oldi->serial clock is acquired via of_clk_get_by_name() here.

Should there be a matching clk_put() in the probe error paths and in
tidss_oldi_remove() to prevent a clock resource leak?

[ ... ]
> +	if (link_type !=3D OLDI_MODE_SECONDARY_DUAL_LINK) {
> +		/* Register the bridge. */
> +		oldi->bridge.of_node =3D node;
> +		oldi->bridge.driver_private =3D oldi;
> +
> +		tidss->is_ext_vp_clk[oldi->parent_vp] =3D true;

The parent_vp value is parsed directly from the device tree's reg property
and used as an array index here.

Is a bounds check against TIDSS_MAX_PORTS (4) needed to prevent a potential
out-of-bounds write?

[ ... ]
> +static void tidss_oldi_remove(struct auxiliary_device *auxdev)
> +{
> +	struct tidss_oldi *oldi =3D auxiliary_get_drvdata(auxdev);
> +	struct tidss_device *tidss =3D oldi->tidss;
> +	struct device *dev =3D &auxdev->dev;
> +
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);

During driver unbinding, drm_atomic_helper_shutdown() calls
tidss_oldi_atomic_post_disable() which queues an asynchronous suspend via
pm_runtime_put_autosuspend(). Immediately afterward, this teardown logic
calls pm_runtime_disable().

Since pm_runtime_disable() cancels any pending asynchronous idle or suspend
work, will the OLDI hardware be left permanently powered on?

[ ... ]
> +static struct auxiliary_device *
> +tidss_oldi_create_device(struct tidss_device *tidss,
> +			 struct device_node *oldi_tx)
> +{
[ ... ]
> +	ret =3D auxiliary_device_add(auxdev);
> +	if (ret) {
> +		dev_err(tidss->dev, "OLDI auxiliary_device_add failed: %d\n",
> +			ret);
> +		goto err_uninit_auxdev;
> +	}

A managed device link is created between the consumer and supplier before
the consumer (auxdev) is registered. If auxiliary_device_add() fails, the
code jumps to err_uninit_auxdev which frees the auxdev.

Since the consumer was never successfully added to the system, the automatic
link cleanup via device_del() won't trigger.

Will this leave a dangling device link in the supplier's consumer list
pointing to the freed auxdev, resulting in a use-after-free when the
supplier is later purged? Would explicitly calling device_link_del() be
needed on this error path?

> +
> +	tidss->oldis[tidss->num_oldis++] =3D auxdev;

When adding the parsed child nodes from the device tree, is there a risk
that num_oldis could exceed the statically allocated TIDSS_MAX_OLDI_TXES (2)
array bounds if the device tree is malformed?

> +
> +	return auxdev;
> +
> +err_uninit_auxdev:
> +	auxiliary_device_uninit(auxdev);
> +	/* return here, as the rest are done in auxdev's release */
> +	return ERR_PTR(ret);
> +
> +err_free_auxdev:
> +	kfree(auxdev);
> +err_free_pdata:
> +	kfree(oldi_pdata);
> +err_free_ida:
> +	ida_free(&tidss_oldi_ida, oldi_aux_id);
> +
> +	return ERR_PTR(ret);
> +}

If auxiliary_device_init() fails, jumping to err_free_auxdev calls kfree()
directly on the device structure.

Does bypassing put_device() skip the release callback
(tidss_oldi_aux_device_release) and permanently leak the OF node reference
acquired earlier?

Also, if auxiliary_device_init() internally calls put_device() on failure,
could these explicit kfree() and ida_free() calls in the error path trigger
a double free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-beagley-ai=
-display-v2-0-9e9bcefde6bc@ideasonboard.com?part=3D12
