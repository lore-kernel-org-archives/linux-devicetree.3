Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283215;
	b=r4ael1UTZ9A2+TF34K33nggVSXbCskX6ubeFducZmjfPGc0+KXVgQAi1z0aBPhY87XNt
	 g1CFY/zZy+Q9bSuoUy3ckNZskDh+FzNG7K/KoSHQMd4/iHF89h7Jr91YtUc6wsaECINK5
	 QnkBLyw0Lf/KOctgi5s5h6vg3L19/NvybcGiSseBvgBpgxyEvxAhltQw/my51y0r87XDm
	 lJwgZapEBwWCIr9f/u/vWlqmrH2eEeRrXyVK8CEInNVKP7VXo0P+mebvag/ZPiKnOGoo5
	 Ix/Bs7yyLJlocKMLejEcDoDQsalUHdhlBF17oG1QCUplqlmXv1bh+fCCBcKiiVDXJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283215;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M1aQfGDZ7Vb2nGSxetYuQ+UQaxnvNayTxfDWRbGrr0g=;
	b=yJMCXyBhNrY8k+0FgK6YlG5KCnO269zpjL/GqghWh4cf9tIQwl0uufKd3RsNH3uE6rtL
	 07OPnYT3iPJ5z00ORhAuTbkiawTvtv4r7rOfXE7Tut9jXsNoAZbIC3t34LBiZYG4+FNcv
	 EprUqNcTC0hXu8r46jF62AdPXq5+oo2CFDbONS9F+WQLIkhneMhkGgU3MJ8nLmHl4xql9
	 8uHpoJMRnqoNMETfmN4rud/XFR4xDX1yiJSyECvWPFaUPHr0PFKcKV7z6wIiMwyQ/mpbC
	 wbXOzvSzGjSeMpeiDVTddvweuk6Q6gkW3aEetOwK+PVasfpI49v/T7NPR3gJdt2KyGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lglaOQhg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E56606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lglaOQhg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884891F01825;
	Thu, 29 Oct 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283214;
	bh=M1aQfGDZ7Vb2nGSxetYuQ+UQaxnvNayTxfDWRbGrr0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lglaOQhgNX70H03nnqzFN8KoOikJZ8/sJ6xJW/X1r7zuRk5OxCPbgE2d1fpfUCCL7
	 VulQhXF1NlSLFFSosKROt9x+0TGwKFIXGF7Rq49aOyOT1eI3AkJnl2Ws/fNIvAlWeZ
	 QFZnONQ3uilq+DVqxFdDCJkeBpnwPrG059oCk7KymZR64fcQu6CO/9fiXhHkVoorAm
	 6FwzZRZgyLjYpCre05wF19ydlyBcgZunx7kSa3ZPv0LM2C2BgeGWUpkS6rpj9Zt/bH
	 /L303SeaoJGMPwxcQ73zPl8ujUkfnPv9Lm2uU3R4alT0lLk+8HiywTQ1WG9Q6wFPS2
	 W+POYnDTqvgPw==
Message-ID: <sashiko-outbox-189486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 08/14] temp: add LPAC regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-8-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-8-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:13:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/msm: conflicting offsets and variants for LPAC regs in a6xx.=
xml
--

commit cffea449b0ea5b2e3282237ed9e0160eef7997c8
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

temp: add LPAC regs

This commit adds LPAC and UCHE register definitions to the Adreno a6xx XML
register database.

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
>  	<bitset name=3D"a8xx_cp_protect_cntl" inline=3D"yes">
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
>  	<reg32 offset=3D"0x090c" name=3D"CP_ROQ_DBG_ADDR" variants=3D"A6XX-A7XX=
"/>
> @@ -521,6 +531,7 @@ by a particular renderpass/blit.
>  	<reg32 offset=3D"0x0b29" name=3D"CP_SQE_AC_STAT_ADDR" variants=3D"A7XX"=
/>
>  	<reg32 offset=3D"0x0b2a" name=3D"CP_SQE_AC_STAT_DATA" variants=3D"A7XX"=
/>
> =20
> +	<reg32 offset=3D"0x0b30" name=3D"CP_LPAC_CHICKEN_DBG" variants=3D"A7XX-=
"/>
>  	<reg32 offset=3D"0x0b31" name=3D"CP_LPAC_APRIV_CNTL" variants=3D"A7XX"/>
>  	<reg32 offset=3D"0x0b34" name=3D"CP_LPAC_PROG_FIFO_SIZE" variants=3D"A7=
XX"/>
>  	<reg32 offset=3D"0x0b35" name=3D"CP_LPAC_ROQ_DBG_DATA" variants=3D"A7XX=
"/>
> @@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
>  	<reg64 offset=3D"0x0E08" name=3D"UCHE_TRAP_BASE" variants=3D"A8XX-"/>
>  	<reg64 offset=3D"0x0E0B" name=3D"UCHE_GMEM_RANGE_MIN" variants=3D"A6XX-=
A7XX"/>
>  	<reg64 offset=3D"0x0E0D" name=3D"UCHE_GMEM_RANGE_MAX" variants=3D"A6XX-=
A7XX"/>
> +	<reg32 offset=3D"0x0E12" name=3D"UCHE_DEBUG_CNTL_1" usage=3D"cmd"/>

