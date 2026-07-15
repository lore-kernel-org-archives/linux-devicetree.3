Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6A32B13A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081608; cv=none; b=hSwjWn/O7yWmsvhEYTy0FG3VK4xWsPG4PE6TQUux09V7Ca3BqkZWrb9WXmmTLQIJ+cUgPzn6BjNTw8vX1LtNlJ3FkfiUcQUXPuEFErgWqCrQ2JkYw6WNTm7GXDWJnXTe97Ys/HNXM1AdQpwFl3/h3QLA8JEvzsY8LHd5k0sw1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081608; c=relaxed/simple;
	bh=w3B+OWe0+mvMNsZ+R4qLCmtuwRau+cgShPJGUNdL5xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twuJwivPZZ0r0LvDYDmUX7KzM9XNFdfYCMOW1tTBkq6fActon6DJr0qABLQX3zuluD41karzEp1vjc7hK9OZcNfCe3vkP8nT8yrRavNaHxzH9pqadn2C/+6d2FXlpEsA/vFV8pRo95SXFw6M3VnLfIE1/m1+lq4crJBFbwuFllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2K79cc7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2K79cc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262A51F000E9;
	Wed, 15 Jul 2026 02:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784081607;
	bh=vxoEh3ZG21aSUibRQTcT6w3uoTYkuKnOt1p6Q8c5mFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k2K79cc7M6yo4HRaHyabw2GOt3A3ebUImA8Wv3w5hKzJekwIbjUGL5YRZyHrnOSnv
	 1owNwvj54QSrJexjpeih1pVhrCUALmrDDqcRoSOP3urruxyOX0Oiipq8/YbpO4rBEQ
	 tlVQ1fLBahkUbNJKQa+dudzNiejIx2I4t/Pxv9HsX7p+XHbvMLVzqLakoE6KtTB23e
	 ksUpMdzhs+8bF34fSo8GxMn4KDz6EL0UKZPHDKiABN/+vBWV4R778AZqtU4zRil/3H
	 EQ3ea4l1pZqpnndpfgJXwJmFWC9hwvWtHfemlyIGJp8Bljw77nRzjVZIvvAC2aDYHC
	 Oa8ifwMcvQzNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN
 Config2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714021303.30042-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260714021303.30042-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260714021303.30042-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 02:13:26 +0000
Message-Id: <20260715021327.262A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double RGMII delay insertion on gmac2 due to incorrect phy-mode.
- [High] Conceptual misuse of 'rgmii-id' for MAC-side delays on gmac1 and m=
issing driver implementation causing double-delays.
--

--- Patch [2]: [PATCH v3 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN C=
onfig2 board ---
commit 1726dd01c79b5342df101114181fa6297c1dabde
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board

This commit adds the device tree for the Intel SoCFPGA Agilex5 SoCDK TSN
Config2 board variant. This configuration enables gmac1 as a TSN port
alongside the standard gmac2 Ethernet port.

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

[Severity: High]
The commit message states that phy-mode is set to "rgmii-id" to reflect
MAC-side delays, relying on the "altr,socfpga-stmmac-agilex5-tsn" compatible
string for the driver to detect the converter and strip the delay bits.

Since the driver implementation for this board-specific compatible string d=
oes
not appear to be included in this patch series, won't the driver fall back =
to
"altr,socfpga-stmmac-agilex5" and fail to strip the delay bits?

Additionally, if the MAC side (FPGA soft IP) already provides the delays,
should the phy-mode simply be set to "rgmii" to intrinsically prevent the P=
HY
from adding its own delays, instead of relying on a driver workaround?

> +	phy-handle =3D <&emac1_phy0>;
> +	max-frame-size =3D <9000>;

[ ... ]

> +&gmac2 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";

[Severity: High]
The commit message notes this board retains the standard gmac2 Ethernet por=
t.
In the baseline Agilex5 SoCDK, the HPS MAC intrinsically provides TX/RX clo=
ck
delays for gmac2, so phy-mode is typically set to "rgmii".

Does setting phy-mode to "rgmii-id" here cause the PHY to inject a second,
erroneous set of delays on top of the native MAC hardware delays, potential=
ly
breaking RGMII link timing for the standard Ethernet port?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714021303.3004=
2-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
