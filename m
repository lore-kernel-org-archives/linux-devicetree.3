Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB213AAF45
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049890; cv=none; b=YrRgVtkmqgeCJpMNdTUvFw0+cMSAHsRAEh1MCUgG93U5i3GDrREd1NPtBsBUirJ0o7KHuW+oNf80PCiwE9kB3JJRt5B4sfckFXYm/QtWlAOL3i2XqIjuz82R78cAd4S4ItfCxfmM0wGV12SJy4T4wASiHzlNhnp7u1nDp7sBJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049890; c=relaxed/simple;
	bh=zuimvzOHyxhRTSZfjfTQ3N/dq2rKYDGswOVluVYAbIo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AXT7VnIKGYO70sPiM11K+zDK8lwNM2fwN9u49f7T2koOiWTG9WbCRK2QQayrSBqZYvbcN31+CHuSmd3PzzpfuG1kG9SjGgaJDLvLgUvFmKSdlJ0W/7QRd8pedFAG3Cx4xlX1rYCaYcGa30pfUgE0KxYzmFT3mGDH5OfEkiu000k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrA0Rziy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrA0Rziy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA631F000C4;
	Thu, 15 Oct 2026 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049888;
	bh=350w1ecP9+mEizln7NeSBWhk4Bb02lPR5OQmOnbzzYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VrA0RziyYxiIZ+RM/h8S9tv2H1J3vy8aLvRvTcRhoE5EVYja9xLlHdF/4aU02feAM
	 f2PDuuEWNT9Z7H2RP0/pK4HonPWY6RzX2CuuWKORpWvw2OtbzZmljqL4kRd98MlzxX
	 bhuSwUQCR0l2eR9oIaSZInCYWjgdOzLpObmlZtzRRmQPE64uDZn1VVj4QAoKT9Gh4T
	 ktxz3QxP1X7ZqRpn3PopPBELqWmARgJ8a9VEJvvNauFp8OK5P2BTR6EYxVl791LIKw
	 y8yeAibxrVW/GMBF9P0NsbZdtiL+L25E21237FjA+Xpq1Rd0aDj7SWCo7b+H7jz2wp
	 Tgp1bG3YdMDbQ==
Message-ID: <sashiko-outbox-172425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianping Li" <jianping.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:38:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: kodiak: speculative SError risk due to Normal ma=
pping of revoked remote heap
--

commit eae94193b9990051404a938db5815d54041d1867
Author: Jianping Li <jianping.li@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map

This commit replaces the "reusable" property with "no-map" for the ADSP
remote heap to prevent the kernel from reusing the memory after it has
been assigned to the DSP. It addresses a synchronous external abort that
occurred when the kernel accessed the revoked memory.

Link: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qual=
comm.com/

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index f2da3706d5c88..d4a5b02965252 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -194,7 +194,7 @@ rmtfs_mem: rmtfs@9c900000 {
>  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			compatible =3D "shared-dma-pool";
>  			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> -			reusable;
> +			no-map;

[Severity: High]
Does combining no-map with shared-dma-pool leave a live Normal memory
mapping that can trigger speculative SErrors?

When the DMA framework processes these combined properties,
rmem_dma_device_init() calls dma_init_coherent_memory(), which
unconditionally maps the entire region into vmalloc space:

kernel/dma/coherent.c:dma_init_coherent_memory() {
    ...
    mem_base =3D memremap(phys_addr, size, MEMREMAP_WC);
    ...
}

Because MEMREMAP_WC creates a Normal Non-Cacheable (MT_NORMAL_NC) mapping,
the CPU can speculatively prefetch from this memory.

Later, when the FastRPC driver assigns the physical memory to the DSP via
qcom_scm_assign_mem(), it revokes HLOS (kernel) access via TrustZone. If the
CPU issues a speculative fetch against the live vmalloc mapping, hitting the
TrustZone protection boundary will cause the interconnect to return an
external abort, triggering an asynchronous SError and crashing the system.

While changing to no-map prevents the linear map from accessing the memory,
does the region need a different compatible string or alternative handling =
so
the DMA framework doesn't map it back in as Normal memory?

>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015071511.977-=
1-jianping.li@oss.qualcomm.com?part=3D1
