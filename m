Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9743498B
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832979; cv=none; b=i2j9pFVBLwkE1F4LhcF4cZ9IvpB9TLwRDJKUYeIWtddAA6Cx0vKZQ7i63+zuwcFp5ufPp8SREK82KTsJaVzauEGvYjjKwl04qQKvm/7PVHHst/C3babl2Iz1vo3jHq2n/F/6EI5NaDoJ3gSbXU+R6/fkAe9loUHUf+usJgMjs7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832979; c=relaxed/simple;
	bh=5XZP80neEk9guMP/JjbaU+dKgm/5T7xas547TYTg2p8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZpsXIzyFNJOUWxCcmEfB7mc+Wgc9HOWv/LodQRkbS1bXBdwVTmtdQy506e9e1AaSYNIsNZcbntB5MD5SgPT39RsvD4nJT0K7KvZfmiUXke7ADvWWTxODIX2ggagy4qQzjFY+R5aHgTXncETejXvAaFHYj+awFtBxksEGgq84gn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NozXq6mL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NozXq6mL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21221F000FF;
	Thu,  1 Oct 2026 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832978;
	bh=EYiybnIhyuwuZwHkh0PQ2KZ0fa21XVWerwYZ7vCWTaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NozXq6mLCHM5gaCzCc4EJLr+IOASAh+OLL893gqaqPN0+qS6EgU3WHfSAcCjGYfow
	 0puTj87MIP3vwZwPDaDj4ezu0xBKDLgUaSVRuuoLOGK8v/S/6nSEFPX68OpWYEGfLG
	 Gjlq38WKxE1htz+eex5FwEHQIrIEBc5f/wF74VBMlvkJWQ4+1OOJ6x3rTcBePuItxv
	 2NMOiapC6GjjumQTdPHMYgW/N5yTfgeGmDueFZZ9QOTftBst+L6TbgDyaZHo7Q6byl
	 HNYojU9VWNKtfOaWnc6xmfqWvMdzaL+vQP0gcYz326nH2XEXgWMuDpcbUpmhb2JdO3
	 2v6xgqlBiGEiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/14] gtrace: Add functions to start/stop tracing on
 a component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001052243.3042627-6-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-6-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:36:16 +0000
Message-Id: <20261001053617.D21221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gtrace: UAF in comp_start/stop due to missing module/device locks
--

commit ed6a9060977521b7cc68908d59a7104ec2d2492f
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add functions to start/stop tracing on a component path

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index f750025104ec9..d7f1df90aa31d 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c

[ ... ]

> @@ -611,6 +621,100 @@ static void gtrace_release_path_nodes(struct gtrace=
_path *path)
>  	}
>  }
> =20
> +static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owne=
r)
> +{
> +	struct gtrace_comp_priv *cpriv =3D to_gtrace_comp_priv(comp);
> +	const struct gtrace_driver *gtdrv =3D to_gtrace_driver(comp->dev.driver=
);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	if (!gtdrv)
> +		return -ENODEV;
> +
> +	raw_spin_lock_irqsave(&cpriv->lock, flags);

[Severity: High]
Does this lockless driver check create a race with device unbind?

If a privileged user writes to a component's sysfs unbind file or unloads
its module while perf tracing is active, the driver core calls gtrace_remov=
e()
and sets comp->dev.driver to NULL.=20

If __gtrace_comp_start() is concurrently called from perf_event_start() in
IRQ context, it could fetch the driver pointer here locklessly just before
it is cleared.

> +	if (cpriv->start_count) {
> +		if (cpriv->owner !=3D owner) {
> +			ret =3D -EBUSY;
> +			goto out;
> +		}
> +	} else {
> +		if (gtdrv->start) {
> +			ret =3D gtdrv->start(comp);

[Severity: High]
Could this result in a use-after-free or a panic?

If the race described above occurs, the cached gtdrv pointer might now
point to a freed structure or unmapped driver text, causing a panic when
this callback is invoked inside the lock.

> +			if (ret)
> +				goto out;
> +		}
> +		cpriv->owner =3D owner;
> +	}
> +
> +	cpriv->start_count++;
> +out:
> +	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
> +	return ret;
> +}
> +
> +static int __gtrace_comp_stop(struct gtrace_component *comp)
> +{
> +	struct gtrace_comp_priv *cpriv =3D to_gtrace_comp_priv(comp);
> +	const struct gtrace_driver *gtdrv =3D to_gtrace_driver(comp->dev.driver=
);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	raw_spin_lock_irqsave(&cpriv->lock, flags);

[Severity: High]
Does this have the same race as __gtrace_comp_start()?

The driver pointer is cached locklessly here as well, exposing the stop
callback to a race with driver removal.

> +	if (!cpriv->start_count) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	cpriv->start_count--;
> +	if (!cpriv->start_count) {
> +		if (!gtdrv) {
> +			ret =3D -ENODEV;
> +			goto out;
> +		}
> +
> +		if (gtdrv->stop)
> +			ret =3D gtdrv->stop(comp);

[Severity: High]
Could this trigger a use-after-free during the stop path?

If the driver has been removed and the structure freed, calling this
potentially freed stop callback could crash the kernel.

> +	}
> +out:
> +	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D5
