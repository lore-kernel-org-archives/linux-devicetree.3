Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608061;
	b=4z5eSimnrayKJ5ncwHd6iYtFyeNHeKVawItXILOZoybS/TN4ESmU54ga+deaFlm8AqeS
	 g468nStSH2XcyBSdt8o2ptpAyk9nue5k8Xm5BEdZqBbu7LTC85OlPYPadqV42FOioGCPf
	 wLw+mIcvgZl00SWtG7NQgmxLRqt0Abnq9Osz33m2uMdL9O9PWj6NNm0H0IxPvrUZDZxKQ
	 tFrXC0TdtB/f6+BAfioJDOwEKnKccY0DyP4pTqRS86dje7EcOuW/E4zk4wqliLTkuFVMg
	 XD7czlmBW1sr3JteR2nqL4Z2vMvxlkty7FYZI0JEuqfhswla0Eaj96TAlTqLa0gQPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608061;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BkCVSBs2O343FSe62AAxX34kMTrNlucEMAzdqfu54Ck=;
	b=GbeWqxL8UKe1QJ3tm0vVAkTCjNy0/xttrV+alq+wLNs6Ul8+QJb/aw9D2iBq9HWOOZF5
	 dJV8eVx4JY7ryetELmY7779XMBeDL2XrO9tT35A645366tQPd8bw+4VrH+YONoQ10iWJA
	 SLNF3BDUhwS6X3nbtJFnGcTLTXvgdJvnaytRFb1wB69QKUC8iD1OXl+kT+Vg4CQO4H5nt
	 FVsxwvCcCpXdHgWeOMLSJCdVLckbH7zT5jirku7XKUJNGTvA2+X3OAd+WV1Bj65+OfavX
	 0zfYGzVmSr9XRAL0Nvt23vXvuq1giWZF0V8yOUOvlm2KEV/0FAzlPaH75CG2kvLfijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyBxkfAA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565B606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyBxkfAA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980B41F000C1;
	Mon,  2 Nov 2026 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608061;
	bh=BkCVSBs2O343FSe62AAxX34kMTrNlucEMAzdqfu54Ck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyBxkfAAtyOchwhkysnEAk1NtlLGhPL1B4Hg2u5Xyvg55YUlQUuQ5Ocwb8E/UAtB+
	 qUJWknjwyx1CJHxLZ01YB3QUBYvArS1CjF9mTuv9AlUfS/T6zANKqqhlIs7GFkj87V
	 MDzZ68qJ1C6gqHqL9tWaqV1Nl6NzMfUEAxIFzjbikJVp5wy8d2aD+/7XHyX76vTXG1
	 HZ8GL1wViEh1j7ClU0oIGj3D0f40Wex47IQUNPsEkrTRzyxHDC6NRTQS+oVkn3XNk/
	 SJ1wDnqBWSKdXdgOkcbGrjRwuR2rGmN45G3H4UuDO29P2ZZhtbLHWu9/E1rCvPBWnW
	 OIrzUNVwbv9Jg==
Message-ID: <sashiko-outbox-193105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102081532.2305142-2-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
 <20261102081532.2305142-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:27:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: phy: cix,sky1-usbdp-phy: missing OF graph port/port=
s for Type-C
- [Low] dt-bindings: phy: cix,sky1-usbdp-phy: dummy child nodes and policy =
property
--

commit 861d429c69ca8c486ffb6fda39bbf7f07f828ee7
Author: Gary Yang <gary.yang@cixtech.com>

dt-bindings: phy: add CIX Sky1 USB/DP combo PHY

This commit adds the Device Tree binding schema for the CIX Sky1 SoC
USB/DP combo PHY, describing its clocks, resets, system controller phandle,
Type-C switch properties, and child nodes for the USB and DisplayPort lanes.

> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yam=
l b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
> new file mode 100644
> index 0000000000000..a5b6943f84ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
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
[ ... ]
> +  cix,default-conf:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    default: 3
> +    description: |
> +      Lane mode the PHY is put in until a consumer changes it through the
> +      Type-C mux. The value is a bit mask: 0 =3D none, 1 =3D USB, 2 =3D =
DP,
> +      3 =3D USB and DP.
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
Why are child nodes and cix,default-conf needed in the binding here?

The usb-port and dp-port child nodes only contain reg and #phy-cells =3D <0>
with no per-lane hardware resources (such as separate clocks, resets,
regulators, or OF graph ports), and the driver in cix_udphy_probe() does not
read the child reg property at all. When combo PHY sub-lanes have no
independent DT resources, could the parent PHY node expose both lanes
directly using #phy-cells =3D <1> (for example taking PHY_TYPE_USB3 and
PHY_TYPE_DP) instead of requiring #address-cells, #size-cells, and dummy
child nodes with arbitrary unit addresses?

Similarly, cix,default-conf describes the initial software lane mode prior
to Type-C mux updates rather than a hardware property of the PHY, and both
the binding and driver already default to 3. Could cix,default-conf be
dropped from the binding so the driver initializes its default state
directly?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - resets
> +  - reset-names
> +  - cix,usbphy-syscon
> +
> +additionalProperties: false

[Severity: Medium]
How can a Type-C connector or controller link to this PHY when
orientation-switch and mode-switch are used?

In the Type-C mux and switch core (fwnode_typec_switch_get() ->
fwnode_connection_find_matches() -> fwnode_graph_devcon_matches() ->
typec_switch_match() and fwnode_typec_mux_get() -> typec_mux_match() in
drivers/usb/typec/mux.c), the boolean orientation-switch and mode-switch
properties on a provider node are matched by traversing OF graph endpoints
(port or ports) from the Type-C connector node to the provider node:

drivers/usb/typec/mux.c:typec_switch_match() {
	if (id && !fwnode_property_present(fwnode, id))
		return NULL;
	...
}

However, Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
defines orientation-switch and mode-switch inline and sets
additionalProperties: false without defining port or ports properties or
referencing /schemas/usb/usb-switch.yaml# and
/schemas/usb/usb-switch-ports.yaml#.

As a result, any board Device Tree that connects a Type-C connector to this
PHY via OF graph will fail dtbs_check validation, while omitting the OF
graph links prevents fwnode_typec_switch_get() and fwnode_typec_mux_get()
from discovering the PHY's switch and mux at runtime. Should this schema
reference usb-switch.yaml and define the required OF graph port/ports nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102081532.2305=
142-1-gary.yang@cixtech.com?part=3D1
