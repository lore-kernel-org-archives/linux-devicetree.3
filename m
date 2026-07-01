Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526328C2BF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890552; cv=none; b=p3lCJSMGuND19QaWMBWU/aiudQICYjR4e3tRXARNn5pnlYypNHrFoWP93yUUkXYNUAhLBFqU8/IBcmisbtshU/wFuRqzZNGYefEUmZ0dgzIbMaoaYwHGbjbm9/yVeRQxBApk9BPIrn56U1/i7j3suUZjjdY+36HV3drS77JiHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890552; c=relaxed/simple;
	bh=XKKchn2s4Da+uduqrJgT4WOKwuUkrCE3MIpQeQbnnQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NO5ZJHjVnUItJEdXOaKIy4WjDhW4m8qmni0EXazMdvsvCGo3a8b9YkB73Ds1sUBVXE24HoGMZW4/xfNGcELthRur7k1Fbq9RWWJ09ODVG+SbxVel6wRmSKqBwjFc+KVb2xqVhGopVweiDRi7OsvM54YONbV+jz8ckzkmWDYISwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+AcYtxA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+AcYtxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06F81F000E9;
	Wed,  1 Jul 2026 07:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890551;
	bh=0rPWLZ4hP6kj5Ck76jfvaSBbSH60lUpNKw6hJ2CR/Sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+AcYtxAT7WMpsmy7r8cDvMR1PW3y32uBekiYdlTL3/oP0uRPNHEOUoS6cBztx33y
	 aRm4OWvIZt3SB24oBuaKk72uDrR2sIgKwXrwfS3l+CCNofB5gATErWcm1fF4yF3pNl
	 tBSohVijP8XJXiZmC7jZUyFnCBhIZw9eNW4oTUnpSqOBqlV/LR+Kr+uGakzBuGfaFG
	 L3S7MDQSHoubwKoJIayzeraBaxHWp365WAzKnHnG0i1rl/uANzfE++QEn/Q3e/Txf3
	 h3otE+2ZUt/D67ZcwXBQQYFznFCWQyyUKJY6g1gzITusqwhdBjy6Bh8EPQIBuvkzXX
	 nDuVZPoJpe7HQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/7] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
In-Reply-To: <20260701065755.2067793-2-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:22:30 +0000
Message-Id: <20260701072230.F06F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Exported APIs interact with controller hardware without taking a R=
untime PM reference.
- [Medium] `i3c_master_supports_ccc_cmd` incorrectly returns true for maste=
rs that do not implement CCC command sending.
--

commit b5579dc49beffe04e3498fcfb290372e74bd88f0
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

This commit adds helper functions for attaching and detaching I3C devices,=
=20
checking CCC support, sending CCC commands, and managing address slot state=
s.=20
These additions prepare the subsystem for I3C hub support.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..3e7b7f7f97cfb 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -1775,6 +1790,83 @@ static int i3c_master_attach_i3c_dev(struct i3c_ma=
ster_controller *master,
>  	return 0;
>  }
> =20
> +/**
> + * i3c_master_direct_attach_i3c_dev_locked() - Attach an I3C device to a=
 master
[ ... ]
> +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller=
 *master,
> +					    struct i3c_dev_desc *dev)
> +{
> +	int ret;
> +
> +	if (WARN_ON(i3c_dev_get_master(dev) !=3D master))
> +		return -EINVAL;
> +
> +	ret =3D i3c_master_get_i3c_addrs(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Do not attach the master device itself. */
> +	if (master->this !=3D dev && master->ops->attach_i3c_dev) {
> +		ret =3D master->ops->attach_i3c_dev(dev);

[Severity: High]
Should this function call i3c_master_rpm_get() to take a runtime PM
reference before invoking the controller's attach_i3c_dev callback?

Since the I3C subsystem sets pm_suspend_ignore_children(&master->dev, true),
maintaining an active runtime PM reference on the hub device does not
automatically resume the parent controller. If an I3C hub calls this on a
parent master that is runtime suspended, accessing the hardware registers
could lead to bus faults or hangs.

> +		if (ret) {
> +			i3c_master_put_i3c_addrs(dev);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
> +
> +/**
> + * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from=
 a master
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

[Severity: High]
Similar to the attach path, does this detach callback require the parent
master to be resumed?

If the parent controller is runtime suspended, invoking detach_i3c_dev
without first taking a runtime PM reference might access suspended hardware.

> +
> +	dev->common.master_priv =3D NULL;
> +	i3c_master_put_i3c_addrs(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
[ ... ]
> @@ -2548,6 +2640,50 @@ static void i3c_master_reconcile_dyn_addrs(struct =
i3c_master_controller *master)
>  	}
>  }
> =20
> +/**
> + * i3c_master_supports_ccc_cmd() - check CCC command support
[ ... ]
> +bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				 const struct i3c_ccc_cmd *cmd)
> +{
> +	if (!master || !cmd)
> +		return false;
> +
> +	if (!master->ops->supports_ccc_cmd)
> +		return true;

[Severity: Medium]
Is it safe to default to true without verifying that the controller
actually implements master->ops->send_ccc_cmd?

If a controller lacks send_ccc_cmd, it does not support sending any CCC
commands. The core will return -EOPNOTSUPP in i3c_master_send_ccc_cmd_locke=
d(),
but returning true here might cause a hub controller to falsely advertise
CCC support for its downstream devices.

> +
> +	return master->ops->supports_ccc_cmd(master, cmd);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
> +
> +/**
> + * i3c_master_send_ccc_cmd() - send a CCC command
[ ... ]
> +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> +			    struct i3c_ccc_cmd *cmd)
> +{
> +	int ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret =3D i3c_master_send_ccc_cmd_locked(master, cmd);

[Severity: High]
Does this function need to take a runtime PM reference before calling
i3c_master_send_ccc_cmd_locked()?

Like the attach/detach helpers, if an I3C hub calls this on a parent master
that is suspended, this could lead to hardware access while suspended.

> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701065755.2067=
793-1-lakshay.piplani@nxp.com?part=3D1
