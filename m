Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824042A7A1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263815; cv=none; b=aEd9OGXPk7ZoN3BI+3X621uminRXvp/RQlHIwxUMoVac3r4u1DW8TbmikaQk5CEXHqvpIik4gDQEFFu2wvzG2Jdx6QLm04NNck4FxJEH6G8SjHE1J8g6caFMMeqmCx8wVUlo0T8ybe7h57niVR++FHlCKZ+IHyxKfHVyh9HRiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263815; c=relaxed/simple;
	bh=RrWBLB9CKU8eShPVZTVZ7hIxenIPNxCHY/CYMQjIlP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfJgs78sTrgsAYJIGQg97WuHCPa23eeiliy5RThPDsagy4MVCUKEIcumAFcEToKPvuB/A9rYD4UVAw4Drb1lryfQn0SzAmhE5BXfzmmMrOhCFwplSz5m7IMqf87UfBrpjNWSw7slC+nP6xApTXRmuoXiN4R5cB+/vO5F+9I/J+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKWssZm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKWssZm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B671F00A3A;
	Tue, 28 Jul 2026 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785263813;
	bh=KIImU5qEsa7+0zhX44U2c+cNjRGX4pbVc9QFZprRqIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKWssZm+bD3FauuQthDH5Kypf5V36y7XwaOqcV64s1pYa0q/IgJVnbGhEyL6VH4JT
	 g+LUibXymvuqRcc5DYQS1xbBpDXc0/EK2n5Vt99pb/zmhlg8mR1LbQyMoiSNHnR9F4
	 EZ9pbrVH05VCWj8HLRWmWHKd2wmi9WP9mDyK52pR+FnPakxJA/9EmXwhhWHmljm1LI
	 ZmjmfMDjVYnnWhnDRblg++OJL6jrZa+lPCt1fluC350SJ2NntxBdCncEzlUcXyMmm0
	 NeGx54JLsgVLSUYVU8WjFp9yzpjzPGRDSxPZn1kK2gD6WZQhGCeU3ysdsIaiftKeAE
	 RrrX5PHRtBtew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for
 EC fan thermal management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-8-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-8-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:36:53 +0000
Message-Id: <20260728183653.A8B671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `embedded-controller@76` node lacks the mandator=
y `compatible` and `reg` properties, resulting in an incomplete and non-fun=
ctional device tree node.
--

--- Patch [8]: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens f=
or EC fan thermal management ---
commit 59ab25e0b30620df90dae53f1497861f1847b925
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management

This commit adds the qcom,tsens property to the embedded-controller node
in the x1e80100-crd device tree to report average SoC junction temperature
to the EC for fan control.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/=
dts/qcom/x1e80100-crd.dts
> index 429deffcf3e9d..4639340e716c6 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -20,3 +20,9 @@ &gpu_zap_shader {
>  &iris {
>  	status =3D "okay";
>  };
> +
> +&i2c5 {
> +	embedded-controller@76 {
> +		qcom,tsens =3D <&tsens2 11>, <&tsens3 15>;
> +	};
> +};

[Severity: Medium]
Since this defines a new embedded-controller@76 node directly under &i2c5
rather than referencing an existing phandle, does it need compatible and reg
properties?

Without them, dtc will emit a unit_address_vs_reg warning because the @76
unit address lacks a corresponding reg =3D <0x76> property.

Furthermore, the I2C subsystem will not instantiate the device without a
compatible string and reg address, which would prevent the driver from
probing and leave the thermal management non-functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D8
