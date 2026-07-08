Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005823F4131
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495458; cv=none; b=SFxd/FpQcFSVHIxCWPz9pRKnO9Yc9XHOl6ajVxfC6L5MpUR5mQCDbAu8iOPOJMjEM1idBIX2oi8E1K/zGyWaMzFo8+VAZX5cKoOtWw+JMH4/ihnuAHPE3rU3FRYpgzAO45aHJZZG6umcQJBMmIl+DrPg1Cm1qS4oPDHa8h+7oP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495458; c=relaxed/simple;
	bh=O0wv3Csryudk5GhD2uOIcu7qFp26Y8PyocwsCVr//iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=htVilajPQiOsfai93YXhkeY6QUhrjpKRmoNg3D67IXvsNDxRj/diQ+rzqj9dS5Gbiqbm7rN2f0GO6eoIzOYhR9TuCJkE0paWH9QtjWJihusqHoSlRo9KhKs1IILt2RNfrB917jld9vnbUuNeClWC5LtdQwT+I1FVV2CwIF27cag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJ501pHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJ501pHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79BA1F00A3F;
	Wed,  8 Jul 2026 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495440;
	bh=dFZ+nm+si86bVhFwMtI+93Jd9gfH2aaNKDJTjOUU9Xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJ501pHL/NSd/2UKzKL9OdZrNeF5bL+Dh2met/ZjYJJ/zu4/xh50QO/STa0/Tv0E8
	 dNEwttgmjdAT7QuX1pHNo/IrG+BAkMxfWhe/Tma2iWraBudoAnkXGOMs0jdsWEZKRB
	 Ju9Qp7ieBB2OXlriVfesxGkkMJy8ZzIGOtlVjl1fB2Ae6oeGvVTjweNRLVsk5BRaOW
	 i2rpClYF7jhAloW8/v9/cx2ylUzdC6LF24wW6NAPHb+FCE0TbUpXO40Wedtt/ux8Ui
	 r0juYbJBkuQYTb/AM3NWqI6T7ugiDOMl3kwkDOxCNb1LOeyjxVqwvZkYGpAWHgrzic
	 cL8ammRKhzt8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/26] kallsyms: Annotate static information into
 meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-16-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-16-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:23:59 +0000
Message-Id: <20260708072359.B79BA1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The meminspect regions for kallsyms static arrays are exported w=
ith a hardcoded size of `sizeof(void *)`, which severely truncates the expo=
rted data.
--

--- Patch [16]: [PATCH v3 16/26] kallsyms: Annotate static information into=
 meminspect ---
commit 06ced28af88b52acf5d6e8d844fee7f21cd5492c
Author: Eugen Hristev <ehristev@kernel.org>

kallsyms: Annotate static information into meminspect

This commit adds annotations for vital kallsyms static arrays into meminspe=
ct.
The information includes symbol numbers, offsets, names, and tokens, stored=
 in
a dedicated meminspect section.

> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858afd..e71c085ec837c 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -31,9 +31,18 @@
>  #include <linux/kernel.h>
>  #include <linux/bsearch.h>
>  #include <linux/btf_ids.h>
> +#include <linux/meminspect.h>
> =20
>  #include "kallsyms_internal.h"
> =20
> +MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
> +MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));

[Severity: Medium]
Does this hardcoded size truncate the exported data?

By specifying sizeof(void *) (which is 8 bytes on 64-bit systems) for the
size of these arrays, it appears the vast majority of the kallsyms data
will be omitted from the exported meminspect regions.

Should this use the actual size of the arrays instead so diagnostic tools
can resolve symbols properly when reading the meminspect table?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D16
