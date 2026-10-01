Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B183815D8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833081; cv=none; b=NsAMb3MBQmemIbSVzLFiUKppjxWWY03PUNTeT1NB0bq4uyli/4S+tSXJwDox3wappv0ATf50NkDJ0WCkesPyh/pRjTPytdLGjTqk6mnRVNaHsXjdWgzGoHHuYIUMc5pSKqAdnZELlmBCKjRJfnACwgL/BVn1vuKlNMbARTzHjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833081; c=relaxed/simple;
	bh=34qEvQhFDUo2lcaSFoCqDOwhs264dNmS+V7SNp5ls64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xr+ZA8ELSofgb87IIwCBbA5uE6RZUZyFmNws9dyXbOpJO2U3HZSX9Q3s8hy5kEXoBQNgCnL6oo2DOVU63AG4DsET8xeHzDhWZlYKPCJ2SATYS3L6vndmqQg0peO26PlhdtF9GrtA4JgA8DAncqhX/TS/YZRgWIEe4BXKYzyyVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0OAOV2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0OAOV2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3771F000FF;
	Thu,  1 Oct 2026 05:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790833080;
	bh=H5xwXYHt3MKpD3RFGUHQS5fLFY6lbWy6NkZyegqPuhk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0OAOV2O/rQfFC6dne8Q1+WPs1kUtpeBXJZPQqSkhacSIudiHTiTsFsWjU18vwvaC
	 xmMG586RwCcXluK46aMtB37TLJSr+LfwaP68JEAKQmU+RWGjXbPRuOlTPNd2TgNNIP
	 HHo/KiVDe3vSwjGVleGRg0+xG35NZsQLZ0nSJv7QKlkZ9+TAcZ4vkp956wnPYAqkFQ
	 3h9n51KhFo5eZXAMdaU6uHIW6XNFCXikjEJ12CVMLhodGVwbccKYRGSE1+AwTahyBz
	 IKQYdsOlHdZ60Gt/XsUs2yePnYwSX8GpkVNhgK/qijYK7EML7v4lRgJK34LEJNsBkn
	 wMxMVY/2RNBfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/14] hwtracing: gtrace: Initial implementation of
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:37:59 +0000
Message-Id: <20261001053800.0D3771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] gtrace: Use-After-Free due to missing reference counting in lookup=
 functions
- [High] gtrace: Topological Use-After-Free due to dangling dest_comp point=
er
- [Medium] gtrace: Resource leak and UAF in per-CPU bound component handling
- [Medium] gtrace: gtrace_match_id() fails to match hardware components wit=
h version 0
- [Medium] gtrace: Null pointer dereference in gtrace_match_device()
- [Low] gtrace: Silent connection drop in gtrace_setup_inconn()
--

commit c892ee2c4bffce2e20b5a0429f11f8530ff96b44
Author: Anup Patel <anup.patel@oss.qualcomm.com>
Subject: hwtracing: gtrace: Initial implementation of gtrace framework

