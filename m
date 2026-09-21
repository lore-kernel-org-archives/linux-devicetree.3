Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1D4A2E32
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002983; cv=none; b=AejHlYFmiTpaW+FTjaSHN4NLq+N4zKWnBWwu5J0zSowG1TK55ESt18jVO2VG8Q9H1n8vNyvcneKUaQ1kZICpaKeyM0broHRwR/XEzdfX+H9kOYkSBfh8Dbi4sZpkt8u5R6mBK37CKuh71CFgcsCA6iCemCd+junESbUf4q2YWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002983; c=relaxed/simple;
	bh=KciTiuxT/kjcNY7twh1qO1QCFmwCP2ni544rOTTQ+ZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o2h3OkG26wCxv8ymdyzpvxPM1BWdg5iwOTuDGge20dbn/MAm1ivkgLT35rRACwemUR7sm0cq13Npuy7C2mDta+lay02n3HntZniRdt5VfnzZKg6DnaoXr0WEmojZnAoeka0EjoVuCfGWxjS7uXIZmlZGFqMaV9lb9z7M3T1bGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmDAXW2C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmDAXW2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6BD1F000FF;
	Mon, 21 Sep 2026 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002981;
	bh=PLRIg5fcEUeLE6OjW1f2OO5XjxghZ9BQtJe8tUZa7g4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmDAXW2CmVEcNopM6MrQILn/MyjYGDi2WJXt1N/Vy9kzHqR0sgjQ/5OEuoBRPfupT
	 dbmfG2F0R1FrzgIe4NN/Q1Kz+MTg5ECOAI1zLrPvVR2vgseJUUNRsuK6MvT6wYB6TS
	 itozeHQdrQned76zirVTUCwCD6AAcH2gj2pSyXVH+u2aZrz1Kk7J2ym1UKaVO2oYA2
	 2KdhnpFHGf9fdbgVUBeXRQyPLcXYmSmAhQmObNGk3XNGzUtzzTb7oLg5Q/qe8P9983
	 0EZyhjIeWb9V2gYkr5bTUJFgopiECaTWdDH2NE9FVSpfgKGJI7mtSxodpIEseLf4tz
	 fioNCXtcFrDoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] arm64: dts: ti: k3-j7200-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmljaGFyZCBHZW5vdWQgKFRJKQ==?= <richard.genoud@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921145325.300025-4-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-4-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 15:03:00 +0000
Message-Id: <20260921150301.6B6BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: ABI break: appending firewalled lpm_memory_region to =
memory-region array crashes older kernels
--

commit 07681f0176ba38c8ed49ce9e6c61d2f4b216437d
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM metadata

This commit declares a carveout memory region on J7200 to store LPM metadat=
a,
which is needed for saving ATF context and certificate information. It also
appends this region to the mcu_r5fss0_core0 memory-region list.

> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> index d65f68c7d4321..a6043970715ac 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi

[ ... ]

> @@ -99,8 +105,10 @@ &mcu_r5fss0 {
>  &mcu_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
>  	memory-region =3D <&mcu_r5fss0_core0_dma_memory_region>,
> -			<&mcu_r5fss0_core0_memory_region>;
> -	memory-region-names =3D "dma", "firmware";
> +			<&mcu_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;
> +	memory-region-names =3D "dma", "firmware", "lpm-metadata";

[Severity: High]
Does appending the firewalled lpm_memory_region to the standard memory-regi=
on
array break Device Tree forward compatibility with older kernels?

Older kernel remoteproc drivers unconditionally iterate over all memory-reg=
ion
elements (skipping index 0) and map them using devm_ioremap_resource_wc():

drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init() {
    ...
    kproc->rmem[j].cpu_addr =3D devm_ioremap_resource_wc(dev, &res);
    ...
}

Since the region is firewalled by TIFS and mapped as Write-Combine (Normal
Non-Cacheable memory), could speculative fetches to this memory trigger bus
errors (SError) and crash the system?

To maintain compatibility when running a new Device Tree on an older kernel,
should the firewalled region be provided via a custom property (e.g.,
ti,lpm-metadata) rather than overloading the standard memory-region array?

> +	bootph-pre-ram;
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921145325.3000=
25-1-richard.genoud@bootlin.com?part=3D3
