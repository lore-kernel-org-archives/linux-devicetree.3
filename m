Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328B43B6C9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389044; cv=none; b=UbwDRhNUUfv3Cx9NcU+sdAVt8gO7xSoM9z1swiQPFVDX7jUo89ixRPEjxO5mzqsyx7OAqwvvcuUyWJVjfjtdou+lPU7TydLRodFahWW1skctaMdoQAb24rLMkMgLZSIYEtfgRBJAAPnG4O1vATh4Dyiq4aBoxrkPi9rEeB6S9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389044; c=relaxed/simple;
	bh=pXb/GWNBhCMdL7y1Eh9j0os/mOf7zHMgfy7Mf6hwVLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rNzOwNJiQq0cctHoPzQ14kUDsF5Ck+hef9rx8QB9IRgqkAKvXxfWY0m6Iw+Mvy0sLQWIyCXw/S486j4yFGOHMVj6bfCpboSo9cFRkhQdXa6ueBVS3FoH/u5O9nIKI1SqNHfmYl2GIjNXShA6vWrVh7aGs0paTmPcvH2IOyaQkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBClld5R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBClld5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535A31F000E9;
	Mon, 10 Aug 2026 19:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786389040;
	bh=sZanrv+bSbAn8xlMBWJGJnwOsBOLoIL4rUffEdpB5Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBClld5RUj4ib2qG1CLinY9ehgqpsAXUnkTM4qzevlHu2qtB6RsdTRinYoRnM63ah
	 jsGUubw3nU/Ftzcn1qZGc77m+/vwu5pu2790s2rAqaaC5wE+ddPatfy/ucuPaL2fvS
	 A9T5Wo/IobuNW98SRdb+8Rf4JkYi4Eppgl2YVXaZ9YFizNmp2S4Eadmlszqi3THFQ2
	 AMLmBefbfttUsuozs/HgGkD/DlExUn4nsWaMeFK4v4R/p5+v+HF+1HsZ8QutXQuR5w
	 eKM0CdQjZG2bTUf54YIIIgXV2rA/+u8WIcZdhv+A7D8SE0X7ol4sMqwCnAGk29IhVh
	 dxul8GjCxvFew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] dt-bindings: arm: altera: add Agilex5 SOCDK eMMC
 board variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810190025.25045-4-tanmay.kathpalia@altera.com>
References: <20260810190025.25045-1-tanmay.kathpalia@altera.com>
 <20260810190025.25045-4-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 19:10:39 +0000
Message-Id: <20260810191040.535A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree compilation will fail due to the undefined macro `COMBO=
PHY_RESET` in the `emmc` node.
--

--- Patch [3]: [PATCH v4 3/8] dt-bindings: arm: altera: add Agilex5 SOCDK e=
MMC board variant ---
commit a686e27903fc966d624926fbeae5d10fa6638ad7
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

dt-bindings: arm: altera: add Agilex5 SOCDK eMMC board variant

Document the Agilex5 SoCDK with the eMMC daughter card, which uses the
shared HPS SD/eMMC host for onboard eMMC instead of an SD slot.

> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Document=
ation/devicetree/bindings/arm/altera.yaml
> index 0b418d9d60dbd..ce3a8c1679e57 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -112,6 +112,7 @@ properties:
>                - intel,socfpga-agilex5-socdk
>                - intel,socfpga-agilex5-socdk-013b
>                - intel,socfpga-agilex5-socdk-debug
> +              - intel,socfpga-agilex5-socdk-emmc
[Severity: Low]
Does this new variant introduce a regression when compiling the emmc node in
socfpga_agilex5.dtsi?

It appears that Device Tree compilation will fail due to the undefined macro
COMBOPHY_RESET in the emmc node.

In arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:

		emmc: mmc@10808000 {
			compatible =3D "altr,agilex5-sd6hc", "cdns,sd6hc";
			...
			resets =3D <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
				 <&rst SDMMC_OCP_RESET>;

The resets property uses the COMBOPHY_RESET macro which is not defined in
dt-bindings/reset/altr,rst-mgr-s10.h or anywhere else in the tree. Because
the C preprocessor leaves undefined macros unexpanded, executing the dtbs m=
ake
target will result in a syntax error when the compiler expects integer cell
references.

Should this macro be added to the reset bindings, or is a different reset
intended here?

>                - intel,socfpga-agilex5-socdk-modular
>                - intel,socfpga-agilex5-socdk-nand
>            - const: intel,socfpga-agilex5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810190025.2504=
5-1-tanmay.kathpalia@altera.com?part=3D3
