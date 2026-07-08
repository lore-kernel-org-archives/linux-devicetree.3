Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF53E7BA1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494981; cv=none; b=WlDMrqL5R6c/hLR2c7mnZIDSXZUCrRlD7uST/1pDdEvWHOb6eDXJPeXn61+djBUqlqEZCeJ+yzhb80e0/ZmhOVCqB5zLNcZypi5opgTGzF8LO1Rbx1grDAE4enIJIEt5AOKH3hemIpnLYU9SxnJKb7FZsnGX4A4b0epqBYb70xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494981; c=relaxed/simple;
	bh=PpJ59Rgff5oQTneMZ5UFy//x0OLtbfbKSwBXWIAs7vs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y9D4CsDB3QMzxdcGLn3nqw1f83KMjYfNSUVZuyTek4GsfIeO98EZZqPC5bZnDEPkA3ETVSol2gLZ2LDPR2H6wIJb1QvTIdg0wWBI3x/DqoQTVSJvLUdEyOxEKwwknMEfkw94wzWz7uy4Ndac8Ei1jjbY18wKN6EOt3ZcTYPxkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPFzP/SW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPFzP/SW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2561F0155B;
	Wed,  8 Jul 2026 07:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494964;
	bh=Gbw66bZRERBPBiFQN3UXUp9V5Frl15HRg5lSheD132k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jPFzP/SWOgwCavuYADJ5xGwHeE8PtIgW6WeJB+6MUkG5hoyqd1kBVpPgZrawOJ3yx
	 NKVZH7s6/HT42HzvAtS33n3FlkUYez/CMSTKGiW/F/ALWLUdP0lpgNKZw8PhedR0dS
	 LQqNgPNaVJmhIvD6FT+19nR6Xwuk15jVTdVaAMqSKB6lEfqAd5u/1nqshLXSO5nr4X
	 76CDrxUX5Tw/pbz0hnR6OWauNaVhbLAJE8p+WdOgsD36iVBbe/K0CMAswubv3QIHA8
	 sMXaB6dDI55tQElumjqMX1VhnXulhq9qvVarWS2bkfkMkne5xiGKkvLrexIsB7/uuR
	 dkPMwW/RN1QXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/26] kernel/fork: Annotate static information into
 meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-8-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-8-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:16:03 +0000
Message-Id: <20260708071604.0F2561F0155B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Invalid physical address translation for kernel symbol in meminspe=
ct.
--

--- Patch [8]: [PATCH v3 08/26] kernel/fork: Annotate static information in=
to meminspect ---
commit 1636f69c14cba35cc52768f137946c4cd0a44fdc
Author: Eugen Hristev <ehristev@kernel.org>

kernel/fork: Annotate static information into meminspect

This commit annotates the vital static variable nr_threads into the
meminspect inspection table. The annotated information is stored in a
dedicated meminspect section for later retrieval.

> diff --git a/kernel/fork.c b/kernel/fork.c
> index 175c73bbe2bfc..ec99066eedd24 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c

[ ... ]

> @@ -142,6 +144,7 @@
>   */
>  unsigned long total_forks;	/* Handle normal Linux uptimes. */
>  int nr_threads;			/* The idle threads do not count.. */
> +MEMINSPECT_SIMPLE_ENTRY(nr_threads);
=20
[Severity: High]
This is a pre-existing issue, but adding this annotation exposes a bug in t=
he
meminspect framework.

When MEMINSPECT_SIMPLE_ENTRY(nr_threads) is evaluated, the kernel symbol
nr_threads is passed to the framework. During boot, the framework processes
these entries and attempts a physical address translation:

kernel/meminspect/meminspect.c:meminspect_prepare_table() {
    ...
    inspect_entries[e->id].pa =3D virt_to_phys(inspect_entries[e->id].va);
    ...
}

Does this translation work correctly for kernel symbols? Using virt_to_phys=
()
on a kernel symbol (which resides in the kernel text/data mapping rather th=
an
the linear map) can return an invalid physical address or trigger a panic on
architectures like x86_64 and arm64 when CONFIG_DEBUG_VIRTUAL is enabled.

Could the underlying framework be updated to use __pa_symbol() for these
statically registered entries instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D8
