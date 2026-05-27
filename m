Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB64F351C17
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904896; cv=none; b=KJSHGpov9/BKmeDrVxDVqf7J4k5EsXTR25OPY24lKNz5OQavsNtLWyerq6K7/UWoaTf2e6rnv0HpdNl6rhIUDZKIbzD/vrQieWzopeMqRmlnTavutpK2sBvZM0YktjWuE0KD2fJylYxyUz/ST22xDKw6puNg5Cyzrfjw66AqXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904896; c=relaxed/simple;
	bh=9sAdQbsi78gK9jd+7WVzeDOTHQgstzKR4dSBRX+Uhw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LRIlij/kfZHE6JzfQXyGsWutEKZJCOvbifmVvFEhwdiHVcFeLLYl7Rc2qD89VLp8RsXsebxj/SSmpefBTrzxD2YD8ap8K831Kwe77MgQZtynALhlb9abndGzECItn5Tuzdd56//XtE39RIEfUss6LM6FcfAJ3Da4tc+fShyoSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCroghmF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCroghmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6F61F000E9;
	Wed, 27 May 2026 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779904895;
	bh=DcuiF5bYjHdi705xGINbBzeUEIpz/wuJMOa1ED35xS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCroghmFyQffQGsL05reBe7HJq2rwX0FGs1Da63TXlMcNNWpW9Ytsp05welj1K240
	 YWs53ZJG5yb+uuDhRI9xqlKZqlODpJynMUerHWAz/W5AydkX7w+sgbAqV9hS0F72sl
	 ELOQ81FuPfnd/G/yaIuC63f+z0g46gYE62VPMxTmvclNloHLvBTlE1gZUGcJrdFEaD
	 nxRcp7V7vzhg9s9QkrRet7gdmyAWMrtkBpOkL3yLF5AGHMJ1NpdXoNn6zmqbt1oTZO
	 WuIHwAmqxLdRFF5HYoAmygb9+1WFVTPADIwKWhq3d9RbdlOPNl94z7VmRu/lTBBA+Y
	 +hZEhF1qneWyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/2] arm64: dts: socfpga: agilex5: popuplate reset
 properties for I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527174221.79259-2-dinguyen@kernel.org>
References: <20260527174221.79259-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:01:34 +0000
Message-Id: <20260527180135.2F6F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented 'resets' and 'reset-names' properties added to the I3C=
 nodes without corresponding YAML binding schema update.
--

commit ebac99bb72bcfe3b4b8a0fa7c960df7984ddf40d
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: socfpga: agilex5: popuplate reset properties for I3C

This commit adds resets and reset-names properties to the I3C nodes in the=
=20
Agilex5 device tree to bring the IP out of reset.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e949..55313d45c90ed 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -244,6 +244,8 @@ i3c0: i3c@10da0000 {
>  			reg =3D <0x10da0000 0x1000>;
>  			#address-cells =3D <3>;
>  			#size-cells =3D <0>;
> +			resets =3D <&rst I3C0_RESET>;
> +			reset-names =3D "core_rst";

[Severity: Low]
Will adding these properties without an accompanying binding update cause=20
dtbs_check to fail?=20

It looks like the bindings for these nodes validate against=20
Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml, which=20
enforces unevaluatedProperties: false. However, neither that schema nor=20
the schemas it includes appear to declare the resets or reset-names=20
properties.=20

Should the YAML binding schema be updated to document these capabilities=20
and prevent validation errors?

>  			interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clkmgr AGILEX5_L4_MP_CLK>;
>  			status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527174221.7925=
9-2-dinguyen@kernel.org?part=3D1
