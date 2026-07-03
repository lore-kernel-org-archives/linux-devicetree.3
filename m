Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2630D3F4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 04:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052843; cv=none; b=JpHoZuRCib28aSW8zEnp/ncXpwM8h0BdYjhbxmhuH6yczKDakUqGDZw9HVIJw/gWsWBna/J8e4gU2bKUTVWv549EGDdGJzQT2WZtPrWeDmxsU0cyDP2H1mzKLof/jPk4B99gS2rKW1g0wLhkxIfMbMXhWZJw+KIcYGkfgcytgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052843; c=relaxed/simple;
	bh=z1yI8NJz4zfaXCktd4jeIGf1LFibY4XzSfJ0T5gE0ns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HG6FphCP6YimxLJxPse58EQVUl3aOnokc/jTmCPHDGvViHXAI8q1O/l9Zd+SPNKAnZByhMSCaTbO/91RBMh0hWFiUW1dQ2Ie8uvLJ2e5e63ObgaPwtRGUJI3d3BYJbzLChgkNl67sI1JA+0wG4kn/BTZGMx18y1gIQedmZ2GIOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChTH1aKH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChTH1aKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB91A1F000E9;
	Fri,  3 Jul 2026 04:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783052835;
	bh=nDQixqx3sxjOUF5L9yQEKDFGap9P+DaxaLEpA9uvyds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChTH1aKHCxpgNzLF2xUx2Lo5xlB6BNponiADykA0UZb2mep9Ha+wsl6BRmS1DlxpE
	 eHx0SUwjlROEKDnihZrkR1XYSKrCi+CjtyX84WnobFSsl9IDQVwySDLuzzXjTKtOT+
	 YgCZc/zPGcVRWqVkcM8I7kI7/pL+LXINTKQ3fYMy/x6XwJuVGi7b/7l/PH/X70ibx9
	 nGwVn1SCN9q2Dxv/u8hzCC9FqTMI0NWa6d2jPYydE7szvbZYil7ICyZGNopyVsqVwH
	 pFgBfaFbnefJUTTeV4raAh/VrtmDy51EGMTLWWPgRgf7LzIkSo6iZi37fQJy200mvL
	 Mlo6bcyBrZesg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] of/numa: remove redundant numa_nodes_parsed
 node_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sang-Heon Jeon" <ekffu200098@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703041329.2797584-4-ekffu200098@gmail.com>
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
 <20260703041329.2797584-4-ekffu200098@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 04:27:14 +0000
Message-Id: <20260703042714.DB91A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function's final return status is order-dependent, improperly =
shadowing earlier successes if the last evaluated memory node lacks a 'numa=
-node-id' property.
--

commit a42c5d6d6a0d76bbe5386c6e6e6307393d31c628
Author: Sang-Heon Jeon <ekffu200098@gmail.com>

of/numa: remove redundant numa_nodes_parsed node_set()

This commit simplifies of_numa_parse_memory_nodes() by removing a redundant
node_set() call. The operation is now handled internally by
numa_add_memblk().

> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> index cd2dc8e825c92..230d5f628c1b4 100644
> --- a/drivers/of/of_numa.c
> +++ b/drivers/of/of_numa.c
> @@ -59,11 +59,8 @@ static int __init of_numa_parse_memory_nodes(void)
>  			r =3D -EINVAL;
>  		}
> =20
> -		for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc); i++) {
> +		for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc); i++)
>  			r =3D numa_add_memblk(nid, rsrc.start, rsrc.end + 1);
> -			if (!r)
> -				node_set(nid, numa_nodes_parsed);
> -		}

[Severity: High]
This is a pre-existing issue, but does this function accidentally return an
error if the last memory node evaluated lacks a NUMA node ID?

Looking at of_numa_parse_memory_nodes(), if the device tree contains multip=
le
memory nodes and the final iterated node does not have a "numa-node-id"
property, the loop handles it like this:

    for_each_node_by_type(np, "memory") {
        r =3D of_property_read_u32(np, "numa-node-id", &nid);
        if (r =3D=3D -EINVAL)
            continue;
        ...

This clobbers the r variable with -EINVAL and continues to the end of the
loop. If this is the last iteration, the loop terminates and the function
returns -EINVAL, discarding prior successful parses.

Could this lead to NUMA initialization failing entirely on valid system
configurations and falling back to a single node?

> =20
>  		if (!i || r) {
>  			of_node_put(np);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703041329.2797=
584-1-ekffu200098@gmail.com?part=3D3
