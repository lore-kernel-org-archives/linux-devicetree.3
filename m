Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013A3B7B93
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445120; cv=none; b=l+h18pzBLhvmwpd1clhQFgytQ0OrvMxY3q2sr06vV2lqA9cwB5AHgZlA785UIJ7fauksP9dAQedb3feJ9X4jrXt68fGZ7RxjAJvz9kWv1yggm/69JUXbxTiJ21mViLGwEQr2V7ArHAXbaLn0Dzih+g5wBVTEefAOlCvHwFTeEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445120; c=relaxed/simple;
	bh=1lb8xbW38NGNB9zgrvSXbPga7sobIId/EfHZGsRYr/M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AdW5nom4Ooqx1zfHghhNhoSRAFsZgQwg5QlHyqldZqP6V+d/iUn1DNVEq3TrDJ7XoH7fFIKGyj+SsE6vSw5eYTKQk2xQbWRf5YiB4UbnrBYB/cEYlTyF+HSl/WXCRMUzTvDoNZIt5EcV0fxAhg08xgLveAyAQmdFEsH08TczLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioZJo469; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioZJo469"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAB11F000FF;
	Thu,  8 Oct 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445117;
	bh=fD5/VzPOP285tieFjJYzmjPCcIpVKLL0xt86IeL/mic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ioZJo469BuFcNtLdK0rPqLD7dzSO/3TIgGQb7q2wxp+bPMqvE3GoOrFb1yW9eegCR
	 VrpSuJ923URVcx8A8eVvU1I5soMbUEdC1VNwBMunJu02XOJCm80LOj/QRvScirAG+P
	 TZpzgihG2sCEx5PdJnYpfkujuxHvK6pzWQAspV1YZrwQ/O0TGsyjobqoLSjHjPZVKp
	 MVuGn01KpjZCYPVuk+CCNmlexBJSE4dlm0kdi9Q4/NBdv0C4wKyww2CRBrNPQ5j+II
	 dIOcR2PPlNQJw3k+SaxlCmi3b9ruTe9HsVeqNqbOFpEkskhdcxwnvtPATvL0tQOPyC
	 g2NY1tihtfGlg==
Message-ID: <sashiko-outbox-163772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:38:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing SoC-internal OF graph links between camss and standal=
one csiphy nodes
--

commit a63685b077e80fcbb61d58b04d437addeb277a93
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit describes the CAMSS and CSIPHY blocks on the Kaanapali SoC.
It adds 6 CSIPHYs, 3 TPGs, 3 CSIDs, 2 CSID Lites, 3 VFEs, and 2 VFE Lites
to enable camera pipelines on board device trees.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..7e5106865e7ee 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[ ... ]

> @@ -3597,6 +3598,307 @@ usb_dp_qmpphy_dp_in: endpoint {
>  			};
>  		};
> =20
> +		camss: isp@9253000 {
> +			compatible =3D "qcom,kaanapali-camss";

[ ... ]

> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +				};

[Severity: High]
Will the CAMSS driver be able to find the CSIPHY devices with these empty
port definitions?

The CAMSS driver (msm_csiphy_subdev_init in camss-csiphy.c) discovers its
PHYs by traversing the OF graph using of_graph_get_endpoint_by_regs on the
camss node's ports, following it to the remote endpoint's parent, and calli=
ng
devm_phy_get_by_of_node.

Because these ports lack endpoint definitions linking back to the CSIPHY
outputs, the lookup will return NULL and silently skip PHY initialization.
This leaves the phy uninitialized and prevents the PHYs from powering on
during streaming.

[ ... ]

> +			};
> +		};
> +
> +		csiphy0: phy@9523000 {
> +			compatible =3D "qcom,kaanapali-csi2-phy";
> +			reg =3D <0x0 0x09523000 0x0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,

[Severity: High]
Does this standalone csiphy0 node also need a ports structure to define its
CAMSS output endpoint?

Without a ports definition in the csiphy nodes, the OF graph traversal from
the camss node cannot resolve the remote endpoint, breaking the internal
SoC routing required to initialize the PHYs.

Since these are hardwired SoC-internal connections between the PHY output
and the CAMSS input, shouldn't they be defined here in the .dtsi rather
than forcing downstream board .dts files to manually construct the internal
SoC routing?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D10
