Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D3301471
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592791; cv=none; b=hTml8JV7bY4kSH5ONw22oDDTvPh42MF8/Ao2pYecCygZkDPPLBT6By4yDDYpElT1Pn7U+yKJXSqFbetqT5pKwpNFhSza79OJ5lMnfek4FBk5847tq8Gi9Ux8hL1KZCE3+Q7pSvivw4dLrPvSvbikSyCO5K7f4QKjV1mdABV+r3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592791; c=relaxed/simple;
	bh=AJumpZiRsAl5UolqxnPnhYqG7u/8Tx2lNlzXF/Q6lrg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r4GU6zI0VwHGHLGpgBst72cdiahf3cJsuFQsQigPFJVfYweCg9z0+kgPIYRJYR2D2PBb6hatBDe3q/es2dCc3cVZOPSqyr8xsYvmw7LhexggPSpoJINHbThK6yTCHZ1doMqBvfshhIdXA5MnxHpUizKANNHV6C2ErCcHZfmodGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ8nRvAi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ8nRvAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268DF1F00A3A;
	Thu,  9 Jul 2026 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592790;
	bh=NjTuLZWCrZJQ7B12jtEqg/HZY6SF7l6rGOKkzQLvOVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQ8nRvAi15ovsV4mzRf0Uho3FZRv2rscvov+3yQGy97e9JQv8nmPCnHzrci6J1Wy3
	 N9GsaK9nNdpcKj9fKKEFGX0xczyhJCgcIHgkz14ebqCVm/S/xVUzdnKewkbDeVo0sO
	 RRoeHXboIU4kxG7pxSKbfv30n+mMZip59c3Y6C2xFN2E+C6VhcpyCDfhRpnZBWUJG/
	 7JUymWfQCBNZHHPXowuSj69c/rzLY6jeuo1kljkZXcN7ns/ShLvGpXKzC9To2WzPjA
	 s+BFB4A7soc4Tu0ebfGrRp93O0ATU6iiDcjL777s//V2iy2g9HEunLjc2IXN5q75Cx
	 5BTILUgmISKMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/14] device property: Add
 fwnode_graph_get_next_port_endpoint()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709095726.704448-3-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:26:29 +0000
Message-Id: <20260709102630.268DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the core `fwnode=
_get_next_child_node()` API has a severe pre-existing bug when iterating ov=
er a node with both primary and secondary fwnodes, leading to a double-free=
/Use-After-Free and an infinite loop.
--

--- Patch [2]: [PATCH v4 02/14] device property: Add fwnode_graph_get_next_=
port_endpoint() ---
commit 1373ba83196f2e29826248ffdc2c43881f3a22fa
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_next_port_endpoint()

This commit introduces a new helper function to iterate over endpoint
firmware nodes under a specific port node. It will be used by the
upcoming USB power sequencing integration to verify graph connections
and supported connector types.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index c5e7e00f1b0cd..7f1fff3b55c74 100644
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
This isn't a bug introduced by this patch, but the core fwnode iteration=20
API has a pre-existing double-free and infinite loop issue when used on=20
nodes with both primary and secondary fwnodes.

When the primary fwnode's get_next_child_node operation reaches the end,
it drops the reference to the last child and returns NULL. The core API=20
fwnode_get_next_child_node() then passes this already-put child pointer=20
to the secondary ops:

drivers/base/property.c:fwnode_get_next_child_node() {
    ...
    next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
    if (next)
        return next;

    /* When no more children in primary, continue with secondary */
    return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child=
);
}

This causes secondary ops like software_node_get_next_child() to call=20
fwnode_handle_put(child) a second time on the already dropped node,=20
resulting in a use-after-free or double free.

Furthermore, the secondary op returns its first child. On the next iteration
of this do/while loop, this secondary child is passed back to the primary O=
F=20
op. Since to_of_node() on a secondary node evaluates to NULL, the OF iterat=
or=20
resets to its first child, creating an infinite loop alternating between=20
primary and secondary children.

Is it safe for fwnode_graph_get_next_port_endpoint() to rely on this=20
iterator before the underlying issue in fwnode_get_next_child_node()=20
is resolved?

> +		if (fwnode_name_eq(prev, "endpoint"))
> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D2
