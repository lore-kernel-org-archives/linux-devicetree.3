Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4C63B8407
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883838; cv=none; b=c2RDtkiL5QzLUkbUJKXOjAYnpCtRngZ3Mxc7Q/e4KxypTpVOfoaKt9gDvlA15wSpsuBsKW4GNX+MFr6YhEkF1egd+oSt20x/Lqx9U/R4YH6m65FLWP99hyYb8dkp+9A/fqA9aOffigGESn2jcz3Yj2CBNLdhpYrw1UJBaIvqgUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883838; c=relaxed/simple;
	bh=AMXF8Yd2sHgsE628dgnM76BbxDRhxBPbmCb3MxLcuDw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nj7ryFTArAi4P8KUE5cRkDK0ifjXI52W61PNdPbkAcAD69sRhT/Dgv5V1+BLQDZFmg3FbkeedUlKkge4/jMR4QExGGFDYnQNiaG5oJJAXtI/i87VE7cT52hS35qTO3441TuyCZy5AsZtzs8F3QwqpmMkBIUrZU8YLAwaUCkS0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR6dW5JM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR6dW5JM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD51E1F00A3A;
	Fri, 24 Jul 2026 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883837;
	bh=dho8sJQBV9jiLA5KfXFWUNm5o1/32ANC5yJ5GM3FP+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eR6dW5JMJKOlpb6/Ub2rjANLA+h3/xb6sbjenAIftk3dd9Y8xMkRU2W2UoH9cxOAi
	 lmSl5cLuh4a3T6t/SfBtly/WKAzcb+20wrcJH4AqBi6jFOBF7+lSeRLmBO/X8Ig2z/
	 HAuUfCyRD9c5PlmZss6rfmmPnMA2SdvLgIiAA+arsGARpKQPsG4ZbVPMpdCt0F3mhI
	 s4cwkYeX6QeN5na4FEPtHJypPt+N8+IgKFtUAXY9jEqION1WtQWbHaus0xD2pSJNu9
	 giOww+R4mhHYSnipZyX0SRJEespfMj1be7eeFiNZVFw1kQ7+dwufV0UWMIdcspt32C
	 QcqupC730klPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724084328.3943997-3-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:03:56 +0000
Message-Id: <20260724090356.AD51E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The new helper `fwnode_graph_get_next_port_endpoint` ignores the A=
CPI-specific compatibility logic for identifying endpoint nodes by hardcodi=
ng an OF-specific naming convention.

Pre-existing issues:
- [Critical] `fwnode_get_next_child_node` improperly handles transitioning =
from the primary fwnode to the secondary fwnode, causing double frees, refe=
rence leaks, and an infinite loop. This problem wasn't introduced by this p=
atch, but it is a critical pre-existing issue exposed by new loops.
- [High] Calling `mutex_lock(&fwnode_link_lock)` while holding `raw_spin_lo=
ck_irqsave(&devtree_lock)` causes a sleeping in atomic context BUG when the=
 last reference to a dynamic OF node is dropped during iteration. This prob=
lem wasn't introduced by this patch, but it is a severe pre-existing lockin=
g violation.
--

--- Patch [2]: [PATCH v7 02/16] device property: Add fwnode_graph_get_next_=
port_endpoint() ---
commit 0be52c3289b5692b190b7583fe9b05fd00691fca
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

Due to design constraints of the power sequencing API, the consumer must fi=
rst
be sure that the other side is actually a provider, or it will continually =
get
-EPROBE_DEFER when requesting the power sequencing descriptor. This commit
introduces a helper to get the endpoint under a known port firmware node.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 0bd45f8b01c14..62c6221d65d05 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_hand=
le *fwnode, const char *name)
>  }
>  EXPORT_SYMBOL(fwnode_irq_get_byname);
> =20
> +/**
> + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node=
 in port
> + * @port: Pointer to the target port firmware node
> + * @prev: Previous endpoint node or %NULL to get the first
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the retu=
rned
> + * fwnode pointer. Note that this function also puts a reference to @prev
> + * unconditionally.
> + *
> + * Return: an endpoint firmware node pointer or %NULL if no more endpoin=
ts
> + * are available.
> + */
> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct f=
wnode_handle *port,
> +							  struct fwnode_handle *prev)
> +{
> +	do {
> +		prev =3D fwnode_get_next_child_node(port, prev);

[Severity: Critical]
This is a pre-existing issue, but does fwnode_get_next_child_node() imprope=
rly
handle transitioning from the primary fwnode to the secondary fwnode?

When the primary fwnode iterator exhausts its children, it drops the refere=
nce
to the child node and returns NULL.

Inside fwnode_get_next_child_node(), it then passes this already-freed child
pointer to the secondary fwnode's iterator:

drivers/base/property.c:fwnode_get_next_child_node() {
    ...
    /* Try to find a child in primary fwnode */
    next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
    if (next)
        return next;

    /* When no more children in primary, continue with secondary */
    return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child=
);
}

Checking is_software_node(child) inside the secondary iterator accesses the
freed node's ops, causing a UAF. Since child is not a software node, the
iterator returns the first software node child. On the subsequent iteration,
this software node is passed back into the primary OF iterator, which ignor=
es
it and restarts from the first OF child, resulting in an infinite loop.

Can this be triggered by any device graph traversal on a parent node posses=
sing
both primary and secondary children?


[Severity: High]
This is also a pre-existing issue, but is there a risk of a sleeping in ato=
mic
context BUG here when dropping the final reference to a dynamic OF node?

Iterator functions within the OF subsystem (like of_get_next_status_child) =
drop
the reference to the prev fwnode using of_node_put() while explicitly holdi=
ng
the devtree_lock raw spinlock.

If the node being put is dynamically allocated (e.g., from DT overlays) and=
 this
is its final reference, of_node_put() synchronously invokes of_node_release=
().

This release function then calls fwnode_links_purge(), which attempts to
acquire the fwnode_link_lock mutex:

drivers/base/core.c:fwnode_links_purge_suppliers() {
    ...
    guard(mutex)(&fwnode_link_lock);
    ...
}

Will this lock nesting hierarchy violation trigger a BUG on both RT and non=
-RT
kernels when terminating the loop on the final reference of a dynamically
allocated node?

> +		if (fwnode_name_eq(prev, "endpoint"))

[Severity: High]
Does this strict naming check ignore the ACPI-specific compatibility logic =
for
identifying endpoint nodes?

In the ACPI subsystem, graph nodes are often identified by the presence of =
an
endpoint property rather than their exact node name (e.g., as handled by
is_acpi_graph_node()).

If drivers using this generic fwnode_graph_* API on ACPI platforms don't ha=
ve
the literal name "endpoint", will they fail to find valid endpoints and bre=
ak
device functionality?

> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084328.3943=
997-1-wenst@chromium.org?part=3D2
