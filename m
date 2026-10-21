Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559811;
	b=T/yJBe8GRT4+R1QRhw432lNTbMbubT+sTG8SiWOSqYXrPH2diAxHK2sVHk1R5qfhV/C8
	 1/INSB8WHBfLjMlvjtb/jeVDFFm2D7MDiFYe78kQXoJhJupar8gvSeIc2Mboeebzityr1
	 LemmadUO6j3Xff7dPGQjXr27duq67BVSH5gPELwUmRYrmORQpEdjlx0isI13qleOnX3lL
	 BeAUp3nPO/6eDRW26/8DEv472Z7ektHiTpMpt1AJ+6vv+lc4ks46a2rk91pJTPehAw5J4
	 8ISUbuCUpiDVtZvq97Qv4Tjryu7TFofMCwnDVXxukx5noqgzx1bmAPk7z+gIWsuAEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559811;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lp/4A322LHuaLeCk4icfohl7SouO147pDEyuEwajrrs=;
	b=D67RWnxn7blTNvvyzwAYwUUYUZ81r4Bpl+k+IjiwIbv69Th4SsXMkCwjBP/qmSc/iUU3
	 jP/ZjTMiuZWXHasLsyoRFqlijYJ8scWSjUNVjhRHDZ61P3+jA47zhb2c6if9ksSLFvnac
	 Bw1RuhlLrt1dGsYGGHCPSjm4nxnrfBHidE/gU98sqSjFj1xN7gP62r8ZEOfUlsO73ZdAR
	 NIrgullaKKS4jHeZdt0DE7APKOiBFcMkWiorvXLIEPPVwmXud+qeE+krK4A3th+TPpBPm
	 NBuulMmADRLTVPnS2eBOwGHhu+RnFXmlwvrGZUES4BF3XrOXhYtkpuzQwTJLed+JMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IusrndM0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE7606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IusrndM0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D97C1F000C9;
	Wed, 21 Oct 2026 05:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792559810;
	bh=lp/4A322LHuaLeCk4icfohl7SouO147pDEyuEwajrrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IusrndM0mQfeVP09yV/pofHSfn5nQhHlvWW60Uqjjq635mXjqRDZW+dn13ohjHMjy
	 82XTY6XAcAa3mgkxFnzMVqj9hnwfJtHozdeF/bsG1sTFBK+dGcz2hRUxKyMI2hApOQ
	 y5cEcG4id2Xk4EhmmnevGIrZmEP0Q44bTyRrBROtvj/kZpnATferNMpVeg/k8qHAYT
	 GxJtaj75yIfyRnDb8AVpzIsIa5yntbBqXjzbwAR1r4xAQJzkaklL9lJTUlXOcnMhqi
	 canRuk0gtJ1qiIxdwmotM+xqoJQu7/f7h2+M0YTd9Za6D471A6nZqeSgc/82DeQ1H2
	 NtP2XB9X13OsA==
Message-ID: <sashiko-outbox-179798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
References: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 05:16:49 +0000
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
- [High] arm64: dts: qcom: kaanapali: shared-dma-pool on no-map ADSP remote=
 heap
--

commit efc182312f70843b0020c655e0df8d4588f2efb8
Author: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add memory-region for audio PD

This commit adds a reserved memory region and destination vmids for the
kaanapali audio pd remote heap and links them to the adsp fastrpc node.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 131fd2a16c545..8a1b53e9f73b7 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
>  			qcom,client-id =3D <1>;
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +			no-map;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x800000>;
> +		};

[Severity: High]
Should compatible =3D "shared-dma-pool" be dropped from
adsp_rpc_remote_heap_mem now that this node uses no-map?

