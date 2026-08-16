Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE738F25C
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909900; cv=none; b=oOArLrihKqbg3HbCfqGZuOO0+O8gMWxOpwkch4XPktX+t/mEStoxZ7ApCgT5SWLuXFHho4BdIl/+YqSaNdlEDc0GLlKDxK0l/n3m63tXJ89INzdrkhUDC4H26W/7kdGzw8139qJcK450h4ifpznGegfD9eldy1/S0/FzWNZzCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909900; c=relaxed/simple;
	bh=Tx9To444D0WYywDyO2HeU0LuJ3m7n8MaA1o8M6jEawU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NzonVRsWHAzBGJAwDuc8tf4sHe0EKdn9VN+qDyqBxDQ2nw0ktyZcVJQtVSMAijvOH2N6nUqrjbqRMc5u7vixIDO2czCTpA3Az9VJOg31UyG5EWb8TZGCk8TMAe/3L4woGVSrVnU6maT8PtDpcUc1UKW0LG1vDPU8uSLd/8JKO+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmewNLWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmewNLWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776631F000E9;
	Sun, 16 Aug 2026 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786909898;
	bh=7JoXA3FKFezmSHY2bYB61tRrgrRyCQyvlLe9d8X0bxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mmewNLWu3l6nHsFiZ1UeynbbirU6CWRwofhgsAclgBLPKMsu9PaWV8CU68udlUj/r
	 RFx99F7zTrvG8V1aaIJ+QIvm+/PwK7fdYQjaz82C2LCvmfvr7nN04pn6neOdceOkx6
	 TUShpBSdjw27hC0/7KpKM3/dHT70GwRGTezxmkjorYR+N7hvJvlyeLKTpCOHFxSd+w
	 iRlGozb5Xf5zqzCdCP949zRkluwHluRO9Y30aPH9veUTlWcFC8jrSR2/FEjawMhdW8
	 pau/eIwhmMOEd+j+MReshTCCsTPvknjRyP1s6cFfCTSei3dtxdF6DRcNs0xMS0y27U
	 AedcUPZHAS+7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add crypto node to
 rk3588-base
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816194112.552100-5-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-5-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 19:51:38 +0000
Message-Id: <20260816195138.776631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `status =3D "disabled";` property in the device tree nodes=
, contradicting the commit message.
- [High] Unbounded DMA transfer length in hardware hash requests.
- [Medium] Software fallback logic unnecessarily evaluates unused scatterli=
st entries.
--

--- Patch [4]: [PATCH v3 4/4] arm64: dts: rockchip: Add crypto node to rk35=
88-base ---
commit 02aef3c847464eaa142ef8468b37da657834130b
Author: Dawid Olesinski <dawidro@gmail.com>

arm64: dts: rockchip: Add crypto node to rk3588-base

This commit adds the device tree node for the V2 cryptographic hardware
accelerator on RK3588. It uses the ARM SCMI interface to obtain clocks
and the reset line from TrustZone firmware to avoid asynchronous bus faults.
The device tree node is intended to be disabled by default.

> The node is disabled by default; board files that wish to use hardware
> crypto offload must enable it.

[Severity: High]
Does this commit message match the device tree node definition? The node is
missing the status property, which means it will be enabled by default. Does
this also apply to the crypto@fe380000 node in rk356x-base.dtsi?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index fc1fdbfd31622..028781dd0d5e7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -2447,6 +2447,17 @@ sdhci: mmc@fe2e0000 {
>  		status =3D "disabled";
>  	};
> =20
> +	crypto: crypto@fe370000 {
> +		compatible =3D "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";
> +		reg =3D <0x0 0xfe370000 0x0 0x2000>;
> +		interrupts =3D <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;

[Severity: High]
Should there be a status =3D "disabled"; property included here? Probing the
hardware crypto offloader on boards without proper firmware configuration
can trigger asynchronous bus faults and boot failures.

[ ... ]

[Severity: High]
Can this hardware enablement trigger DMA transfer issues in the driver?

drivers/crypto/rockchip/rk2_crypto_ahash.c:rk2_hash_run() {
    ...
	dd->src_addr =3D cpu_to_le32(lower_32_bits(sg_dma_address(sgs)));
	dd->src_len  =3D cpu_to_le32(sg_dma_len(sgs));
    ...
}

If the crypto API submits an asynchronous hash request where the scatterlist
element's mapped length (sg_dma_len(sgs)) is larger than the requested hash
size (areq->nbytes), does this code program the DMA descriptor src_len to t=
he
full mapped length?

Because the hardware only expects areq->nbytes, commanding the DMA engine
to push excess data could cause it to stall indefinitely when the crypto
engine stops accepting data, leading to a timeout and operation failure.

[Severity: Medium]
Does the software fallback logic unnecessarily evaluate unused scatterlist
entries?

drivers/crypto/rockchip/rk2_crypto_ahash.c:rk2_ahash_need_fallback() {
    ...
	sg =3D areq->src;
	while (sg) {
		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
			atomic_long_inc(&algt->stat_fb_align);
			return true;
		}
		if (sg->length % 4) {
			atomic_long_inc(&algt->stat_fb_sglen);
			return true;
		}
		sg =3D sg_next(sg);
	}
    ...
}

If a hash request has an areq->nbytes that fits entirely within the first
scatterlist entry (nents =3D=3D 1), but the request includes a longer scatt=
erlist
chain with trailing, unused entries that have unaligned offsets or lengths,
will this loop evaluate them and force an incorrect fallback to software
hashing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816194112.5521=
00-1-dawidro@gmail.com?part=3D4
