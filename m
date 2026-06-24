Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D120459A
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282649; cv=none; b=chQszkViuRGFkkb6v9wuf14pEmfkKWJSH2TCF+hPc9CKd5VnupwgENGcphmu8K6x5ZvzqzWlhsxLPVI6TNbRtywxqqUsPGnVQ3VFHS1polilm/ZAbNgeH0jlPkEIm9Yn3cA7YkYVqgq3y8vDpxi26ByqydXDo+qLRID8RH6Sv18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282649; c=relaxed/simple;
	bh=LbsNcuUvLbIZpnpdwZyEsrCV5tkucSczDTX6davkl3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sEUkzHXwVZXXT2+tRSQ7gygqiPbd4ijktb8PbMBH9MxLtGjl+11HpUUazwE0I+u2mwshERQf56rb6MsN6aHFtrjbNU1fRa/8xNRR4brIun6BYZbeHRgznHqVRC4alu0tdBtQwEfBVW/d+ft1wH/OOz628SQIWzX6ZsaBsO/8fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMZwNOlv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMZwNOlv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6021F000E9;
	Wed, 24 Jun 2026 06:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782282648;
	bh=Pd1BPhMchqCBbVTpAwga4eYEcHKVih7N9Yz/Mfhj6mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMZwNOlvsGtTU5YcxIESqYdv8r5AksCqQg/5Zqjf2P0x2auJ53I4zbrMY72mRlqVh
	 cPwMEY0LDK04p9GITEkCx13QpCHAUkmQtHrz5uU6PWfzCVHMsvfHr6AoEENjkfR11n
	 eLAwygGWcsdsTbHxXIMO7PGoacfTQ0G3Enm0BSSmwzdgAY4RyoVsWZ9IT429X6a+ZO
	 claE/GOUGeBDf1D9JVXhs6Nro4+RSAV0yqVRcjOVIh/uaAiWKAEXQB39n4MzYAbmO1
	 HtkNSJaAbvNgoq6KfnliJ3YKWDujr5jeraM4TIWVRb68JtvYsA3HCmxKI0AV410FhJ
	 6CSS+pIHN3zeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: socfpga: agilex5: Add dma-coherent
 to XGMAC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624062203.12221-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260624062203.12221-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 06:30:47 +0000
Message-Id: <20260624063048.3D6021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Omission of `dma-coherent` property on SMMU-routed DMA master node=
s (`usb0`, `dmac0`, `dmac1`) causes potential data corruption.
--

commit d5421d52fec812147859d426e90e92990eb7c1b8
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes

The SMMU is enabled and transactions going through it are cache
coherent. Add the dma-coherent property to the XGMAC nodes to prevent
redundant cache flush/invalidate operations and potential stale data
issues.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 654f94ded1e85..3de424ae3b8ba 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -576,6 +576,7 @@ gmac0: ethernet@10810000 {
>  			altr,sysmgr-syscon =3D <&sysmgr 0x44 0>;
>  			snps,clk-csr =3D <0>;
>  			iommus =3D <&smmu 1>;
> +			dma-coherent;
>  			status =3D "disabled";
> =20
>  			stmmac_axi_emac0_setup: stmmac-axi-config {

[Severity: High]
This is a pre-existing issue, but since the commit message establishes that
transactions going through the SMMU are cache coherent, should the
dma-coherent property also be added to other SMMU-routed DMA master nodes?

Looking at arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi, the dmac0, dmac1,
and usb0 nodes also route through the SMMU but lack the dma-coherent proper=
ty:

dmac0: dma-controller@0 {
        ...
        iommus =3D <&smmu 8>;
};

If the kernel incorrectly treats these devices as non-coherent, allocating
a DMA buffer for reading (DMA_FROM_DEVICE) might result in a cache
invalidation (DC IVAC via dmac_inv_range()) discarding dirty cache lines
without writing them back to memory.

This would cause the CPU to subsequently read stale data, permanently losing
the data the device just wrote.

Could this incomplete fix leave usb0, dmac0, and dmac1 vulnerable to data
corruption and loss?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624062203.1222=
1-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
