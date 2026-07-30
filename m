Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC43B3896;
	Thu, 30 Jul 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399273; cv=none; b=TdrxhE6vNWrb9hl4YEq54sQ4gpc8NPddXLWWSSnzP/Z9R1If9OyepO5vWWMY3iLhV6/jj62S+VefLmo4uT2HcPVf0c+CZNa1v4+iF1157xIMJqrNj18gvTi8LYXsdPpfzImT8hx94x90EP+Umy/IRu/spEKhfxWDBr4YVACES1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399273; c=relaxed/simple;
	bh=eUU1KIlhVLzY4qUH65coETABuKTCmhaR8IfX8AIfArM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJxwqFAqsQrA75/kA6WGDLXx3Q4TxVpvHvKBZRcjn320zxR67YFZo+lRqJTT+8JqOXtuIoNnLUYMmoZPnxO+vyYi27o2wl8pbkP0UvQPIyIpS8AmbjRqiFTmClnswORk6TYAsZFYUpKRq7289wcKI0RYA3dey8Sbjpsyz7Nu7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDjRuhBN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDjRuhBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5E01F000E9;
	Thu, 30 Jul 2026 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399272;
	bh=SwkH9XaoCa13wc4+S4EGR+0lca2+/4IaQb96VBK1TQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DDjRuhBNK1vDBHwwDcwRemcaBGxrBHsfylBpk9kDXZvEtRahMvanJmpvZWgBVv84J
	 yVfbP/gRptzDKqH0dnM6NfYddKHZ3TXzoFyODtDtZCWC9qVaZ+zGFhQ3vGu2h50neb
	 t+z8+tyj6g5l8Q5i05KsGbclo4uzY+ABO16Cz6CMKSBQ+hrJ8jdok1M1VHUMGznZGp
	 o5lj16rc1kbbZkokh5l7VBZj7/LoVWSxAixYzCvFG2O+FyUAMyIWtMour4YAEVWmaR
	 Y+h1M76EZ6ZF77Ylmp1rVjtRgVA3hTJvcIJMcGzQonKC7l1GaFNEbVmxwut8OiRiYR
	 6PXg2kUAH9J3A==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: linux-phy@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 phy-next 0/9] RCW override for 10G Lynx dynamic protocol reconfiguration
Date: Thu, 30 Jul 2026 10:14:07 +0200
Message-ID: <178539922189.574381.6258263697994334139.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721231603.67865-1-vladimir.oltean@nxp.com>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=chleroy@kernel.org; h=from:subject:message-id; bh=Qt+vOFxP9nNU5Yu1070glj6/XYtWpjM8nIz+zpYRJJ4=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRls18UjW8ryxGu0F176CvH16WSOYzJUtvUowOq1hyLy DNI9FPsKGVhEONikBVTZDn+n3vXjK4vqflTd+nDzGFlAhnCwMUpABNRuM7IMNVulcS7qB/uh298 +bfu/OcU5kNBX1YsuCRyJqH3exHfljUMfyXsXdvfG+bZPippu3/8aK3YA5fapKtLlVtkr3TsyPc UYQYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 02:15:54 +0300, Vladimir Oltean wrote:
> Previous set "New Generic PHY driver for Lynx 10G SerDes":
> https://lore.kernel.org/linux-phy/20260610151952.2141019-1-vladimir.oltean@nxp.com/
> introduced the 10G Lynx SerDes driver with a reduced functionality set.
> Namely, only minor protocol changes are supported (1GbE <-> 2.5GbE).
> The major protocol changes need a procedure named RCW override,
> explained in more detail in commits 6/8 and 7/8.
> 
> [...]

Applied, thanks!

[1/9] soc: fsl: guts: perform fsl_guts_init() error teardown in reverse order of setup
      commit: c200e79a5e3a9af0ed368f2f60ecbe37c3077d48
[2/9] soc: fsl: guts: use a macro to encode the DCFG CCSR space
      commit: 77a46f8fa169b1c01940c4c12851dd4a07f8de4a
[3/9] soc: fsl: guts: add a global structure to hold state
      commit: 2c498f7254acf7ec0c0c589c0e42024ffdd6e81b
[4/9] soc: fsl: guts: add a central fsl_guts_read() function
      commit: 51749b225c21889e4c59c5850ec14c392b8d17b0
[5/9] soc: fsl: guts: make it easier to determine on which SoC we are running
      commit: 9ee864e5c28b30b97db03b9e94c1624484a46e30
[6/9] soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
      commit: 989c49a752850789eec8a79a68613210b11bc765
[7/9] dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
      commit: 086923eb1fef29995ffdf75cb7574dc947caf5e8
[8/9] soc: fsl: guts: implement the RCW override procedure
      commit: f1ab3e661b457937cc1cb975e9f2090f6b6de6d7
[9/9] phy: lynx-10g: use RCW override procedure for dynamic protocol change
      commit: 2e233235fd463c65188626b9cc5e272c5ee96c07

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
