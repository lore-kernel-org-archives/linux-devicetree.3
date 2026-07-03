Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7583236453
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090422; cv=none; b=OtSuyC0NtGn+ep8CKOL3p++KEb9C4RHHFYTdxtajlKW3h/6qZGXP5li9IYBhH7XhRjeMP2s/U8hiGr/iHmxCtf4eW6uTF8GobgrDcfRSAo6ygXqXVE25ymM0Z6mUTgforJ0uiKvfXqMGcOzF5dFVkomdwjpIb7oMrlPGFbZ46ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090422; c=relaxed/simple;
	bh=2VbvTLATUBRyOkcMD2H6c8IiWnOuQi7FFAGq7urUUpo=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kpVO84dvxKNuzFRbkKbmHz3BcCvbbEbcw1qJMV8F5ngjkIYqZpoZFie7GCaj9GDERT34RWbeNsAp1M1BY2OMsaQpXVuMBNrpRjncNAndXZEZ5vrriOnKGnsYV2w8WxLmtoPyudfsLDvYIRJr0+sILd/pXaOWHQSvw0dVwD4+9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWI9fwFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWI9fwFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0542F1F000E9;
	Fri,  3 Jul 2026 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090421;
	bh=Y7oNG6rsWk6v+8ZtKEjS4cxQBJxFYFRWFmn4DVo1HY8=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=XWI9fwFkgMuoHQluSoZkPo84qVFOM0/6dnmuuo6qhmBj1HK41jG3fpF1sqZk3ZS9V
	 msPjvja/HD04PVdKOVXcvqXJ00S7eT2ypex87BiqMYhrsm75zTi3gDa2vI3bQT1OAj
	 W/XmPEBJOZBLeZVZBqn+bav/8XXZqSG72kDIP8FE/61S5fsU83QFnr8sotFblXrNMF
	 X8O9MGnym29kT1aSY0ch/SI1MKL4917YLPvEu+mHLaIihYz5vVqff2W3zpTebtvHq9
	 5dLZBeSSzrUolg1SXvigePc51ey05HtrEPlw6tYvQmXLSVxQZ/e11seAsjJlxXNnOr
	 uXVei0mHDWd0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] arm64: dts: ti: k3-j7200-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703143717.177362-3-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-3-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 14:53:40 +0000
Message-Id: <20260703145341.0542F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Adding a firewalled memory region to the K3 remoteproc's memor=
y-region array causes Linux to inadvertently map it as Normal Write-Combini=
ng memory, leading to fatal asynchronous SErrors due to speculative reads, =
and exposing it to the remoteproc ELF loader.
- [High] Retaining `mcu_r5fss0_core0` in the SPL device tree without its re=
ferenced memory regions will result in dangling phandles.
--

commit 6ba9ae95cd26c22916ced48472c89d3b231e698a
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM metadata

Declare a carveout memory region to store LPM metadata on J7200. For
Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image.

Link: https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#=
lpm-msg-lpm-save-addr

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

[Severity: Critical]
Will appending this firewalled memory region to the memory-region array cau=
se
fatal asynchronous SErrors due to speculative reads?

Looking at k3_reserved_mem_init() in drivers/remoteproc/ti_k3_common.c,
the remoteproc driver unconditionally maps all memory-region entries starti=
ng
from index 1:

drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init() {
    ...
    kproc->rmem[i].cpu_addr =3D devm_ioremap_resource_wc(dev, &res);
    ...
}

Since the lpm_memory_region is hardware-firewalled and only accessible by
TIFS, mapping it as Write-Combining (Normal Non-Cacheable) memory permits t=
he
ARM64 CPU to perform speculative instruction and data fetches against it.

Could these speculative accesses trigger bus errors from the interconnect,
resulting in fatal asynchronous SErrors that panic the kernel during device
probe?

> +	memory-region-names =3D "dma", "firmware", "lpm-metadata";
> +	bootph-pre-ram;

[Severity: High]
Will adding bootph-pre-ram here result in dangling phandles in the SPL
device tree?

Because bootph-pre-ram was added to mcu_r5fss0_core0 and lpm_memory_region,
but not to the existing mcu_r5fss0_core0_dma_memory_region and
mcu_r5fss0_core0_memory_region nodes, the SPL build tool (fdtgrep) will
strip the unannotated dma and firmware memory nodes.

Might this cause the U-Boot remoteproc driver to fail during parsing or
crash when attempting to resume the R5F core from retention due to the
missing references?

>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703143717.1773=
62-1-richard.genoud@bootlin.com?part=3D2
