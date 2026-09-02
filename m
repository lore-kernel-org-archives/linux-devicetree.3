Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DB37F312
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334998; cv=none; b=nPd3cJjdgEOEeA//8NUffdo5oOljL1CfhNf3nUdBEEGmQARGqJA3SbE+XRZcTYIUZZriWatlChiZC1ThuPAQFX7xzV7ch6lRmKlj7S6y1PYz6vD8tD8vRVFaETATjyBOCGJJwtcHqrzs1QRXXjO18lc2gTTufEfKf4UduDJbJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334998; c=relaxed/simple;
	bh=4YOacSLVll1I2h+xKWZE73M8vksuUMRncrYBK1eM9f4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kZZns+dDG6fHkl28p6qXT1lRHkPemFam7y3kd41254suQYE383FUH8FoCB2FPhO/7qfbmn/nQdeO1+9jPitsupFKuWCaxpstzwuR5jKmDaK2vTQ8Y75vZMtJerwhaC7jX3oWLI1Gduvh+voqqP85ojcah10mVwomB0sdzoa/xOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns3GbTk9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns3GbTk9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD551F000E9;
	Wed,  2 Sep 2026 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788334996;
	bh=Y/jzwXiGocEVS1O+yegQODFNtOYruPBs6Q1ROo1PuTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ns3GbTk9X6aN3qAQoWaBzs65S4yF0CKMfcHO7qoMYD0CamY26qLQsPY9zgsQvLLhl
	 u+igzVbStjX+qGzj8BrRcO6EKus2St0SagYSFQnVyVzm7nSE+ICRLoeHveF+ploB+F
	 W7nzEtUMwz19gVMZO+HH9XdQp6hDZQgTEhjGicWm0KFEn5QtQaIXbbeZRKWK9jt3Ko
	 5QVHVHW7B5vv1IriXoAbV+a28rVEH0tKuAwwG7G1htW1Ba4fF3d2avQgZ/ALStYwZ8
	 XCyglAyvcjXPxBrucYCgzTAqSNYpsfnDMG8eyeNJOtyTCP+qb8NAURWAjryYTaknKk
	 Z4+s6DZdraWtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902073116.802752-2-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-2-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 07:43:15 +0000
Message-Id: <20260902074316.5DD551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds 'RSV_HUGETLB' to the memblock debugfs flagname ar=
ray, but the string is unreachable dead code. `memblock_debug_show()` itera=
tes through the flags and breaks after printing the first matched (lowest) =
bit. Since `MEMBLOCK_RSRV_HUGETLB` (bit 7) is exclusively set alongside the=
 lower-bit `MEMBLOCK_RSRV_KERN` (bit 5) flag, the loop always prints 'RSV_K=
ERN' and breaks before reaching 'RSV_HUGETLB'.
--

commit 9e889d960694e60cb0ceee31e8dfe809d10a4085
Author: Meijing Zhao <zhaomeijing@lixiang.com>

mm: memblock: add missing HugeTLB flag name

This commit adds the missing "RSV_HUGETLB" entry to the memblock flagname
array so that debugfs can report the flag by name.

Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@=
gmail.com/

> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29fa..f2952d725c10b 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
[ ... ]
> @@ -2886,6 +2886,7 @@ static const char * const flagname[] =3D {
>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] =3D "RSV_NIT",
>  	[ilog2(MEMBLOCK_RSRV_KERN)] =3D "RSV_KERN",
>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] =3D "KHO_SCRATCH",
> +	[ilog2(MEMBLOCK_RSRV_HUGETLB)] =3D "RSV_HUGETLB",
>  };
> =20
>  static int memblock_debug_show(struct seq_file *m, void *private)

[Severity: Medium]
Will this new string ever be printed?=20

Looking at memblock_debug_show(), it iterates through the flags from lowest
to highest bit and breaks after the first match:

mm/memblock.c:memblock_debug_show() {
    ...
            for (j =3D 0; j < count; j++) {
                if (reg->flags & (1U << j)) {
                    seq_printf(m, "%s\n", flagname[j]);
                    break;
                }
            }
    ...
}

And in memblock_alloc_hugetlb(), MEMBLOCK_RSRV_HUGETLB is allocated logical=
ly
ORed with MEMBLOCK_RSRV_KERN:

mm/memblock.c:memblock_alloc_hugetlb() {
    ...
        if (__memblock_reserve(addr, size, nid,=20
                               MEMBLOCK_RSRV_KERN | MEMBLOCK_RSRV_HUGETLB))
    ...
}

Since MEMBLOCK_RSRV_KERN (bit 5) is lower than MEMBLOCK_RSRV_HUGETLB (bit 7=
),
does this mean the loop will always print "RSV_KERN" and break before reach=
ing
"RSV_HUGETLB", making this addition effectively dead code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902073116.8027=
52-1-chenwandun1@gmail.com?part=3D1
