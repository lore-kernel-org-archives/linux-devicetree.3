Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174652;
	b=1egjW2hWQwTstfuImybo+NA49S1MAtGmq30GtzRTcDkEXIw8R5E9DvKy+iihnaa6wW/k
	 zlqZSEI4YiuBYl463fyiR74qzVV6Xuq3K62GTtjdXFWUkLzfC68pvjoPZT+YIBpRURT9O
	 OWgOIBxRIUatxeXV+oSexUU7GPouucfgVtVJQy+pHGJG8Je0y/YeuWUxZpDzORywo08js
	 INvrGMsQcVqhFEV1ZYbQiVTFAwqkgFSgQAApngfPjqDv5oK1etZLz15B9nBNpHPF14riq
	 +9MaSGYr5I1mTqyAblAg+ZyB2Th/suIoG5/o0q1B0qQVyqU6rcbyxMqaSbw0lwiL6lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174652;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yz0Rbraeb3gb3Sw23oRUj2qTMtNx+kpn/7fPhBN3VHM=;
	b=xzO6ffDwk0v9hw/yPh4ua+MYD6MjFmA8px81rHjcWrVwtsV/uXQ0ntEBXtmTSXMSRjSw
	 V142jhVPQ3/95x/IxfDI2f7yypCYum8Or98TsvWPQBOe780tMWdxuDgNaYW8DiRduCFZQ
	 FJDIWUP3ORDziZP7CesMQbYmbUh8z6vb9dxgfMjR9jrj/CyQJi/IuEAZhEvTnyeHbk6WD
	 q2D42aNbcSdAJgFoVhd+AIFxEEvntiPBoMvNysRHp2qqvSPNrLou5AZKEpS64ZU7uGn3s
	 wE/cCTlXHU4zfICortnZPQbe5wQEmp6Nk2awIowvD64EOqIvdxFpOBUBMMezx749YJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lejVNVrV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D4606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lejVNVrV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7FB1F01825;
	Wed, 28 Oct 2026 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793174651;
	bh=yz0Rbraeb3gb3Sw23oRUj2qTMtNx+kpn/7fPhBN3VHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lejVNVrV0LR65ZPQj0HTuM4cSh8XDpEg9n8cPX/Ha+ozuLFOOB/DkIL2zl48A/Lxs
	 uBcchI4G82JweZaNGJzYR+lywqC0kkpEHlCyk0WC5q5qahT8B5GR0kHKh/u2Noj4dO
	 GKqmfgBKdnfCbIt4lOlEHQ+a0qcLerMRbcMSvjLNV47Pt4jMgLvxuDjN/naCRwoZ9e
	 EdB7mYGQBmdazsEUWUXdVDELQMpIbA21XBQDR0ub8xgyBCforprVBihseBhiUdZm0P
	 shALr5rDMgFp68/ndrrQK8uEMvYrOt2LwthKjlIR4SjFiI98LPSrSNji0xsEN9ReKL
	 2winHnwuxmnrw==
Message-ID: <sashiko-outbox-187606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: nord: add CoreSight debug
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028075044.431228-3-shengchao.guo@oss.qualcomm.com>
References: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
 <20261028075044.431228-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:04:11 +0000
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
- [Medium] arm64: dts: qcom: nord: missing arm,primecell compatible on tn@1=
15bc000
--

commit 6b616ed8e06fef392cdf185844645dfbf1ca57e8
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: nord: add CoreSight debug nodes

This commit adds the CoreSight trace topology nodes for the Qualcomm Nord
SoC, including CTCU, STM, TPDM/TPDA sources and aggregators, funnels,
replicators, TMC ETR/ETF sinks, TNoC/ITNoC nodes, and per-subsystem CTIs.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index fdbe290350ddd..b03a33d99a1b7 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -1654,239 +1680,3181 @@ tlmm: pinctrl@f100000 {
[ ... ]
> +		tn@115bc000 {
> +			compatible =3D "qcom,coresight-tnoc";
> +			reg =3D <0x0 0x115bc000 0x0 0x3c00>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";

[Severity: Medium]
Should the compatible property on tn@115bc000 also include "arm,primecell"?

In Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml, the
binding requires both strings:

  compatible:
    items:
      - const: qcom,coresight-tnoc
      - const: arm,primecell

During bus population in drivers/of/platform.c:of_platform_bus_create(), the
kernel checks of_device_is_compatible(bus, "arm,primecell") to decide wheth=
er
to instantiate an amba_device via of_amba_device_create().

Without "arm,primecell", tn@115bc000 is created as a platform_device instead
of an amba_device. In drivers/hwtracing/coresight/coresight-tnoc.c, the
platform_driver (itnoc_driver) only matches "qcom,coresight-itnoc", while
aggregator TNoC instances are matched exclusively by the amba_driver
(trace_noc_driver).

Will omitting "arm,primecell" cause dtbs_check to fail and prevent
tn@115bc000 from probing and registering as a CoreSight link device, breaki=
ng
all trace paths routed through tn_ag?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028075044.4312=
28-1-shengchao.guo@oss.qualcomm.com?part=3D2
