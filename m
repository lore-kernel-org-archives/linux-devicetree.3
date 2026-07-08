Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00A1C84BC
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491203; cv=none; b=HDbSJmHfsCd9ErmJ/f/igIhvhSkVAbXd999G4Ph/AOWlHl4vzjazL9IlgvGw1w7DEZCnpD5PNkfuxG/crA7mBKcMBHFcncBSrbhMEYCEpG9vrEUsLgzWL7WgfKfELEFN7x68WgpKeSQEOO//YxxvlEyqGyfV9Q+5dMzRUhTTgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491203; c=relaxed/simple;
	bh=DqXggqIsFcL2xTfD232mNe8gYC1zmHjTSK3K16gFZF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S8ZS2yyvcbbLrwM+BojI5OGSmsm9CB1HXrdKhEg4fxw7AScLeOjsP4cqBsUmKiOVuJ5mdATSoEpRe0/JCNYynH+Rx2h01eJxMv6Nqc30XgTRH9ZMJVXqjeyPzusgVWbDcF1fy11MFA9th8qPrum7BtvByvcw17Uwey2murWSXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/c6glZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/c6glZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46431F000E9;
	Wed,  8 Jul 2026 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783491202;
	bh=T5WdKuVbytvydemDz45MPnJNAxm0IK5NaTh9cTqiQdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/c6glZyVZq7IwVh7B+nacTC0mPvY5/Kd4VxiOKlbUTAxfZWtq14zSdBrrGC+puqQ
	 KLVN4QDshjfZhi2D75a8h3Ptt1oB2b7JFNyOT+s/OiHxmyiSY6qY9BX2VPGhTHP0c6
	 z5kC3Pmg65saCoO/2J+vXg84oKdz3ywp8TQUCaip215oRv4HJ4uxtza6mgs5faxOkg
	 xcXUXuHy0Fo5CgdVKRLJwPrLqPWhkWo55a1F95pTlPPl40JAuf2cOp7hCjtr5r67rb
	 ZZNJm0K5XVQBrH9wBlUTwNIxArB/kWt/TGPkgSF+YEQ7IBFKH+Dx/cbPBpNcw3gu4p
	 muSMh04LBYnqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN
 Config2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707061305.27580-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260707061305.27580-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260707061305.27580-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 06:13:21 +0000
Message-Id: <20260708061321.B46431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Broken RGMII timings due to missing driver support for stripping P=
HY delays.
- [Low] Undocumented MAC-level compatible string.
--

--- Patch [2]: [PATCH v2 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN C=
onfig2 board ---
commit 9b347403f48cf7cfca1e37c7a4bbf38717136eeb
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board

This commit adds the device tree for the Intel SoCFPGA Agilex5 SoCDK TSN
Config2 board variant. It enables gmac1 as a TSN port utilizing a
GMII-to-RGMII converter implemented in the FPGA fabric.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts=
 b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
> new file mode 100644
> index 0000000000000..bf13ccfc1faa5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

[ ... ]

> +&gmac1 {
> +	status =3D "okay";
> +	compatible =3D "altr,socfpga-stmmac-agilex5-tsn",

[Severity: Low]
Is this new MAC-level compatible string documented in the devicetree bindin=
gs?
It appears missing from Documentation/devicetree/bindings/net/altr,socfpga-=
stmmac.yaml,
which would cause dtbs_check validation to fail with warnings.

> +		     "altr,socfpga-stmmac-agilex5",
> +		     "snps,dwxgmac-2.10";
> +	phy-mode =3D "rgmii-id";

[Severity: High]
The commit message states that the new compatible string is used so the dri=
ver
can detect the converter and strip the delay bits before configuring the PH=
Y.

Does the dwmac-socfpga driver currently support the
altr,socfpga-stmmac-agilex5-tsn string and the associated delay-stripping
logic?

If this support isn't present in the driver yet, the driver will fall back =
to
altr,socfpga-stmmac-agilex5 and pass rgmii-id unmodified. Will this cause t=
he
PHY driver to add internal delays on top of the delays already provided by =
the
FPGA soft IP, resulting in broken RGMII timings?

> +	phy-handle =3D <&emac1_phy0>;
> +	max-frame-size =3D <9000>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707061305.2758=
0-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
