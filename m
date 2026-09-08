Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44E5505D4
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885497; cv=none; b=OXjFjneu9cRNZz80p4wjtkqfsA2uMSeQhXrwLFZkF/QL9uJjGXkoP9Tw6qxlMg2+c3hGWmWjbPxDBHQG6bE3i1N+SZ+5L4Rvqb9v/KiChtFL2RHMyf/xZCC/1AYH/xm7NjsasCMbh/uJPyaBXbXjjUFYEhukgTxj5aKSUMLh+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885497; c=relaxed/simple;
	bh=XX9LlOiBHDIBpGBVoQ1VQoMcJqrovlINtDu84O57gxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M1/jmvpUSL0K3Yq9uM8zsLf6rEOEsaCifC3iFc4ng4vHpHCb/nTJi/LOAzDC6zSiHqo8rhyDIuM1+Bf5kuLWlXW8rtIUlZ3LBO3XKNPJIXs6NELC5X6wcGfR1Fhrn4gr0JFA6BLV70NdfN4EE9eEK1ETo3SZiJrNg3z40HcZDCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeogPwmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeogPwmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB951F00A3A;
	Tue,  8 Sep 2026 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788885495;
	bh=1411vaubmdoUOnJHrjgp0D11bDlIMjAJHj2Y9//2VNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FeogPwmbVCSNAVD4CBlcIuHTBbhbRW0Suwrs4k6dgnHjBaUYLB0OOpZ3yn1e2czqp
	 7sl18Jm9MR6Zlbh9ICNbtivF8yBHtrVWYWSignI7YArc4cKQ9L4UhszAa3rUn+8VQW
	 e6m/mNKAPLXAT6NAq+hlGlpu1lbOne37nj3CTWwiCHC38udO/QsgkzSpqr2RTtXVEB
	 vbEnB69GPIpB1rS3exSue9v6CxrltMPjxJ5H+tKUMIH3fqq3BrUtOdVENZl9eSwk90
	 R6KgBbb2uocO0meCM39kHTlYOQsQI6a6qkzlv6Me/y+Yt3aMh5GBc8FY67IeIbPB4c
	 hExGfPH2qPcjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] kho: rename kho_scratch= commandline parameter
 to kho_bootmem=
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908155639.2496551-5-pratyush@kernel.org>
References: <20260908155639.2496551-1-pratyush@kernel.org>
 <20260908155639.2496551-5-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:38:14 +0000
Message-Id: <20260908163815.6EB951F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The patch series renames the device tree property from 'linux,kho-=
scratch' to 'linux,kho-bootmem' in the kexec sender, but fails to update th=
e receiver, breaking Kexec Handover completely on OF/DeviceTree platforms.
- [Medium] The kernel parameter `kho_scratch=3D` is renamed to `kho_bootmem=
=3D` without retaining a fallback, breaking backward compatibility.
- [Low] Typo in the dummy implementation of `memblock_set_kho_noprsrv_only`=
 for !CONFIG_KEXEC_HANDOVER.
- [Low] The patch fails to update 'scratch' terminology in several KHO-rela=
ted comments, leaving the subsystem documentation in an inconsistent state.
--

commit 59d6b2029e0b48c319862bcfeb71dd0dd1ccc43d
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

kho: rename kho_scratch=3D commandline parameter to kho_bootmem=3D

KHO now no longer uses "scratch" to describe the memory areas passed by
previous kernel. Instead, it calls them boot memory, or bootmem in
short. Rename the kho_scratch=3D commandline parameter to reflect this
terminology change.

> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index fe4b76ff5a2cc..7018e25e4eda1 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
[ ... ]
> @@ -751,7 +751,7 @@ static int __init kho_parse_bootmem_size(char *p)
> =20
>  	return 0;
>  }
> -early_param("kho_scratch", kho_parse_bootmem_size);
> +early_param("kho_bootmem", kho_parse_bootmem_size);

[Severity: Medium]
Does the removal of the old parameter alias completely drop support for
existing configurations?

User configuration scripts or bootloaders using the kho_scratch=3D parameter
will silently fail to configure the KHO bootmem size, potentially causing
Kexec Handover to fail or behave incorrectly due to default memory
allocations.

Could a fallback early_param for kho_scratch be retained to prevent this
regression?

[Severity: High]
Does this patch series introduce a property name mismatch between the kexec
sender and receiver?

The sender kernel writes the new property in drivers/of/kexec.c:

    ret =3D fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-bootme=
m",
                                   bootmem_arr, bootmem_len);

However, the receiver kernel still attempts to read the device tree property
using the obsolete name in drivers/of/fdt.c:early_init_dt_check_kho():

    if (!of_flat_dt_get_addr_size(node, "linux,kho-scratch",
                                  &scratch_start, &scratch_size))
        return;

Will this mismatch cause a silent failure of the handover process on Device
Tree-based architectures, since of_flat_dt_get_addr_size will fail to find
the required property?

[Severity: Low]
This isn't a bug, but is there a typo in the fallback macro definition for
!CONFIG_KEXEC_HANDOVER?

In include/linux/memblock.h:

#ifdef CONFIG_KEXEC_HANDOVER
void memblock_set_kho_noprsrv_only(void);
void memblock_clear_kho_noprsrv_only(void);
#else
static inline void memblock_set_kho_noprsev_only(void) { }
static inline void memblock_clear_kho_noprsrv_only(void) { }
#endif

The dummy function is defined as memblock_set_kho_noprsev_only instead of
memblock_set_kho_noprsrv_only. Any future code attempting to call this
function outside of conditionally compiled KHO code will encounter a
compilation error.

[Severity: Low]
This isn't a bug, but several comments still use the obsolete scratch
terminology.

In kernel/kexec_file.c:kexec_locate_mem_hole():

    /*
     * If KHO is active, only use KHO scratch memory. All other memory
     * could potentially be handed over.
     */

In mm/memfd_luo.c:luo_memfd_pin_folios():

     * ensures none of the folios are in CMA -- which ensures they don't
     * fall in KHO scratch memory. It also moves swapped out folios back to

Could these comments be updated to reflect the new bootmem terminology for
consistency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908155639.2496=
551-1-pratyush@kernel.org?part=3D4
