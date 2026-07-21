Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECD3451A9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617758; cv=none; b=cbW3zHRb1MmQCumE0Bs2f1MwaO+jtaRQzPDkhzhcx+ffHrZy3IBbhoKu3nQjbjMp8eaEMwjp6F5wLHEiaRctudLAWnb/pgqH1NB0r4rbMN+dHptrfwf6dyFJ+UKzmSEK04jDT+eM+4lOhly0WO34h07hcVklqAr+oYzBta/efi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617758; c=relaxed/simple;
	bh=w6JHpq+EbDTXo6crsQQ5rpZt1yuEA0VvJ9HuLusYyCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rnPb3VJEs1Ok5+gyDNE9oGJAgvnW608C/l6vp72imEAyfOR8DL6nnBkSnR83NW/fIUcyZ1s8Fenqu6JuD4hLmUqovAflDteB9vCsIW7b0erhtTVBh4ILNuPzyKSp/6+o3ZZgJIV7xqmes6m9bWTqOAhGgDOYnz2Zvl7O+WJ95fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuKUAHR7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuKUAHR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFEA1F000E9;
	Tue, 21 Jul 2026 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617757;
	bh=qVeM3/gyu0IHjsfUdce5Lbi6jaEDPLNhwWHAWMk8KTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QuKUAHR7w+JfClbLpBI1Yh8DpJBZ9W7atRmb99jWB6rPbkZx5FgWsDApZfL+Po6E8
	 Mid93Qo7GfsXXC8zpC+RkbKpEeF2iEAWKT5fczGcixXC3vuykAQngMSKvPSfkUCEXi
	 ffk/ksEG8clJX1pjuzrqBUnxuU857kfdF5OpseeVXyqatNJ+04PwIWmATimu1JyrAW
	 kttpPktL+lzj5qDFLH/gU/dkJU3uCVRurdI3cPmloTFvHcUEk3x4R3LDhDVtL/AjNg
	 wdifcGG3cmw/VJldjh8qHLascQ4UzZsA8HIihW04rXY3jh0HaD8frj3mTuuvMyi40E
	 ElzPSKgo8YgtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721065413.2306137-3-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:09:16 +0000
Message-Id: <20260721070917.0CFEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded OF naming conventions break ACPI graph node endpoint ide=
ntification.
- [Medium] `fwnode_graph_get_next_port_endpoint()` leaks the `prev` referen=
ce when called with a `NULL` `port`, violating its own docstring contract.

Pre-existing issues:
- [High] `fwnode_get_next_child_node()` causes a double-free, use-after-fre=
e, and an infinite loop when iterating over a node with both primary and se=
condary fwnodes.
--

--- Patch [2]: [PATCH v6 02/16] device property: Add fwnode_graph_get_next_=
port_endpoint() ---
commit 0b043b08c9a4c2f484d73d298735da40162c82f7
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

This commit introduces a helper to get the next endpoint under a given
"port" firmware node. It checks if the child node name matches "endpoint"
and continues until it finds a match or exhausts all children.

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

[Severity: Medium]
Will this leak the prev reference if port is NULL?

The docstring states this function puts a reference to prev unconditionally.
However, if port is NULL, fwnode_get_next_child_node() returns NULL without
putting prev. The loop then terminates, returning NULL and silently
overwriting the original prev reference, resulting in a leak.

[Severity: High]
This isn't a bug introduced by this patch, but can the call to
fwnode_get_next_child_node() cause a double-free and a potential infinite
loop if the port node has both primary and secondary fwnodes?

Looking at fwnode_get_next_child_node(), if child is the last child of the
primary fwnode, fwnode_call_ptr_op() drops the reference and returns NULL.
The function then falls through and passes the already-freed child pointer
to the secondary backend:

fwnode_get_next_child_node() {
    ...
	next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
	if (next)
		return next;

	/* When no more children in primary, continue with secondary */
	return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
}

If the secondary backend is a software node, it unconditionally puts the
child again, causing a double-free. Furthermore, if it returns a valid
secondary child, the next iteration passes it back to the primary backend
which evaluates it to NULL, looping back to the first primary child.

> +		if (fwnode_name_eq(prev, "endpoint"))

[Severity: High]
Is it safe to hardcode the "endpoint" string match here for all firmware
types, such as ACPI?

While this works for Device Tree, ACPI evaluates endpoints differently using
is_acpi_graph_node(), which allows endpoints to be identified by an
"endpoint" property or a "reg" property with an "endpoint@" prefix,
regardless of the literal node name.

By relying strictly on fwnode_name_eq(), this generic helper bypasses
the backend abstractions and might fail for ACPI endpoints that use
property-based identification or lack a 'reg' property.

> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721065413.2306=
137-1-wenst@chromium.org?part=3D2
