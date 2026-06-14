Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07773A59A3
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781445043; cv=none; b=A05RQBCe/8vwxJ67tCLXm9AuxpwOSxSDctQ2SFs3MQW58OdwdLI2hfyCyZsJbuNW0xyJSCey10T6P7u+9tHTD5ViGMwCI0CzMy7USSqxBr5/EkJq3Y25yi/lFRzX88IwqBmbkFJnCo2hgeGYH1HNRyYmPYSfShR2qE3hpSvLq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781445043; c=relaxed/simple;
	bh=8Gf18LyGLQy/rLGm8Dc2crI3Ocp7L3JWuqi/LNjy1pU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9Q5E0bKBX4lzWqixK7CIDrOW3RjgQbFEHeX0pekptwnSX4rQj/04Dg0joLrRa38zRPyX1jpkkEYas2It7Uz8rQiTDdn38/NFB/O/zmHODNUy6QWggeKMZBMlhaqlwv0f4eV+taR7cAM+hk9qOeddBAlB85EJmUFnjbN33M2M6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+xbrmPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+xbrmPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D944B1F000E9;
	Sun, 14 Jun 2026 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781445042;
	bh=hHBb1v9Vl+Mk5+pl3RKOozs+2PgeOqAx4cZFtoh+eng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+xbrmPQa9bPnhV5zZSoedezBvCQcVQCZzPhLg129CfBdMS3SU9tYl4nJsaPnWV2c
	 sgkBz3nyovBlJth72jmJ9BcSc4+LxEEZaWO9ib2cxoN5V2YERM4ko+8Y1ZyK78BFIq
	 kNKxd3jTF+0bi1EM5gKShqZYruzpcC7MtHw5chv20E+NTsGe1YwoHb7sZ+lFzOvlUu
	 0h5x3+tT2+rbK5taW+MafFMK17a/I0SrU0+aWUm1og9libpLCbYzUjQulc/ouObZeF
	 0WkpCwJTn9gHrWy5AGK01Shz2+LGutgbVPaAnV89F/woGa7uAbjkXvNde9DMhXgSF/
	 BFXHS/tPsgdUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] of: reserved_mem: print skipped node name when
 too many regions are defined
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sang-Heon Jeon" <ekffu200098@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614133807.2165124-3-ekffu200098@gmail.com>
References: <20260614133807.2165124-3-ekffu200098@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 13:50:41 +0000
Message-Id: <20260614135041.D944B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds write to the static `reserved_mem_array` if `membloc=
k_alloc` fails during dynamic array reallocation.
- [High] Ignored memory reservation failures allow unreserved memory to be =
successfully registered and handed out as exclusive reserved memory.
- [Medium] Dynamically allocated `no-map` reserved memory regions are leake=
d from `memblock.reserved` if their initialization fails.
--

commit f95986ab58870e3d79cb320c6dc73ef80982357e
Author: Sang-Heon Jeon <ekffu200098@gmail.com>

of: reserved_mem: print skipped node name when too many regions are defined

When too many reserved memory regions are defined,
fdt_init_reserved_mem_node() logs an error and skips the region without
naming the node.

Print the node name so the skipped node can be identified, matching
fdt_scan_reserved_mem().

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 499b769e98096..df3d90cb8dbe1 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -623,7 +623,8 @@ static void __init fdt_init_reserved_mem_node(unsigne=
d long node, const char *un
>  	struct reserved_mem *rmem =3D &reserved_mem[reserved_mem_count];
> =20
>  	if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
> -		pr_err("not enough space for all defined regions.\n");
> +		pr_err("not enough space for all defined regions, skip '%s'\n",
> +		       uname);
>  		return;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does alloc_reserved_mem_arra=
y()
fail to reset total_reserved_mem_cnt on error?

If memblock_alloc() fails during dynamic array reallocation, it returns ear=
ly
without resetting total_reserved_mem_cnt back to its original value. When t=
he
bounds check in fdt_init_reserved_mem_node() is reached later,
reserved_mem_count can increment beyond the statically-sized
reserved_mem_array limit, potentially causing an out-of-bounds write:

drivers/of/of_reserved_mem.c:alloc_reserved_mem_array() {
    ...
	new_array =3D memblock_alloc(alloc_size, SMP_CACHE_BYTES);
	if (!new_array) {
		pr_err("Failed to allocate memory for reserved_mem array...");
		return;
	}
    ...
}

[Severity: High]
This is a pre-existing issue, but does __reserved_mem_reserve_reg()
unconditionally return 0 even if early_init_dt_reserve_memory() fails?

If memory reservation fails, it logs an error but returns success, allowing
unreserved memory to be successfully registered and later handed out as
exclusive reserved memory:

drivers/of/of_reserved_mem.c:__reserved_mem_reserve_reg() {
    ...
		if (early_init_dt_reserve_memory(base, size, nomap)) {
			pr_err("Reserved memory: failed to reserve...");
		}
	}
	return 0;
}

[Severity: Medium]
This is a pre-existing issue, but does fdt_init_reserved_mem_node() leak
dynamically allocated no-map regions if initialization fails?

If __reserved_mem_init_node() returns an error, the cleanup path for no-map
regions clears the MEMBLOCK_NOMAP flag but skips calling memblock_phys_free=
(),
which permanently leaks the physical memory from memblock.reserved:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
	err =3D __reserved_mem_init_node(rmem, node);
	if (err !=3D 0 && err !=3D -ENODEV) {
		pr_info("node %s compatible matching fail\n", rmem->name);
		rmem->name =3D NULL;

		if (nomap)
			memblock_clear_nomap(rmem->base, rmem->size);
		else
			memblock_phys_free(rmem->base, rmem->size);
		return;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614133807.2165=
124-1-ekffu200098@gmail.com?part=3D2
