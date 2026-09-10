Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD573BE172
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048343; cv=none; b=QCukePM48hfnzi8kfOy2ehpmKOcB7LDp4K92AsAUkMCECTv4uUTExiW3Eu5EWSdLVgMyD6vxMVtccjt71cpn21iF2f72azlHa6TYlW8We3iowaptxxDJs0NlRfqKHgRcdPuIKNT9pkLo9r96HDaK2yKeAMgq+GM2mCOo8MaYf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048343; c=relaxed/simple;
	bh=ECcqTe8E5JOErumIyQygUyTofOaXLaZrLZ2bsweOL7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jXSdzJ0Zn0WgEHRG1sVwXULRWK1ow9MazCMmWjrXUINn9yUD4j/woGbL8xHG1m5y1TAf4tI6kQB8Jnex7D1BEKvE+jYxrQ3YdA6hCJ1b2yb5UX+P2MaxrrvKVLHgqbV4rK99e2rxF0PMSXU/Cc3PCjVfZM9GLIPdGb75zaAiFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdCFJY5Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdCFJY5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495C31F000FF;
	Thu, 10 Sep 2026 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048341;
	bh=nnJIDuYBweIP0CobdJ8vZqTbh/MdiNO99BrrYyA3BGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdCFJY5YreTJw5AX/SXvn5mIxOFY/QA8E5fnhrhn2GpdphR8ZpzGaFXLbmq9M+hg6
	 PMIqF7aH2NZ2SBg4fd5lJ/rA3bLpHyPktVDtpDjtONcjnSAjmtyPLMjU7DdRl8dyJj
	 Z0d+GSfqi5pjJ/zeifSlrvL9mG551/8rIijFLloIPUQ/EztPX+GGPset4S8XesKXX2
	 Gl2daOpxGYZyLGALVgUrhbm88/aM7BvGe83ZfQELbnXL0i/SPSQFWw4DIXVw0ZV9Va
	 x+NsjvX0DcHOCTd6hPKbCheJ/0O7muuWxA5a43DqISZm2aH0BbUoCwXQqRhZ9hJrCC
	 R9L1v+exXUx9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:52:20 +0000
Message-Id: <20260910135221.495C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing phy_exit() on early error paths in PCIe port parsing funct=
ions, leading to leaked initialized PHY state.
--

commit 7aa07cedc6576c48d7f1dd8ce61fd5bb50362173
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index 3e636926231d3..27a0b90d2b7ae 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
[ ... ]
> @@ -618,15 +618,17 @@ &mss_pil {
> =20
>  &pcie0 {
>  	status =3D "okay";
> -	perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 134 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply =3D <&pcie0_3p3v_dual>;
> =20
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie0_default_state>;
>  };
> =20
> +&pcie0_port0 {
> +	reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 134 GPIO_ACTIVE_LOW>;
> +};
> +

[Severity: High]
This isn't a bug introduced by this patch, but does this new device tree
configuration expose a resource leak in the driver's error handling paths?

Because the driver now dynamically evaluates qcom_pcie_parse_perst() during
qcom_pcie_parse_port() for these root port nodes, what happens if these GPI=
Os
defer probing?

Looking at drivers/pci/controller/dwc/pcie-qcom.c in qcom_pcie_parse_port():

	ret =3D qcom_pcie_parse_perst(pcie, port, node);
	if (ret)
		return ret;

If this fails (e.g., returning -EPROBE_DEFER because GPIOs are not yet
available), the function returns immediately. At this point, the newly pars=
ed
port has not been added to pcie->ports, so the caller's error handler fails
to find it and doesn't call phy_exit(port->phy). Will this leak the initial=
ized
PHY state (such as regulator enable counts or unbalanced clock states) on e=
very
probe deferral attempt?

A similar issue appears to be present in qcom_pcie_parse_legacy_binding():

	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
	if (!port)
		return -ENOMEM;

Does returning -ENOMEM here leak the PHY state without reverting the earlier
phy_init(phy) call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D25
