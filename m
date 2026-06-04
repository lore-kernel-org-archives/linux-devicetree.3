Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF63563EB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568368; cv=none; b=kHqz8PkvltkmQwT1VdnH98kua57kSWNMK6GrFzbj5tWXh5L+Ec3DeeRADssw1W2XZmbeh7ZsHtUN+oYHyT6F3JRUYAyzu2AQkwuZ7Dgd3jlqscdQ4cngZVy1PmVJMb5Lia5ALc1itHQD3sKTC0Ea/+iRbrJDlpIG8P1fZUvVZKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568368; c=relaxed/simple;
	bh=8FMFGy1XHIzvJkgV8vG3DsOU5jHQMMMMkXF+dxR9BVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oaOLCfZZDc/HxEnR8rM9T4xWxpU7IFgJ+CSEqaGMK8hFRQv2Dd7NHhz3sDgO0uwiejWkVCQssZeLaWSeSyPVSa6uIP5TtvNfiVi1M5s1m5Gv7aOZwK4gWWY/zFu1SUddhGQkIyjNa7iwbz0gcqbwpMfwu7hIhOqAJTGowUOmEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV3KodgD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV3KodgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62B51F00893;
	Thu,  4 Jun 2026 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780568367;
	bh=gZn445ylNQSu1u037HBoIaLihwmjD+2QAe+Bc01uSko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fV3KodgDtDXeoGdP6R+urDFfiSnwb6sI0ycabgzAUUocRM+IaCVZOyEfS/iv0MBeN
	 3jmXLqy0vTzybY0R5Q/QEQ0SeXPOt1GuzudIZZpFCepEwQ/Qx1/nafqc8nNcmTDaeV
	 TszLj/EdWTDzKcK8+Q/iS2KdhF1wvZ22psZahc9IZhaJgGE94/FJlhpb1LVSi9o/WV
	 eBDKjOeqAQr7uuaRzgqGVqYF6lih6SZ2y9kbbU9aaGT8KFegnJOUtDcVn8gpVf2Lia
	 A8r3bxUJjDUvYWlha8Z7qtsWFC44riIy1hfcBz6n7A9kWEA6/Y6rWoR+G+bteFMf9o
	 EnCWlM4h8r/Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY
  binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260604101220.1092822-2-a0987203069@gmail.com>
References: <20260604101220.1092822-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 10:19:25 +0000
Message-Id: <20260604101926.B62B51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding incorrectly represents a multi-port PHY controller a=
s multiple independent nodes instead of a single provider with `#phy-cells =
=3D <1>`.
--

commit edfd20765d416e895bc152da5eefd3bf59f431bd
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY binding

Adds the device tree binding documentation for the Nuvoton MA35D1 USB 2.0
OTG PHY driver. The PHY supports two ports (OTG and host-only) and allows
board-specific resistor calibration and over-current detect polarity.

> diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-ph=
y-otg.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-=
otg.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.y=
aml

[ ... ]

> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the system management syscon.
> +          - description: PHY instance index.
> +            enum:
> +              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
> +              - 1   # USB1, host-only port
> +    description:
> +      A phandle to the syscon node covering the SYS register block, with
> +      one argument selecting the PHY instance. Index 0 selects the OTG
> +      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
> +
> +  "#phy-cells":
> +    const: 0

[Severity: Medium]
Should this multi-port PHY controller be represented as a single provider
node with #phy-cells =3D <1> instead of embedding the index in nuvoton,sys?

Using independent nodes for each port with #phy-cells =3D <0> sidesteps the
standard consumer argument pattern and forces non-standard node names to
avoid collisions at the same tree level.

[ ... ]

> +  nuvoton,oc-active-high:
> +    type: boolean
> +    description:
> +      When present, the over-current detect input from the VBUS power
> +      switch is treated as active-high. The default (property absent) is
> +      active-low. This setting is shared by both USB host ports.

Since this property is explicitly described as shared by both ports, does
instantiating separate nodes per port risk conflicting states if the nodes
configure this property differently?

A single PHY provider node would allow shared properties to be defined once,
while consumers could specify their port index via standard phys arguments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604101220.1092=
822-1-a0987203069@gmail.com?part=3D1
