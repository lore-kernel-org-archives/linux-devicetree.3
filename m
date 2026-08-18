Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10E36B061
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045916; cv=none; b=syMZEC3iTvdqKQ5tS3utQqI8ssgRcGIpiyt5u4ctqrz0DpuA+ZwTlFqcBCpomFaAy2Myqk7Y+kcSvorUIjlf6iNo3Za/btTDROwKPg6sFAzQeAwKIWtd19HtVvKlNlQ1biB3Wx2i3X4TynssmlqeL0XaGnJaJRmqmG+ly8sRal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045916; c=relaxed/simple;
	bh=ffdaodVRGP9CdHK75lxosLYfxIYIEcyqRWS9Jqacn7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pqI2UdMB0/UisApDIjYnMycMsHxflqqC13fwoVuLYi29uRkaFZ1bVGMYQaTe610EzPso5Qt64gdUEkmKHTpJtzMQ6hpukMIV1tTLrm+j9qLiqK1ivHahkUC0Q9lrND8ZrGlhPO1if6NSHSy/3sOfF1hk3QMlIgEcDJrI1W1hSdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP9IXrlN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP9IXrlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588661F000E9;
	Tue, 18 Aug 2026 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045914;
	bh=LYWM/vqjVhgqoXaaZlUuskjGXc/aDxT5/B9ctw7NduA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OP9IXrlNlI9GiG5PW+WCD1UIIehXp+oTdrIAqc09lML+qaofbx+cnAvl97IoTNnUj
	 trIGmo38s69Jdc01f0yhFuMQT9BpYo2jl5c41ZCgQo8JJplMFE3gcD3kIL2HpxfaQe
	 gXvfcSIC6dsF9AG/MFHKHetCwB+V6uQr69AQb5VaH6Rxgn9dV743SSOtc6he94rltI
	 AkIaXlbCUXpHHQhjVpge3CG6T5hSx8Q5kdrFSuBbnUXH+ZdGqL+iOOM4aKEMPzxb7z
	 q9k4/6m1Hns3zHDw9gx4AqDb1Z6duqiRW3bBy/7ei3S4q2MoVxnWcCnPO+DCfshh0Z
	 TFJToIShBGnAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated
 no-map region on init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818092420.2859026-5-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-5-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:38:33 +0000
Message-Id: <20260818093834.588661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `__reserved_mem_alloc_size()` ignores the error return value and c=
hecks `base =3D=3D 0` for failure, leading to Use-After-Free of reserved me=
mory regions.
- [High] Statically allocated reserved memory is unconditionally freed back=
 to the OS on driver initialization failure, violating the DT specification=
 and causing memory corruption.
--

--- Patch [4]: [PATCH v2 4/5] of: reserved_mem: release dynamically allocat=
ed no-map region on init failure ---
commit cf35e3414292da4070c89965dbb1bce8416755e9
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: release dynamically allocated no-map region on init failu=
re

Dynamically reserved-memory regions are added to memblock.reserved by
memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
reserved-memory region's driver initialization fails,
fdt_init_reserved_mem_node() cleans up the reservation. For no-map
regions it only calls memblock_clear_nomap(), leaving the range in
memblock.reserved and unavailable for normal memory use.

Fix it by freeing the region on init failure when it was dynamically
allocated.

Sashiko found this issue in [1].

Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -567,7 +568,7 @@ static int __init __reserved_mem_alloc_size(unsigned =
long node, const char *unam
>  	}
> =20
>  	fdt_fixup_reserved_mem_node(node, base, size);
> -	fdt_init_reserved_mem_node(node, uname, base, size);
> +	fdt_init_reserved_mem_node(node, uname, base, size, true);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but is it possible for
__reserved_mem_alloc_size() to ignore the error return value from
early_init_dt_alloc_reserved_memory_arch() and only check if base is 0 for
failure?

If early_init_dt_alloc_reserved_memory_arch() fails after setting *res_base
because memblock_mark_nomap() fails:

early_init_dt_alloc_reserved_memory_arch() {
        ...
        *res_base =3D base;
        if (nomap) {
                err =3D memblock_mark_nomap(base, size);
                if (err)
                        memblock_phys_free(base, size);
        }
        ...
}

The base variable in __reserved_mem_alloc_size() will be non-zero, but the
memory has already been freed. Since __reserved_mem_alloc_size() only checks
if base is 0, it passes the error check and registers the freed memory.

Could this result in a use-after-free if the OS hands the memory out to
other subsystems while it is still mapped or used by the reserved region?

[ ... ]

> @@ -707,7 +710,8 @@ static void __init fdt_init_reserved_mem_node(unsigne=
d long node, const char *un
> =20
>  		if (nomap)
>  			memblock_clear_nomap(rmem->base, rmem->size);
> -		else
> +
> +		if (dynamic || !nomap)
>  			memblock_phys_free(rmem->base, rmem->size);
>  		return;
>  	} else {

[Severity: High]
This isn't a bug introduced by this patch, but could this logic
unconditionally free statically allocated memory without the no-map
property back to the general pool?

If a driver fails to initialize a statically defined reserved memory region,
and the region does not have the no-map property, it is freed here.

According to the Device Tree specification, if a driver fails to initialize,
the OS must not use the memory for general purposes unless the reusable
property is explicitly present.

Will this cause kernel memory corruption if the general buddy allocator
hands this memory out to unrelated kernel subsystems, but the firmware or a
coprocessor still expects the region to remain reserved and accesses it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818092420.2859=
026-1-chenwandun1@gmail.com?part=3D4
