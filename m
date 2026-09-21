Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CAE324B20
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962453; cv=none; b=SkFmWReu/En0LnLx7wLt/QYNpl7RUeUofrchO0QBOY4YsZQap1z8I2oheMnnsIbMnJ95f+cvZmGDNshRER6EnqdsSOl29df+LpXVMQ831g5Ow3NvbyT4DK0RPxKL6uDFDirW9QRWfyCPuZdVTrBmE2loc0WkBRvyGJGvZvA16k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962453; c=relaxed/simple;
	bh=UN4ts6M0IGOwpamMJM2Yl3Whw7uAGMgzvGdWbIvZk2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBBIbiqHmYc1BjwyeH2HWQQuEtZ5Aj/gRb3twGDmLYshuN7c7k+rD3EAMH5/YtYoHVCTfQDxQZBEHi7VPEJCs60VzeeX0O9hCu9i2tq66mCVAnqsPDPk3teCxMvbJXWHdjm0H3WmCQjwDBVOaeOBzmrx8ptawn0P58e9QjC81Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWi7OWVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWi7OWVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F391F000FF;
	Mon, 21 Sep 2026 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789962452;
	bh=zpdd70rDti43uud6vySxGWujqM9e/sSGDXzAlhCaFjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWi7OWVz4BVzM4jM5L4hVjLDnkA8ZbcaA5RM+7VuNtzPgcs9yx01cDfEtd1ft6I16
	 IASr7oM4WuKr5qexFzqwcpywOw0+qAlAL3+HVaxCEHNklBqldJFVlbYtsjQnr/mTe6
	 1/wGa4upgIyGIBmUro9X5hlTOfz0BK1vMTsTZHQxJ4RfBzeUrcJpAj6WlD4Xkt5uhj
	 uMGkaBe9OpiYZwvzhpz69y/UNyLl9DtnBBKVY5k3SSkczpFAVXL+tg9NgFBBJNEW+S
	 7ltxsSEZFsc0GaxTg9dAPQvWpYTyzw7UL9H1XPxwWmJJaymd9wt5YbLY3q56rmpkXj
	 LwSQ2K8TgkKZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] powerpc/pseries/dlpar: Remove DT entries if
 failure from CPU ADD notifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haren Myneni" <haren@linux.ibm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921033156.991481-2-haren@linux.ibm.com>
References: <20260921033156.991481-1-haren@linux.ibm.com>
 <20260921033156.991481-2-haren@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 03:47:31 +0000
Message-Id: <20260921034731.D7F391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] powerpc/pseries: NULL pointer deref in __of_detach_node on error p=
ath
- [Medium] powerpc/pseries: memory leak of unattached sibling device nodes
--

commit 79a5af10ba412eed58ff43cc8d6339b8b6eee45f
Author: Haren Myneni <haren@linux.ibm.com>

powerpc/pseries/dlpar: Remove DT entries if failure from CPU ADD notifier

For CPU ADD, the device tree entries are retrieved with
configure-connector RTAS call and attached to the device tree.
Then the CPU is added as part of DT node notification. If the CPU
ADD notifier returns failure, the corresponding CPU node entries
should be deleted from the device-tree.

> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfo=
rms/pseries/dlpar.c
> index f4d33b8dffd85..01a9849773cd1 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -247,15 +247,18 @@ int dlpar_attach_node(struct device_node *dn, struc=
t device_node *parent)
>  	return 0;
>  }
> =20
> -int dlpar_detach_node(struct device_node *dn)
> +int dlpar_detach_node(struct device_node *dn, bool notify)
>  {
>  	struct device_node *child;
>  	int rc;
> =20
>  	for_each_child_of_node(dn, child)
> -		dlpar_detach_node(child);
> +		dlpar_detach_node(child, notify);

[Severity: Medium]
Will this leak unattached sibling device nodes on the error path?

dlpar_configure_connector() can return a chain of device nodes linked via
dn->sibling. The error path in dlpar_cpu_add() previously called
dlpar_free_cc_nodes(dn), which handles sibling traversal.

By replacing it with dlpar_detach_node(dn, false), which recursively
processes children but explicitly does not traverse dn->sibling, do we
permanently leak any unattached sibling nodes returned by the connector?

> =20
> -	rc =3D of_detach_node(dn);
> +	if (notify)
> +		rc =3D of_detach_node(dn);
> +	else
> +		rc =3D of_detach_node_no_notify(dn);

[ ... ]

> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index bc6926dbf1489..15122aab05b24 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -602,8 +602,8 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
>  			dn, rc, drc_index);
> =20
>  		rc =3D dlpar_release_drc(drc_index);
> -		if (!rc)
> -			dlpar_free_cc_nodes(dn);
> +		if (!rc && dn)
> +			dlpar_detach_node(dn, false);

[Severity: High]
Does this code trigger a NULL pointer dereference when
pseries_cpuhp_attach_nodes() fails?

In dlpar_cpu_add(), if pseries_cpuhp_attach_nodes() fails, the device node
dn remains unattached from the device tree. This error path then calls
dlpar_detach_node(dn, false), which invokes __of_detach_node().

Because dlpar_parse_cc_node() does not set the OF_DETACHED flag on
allocation, __of_detach_node() assumes the node is attached and iterates
over its parent's children to unlink it:

drivers/of/dynamic.c:__of_detach_node() {
	...
		for (prevsib =3D np->parent->child;
		     prevsib->sibling !=3D np;
		     prevsib =3D prevsib->sibling)
			;
		prevsib->sibling =3D np->sibling;
	...
}

Since the node was never linked, it is not in the list, and the traversal
pointer prevsib reaches NULL.  Will this cause a guaranteed NULL pointer
dereference (prevsib->sibling) and kernel panic?

> =20
>  		return saved_rc;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921033156.9914=
81-1-haren@linux.ibm.com?part=3D2