In v2, adsp_rpc_remote_heap_mem was changed to no-map because since commit
9981fbe599e8 ("misc: fastrpc: Allocate entire reserved memory for Audio PD
in probe"), fastrpc_rpmsg_probe() -> fastrpc_init_reserved_mem() in
drivers/misc/fastrpc.c retrieves the entire reserved-memory region via
of_reserved_mem_region_to_resource() and reassigns ownership of the whole
region away from QCOM_SCM_VMID_HLOS to QCOM_SCM_VMID_LPASS and
QCOM_SCM_VMID_ADSP_HEAP via qcom_scm_assign_mem():

drivers/misc/fastrpc.c:fastrpc_init_reserved_mem() {
    ...
	src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
	return qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
				   cctx->vmperms, cctx->vmcount);
}

However, keeping compatible =3D "shared-dma-pool" alongside no-map causes
__reserved_mem_alloc_size() -> fdt_init_reserved_mem_node() ->
__reserved_mem_init_node() in drivers/of/of_reserved_mem.c to fall through
rmem_cma_setup() in kernel/dma/contiguous.c (which returns -ENODEV when
reusable is absent) and bind rmem_dma_setup() in kernel/dma/coherent.c with
rmem->ops =3D &rmem_dma_ops.

When the adsp fastrpc rpmsg device probes in fastrpc_rpmsg_probe() in
drivers/misc/fastrpc.c, devm_of_reserved_mem_device_init(rdev) runs before
fastrpc_init_reserved_mem() and dma_set_mask_and_coherent():

drivers/misc/fastrpc.c:fastrpc_rpmsg_probe() {
    ...
	if (devm_of_reserved_mem_device_init(rdev))
		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
    ...
	err =3D fastrpc_init_reserved_mem(data);
    ...
	err =3D dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
}

This invokes rmem_dma_device_init() in kernel/dma/coherent.c:

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
		dev_warn(dev, "reserved memory is beyond device's set DMA address range\n=
");

	return dma_assign_coherent_memory(dev, mem);
}

Here, dma_init_coherent_memory() calls memremap(..., MEMREMAP_WC) in
kernel/iomem.c -> ioremap_wc() in arch/arm64/include/asm/io.h, creating a
live 8 MiB stage-1 normal non-cacheable (PROT_NORMAL_NC / MT_NORMAL_NC)
kernel virtual mapping in mem->virt_base despite no-map, and caches mem in
rmem->priv where rmem_dma_device_release() in kernel/dma/coherent.c never
unmaps it.

In addition, because rdev->coherent_dma_mask and rdev->bus_dma_limit are
still 0 at that point in fastrpc_rpmsg_probe(), rmem_dma_device_init()
unconditionally triggers the dev_warn() about the reserved memory being
beyond the device's set dma address range, and attaches rdev->dma_mem.

Once fastrpc_init_reserved_mem() revokes QCOM_SCM_VMID_HLOS stage-2 access
on the 8 MiB region via qcom_scm_assign_mem(), won't leaving an active
stage-1 PROT_NORMAL_NC mapping and coherent pool attached to rdev expose
the kernel to a stage-2 permission fault upon speculative cpu reads or
allocations through fastrpc_remote_heap_alloc() -> dma_alloc_coherent() ->
__dma_alloc_from_coherent() in kernel/dma/coherent.c?

Omitting compatible =3D "shared-dma-pool" (matching the no-map
adsp_rpc_remote_heap_mem nodes in hamoa.dtsi, lemans.dtsi, and monaco.dtsi,
as well as dynamic no-map regions using size, alignment, and alloc-ranges
such as adsp_mem in msm8916.dtsi and mdata_mem in sdm845.dtsi) would still
let __reserved_mem_alloc_size() allocate and mark the 8 MiB region nomap
while leaving rmem->ops as NULL so only of_reserved_mem_region_to_resource()
consumes it.

>  	};
> =20
>  	smp2p-adsp {
> @@ -2755,6 +2763,9 @@ fastrpc {
>  					compatible =3D "qcom,kaanapali-fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					memory-region =3D <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					#address-cells =3D <1>;
>  					#size-cells =3D <0>;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-knp-rh-v2-=
1-4e2f8e16b607@oss.qualcomm.com?part=3D1