[Severity: Medium]
Should these new register definitions specify narrower hardware variants to
avoid colliding with existing A6XX, A7XX, and A8XX registers during header
generation in drivers/gpu/drm/msm/registers/gen_header.py?

First, UCHE_DEBUG_CNTL_1 is added at offset 0x0E12 with usage=3D"cmd" and no
variants attribute, while leaving the existing definition for 0x0e12 on
A6XX-A7XX in place and overlapping with UCHE_GBIF_GX_CONFIG on A8XX-:

	<reg32 offset=3D"0x0e3a" name=3D"UCHE_GBIF_GX_CONFIG" variants=3D"A6XX-A7X=
X"/>
	<reg32 offset=3D"0x0e12" name=3D"UCHE_GBIF_GX_CONFIG" variants=3D"A8XX-"/>
	...
	<!-- always 0x03200000 ? -->
	<reg32 offset=3D"0x0e12" name=3D"UCHE_UNKNOWN_0E12" variants=3D"A6XX-A7XX"=
 usage=3D"init"/>

Because UCHE_DEBUG_CNTL_1 has no variants restriction, dump_reg_usages() in
gen_header.py emits 0x0e12 into CMD_REGS<A8XX> where that offset is
UCHE_GBIF_GX_CONFIG, and leaves duplicate definitions for 0x0e12 on
A6XX-A7XX.

Second, CP_LPAC_RB_BASE (0x0b00), CP_LPAC_RB_CNTL (0x0b02),
CP_LPAC_RB_RPTR_ADDR (0x0b04), CP_LPAC_RB_RPTR (0x0b06), CP_LPAC_RB_WPTR
(0x0b07), and CP_LPAC_CHICKEN_DBG (0x0b30) use open-ended variants=3D"A7XX-=
",
which includes A8XX. However, on A8XX- the LPAC ringbuffer registers are at
0x080b-0x0812 and offsets 0x0b00-0x0b01 are reassigned:

	<reg64 offset=3D"0x080b" name=3D"CP_RB_BASE_LPAC" variants=3D"A8XX-"/>
	<reg32 offset=3D"0x080d" name=3D"CP_RB_CNTL_LPAC" variants=3D"A8XX-"/>
	<reg32 offset=3D"0x080e" name=3D"CP_RB_RPTR_WR_LPAC" variants=3D"A8XX-"/>
	<reg64 offset=3D"0x080f" name=3D"CP_RB_RPTR_ADDR_LPAC" variants=3D"A8XX-"/>
	<reg32 offset=3D"0x0811" name=3D"CP_RB_RPTR_LPAC" variants=3D"A8XX-"/>
	<reg32 offset=3D"0x0812" name=3D"CP_RB_WPTR_LPAC" variants=3D"A8XX-"/>
	...
	<reg32 offset=3D"0x0b00" name=3D"CP_SLICE_MEM_POOL_DBG_ADDR_PIPE" variants=
=3D"A8XX-"/>
	<reg32 offset=3D"0x0b01" name=3D"CP_SLICE_MEM_POOL_DBG_DATA_PIPE" variants=
=3D"A8XX-"/>

Other A7XX LPAC registers in the 0x0b0a-0x0b40 range use variants=3D"A7XX" =
or
variants=3D"A6XX-A7XX".

Finally, CP_LPAC_PROTECT_CNTL at offset 0x0B09 omits a variants attribute
(exposing it on A8XX) and duplicates the bitfields inline instead of using
type=3D"a6xx_cp_protect_cntl" defined immediately above it:

	<bitset name=3D"a6xx_cp_protect_cntl" inline=3D"yes">
		<bitfield pos=3D"3" name=3D"LAST_SPAN_INF_RANGE" type=3D"boolean"/>
		<bitfield pos=3D"1" name=3D"ACCESS_FAULT_ON_VIOL_EN" type=3D"boolean"/>
		<bitfield pos=3D"0" name=3D"ACCESS_PROT_EN" type=3D"boolean"/>
	</bitset>

	<reg32 offset=3D"0x084f" name=3D"CP_PROTECT_CNTL" type=3D"a6xx_cp_protect_=
cntl" variants=3D"A6XX-A7XX"/>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-descriptiv=
e-name-lpac-upstream-v2-0-a21a5c850961@gmail.com?part=3D8