This commit implements a generic, architecture-neutral tracing framework
where trace components form a graph-like topology. It includes the core bus,
registration helpers, and a mechanism for polling component registers.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
[ ... ]
> +const struct gtrace_component_id *gtrace_match_id(struct gtrace_componen=
t *comp,
> +						  const struct gtrace_component_id *ids)
> +{
> +	const struct gtrace_component_id *id;
> +
> +	for (id =3D ids; id->version; id++) {

[Severity: Medium]
Is it possible for a valid hardware component to have a version of 0? If an
architecture provides a hardware component with a 0 version identifier,
would this loop terminate prematurely and silently fail to probe the hardwa=
re?

Also, could the `ids` pointer be NULL here if a driver registers without
providing an `id_table`? Dereferencing it unconditionally might cause a
kernel panic if the framework does not strictly enforce `id_table` presence
during registration.

> +		if (comp->id.type !=3D id->type)
> +			continue;
> +
> +		return id;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_match_id);
> +
> +static int gtrace_match_device(struct device *dev, const struct device_d=
river *drv)
> +{
> +	const struct gtrace_driver *gtdrv =3D to_gtrace_driver(drv);
> +	struct gtrace_component *comp =3D to_gtrace_component(dev);
> +
> +	return gtrace_match_id(comp, gtdrv->id_table) ? 1 : 0;

[Severity: Medium]
Is it guaranteed that `gtdrv->id_table` is non-NULL before passing it to
gtrace_match_id()? If a driver does not provide an `id_table`, does this
lead to a NULL pointer dereference inside gtrace_match_id()?

> +}
[ ... ]
> +static int gtrace_match_fwnode(struct device *dev, void *data)
> +{
> +	struct gtrace_component *comp =3D to_gtrace_component(dev);
> +	struct gtrace_fwnode_match_data *d =3D data;
> +
> +	if (device_match_fwnode(&comp->dev, d->fwnode)) {
> +		d->match =3D comp;

[Severity: High]
Does assigning the matched component here without calling get_device() leave
the object lifecycle unprotected? Could callers of gtrace_find_by_fwnode()
end up dereferencing a freed pointer if the target component is concurrently
unregistered and freed?

> +		return 1;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
> +{
> +	if (!cpu_present(cpu))
> +		return NULL;
> +
> +	return per_cpu(gtrace_cpu_source_comp, cpu);

[Severity: High]
Like the fwnode lookup above, does returning a raw pointer here without
reference counting or locking create a use-after-free window? If the
component is concurrently unregistered via gtrace_unregister_component()
while the caller is still using the pointer, could this result in memory
corruption?

> +}
> +EXPORT_SYMBOL_GPL(gtrace_cpu_source);
[ ... ]
> +static int gtrace_setup_inconn(struct device *dev, void *data)
> +{
> +	struct gtrace_component *comp =3D to_gtrace_component(dev);
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	struct gtrace_connection *conn =3D data;
> +	int i;
> +
> +	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
> +		for (i =3D 0; i < pdata->nr_inconns; i++) {
> +			if (pdata->inconns[i])
> +				continue;
> +			pdata->inconns[i] =3D conn;
> +			return 1;
> +		}
> +	}
> +
> +	return 0;

[Severity: Low]
If the destination array is fully populated and we exhaust the loop, should
this return a negative error code instead of 0? Returning 0 appears to hide
the connection failure and silently drops the input connection when a
matching destination is found but saturated.

> +}
[ ... ]
> +struct gtrace_component *gtrace_register_component(struct gtrace_compone=
nt_id *id,
> +						   const char *name,
> +						   struct gtrace_platform_data *pdata)
> +{
[ ... ]
> +	if (comp->pdata->bound_cpu >=3D 0) {
> +		gtrace_get_component(comp);
> +		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) =3D comp;

[Severity: Medium]
What happens if multiple components are mistakenly mapped to the same CPU?
Does unconditionally overwriting the per-CPU variable here leak the referen=
ce
count of the previously stored component?

> +	}
> +
> +	mutex_unlock(&gtrace_mutex);
> +
> +	return comp;
> +
> +err_out_unlock:
> +	mutex_unlock(&gtrace_mutex);
> +err_out:
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(gtrace_register_component);
> +
> +void gtrace_unregister_component(struct gtrace_component *comp)
> +{
> +	struct gtrace_component *c;
> +
> +	mutex_lock(&gtrace_mutex);
> +
> +	if (comp->pdata->bound_cpu >=3D 0) {
> +		c =3D per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu);
> +		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) =3D NULL;
> +		gtrace_put_component(c);

[Severity: Medium]
Does fetching and putting whatever is currently in the per-CPU variable
without verifying it matches `comp` risk dropping the reference on the wrong
component? If the per-CPU pointer was overwritten by a second component,
does this prematurely free the second one while the first one is being
unregistered?

> +	}
> +
> +	gtrace_cleanup_inconns_from_outconns(comp);
> +	device_unregister(&comp->dev);

[Severity: High]
Does this sequence unregister the component without clearing the pointers
pointing to it from its source components' outconns arrays? When a trace
path is later constructed and walks the source's outconns, would it
dereference the freed dest_comp and cause a topological use-after-free?

> +
> +	mutex_unlock(&gtrace_mutex);
> +}
> +EXPORT_SYMBOL_GPL(gtrace_unregister_component);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D2
