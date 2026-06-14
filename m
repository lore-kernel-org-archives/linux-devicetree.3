Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5D3C4165
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444832; cv=none; b=Or72LbPrI4xFlOTfVHL6mnRzmrJyRGNfgbGbsyNEpRHozlbz1jmMOeIQGjK1Bbt8pZmRUOessX9I6j16QFefaj/GpvBEwP/3BG4gonmIrTK84r0y7xKvdIOKY2YYxeE2K/mrsnJq8hh9BzO8I2eFwDgq7PYG757i6iuuRy2Tml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444832; c=relaxed/simple;
	bh=w4KiHWLuPkbfrL/0Fe7LlK+y2cRki+NotIVjQVvOTsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B1i+lSEaEgu8lUHLLJQ8iQxuorTMV3vhefFUGFxQJnO0v/nVKK3xVlWwnXddC5PatnovIi31kyvsjDVHRc5/BfrTrK4XisHvynJ/tXe6/jRTPsX3VaLs2pEFZXnZy7+QunsutwrJHkev5RcLYlHMY8luVZjrgGHrMyf42KqBSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diFWfM7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diFWfM7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C230B1F000E9;
	Sun, 14 Jun 2026 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781444830;
	bh=kvd5iE4bWLBTjhVI3f/v/8SAEIDGyN60hVc4ViUsDck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=diFWfM7NW5pQrRAAzY++SOpoW83BzUmgO+U5Rq8xyy11qooyUupYKJzERbsvoy2ry
	 YX2WZMSjOv1+sSCwNWCzqb/4FAjmePIyeP7TW+GDdE0Nrd9DJGwe17Eq8gtATlx1hP
	 3YVpcKM6zca65Wz0GsGLpFM5lZ3ll4itcdsDg4f8mx0J43yhr9Ym9UrRHIBK0A4uQe
	 gVw2IPKSP4R7Aq5TtytJIh31JJCr/dvx7yGmqWlIiFzrl8v/u61yvJlSJSFtAQyMrB
	 KKASS75u5prKX+TlIeWbKSuZU+aaIJ4f2i4JtfKhN0sfokAT2+pVcwujjuwzsFNpn0
	 vACrYrvb39pEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] of: reserved_mem: prevent OOB when too many
 dynamic regions are defined
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sang-Heon Jeon" <ekffu200098@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614133807.2165124-2-ekffu200098@gmail.com>
References: <20260614133807.2165124-2-ekffu200098@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 13:47:09 +0000
Message-Id: <20260614134709.C230B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Global buffer overflow on static reserved_mem_array when dynam=
ic allocation fails
--

commit ce2daed7217e851888336023e70ee6c49e1f66cd
Author: Sang-Heon Jeon <ekffu200098@gmail.com>

of: reserved_mem: prevent OOB when too many dynamic regions are defined

This commit adds bounds checking for dynamically-placed /reserved-memory
subnodes to prevent out-of-bounds writes to the local dynamic_nodes array
in fdt_scan_reserved_mem().

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8d5777cb5d1b3..499b769e98096 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
[ ... ]
> @@ -348,10 +349,17 @@ int __init fdt_scan_reserved_mem(void)
>  		 * or marked as no-map. This is done to avoid dynamically
>  		 * allocating from one of the statically-placed regions.
>  		 */
> -		if (err =3D=3D -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
> -			dynamic_nodes[dynamic_nodes_cnt] =3D child;
> -			dynamic_nodes_cnt++;
> +		if (err !=3D -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
> +			continue;
> +
> +		if (dynamic_nodes_cnt =3D=3D MAX_RESERVED_REGIONS) {
> +			pr_err("too many defined dynamic regions, skip '%s'\n",
> +			       uname);
> +			continue;
>  		}
> +
> +		dynamic_nodes[dynamic_nodes_cnt] =3D child;
> +		dynamic_nodes_cnt++;
>  	}
>  	for (int i =3D 0; i < dynamic_nodes_cnt; i++) {
>  		const char *uname;

[Severity: Critical]
This is a pre-existing issue, but could the initialization sequence still
leave the kernel vulnerable to a global buffer overflow later on?

In fdt_scan_reserved_mem(), total_reserved_mem_cnt is updated to the
total count of regions, which could exceed MAX_RESERVED_REGIONS due to
statically-placed regions.

Later, fdt_scan_reserved_mem_late() calls alloc_reserved_mem_array() to
dynamically allocate a larger array:

drivers/of/of_reserved_mem.c:alloc_reserved_mem_array() {
    ...
    new_array =3D memblock_alloc(alloc_size, SMP_CACHE_BYTES);
    if (!new_array) {
        pr_err("Failed to allocate memory for reserved_mem array with err: =
%d", -ENOMEM);
        return;
    }
    ...
}

If memblock_alloc() fails, it returns early but does not reset
total_reserved_mem_cnt back to MAX_RESERVED_REGIONS.

When iterating over the regions, fdt_init_reserved_mem_node() relies on
total_reserved_mem_cnt for its bounds checking:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
    if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
        pr_err("not enough space for all defined regions, skip '%s'\n",
               uname);
        return;
    }
    ...
}

Since total_reserved_mem_cnt remains inflated, this check will fail to prot=
ect
the statically-sized reserved_mem_array, leading to an out-of-bounds write.

Should alloc_reserved_mem_array() reset total_reserved_mem_cnt to
MAX_RESERVED_REGIONS on the error path to avoid overflowing the static
reserved_mem_array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614133807.2165=
124-1-ekffu200098@gmail.com?part=3D1
