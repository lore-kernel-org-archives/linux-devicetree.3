Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE53F58E1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417317; cv=none; b=HCRmGywFImTQjjDRk2ZJf0B1kOtOoqZVTIa6CNGfW9STRByTSiM9iToKiBaFIBygNTqlUPBJNfB/IuFmRePQC3zThgnQQn74VT4qntJpIn7U9JErgLZUdu7GQ/le7NVXgM+MdQB6+3yNmw1Gr2xXTwhq3pL2RI/gYhebULq0Tso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417317; c=relaxed/simple;
	bh=rJvi01MSGht64d3cBSKergPPmEZFfACCFJvta8vgz1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=msH3WIe3A0jsfeUEsHJLpWeFOom/LBpIFr76CUlY/G2QjYWiEqIEvTxuv+OTm1KbzC5xK4klsv2JrJv4gzY4bqArSMal6Fx7ozBGYEQBJanFc8Hu+gtQFcK564AR7x6/gtIob5iixtuJJE4aqzHjrHjm7luHlMUXmJag4g5yYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQrSWHeD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQrSWHeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF281F000E9;
	Thu,  3 Sep 2026 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417311;
	bh=2fkMejoRIn0FVs3ej9j8Sp6cKhm0yJ2RBrixdCM2AZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQrSWHeDfaJGX58A1A0Ceg+TOyIkUqZLxnpdnaNuJ5PKMLc4Gbevs80LRiAJ4/jZI
	 ngVgC80otjyco3NYp85Aqsgudl6LjT/4ASJGvJig1crJ0DGbRANOaQVVaIt4tzYhze
	 7n+KjVbLFC8f+9Qr5GP7G0TjA9B1YoALQ5RW5mqeW5KyzqLGGjBwKEDlbSO2wnmYcn
	 /F4S7FXKHI2CwgBybA6Gl1cvC/BjhHVktyMNuD+zMsxDFIaaOzxi3QMBDiOrXnrxqH
	 L5SAscGlVJbC0bLWal3WAT6g0s4PAH1B0eulntEtVLqRhx97K4PXHzHOKXhi/qs7ei
	 Z0dCghN9RRTOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/8] i3c: master: Add controller-only device
 operation helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260903062108.2712296-3-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:35:10 +0000
Message-Id: <20260903063510.5DF281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing memory barrier between `reinit_completion` and `atomic_rea=
d` can lead to an indefinite hang.
- [High] Use-after-free of `dev->ibi` and generic IBI pool if the controlle=
r fails to disable IBI.
- [High] Device address state corruption and resource collisions if reattac=
h callback fails.
--

commit 6b2a9825b802ec5c65a800ad2b66b3cd53a9d304
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

    i3c: master: Add controller-only device operation helpers
   =20
    The generic I3C device attach and IBI paths perform both core-level
    bookkeeping and controller-specific operations. An I3C hub, however,
    maintains a logical device descriptor on the virtual downstream bus and
    a separate parent-facing descriptor used by the physical parent
    controller.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9ea4726495ff6..b864fcbb1a594 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -1958,25 +2005,39 @@ int i3c_master_reattach_i3c_dev_locked(struct i3c=
_dev_desc *dev,
>  						     I3C_ADDR_SLOT_FREE);
>  	}
> =20
> -	if (master->ops->reattach_i3c_dev) {
> -		ret =3D master->ops->reattach_i3c_dev(dev, old_dyn_addr);
> -		if (ret) {
> -			i3c_master_put_i3c_addrs(dev);
> -			return ret;
> -		}
> +	ret =3D i3c_master_reattach_i3c_dev_controller_locked(dev, old_dyn_addr=
);
> +	if (ret) {
> +		i3c_master_put_i3c_addrs(dev);
> +		return ret;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but on this error path, if the
reattach fails, we free the bus addresses by calling
i3c_master_put_i3c_addrs(dev), but we leave the device attached to the
master->bus.devs.i3c list.

If callers ignore the return value of the reattach function, couldn't this
physical device remain on the bus list while its address is marked as FREE,
leading to address collisions on the I3C bus during subsequent device
hot-joins or discoveries?

[ ... ]
> @@ -3963,14 +4072,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
>   */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
> -	struct i3c_master_controller *master;
>  	int ret;
> =20
> -	if (!dev->ibi)
> -		return -EINVAL;
> -
> -	master =3D i3c_dev_get_master(dev);
> -	ret =3D master->ops->disable_ibi(dev);
> +	ret =3D i3c_dev_disable_ibi_controller_locked(dev);
>  	if (ret)
>  		return ret;
> =20
> @@ -3984,6 +4088,32 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc=
 *dev)
>  }
>  EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);

[Severity: High]
This is a pre-existing issue, but missing memory barriers in this function
can lead to an indefinite hang.

i3c_dev_disable_ibi_locked() calls:

	reinit_completion(&dev->ibi->all_ibis_handled);
	if (atomic_read(&dev->ibi->pending_ibis))
		wait_for_completion(&dev->ibi->all_ibis_handled);

Because there is no memory barrier (such as smp_mb()) between
reinit_completion() (a non-volatile store) and atomic_read() (a volatile
read), weakly ordered CPUs could reorder the load of pending_ibis to execute
before the store to done.=20

If this happens, could this cause CPU 0 to sleep in wait_for_completion()
forever if CPU 1 completes the last IBI before CPU 0 commits done =3D 0?

[ ... ]
> @@ -4096,7 +4279,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *d=
ev)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
> =20
> -	master->ops->free_ibi(dev);
> +	i3c_dev_free_ibi_controller_locked(dev);
> =20
>  	if (dev->ibi->wq) {
>  		destroy_workqueue(dev->ibi->wq);

[Severity: High]
This is a pre-existing issue, but this error path seems to unconditionally
free the IBI structures even if the hardware is still active.

In i3c_dev_free_ibi_locked(), if the controller fails to disable IBIs:

	if (ret)
		dev_err(&master->dev, "Failed to disable IBI before freeing\n");
    }

	i3c_dev_free_ibi_controller_locked(dev);

	if (dev->ibi->wq) {
		destroy_workqueue(dev->ibi->wq);
		dev->ibi->wq =3D NULL;
	}

	kfree(dev->ibi);

Because the hardware interrupt might still fire if disabling fails, couldn'=
t=20
a concurrent interrupt handler try to queue work to the destroyed
dev->ibi->wq, resulting in a use-after-free and potential kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D2
