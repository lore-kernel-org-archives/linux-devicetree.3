Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38BE3DB65A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299924; cv=none; b=NFxIelTkLIbsuuHHxgE2kjC9YV67fJnE8HIviiTf13jL5rlo61TbMd4IYiMwpk5U0Lrod91JKdtw1bVbCzri6IxmeUF4z2q3dHbIKKED8vNlYGUkt43SijqNz+7/RXwKAvlXbLmtV/hMwbtiz2Umx3pGCSjk1AzuyxIPnXamkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299924; c=relaxed/simple;
	bh=ysf2qz+g/EPCx+CPAT8LcVMXdG9Dd9/oo6hCat5P73E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZyO1ugGlMnhXHuCqd2h6+HXZBHgLmpcfSCL47JBdKtFFJF7Q7KLZf4gjnrymzmNjtc7mxjqf2nHHyqTIcr7uFFsh/lVvmBFpwj/HBLbXoFOGOk+4Yv7ph2H06sc7HQJolL0W6w3CH3onU6YneflErIoWcjfJ878KLv7WMu/0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8mIYdSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8mIYdSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA911F00A3D;
	Fri, 17 Jul 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299918;
	bh=R2gCiliXSMnAMfaCcQ7/PZ1PpnYd8q9DDwEMc7rW32Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8mIYdSf09CPG4h3zjYlBxbmCsHDpDjt3Fj/gzRhE+pjx2/oGtN5s+o0g7FrWQl2G
	 au6AJFQiTvMCE2zSQ6Qf2ffJ5NfOPPadwk71cVsc+owDsRz2k6+iN/FBlu3ue+nOZi
	 j5KtLir7/fhC/ojfalhWKn8NddO+qaBLJcztzxBY/A7A4KpT14tpx6QkPyvjJZFzxx
	 7qIYnivVWKxg1zPfnMNLitdB1VFRnsf7+UgTw/Re57JiOHrTxqHbsVrA/nYk69MLep
	 efnh9x7VCMlD4S5nHtYX8FopazCD27dNrjtdO3LTcL+LsxrtMtw9WkXdFicHFSmWPT
	 OTW4CxQ5SqZ4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhengyu He" <hezhy472013@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
 <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 14:51:57 +0000
Message-Id: <20260717145157.ECA911F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message claims to describe a SPI NOR flash chip on ch=
ip select 0, but the corresponding device tree node is absent.
- [Medium] The pinctrl configuration sets the SPI pad voltage to 1.8V, whic=
h conflicts with the 3.3V Winbond W25Q64JV SPI NOR flash mentioned in the c=
ommit message.
--

--- Patch [4]: [PATCH 4/4] riscv: dts: spacemit: enable SPI0 on K3 CoM260-I=
FX ---
commit 195bf5fbf14f1dbf36d3f0697603287770b0c9db
Author: Zhengyu He <hezhy472013@gmail.com>

riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX

This commit enables the PDMA controller and SPI0 on the K3 CoM260-IFX board.
It also adds the pinctrl states for the SPI0 pins exposed on the board's 40=
-pin
header.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/=
boot/dts/spacemit/k3-com260-ifx.dts
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
[ ... ]
> +&spi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ssp0_2_cfg>;
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message states this patch will "describe the SPI NOR on chip sel=
ect
0 for the current validation setup", but is the child node for the flash ch=
ip
missing here?

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
[ ... ]
> +	/omit-if-no-ref/
> +	ssp0_2_cfg: ssp0-2-cfg {
> +		ssp0-0-pins {
> +			pinmux =3D <K3_PADCONF(104, 1)>,  /* ssp0 tx */
> +				 <K3_PADCONF(105, 1)>,  /* ssp0 rx */
> +				 <K3_PADCONF(106, 1)>;  /* ssp0 clk */
> +
> +			bias-disable;
> +			drive-strength =3D <25>;
> +			power-source =3D <1800>;

[Severity: Medium]
Does this 1.8V power source configuration match the validation setup descri=
bed
in the commit message?

The commit message mentions testing with a Winbond W25Q64JV, which is a 3.3V
component (the 1.8V equivalent is the W25Q64JW). If the SoC IO is driving
1.8V signals without a level shifter, it might fail to meet the 3.3V chip's
input high voltage thresholds. Could this be a typo in the commit message, =
or
is the power-source value incorrect for this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-k3-com260-=
spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com?part=3D4
