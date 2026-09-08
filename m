Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85C4EE87D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862204; cv=none; b=AEtNMJLI+krM0Sf5pu8gFvHTbTM62ukAvQMc6IpH8QjGFSao2kCvtF0NWdvcOC1nZhKBYLorcRpGkSruHc1pTRA+aJLe6jMdLneSAtzMMytF3gjm4x0Zpcih4Qo+//YRnyHUfi71qHbnMBBjct3Ag2RM59kemVkam7CnIrI5NTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862204; c=relaxed/simple;
	bh=Ltt9M3WnmdnLIUplLbYZ3vp9uDyRvn4m+BOi1DJdwcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfVogOSwLRaqfFMHV30SuxmTfzOk8erLgn+C0sBCWgx8Z0JX21fCuArvCNXEVi9DS9OZb3j6avdgI5rPKaBVkg845iV5If9a6Zffc3H6fu646FquWFT4FyBrQ3ZnOX0h4F0+pBo4n43o+CzwJ+zgwC2QhVOL+qhMpY93IgZg1Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0G7Ls3K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0G7Ls3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCB1F00A3A;
	Tue,  8 Sep 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862202;
	bh=ELzyRW4FNuGIb2NoC0UKNbHK9TyChHCABhN2yzr0tAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0G7Ls3KVCXjmaNfIX3DR4AEwIYvQKrcEGPq2dP1nfe6Yl2YOeN97SywRdY583CUv
	 TFXybTSE0rR0gWRGekPVVwCJyVeuTv/ZzmIgRGmS8SXO2UFR9EJQ5vNVBlgXCTzh7T
	 zd4VIDw5iO1XPDMGyBHf+dfpk6QJbNSrfWZNCGD3948ps9Ql1F5pcYFkagWPJHbQmi
	 O+E+OLew9y2YDh8lDHxbhkG/ikNvJcjc8Jx9VDeVQZmlRFefZMKOmxD/L3ToVoBPfL
	 zj8PTaw+evaOa4HwuWlZpLUL6GoBPOUtSk69uBNAaDuHMd6mE0VedznjFHPOgHgkyE
	 7meZV8l3uNeLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] riscv: dts: spacemit: add USB2.0 controller
 nodes for K1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-6-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-6-f07342ffa051@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:10:02 +0000
Message-Id: <20260908101002.8EFCB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `storage-bus` device tree node lacks a `dma-ranges` mapping to=
 system RAM, which breaks DMA functionality for the newly added USB2.0 cont=
rollers.
--

commit 45555a07cc8ff1f0aa27f21fd3042e46e3d7b6eb
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

riscv: dts: spacemit: add USB2.0 controller nodes for K1

This commit adds the ChipIdea USB2.0 controller and PHY nodes for the
SpacemiT K1 SoC. It includes configurations for both a Dual-Role and a
Host-Only controller.

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 3fabfd34114b2..22896e757dbb5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
[ ... ]
> @@ -1301,6 +1317,30 @@ storage-bus {
>  			#size-cells =3D <2>;
>  			dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> =20
> +			usb2_0: usb@c0900000 {
> +				compatible =3D "spacemit,k1-usb2";

[Severity: High]
This isn't a bug introduced by this patch, but placing these new DMA masters
into the storage-bus node exposes a pre-existing flaw in the bus's
dma-ranges configuration.

The parent storage-bus defines its dma-ranges as restricting DMA to
physical addresses between 0x0 and 0x7FFFFFFF (MMIO space). However,
system RAM starts at 4GB (0x100000000).

Will this prevent the newly added ChipIdea USB2.0 controllers from function=
ing?
Because there is no reachable RAM mapped in the parent bus, the generic DMA
framework will limit the USB controllers' bus_dma_limit to 0x7FFFFFFF,
causing DMA map operations or SWIOTLB allocations to fail when probing the
driver or triggering data transfers.

> +				reg =3D <0x0 0xc0900000 0x0 0x4100>;
> +				interrupts =3D <105>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-b4-spacemi=
t-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com?part=3D6
