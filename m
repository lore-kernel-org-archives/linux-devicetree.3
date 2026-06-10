Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9229BD95
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081849; cv=none; b=RNwRjIonr076EnhUxzrkBKzu5NDgYyVqtIZdbFlEczyG+vMlniyvQcP8eoE6YESWuRfDx2Ltbw1KEfu8L/OlmaUbeguf7ziThP4XCh/tmpcF+TVZRtyI+dnKAXocMVlikknSFuOcDNicd/7dSf7ClV8sFOsmhwftwj+bOJPsnoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081849; c=relaxed/simple;
	bh=QL0+NEF30IjiJsPNEjonS9U/+JwL2JG/gDWkxfYeTCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S07aVrmv1ofyISoTOLbwVQ60K9XMtVdNeRApWPDeOlKfcRBxjPD+XkOE930DHVfDxD/O1OW8qlNajLeKjO8umnC76dBO7MFwMrJ8cWkkQfQKh3qvE7R+Ivfp9w4wXqO+3VFDLkqClYZLCsuGOky+tn8dcxbkwgHx85WzVOOBJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRLV7uyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRLV7uyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A20B1F00893;
	Wed, 10 Jun 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081848;
	bh=ZFZP2xdyS3Ep3M6mfHhsTx85aDDCty4Nq1gkI+na5lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRLV7uyFS5z8gpac8kebI2ZlLa9HjAmNMIEtqGMXXpTmTZ35k6BFEJ+t7yLEiEqdY
	 HhFQnN0DkVCz0iBOSDVHrz/ISosK7pbiNBUV3vu9ojlQNDNbRlLKjQxwPreTligs/L
	 Zpd8K6uBCz2XOpl9+q9udKBG3FSxaVTyPR/YPAi4PUwuT2ZWAvHTn43RLp9YibXa0Y
	 l5Te1RH5z4QdKm80uKuJljpPb5wB0G4zEFWWXde1TGvhrL3EeevBTAYVlac5UEBGS4
	 //e8G18LH/438B+mjWhycStaFkUgkH/VA9zy9A1UhlcbnDEEV2MPkqpo2LrKJNQdX6
	 k/irppf54IL6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610084053.2059858-3-wenst@chromium.org>
References: <20260610084053.2059858-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:57:27 +0000
Message-Id: <20260610085727.7A20B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The local variable `ep` is declared but never used in `fwnode_graph=
_get_next_port_endpoint()`.

Pre-existing issues:
- [High] Preexisting Use-After-Free, Double-Free, Memory Leak, and Infinite=
 Loop in `fwnode_get_next_child_node()` when crossing from primary to secon=
dary fwnodes.
--

commit ef024cc56635ec6ba836569acc9c332f8f2249dc
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

This commit introduces fwnode_graph_get_next_port_endpoint(), a new helper
function that allows consumers to find endpoint nodes under a given port
firmware node. It iterates over the child nodes of the port, checking if
their name matches "endpoint", and returns the matching node.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 8cbf33f3a9428..badb49ac3d8a4 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c

[ ... ]

> @@ -1099,6 +1099,39 @@ int fwnode_irq_get_byname(const struct fwnode_hand=
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
> +	struct fwnode_handle *ep;

[Severity: Low]
Are there plans to use this local variable later? It appears to be declared
here but never used, which could cause a compiler warning.

> +
> +	while (1) {
> +		prev =3D fwnode_get_next_child_node(port, prev);

[Severity: High]
This is a pre-existing issue, but does calling fwnode_get_next_child_node()
here expose a use-after-free and double-free when crossing from primary to
secondary fwnodes?

If a fwnode has both primary (OF) and secondary (swnode) children:

1. When reaching the end of the primary OF children,
of_fwnode_get_next_child_node() drops the reference to the last OF child
and returns NULL.

2. fwnode_get_next_child_node() then delegates to the secondary ops
(software_node_get_next_child), passing the exact same child pointer.

Since the OF node was already put, the secondary ops access freed memory
when checking if the child is a software node, causing a use-after-free.

3. software_node_get_next_child() then unconditionally calls
fwnode_handle_put(child), triggering a double-free.

4. It then returns the first secondary software node. On the next iteration,
the caller passes this swnode back.

The primary OF ops evaluate to_of_node(swnode) as NULL, which causes
of_get_next_available_child() to restart iteration and return the first
OF child again. It also fails to put the swnode, causing a memory leak.

Could this create an infinite loop alternating between the first OF child
and the first software node, repeatedly triggering the use-after-free and
double-free on every cycle?

> +		if (!prev)
> +			break;
> +
> +		if (WARN(!fwnode_name_eq(prev, "endpoint"),
> +			 "non endpoint node is used (%pfw)", prev))
> +			continue;
> +
> +		break;
> +	}
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610084053.2059=
858-1-wenst@chromium.org?part=3D2
