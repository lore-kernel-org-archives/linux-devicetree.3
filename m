Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826498;
	b=Gz8Y8eE3R23QEYa7a+6iG9vn7piguOvKTSEki61IXS42Nc/XqaxVtcXHiwKom0zSRdbn
	 VdpN31QaOPj/z5/vis1mGdArDIs7MKc59VEUPK9nPcBr37+ZTcPDkhy/8C3mFixtJzQba
	 6NmscZyQ6Z7ePYCw6psXslHmRStrWQYU8bkjVNCBWx0QbLhALWwS14JkNLyvwvIUmidP8
	 otxqN+TsQO8WFoKg8NyrewUdu8r8JmVWMUVq8voBKueH+63rWBtxi13jJMvpMBJ5VCwY4
	 OJeOm5R7czo2Tmcs/XaRgS65WewcBIdr5Js47T0Y78McH8Ed25y02RaeIoNwv0hQBHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kZ0APffWEaTaEkAPlAgVZvcS5GpGBVOGqbwV8XhHs3A=;
	b=u2Tot86+stdF5APLK4xeCau2unyaso4KJADaCqa8Z7QOFeCRZpDXxQv/pyEcGUGam2bI
	 RMQ+tbFjD2j1DIsPIb0PZgSDJf390SfOclL8MPRGE0lV6m4JUJpGj7jFIc7rUM9IHZJch
	 lMqnJTXqj9E0gnsU352nYwuzx0SmvtVpSjULDkt8yTWFVv9v7q89byQdvQHKV9XYIkZ0k
	 BCF/u8+qUPh3wDaGt+CQ8SS2LVPEHewSL4sqzjmXmExflzGkjpamyPs9FV46y4S2zduRx
	 YNsbO4Xp5GCdspZC4DkqiWYKL2oDkmccqaNXcialxNSa0f76Fy0olTLx1XzD3hQFZtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgXc2cov;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96A6070E6B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgXc2cov
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839C61F00919;
	Wed,  4 Nov 2026 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826497;
	bh=kZ0APffWEaTaEkAPlAgVZvcS5GpGBVOGqbwV8XhHs3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgXc2covtRPbbRxYZ5BxmFBh4FOPvh2ZGQaibaVN2vWUkh89tqcMFWsRlssHSTvZj
	 36ucj/GJnG6jOB7rnsxSIPWuOC18FQ4eDo9StNS1nviOX5S6W64L+A3elAS2dX6kX1
	 723DPkyONVB1t6SH0LK2tNDiacXMmiphvPyRfcHFzm43bXiudiGkEvI/HjE+mdaGey
	 rimEfZVv6W3gP0czlOFP3ZMMyryezFr3AnVgS9VCH7MZS67xFtZU7iPhEh4WD/O+xC
	 aaY5ZmWgnz0Wy8Ix/rVaeaiyde8YbJ/T31BRG+sI89TeKP7DDqpYbE61/tbIkZF7Sf
	 /FYLf2cAUw2Hg==
Message-ID: <sashiko-outbox-198047@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 21:08:17 +0000
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
- [Medium] dt-bindings: media: qcom,sm8150-camss: fix port endpoint schema =
and clock-lanes
- [Low] dt-bindings: media: qcom,sm8150-camss: drop internal CAMCC RCG *_sr=
c clocks
- [Low] dt-bindings: media: qcom,sm8150-camss: wrong voltage in vdda-pll-su=
pply text
--

commit c84531abb5c3a45299a3b568782087233c82947c
Author: Andrew Gigena <mail@andrewgigena.dev>

dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS

This commit adds the Device Tree binding schema for the Qualcomm SM8150
Camera Subsystem (CAMSS), describing its CSIPHY, CSID, VFE, clock,
interrupt, IOMMU, interconnect, and power domain resources.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 0000000000000..a65067352b58c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@

[ ... ]

