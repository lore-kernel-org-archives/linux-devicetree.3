Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD924293C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911941; cv=none; b=YUY266XMwCa7c/JIFlUGasnIk7/TeAstaQQza7XK+XQHag0mb2vFygS2WuWU7vP4OEZpPHdkIpOhCVCevjtpUxWYdTPOVxKzFokFbUXE7wFcwRox1dPxXjTZTMElKPzp9QZl7mSRSSGyvh30UGCDn53Ukqz6bUyOoUXD5jtibuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911941; c=relaxed/simple;
	bh=gJyLwKpJvVZZCP0scbW88kpGlchAXqCtHUOBGTGpYTE=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LAdLanH6ZTKE+ow+Tb78iylKiFuent/eWEx8ICSWnZXJ6+iECCwtyL7Z/pW7HO/k29ak4YAo7EjOG3CDVIk+STSnq+cjQ0REFBrDLWdYBhOSnNMC3i8vW0m8LoiyTyTtWjl7WPy4s9YodcVEIKkJENoTuilAoTP/j/WLrSuryKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcAURDLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcAURDLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47481F00A3A;
	Wed,  1 Jul 2026 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782911940;
	bh=W/VBuNX84f6BXNw0mY4rwNp/3vsmdH8FrZKwDCR9nm8=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=XcAURDLr3DZQ88I2yqbGXohIlZ/OU1j284IrfilUX+gP8xEqY/2lPIcp+y7VPbw98
	 v9TYcqZax7tiDrxyCdWCrrX0lE1Fi3Z+GV7UwJ7vbBqvrACnwuAtjKdKI7TOCms6Dt
	 p17u07SX/46XikkRLd7S2kMfo1QAqPfIvcFgDEhvFzdzGcAuiWVtt7duS8ZwyVW/lC
	 32YKdSTHhqBsawGlaPofUsMB0Lk9Uf8J86fg5o/IwoUXQMhoGuUQafYaPq6k2R9MvT
	 pRGOVFiUK4qIXJIJbFH6dN998f5OI3v4Q7UY2XHDhaE0r58VSHG1w16flhFVR1t2W0
	 BRbPYeM3hzbJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware:
 Split r5f memory region
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
 <20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:18:59 +0000
Message-Id: <20260701131859.A47481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `bootph-pre-ram` properties on newly split firmware memory=
 regions will leave dangling phandles in U-Boot SPL and risks memory corrup=
tion.
- [High] Arbitrarily subdividing the firmware carveout breaks `rproc_da_to_=
va` translation for existing firmware ELF segments that span the new bounda=
ries.
--

commit 235186e608d68e805ecd28c0d36c56c91fb3c688
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
   =20
Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 682b1c9f3071d..fe10d3e75ceee 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi

[ ... ]

> -	wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  		compatible =3D "shared-dma-pool";
> -		reg =3D <0x00 0x9c900000 0x00 0x01d00000>;
> +		reg =3D <0x00 0x9c900000 0x00 0x100000>;
> +		no-map;
> +	};

[Severity: High]
Does subdividing this contiguous region break backwards compatibility for
existing firmware binaries?

Looking at drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va():

    if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
        offset =3D da - dev_addr;
        va =3D kproc->rmem[i].cpu_addr + offset;
        return (__force void *)va;
    }

The translation logic requires a firmware ELF segment to fit entirely withi=
n a
single parsed device tree memory region.

If an older monolithic firmware binary has a segment that spans across these
new boundaries (for example, from lpm_metadata into lpm_rest), won't this
check fail and return NULL?

[ ... ]

> @@ -78,8 +102,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
>  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names =3D "dma", "firmware";
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
>  	bootph-pre-ram;
>  	status =3D "okay";
>  };

[Severity: High]
Will this cause issues during the U-Boot SPL build?

Since this node retains the bootph-pre-ram property, but newly added regions
like wkup_r5fss0_core0_dm_region and wkup_r5fss0_core0_ipc_region do not ha=
ve
it, won't fdtgrep strip out the new regions?

If they are stripped, the memory-region array here will contain dangling
phandles, which could cause U-Boot's remoteproc driver to fail probing.

Additionally, because the stripped regions lose their no-map status in the
SPL device tree, is there a risk the SPL allocator might overwrite and corr=
upt
the Device Manager firmware or IPC data?

I've also checked later commits in this series (e.g., commit e36960554d0b),
and it appears the bootph-pre-ram property remains absent for these other
memory regions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-topic-am62=
a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com?part=3D9
