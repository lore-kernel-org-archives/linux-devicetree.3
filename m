Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D333C7DE1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237929; cv=none; b=itCmEjvJTrMDTWK/fyXFPPR6BqM93SdF4f2gz9WU9xmnZ97mpm0ulhOfoLNvGYSb6DOhZg8UbnyxQSp983NF5uLDins2T+jNrxeaPKrFwDKPUFyePCkTEVECCQWytusHQALG7DV0br2nO3Qq9HvvcEI0pV/1Rlqcq3J90XY69yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237929; c=relaxed/simple;
	bh=VOCYB/qTXFEi6J0Yty2pX3WC4RJ/EBhA5VxtIjHLXWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CxZVKfEM/AfPBexnr+dEdZBUd1Kx2YdpEHNGDeiLP8CsdrbrxrycD0oZGHXGQULS2znpgf/6Oml5UFQV6VQywmJilDVeuttAk1dGmuJJGfTFT0/zOzOU0chFZghROWyZuUiBQjYHdPBAp1vz5jB6fh/w06cuM/YxYlB102W/IJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akGFHuYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akGFHuYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686171F000E9;
	Thu, 16 Jul 2026 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237927;
	bh=an0amx3OJJVPGtCyr/xpMaFzTb7NPh0NZgqmyTsEzvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=akGFHuYqWlr/SZ9gWIetGcqXjqjQh6eZD0nVF2ODm4lLnbMtXHRxyj5DhM1dUiDDh
	 hRvd+D3D8ssZxa4MQmAv8bkv2EomC9NUA83NUF2i2cqwaJDCjzGVGRkMFGU3wgaIL/
	 JX65unPJXcaLDVOCIAWy7N969bT67yNagRGx+Dv6UpFxDZ9girWzwAshj4+U0F9A2s
	 C7Dgck9NLkdEIXbmm4Tlv0kAmEL/niosi9GUgGXC4xiIegLHs5fdyzO2jzRp48y8FJ
	 dcvenYFFjrfzw1LNwFjIPEDxH2TVnKvY5mvVsPCyDs4H1+gOT+xMDSW+U6TzDIlXXb
	 sef7+tgKjVSkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com>
References: <20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:38:46 +0000
Message-Id: <20260716213847.686171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The converted YAML schema omits the `clocks` and `oc-gpios` prop=
erties. Since `additionalProperties: false` is set, `make dtbs_check` will =
incorrectly fail for existing valid device trees that use these properties.=
 Furthermore, `clocks` is a mandatory hardware requirement, as the driver's=
 probe function will fail without it.
--

--- Patch [1]: [PATCH] dt-bindings: usb: ti,da830-ohci: Convert to DT schem=
a ---
commit 7116233f47fab25581fee6b5a4f1df2b63c1d5a9
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,da830-ohci: Convert to DT schema

Convert Texas Instruments da830-ohci bindings from legacy text to DT
schema. Name of binding is changed to match primary compatible property.

> diff --git a/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml b/D=
ocumentation/devicetree/bindings/usb/ti,da830-ohci.yaml
> new file mode 100644
> index 0000000000000..ad23da6466487
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
> @@ -0,0 +1,50 @@

[ ... ]

> +  vbus-supply:
> +    description:
> +      phandle of regulator that controls vbus power / over-current
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - phys
> +  - phy-names
> +
> +additionalProperties: false

[Severity: Medium]
Because this schema enforces additionalProperties: false, won't make
dtbs_check incorrectly report validation errors for existing device trees
that include clocks or oc-gpios?

Existing device trees like arch/arm/boot/dts/ti/davinci/da850.dtsi define
a clocks property for this device:

arch/arm/boot/dts/ti/davinci/da850.dtsi:usb1() {
        ...
        phy-names =3D "usb-phy";
        clocks =3D <&psc1 2>;
        ...
}

Additionally, the driver drivers/usb/host/ohci-da8xx.c checks for an option=
al
"oc" GPIO (which translates to oc-gpios in the device tree):

drivers/usb/host/ohci-da8xx.c:ohci_da8xx_probe() {
        ...
        da8xx_ohci->oc_gpio =3D devm_gpiod_get_optional(dev, "oc", GPIOD_IN=
);
        ...
}

Furthermore, should clocks be added to the required list? The driver's probe
function appears to fail if the clock is missing:

drivers/usb/host/ohci-da8xx.c:ohci_da8xx_probe() {
        ...
        da8xx_ohci->usb11_clk =3D devm_clk_get(dev, NULL);
        if (IS_ERR(da8xx_ohci->usb11_clk)) {
        ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-ti-da830-o=
hci-v1-1-3f2d111a2042@gmail.com?part=3D1
