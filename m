Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C837FF76
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014353; cv=none; b=RuoLze19UU4lIKGF6VVSMyYEX1s5dpYAhOdhtspKtUWINPMuwiDdgpSCqHgwCSkBF+y9Wf4vQ0jIAFB0DfKcVqJ6SC6w5TGClgm45E5DFIdAYN/2sq6XTlv2pDGsKYqyD8lnJohAMj7cAO6NKFTeLqBK9igYemDgGeE70GwXzUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014353; c=relaxed/simple;
	bh=SClEtZZN52i5pxpz2CP7Q2JaCH3CgSAaoozV9SwbV9M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EWC+80PYXBNmFy3UnVO7DFErH9Iys5mXhi1cwssexvfXGvm+XwUYjyf/qzqU41pYWFxCQgmQFf+CNTWE1r+6KdKPU3MHkTp7UbUk9BJ4LFYdtEoG3dkKdBBX50rXLxAQ1BjUG1fDTZ9JDltKpu1JEnGHyuYHmMhKurpgPWNYXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cko6fYJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cko6fYJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530A41F000C5;
	Wed, 14 Oct 2026 21:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014351;
	bh=4TAq9lAacQ5dKgDXrk5zMwwo67UaHxGUvVLkHQEeHMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cko6fYJKIPL3OfsjC874UFx1vTmWsBGDSvEXK0g26zzL2ULdNy+VS1mgCewYaPHEk
	 CZEJUCBPCFFO+FYVMh8TYvJjyM7v/drApsnzHMd95+ioQCMuaWtrQaueQ0FkY8Vw7L
	 QWls/tD+aKHgHL9BZaCcMz5y5rsxcyY/tLe8Ayx4IWokQ4x7DPyA5CMPhIKb4JwsGk
	 2MpbNDC651JplGISjyvnNV+QdiJR5sJ2WIR03weVga+Nn6JdbWDdRnuVwiF50EF+2x
	 qUn9q+LUDtm9CcqwjN9scYHuY+Ub0eB9EfGvHtcv2MpeTmUQkbhXWtH1eIXG0opMTY
	 XWF2Y/gckI5iw==
Message-ID: <sashiko-outbox-171937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014213426.2957480-7-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-7-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:45:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] remoteproc: UAF due to flawed rx_work teardown and early returns
- [Medium] remoteproc: memory leak of carveouts on prepare() failure
--

commit ef18a056105c5574bbf373609a1d2b4aa260576f
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Add RPMsg support

This commit adds RPMsg support to the AMD MicroBlaze/V BRAM remoteproc
driver. It registers named reserved-memory carveouts and maps them for
virtqueues. It also introduces mailbox support to send and receive
virtqueue notification IDs.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index da621f62f7df5..65d2c3946325e 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
[ ... ]
> +static int amd_bram_rproc_add_reserved_mem(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv =3D rproc->priv;
> +	struct device_node *np =3D priv->dev->of_node;
> +	struct rproc_mem_entry *mem;
> +	int count;
> +	int ret;
> +	int i;
> +
> +	if (!of_property_present(np, "memory-region"))
> +		return 0;
> +
> +	count =3D of_reserved_mem_region_count(np);
> +	if (count < 0)
> +		return count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct resource res;
> +		const char *name;
> +
> +		ret =3D of_property_read_string_index(np, "memory-region-names",
> +						    i, &name);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to read memory-region name %d\n",
> +					     i);

[Severity: Medium]
In amd_bram_rproc_prepare(), resources are added to rproc->carveouts and
rproc->dump_segments before returning a call to this function.

If an error occurs in this loop, the function returns the error early.

The remoteproc core's rproc_fw_boot() handles a failure from ops->prepare
by explicitly bypassing the clean_up_resources label, which means
rproc_resource_cleanup() is never called.

Does this permanently leak any rproc_mem_entry and rproc_dump_segment
objects added before the failure occurs? Retrying the boot might also append
duplicate entries to the lists. Shouldn't the driver clean up its own
carveouts on error, or rely on rproc_resource_cleanup() before returning?

[ ... ]
> @@ -80,7 +279,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  	rproc_add_carveout(rproc, mem);
>  	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> =20
> -	return 0;
> +	return amd_bram_rproc_add_reserved_mem(rproc);
>  }
> =20
>  static int amd_bram_rproc_start(struct rproc *rproc)
> @@ -111,10 +310,17 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>  	/* Hold reset asserted long enough to provide a clean reset pulse. */
>  	usleep_range(10, 20);
> =20
> +	ret =3D amd_bram_rproc_request_mboxes(priv);
> +	if (ret) {
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}
> +
>  	/* Deassert reset and let the processor run. */
>  	ret =3D gpiod_direction_output(priv->reset, 0);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
> +		amd_bram_rproc_free_mboxes(priv);
>  		clk_disable_unprepare(priv->clk);
>  		return ret;
>  	}

[Severity: High]
If gpiod_direction_output() fails here, amd_bram_rproc_free_mboxes() is
called but cancel_work_sync(&priv->rx_work) is missing.

Could any work scheduled by a mailbox interrupt between request and free
remain queued? If it executes later, could it access the freed priv pointer
and cause a use-after-free?

[ ... ]
> @@ -133,6 +339,10 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
>  	}

[Severity: High]
If gpiod_direction_output() fails, this returns early without cancelling the
workqueue or freeing the mailbox channels.

Since the core rproc_del() ignores the stop error and frees the rproc and
priv structs, wouldn't this leave active mailboxes and workqueues pointing
to freed memory?

> +	cancel_work_sync(&priv->rx_work);
> +	bitmap_zero(priv->pending_notify_ids,
> +		    ARRAY_SIZE(priv->notify_msgs));
> +	amd_bram_rproc_free_mboxes(priv);
> =20
>  	/* Disable clock after asserting reset */
>  	clk_disable_unprepare(priv->clk);

[Severity: High]
Since cancel_work_sync() is called before freeing the mailboxes, the
mailbox interrupt is still active.

Could an incoming notification trigger amd_bram_rproc_rx_callback() and
reschedule the work right after it was cancelled, leading to a
use-after-free on driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014213426.2957=
480-1-ben.levinsky@amd.com?part=3D6
