Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDAB27CCE0
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279392; cv=none; b=hT2YSSVVqjXmh8GFqj98G8kfMf/7ZaXBMAP8Dx4zmClHmFZNXWbF6R1gNFp250IVs+r/7bncSTFHv90Cc0rJxANrYjuy/23rCApzya2aCC7eb2LKLqTECOjLUADq4T2pe0Vu4kpGd1Zzya3gqw8Hl9qWVLvUCZ2Fp7Hyyv1SSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279392; c=relaxed/simple;
	bh=9WbG6a8vVwqjD2KKXV3w2RwhdIp32tV+bBbysiVWJh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0KXjAqyH/UNXLURJwLNb5ACkz4gYktkHD9PtdL1rJfu7gsznIz1282wXAzpTPi3do1wQgtnaQMd2rvaGalOQLg75RD9PfdVZFyZaAePifveVsURxIzsg04n/h7LZOKAnf688oSXkqBTMmcCyiRODBqf/FrVRl8Ngw18UrvzzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs1uK4jD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs1uK4jD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CE71F000E9;
	Sun,  5 Jul 2026 19:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279390;
	bh=/pPRyK4yDT0lYI3lMhpoC47jPSKkxz7R5zBI8y20mkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rs1uK4jDGVrl/F8cOa5uEmL3uqrMbLjgelO0mzDG99LG7t1GgVxCK2dKDehn8fkp4
	 +JEqH+zOpjqDa7Csq6QiG1sjqnwkNi7JuO1fDNXZHq0Xt5XI80EbObBeV27ZOU9rsC
	 krhIg/db1sWjM5AvkxYtMpIsCODKJfJ9OlapgG2Y1avI908cKevtwlSefGZjVO+SJf
	 UKrQP5M52XDVigOzpfQUFVA9nO+HYFf5sc+CV4L1EDRLY+eA8/d74DNLoPCPv/rHWB
	 jQPRliWGZjpH6XYWkh9lruv2bRUPlFR7ZbpRIRRP8HC8Iq1qYQ+kICmud4zggGHzrs
	 aWAPVCqj651AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/13] temp: add LPAC regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-9-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-9-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:23:09 +0000
Message-Id: <20260705192310.49CE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing 'variants' attribute on CP_LPAC_PROTECT_CNTL makes an A7XX=
-only LPAC register available to older hardware.
- [High] UCHE_DEBUG_CNTL_1 overlaps with existing UCHE_UNKNOWN_0E12 and UCH=
E_GBIF_GX_CONFIG registers at offset 0x0E12.
- [High] CP_LPAC_RB_* registers are applied to A8XX where they conflict wit=
h CP_SLICE_MEM_POOL_DBG_*_PIPE registers.
- [Medium] The patch is explicitly marked as a temporary commit ('temp:') a=
nd directly modifies a file that should be synchronized from Mesa.
- [Low] Registers are inserted significantly out of order regarding their o=
ffsets.
- [Low] Redundant inline bitfield definitions instead of reusing the existi=
ng bitset type.
--

commit 6a32a45a3775682b98c44924ebd725197283df72
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

temp: add LPAC regs

This patch adds LPAC register definitions to the adreno a6xx XML database.
It notes that the definitions are pulled from a Mesa merge request.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416

> temp: add LPAC regs
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416
>=20
> should we merged and we should sync to mesa instead

[Severity: Medium]
This isn't a bug, but since this patch is explicitly marked as a temporary
commit ("temp:") and notes that we should sync from Mesa instead, should
these register definitions be finalized and synchronized through the Mesa
rnndb workflow before merging upstream to avoid divergence?

> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/=
drm/msm/registers/adreno/a6xx.xml
> index 3349c01646e12..bb49f6a61a9af 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -276,6 +276,11 @@ by a particular renderpass/blit.
>  		<bitfield pos=3D"1" name=3D"ACCESS_FAULT_ON_VIOL_EN" type=3D"boolean"/>
>  		<bitfield pos=3D"0" name=3D"ACCESS_PROT_EN" type=3D"boolean"/>
>  	</bitset>
> +	<reg32 offset=3D"0x0B09" name=3D"CP_LPAC_PROTECT_CNTL">
> +		<bitfield pos=3D"3" name=3D"LAST_SPAN_INF_RANGE" type=3D"boolean"/>
> +		<bitfield pos=3D"1" name=3D"ACCESS_FAULT_ON_VIOL_EN" type=3D"boolean"/>
> +		<bitfield pos=3D"0" name=3D"ACCESS_PROT_EN" type=3D"boolean"/>
> +	</reg32>
> =20
>  	<reg32 offset=3D"0x084f" name=3D"CP_PROTECT_CNTL" type=3D"a6xx_cp_prote=
ct_cntl" variants=3D"A6XX-A7XX"/>

