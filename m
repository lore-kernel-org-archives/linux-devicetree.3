Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E198D36728E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019013; cv=none; b=V1zWmIziaG8rI0Au1NMbHxzrnGQy/bVZsICaxnK0JlMQxibMxpo+XAc2bZo6Vc9c2dyue6U1jtih9Kljs8L0osnlgzo1rOA7BWuy/TrlWXg85kzcNudX+l4Bc6j0blIGuS7azVoln6NaUg+q9R5imNTkFeirVAZ3XSCHk9HUmDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019013; c=relaxed/simple;
	bh=JRR3Ag7MXMuKLzSD4NEQ+sJq4yPMLW+aB5LOLBG++To=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=epJzuJsH/Nfs96S0j+1OhAJ9jmhPkRl3DLESy71NlPG15+mIbNam1B98oKqCCkLAl2/emQNN+OBCjo/E/1oCPivBRtKdbR4XCcPd/xzIEWhGzRlzsjStZY0Rn3S9XuRkIYjWAaAx4C2yuVuwWtcQImy15LLDOlXCHHLoJyqQazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBWY5qJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBWY5qJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591551F00893;
	Tue,  9 Jun 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781019012;
	bh=e8BWW73xkJpYVs/rwicVvIN6GXHhXfQXoCVlmqsFCoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBWY5qJ0KUkwQIEhv3DjZR7jpvh1R20jtQS5SHuMqOF4wYJlzPvBSYuyAN/1UaXNb
	 z0hDBOXTJm5T1HwxN5f+HOnnojUv+GAvMLLhDgQENvGb5+P6Sz+w/8/3mgKFBEZ2AC
	 iZL/FC9JBUsSsQh9rmqYEGRrDSCYbrTdZP0K8d8A0ng8oCCmLte870mTulFU16fOGo
	 AmBm2Gll6PgJUVHWJOo0ODbuicjXOMAVGVr0E1RsSLtrVEpCcf2iLQ15yHci7nbOUn
	 rVabIMIcPqWqWCw6IgIbtKVVGFq3Ra3MMJ8j+T3w4ZX8oLaIuuxlHTvSB1Zlbgao2M
	 LBHtGLNai3s6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 15:30:11 +0000
Message-Id: <20260609153012.591551F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree nodes `gpucc`, `videocc`, and `camcc` are inserted out =
of unit-address order.
--

commit 9bb17a71a8a57aa4e3d701d95bd65991638afc45
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add support for MM clock controllers

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 977de44b816e4..c5635f22e2a7a 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
>  			};
>  		};
> =20
> +		gpucc: clock-controller@3d90000 {

[Severity: Low]
Are these new nodes inserted out of unit-address order?

It looks like gpucc@3d90000, videocc@aaf0000, and camcc@ade0000 are being
placed after the mdss@ae00000 node (which concludes just above), rather
than in strictly sequential order.

Standard device tree coding style requires child nodes within a bus to be
sorted sequentially by their unit-address. For example, gpucc@3d90000 should
likely be placed significantly earlier in the file.

> +			compatible =3D "qcom,eliza-gpucc";
> +			reg =3D <0x0 0x03d90000 0x0 0xa000>;
[ ... ]
> +		videocc: clock-controller@aaf0000 {

[Severity: Low]
Similar to gpucc, is this node also placed out of unit-address order?

The @aaf0000 address precedes @ae00000 and should be sorted accordingly.

> +			compatible =3D "qcom,eliza-videocc";
> +			reg =3D <0x0 0xaaf0000 0x0 0x10000>;
[ ... ]
> +		camcc: clock-controller@ade0000 {

[Severity: Low]
And for camcc, is this node also out of unit-address order? The @ade0000
address should precede the @ae00000 block.

> +			compatible =3D "qcom,eliza-camcc";
> +			reg =3D <0x0 0x0ade0000 0x0 0x20000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-b4-eliza_m=
m_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com?part=3D7
