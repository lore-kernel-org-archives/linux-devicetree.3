Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E803A544C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062756; cv=none; b=bjOUFjbRb5sGWRWagfi34cfcglsxaLcPSRkOWGQSPE4pvbHNWU1u1t+h0wg/JVzVrLQ8b0KuB39QpSaPT5y/RTvkRMbUv2EtcjeWeo4r0BwrtcJFtv671X8/bH5WDanm/hMlAITrm3fe3LO3/SMNe4iqtxBUq2NE3CePvLZKrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062756; c=relaxed/simple;
	bh=PaoIAeqm2DsOLu6JelF9wxNxUxWbjytZbA1e4p5eBc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FrOeIRRLLjRVNvedZsrx8RehNrxLtV4drkj6Os9m0veuPi7MjVf3Q0GwE+U6Mfbfq2Dp04TC8Uo04Nfzbr6RrAARaLDmwwbr0gxb6RuyZ0DGJLzGUATNAO6TlG8MExFH7gdS2XJnQ8nMzuD+TR+KjCNsqeFxyO0xoAIy7mn/l0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0HKGjXI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0HKGjXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2E91F000FF;
	Tue, 22 Sep 2026 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062754;
	bh=FojEkkjxjfYe5Ve0pJS8SofgUe3rSOIRKhEfD4Sv610=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O0HKGjXIq9kfaa5t37Pvtk/e+wuwdZLg+zY1LKF+C790/G9t5FSIZ6948HsGYYd2p
	 VxuJatnoNeV9A0HW9DVcOzwVDGyo6VQrRnRZlwPCs8rZk74bNMn0gEVStaajGdoslr
	 p5H3e7oNzGpjv8ru92nF/oQI8Rov7RxH8n6vMUpVEyZ3/16YniC9z57+TqQziGis/W
	 hlgb8P6byIB1s5fyBLAPVvSzjzoGeB2r6BqwPQKOV/ju0uiZH9FnyGA0iJU/CZAbHn
	 4yJE+tvTRMWCn/SJ7fhyCtSMYq7bPMKhph6dVoqTZMrZI78NUVL7dYmCFbzrBvbHgm
	 oja8v4P+RXJ+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:39:13 +0000
Message-Id: <20260922073914.1C2E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: fatal hypervisor fault due to reusable CMA memory assignment
--

commit 00239a518b7712da455472149c4770b8452bb6e8
Author: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add memory-region for audio PD
   =20
This commit reserves a memory region for audio PD dynamic loading and remote
heap requirements. It also adds the required VMID list for memory ownership
transfers to the fastrpc node.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 131fd2a16c545..f79f7679de02a 100644
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
> +			reusable;

[Severity: High]
Could marking this region as "reusable" lead to a fatal hypervisor fault?

By defining this with compatible =3D "shared-dma-pool" and "reusable", the
region is added to the Linux CMA allocator pool. This means the memory rema=
ins
in the kernel's linear map and is considered available for movable OS
allocations, such as the page cache.

> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x800000>;
> +		};
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

Since the fastrpc node references the remote heap memory region and provides
"qcom,vmids", the fastrpc driver will unconditionally strip HLOS permissions
from the entire CMA region during probe.

Specifically, fastrpc_init_reserved_mem() calls qcom_scm_assign_mem() to
transfer ownership to the DSP, removing host OS access at the hypervisor
level. Because the memory is directly assigned away without being allocated
from the CMA pool via cma_alloc(), the kernel remains unaware it has lost
access.

Will any subsequent page reclaim, CMA allocation, or speculative CPU fetch
to the linear map of this region trigger an XPU violation and crash the
kernel?

Should this memory region use "no-map" instead of "reusable" to safely
remove it from the kernel's linear map before it is statically assigned
away from the host?

>  					#address-cells =3D <1>;
>  					#size-cells =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-knp-rh-v1-=
1-35e29b104809@oss.qualcomm.com?part=3D1
