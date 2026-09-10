Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C82378D72
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048052; cv=none; b=REFZ6Oj8if4s3Kra1kxhH1Vcu0ZdyY79UK6ty5dxHzYGqsaMWdjTqMvXAtmRDKpGCE9qcY2peNTR+R5dQUKFiBMWN+cCgitCU5rBHZy/+2bB/y8e6WlVjl6zswjnx/CqiEkEt49pWpNu4HS2iJ7Zmc+fMNHvPRBNDyPyPBPLRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048052; c=relaxed/simple;
	bh=vOeoPbgrp2iAfbKgbTi7d/hYd4cMkaHtOQgyXrVHbA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qDKZggMREKd28sWyokEymboRSGDQ3uRKd3j4fYnMrQfaN5UuMs7iIXaRig2tuZimmgqq+CA0T/SMTXip0Fj0l8bdEizk+fGY1lmR73b4jQTobOtqIuPcvGPf+wAsfEjMyWZhBhUNCF7CcEW4QpiGqSL5jiG+FLH4T4h5L0U8+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXX+Zlkf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXX+Zlkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C9A1F000FF;
	Thu, 10 Sep 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048051;
	bh=79EkR2ki9padIXI7SX9XoQ5rBxXDEY+vQwpE/YivCR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXX+ZlkfH/0Rx21f/UNytcX3g5j1Eo6IgiFX9ejGFrfgHxM2LL8MF6X0uhfUbHe7+
	 d0Hiv4pe6RMtHMdWGr5dSx98guBlyavD6FsjdUMNF8ri9iMahqYRM38xs6akrbZtVV
	 YVbbCXZK2aq1mabcs5Q8nE0qunF2PXaLKOqU1y/QcU8sFBkvKmGWdZAGl+XYiT6D5s
	 /J+wurt5m5+YiMLIh04cniCPQRy9xntgODHUP0Hj3e1nwczxHbhJRV6UoddNWIzj+n
	 /jjR5exRJ5EZ8n/WjvLOiMBUZt0laG18ubVSHOoCl2qxqAlL0SfaZxHwMSGNNv4RRR
	 msgkSlFb/zDUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/34] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:47:30 +0000
Message-Id: <20260910134730.C9C9A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that `phy-names` is moved =
to the root port node, but it is actually dropped.
--

commit 43e475189be13ef7a3db0e296715dd66a66766c9
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node

This commit moves the PCIe phy reference and perst GPIO property from the
RC controller node to the root port node, renaming the GPIO to reset-gpios.
It adds a label to the root port node to allow board-level overrides.

> Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides.

[Severity: Medium]
The commit message states that phy-names is moved to pcie0_port0, but
looking at the diff, it appears to be removed entirely rather than moved.
Is this omission intentional since the driver might look up the PHY without
a connection ID, and could the commit message be updated to reflect that it
is dropped?

> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/q=
com/qcs404.dtsi
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -1517,16 +1517,15 @@ pcie: pcie@10000000 {
[ ... ]
> -			phys =3D <&pcie_phy>;
> -			phy-names =3D "pciephy";
> -
>  			status =3D "disabled";
> =20
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;
> =20
> +				phys =3D <&pcie_phy>;
> +

[Severity: Medium]
As noted above, we add phys here in pcie0_port0 but omit phy-names which
was present in the parent node. Does this child node also need the phy-names
property to match the commit message, or is dropping it the intended behavi=
or?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D22
