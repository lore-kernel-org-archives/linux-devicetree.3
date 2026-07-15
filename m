Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCDB3ECBCD
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106586; cv=none; b=HEW+SOwVc/yJu+wZkXdK7ODMGOvKNIjoYpdkd45q5/Uub0F6gaPiayhFrPEOuoHSE75T/CcnZPoPpp0KbfnVQitGpn/RAZBaQEcYRpV4ANIpSxLuoQmU3hn+07MCbrdVUjEUlZqZPTK91fh5Jx1lryMgNRciFYzpEZ3GPoM7tK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106586; c=relaxed/simple;
	bh=1QcU48bIpCfSkvx5akklVj8+Ls69ZBvswDKJZVFWKcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V2CGxga2IYQkTi3iSCwLNUtbScbrqT7prIwtoD2kFO3nfvYMQgdR3NYVWyEqtOThh3RS85GXG0PB+8KdkOI+gS+8EoX7FvGxtA/5XbEK2JO4UdA8uF4jpfBqlz5vbxEChNtJuZ4Ao0ypguhrBhT3OKKX2BEBav21iWkK6k7ip4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB93WFTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB93WFTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4441F000E9;
	Wed, 15 Jul 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106584;
	bh=GESY8UzzCNAxbKi1s7waLWnrQBjElWqOj/3JzDYGHWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RB93WFTw0n1DJfgUjqw9fcb8stZYhXbM86LlCH/OidrMc3if2Hcz4BRMET3RVH3pd
	 CoKPX+HkaRZa3D1zEBYsR3w8JHjJotUQX6E219/drzs/mrYL37exkW28WjrUqxt7CI
	 yezctWwhyhfjU5HgPv6/6oMDqluEdu9MtRmC/YMBjAQmsoe28cl0FDpj7epzA04X18
	 04f0WIDqKgO8ptzhwMgpdr2Bx1KsM+TX8a2gBVCCoF/o+BurjJX6ZC1s75Ko607oOO
	 +5iOJ53O0/VEpYLrUZIiRg5WFJNyTfbpoPV1xu2GSfhWIzvA1NYxAray5ReUDoVUHP
	 QjTWYO2jBJzpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715085348.3457359-3-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:09:43 +0000
Message-Id: <20260715090944.2B4441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The new `fwnode_graph_get_next_port_endpoint()` helper breaks the =
`fwnode` graph abstraction by hardcoding OF-specific naming conventions, wh=
ich will silently ignore valid ACPI and software node endpoints.
- [Medium] `fwnode_graph_get_next_port_endpoint()` fails to unconditionally=
 put the `prev` fwnode reference if an invalid `port` is provided, violatin=
g its documented API contract.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but iterating over e=
ndpoints using `fwnode_get_next_child_node()` causes an infinite loop and U=
se-After-Free when a device has secondary fwnodes attached.
--

--- Patch [2]: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_=
port_endpoint() ---
commit 8a16a51eeb8e99439d5b85ce61789ff1153e9060
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

Adds a helper function to iterate through the endpoint firmware nodes
under a given port. This is intended to be used in USB power sequencing
integration to verify graph connections and supported connector types.

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

[Severity: High]
This is a pre-existing issue, but iterating over endpoints using
fwnode_get_next_child_node() can cause an infinite loop and a use-after-free
if a device has secondary fwnodes attached.

If a device port has both primary children and a secondary fwnode, the prim=
ary
ops finish and drop the reference to the last primary child, returning NULL.
Then, fwnode_get_next_child_node() incorrectly passes this same dropped chi=
ld
pointer to the secondary ops:

drivers/base/property.c:fwnode_get_next_child_node() {
	/* Try to find a child in primary fwnode */
	next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
	if (next)
		return next;

	/* When no more children in primary, continue with secondary */
	return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
}

This can result in a double-put. Furthermore, when traversing secondary
children, the primary ops don't recognize the software node, treat it as NU=
LL,
and return the first primary child again, creating an infinite loop.

[Severity: Medium]
Does this fail to unconditionally put the prev reference if the provided po=
rt
is invalid?

If a caller passes a valid prev node but port is NULL or an error pointer,
fwnode_get_next_child_node() returns early without dropping prev:

drivers/base/property.c:fwnode_get_next_child_node() {
	struct fwnode_handle *next;

	if (IS_ERR_OR_NULL(fwnode))
		return NULL;
    ...
}

Could this lead to a reference count leak, violating the documented API
contract that prev is unconditionally put?

> +		if (fwnode_name_eq(prev, "endpoint"))

[Severity: High]
Does hardcoding this string match break the fwnode graph abstraction for
non-DeviceTree platforms?

By strictly matching the "endpoint" prefix, this bypasses the provider-spec=
ific
fwnode_operations, which could silently ignore valid ACPI and software node
endpoints that don't follow this exact naming scheme. Shouldn't this rely on
the backend-specific graph_get_next_endpoint operations instead?

> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D2
