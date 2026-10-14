Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769923CAA53
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014276; cv=none; b=tHI+aIO+KGETd6JCfUpqSKrEDqgVnL3otuxlvu8gNya0LhctDC+wZybv/QwaM2PeRNOX4wYj+ql9V/2HABy6t91dzHxCiBvaTnMJYbWdtbJU4bAu0A3FiX0JdacuSRHQx6XdhNNfl2YQuyAs/cNnCkzkS3D+wJ0lTEGQkbrnulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014276; c=relaxed/simple;
	bh=Fys/sqduwVxTImrSSfWy1D83zZ2ZdXf7nFXWu7MatpA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CCiQcEvzSmcQr85oJK4xyQ0HPb1wkl3PtGMja7QoqqM6CXawztnHAT4ntJEIESzS3PH/ZApnavj5lGlKOppfDQJmT9RrbFGgfTJcgeJ8MIENlBeH7srFu0yBWPDg86z7zShZYc/YbBzKjuZ5kar1wIJhh2c8aXZ12a626zRNxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7dE7opl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7dE7opl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C8C1F000C4;
	Wed, 14 Oct 2026 21:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014275;
	bh=BRVEGgSMXbstm8txWvBxNgZg5bl9/pO7gKWLzeibdLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e7dE7oplwJFlpmzd5VNdTV18LCAtFxbOD98mxbo8QKSbJ1WhXJMf2AYS1zgafnNPX
	 oIt7iF3zNyZrltISVpTJ7OYkSvq2dhppIci2kTLfJrIfK8c5oP2CUpk02AUFqO6iiO
	 vARR7lI9lFGrQgbwYKubPI/7IzE0HBCOnaTGY2c2aqXwynUTApefAUV+F3UUYOb1Y2
	 IHbn2JyHiRMtziiuW1RZxanGLhhUTc/Fa2fBXZLtVpy+2bDF1jpsz9OLq+cLh9+k0h
	 vXwKKss5Okm+vt8pUK2je+S6z/vbrBuHEHctGfw3gJoQZjIafTTKszQE4kFzFm9JLO
	 syz0zXeQ5IB+Q==
Message-ID: <sashiko-outbox-171935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014213426.2957480-3-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:44:34 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: amd_mbv_bram: returning error from stop() leaks resour=
ces during unbind
--

commit a451b1daadf4b577c725f4374022e1394373deee
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL reconfig

Partial reconfiguration of the programmable logic restores the AXI GPIO
that drives the soft-core reset to its hardware default direction, but
gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
then only updates the data register, so the processor never sees a
reset transition: remoteproc reports it as running while the newly
loaded firmware never starts.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index 6cf33c7b7e641..da621f62f7df5 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
[ ... ]
> @@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  	struct amd_bram_rproc *priv =3D rproc->priv;
>  	int ret;
> =20
> -	/* Assert reset before disabling the processor clock. */
> -	ret =3D gpiod_set_value_cansleep(priv->reset, 1);
> +	/* Restore the output direction after DFX and assert reset. */
> +	ret =3D gpiod_direction_output(priv->reset, 1);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
>  	}
> =20
>  	/* Disable clock after asserting reset */
>  	clk_disable_unprepare(priv->clk);
> =20
>  	return 0;
>  }

[Severity: High]
Does this error path bypass local clock teardown and cause the core remotep=
roc
to abort its cleanup?

If gpiod_direction_output() fails in amd_bram_rproc_stop() during device un=
bind
or module removal, it returns an error. This propagates to __rproc_shutdown=
():

drivers/remoteproc/remoteproc_core.c:__rproc_shutdown() {
	...
	ret =3D rproc_stop(rproc, crashed);
	if (ret) {
		atomic_inc(&rproc->power);
		goto out;
	}

	/* clean up all acquired resources */
	rproc_resource_cleanup(rproc);
	...
}

This causes __rproc_shutdown() to abort early and skip rproc_resource_clean=
up().

Since rproc_del() proceeds unconditionally:

drivers/remoteproc/remoteproc_core.c:rproc_del() {
	...
	__rproc_shutdown(rproc, true);

	rproc_delete_debug_dir(rproc);
	...
}

the error from __rproc_shutdown() is ignored.

Can this result in the rproc object and driver memory being freed by devm
while leaving the clock enabled, core remoteproc resources (carveouts,
IOMMU mappings, trace files) leaked, and any local mailboxes/works uncancel=
led?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014213426.2957=
480-1-ben.levinsky@amd.com?part=3D2
