Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2173AD507
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022154; cv=none; b=RSsTwwnt4H8Md87cag4GezMFngT2NbuyjH9eK6zv9B3R47pX64VNW02+kDpE8QGslv+SXo211gllzsx6PKiarOlMzksiMRp6uInQN2FxPeRP3fvp1B8+qSLpG28MpZpkLViezPz713CByXcHxh64fetTJ/oIDBzePuWXoByZVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022154; c=relaxed/simple;
	bh=JLLSw+dQFbhp7jTC62wuqbM2gl5kJuEYKJTrqvkW40A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rkoXCMEQG38zF41Qlrbe+zojnf0ql/nBuxU6Xbu8ZdaKpUDUG2CzxLUJuMTB/Da9LgZN5ynQtCqnPSXM1CcyExF9A83RtOe2hCmoyX5gsbKIhTJP48UhFezh7zqWUkbeCCN68aciDKqoIrAfyjOPYNFxyZ+MCXJ6AR5FGiX56fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onkcmimi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onkcmimi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A9F1F000E9;
	Tue, 18 Aug 2026 03:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787022152;
	bh=PEsX2H8mka9T9RdIMMdZ5vWNsIZtX9PUQt6fHgBFbb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=onkcmimi+l4Iu/Lua1t8zMhumQWbGh46QWr6XHWoCs5bYjl5hdfrsT4GxulKJo3kQ
	 p+RsSPmlbcwZ3jH99Rc3vtBGhy5jCqckYOi2XqCdVxZyEM3ZC/Z0RUdqylgErnyW/p
	 She2brImqkfyGOr0WV6D4uhQ35qtnKlN3Bjg9yTInNWjaEBdEppbwol1svA69D8rFQ
	 jOSDNhQ3Uc2iWiMjUAqkUSXzxlKAQxWp7oyEDNJmfcoDSQIP9IaTPLIavZGBOwbyhH
	 feUFXpOBKmbckFl1cYFvlpYysAQ6Qzt53tLzVM107DMiYi42XNAMvCohY0yVO+3NhG
	 Jg+/e+3IN9Ghw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN
 Config2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260817030213.6769-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260817030213.6769-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260817030213.6769-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:02:31 +0000
Message-Id: <20260818030231.C8A9F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect Driver Binding and Missing Initialization due to omitted=
 fallback string
- [High] Incorrect `phy-mode` setting causes RGMII double-delay and link fa=
ilure
- [Low] Missing DT Binding Documentation for 'altr,socfpga-stmmac-agilex5-t=
sn'
--

--- Patch [2]: [PATCH v5 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN C=
onfig2 board ---
commit 2098e6284de4334f7035c13bb19d6fcdee253f03
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board

This commit adds a device tree for the Intel SoCFPGA Agilex5 SoCDK TSN
Config2 board variant. It enables gmac1 as a TSN port utilizing a
GMII-to-RGMII FPGA soft IP converter. The port is configured with a custom
compatible string to reflect the converter integration.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts=
 b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
> new file mode 100644
> index 0000000000000..9d39f843b4240
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
[ ... ]
> +&gmac1 {
> +	status =3D "okay";
> +	compatible =3D "altr,socfpga-stmmac-agilex5-tsn",
> +		     "snps,dwxgmac-2.10";

[Severity: Low]
Is this new compatible string "altr,socfpga-stmmac-agilex5-tsn" documented
in any device tree binding schema? It appears this will cause validation
failures when running make dtbs_check.

[Severity: High]
Does dropping the fallback strings "altr,socfpga-stmmac-agilex5" and
"snps,dwxgmac" break driver binding and initialization?

Since dwmac-socfpga.c has no match for the new string, the node will fall
back to the generic STMMAC driver via "snps,dwxgmac-2.10".

The generic platform code in devm_stmmac_probe_config_dt() checks for
"snps,dwxgmac" to identify an XGMAC. Without it, the core type is left
initialized as DWMAC_CORE_MAC100, which will cause initialization to fail.

Furthermore, bypassing dwmac-socfpga.c prevents platform-specific resets li=
ke
stmmaceth-ocp from being de-asserted.

> +	phy-mode =3D "rgmii-id";

[Severity: High]
Does this phy-mode setting cause a double-delay on the RGMII interface?

The commit message states that the GMII-to-RGMII converter provides the
RGMII TX/RX clock delays. However, setting phy-mode to "rgmii-id"
instructs the PHY device to insert its own internal clock delays.

If the MAC-side converter already adds the delays, should this be set to
"rgmii" instead so the PHY knows delays are already provided?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817030213.6769=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
