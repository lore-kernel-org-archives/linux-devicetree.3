Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD383F8ED2
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090592; cv=none; b=FIK1JXVhMxUCgneFOxswwRD6cOaMePc+FjdO5U+vbgZMdPRQPpgeMc2JG9qUPcVNIuUJfIpr1d2BRfohIpqVC4EPt4EZNkhw8MkHevj5vBiyj2aDlwI7YJ9egOpKgZ4wh2UDw3staQ7fHG0na2TK1kAWGzhgXQObRlSRKt0020Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090592; c=relaxed/simple;
	bh=vXr/GnXNxbFr+TC9zt0LBP9/OZnm6Xl08eYAeiCQ7rE=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b3SxILnwvWUvWfZllxxRC29tlXqtsAXUm1C0OBPnORPDtPcPDLdatZcsPvF+W7NSXuRV/sk5UNcfA4nwDBmsk2mot/hl/tyXeLKuXZWRMcfDNNjLUG8fMnRk8NsEIp4hTFC69RjpDznsz8mGloQEaTbzVrzjJhWuEXWtDv179YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNr5MElc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNr5MElc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3541F000E9;
	Fri,  3 Jul 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090591;
	bh=P9HvP6ywqJjW4lIX5czkkb83efOhJUOJ41xBcbxpRSk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=LNr5MElcgFRMzzKWt0tqELmCdj7b+qJH6fp1S4VnXgCBSUVq9PHvbSmd6yOblJOMb
	 XhvR5ei8+B6DzzJuGdvM9UG+2DU9HWoa68/axra2zrzzBm8gnllt7hPthOqM7nVMqo
	 gdMg/+b439azYWZpgBdV1YoH9a2np3lhBq8u5+JHkHXNaGP6jTmF/vzBaepCYgvJk5
	 drNeiokdkLJLjpeWbEe0Ye1V1Tmq/a+3ymqbIa36FOPaOQtzdcAJSomn/7Zg2oFcaY
	 7sTUuxBHebGBTdbwz8VY/3J1TF6baTbl4JaIinATb9dsE2PlnTIqS/zCr9cNqQ9IIN
	 H8/6K0PdOkkvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: ti: k3-j722s-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703143717.177362-6-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-6-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 14:56:30 +0000
Message-Id: <20260703145630.AD3541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch exposes a firewalled memory region (`lpm_memory_region`)=
 in the `memory-region` array of the `wkup_r5fss0_core0` node, which will c=
ause the Linux remoteproc driver to blindly map it using `ioremap_wc()`. Th=
is triggers a firewall exception (SError) on the host CPU due to speculativ=
e memory accesses.
--

commit 8c35130aa389f76c596e95178c0c218fbc983b2b
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM metadata

Declare a carveout memory region to store LPM metadata on J722S.
For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image.

> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> --- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi

[ ... ]

> @@ -122,8 +128,10 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0 &mbox_wkup_r5_0>;
>  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names =3D "dma", "firmware";
> +			<&wkup_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;

[Severity: High]
Will adding this firewalled region to the memory-region list cause an SError
panic on the host CPU during driver probe?

Looking at the remoteproc driver, it unconditionally iterates through all
memory-region elements beyond index 0 and creates a Normal Non-Cacheable
mapping:

drivers/remoteproc/ti_k3_common.c:k3_reserved_mem_init() {
    ...
		ret =3D of_reserved_mem_region_to_resource(np, i + 1, &res);
		if (ret)
			return ret;
    ...
		kproc->rmem[i].cpu_addr =3D devm_ioremap_resource_wc(dev, &res);
    ...
}

Because devm_ioremap_resource_wc() creates a Normal memory mapping, the
ARM64 architecture permits speculative instruction or data fetches to this
region. Since the commit message mentions this memory area is firewalled to
be accessed only by TIFS, speculative fetches by the Linux core could trigg=
er
a hardware firewall violation and lead to an asynchronous SError.

Can this region either be hidden from the OS memory-region array, or should
the remoteproc driver be updated first to explicitly skip the "lpm-metadata"
region?

> +	memory-region-names =3D "dma", "firmware", "lpm-metadata";
> +	bootph-pre-ram;
>  	status =3D "okay";
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703143717.1773=
62-1-richard.genoud@bootlin.com?part=3D5
