Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D212FF69
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559091; cv=none; b=oY+sx9yHc7eay1eamyyb7dW/WwB8T5/nG3Rm2Py777JHglljLaVuS/QOQA0W/DfWHi+l/SvSs+cmk8DkMhV5L7smrKKavqc5cW7Jw1/RWV1Dj8qjeVoEYUhrWpkFW1GEHv/u70eUvEtEfNPDPC7hy53VaRC0oG8/KPalbdJoMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559091; c=relaxed/simple;
	bh=443I8ep7J2Iklvo7MAbZOdRfh+V4Ch95NMM+2hxlYbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oelh/MT4JH+wBMhvjOAWyW1QFPnFZ0HcpUtCkZq1FLL8RDzWLjOgQ/Xz80gTHQfCZDLzqD+GwAB/DVGItnLfWgcnIAx7wFJMv6kV6hIoef+oqrpOg62rNMCl2TEg+FpUt9uVIkQVSjR7dLb+/yW8eqdSVwEhqxG95Ag+zMQB30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8Z0Jlri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8Z0Jlri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099201F00893;
	Thu,  4 Jun 2026 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780559090;
	bh=7/3/hSywwvTVBZg8G6NoD27ZButbfN+YemP4DkRkmrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8Z0JlriEnyaeBFf2te6MKfan2sIAI7NZR908FI9Hp3NZH2opVH1zPFjWD94kn30I
	 0N/DrOT15I0ZLA+9R+4cawmCpkv6nvGPNeEGRu1QSE4F4VV05992CMJDmllwAe80Ge
	 L3dVMG383YFEVIa+aRo0J4D1R5gwWKg3u4nLyRiKDPKmz6nT8b76GaUM0SZA6mMOyP
	 GsEf8gpIRPifydPGu8M8c2uB+tc3WC1iYP4TLoGI+YljLWaI3c5/OsRqjXQASXWJQC
	 y0TPY8U0LoiHMyDqTV0jE6iyWrd1Gwn4vNXsp3Q6pxMKDtD9v3gL5abBOmP8UVCp+w
	 WNP5Buy0z0fEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] of: reserved_mem: add config to extend dynamic
 reserved memory regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260604073611.3954433-3-chenwandun1@gmail.com>
References: <20260604073611.3954433-3-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:44:49 +0000
Message-Id: <20260604074450.099201F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds write on the static `reserved_mem_array` if dynamic =
allocation of the reserved memory array fails.
--

commit 716aa35cecc2a52f29b8fd8fd9a0aae87756ea2e
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: add config to extend dynamic reserved memory regions
   =20
Nowadays, the dynamic reserved memory regions is 64 by default, If
the count of reserved memory regions defined in DTS bigger than 64,
only 64 reserved memory can be handled properly.

So add a config to configure the actual dynamic reserved memory
regions count instead of modify the code.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 056c4179f549c..73d7d7865518e 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -343,7 +343,7 @@ int __init fdt_scan_reserved_mem(void)
>  			count++;
> =20
>  		if (dynamic_nodes_cnt >=3D MAX_RESERVED_REGIONS) {
> -			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
> +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d), try e=
xpanding CONFIG_OF_RESERVED_MEM_DYNAMIC_REGIONS.\n",
>  				    MAX_RESERVED_REGIONS);
>  			continue;
>  		}

[Severity: High]
This is a pre-existing issue, but there appears to be an out-of-bounds
write on the static reserved_mem_array if dynamic allocation fails.

In fdt_scan_reserved_mem(), the total count of reserved memory regions (and
thus total_reserved_mem_cnt) can exceed MAX_RESERVED_REGIONS because static
regions are not capped by the dynamic_nodes_cnt >=3D MAX_RESERVED_REGIONS c=
heck.

Later, alloc_reserved_mem_array() allocates a dynamically sized array of
total_reserved_mem_cnt elements. If memblock_alloc() fails, it returns early
without resetting total_reserved_mem_cnt to MAX_RESERVED_REGIONS:

drivers/of/of_reserved_mem.c:alloc_reserved_mem_array() {
	new_array =3D memblock_alloc(alloc_size, SMP_CACHE_BYTES);
	if (!new_array) {
		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -=
ENOMEM);
		return;
	}
...
}

When fdt_scan_reserved_mem_late() subsequently initializes the static regio=
ns,
it calls fdt_init_reserved_mem_node() for each. The bounds check relies on
the uncapped total_reserved_mem_cnt:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
	struct reserved_mem *rmem =3D &reserved_mem[reserved_mem_count];

	if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
		pr_err("not enough space for all defined regions.\n");
		return;
	}
...
}

Since total_reserved_mem_cnt wasn't reset on failure, the check allows
reserved_mem_count to exceed MAX_RESERVED_REGIONS. Does this result in
out-of-bounds writes to the static reserved_mem_array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604073611.3954=
433-1-chenwandun1@gmail.com?part=3D2
