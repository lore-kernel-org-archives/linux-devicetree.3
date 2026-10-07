Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6D3DAAD0
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393860; cv=none; b=qd9kE9N5lIYTLjHkS9I+UFSsZmDpdLgo4w09QTgqyXYCOc2KwnJY9gIV93ihJKcAQ1q563B28K5ozHpEk38y0dBmqR8xEgEpKlx2/VbSL5jX1rwed0ieAa8xkRMAz51q04z8iM4/54WB/+hL7Jke13VwsCW6yEnzXy1P7qatPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393860; c=relaxed/simple;
	bh=Gj9whxeh/rbErTtvXKlwD1oCG1JyMexbFhxTw2ZhC1Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UEZXYUu6RXfKMoAeOHiQEZUV7I01JfMGa25PZ7u7yX2kMjdXCwCz8fDFH4we8rPj+xQbE9c7BQZN/FYJDUw7ocg8rxBmMnQj/YCYzVPkrwxr4uZs6qSGHArdAaf9Iz1IrQ90iZeOjgpgB/1FbnibduxUrAGVqiLMhwvS3WRM2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGmmXCMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGmmXCMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D280C1F000FF;
	Wed,  7 Oct 2026 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791393859;
	bh=6pBCQsIVshugwFIyIDo1FKYVxT1gptZtXm77nQer1Rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lGmmXCMMu0Kl69ihKHxCvxB+taBJchI9e6f8appYc3uE1bokUmvlGiZzfaQZ/gL9g
	 jvSlCMUol+S3AzjWfJU2KeYvqroUXaEC4WfNMZ6poxdnLPt+YSOFovsVrZ6AAoNYxp
	 orELyLHryivm30ug6ZMl/Rlv8201F7Q3qlROC3v+XIkgv5TH04ndN5Er75iBYwI+AK
	 C0WSdc3+y18CT+1Pcvwa/vS+ShRbznpHhwJ0f0Gy8zIVhCuCLXC2DtO30RUZwKLoO+
	 ULKszuec08rKDtALCjtVVbbAab5LGD+DKkb0C+NQNNllbtw3o9dSuVaHpSvKdUalpu
	 WNAq6SPadePPg==
Message-ID: <sashiko-outbox-163241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add CDSP FastRPC
 extended context bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-extended-mapping-dts-v2-2-fa9e14900313@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
 <20261007-extended-mapping-dts-v2-2-fa9e14900313@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 17:24:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dma: iommu-ranges property fails to restrict IOVA allocations
- [Low] dt-bindings: unnecessary #address-cells and #size-cells cause DTC w=
arnings
--

commit 62c300467cdba54ac064fbbf7a04d9a00a746896
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank

This commit wires up compute-cb@12 as a dedicated extended IOVA context bank
by adding an iommu-ranges property to restrict allocations to the [16 GiB,
~1 TiB) window. It also updates #address-cells, #size-cells, and the reg
properties to accommodate 64-bit values.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index de7c395d9c353..cba22314591f2 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8370,6 +8370,8 @@ remoteproc_cdsp: remoteproc@32300000 {
>  			qcom,qmp =3D <&aoss_qmp>;
>  			qcom,smem-states =3D <&smp2p_cdsp_out 0>;
>  			qcom,smem-state-names =3D "stop";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;

[Severity: Low]
Are these properties necessary here? Device Tree dictates that
#address-cells and #size-cells only affect a node's direct children. Since
glink-edge does not have a reg or ranges property, adding these properties
to its parent is non-functional and triggers avoid_unnecessary_addr_size DTC
warnings. It also violates strict YAML bindings.

> =20
>  			status =3D "disabled";
> =20
> @@ -8381,17 +8383,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>  				qcom,remote-pid =3D <5>;
>  				label =3D "cdsp";
> +				#address-cells =3D <2>;
> +				#size-cells =3D <2>;

[Severity: Low]
Similar to the remoteproc_cdsp node, could these properties be removed from
the glink-edge node? The fastrpc child node lacks a reg or ranges property,
so these will cause DTC warnings and dtbs_check failures.

[ ... ]

> @@ -8493,11 +8497,12 @@ compute-cb@11 {
> =20
>  					compute-cb@12 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
> -						reg =3D <12>;
> +						reg =3D <0x0 0xc 0x0 0x0>;
> =20
>  						iommus =3D <&apps_smmu 0x240e 0x440>,
>  							 <&apps_smmu 0x196e 0x0>,
>  							 <&apps_smmu 0x19ce 0x0>;
> +						iommu-ranges =3D <0x4 0x0 0xfc 0x0>;

[Severity: High]
Does this property actually restrict IOVA allocations as intended?

The generic Linux DMA and OF subsystems only parse the standard dma-ranges
property to establish IOVA domain geometry.

The fastrpc driver only checks for the presence of iommu-ranges via
of_property_present() to raise the DMA mask to 40 bits, but it never reads
the base address or size values.

Because no lower bound is configured for the IOVA domain, the allocator can
hand out IOVAs starting from 0, potentially causing device faults or memory
corruption if the DSP hardware requires mappings above the 16 GiB boundary.

>  						dma-coherent;
>  					};
>  				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-extended-m=
apping-dts-v2-0-fa9e14900313@oss.qualcomm.com?part=3D2
