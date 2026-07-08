Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A083890F1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496001; cv=none; b=aGAe3jUr0WNV7uROQSHX2/xA9B/2R8/ibWgs4WpmzYQ7ZnSK6ITZh87R2fYws8sFUEov1B5ffVdslbdqDPnc3yNtqZ5q404YjyR+8Ws3fxit6/Vool6af/nVC9PDL0O28Ahe4ILCsmFHeBGtMwqV17booH1Bc+yl53h9XINm6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496001; c=relaxed/simple;
	bh=hkQ5r0SU39ya/Nelx6WpFiW0lygcFU7gc8UT/k1h9nQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eC7OXSImm28/5oU36bwyXrUEwWDJn4qSV1sghap2QHsizz5qRPaSuFq2799AKmCL1I8Gqy2NLWFHsp7Ztt96X0sKOVg4CQiSA04f7TCAbKmPp2cPCFZ4NpRnco+DQiQZaaFZ/vPZkw8pgosLyIifTkFub2bF8ie41B5mNvtczAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcw3YMi/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcw3YMi/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E191F00A3A;
	Wed,  8 Jul 2026 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495990;
	bh=kX5u2JXWQa6pcWiC4HuTw3lhvRFUma58bKNInJcdeok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcw3YMi/eooAdUlgDSwqlETt5tS5MNKKrGyr8KcKMuFgPHo5wscmkNQ+MQ+eztdB1
	 HuBmfEEB9g1b4nVTqDcWa5sNEFDAcz1ihO9hJ41Wye9u5jVaJw4Ht6C/KhtlQub9mX
	 G2qamh3lL2eY1TLb2J+CCqeOiK4QnSiArbBtJQBfG5vvDvuDYMAIxxf09T83pv9e//
	 v50oTiQa3Kp7gNbYNjevM0sRYF3PesdXHev/ABSEEIYZF5HIc0ix69DS4euFSzCE4Z
	 T62VzwzBEHVYeFIDNGRtOssOT3unaRw+6H05cgtcZUyOet3EoZjYPYR1eWBpcgw0LI
	 /ixj5zftv6SoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/6] arm64/efi: Honor EFI_MEMORY_ISA_MASK for
 Device-nGnRnE vs -nGnRE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-efi-psci-v1-4-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <20260708-efi-psci-v1-4-9efb3abf0e4c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:33:09 +0000
Message-Id: <20260708073310.10E191F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Silent truncation of the 16-bit EFI_MEMORY_ISA_MASK field into a=
 u8 variable, bypassing validation and printing misleading warnings.
--

--- Patch [4]: [PATCH RFC 4/6] arm64/efi: Honor EFI_MEMORY_ISA_MASK for Dev=
ice-nGnRnE vs -nGnRE ---
commit 6b01988498665d7f9d353c79435cf09a3768a624
Author: Sven Peter <sven@kernel.org>

arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE

This patch updates the mapping protection for EFI MMIO regions to honor the
MAIR attributes provided in EFI_MEMORY_ISA_MASK if EFI_MEMORY_ISA_VALID is
set. It defaults to Device-nGnRE for unsupported values or when the valid b=
it
is absent.

> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index e40885567f9e9..50ba8e9112fc8 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c

[ ... ]

> @@ -38,7 +40,27 @@ static __init ptval_t create_mapping_protection(efi_me=
mory_desc_t *md)
>  	u32 type =3D md->type;
> =20
>  	if (type =3D=3D EFI_MEMORY_MAPPED_IO) {
> -		pgprot_t prot =3D __pgprot(PROT_DEVICE_nGnRE);
> +		pgprot_t prot;
> +
> +		if (attr & EFI_MEMORY_ISA_VALID) {
> +			u8 mair =3D FIELD_GET(EFI_MEMORY_ISA_MASK, attr);

[Severity: Medium]
Will this silently truncate the extracted field?

EFI_MEMORY_ISA_MASK covers 16 bits (bits 44-59). If the firmware provides an
attribute with non-zero bits in the upper 8 bits of this mask (like 0x0100),
assigning the result of FIELD_GET to a u8 will truncate it to 0x00.

This would cause the switch statement below to incorrectly match
MAIR_ATTR_DEVICE_nGnRnE (0x00) instead of falling through to the default
case. Should mair be a u16 or u32 instead?

> +
> +			switch (mair) {
> +			case MAIR_ATTR_DEVICE_nGnRnE:
> +				prot =3D __pgprot(PROT_DEVICE_nGnRnE);
> +				break;
> +			case MAIR_ATTR_DEVICE_nGnRE:
> +				prot =3D __pgprot(PROT_DEVICE_nGnRE);
> +				break;
> +			default:
> +				prot =3D __pgprot(PROT_DEVICE_nGnRE);
> +				pr_warn("unsupported MAIR attribute %#x for EFI MMIO region at 0x%ll=
x, using Device-nGnRE\n",
> +					mair, md->phys_addr);

[Severity: Medium]
If truncation occurs above, will this warning print a misleading value?

Because mair is a u8, any unsupported attributes in the upper 8 bits of the
ISA mask will be stripped out before being printed here, obscuring the actu=
al
unsupported bits provided by the firmware.

> +				break;
> +			}
> +		} else {
> +			prot =3D __pgprot(PROT_DEVICE_nGnRE);
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-efi-psci-v=
1-0-9efb3abf0e4c@kernel.org?part=3D4