> +  clocks:
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_src
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_csid_src
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_src
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_csid_src
> +      - const: vfe_lite0
> +      - const: vfe_lite0_src
> +      - const: vfe_lite0_cphy_rx
> +      - const: vfe_lite0_csid
> +      - const: vfe_lite0_csid_src
> +      - const: vfe_lite1
> +      - const: vfe_lite1_src
> +      - const: vfe_lite1_cphy_rx
> +      - const: vfe_lite1_csid
> +      - const: vfe_lite1_csid_src
> +      - const: slow_ahb_src
> +      - const: gcc_ahb
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf

[Severity: Low]
Should the 15 *_src Root Clock Generator (RCG) clocks be dropped from clocks
and clock-names here?

In drivers/clk/qcom/camcc-sm8150.c, each of the corresponding leaf branch
clocks already wires .parent_hws to its respective *_clk_src RCG with
CLK_SET_RATE_PARENT set:

    static struct clk_branch cam_cc_ife_0_clk =3D {
        ...
        .clkr =3D {
            ...
            .hw.init =3D &(const struct clk_init_data) {
                .name =3D "cam_cc_ife_0_clk",
                .parent_hws =3D (const struct clk_hw*[]) {
                    &cam_cc_ife_0_clk_src.clkr.hw,
                },
                .num_parents =3D 1,
                .flags =3D CLK_SET_RATE_PARENT,
                .ops =3D &clk_branch2_ops,
            },
        },
    };

Rate configuration and enablement propagate from the leaf branch clocks
automatically, and the CAMSS driver resources (csiphy_res_sm8150,
csid_res_sm8150, and vfe_res_sm8150) never request any of the *_src clocks.
Other Qualcomm CAMSS bindings with the same CAMCC topology (such as
qcom,sc8280xp-camss.yaml, qcom,sc7280-camss.yaml, qcom,sm6150-camss.yaml, a=
nd
qcom,sm6350-camss.yaml) only expose the leaf branch clocks in the binding.

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes

[Severity: Medium]
Does requiring clock-lanes under port@0..3.properties.endpoint break C-PHY
endpoints and D-PHY endpoints that omit the hardwired clock lane, while the
example's endpoint@0 node bypasses this schema?

In the example below, port@0 defines an addressed endpoint@0 child node:

    port@0 {
        reg =3D <0>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        csiphy_ep0: endpoint@0 {
            reg =3D <0>;
            clock-lanes =3D <7>;
            data-lanes =3D <0 1 2 3>;
            remote-endpoint =3D <&sensor_ep>;
        };
    };

Because port@0..3 only define properties.endpoint (matching a node literally
named endpoint), endpoint@0 is matched only by graph.yaml#/$defs/port-base
and bypasses the endpoint constraints in this file.

Furthermore, on Qualcomm 3-phase Gen2 CSIPHY blocks
(drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c), the D-PHY clock
lane is hardwired to lane 7 in hardware and is not configurable, while C-PHY
mode (bus-type =3D <1>, MEDIA_BUS_TYPE_CSI2_CPHY) uses 3-wire trios with an
embedded clock and has no clock lane at all. Sibling CAMSS bindings removed
clock-lanes in commit 336136e197e2 ("media: dt-bindings: media: camss: Remo=
ve
clock-lane property") and commit b8ef764aff5be ("dt-bindings: media:
qcom,x1e80100-camss: Remove clock-lanes port property"), and use an
unnumbered endpoint node in the example.

[ ... ]

> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.

[Severity: Low]
Should the vdda-pll-supply description say 1.2V instead of 1.8V?

In the example below, vdda-phy-supply and vdda-pll-supply use 0.88V and 1.2V
rails:

    vdda-phy-supply =3D <&vreg_l5a_0p88>;
    vdda-pll-supply =3D <&vreg_l3c_1p2>;

Commit 94d14ac1f2d3 ("dt-bindings: media: Correct camss supply description")
previously updated the other Qualcomm CAMSS bindings to describe
vdda-phy-supply as the 0.88V supply and vdda-pll-supply as the 1.2V supply =
to
CSIPHY IP blocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sm8150-v7-=
4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev?part=3D2
