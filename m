Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584153;
	b=297pD9xaOwpLz9CO0wYQCm3LqyI4X96yNtsyD352e6q9/eUjRgj6c/A+Y5PXdek7ABFq
	 vRXhvF9tl6B13INezHpsU+e5zP3FwSkvDs21/cXmcZ7/hXlMQFQibuVcFS2hGH2tm6wVh
	 m4tSLfM8w99qbHtUheDhLlqzYDTsghlS8Vx7AiejTXDFAjnbDN3J2SIbP1WZexQu+eOVe
	 e2d7DbFyR381eAWmM0WMBfK4OggXakgRqQFq4oI7B8ed89A+lOKimU3Lc+nSqgBELwusp
	 +nfMbtyRxAa4ccBLQ18p6+01bONE2qIoeAzUwSrWHF1VKSK20GS8tNJS4fQubhV4amg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iiOkA1xg9BNj8mqpbO4RtTuXb5I+vNTcnhKoMRpTUOM=;
	b=DYC8EPC6NpR881awSau9mehSlCQMMLBxYjZ/VxlnPkT5ybtsMkJAbXZuHs61YUOfBJXW
	 bwS/B16HQEMhIJftYD46iVxZxRzk7AZsyTbkjI31wYV0NfnfcpFBk4TQpGAuD1D8q5aVS
	 9Muu1cERqiJmqKd3j1LdafIIBDTMBC1yUUOjeCBYAZGu7/dECgtnAjBS6GJD0OGULgXjJ
	 8sQ3/0arDETVz5hAhk3jXjDNIakStcI39a4gjYxMIOSLVeGriEGM8dCn+i5oeF2Hz2Cyd
	 mETGwgVfwT013WIPOrxRC/H5whkIas4lDADGJrH/w2uyZLPsopMrAaCDHEeJv5xPXwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAjjo28c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C1B606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAjjo28c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799E81F000C4;
	Wed, 21 Oct 2026 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584152;
	bh=iiOkA1xg9BNj8mqpbO4RtTuXb5I+vNTcnhKoMRpTUOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cAjjo28c1V3L0P4MS3kF6Bn5wAyY2FGdrKqxLSBZnSRlVuMOGHsZs53wNRC9DBB0O
	 G43aha/8yfaDyAYARL2wpEScuyKm/9AszEQk/ddgRJ7giaNCKLUj65AD0vzcxOdaTB
	 OUw0dBP6fM2kqWDrMvXBxFE9BQ0AyQM7wXdfJXIeK48UdRpmSs9QDluZ2SzX0aDHRX
	 Dyo7pgoKe6bxW7Qk5VjBvRbLL+YVKuLIN9/iofFzlWthedg7c3l0TsItRwrjZxRt5A
	 U0EIj1s+GlbIPBXoxNNI+Ffk1pIl/HA85SS1WcKevhhb3R2tURHBl912J9kjGpT4ck
	 0siHkzsPwi59Q==
Message-ID: <sashiko-outbox-180200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:02:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: hawi: shared-dma-pool on no-map adsp_rpc_remote_=
heap_mem
--

commit 6bed856021c0410b7dd893a52e0c7a1f5cb149f9
Author: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

arm64: dts: qcom: hawi: Add memory-region for audio PD

This commit adds a reserved memory region for the audio protection domain
remote heap in arch/arm64/boot/dts/qcom/hawi.dtsi and associates it with
the adsp fastrpc node along with its target vmid list.

> diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qco=
m/hawi.dtsi
> index 6b0a0ff0faa45..80cb00eccdf15 100644
> --- a/arch/arm64/boot/dts/qcom/hawi.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
[ ... ]
> @@ -441,6 +442,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@b=
d500000 {
>  			reg =3D <0x0 0xbd500000 0x0 0xf00000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +			no-map;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x800000>;
> +		};
>  	};

[Severity: High]
Should adsp_rpc_remote_heap_mem omit compatible =3D "shared-dma-pool" here?

