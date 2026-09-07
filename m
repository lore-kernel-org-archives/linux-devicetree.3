Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A15439332
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770701; cv=none; b=NlvVDd/mnbD8+sP57jMwF5VZvGOlavryBF02jyBKg/diyoX9vXCWDQmrbypTj/tibhVaz3zwc//ddj0usx3kUU+AmTRrIs8YU114h+FbebkC0lnx1Cop0FrrTcpKS8s7NB2NQYQIqLuWnJHASvePFLRp2T4KASW4OllnBz0JpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770701; c=relaxed/simple;
	bh=UM19w6r7vKQccmVZVDy0FcJKVjuoATG+2N9OB3oEFD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9qyra/gA4XGcjOYzkr8RlyiPT1Wnap3zLFoGYkL34UoHEi+JKqYa4qgHJdmpYts5DAWoNngWGLMnh54KHdC90hg31E4aruojHtbth1+Xvk85oAtOPP8RFhMBoVmr3U35M1kMcMvItwuMz2rxJdzQ7L4slGShzgonG0qsuuvXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+GCKMtK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+GCKMtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7F81F00A3A;
	Mon,  7 Sep 2026 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770699;
	bh=PesGwfdwerpqmnQVud8dQIh+7X8PMtFgs5Hr8U8c8NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+GCKMtKs7T15IDZjCvmO6WFOllHxw8AYvA0Um/foeRGtL6K5PdKAvQMpKQ01QDa0
	 LaJ1kZf77tYQ8BIHG4Da5JDmF4PaqrvgYRwby6v8kvJn9wiUBKei1Pn+HLecezU/9w
	 rWbf7luuEGEm+QgFOtUwpnC67ff2VUsyyEQcKTokW1nNkXewcQViE0aOFtMl727X56
	 d0yCBKsRgji409m/MB999FZLasBhLH5NnpSrWXKJrQ9aCn2FtJfSe6J55iswug5QsO
	 lOTaU0fxNmOlXm0gK0szlxVYYaonlWHJacf12Yi/o0BTeSkTNGGaEKoqC7CMckRhZQ
	 FD6o7KDFRkrhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] arm64: dts: intel: agilex5: add USB3.1
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <5c33bd732d48b280d6a45783c7c84d57ea778b4a.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
 <5c33bd732d48b280d6a45783c7c84d57ea778b4a.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:44:58 +0000
Message-Id: <20260907084458.DE7F81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `dma-ranges` property attempts to map a 40-bit (1 TiB) address=
 window into a strictly 32-bit parent bus, which will break DMA addressing =
above 4 GiB.
--

commit 37652f3fe88e1fdb5283901dda73de167a957be5
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: intel: agilex5: add USB3.1 controller node

This commit adds a DTS node for the Synopsys DWC3 USB3.1 controller on the=
=20
Agilex5 SoC. It places the node under a simple-bus with a 40-bit dma-ranges=
=20
window to match the interconnect's USB DMA address width.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index f54767d1526e1..523f722a2a642 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> @@ -493,6 +493,41 @@ usb0: usb@10b00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		usb31_bus: usb-bus@11000000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x0 0x0 0x11000000 0x0 0x100000>;
> +			/*
> +			 * USB interconnect DMA is limited to 40-bit addresses
> +			 * (1 TiB window from 0).
> +			 */
> +			dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this 1 TiB DMA mapping conflict with the 32-bit parent bus?

The usb31_bus node defines a 1 TiB DMA window (0x100 0x0 size) mapped into
its parent node starting at address 0x0. However, the parent node appears
to define #address-cells =3D <1>, representing a strictly 32-bit (4 GiB)
address space.

Since a 1 TiB mapping cannot logically fit within a 32-bit parent address
space, will this truncate addresses above 4 GiB during DMA translation in
of_translate_dma_address(), leading to DMA mapping errors or IOMMU faults
when the USB 3.1 controller performs a DMA transaction to memory above the
4 GiB physical address boundary?

> +
> +			usb31: usb@0 {
> +				compatible =3D "altr,agilex5-dwc3";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788757821.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
