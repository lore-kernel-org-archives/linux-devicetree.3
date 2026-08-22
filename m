Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE153328267
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385357; cv=none; b=n3biz8q6bkeeQK6fF7gKzDp2tjd9TM3DvGCyI8goPllRJ27dkT56RG1h3GCPNX61AXeFW5c5d7XoicLy+YfDY0WSlIfGrq9ETxMgqyMX7NJj4ExpoYRQX+H1gOAqt1mByzJ1dyapWyN9oPvwx5v2LZuvUgnTtmJdO3gCQI3POJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385357; c=relaxed/simple;
	bh=lZo2ZIKRKhfyRLJFv/h5IRB1XGa5e67HSN6ETefgF1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tf26jGViflblqKqBaoFvEGv1tHhlssdlk7Ps4eMG8bO5hr7GFP+boZpU+4O+YnPjJv8Eqwk51ECIOSVPcpaAtJYymh3Z1DOn4em+OIHiqtITG7hFkuf/NB2VZYJy210M6AZxzNKXYYDz3m1BU8mh89/mL4vFBQXe9qARb0uHmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8QxpZEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8QxpZEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91B91F000E9;
	Sat, 22 Aug 2026 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787385355;
	bh=6N9au3zguC45nbY50QHDxwLeCSu+/FgjEfEQK+IV4Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T8QxpZEdYWax8TgfMDzJKMN85LEGBc2y3O4oFJjc/cn9TKktAvcwTP+wExSfRcJpZ
	 cgBwjuw/fKMA73g61ole0UORo9/g/f3JL2rAMqoXwX2z9vFurLk84f2wU42Ny2PRh6
	 Mm3283ZO3ZPHcENChUmVEkSXFRtJCzX3r4GK7LSebs/O8cIMVVN1+mDbJ1Q5/bV0g+
	 oKB9hBXHFOcxOCr2cWaA2539zt1mih8CH2siWljDO8O4bdekF6dzDO42pCzvVby3EY
	 +UGAz/zA1zrkmA0gbepsdBTG/5k6l32WWOBOsAkgUv89RtY3Ya8AsftQIrNxZEB6O5
	 xLjgvsupx54dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260822074816.548662-2-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 07:55:54 +0000
Message-Id: <20260822075554.D91B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The `reg` property is defined in the schema and used in the example=
 but is missing from the `required` list.
- [Low] The example node name 'usb-phy@2400' violates the generic PHY schem=
a pattern.
- [Low] The '#clock-cells' property lacks documentation for the clock indic=
es.
--

--- Patch [1]: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-=
FEMTO PHY ---
commit fee849432713aad415e73ed872e6de622206bee8
Author: Pankaj Dev <pankaj.dev@st.com>

dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY

This commit documents the USB2 phy for STM32MP25 USB2 controllers. It intro=
duces
bindings for two slightly different phys present in the STM32MP25 SoC using
separate compatible strings.

> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml =
b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> new file mode 100644
> index 0000000000000..cc5044790beea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-usb2phy1
> +      - st,stm32mp25-usb2phy2
> +
> +  "#clock-cells":
> +    const: 1
> +

[Severity: Low]
This sets #clock-cells to 1, meaning consumers will need to pass an index,
but there doesn't appear to be any documentation of the valid indices (e.g.=
,=20
0 for PLL, 1 for CMN) in the binding or a dt-bindings header file.

Could this be updated to document what index corresponds to which clock so
device tree authors aren't forced to rely on undocumented magic numbers?

> +  "#phy-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1

[ ... ]

> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - clocks
> +  - resets
> +  - vdd33-supply

[Severity: Low]
The reg property is defined in the schema and used in the example below,
but it is missing from this list.

If it is omitted here, device tree nodes without a register offset can
silently pass schema validation, even though the driver will fail to probe.

Should the reg property be included in this required list?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    usb-phy@2400 {

[Severity: Low]
Generic phy schema patterns in dtschema restrict node names for phy
providers to match the regular expression ^phy(@.*)?$.

Will this node name trigger warnings when validating the example during a=20
dt_binding_check?

> +        compatible =3D "st,stm32mp25-usb2phy1";
> +        reg =3D <0x2400 0x24>;
> +        #phy-cells =3D <0>;
> +        #clock-cells =3D <1>;
> +        clocks =3D <&rcc CK_KER_USB2PHY1>;
> +        resets =3D <&rcc USB2PHY1_R>;
> +        vdd33-supply =3D <&vdd33usb>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822074816.5486=
62-1-marex@nabladev.com?part=3D1
