Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC273C3C12
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695238; cv=none; b=kcv225lWnKySevDwsBrxHeFVusBxcDomoc+KE+g7b7nwRfbzBiaRd4lpLBnrzsK56vlO3uHCT8/GmlhGGU2WfiGXY8/b1zjU+6anRr07Z0xzhhPvxhXVErRTDDDgtPG+33I+FLBvtabFD+xMF3qS4kDD144O3g/9zH5Q+yfk/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695238; c=relaxed/simple;
	bh=9vYUGIgL01EGHznHXpCmrtb6nC9Bc+bgd4gbL1Jupwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j7YuxKZSDcB2BNALs2BtNWhWwsCNZadOFIz8ZyrbfEUFKzrSCkAXBcRDlc57UWo4JKYDKqGMBSxKpgQb4bwtZS3eANk5PbUVi4/xa2MFVPiSntUTev3TYb38ArJ2pYtWdska3MD3zSET3i3YCZ0kczO4mkWBt18U048Na45Sq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnpsj+m3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnpsj+m3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E7E1F000E9;
	Wed, 17 Jun 2026 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695235;
	bh=WbxMju9GXBYWJNUnBM2TXXge8Fo+iRDCAPgMB2mSLEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dnpsj+m3MHU5cl4nrCBem1poe94PdcP4REkBLctvjAIu90nPtQG1ZlQa7G2hW6KGN
	 VAKooXceLPdEcloSV/ZIksbW+53hj2V4G5YSM+Adj+TZzLnuJFEiX9GGTWA7wvxFEz
	 9Cjl0VNdQI9azpd29SmUIXam3XVFyTgmORR6k50hr0uITeDHuUnmrSdEFa3ZsGuHqx
	 ZXtdVThSFA2Slwryw5+RLXW+zMpS6RY8DULN4pSiSC8XgrhxGdubIVF0PvMXXTo25J
	 yFcySoWWzq43XuE5gPwxsifm7Q7W1AD1Orfp9uL6XFwVap7/hQntvyoe++3mvPPVmg
	 ispMmojdI4qTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/7] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617110355.1591844-2-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:20:35 +0000
Message-Id: <20260617112035.86E7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Bypassing core state tracking in `direct_attach` / `direct_det=
ach` causes Use-After-Free, NULL pointer dereferences, and Memory Leaks.
- [High] Bypassing address slot reservation in `direct_attach` leads to unr=
ecoverable I3C bus address collisions.
--

commit ce08f4a6bc0d82c966d4e3337e6b4d082a9d09d2
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

This commit introduces helper functions for attaching and detaching I3C
devices, alongside CCC command helpers. These additions prepare the core
framework for handling I3C hubs.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1775,6 +1775,70 @@ static int i3c_master_attach_i3c_dev(struct i3c_ma=
ster_controller *master,

[ ... ]

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
> +		return 0;
> +
> +	/* Do not attach the master device itself. */
> +	if (master->this !=3D dev && master->ops->attach_i3c_dev)
> +		ret =3D master->ops->attach_i3c_dev(dev);

[Severity: High]
Does bypassing address slot reservation here lead to I3C bus collisions?

In the standard attachment flow, i3c_master_get_i3c_addrs() is called to
reserve the address slot in the controller's bus.addrslots bitmap. Because
this direct helper skips that reservation, the parent controller's address
map is never updated to reflect the newly occupied address.

Since the parent controller and the virtual hub share the physical I3C bus,
the parent might still believe the downstream device's address is free. If
a new device hot-joins, could the parent controller allocate the exact same
address, resulting in an unrecoverable address collision?

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
> +
> +/**
> + * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from=
 its
> + * master controller.

[ ... ]

> +void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> +
> +	/*
> +	 * We don't attach devices to the controller until they are
> +	 * addressable on the bus, so skip detach for unaddressed devices.
> +	 */
> +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> +		return;
> +
> +	/* Do not detach the master device itself. */
> +	if (master->this !=3D dev && master->ops->detach_i3c_dev)
> +		master->ops->detach_i3c_dev(dev);

[Severity: Critical]
Can this lead to a use-after-free or a NULL pointer dereference by bypassing
the core state tracking?

When i3c_master_direct_detach_i3c_dev_locked() invokes the controller's
detach callback, master drivers typically free the master_priv data. Howeve=
r,
the dev->common.master_priv pointer is never cleared here.

If i3c_hub_free_ibi() calls this detach helper, and later a transfer is sent
via i3c_hub_master_priv_xfers():

drivers/i3c/hub.c:i3c_hub_master_priv_xfers() {
    ...
    xfer_ret =3D i3c_master_priv_xfers(dev, xfers, nxfers, mode);
    ...
}

Will the parent controller end up dereferencing the freed master_priv
pointer?

Additionally, if a device is never explicitly attached via the direct helper
(leaving master_priv NULL), would a standard transfer immediately cause a
NULL pointer dereference when forwarded to the parent driver?

> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D1
