Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FF472F9F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347366; cv=none; b=dy34oqWvZ9MByvPHPHJoXAyTH7PR0+8gN0l46M9THiwFS4HsBehxTRYLhFvKFDZ309pWDcHruJbyFqWXaKOy9CEdj/sTLBKl7SEo/Uk/TVtBIKU01lmu+ojvJFCpEA97OHR4Q/x5WSW2ckVW5dS4NvEATM9PIVyrkr/QMXQDCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347366; c=relaxed/simple;
	bh=DQH0H7oOMyJnnqeOd1CeEcCvS7HlYJ2fhM0ZbnZ8g5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JNYfJYFbrRC7tpTm7BQ4+Gq8sIXHIFqe0TJPNc+3jlUxDnQtrgdNIP3Dz0ts/vrLvNpNvx6aGf6cPUmGoMrnhZ0r+664WflZBe2if6f9YkpSeTyk9r2g22tK1BY5hdKQPdQvaIwgWyK8BfYnlKCRKI6RT73BVZeKV6QRWGkGUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNIJdx76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNIJdx76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24431F00A3A;
	Wed,  2 Sep 2026 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347360;
	bh=Nuj2UiQ8IuKYDTgvmJOxHZ2iQPPdkGMXi9PToj0BXLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jNIJdx76htzLmJaymTZ63bCJQp49ABDIs6Yv7YUeOZ27C0G2aUKWCHo0g5EDX9AEO
	 UMI/qraCTcm5zxDgRDqKSylNqioYpTuTKEXO8idtTnunwD5jK41NMdnVyq2HXd+NMX
	 00QsGZup/5B7ssaGIURycQs8Z2aSu8aLIb+XWays7m84E4xveReIPWK57AKafDAXMq
	 G71y9zc0qgcWjXzx4rfDbdZYriqLFg8PvwaQv34xWcB1RNkbYuBvWow2kA4GZEaYw3
	 n9jEwAiOOSpeIwv7NTPxPRjWvydH+fBpmzYf7V5sy4hGe3UK5jlZnXbG5npJiDp0sw
	 qsAsI34MwX9+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/10] arm64: can_set_direct_map() if BBML3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902104712.2399797-6-vdonnefort@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-6-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:09:20 +0000
Message-Id: <20260902110920.A24431F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] can_set_direct_map() incorrectly evaluates to false during early b=
oot on BBML3 systems due to unfinalized capabilities, permanently disabling=
 runtime direct map splitting.
--

commit 145c29bbbc659d3113b49c46e076c4a0f62f5e20
Author: Vincent Donnefort <vdonnefort@google.com>

arm64: can_set_direct_map() if BBML3

Systems supporting BBML3 can split blocks without risking unhandled
page-faults. This commit allows setting the direct map unconditionally
for these systems.

> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index bbe98ac9ad8c6..58898ae53f5d1 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -99,7 +99,8 @@ bool can_set_direct_map(void)
>  	 * Realms need to make pages shared/protected at page granularity.
>  	 */
>  	return rodata_full || debug_pagealloc_enabled() ||
> -		arm64_kfence_can_set_direct_map() || is_realm_world();
> +		arm64_kfence_can_set_direct_map() || is_realm_world() ||
> +		system_supports_bbml3();
>  }

[Severity: High]
Does system_supports_bbml3() evaluate to false unconditionally during early
boot when CPU alternatives are not yet finalized?

If so, does this break direct map splitting at runtime? When map_mem() in
arch/arm64/mm/mmu.c is called during boot, it statically initializes
linear_map_requires_bbml3 based on can_set_direct_map(). Since CPU
alternatives are unpatched early on, linear_map_requires_bbml3 is permanent=
ly
cached as false.

Later, when direct map modifications are requested at runtime (e.g. by
secretmem), split_kernel_leaf_mapping() in arch/arm64/mm/mmu.c bypasses
block splitting because the static flag was evaluated early and cached as
false.

This leads update_range_prot() to attempt a lockless walk and modify the
block mapping, causing a block size mismatch warning and failing with
-EINVAL. Is there a way to evaluate this dynamically or ensure capabilities
are finalized before caching?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104712.2399=
797-1-vdonnefort@google.com?part=3D5
