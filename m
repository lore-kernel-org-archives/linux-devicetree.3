Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CE3603C0
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045693; cv=none; b=qiJ+Njb53/mF+ji8iiVdkF43QkCqw9FVi91lsb7YZjvp4QnOlqyaXx8JZUuTQsHRk/EvGNzHNQ0dVY4Xu31JX/52juWoTe7vs7TYvxI1I1VbqivXsgdW5/AlDixySNMWQR9puuI7uwf++fQo/24JSZWy3Yx/CLnP8Xh17Dkk8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045693; c=relaxed/simple;
	bh=g+qFCTGHKqRltBI5Kg0zGo9NamhCCA0rAH7Hf/tuGBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSbyef0ke2GYFYzObhUDMNIxkK20xTAYIolhgw6NXxzIIRqjY6ABVQ1cvI384Exw0YVuetlZmbihAyqNSLUnqKHicluhfLrI1+ux1/vViAeR1Z4JwPchZAyJm4MEaQ91N8iG51KCPAkeplCwXlf0fl+I3qXB6A37GFxRmhxLyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhmQMyz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhmQMyz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0AB1F000E9;
	Tue, 18 Aug 2026 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045691;
	bh=ZBJeZK8cbsU2nQDZTDUZ/XRkppWtjoMqtyaTlpIta2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PhmQMyz9kylboV4dH+xU2q6Zbz+aDYoLVq6/aiSm9W7NIxnlJRSyp8txAmmJxe0xC
	 8zvSN1sciC9L/0f+aXaY7ub9EtG9yi6axg8RcqLry5EXM0JmDbCDwY9MZMquyP+GBm
	 j7HFdWqFgiYj/oaINj0vgQ6k/lQNMydDKdr/usiCjeo9rMZJOIsz2KtENLS+2+gllw
	 rOLfVfCoBOa4UwHKJKy6aWdic1zHruNIUuIcpEkvP5jZetLmaDB+Nxi89UI7M3iggM
	 yth2eNKy7azRnjLsQRPrtPSzhlsRdX+fEdj2DDSI9nEGqFrdoSTRqun7D2IPAi72P7
	 SNxr153ApagpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on
 init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818092420.2859026-6-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-6-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:34:50 +0000
Message-Id: <20260818093450.AE0AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `__reserved_mem_alloc_size`, an allocation error when marking a=
 region as `NOMAP` is ignored, leading to a use-after-free of memblock memo=
ry.
--

--- Patch [5]: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory=
 on init failure ---
commit 35ad8d6e4b86dc63d754a8415950fc7ab54dfce4
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: retain static no-map memory on init failure

Clear MEMBLOCK_NOMAP only for dynamically allocated regions on init failure.
Static regions are initialized after paging_init() and should retain their
memory states.

Link: https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index a0df075a9902e..0c5163ce601ea 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -708,7 +708,7 @@ static void __init fdt_init_reserved_mem_node(unsigne=
d long node, const char *un
>  		pr_info("node %s compatible matching fail\n", rmem->name);
>  		rmem->name =3D NULL;
> =20
> -		if (nomap)
> +		if (dynamic && nomap)
>  			memblock_clear_nomap(rmem->base, rmem->size);
> =20
>  		if (dynamic || !nomap)

[Severity: High]
This is a pre-existing issue, but while looking at reserved memory error
handling in this file, I noticed a potential memory corruption when dynamic
allocation fails.

In early_init_dt_alloc_reserved_memory_arch(), the base address is assigned
before the nomap check:

base =3D memblock_phys_alloc_range(size, align, start, end);
...
*res_base =3D base;
if (nomap) {
        err =3D memblock_mark_nomap(base, size);
        if (err)
                memblock_phys_free(base, size);
}

If memblock_mark_nomap() fails, the memory is freed, but *res_base still
holds the freed address instead of being cleared.

Then in __reserved_mem_alloc_size(), the code checks the base address inste=
ad
of the return value ret:

ret =3D early_init_dt_alloc_reserved_memory_arch(size, align,
                                               0, 0, nomap, &base);
if (ret =3D=3D 0)
        pr_debug("...");

if (base =3D=3D 0) {
        pr_err("failed to allocate memory...");
        return -ENOMEM;
}

Since base contains the freed address instead of 0, does this allow the
freed memory to be registered and later handed out by the buddy allocator
while still being incorrectly used as reserved memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818092420.2859=
026-1-chenwandun1@gmail.com?part=3D5
