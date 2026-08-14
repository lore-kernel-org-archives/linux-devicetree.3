Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83D44C510
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696174; cv=none; b=cJqucFQ9tgqAh9T4QYV0na+addod8sthaXbzNDlb2iDrNBMyEZyD3+aisnKaaIT4fVH46jiPWZQL03RBYsYmqH7XcF5X5HYjqorvyaB6gZyxZS4kYFEBz4SOfpxeafen4VJXZn6mWHRmtLarutKK4dRAP4ot6nqpTbmNE1vqlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696174; c=relaxed/simple;
	bh=T73XddjDhxf/vYApUi77bqLujQPh+6Itq6r+GeWcxKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GxNzTXNc1dyYrH1MOXIA98x4BJNTTh+ZqVW7SczZDPW0wLqaPZD8iHXn/KpSCNEFME9DIQrUCt852YVDbZhrdY1+9rCI73P8xYYIr0xlm2iZQuss60WTH2jkod0FG7phCLksIW8y9uHyw2Ylc2xenENqxee5/ceJjaTNasns0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O18UvK+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O18UvK+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5452D1F000E9;
	Fri, 14 Aug 2026 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696149;
	bh=jVodL2FsUfxA8EZdIhvuo4kv+5TIR62glktI6+QPK9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O18UvK+5sR8c1PDXmSpSbTsFOCoCn+Wf4El6nq4hwRo3ohfWrGhO2uYXalxgRAJfn
	 9cN/nHrMo7Boli6cq0CJ8Ll2c0o3qCWSYl5RlRBPWHzZAJOCENC+vIuc/4tWSqG8fR
	 GMPlt+UIF3U/ts3pKGcQudlbE9D6NkxLcQGEaCHiXGjThTnmcid+JTbtXrgiiS00wM
	 uWZmLBDfd6ee8eNPQawqV4MXSTpECRs/rjIbrhSVWmNfvf7TJdffID5WYOyMO8S6Lb
	 /F7k9xSaK7aSNdI7wv48uiPtSpx1BOQuF8Ms/I9k3MTiBcz8rtVTXuOxkpZP5yyDAk
	 +e08l2s5l5YTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] of: reserved_mem: skip init for regions whose early
 reservation failed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814081443.1061046-2-chenwandun1@gmail.com>
References: <20260814081443.1061046-1-chenwandun1@gmail.com>
 <20260814081443.1061046-2-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:29:04 +0000
Message-Id: <20260814082905.5452D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Exceeding `MAX_RESERVED_REGIONS` failed memory reservations ca=
uses unrecorded failures to steal dynamic array slots from valid nodes, lea=
ding to skipped valid regions and potential arbitrary physical memory frees.
- [High] Redundant recording of natively skipped zero-sized nodes wastes ca=
pacity in the bounded `reserve_failed_nodes` array, artificially accelerati=
ng array slot stealing overflows.
- [High] Unconditionally skipping initialization for regions whose early me=
mory reservation fails breaks valid legacy configurations.
--

--- Patch [1]: [PATCH 1/3] of: reserved_mem: skip init for regions whose ea=
rly reservation failed ---
commit 89c6cc50df5c4bf222e4058d5f0ce76a20439009
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: skip init for regions whose early reservation failed

The patch modifies reserved memory initialization to propagate errors from
early memory reservation. It tracks nodes that failed to reserve and skips
them during the late scan, preventing devices from using memory that was
not actually protected.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8c9d6395d6a39..f20747725de42 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -167,14 +180,19 @@ static int __init __reserved_mem_reserve_reg(unsign=
ed long node,
>  	base =3D b;
>  	size =3D s;
> =20
> -	if (size && early_init_dt_reserve_memory(base, size, nomap) =3D=3D 0) {
> -		fdt_fixup_reserved_mem_node(node, base, size);
> -		pr_debug("Reserved memory: reserved region for node '%s': base %pa, si=
ze %lu MiB\n",
> -			 uname, &base, (unsigned long)(size / SZ_1M));
> -	} else {
> +	if (!size)
> +		return -EINVAL;

[Severity: High]
Does returning -EINVAL here needlessly waste slots in the reserve_failed_no=
des
array?

Since fdt_scan_reserved_mem_late() in drivers/of/of_reserved_mem.c naturally
skips zero-sized nodes with its own if (!size) continue check before
evaluating the failure array, returning an error here will consume one of t=
he
limited slots in reserve_failed_nodes for a node that doesn't need tracking.

> +
> +	err =3D early_init_dt_reserve_memory(base, size, nomap);
> +	if (err) {
>  		pr_err("Reserved memory: failed to reserve memory for node '%s': base =
%pa, size %lu MiB\n",
>  		       uname, &base, (unsigned long)(size / SZ_1M));
> +		return err;

[Severity: High]
Does propagating the -EBUSY error from early_init_dt_reserve_memory() break
valid legacy configurations?

If a region is validly pre-reserved by EFI runtime services, a standard
/memreserve/ entry, or a bootloader, early_init_dt_reserve_memory() correct=
ly
returns -EBUSY.=20

Prior to this patch, the error was ignored, allowing the node to be
initialized so devices could still parse its properties like no-map or
reusable. By returning the error here and skipping the node during
fdt_scan_reserved_mem_late(), these valid regions are completely removed
from the subsystem, which could cause legitimate device drivers to fail to
probe.

>  	}
> +
> +	fdt_fixup_reserved_mem_node(node, base, size);

[ ... ]

> @@ -357,8 +379,15 @@ int __init fdt_scan_reserved_mem(void)
>  		uname =3D fdt_get_name(fdt, child, NULL);
> =20
>  		err =3D __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> +		if (!err) {
>  			count++;
> +		} else if (err !=3D -ENOENT) {
> +			if (reserve_failed_nodes_cnt < MAX_RESERVED_REGIONS)
> +				reserve_failed_nodes[reserve_failed_nodes_cnt++] =3D child;
> +			else
> +				pr_err("too many failed regions, '%s' reservation failed\n",
> +				       uname);
> +		}

[Severity: Critical]
Can overflowing the reserve_failed_nodes array cause arbitrary physical mem=
ory
frees and valid device reservations being skipped?

If more than the maximum limit of statically placed reserved memory regions=
 fail
their early reservation, the reserve_failed_nodes array overflows. These
overflowed nodes are not recorded, and their count is not added to
total_reserved_mem_cnt.

During fdt_scan_reserved_mem_late() in drivers/of/of_reserved_mem.c, the ar=
ray
is dynamically allocated based on total_reserved_mem_cnt. However, the
unrecorded failed nodes bypass the skip check:

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem_late() {
    ...
		if (reserved_mem_node_reserve_failed(child))
			continue;
    ...
}

These nodes then steal array slots from valid regions that appear later. If
the unrecorded region's driver node_init callback subsequently fails, the
error path in fdt_init_reserved_mem_node() will call memblock_phys_free()
on the region:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
		if (nomap)
			memblock_clear_nomap(rmem->base, rmem->size);
		else
			memblock_phys_free(rmem->base, rmem->size);
    ...
}

Since the region originally failed reservation, this memory is owned by
another subsystem, resulting in an arbitrary free of in-use memory.

> =20
>  		/*
>  		 * Save the nodes for the dynamically-placed regions

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814081443.1061=
046-1-chenwandun1@gmail.com?part=3D1
