Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A22ECE86
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394302; cv=none; b=Zk9GqvHoRmhyJTk6GCvVdtiEmrXrcjUhGKirN8MmyJSk/40AkGIiRfJwt1Pq9LU2pj8nVbySaDiMuFQw/RFr81hu6xYbmGdCAA9ZQnY4+io3JS15ijOBfOkubjXVH/qOarBk2V73+Y8Xr23sDHQUsntLEDQWd24zRgWLotyRru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394302; c=relaxed/simple;
	bh=13cVVRkuTD40F7/hzwkVKWp33Mq2HqOW/Wxr4q/T+Zo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EZz0DE481927kg9pisJktQtQ5WntoNoiwLgIbZHzCBjnixRIqr11bVIhjSFLlRBBieGkoYJ57Zt4koc0VR+ycXB8ZxfQPL6rcGIj5o/qE2J0AtGbqIcOSLz3e1i4rsjr+rTtVBCNidYdpXO8GbgybduTPR+vW0D01WQIRjDQmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flOwhn9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flOwhn9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB66D1F000FF;
	Wed,  7 Oct 2026 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791394301;
	bh=u8siuGI8twlIhxJqGJR75amLYB18yjN+UzLU6i5ty0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flOwhn9S5qdyN1agetELcsKk+Xm8/u+N+PM4qay53eABIo9roJDNPbZfxbJDZw9el
	 nADzTjExuHaTFX4w9qVBbtl3kWG68H10DY0Be5oa1X0ClF3ew1A8dr6bc9T8DKJg1L
	 Fh4vyQI4jMKeoyRfRojOhKhQ/ZSPVd8GXyu1opHrxGx1cWBdu/QUWzFEfVTyxgWgK4
	 D+2VWhy0tCn+pgMLI/0jKxeXc6uxbSHkL4+57hJM30xHvwjlCh2CYKt3vEEA7bDClP
	 vzMhg1aS1ryXIU+JLWM+78PLkJBbm3V4qeEMpwI95Y/+IokdgqQlhQt4f3k0ILaC9v
	 gHJw/bEtusPBA==
Message-ID: <sashiko-outbox-163247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: kaanapali: add CDSP FastRPC
 extended context bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-extended-mapping-dts-v2-1-fa9e14900313@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
 <20261007-extended-mapping-dts-v2-1-fa9e14900313@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 17:31:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: qcom: iommu-ranges property is unparsed, failing to restrict =
IOVA bounds
- [Low] dts: qcom: unit-address mismatch for compute-cb@12 and compute-cb@13
--

commit 1be2c80a69e840e3c302f9de578640a50eb91ac9
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank

This commit wires up compute-cb@13 as a dedicated extended IOVA context bank
by adding the iommu-ranges property to restrict allocations. It also bumps
address and size cells to 2 to support 64-bit iommu-ranges, and updates the
compute-cb reg entries accordingly.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 131fd2a16c545..ed5853dd3c510 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[ ... ]

> @@ -6112,7 +6116,7 @@ compute-cb@8 {
> =20
>  					compute-cb@12 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
> -						reg =3D <12>;
> +						reg =3D <0x0 0xc 0x0 0x0>;

[Severity: Low]
Does the unit-address @12 need to be updated to match the new reg property?

The device tree specification requires the unit-address to exactly match the
first address in the reg property, formatted as hex without the 0x prefix. =
By
updating the reg address to 0xc but leaving the unit-address as @12, does
this trigger a unit_address_vs_reg dtc compilation warning?

>  						iommus =3D <&apps_smmu 0x196c 0x0>,
>  							 <&apps_smmu 0x0c2c 0x00>,
>  							 <&apps_smmu 0x0c0c 0x40>,
> @@ -6122,12 +6126,13 @@ compute-cb@12 {
> =20
>  					compute-cb@13 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
> -						reg =3D <13>;
> +						reg =3D <0x0 0xd 0x0 0x0>;

[Severity: Low]
Similar to the node above, does the unit-address @13 need to be updated to =
@d
to match the new reg address of 0xd?

>  						iommus =3D <&apps_smmu 0x196d 0x0>,
>  							 <&apps_smmu 0x0c0d 0x40>,
>  							 <&apps_smmu 0x0c2e 0x0>,
>  							 <&apps_smmu 0x0c2d 0x0>,
>  							 <&apps_smmu 0x19cd 0x0>;
> +						iommu-ranges =3D <0x4 0x0 0xfc 0x0>;

[Severity: High]
Does the kernel actually parse these lower bound restrictions?

The commit message states this restricts allocations to the [16 GiB, ~1 TiB)
window. However, the kernel's OF/IOMMU framework exclusively parses
dma-ranges to set up IOVA domain geometry. The custom iommu-ranges property
is never parsed by the core kernel.

Looking at drivers/misc/fastrpc.c, fastrpc_cb_init() only checks for the
presence of iommu-ranges:

	if (of_property_present(dev->of_node, "iommu-ranges"))
		is_extended_cb =3D true;

Since the driver sets a 40-bit DMA mask based on this presence but complete=
ly
ignores the specified lower bound, will the IOMMU IOVA allocator fall back =
to
the default domain geometry and freely allocate addresses in the [0, 16 GiB)
range instead?

Could this lead to fatal DSP faults or memory overlap if the DSP hardware
expects the allocations strictly in the restricted window?

>  						dma-coherent;
>  					};
>  				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-extended-m=
apping-dts-v2-0-fa9e14900313@oss.qualcomm.com?part=3D1
