Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761239B97B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696047; cv=none; b=UyLp0SKFubDmTAxpII9LwzHSkmLxrRBsufOMfkcsrEtAlFGAYvEfb96kZ6FdnCDepMFyyDAXcmnVS+57cgLV7nlfw8x1RmVRCan7hjxVpLrsh9+wAcZaXYk1Uy0AFN8dagp1vWC3Z7t38658n5P1quT6LvOt/zm5csF7OUIxRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696047; c=relaxed/simple;
	bh=qBQELusRmG9Yscj7iC95oBL79auup4sCMryt2Qurgwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uiZWCwJ/ajkJRz4qbg6cEfVoJEscMAUPYP8JH75ntjaiJ2ObY6bYpzvHYasI7Z/KrUmUdhifDIzwsoNg+mY5Epoy2SPAdztWWeiJn8dECMIOjHg3qJvz8DoxBqcV/ZVM9Ylfr8R2EZyEFwqFh6KIhIlHh/aijeNd9QrP2eAmP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/wT5a5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/wT5a5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E09E1F000E9;
	Mon, 25 May 2026 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696045;
	bh=SftmvclXIuVxaFEbe8fYfFAx8ZJfTLRXX240VxOUfAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/wT5a5IfRPLy8wtG56Cve+zpTw4Hm0Ym/rih4hQeOJ7GKSoZnxP/CBUofpKppmwa
	 e3oCH0o6HhVAjNLnILX51L3wmlWwF5m5WT1fJomAN3nmQ4WaHyfpDuJDttp63z1qe5
	 OEwgdoFc2PnFEEr3U+jgZ8df003sjJupFl9tHmATCovJjPBAlBXqjFOxsska2V49rJ
	 eE15b+9YwgpwdOOgDqF6L72Pc+gdIEFNGNCt6wY003GfPusGvC1b9dgvxld+oLNFG1
	 U4bvGlJKB1YXkd78aeDjX+vgnNC1tfITTWZpb32Xb+0hVQ+HEtqnvj5DmybVukJ3y+
	 HznTZvpRr0nWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/9] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-4-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:00:44 +0000
Message-Id: <20260525080045.6E09E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect logic and API contract violation in `i3c_master_suppor=
ts_ccc_cmd()`.
- [Medium] `i3c_master_direct_attach_i3c_dev_locked()` incorrectly returns =
`-EINVAL` for devices without addresses.
--

commit e1382a24562500ebcc8529e9a5fff3016b719a36
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

This commit adds helpers for attaching and detaching I3C devices, as well as
helpers to check CCC support and send CCC commands. These additions prepare=
 the
subsystem for I3C hub support.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ec3547f75469e..4f0565faa182f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> +/**
> + * i3c_master_direct_attach_i3c_dev_locked() - attach an I3C device to a=
 master
> + * @master: I3C master controller to attach the device to
> + * @dev: I3C device descriptor representing the device
> + *
> + * This function attaches an I3C device to its master controller once the
> + * device has a valid address on the bus. Devices without an assigned ad=
dress
> + * are ignored. The master device itself is never attached through this =
bus.
> + *
> + * Context: Caller must hold master->bus.lock in write mode.
> + *
> + * Return: 0 on success, or a negative error code if the attach operation
> + *         fails in the master controller driver.
> + */
> +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller=
 *master,
> +					    struct i3c_dev_desc *dev)
> +{
> +	int ret =3D 0;
> +
> +	/*
> +	 * We don't attach devices to the controller until they are
> +	 * addressable on the bus.
> +	 */
> +
> +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> +		return -EINVAL;

[Severity: Medium]
The documentation for this function states that "Devices without an assigned
address are ignored." However, this code returns -EINVAL instead of 0.

Looking at the internal i3c_master_attach_i3c_dev(), it returns 0 to safely
ignore unaddressed devices until they acquire an address. Should this new
helper also return 0 to match both its documentation and the subsystem's
existing convention?

> +
> +	/* Do not attach the master device itself. */
> +	if (master->this !=3D dev && master->ops->attach_i3c_dev)
> +		ret =3D master->ops->attach_i3c_dev(dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);

[ ... ]

> +/**
> + * i3c_master_supports_ccc_cmd() - check CCC command support
> + * @master: I3C master controller
> + * @cmd: CCC command to verify
> + *
> + * This function verifies whether the given I3C master controller suppor=
ts
> + * the specified Common Command Code (CCC).
> + *
> + * Return: 0 if the CCC command is supported and executed successfully,
> + *         -EINVAL if arguments are invalid,
> + *         -EOPNOTSUPP if the master does not support CCC commands,
> + *         or another negative error code from the master's operation.
> + */
> +int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				const struct i3c_ccc_cmd *cmd)
> +{
> +	if (!cmd || !master)
> +		return -EINVAL;
> +
> +	if (!master->ops->supports_ccc_cmd)
> +		return -EOPNOTSUPP;
> +
> +	return master->ops->supports_ccc_cmd(master, cmd);
> +}

[Severity: Medium]
Does this function's logic and return value match its documentation and the=
 I3C
subsystem semantics?

The docstring states it returns 0 if a command is supported, but it actually
returns the boolean result of the supports_ccc_cmd callback (1 for supporte=
d,
0 for unsupported). A caller checking for 0 as success would incorrectly tr=
eat
supported commands as unsupported.

Additionally, if the callback is absent, this returns -EOPNOTSUPP. However,=
 in
other places like i3c_master_send_ccc_cmd_locked(), the core I3C logic assu=
mes
all commands are supported if the callback is NULL. Could returning -EOPNOT=
SUPP
here falsely indicate no commands are supported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D3
