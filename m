Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688139;
	b=bLQq3v66Ul3cdX0E0UHPtiY4z4RfzatrMQfGUQRqX5PtYlhu57JFtytpxflaJLhlyv5Y
	 kg1qwkm6NSY9ormiGy9pbvfq3YGvyMMgguGH2bjYm+R6NqtFoq2EkVtRDHK69umvpei4V
	 x+N40MlsmtmOKs5rZmUmb+Q20VkbeWJ2SAVuC1h4k5jBzYZnLvNK16g8liXDJswE49aeb
	 hiJTnpCwGXBjm4i2oY6w3cQeTb74W54JzRN6stsvyi48CM7zi/9iwXZqjIhGgCc7zCLK0
	 NWklw7UPdRQWYNHnGaff+JUDt1XKgXfclJwWofpsRXiM1cnRpK+9mxadi4D5YEA6nyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2ymCPgIH5Fk5i7xa2+CyKQB5NEr8r7j0YTzP9VNyKhc=;
	b=zu5MLDScwDEyq32dkmXsZ2at5+EhhgWCnecjSiDarbr0g+85GRA5vcfafI3Ql04BZx5x
	 4RTMaJ0lZPsRVgCcv7xCKE5LVaXedbWDiqRKA1RXrCEQRLVYzP++CPK80AKyho8BP0/Rc
	 85J2ROu8Uu9GKNTTVdxx41fxjVslrq7BRr4sgFwqRDOVGrlP/ayo3as1iW2lC42DQfhS/
	 5Hp2rVp68SPojcYfehe0j5Jkbx3ii4ZalBzK4X2nbAii0Bf7qy1jEyrlX9s2I/xaOFxwT
	 AsIErKIWHMkDEBi0QQNW8rijx1q0bkT+rVaKx7SV6zb6J3rq7/+OxegUplWVvjpq/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXqUVQeg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC773606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXqUVQeg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394DF1F000C4;
	Thu, 26 Nov 2026 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688139;
	bh=2ymCPgIH5Fk5i7xa2+CyKQB5NEr8r7j0YTzP9VNyKhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXqUVQeg6EQxMF2SP7eOP0Fftu0a2C0fQQf1rCBzk9Zeye0wg+AFM03qGk199b+5S
	 uA0wzjFCe5hwjs4nNJkLLdBszhsqdBihzUdTssqrd0pg6j793Cxpsl80ehrjXR143Q
	 +W5CH7rMdMC/nQiPfeY2E/vKm/8jGDmHGDJinATswG8cQ50dD5Ggo1f5DC/KE2vdwm
	 I0KwADfE2De7vmDrjy5wzA7B2aypoh9rL/+kLKCOeRBoIYQxOnPRYpraUtdtZsOlI6
	 H9KPpyTAeVj7fckZu59lJVEsKdP0oRqTyKn575xjXbafFM1qWtT8aomoytt0pTy+dj
	 wHOKJ/G+/t2oQ==
Message-ID: <sashiko-outbox-235261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/14] hwtracing: gtrace: Initial implementation of
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <50c430c6adecd57e4637c643ee3cf78309608d34.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <50c430c6adecd57e4637c643ee3cf78309608d34.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:15:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] hwtracing: gtrace: unchecked 0 return in
  gtrace_setup_inconns_from_outconns()
- [Medium] hwtracing: gtrace: refcount leak overwriting
  gtrace_cpu_source_comp
--

commit 8c67f8e6b67201b62b509964fb9df143def486d0
Author: Anup Patel <anup.patel@oss.qualcomm.com>

hwtracing: gtrace: Initial implementation of gtrace framework

This commit introduces the core generic hardware trace (gtrace) bus and
framework for registering trace components, building their connection
topology, and accessing hardware registers.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> new file mode 100644
> index 0000000000000..57554d5eb98d3
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -0,0 +1,524 @@

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
> +		return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gtrace_setup_inconns_from_outconns(struct gtrace_component *c=
omp)
> +{
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	struct gtrace_connection *conn;
> +	int i, ret;
> +
> +	lockdep_assert_held(&gtrace_mutex);
> +
> +	for (i =3D 0; i < pdata->nr_outconns; i++) {
> +		conn =3D pdata->outconns[i];
> +		ret =3D bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_setup_inc=
onn);
> +		if (ret < 0) {
> +			gtrace_cleanup_inconns_from_outconns(comp);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Can gtrace_setup_inconns_from_outconns() silently succeed when
bus_for_each_dev() returns 0 because no registered component matched
conn->dest_fwnode?

The caller resolves conn->dest_comp via gtrace_find_by_fwnode() before
calling gtrace_register_component(), which drops gtrace_mutex in between.
If conn->dest_comp is unregistered in that window (or if conn->dest_fwnode
does not match any device on gtrace_bustype), bus_for_each_dev() returns 0.
Checking only ret < 0 lets registration succeed without linking conn into
any destination component's inconns[] array, leaving conn->dest_comp
pointing to an unregistered component whose pdata has been freed.

Also, gtrace_setup_inconn() and gtrace_cleanup_inconn() match devices only
by conn->dest_fwnode without checking comp =3D=3D conn->dest_comp.  If the
destination device was unbound and rebound in that window, conn is attached
to the new component while conn->dest_comp still holds a reference to the
old one; when gtrace_cleanup_inconns() later runs on the new component, it
calls gtrace_put_component(comp) and underflows the new component's
reference count while leaking the old conn->dest_comp reference.

[ ... ]

> +	if (bound_cpu >=3D 0 && is_source) {
> +		gtrace_get_component(comp);
> +		per_cpu(gtrace_cpu_source_comp, bound_cpu) =3D comp;
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
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +
> +	mutex_lock(&gtrace_mutex);
> +
> +	if (pdata->bound_cpu >=3D 0 &&
> +	    per_cpu(gtrace_cpu_source_comp, pdata->bound_cpu) =3D=3D comp) {
> +		per_cpu(gtrace_cpu_source_comp, pdata->bound_cpu) =3D NULL;
> +		gtrace_put_component(comp);
> +	}

[Severity: Medium]
Does gtrace_register_component() leak the existing component reference if a
second source component is registered for the same bound_cpu?

Each component gets a unique type_idx device name suffix, so
device_register() succeeds even if per_cpu(gtrace_cpu_source_comp,
bound_cpu) is already populated.  Overwriting the per-CPU pointer without
checking if it is already non-NULL causes gtrace_unregister_component() on
the earlier component to see per_cpu(gtrace_cpu_source_comp,
pdata->bound_cpu) !=3D comp and skip gtrace_put_component().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D2
