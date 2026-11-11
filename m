Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372086;
	b=Cg1EBKqboQJLiU+XyoadOC8lIkrfp+EbjmwvSeuWM0NpgRsHq06Wke3LsG0HmB8VOfO+
	 cZGGmBP6R/QP2OC+XIAc0bavi1tQD6oQahbbFv+S3W44kJLr7HXHhwQr/nISg4vIyW1q+
	 snSTkZ124ApIiDYZ1AAxdlDaeqZasbeO3sr5t2UFzbsbvritm7q9OLxgbt7NC+nEqouXL
	 +3l4Dj1OqLsJQ8lhLhKePUzlauD94WPB2W9GCKXj3gquKs8MCNJZgCVHqvDqHd0WHWoBa
	 W5ugiNStLtmpU4KI0pVqVUFNJSDr2+jQzEDU6PuIFvTplgFlbrdgqIkp0gPsPgd0T0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372086;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1uQbXNVMH+dIif2bEtRnnIBpDX5y4Q9LVd21Du6SVnw=;
	b=lkKZeyVL5f1ty4VcC9mqhavem2kechI/3WXQDkEcyYZYVUmn92dUOrUllOIXURQZ5gs0
	 d5JmlBnCCP4lA99b1dyRyFBaBbWH4kw6Oxj5YC9auN3FkQzzlw2GsFsF1jPTlEE6gi78W
	 Nu4tUfQuBtYxrAuFtDXI2N8W5IVPzpc/Xl1xBKcZ/d0R1ymWKOn1qbXaPoWjsr1OlCqxN
	 5Qh6+EZw/UQISTNyofbD4l1qRFLzVPfuNnN2g/cfcFSegpLnviuqzhD4s79zg0WJJUDjP
	 jMce+2nrjSWo8Szj6J/oCV0oHGIe7N9lcgXnBT9AUo6wFRk4nYVvkPx19WUWFVeuNUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GigpsAck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1B606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GigpsAck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D93A1F0089F;
	Wed, 11 Nov 2026 04:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794372085;
	bh=1uQbXNVMH+dIif2bEtRnnIBpDX5y4Q9LVd21Du6SVnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GigpsAckahehKc++HqbFnBKbIGoomdKkcrDhza67CkL/3C5CAs8KM9TYrGg3hNIc3
	 ODDTmHZ5o32soiiWHzRak2KJWU5sNbwhv1yvEzKoBEKvx6Namp/PWQdVbICUhsnvHG
	 YlYzyVzAjX6OT0Psuut/z5MiStwcWAlxh9TKiufc/mEEiI0pxR/L88pREYFA7pGEJY
	 fupSKYNeERTkvBYziKFJr3249nZDEYTvyfe63iuBox8q82DIXJWFbv6A2CMqrTq7kt
	 PilC5VF9/VKmcMTqmXz36fQoknUxX6Jlyvw7wgNJ2AocJoPpnwHDKeka5YDWFEwPaN
	 Dq82CINz4qzrA==
Message-ID: <sashiko-outbox-208306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: add CoreSight debug
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111041956.3639092-3-shengchao.guo@oss.qualcomm.com>
References: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
 <20261111041956.3639092-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:41:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: nord: unresolved aoss_qmp phandle in
  CoreSight nodes
- [High] arm64: dts: qcom: nord: missing arm,primecell compatible on
  tn@115bc000
--

commit 6b7289c2147fc057245f0e8ab533b94124ab13d2
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: nord: add CoreSight debug nodes

This commit adds the CoreSight trace topology nodes for the Qualcomm Nord
SoC to nord.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index fdbe290350ddd..b03a33d99a1b7 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> @@ -1654,239 +1680,3181 @@ tlmm: pinctrl@f100000 {
>  			wakeup-parent =3D <&pdc>;
>  		};
> =20

[ ... ]

> +		ctcu@10001000 {
> +			compatible =3D "qcom,nord-ctcu", "qcom,sa8775p-ctcu";
> +			reg =3D <0x0 0x10001000 0x0 0x1000>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb";

[Severity: High]
Where is the aoss_qmp label defined?  All 105 clocked CoreSight nodes added
in this patch reference <&aoss_qmp>, which does not exist in nord.dtsi or
any of the Nord board DTS files, causing dtc to fail with a
phandle_references error when building nord-ride.dtb and nord-rrd.dtb.

[ ... ]

> +		tn@115bc000 {
> +			compatible =3D "qcom,coresight-tnoc";
> +			reg =3D <0x0 0x115bc000 0x0 0x3c00>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";

[Severity: High]
Should tn@115bc000 include "arm,primecell" in its compatible list, as
required by Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml?

Without "arm,primecell", of_platform_bus_create() registers tn@115bc000 as a
platform_device rather than an amba_device, so trace_noc_driver (an
amba_driver in drivers/hwtracing/coresight/coresight-tnoc.c) never binds to
it and none of the 33 trace inputs routed through tn_ag can form a trace
path to the sinks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111041956.3639=
092-1-shengchao.guo@oss.qualcomm.com?part=3D2
