Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417437DE83
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897799; cv=none; b=Bd13XKTYsOjyKdcFqVlcDmdlwm8igxgj/AzP1dW0hbpbO984OQjTtiDp9qK4sr7st109WMrrLfjWXSarXnsZ6oLNtCWvyaN86GU8X97gFXD0bgiv3xRUA7nHYCl7yVyf9QQqRG4PDcICZV+3Q2+VeBWN2VFLq+eqfGLoAbFJPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897799; c=relaxed/simple;
	bh=U8a/4AjcgUUEbnLVXvOrDSZheBCAWWxCfaXjMpnSpLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YAgQ/jVYsLI5qqoI50KpJVTSA0PB7qNp0/xVst16hkbZpC57lQgc6IWviu7sHZqR5vNrhMsZ4+30aOShATxcGmaLHwtpnO6xHflJV1wpFQbGSFCsC7XE/FfzYRKk1Uf6IC3F4t7Ut95WW9pUKx194RWomAWRsIIzZCeDL6eb1OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3b8UrCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3b8UrCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1075E1F000E9;
	Wed, 27 May 2026 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779897798;
	bh=Hc/E+mFaCWmSZ6TNBGt3lnXd5BiqwA16BeqXQpBZSwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3b8UrCTFw73N5v9MNS5fNO14oVBEx5ATu/cymk66iw3Rd9lJL4L1IHBEJGhfHA3v
	 o6WoneKLbHsMngGuMOAkFaJuCeOc1gNNL69vfVaK8UJ8+0zUyN29N0jKWQW77i3pLJ
	 s1PJgSV6yiXdc/c4+rYXuIXRB5nX+1DNxfTqt9FgzsWEG/Vls6czOPHUPeB3nOvywE
	 FHwSvXIaDX6OvjOwOhIAV4yUR92s9IIKrjnb1unuEjjmx5yYO7OGT2bOjmtZlXU/ee
	 eGew8uTgUbO8X3w01F8ppnZR4/VUdEh+3jvjFBnJxMaP6d50SBUyuOE5TnocUop6yQ
	 g4RggvdMq+vtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: socfpga: agilex5: popuplate reset property
 for I3C and NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527151239.55650-1-dinguyen@kernel.org>
References: <20260527151239.55650-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 16:03:17 +0000
Message-Id: <20260527160318.1075E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `reset-names` property causes the `dw-i3c-master` driver t=
o silently fail to deassert the I3C resets.
- [Medium] The Cadence NAND driver lacks reset subsystem integration, rende=
ring the new `resets` property ineffective.
- [Medium] Adding the `resets` property violates the `snps,dw-i3c-master` a=
nd `cdns,hp-nfc` DT bindings, causing `dtbs_check` validation errors.
--

commit 8dcedebea5fbdeab502fe0008a7be9fe724b28a3
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: socfpga: agilex5: popuplate reset property for I3C and NAND

This commit adds the resets property to the I3C and NAND nodes for Agilex5.
The goal is to provide the necessary properties to bring the IP blocks out
of reset.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e949..7fc75b439925c 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -244,6 +244,7 @@ i3c0: i3c@10da0000 {
>  			reg =3D <0x10da0000 0x1000>;
>  			#address-cells =3D <3>;
>  			#size-cells =3D <0>;
> +			resets =3D <&rst I3C0_RESET>;

[Severity: Medium]
Will this cause dtbs_check validation errors?

The resets property is currently undefined in the dt-binding schema for the
Synopsys DesignWare I3C master:

Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml

Since the schema enforces unevaluatedProperties: false, adding this property
without updating the YAML binding will result in compilation warnings.

[Severity: High]
Does the dw-i3c-master driver require a corresponding reset-names property
to function correctly?

Looking at the driver implementation, it explicitly requests the reset line
by name:

drivers/i3c/master/dw-i3c-master.c:
    devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
                                                         "core_rst");

If reset-names =3D "core_rst" is missing from the device tree node, the loo=
kup
fails. Because the driver uses the optional API variant, it silently returns
NULL, and the IP block will not be brought out of reset.

[ ... ]

> @@ -313,6 +315,7 @@ nand: nand-controller@10b80000 {
>  			cdns,board-delay-ps =3D <4830>;
>  			iommus =3D <&smmu 4>;
>  			dma-coherent;
> +			resets =3D <&rst NAND_RESET>;

[Severity: Medium]
Is this property supported by the Cadence NAND dt-bindings?

Similar to the I3C master, the cdns,hp-nfc YAML schema enforces
unevaluatedProperties: false but does not define a resets property.

Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml

[Severity: Medium]
Does the Cadence NAND driver actually consume this reset property?

The driver code does not currently appear to contain any logic to acquire
or deassert a reset control:

drivers/mtd/nand/raw/cadence-nand-controller.c

Since it never calls a function like devm_reset_control_get(), the NAND IP
will remain in reset until the driver implementation is updated.

>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527151239.5565=
0-1-dinguyen@kernel.org?part=3D1
