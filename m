Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79492749DF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090453; cv=none; b=AaoUvPrQopBpeGstFPpF+keL/klgMvFr6uIvO9ZK7bjIHXCOAHjfGdDyKAk6fXnC2c2b7d5f2dmheHRyivRmKLucUVCIpcEtyO79g4iCoHW7XI6ERAF2WfXtscoxjnAZ8RwWmH0jyZM0ucl8YKOA+67t8/DKVPpKOvz60t0FZn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090453; c=relaxed/simple;
	bh=/1ENUIgn+0arn0v9Laxqd0VaG8NlZGf7GdPQ+w1OvgY=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=npfYPOzEzeYO8PRcHYMgsPSqwHi83+F5VPaqPwtdeM9cDbqkFH4J/np0dPx4pZNm3hua/YCgmkek4+ZBr2n7RlNjOdaHBs8p+RoGdzH13g6ZEuQoFUdcSBEgt0chdBk/a04qMy3RX5F7ZRSg8PIDRKq1+nWdIfKvbf/CjgBdFP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL/TX34H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL/TX34H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359511F000E9;
	Fri,  3 Jul 2026 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090452;
	bh=TXYf5LbIex3B4jqNnVBx/4aG1CpYdieuC/NMXAKhJo0=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=OL/TX34HPdkmAR56nTEV3mxbJqQsnJNrXr83f14igvVm+Cbe6FWFb7RtmkMtmA46i
	 CmlYiFzYyqLl5LpzE0nsBFFOEQlOWP9vdugXPVPPWIx2OzaSxqCi4a8hu4OLXGqtZi
	 5IICctDt4vlm7jQCb+UK4cwTn5M63V5EULEB1fXhhkr2wB8aRd403w72AepNR/iVFS
	 HrvdGFnS8Rm0Hog2jZE0hAlyCqwgz2hCncdBKwaE8Jc2RQKR0FEu1TrEQiGC1DAz+j
	 oJEy75bU4E2p52Pd6bHoeQxAOAuq+gSBZ+jQmpa4KVOJwntdvYBQ061dZBLPcTOtWj
	 4+lqvV9L89esQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] arm64: dts: ti: k3-j784s4-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703143717.177362-5-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-5-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 14:54:11 +0000
Message-Id: <20260703145412.359511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding the firewalled `lpm_memory_region` to the `memory-region` a=
rray forces the remoteproc driver to map it, leading to a kernel panic from=
 speculative CPU fetches.
--

commit 8b3d051973c3ec2b39f876843cc836ccee8785ec
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM metadata

This commit declares a carveout memory region to store LPM metadata on J784=
S4
devices. It appends this region to the memory-region array of the
mcu_r5fss0_core0 node for use during the resume process.

Link: https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#=
lpm-msg-lpm-save-addr

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
> index 81b508b9b05ee..1c0c1533f0a35 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi

[ ... ]

> @@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
>  	};
>  };
> =20
> +&mcu_r5fss0_core0 {
> +	memory-region =3D <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;
> +	memory-region-names =3D "dma", "firmware", "lpm-metadata";

[Severity: High]
Will adding this firewalled region to the memory-region array cause a kernel
panic from speculative CPU fetches?

Looking at the remoteproc driver in
drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init(), it iterates over
the memory-region properties and maps them:

drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init() {
    ...
    ret =3D of_reserved_mem_region_to_resource(np, i + 1, &res);
    if (ret)
        return ret;
    ...
    kproc->rmem[i].cpu_addr =3D devm_ioremap_resource_wc(dev, &res);
    ...
}

Since the commit message notes the lpm_memory_region is firewalled and
only accessible by TIFS, mapping it via devm_ioremap_resource_wc() allows
the CPU to issue speculative fetches to it.

If a speculative fetch hits the firewall, won't the system interconnect
return a bus error and raise an SError that panics the kernel?

> +	bootph-pre-ram;
> +	status =3D "okay";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703143717.1773=
62-1-richard.genoud@bootlin.com?part=3D4
