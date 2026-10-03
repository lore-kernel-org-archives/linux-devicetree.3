Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993470836
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017479; cv=none; b=d7DIBdHPBS2P+gLn/p3JaJnQmLm1bHqGJBGlBxCM3Cs0zVyYqrH7FYlVAtZqCweWEhxC6lrEN9CyTWiPI9PsbYxoYbvP0EfSku2SRS7irPn/fZQD2pH3OgzdHnKlgt/hPmc0Jd5Hjmfpg1/ekFQY7MjqWD8rfqq3AoIBVyShpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017479; c=relaxed/simple;
	bh=fo7p95PXDsQQoDHeO890huLTMOg+dpCw+VTbRoNBxU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LiIiI7OCOdCYx+AXOuasWOoR9J0xBNGwMM8fdy9w1UG9hwSBXyraZIXFC4PEtSkCM5CeSX+MREjCedwwV6/53ZBpD7TGrNEB1uFA19AXSEyEKhp53SCa10K27ejreRyLWa9opf+rdiQ25cVrQ2LxBrUPUb5sTUIifbYI+ddzK8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2Q3uhqp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2Q3uhqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0351F0089B;
	Sat,  3 Oct 2026 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791017478;
	bh=i/U3D6bs4D6IVr9Q7RQmo9FpEf8ne8t2dBpocKJRFGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2Q3uhqp5/rPaZBteo0P/mFZ+b0iRiHbqBjWrbexh8cS4VW9yaU+M4buGZ32EKyAl
	 KdDxmyGNNB1w19/u3qyEttjLPLGnHqJlUq9Y9XEYOJnzD+ikZ5uld5Mcp94FSqMO7F
	 JB62sXwaYZpl4qcUfK+ynXIbQzgNStRaj+ZOPhuphwdTmYxL/cpX9GDqVWbfIqsZrg
	 e3JpHGFCsydUO05p1liDXQ6LtYDBM7mATlf17NH5st9jhZzNRuLVvPYJTUz1n39aDI
	 ZY1TMuNunLIMZpSriVOHUhFd0r63Z69zSGt0WCI2IrQJ11rxyph00NiAuOpj5Y4LL3
	 LRPvu5gusTcxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy
 node name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261003084627.353899-3-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 08:51:17 +0000
Message-Id: <20261003085118.1D0351F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: mismatch between commit message and actual node rename
--

commit ff7773f0965119de993db57ef5ec58df5146e727
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: cv180x: Fix internal ephy node name

This commit updates the internal EPHY node name in cv180x.dtsi to match its
reg property. It aims to rename the node to follow the common ethernet PHY
naming convention.

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index ec3bf305274ae..cf672cc6b9351 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells =3D <0>;
>  				reg =3D <0>;
> =20
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {

[Severity: Medium]
Does this node rename mismatch the commit message and skip generic Ethernet
PHY schema validation?

The commit message states "Rename the node to ethernet-phy@1", but the code
only changes the unit address from "phy@0" to "phy@1", omitting the
"ethernet-" prefix. This mismatch causes the node to silently skip the
standard validation in ethernet-phy.yaml, which expects the node name to
match the pattern ^ethernet-phy(@[a-f0-9]+)?$.

>  					compatible =3D "ethernet-phy-ieee802.3-c22";
>  					reg =3D <1>;
>  				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003084627.3538=
99-1-chenyou910331@gmail.com?part=3D2
