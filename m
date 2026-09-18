Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C02D3F825A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724413; cv=none; b=LXRJVpp0TceIOS1M+jJ2B6WKmY6QnMyxrurz/R1IIbzeoZMfc+LZqohBjvKq7RWUmwiYcenRBSsvJPogyHvwVIUSsDjsVdX2ejgFr+wynMu1UQj+zU8Mz4ncY9Jec+a9qaR6l8ObPCB8n2FBLx22hokXxiYEhEjQP2ekSuJJ6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724413; c=relaxed/simple;
	bh=tT0PqhCgP8zsM/V2mDTvM++cTU8C9JvyBW/OaISX23U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BtFKjutNVW2URn2fpsmW+6QkGT6UkKaFCdPkJKCKV+IVhedsfHBbTNOsqdPhvMi0tCfjwgTkotUNf8yMf37x3NMtgbQlhEDu2cuGXeRElRzjowvzwkvXCo6s3+d41ejtuJyrI6m15IW8448uwt5kpoxZXRhGiK9Gt7jC11UTMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=li36WG4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="li36WG4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AE01F000FF;
	Fri, 18 Sep 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789724411;
	bh=bEfU0yoKOqVnFmFvNlLAkvzreJIfZnh9yGCkIXI1p8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=li36WG4A3GLC/mEayTBGu26bdxvs0v7EGwqv33RTLtI8V8p74dB9s95HW6fP0YsDD
	 EAhDSL7GVowA+4nVjRi2rd01IqzQxvV6EdcS44TAn90mXp572Xlhpl5hqEFOAfeXc8
	 /krv0VUec2yuUgzFFmq8+cr/4WyTPwx8P5y2WsbKD6AaBG9obCaJmE4dqJdurqofbY
	 /PcGD2fgwBg+tIiOFZRrvegAI8rzpXklgW9sebmEkSmbtMCOCkBIn9usg9aQQ+KAhI
	 YtGpYAsd/4e9cehfKzN5+lWg6eV5SU2z3UC82geJos3HsmBQNBYxCFo7Nm76cEM8pQ
	 ex6lZWtqH441Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFya3VzIFNjaG5laWRlci1QYXJnbWFubiAoVEkp?= <msp@baylibre.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:40:11 +0000
Message-Id: <20260918094011.99AE01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] remoteproc: ti_k3: k3_rproc_da_to_va() rejects segments spanning s=
plit memory regions
- [High] arm64: dts: ti: missing bootph-pre-ram breaks SPL DM firmware load=
ing
- [Medium] arm64: dts: ti: hardcoding volatile firmware layout into Device =
Tree
--

commit 33643294863f45f1ac37617eafcfc525d230effc
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62a: Split r5f memory region

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 06d4e815b1670..94c1d60d8d7a1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -65,8 +65,14 @@ &wkup_r5fss0 {
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

[Severity: High]
Does this multi-region split cause a regression when loading a monolithic
firmware ELF whose segments span across the new chunk boundaries?

Looking at k3_rproc_da_to_va() in drivers/remoteproc/ti_k3_common.c, it
evaluates segments against each reserved memory region individually and
lacks logic to aggregate sequential chunks:

drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
    ...
    if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
        offset =3D da - dev_addr;
        va =3D kproc->rmem[i].cpu_addr + offset;
        return (__force void *)va;
    }
    ...
}

Will this bounds check fail and abort the boot sequence for any system using
standard firmware linked under the assumption of a single contiguous memory
block?

> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62d2-evm.dts
> index a8c794d073431..7cba3ff99e6a3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
[ ... ]
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};

[Severity: Medium]
Does this create a regression by hardcoding a software-defined volatile
firmware layout directly into the Device Tree?

If a subsequent firmware build increases the size of lpm_fs_stub beyond the
32KB hardcoded here, will this crash or require a lockstep DT update to
function properly?

> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>  			no-map;
>  			bootph-pre-ram;
>  		};
> =20
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9caa0000 0x00 0x1c60000>;
> +			no-map;
> +		};

[Severity: High]
Does the omission of the bootph-pre-ram tag on this new DM region create a
regression for SPL DM firmware loading?

Since U-Boot fdtgrep processes the SPL DTB by keeping only nodes tagged
with bootph-pre-ram, these split regions will be stripped.

Will this result in the no-map protections being lost, causing U-Boot's
remoteproc driver to error out parsing dangling phandles when attempting
to load the Device Manager (DM) firmware?

> +
>  		secure_ddr: optee@9e800000 {
>  			reg =3D <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>  			no-map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-topic-am62=
a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com?part=3D7
