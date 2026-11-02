Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608425;
	b=QDEqG0dwYAE/PTaz01TMkr5CFxewbKyUf/c0lMUjWD5pdh1itWnCh1XP/dHuFTOX2leY
	 7dj3iOBvl84z23Js81kmfgdPuX62DbMGROn3rxq1j0JviuNSOaDIXqb/wYSxjJRnk7caa
	 iEzwByQMAnkG4TlrzkowqrQeeS9Dkr3kY0A8qXdEONnjpIM4D22PIDkB50Wz7DliLXrfJ
	 Jh+SKbpcw2ErTAWZYzYAehIZjkhxuFU2XfDw37jEg3qiUb84YilCBWP70b9rofXHo5/mA
	 8/WsevQZHuvRootWU8Ew5nZmGvp4Px39wNnSo/fGEY+m5KOahxCtth31bZIaBI+8FZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XRpH/JyaxN3E335O/Hcznoa+RYw05/yjDHH419w5IFA=;
	b=ac+DGJ0kjZoX6OUQ1uy0hH1DAEOlYSgtc9D/drS9NM+I61QAx1qi9OTzG9VOCaJQN3mG
	 vmr4QVHdrici517/V3WWk+/hVvsjHBKluRe3nRTwwDWkpGqK7fX24kzW3gbwEs5IVQsYO
	 9zQpHf9oNUt2fzFbKh3mpn8klld+iWGN2bCTlj1qd0iRU9SLF9oPxgUyUnxn2vPEcs38v
	 np0F9dtN6qKN42aSdiNiqlxw8LviCVTXuXUy7Q0cL/fVxiKe9F/x02JEiIrg5AwtBrdQ3
	 kxHcvk5eTndpn5VgwURmJ0mbbcQTsIuMPWvJ7+Ac9qvAAmWXeeWszDmWBtVQ+z3/vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JD6WoHw6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E81606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JD6WoHw6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091341F000C1;
	Mon,  2 Nov 2026 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608424;
	bh=XRpH/JyaxN3E335O/Hcznoa+RYw05/yjDHH419w5IFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JD6WoHw6hGsU/3kWlN7ONNLh5EDbSHnNX2uZcOio1kRBsnJxRPER5K5FUZlXbCXqa
	 6zzBNNFbxQq2Mprw3Km626+ddDtPvK5+pK46e7wGAdej3lvSZRQgo182t+USQdyONm
	 MF9orXRjSkGeE5zU5V2HkkJB6BeoGuiYwuUkYH+WA+t1VFdt/PWXbszo7whQ7n80G+
	 Cg/VcONBHI1MnxlA/QXaBtf5B9b1vrK9wfvAW2apbNl002j78tTwFPFVx/CNZzZHGM
	 BjxGNo+Pn38nh4e8lIJAhX4qiekW7wIRrJ2+xEeT6mJR7DIYe8kClZXgjT+BVrih6w
	 vzIBjncwpMNHQ==
Message-ID: <sashiko-outbox-193117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102082112.2306326-2-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261102082112.2306326-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:33:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: phy: cix,sky1-usbdp-phy: missing OF graph port for =
usb-switch
- [Low] dt-bindings: phy: cix,sky1-usbdp-phy: redundant usb-port and dp-por=
t nodes
- [Low] dt-bindings: phy: cix,sky1-usbdp-phy: software policy in cix,defaul=
t-conf
--

commit 04fdff6aa671993772ad90b645872bcdaa857848
Author: Gary Yang <gary.yang@cixtech.com>

dt-bindings: phy: add CIX Sky1 USB/DP combo PHY

This commit adds the Device Tree binding schema for the CIX Sky1 USB/DP
combo PHY, describing its USB and DisplayPort lane child nodes, Type-C
switch properties, and S5 system controller phandle.

> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yam=
l b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
> new file mode 100644
> index 0000000000000..a5b6943f84ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
> @@ -0,0 +1,150 @@

[ ... ]

> +  orientation-switch:
> +    description:
> +      The PHY handles Type-C plug orientation switching.
> +    type: boolean
> +
> +  mode-switch:
> +    description:
> +      The PHY handles multiplexing of the USB and DisplayPort lanes.
> +    type: boolean

[Severity: Medium]
How does a Type-C connector or port controller link to this PHY's
orientation-switch and mode-switch without an OF graph port or ports node?

In the Type-C mux and switch subsystem,
fwnode_typec_switch_get()->fwnode_connection_find_matches() and
fwnode_typec_mux_get()->fwnode_connection_find_matches() match
orientation-switch in typec_switch_match() and mode-switch in
typec_mux_match() by traversing OF graph endpoints via
fwnode_graph_devcon_matches().

Because this schema sets additionalProperties: false without defining a port
or ports node, any board Device Tree that adds an OF graph connection from a
usb-c-connector to this PHY will fail dtbs_check validation, and without the
graph link the Type-C subsystem cannot resolve the switch or mux.

Should this binding reference /schemas/usb/usb-switch.yaml# (or
/schemas/usb/usb-switch-ports.yaml#) instead of redefining orientation-swit=
ch
and mode-switch locally without graph endpoints?

> +
> +  cix,usbphy-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the S5 system controller
> +          - description: PHY instance index within the system controller
> +    description:
> +      Phandle to the system controller used for lane muxing and
> +      Type-C orientation control, followed by the PHY instance index.
> +
> +  cix,default-conf:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    default: 3
> +    description: |
> +      Lane mode the PHY is put in until a consumer changes it through the
> +      Type-C mux. The value is a bit mask: 0 =3D none, 1 =3D USB, 2 =3D =
DP,
> +      3 =3D USB and DP.

[Severity: Low]
Does cix,default-conf describe a hardware characteristic, or is it encoding
initial driver software policy in Device Tree?

Which lane mode the driver configures prior to receiving a Type-C mux or PHY
consumer state update appears to be runtime driver policy rather than static
board or SoC hardware description. Could this property be dropped from the
binding?

> +
> +patternProperties:
> +  "^usb-port@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The USB lane of the combo PHY.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +  "^dp-port@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The DisplayPort lane of the combo PHY.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false

[Severity: Low]
Are the usb-port and dp-port child nodes necessary when neither subnode has
any dedicated Device Tree resources?

Each child node only contains reg and #phy-cells =3D <0>, with no per-lane
clocks, resets, power supplies, or distinct MMIO register ranges. Could the
parent PHY node set #phy-cells =3D <1> (for example, taking PHY_TYPE_USB3 a=
nd
PHY_TYPE_DP) and omit these child nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102082112.2306=
326-1-gary.yang@cixtech.com?part=3D1
