Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ABF33C1B7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884008; cv=none; b=epW4ymIYsdj21xJnS4+eApmDRivsm/zRf70IGmcC/Pw6dChSwuqmLQ1a0DGuz2gu+Wkhbje/ZwRMcEZlwCtU7pralAg/PYPThJceig6pifZgU494prp7UVO3BPqJTRAwrEWua4TLBNydAJkhHC05OXdlbQMYT1oe479oqxP1tFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884008; c=relaxed/simple;
	bh=os778mhmxiFRuKdG1gYjixpQLv3n1AMtEItADs+ox2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dnVDunBA1E/cUhftZ6rptzZObfZbXBhNB5WEAjsQYWl2rhvjaAVyHLfp0zYKYhgXSdK0Nurxl9bqIBuyWqEFPyYUOarD1612y6DNhyvqu+4+OIdWDUZE2QKczsldq6vsm55+xGW+PrERigezWzy7oAM0SpSdG3g9tLwGp+TefP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc8yBds+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc8yBds+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD571F00A3A;
	Tue,  8 Sep 2026 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884003;
	bh=1l8Hyj+FdeO/N8wGq/9zjBoxuj6s7d28JmXRyZKsHhQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dc8yBds+GMczzpr6vGBb5YbRvgqDbIOx9cjsOmt9iIlnZOV7tDDlZO4g0f95fMoRN
	 QrCZwD7BBXkisVlIHfblkp18k6dZ9tjWaGYpoRJm4kTpd3HLob0B1DbsM3WvvO1oCG
	 HGeHz9DveoHS1G20uXWztrzX51LVWYWDBzyi8U6M74/k1mHk3oyvFqK0i/h+YDbaPR
	 nnsgOf4KMd5AbE61LhNCACNb8Ngvb2P+/Iposnn8ikAh0WXsn1g1Mon2oNfxytcKP5
	 mVusLx4VH+Gvs/BgOoIf2gCJuV5NKGmJeDhZbyyWtMCb7ab4flpJxXkY6GlJF6SVyW
	 vvTnrvTwhJLsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] memblock: rename KHO_SCRATCH to KHO_NOPRSRV
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908155639.2496551-3-pratyush@kernel.org>
References: <20260908155639.2496551-1-pratyush@kernel.org>
 <20260908155639.2496551-3-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:13:22 +0000
Message-Id: <20260908161323.2AD571F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Typo in the dummy fallback function for `memblock_set_kho_noprsrv_o=
nly()` when `CONFIG_KEXEC_HANDOVER` is disabled.
- [Low] Stale references to 'scratch' memory left unupdated in comments in =
`arch/x86/kernel/e820.c`.
--

commit 1cbb2e7144e320e54e1042768c9a90f6433c5d65
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

memblock: rename KHO_SCRATCH to KHO_NOPRSRV

This commit renames the vague MEMBLOCK_KHO_SCRATCH flag to MEMBLOCK_KHO_NOP=
RSRV
to better reflect that it represents memory with no preservations during ea=
rly
KHO boot. It updates the memblock functions and comments accordingly.

> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index eb72537bc0b19..2a6e19f952517 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -1363,7 +1363,7 @@ __init void e820__memblock_setup(void)
>  	 * After real mode trampoline is allocated, we clear that scratch
>  	 * marking.
>  	 */

[Severity: Low]
This isn't a bug, but should the block comment here in e820__memblock_setup=
()
also be updated? It still refers to "scratch marking" and earlier in the bl=
ock
to "scratch memory", which seems to miss the commit's intent to update memb=
lock
comments to use "noprsrv".

> -	memblock_mark_kho_scratch(0, SZ_1M);
> +	memblock_mark_kho_noprsrv(0, SZ_1M);
> =20
>  	/*
>  	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and

[ ... ]

> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index db3b106c63351..186b965cfc896 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h

[ ... ]

> @@ -615,11 +615,11 @@ static inline void memtest_report_meminfo(struct se=
q_file *m) { }
>  #endif
> =20
>  #ifdef CONFIG_KEXEC_HANDOVER
> -void memblock_set_kho_scratch_only(void);
> -void memblock_clear_kho_scratch_only(void);
> +void memblock_set_kho_noprsrv_only(void);
> +void memblock_clear_kho_noprsrv_only(void);
>  #else
> -static inline void memblock_set_kho_scratch_only(void) { }
> -static inline void memblock_clear_kho_scratch_only(void) { }
> +static inline void memblock_set_kho_noprsev_only(void) { }

[Severity: Low]
Is there a typo in the name of this dummy fallback function? It is named
memblock_set_kho_noprsev_only (with 'ev' instead of 'rv').

Could this cause a build failure due to a missing function declaration if c=
ode
compiled without CONFIG_KEXEC_HANDOVER attempts to call
memblock_set_kho_noprsrv_only()?

> +static inline void memblock_clear_kho_noprsrv_only(void) { }
>  #endif
> =20
>  #endif /* _LINUX_MEMBLOCK_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908155639.2496=
551-1-pratyush@kernel.org?part=3D2
