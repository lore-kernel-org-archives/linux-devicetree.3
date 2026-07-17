Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10128640B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784254845; cv=none; b=YS+3hxvF+w7mRbMX+Oviu0iLqoFyp2wV+GRykZwRkb/wk55qstRIVoH5+nWXkMztWsVBUJVNPoK5QJVtuyr7jBDc4ob2U+D+R/jSs+v+zNV7hSK7vD2y8QWrlnJo8dDS7uez8zJc/vInAnBJO2KnuRRVp/B35iJ4/ba1V9H9Z+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784254845; c=relaxed/simple;
	bh=ZW7B3qZd9unUJoVSkBoheUWApsvogIsz3b51NfQgCbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucaiADSBz1i1QGc5CtzRIbBe01rErb7fM+nCVZos9gBDrINOl0/GZz6pVO4/JjlD2Vw66VMZRaJjKY3cbbaAAi/AMj+1pp5KPmWGDafEtflUzHca+rtZt66dTuRnGnpMmG/pJpIKNx76CPfDCsa/Q9Fq+o2S3ywDgt3y74U/5lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9cb98br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9cb98br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2241F00A3A;
	Fri, 17 Jul 2026 02:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784254843;
	bh=EymQ5VzQxCTwFe2JedbidCH3y3PgVPlN2BVf0a0Io20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j9cb98brCqwreuT3Y+dXYdfSU1XRGxMOJ810Kfy4IoCP0VWOsl7GNVcS4bFoexK+m
	 Ip1g/3/HdtxunttchjiuzFslGI+/PhxBRvzd0E4u9eHqoAKmz8nTSSkGtj6t/f7Kpo
	 ICx8lvoCTibtk1SJMSMGnu4slOk821j4xJTQYGPa/rX2BNFECfIkISTo3Gb7CfK18v
	 RlVPWIRTwUqspoZ2E5u9jMhm9wNHpV8eTD8SI/sY0EAknL0Kq2xRW7oSmll29DV8jt
	 pOFBHLH91haKBlB13TpEbSyD3VFyO9IbeEb+AWZGfiim7FK59LWiQLW5cwgzsk3ieJ
	 O59/N09yoLNoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN
 Config2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716021932.20037-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260716021932.20037-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260716021932.20037-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 02:20:43 +0000
Message-Id: <20260717022043.9C2241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing driver implementation for 'altr,socfpga-stmmac-agilex5-t=
sn' results in double RGMII delays and broken networking on gmac1.
--

--- Patch [2]: [PATCH v4 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN C=
onfig2 board ---
commit ff8022a3fa72ba16d067ef0799f67eb51b957387
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board

This commit adds the device tree for the Intel SoCFPGA Agilex5 SoCDK TSN
Config2 board variant, enabling gmac1 as a TSN port. The commit message
states that a board-specific compatible string is used so the driver can
detect the converter and strip the delay bits before configuring the PHY.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts=
 b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

[ ... ]

> +&gmac1 {
> +	status =3D "okay";
> +	compatible =3D "altr,socfpga-stmmac-agilex5-tsn",
> +		     "altr,socfpga-stmmac-agilex5",
> +		     "snps,dwxgmac-2.10";
> +	phy-mode =3D "rgmii-id";

[Severity: Medium]
Is the driver support for "altr,socfpga-stmmac-agilex5-tsn" included in
another patch in this series, or already present in the tree?

If the driver implementation is missing, OF will fall back to
"altr,socfpga-stmmac-agilex5". Since the fallback lacks the board-specific
logic to strip the delay bits from the "rgmii-id" phy-mode before passing it
to the PHY driver, will this cause both the PHY driver and the FPGA soft IP
to independently add clock delays? This double-delaying of the RGMII clocks
could violate RGMII timing specifications and cause broken networking on
the gmac1 interface.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716021932.2003=
7-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
