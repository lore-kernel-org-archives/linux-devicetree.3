Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901E3DF003
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495539; cv=none; b=QvEHaBQSXcfjqTD8XwPebDvby1+aJtYdJHvhIVcvGZ8AMhpE5UX6a2XSfTeSofojEdKPdjVhuQDTBITCsGRjQWFTGDwLlaDdgFQzDpc+5N6muXCkmeaTr264W/4u5rXt20/qHdhViF+3MA/gNHWRKXwveQu6qhlWWMynFPWsTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495539; c=relaxed/simple;
	bh=4nt6mf/G2Qq9N6s3vxJVCWs7He26JESyuMFy3cgmBhU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bO4LotdR6DJEfBglbYnkFdwxN2Wp4dTRFSBLd8d/vM6B7/sI2z8qk+/ivoeZw/nxrk0gwmJyuslW0kalCnDw9Sbn2qBsL9tuYsYdnPXfiRGY+YEk4HQAaROakBc0Od3Lxyb+fsh33H1tbBn/IafAZKJDOBF7Vp3qHPOfxTPhotU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga5cKG8k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga5cKG8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F251F000E9;
	Wed,  8 Jul 2026 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495523;
	bh=lTePsQVLCNuY7eV1LeWsl8eqhJy1jXova5fM+9N2fvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ga5cKG8kzT/0P2tFwSc+Fqe2WI8nslfGjPXylCtWq87TlAEP+nai+AfXsMMNX+n7w
	 3/QHeQw433EVF/HxQALmjeK7Ny2UKgRikOOmJSg4zmL+BeNLAXWNV3X5iz9E9KUFcc
	 vB6j0DtMj1g5CPOboRGoBP/CD3EKymuCic18b05nTC5+mqPXMkU/QfLDaLYhGJVwIQ
	 VDwLYGEpVoY7iUEWLhJouXlRe2GqYI4Nm2qWFaVSVRdeREiF1OumIVBSOPdR5kLkyN
	 l/Blkq27wITMQkRq4SWMMxXJIF0+f3kpwhvrX7AWmGsQmJeXsMzA6PY1yq/jBXt8Wr
	 5B2Q3z2tJLrbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/6] efi: Add EFI_MEMORY_ISA_{MASK,VALID}
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-efi-psci-v1-3-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <20260708-efi-psci-v1-3-9efb3abf0e4c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:25:22 +0000
Message-Id: <20260708072523.23F251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly introduced EFI_MEMORY_ISA_MASK and EFI_MEMORY_ISA_VALI=
D attributes are omitted from the known attributes mask in efi_md_typeattr_=
format(), breaking human-readable formatting for memory regions using these=
 attributes.
--

--- Patch [3]: [PATCH RFC 3/6] efi: Add EFI_MEMORY_ISA_{MASK,VALID} ---
commit c6357eb92aeb854ab69dbec9ea5006a518bddfd0
Author: Sven Peter <sven@kernel.org>

efi: Add EFI_MEMORY_ISA_{MASK,VALID}

This commit introduces new memory region attributes defined in UEFI 2.10
that allow mapping with ISA-specific cacheability attributes.

Link: https://uefi.org/specs/UEFI/2.10/07_Services_Boot_Services.html#efi-b=
oot-services-getmemorymap
Link: https://uefi.org/specs/UEFI/2.10/02_Overview.html#memory-types

> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index f3db3a18b5404..882148114068f 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -128,6 +128,8 @@ typedef	struct {
>  #define EFI_MEMORY_SP			BIT_ULL(18)	/* soft reserved */
>  #define EFI_MEMORY_CPU_CRYPTO		BIT_ULL(19)	/* supports encryption */
>  #define EFI_MEMORY_HOT_PLUGGABLE	BIT_ULL(20)	/* supports unplugging at r=
untime */
> +#define EFI_MEMORY_ISA_MASK		GENMASK_ULL(59, 44)	/* ISA-specific attribu=
tes */
> +#define EFI_MEMORY_ISA_VALID		BIT_ULL(62)	/* EFI_MEMORY_ISA_MASK bits ar=
e valid */

[Severity: Medium]
Should these new attributes be added to the known attributes whitelist in
efi_md_typeattr_format() over in drivers/firmware/efi/efi.c?

Because they are omitted from the inverted mask check there, if system
firmware provides a memory descriptor containing these new UEFI 2.10
attributes, won't the formatter fall back to printing a raw hexadecimal
string instead of human-readable attributes?

drivers/firmware/efi/efi.c:efi_md_typeattr_format() {
    ...
    if (attr & ~(EFI_MEMORY_UC | EFI_MEMORY_WC | EFI_MEMORY_WT |
                 EFI_MEMORY_WB | EFI_MEMORY_UCE | EFI_MEMORY_RO |
                 EFI_MEMORY_WP | EFI_MEMORY_RP | EFI_MEMORY_XP |
                 EFI_MEMORY_NV | EFI_MEMORY_SP | EFI_MEMORY_CPU_CRYPTO |
                 EFI_MEMORY_MORE_RELIABLE | EFI_MEMORY_HOT_PLUGGABLE |
                 EFI_MEMORY_RUNTIME))
        snprintf(pos, size, "|attr=3D0x%016llx]",
                 (unsigned long long)attr);
    ...
}

>  #define EFI_MEMORY_RUNTIME		BIT_ULL(63)	/* range requires runtime mappin=
g */
> =20
>  #define EFI_MEMORY_DESCRIPTOR_VERSION	1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-efi-psci-v=
1-0-9efb3abf0e4c@kernel.org?part=3D3
