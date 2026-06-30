Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFDA3FB040
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819151; cv=none; b=HYj3SaCxT12xKjbTtnJtSKQjtGsYi0gsEBz6DgPiV2dnUfzQlU5z0564GeXgrdFE1rT4dNvwyDsFlQjM1XNTQCSPAX6oK0XNqLukQ1uhTj+8h/rZWy0Wy4HUx3h+8+cG7YvtpQnZkCSwJNXZyJY2GK4ScQruD9XEQ4nBicqx40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819151; c=relaxed/simple;
	bh=PFjLBYGkhNLmf7yKqEV/d9LXyDW8kbgmbWXhC3CUKrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pSpaOhBxc+DkS2P25I9qCH5syGV1+xBiRABuRt33EKJieupElrqas4lshZMPi3lCppZz6lvHIvd4W15QoVB4eIkvRB9cJVB4CKo9TOHgnG1xbOjPh5YYbXeakkAjR6lCeRIVcsnTNsOWXDRVeiXJ3VewgyT3+XL9+/VBK/xrLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWPGLBQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWPGLBQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DAD1F000E9;
	Tue, 30 Jun 2026 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819149;
	bh=USbLOktLDZBd6tKDaj5e6zqiRubR8iIvM4jJ7UKLBRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWPGLBQfTbn6Ix5J2jjdNtd1exEBV6aRbmGJbco+Bd7m3aWolDFbvlDo28FWNVNY1
	 xPi54wc5kZojaYBcyz8dyT+EpMXJMPazTNAPQJYqRRDfpkmsUBI6Rt52Qkx4oDYapb
	 0dRzM+myWNm8vYrpXZmHO4lftkyp83ZboVlr292KYUS/abQv6IY6pAWW2lSMo3ZkmH
	 zIZhv7/qEJQHAIf/md3UVW4m2EA9H3TGSkgablyJFrQxNI2e2TCAdW6xmLodIori+g
	 HfSyD4Szm6BJpL1/QC42rNmxWOKsFhUVXUdgxraxUi5QwPuvEtEFD5bBhj/qudZNIT
	 ShuKRGk4O+F4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630110459.516364-3-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
 <20260630110459.516364-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:32:28 +0000
Message-Id: <20260630113229.66DAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `reg` property for the `serdes` node incorrectly sets the regio=
n size to `0xffff` instead of `0x10000`, causing an off-by-one error in the=
 resource length.
--

commit a39aeb25ec050b4deb66ed84479cc1400f6ce47b
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

arm64: dts: ls1028a: describe the Lynx 10G SerDes

This commit describes the Lynx 10G SerDes block and its 4 SerDes lanes found
on the LS1028A SoC. The node is left disabled at the SoC level so board
device trees can enable it once consumer nodes use it.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1028a.dtsi
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
[ ... ]
> @@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
>  			};
>  		};
> =20
> +		serdes: phy@1ea0000 {
> +			compatible =3D "fsl,ls1028a-serdes";
> +			reg =3D <0x00 0x1ea0000 0x0 0xffff>;

[Severity: Low]
Does this reg property specify a length that is off by one byte?

The reg property size field represents the length of the region in bytes. If
this is a standard 64KB hardware block, should the size be 0x10000 instead
of 0xffff?

Setting the length to 0xffff tracks a memory region that is 1 byte smaller
than the actual block. While ioremap aligns to the page boundary and avoids
runtime side effects, this tracks an incorrect resource length and leaves t=
he
very last byte unmapped by the resource manager.

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#phy-cells =3D <1>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630110459.5163=
64-1-ioana.ciornei@nxp.com?part=3D2
