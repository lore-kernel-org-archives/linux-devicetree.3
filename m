Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA65481FA2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912632; cv=none; b=AudEgIeXwj2ikqBzdK/+lUBH5FGGSTEJlYuX+zuI4M1caezq3w/Zt4uVisE2mh2NQiBYQWujZWZrqc5mXFXByJ2o6hKIYR83Fx/BkIeJxl0F5x9h/KnKqPL80YJkbVc+eYLmV+iBr5WgBIAbwvWAVKnFEUJhDpI1dxA2VHiQd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912632; c=relaxed/simple;
	bh=GgCusbNKIdf+j8MktoUxMFV/Lht41vK4lMRlcdrPBgE=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=di2fmyGGZiZFxAl/iMKgTJc3B0qBl6ZEBaXsKWVtQp830QprAfLk0pMPThiHmK/ji7DvxssSzT5V1NNbIrBYrUh1rZj3/Iys48n+slBqQveYTS3fLcus7Rn28agdmNlbda+RI6wueTvcINnouMJJfpoenQL5OrlpsRgmGMIOiXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWr3aHke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWr3aHke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524D51F000E9;
	Wed,  1 Jul 2026 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782912629;
	bh=LfUBD6kf6EuRxVqK4rkiiGhMTstox5RcYKCjizPDpGo=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=IWr3aHkeybSQ/mbre7wSgG0CCLs4+qxUZ0s0Rihjh+CrsbPhqkgHOnbMre/SC0WH+
	 47S4iVSQ5vK3usCmItXivb/GdSSy/Au91vxBbXqKtF6zzUaxlnlWxErb3oZiTKHDDp
	 2vPY9LcDvvviU7tGuWcJHGvbOqLP7L17gTIaOsPFPqn5Lj58gu3jqFX9ijVAEeXznm
	 d9WPOrJFlP1SS4B12ZA9Ar3H5n7XxNtP+AiOEWKg8jpTLuiF5EPl6Rk9Q0/H7QDG/a
	 +xfKnlpHCXzYsQCG7ftYgHoC12YHZS8NnVwLPUX48dgYCDotmMtI7v6GtOwXA21G/Y
	 7gySnHAwPRl4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware:
 Split r5f memory region
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-10-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
 <20260701-topic-am62a-ioddr-dt-v6-19-v7-10-e9db8b16821a@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:30:28 +0000
Message-Id: <20260701133029.524D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Splitting the contiguous firmware memory region into multiple smal=
ler segments breaks ELF loading for existing monolithic firmwares.
--

commit 467b992dbc807cab9f7fc93edfad5b8ea8a2207c
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region

This commit splits the contiguous firmware memory region into more
specific parts. It explicitly describes where to find LPM metadata
and other regions for bootloaders like U-Boot.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index f776511095642..8f7409da83392 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  		no-map;
>  	};
> =20
> -	wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  		compatible =3D "shared-dma-pool";
> -		reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
> +		reg =3D <0x00 0x9c900000 0x00 0x100000>;
> +		no-map;
> +	};

[Severity: High]
Will splitting this contiguous memory region into smaller fragmented regions
break ELF loading for existing monolithic firmwares?

When the remoteproc driver loads the firmware via rproc_elf_load_segments(),
k3_rproc_da_to_va() translates the addresses by checking each DT region
independently. It strictly requires the entire segment to fit within a sing=
le
memory region:

drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
    ...
    if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
        offset =3D da - dev_addr;
    ...
}

If an older firmware has a segment that is larger than the newly defined
boundaries, such as a segment crossing the 1MB ipc region and the 32KB
lpm-stub region, this translation returns NULL and causes an -EINVAL error.

Furthermore, because the driver maps each of these memory regions
independently, the kernel virtual addresses are disjoint:

drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init() {
    ...
    kproc->rmem[i].cpu_addr =3D devm_ioremap_resource_wc(dev, &res);
    ...
}

Could this result in a Device Tree ABI regression for existing users with
older monolithic firmwares?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-topic-am62=
a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com?part=3D10