Because adsp_rpc_remote_heap_mem combines compatible =3D "shared-dma-pool"
with no-map (and without reusable), early boot reservation via
fdt_scan_reserved_mem() -> __reserved_mem_alloc_size() ->
fdt_init_reserved_mem_node() -> __reserved_mem_init_node() rejects
rmem_cma_setup() and instead binds the region to rmem_dma_ops in
kernel/dma/coherent.c:rmem_dma_setup().

When the adsp fastrpc node (which sets memory-region =3D
<&adsp_rpc_remote_heap_mem> and qcom,vmids =3D <QCOM_SCM_VMID_LPASS
QCOM_SCM_VMID_ADSP_HEAP>) probes in
drivers/misc/fastrpc.c:fastrpc_rpmsg_probe(), it calls
devm_of_reserved_mem_device_init(rdev) before setting the device dma mask
and before transferring memory ownership:

drivers/misc/fastrpc.c:fastrpc_rpmsg_probe() {
	...
	if (devm_of_reserved_mem_device_init(rdev))
		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
	...
	err =3D fastrpc_init_reserved_mem(data, rdev, domain_id);
	...
	rdev->dma_mask =3D &data->dma_mask;
	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
}

Calling devm_of_reserved_mem_device_init(rdev) invokes
kernel/dma/coherent.c:rmem_dma_device_init():

kernel/dma/coherent.c:rmem_dma_device_init() {
	struct dma_coherent_mem *mem =3D rmem->priv;

	if (!mem) {
		mem =3D dma_init_coherent_memory(rmem->base, rmem->base,
					       rmem->size, true);
		if (IS_ERR(mem))
			return PTR_ERR(mem);
		rmem->priv =3D mem;
	}

	/* Warn if the device potentially can't use the reserved memory */
	if (mem->device_base + rmem->size - 1 >
	    min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit))
		dev_warn(dev,
			 "reserved memory is beyond device's set DMA address range\n");

	return dma_assign_coherent_memory(dev, mem);
}

First, dma_init_coherent_memory() calls memremap(rmem->base, rmem->size,
MEMREMAP_WC), creating an active stage-1 virtual mapping in the host for
this no-map region. Immediately afterwards, fastrpc_init_reserved_mem()
revokes QCOM_SCM_VMID_HLOS permissions and assigns the entire region to
QCOM_SCM_VMID_LPASS and QCOM_SCM_VMID_ADSP_HEAP:

drivers/misc/fastrpc.c:fastrpc_init_reserved_mem() {
	...
	err =3D of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
	...
	if (domain_id =3D=3D ADSP_DOMAIN_ID) {
		cctx->remote_heap_addr =3D res.start;
		cctx->remote_heap_size =3D resource_size(&res);
	}

	if (!cctx->vmcount)
		return 0;

	src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
	return qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
				  cctx->vmperms, cctx->vmcount);
}

Leaving a live host stage-1 MEMREMAP_WC mapping and attaching the region as
rdev->dma_mem after stage-2 access is removed from QCOM_SCM_VMID_HLOS can
trigger stage-2 faults on speculative host accesses or if coherent dma
allocations (such as fastrpc_remote_heap_alloc()) allocate from and memset()
rdev->dma_mem.

Second, because rdev->coherent_dma_mask and rdev->bus_dma_limit are still 0
when devm_of_reserved_mem_device_init(rdev) runs, rmem_dma_device_init()
unconditionally logs a dev_warn() on every boot.

Since commit 9e47ad9c562e ("misc: fastrpc: Allocate entire reserved memory
for Audio PD in probe"), fastrpc retrieves the audio protection domain
region directly via of_reserved_mem_region_to_resource() rather than
dma_alloc_coherent(). Dynamic no-map carveouts with size, alignment, and
alloc-ranges are allocated by __reserved_mem_alloc_size() without needing
compatible =3D "shared-dma-pool" (matching the static no-map
adsp_rpc_remote_heap_mem nodes in hamoa.dtsi, lemans.dtsi, and monaco.dtsi).

Could compatible =3D "shared-dma-pool" be dropped from
adsp_rpc_remote_heap_mem so the region remains an unmapped carveout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-hawi-rh-v1=
-1-401143c22401@oss.qualcomm.com?part=3D1
