Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01B403151
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901422; cv=none; b=LnVNwlzF/N8RRokdWkqQLkimyjW/TyIYWwtchI2jLgqaxo+Fy4pGriS/kUMIkB03GJi/S/oGlImpMNmMj1A4Ky14AS+1BEQpsSYL7nkas+1kWEurifyB6gJRrfBbg+GgOEGQq/plsu3hrwPJTTUVO8M2kHrwPHLZU3xdIb2f9Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901422; c=relaxed/simple;
	bh=0xtJi14Zr6Fb2zwnaRm26ImI73MCZPBC9d1hLJbhjRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jO2oeuxqg9hvU4gGONBJfn1LLeOumOe6x79YnMt8VeHD1Z85/aBnv5K8bpqdCZnkhVxjVKAZimjj/6tBQqZAI0okQhRx5jZJBnoJixxsEIvlFP6lt94OBfIp0CRdJ1obeHN3etZexUB0dv/9fT+8cxcqZM1SmSW0OM6fgdEA9Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktpD3a0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktpD3a0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B4A1F000E9;
	Wed,  1 Jul 2026 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901419;
	bh=5Rsn7FVbdeQAvhYlmCgY+e9t1aFxrmBfQn6YiiR2jB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ktpD3a0GzB2y5SIXKELWjEF+chS8CqJeZ0Fnf270GtCgP5LjYDw1tU5/JVIVFQXyR
	 S6HIKHpF3Z+yNKQFR6axFSnysPW/NgmHKUt6LtEtIYbnjuN6VMGZYfx8gwK9DKTm6i
	 VGLkAWbI03iziMxaX5LQP8C9XbNFlkd+/M84zjyRuDSnI/69FWKmV/OLpSLkJ80kTy
	 FCEe+p2y4DQXh3/RUhZSUC/XzAp9Xp8evU6lVxoeqHlGo9GgHpbj5lmKSdKxDj44qd
	 fXthqUqendb2Am7VCs+r2AxEkMPcJxJPmBUDuhmoE0avuKHj3b0w6hUxwqEK0+tS3N
	 5u12BsmpBcpFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio
 PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
References: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 10:23:38 +0000
Message-Id: <20260701102339.19B4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `adsp-rpc-remote-heap` memory region uses `reusable` without r=
etaining HLOS access, leading to fatal hypervisor faults due to speculative=
 execution.

Pre-existing issues:
- [High] The fastrpc driver does not restore memory ownership to HLOS befor=
e freeing the remote_heap, causing a fatal XPU violation on memory reuse.
--

commit 39381f5de37bbf0f0366047bc842de4cb219a1ec
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add memory-region for audio PD

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 20b49af7298e9..f403f542aa00c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> @@ -663,6 +664,14 @@ smem_mem: smem@ffe00000 {
>  			hwlocks =3D <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> +			reusable;
> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x800000>;
> +		};
>  	};
> =20
>  	smp2p-adsp {
[ ... ]
> @@ -3845,6 +3854,9 @@ fastrpc {
>  					compatible =3D "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					memory-region =3D <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

[Severity: High]
Since this memory region is defined with the reusable property, it is placed
in the CMA pool and the kernel's linear mapping. When the fastrpc driver
allocates this memory and assigns it, it strips QCOM_SCM_VMID_HLOS because =
it
is missing from this qcom,vmids array.

Because the pages remain mapped in the kernel's linear mapping, will any
speculative CPU fetch to these addresses immediately trigger a hypervisor
protection fault?

Should this region use no-map instead, or should QCOM_SCM_VMID_HLOS be
included in the qcom,vmids array?

[Severity: High]
This is a pre-existing issue, but I noticed a related problem in the fastrpc
driver when handling this remote heap memory.

When the driver frees the remote heap during channel teardown or module
removal, it returns the buffer to the CMA pool:

drivers/misc/fastrpc.c:fastrpc_rpmsg_remove() {
        ...
        if (cctx->remote_heap)
                fastrpc_buf_free(cctx->remote_heap);
        ...
}

Does this free the memory without restoring ownership to QCOM_SCM_VMID_HLOS?

If so, could this cause an XPU/SMMU violation when the CMA allocator
subsequently reuses these freed pages for another kernel component?

>  					#address-cells =3D <1>;
>  					#size-cells =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-glymur-aud=
io-v1-1-2c3862d95a09@oss.qualcomm.com?part=3D1
