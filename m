Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD63ED3C2
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288276; cv=none; b=otDSSGXe3pPoMu3kvOwwQ8fS71B+mtOvtYs/nKdQvIUzBlkEs+LcGMb0b/YNwyQS/tG0zs2iNKdQzlXp3Fe3v9+PaFJ8G/KHxGLN0cha7UVmOKBCln/QzsDHthz1NWWNcYCTEdJxIdWC2bdQdfN19GdLmBx6ejXIHhAh6K11Ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288276; c=relaxed/simple;
	bh=8NG1pViDaPqTiMNUdgTFDtjmF583VvIbbcHWNKKdJhc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rh1fkwdQ+pPAqkMdL08AjkIRbrcRWH/xF0zTkrDJCrPY0dORTBuV15rabi1lBQfNSTfU3PsF5S7AlptA2Ac4kyXz02ZhkrwD3H9INm024gNXDmZlS14V0BpMsc8ct+KKkJb2dNMVL4f9r9zP4YzHnZCWY0EZUl6cDq9EHAnr0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYWUySr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYWUySr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006F21F000E9;
	Wed, 20 May 2026 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288274;
	bh=y3zKHGmtnSl0avmVhXhqZdKZZIFMKY9PO5CQpKnX0mM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYWUySr6z+zQdBs7pNlabTztlbWFbn1dL/QzJCNziqnPVfxMQo1xn7ZpUSXw3BHdP
	 DoueLXENS4hB2weGD0kOqoJdcM2gs7/27pN+vBYSPiXmtFGL1yyPT9aNWTCZzlPFRQ
	 dqo+R9NbXFW+fY7Uu3AKdKz42gCQ12nfOT3NRXj5nMhU8gWaxlfzI5pJld/qEbwkZY
	 cZ0G6lNHWGSekOIeI7mccK+tyPVrceQcWY+XMVz7jdkvreNcrOnKqaDFMUUBoDQa8T
	 NmLXYHM4mx3kwMEQ4xF75mj9c45YQfYT963oj72IVMRi2f0lOkedMT8u4hemUv1K94
	 yhaEg7lWIagyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 1/2] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520141828.2724689-2-sibi.sankar@oss.qualcomm.com>
References: <20260520141828.2724689-2-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 14:44:32 +0000
Message-Id: <20260520144434.006F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The SoundWire nodes ('swr0' and 'swr3') define 17 elements for 'qco=
m,ports-*' arrays, which violates the DT binding schema.
--

commit 46878976f64d7da2480d0d9a2b1541da162ac28d
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: glymur: Add LPASS macro codecs and pinctrl

Add LPASS macro codecs, LPASS TLMM pin controller, and GPR node along with
APM and PRM audio services on Qualcomm glymur for proper sound support.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 72c7dc6e4f098..f89b9c3b54521 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> +		swr0: soundwire@6c80000 {
> +			compatible =3D "qcom,soundwire-v3.1.0";
> +			reg =3D <0x0 0x06c80000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&lpass_wsamacro>;
> +			clock-names =3D "iface";
> +			label =3D "WSA";
> +
> +			pinctrl-0 =3D <&wsa_swr_active>;
> +			pinctrl-names =3D "default";
> +
> +			qcom,ports-block-pack-mode =3D	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x0=
1 0x00 0x00 0x00  0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
> +			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x=
08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
> +			qcom,ports-offset1 =3D		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 =
0xff  0xff 0xff 0xff 0x06 0x0d 0x0  0x19 0x06 0x06>;
> +			qcom,ports-offset2 =3D		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff =
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-sinterval =3D		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x=
c8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
> +			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0=
xff 0xff 0xff 0xff 0xff 0xff  0xf 0xf 0xff 0xff>;
> +			qcom,ports-hstop =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x=
ff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
> +			qcom,ports-lane-control =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0=
xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0=
xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;

[Severity: Low]
Is it possible that these arrays define too many elements for the binding
schema?

The DT binding schema for qcom,soundwire enforces a maximum of 16 items for
properties like qcom,ports-block-pack-mode and qcom,ports-word-length. It
appears these arrays define 17 elements, which might cause DT validation to
fail during dtbs_check.

[ ... ]

> +		swr3: soundwire@6ca0000 {
> +			compatible =3D "qcom,soundwire-v3.1.0";
> +			reg =3D <0x0 0x06ca0000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&lpass_wsa2macro>;
> +			clock-names =3D "iface";
> +			label =3D "WSA2";
> +
> +			pinctrl-0 =3D <&wsa2_swr_active>;
> +			pinctrl-names =3D "default";
> +
> +			qcom,ports-block-pack-mode =3D	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x0=
1 0x00 0x00 0x00  0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
> +			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x=
08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
> +			qcom,ports-offset1 =3D		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 =
0xff  0xff 0xff 0xff 0x06 0x0d 0x0  0x19 0x06 0x06>;
> +			qcom,ports-offset2 =3D		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff =
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-sinterval =3D		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x=
c8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
> +			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0=
xff 0xff 0xff 0xff 0xff 0xff  0xf 0xf 0xff 0xff>;
> +			qcom,ports-hstop =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x=
ff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
> +			qcom,ports-lane-control =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0=
xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0=
xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;

[Severity: Low]
Could this node also trigger the same validation issue?

These arrays similarly define 17 elements.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520141828.2724=
689-1-sibi.sankar@oss.qualcomm.com?part=3D1