[Severity: High]
Does CP_LPAC_PROTECT_CNTL need a variants=3D"A7XX-" attribute here? By omit=
ting
the variants attribute, this A7XX-only LPAC register will be generated and
applied for A6XX hardware, which could write to an undefined register at
0x0B09 during early hardware initialization and cause an access fault.

[Severity: Low]
Instead of manually defining these bitfields inline, could this register
reuse the existing a6xx_cp_protect_cntl bitset by specifying
type=3D"a6xx_cp_protect_cntl" to prevent duplication?

[Severity: Low]
Also, this register at offset 0x0B09 is inserted before 0x084f. Should these
be kept ordered by offset to prevent overlapping definitions and XML parser
warnings?

[ ... ]

> @@ -333,6 +338,11 @@ by a particular renderpass/blit.
>  	<reg32 offset=3D"0x0845" name=3D"CP_CRASH_DUMP_STATUS" variants=3D"A8XX=
-"/>
>  	<reg32 offset=3D"0x0908" name=3D"CP_SQE_STAT_ADDR" variants=3D"A6XX-A7X=
X"/>
>  	<reg32 offset=3D"0x0909" name=3D"CP_SQE_STAT_DATA" variants=3D"A6XX-A7X=
X"/>
> +	<reg64 offset=3D"0x0b00" name=3D"CP_LPAC_RB_BASE" variants=3D"A7XX-"/>
> +	<reg32 offset=3D"0x0b02" name=3D"CP_LPAC_RB_CNTL" variants=3D"A7XX-"/>
> +	<reg64 offset=3D"0x0b04" name=3D"CP_LPAC_RB_RPTR_ADDR" variants=3D"A7XX=
-"/>
> +	<reg32 offset=3D"0x0b06" name=3D"CP_LPAC_RB_RPTR" variants=3D"A7XX-"/>
> +	<reg32 offset=3D"0x0b07" name=3D"CP_LPAC_RB_WPTR" variants=3D"A7XX-"/>
>  	<reg32 offset=3D"0x090a" name=3D"CP_DRAW_STATE_ADDR" variants=3D"A6XX-A=
7XX"/>
>  	<reg32 offset=3D"0x090b" name=3D"CP_DRAW_STATE_DATA" variants=3D"A6XX-A=
7XX"/>

[Severity: High]
Do these offsets conflict with existing A8XX definitions? Using
variants=3D"A7XX-" applies them to A8XX, but A8XX already defines
CP_SLICE_MEM_POOL_DBG_ADDR_PIPE at 0x0b00, and the A8XX LPAC ring buffer
base is generally at 0x080b. Should this be restricted to variants=3D"A7XX"
to avoid an XML offset collision during the build?

[Severity: Low]
Similar to the earlier register, the 0x0b00-0x0b07 block is placed between
0x0909 and 0x090a. Would it be better to place it further down to keep the
XML offsets ordered?

[ ... ]

> @@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
>  	<reg64 offset=3D"0x0E08" name=3D"UCHE_TRAP_BASE" variants=3D"A8XX-"/>
>  	<reg64 offset=3D"0x0E0B" name=3D"UCHE_GMEM_RANGE_MIN" variants=3D"A6XX-=
A7XX"/>
>  	<reg64 offset=3D"0x0E0D" name=3D"UCHE_GMEM_RANGE_MAX" variants=3D"A6XX-=
A7XX"/>
> +	<reg32 offset=3D"0x0E12" name=3D"UCHE_DEBUG_CNTL_1" usage=3D"cmd"/>
>  	<reg32 offset=3D"0x0e17" name=3D"UCHE_CACHE_WAYS" variants=3D"A6XX-A7XX=
" usage=3D"init"/>
>  	<reg32 offset=3D"0x0e04" name=3D"UCHE_CACHE_WAYS" variants=3D"A8XX-"/>

[Severity: High]
Will adding UCHE_DEBUG_CNTL_1 at offset 0x0E12 without a variants attribute
cause a build failure? 0x0e12 is already defined as UCHE_UNKNOWN_0E12 for
A6XX-A7XX and as UCHE_GBIF_GX_CONFIG for A8XX. Does this new definition need
a variant constraint, or should the old conflicting registers be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D9
