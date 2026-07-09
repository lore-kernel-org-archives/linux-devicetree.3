Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCA3C37B4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598321; cv=none; b=rCOYBtXLPwV19YRIrLEPD2ebm/YGD5ssMMdNzuJ7uXhVUtPowvlp29M4cwohC1YaaZc7d8zB4+mHaHmXM7ash3f7AVudItKSmVIdSBZkdbplp5ABMPYfE2MQdzeCUlbxK45Fw11rcI3HVq1TKlHQSB8O5XatTd1PeCLQScS47ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598321; c=relaxed/simple;
	bh=HpUAxW7nAtSzB5JCSAzw1YGGEHhGeXNTP1L0jR/tRCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=syTZUwXMZtj99T701/Lsh5GYhstmpseFQNf5aZZAnchJ3FINWPwkqqqie5E+AvjckJkF6//3WNPMyybfUlpt3qYq7pkM3qqmdFkfT04aBCPhiSJLGZv+KN/rlDR6ZSSkOsPvEpzVPp3UjXWwcvVKdTNsFOll+GgVRu6QVNDqvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZhevvRx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZhevvRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BA41F000E9;
	Thu,  9 Jul 2026 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783598318;
	bh=sjDyGfoRzt/F2TDRgMHPzBkJbrfdsPgOVKp/x9A2n1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZhevvRxfmv0jKKBkFjeKI5bIb4SzxIufG9grvJMJJd31I+zmZkBBJdIg2PJkCuPe
	 zh/SK7FxFfsxpiUQhBK79x3WudfUAhp6Trl9MkJptvwo37eND89TS7jDFxvZjG+JBk
	 Gj32QcqDptVI3glb5SWF+EfYpI9Wijn9qZH6OP2ZbgfACS9FUdjQ+YvTo8WJYSlT3G
	 4x2XLk8ks8GhJ0RVSuQ1kKcnwB9S0g9ZwTCgeMcGHS+cc/urTruAwK4DNGOSeCqxMC
	 F1PbE7hWu1G/Ji7XSTLFgtWbw5LnqmIHLo+JDza7XA67IhAEZVvQ61ctuHnYq5OavP
	 /NJl1ajXN8Mfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709095726.704448-11-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:58:37 +0000
Message-Id: <20260709115837.F1BA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DT ABI Breakage: Reverting the top-level `port` property and repla=
cing it with `ports` fails to update existing in-tree device tree users, ca=
using schema validation failures.
- [Medium] Incomplete and incorrect property constraints: The descriptions =
for `port@1` and `port@2` strictly assume a maximum of 1 SS port and 1 HS p=
ort, which contradicts hardware with multiple ports.
--

--- Patch [10]: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switc=
h to ports for USB connections ---
commit 2e9e786003304eb48defeb647a256e455bd0ffa3
Author: Chen-Yu Tsai <wenst@chromium.org>

dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections

This commit replaces the single 'port' node with a 'ports' node containing
'port@1' and 'port@2' to represent the USB connections. It maps port 1 to SS
and port 2 to HS depending on controller capabilities.

> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml=
 b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 231e6f35a986f..d6c75bd20b785 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -107,10 +107,6 @@ properties:
>        - description: USB3/SS(P) PHY
>        - description: USB2/HS PHY
> =20
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description: Super Speed (SS) Output endpoint to a Type-C connector
> -

[Severity: High]
Does removing this property break schema validation for existing device tree
files?=20

For example, arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi uses
the port property under the &xhci1 node:

arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:
	port {
		xhci_ss_ep: endpoint {
			remote-endpoint =3D <&typec_con_ss>;
		};
	};

Running make dtbs_check with this commit seems like it will result in
'undocumented property' errors for the old port node.

Should the in-tree users be updated alongside this binding change, or should
backward compatibility be maintained?

>    vusb33-supply:
>      description: Regulator of USB AVDD3.3v
> =20
[ ... ]
> @@ -188,6 +184,19 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus if SS-capable;
> +          otherwise High Speed (HS) data bus.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus if controller is SS-capabl=
e.

[Severity: Medium]
Do these port definitions fully account for controllers with multiple ports=
 of
the same speed?

The hardware supports up to 9 PHYs in the existing phys property array,
accommodating multiple ports on a single controller (e.g., 2 HS ports and 1=
 SS
port on ssusb1). Defining only port@1 and port@2 restricts the schema to a
2-port layout.

If a developer defines a valid port@3 for a second HS port, won't it fail
schema validation? Could these descriptions be broadened or the properties
expanded to accommodate multi-port controllers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D10
