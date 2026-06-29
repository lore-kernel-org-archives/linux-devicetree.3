Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63B3A873C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715696; cv=none; b=GXYb+MIO2bdR1Q14v5jD4zmps+bkFiXfYnpag8bzg0LrKjimXZjFhF/FnJduSRHNiM6NL+VkvluTV9boi42vExdpzOmvFnfb02pZEtxmxH6Ern83aHlRNwK0dZwfBwQCnXB3dPhASji74Gbtgx3FWuawuYLq7BtsaJn/2BwdOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715696; c=relaxed/simple;
	bh=EtoJTg+HOqiygPVL4TLWOvd87c872pl8z9T0zb2JMN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eFRobESCSOHi9JLBN9OSywFUmuP7xD7i0Q2Tv1/PINrLeTZMm3N/nOPxFLo/d20hEusJbPaI1FSagkGaaoiGSqBOzDWKCu8x5dCU+w9YpFDuMhbZWprElGK2y04G4/jlj4NpPglkf5vs3w6DWAoqU9rR9XoFl91c8i4IuhQwqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EB61F000E9;
	Mon, 29 Jun 2026 06:48:14 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: talos: Add memory-region
 for audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
References: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 06:47:44 +0000
Message-Id: <20260629064814.A5EB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The fastrpc driver allocates CMA memory for the `remote_heap` =
and transfers ownership to the DSP via `qcom_scm_assign_mem`. However, it f=
ails to restore ownership back to the kernel (HLOS) before freeing the memo=
ry, causing fatal kernel panics upon memory reuse.
--

commit d7ff4ea03a9a2493480fcd2856711302a7acac21
Author: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

arm64: dts: qcom: talos: Add memory-region for audio PD
   =20
Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
[ ... ]
> @@ -5195,6 +5204,9 @@ fastrpc {
>  					compatible =3D "qcom,fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					memory-region =3D <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

[Severity: Critical]
This is a pre-existing issue, but by adding the qcom,vmids property, does
this expose a fatal kernel panic in the fastrpc driver?

Setting this property configures vmcount > 0, which triggers memory
assignment code paths in the fastrpc driver. The driver allocates CMA memory
for the remote_heap and transfers ownership to the DSP via
qcom_scm_assign_mem, but it fails to restore ownership back to the kernel
(HLOS) before freeing the memory.

For example, when a user unmaps the memory, the buffer is freed directly
back to the CMA pool:

drivers/misc/fastrpc.c:fastrpc_req_munmap_impl() {
    ...
        fastrpc_buf_free(buf);
    ...
}

The same occurs during device teardown:

drivers/misc/fastrpc.c:fastrpc_rpmsg_remove() {
    ...
    if (cctx->remote_heap)
        fastrpc_buf_free(cctx->remote_heap);
    ...
}

And the free function never reclaims HLOS ownership:

drivers/misc/fastrpc.c:fastrpc_buf_free() {
    dma_free_coherent(buf->dev, buf->size, buf->virt,
                      fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr)=
);
    kfree(buf);
}

Without making a qcom_scm_assign_mem hypercall to restore QCOM_SCM_VMID_HLOS
ownership before dma_free_coherent(), won't subsequent kernel accesses to
these freed pages trigger a Stage-2 permission violation and cause a
Synchronous External Abort (SEA)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-talos-remo=
teheap-v3-1-4e23366c9196@oss.qualcomm.com?part=3D1
