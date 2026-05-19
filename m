Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21953E1693
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189921; cv=none; b=WUNWZZCZk170Le94DEUM1uwoqLgw/y6OzCr65QmR26rgs5xTJRAzFCBRZhZQ/fV5KbfXAg343Duc2l9ynOdCZqh283scjON+9RGjYio/mLAoph+Gr8Ge+31Nfi6LClpjVwHsjsjAgY54cCJvm24zabv5ALSjpxY6S4vzcIjIMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189921; c=relaxed/simple;
	bh=PB4EPQWnJO4AISs+y3E9QUCDHabdtfRsfdIWPqz9Jaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdhkeFDNyPh27xenN8Dz2s0SQhGD83YOQlgVbJ0Y1RO44CImJ9IqTnzXOvpO1jmDDnruO+kCpxbQicHyxgQBz26qFLzTkdWico49xM0R8MdSpshzLB+h/5AJPCRhHJlz4lEOZk0qSlqQBJ9Uz6YXMgPdcuUn+Uh84NWsQJTlbPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqkgTyfq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqkgTyfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A747C2BCB3;
	Tue, 19 May 2026 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189921;
	bh=PB4EPQWnJO4AISs+y3E9QUCDHabdtfRsfdIWPqz9Jaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OqkgTyfqT1aDtIY74KsMkVOf/E8yibt0g1lgRTwxHOC8vb4pe/tR5kOLiLL5y4bp6
	 8CAcq7CIstBK+KvLCbbVtlYqSKUKBijmhPY8vvLu7UBIpgjM18DlhUqwcs0nYyg0ai
	 zC2GhYs3jotein32PLvdvk5PT7vPPPlPkLhKaNTHJcwQMldRJbEK9OzvCcF69n33UJ
	 qnb8r3Hv9CW0z9skvJCIjrJ90dDxBpM5BrowLaFXRAS8k7lyOJO0ASKnIM0J/a7cp4
	 Ih3PRPFBT4FUtyv+63EGwN8Oyta9O79iGm3y7dxMBdTxMnQob27qch+CZTTrpwT/AO
	 X018miJ+4PU/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Enable SPEL powercap
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-3-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-3-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:25:20 +0000
Message-Id: <20260519112521.0A747C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The unit-address of the `power-controller` node (`@ef3b000`) does n=
ot match the first address specified in the `reg` property (`0x0ef3e000`).
--

commit 2d003127cde30ba8cb78978e9f333e066d842620
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
arm64: dts: qcom: glymur: Enable SPEL powercap driver

This commit adds the Qualcomm SoC Power and Electrical Limits (SPEL) node
to the glymur device tree. This enables hardware-based power monitoring and
limiting capabilities for various power domains.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 72c7dc6e4f098..c0ba8740ae413 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> +		power-controller@ef3b000 {
> +			compatible =3D "qcom,spel";
> +			reg =3D <0x0 0x0ef3e000 0x0 0x1000>,

This isn't a bug, but the unit-address in the node name (@ef3b000) does not
match the first address specified in the reg property (0x0ef3e000).=20

Should the node name be updated to power-controller@ef3e000 to match the
first reg entry and avoid compiler warnings?

> +			      <0x0 0x0ef3d000 0x0 0x1000>,
> +			      <0x0 0x0ef3b000 0x0 0x1000>;
> +			reg-names =3D "nodes",
> +				    "constraints",
> +				    "config";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-qcom_spel_=
driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com?part=3D3
