Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936204;
	b=MGaAeydiVX1td7nacsKRj6w06R9Gj2JocnX6U4h7iWvjMX/h5xKHor8LkrbUW9nioyfC
	 Cdjd6T35/suhxN0mHSLs0YEXe3T1ZLttlkGyVvGDXqPeWA3jeT1MNHwr73dlOvTER9s10
	 SYg4LGQgQpTj8HGct/1P2rXcXNw4QxIthMPx8QFEPqxj6gBCAF+MDvaicLxhoVlB2RF/9
	 NzaMquWHj+YYfzZJAO4qJx7Z2vVHxv7ZvsLAado+bk4RwqFdqPjw7XFffJsFa6Etc8+tR
	 2bu/AQ0U1dHP7ITO4djyxSC5Kat03jtndFRe0bhGiUE4TEjf+qK/MX25ldaNw+r2U7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q/YCVVDeaZr5cfQcysmKBFdeFAVQeDXUDkdjN4P/He4=;
	b=ilEGqGsF279BKtmaK5VhZKofDiH7jFNTVqIayAxpB8uKJRItefY6154ekEbIM0+L9n5/
	 htYDh0wbrQJhEYUvO90y9n6OcWR1lzs5UTNBx0LADlBUIqwCLJK04itvvw4X44dWW3ZJP
	 kIkBCVJAGVjEE5dhzb9Ui1dWH5To7clh4Uyql93efbLfNbNEHwIf96nwJ1HKc5ky1vC99
	 CkaNQF0FsFeAYULBGH7Zaak0zx7qEmQKMoAzSol2yXwhdhhOy364N0/gTyoAjs879K5To
	 pahFXvyXtDvxEMWUibukJWda26ODcITDIHBKxc3mF3271vJBZ7zor6fd3HoFLtC8h6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEgkLoO+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A81606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEgkLoO+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2036B1F0089F;
	Fri,  6 Nov 2026 03:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793936203;
	bh=q/YCVVDeaZr5cfQcysmKBFdeFAVQeDXUDkdjN4P/He4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iEgkLoO+0A7gQ7+3vrrRjmmtaaSvx21ijEXK1UfGc1MXSOJmRKjgUjpPcn0UzuJQ+
	 /tCTzf+fOVVLpmS6WTK8z2GTtz30hSDw+eR18gqSCBytfuAZBeJRoRAyfhafx7IBGc
	 4G8owHXA8cq09QMlpRfGFiB1j4ZmcUsxtx1RfMBNd81yPU1A1o8hZ3TxsS6DMKGem3
	 QkF3J5LZMU7TdewtSj3ir4omKnzXxN3Pbo9YnK8jl5Dh6UOI4+W3PkGsrYr8ic+LAP
	 BF5+Kan+xS/+4VYq0fXp4Dc+Qqc2aq87SyeMobd3ZHokFqWZoGGxRGnjp8AoHHuW7E
	 kdUg34STrMZHQ==
Message-ID: <sashiko-outbox-200653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sm8150-camss: Add
 SM8150 CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:36:42 +0000
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
- [Low] dt-bindings: media: qcom,sm8150-camss: DTS example violates strict =
coding style
- [Low] dt-bindings: media: qcom,sm8150-camss: duplicate port schemas and p=
roperty order
--

commit f1e0cef5355c3cc841108a7c44175130434fd78c
Author: Andrew Gigena <mail@andrewgigena.dev>

dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS

This commit adds a dedicated Devicetree binding schema for the Qualcomm
SM8150 Camera Subsystem (CAMSS), describing its CSIPHY, CSID, VFE, and
VFE-Lite instances along with its clocks, interrupts, IOMMU streams,
interconnects, and power domains.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 0000000000000..26f8939001df2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,412 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 27
> +    maxItems: 27
[ ... ]
> +  interrupts:
> +    minItems: 12
> +    maxItems: 12
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
> +              - data-lanes
> +
> +      port@1:
[ ... ]
> +      port@2:
[ ... ]
> +      port@3:
[ ... ]
> +  reg:
> +    minItems: 12
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite0
> +      - const: csid_lite0
> +      - const: vfe_lite1
> +      - const: csid_lite1
> +
> +  vdda-phy-supply:
> +    description:
> +      0.88V supply to CSIPHY IP blocks.
> +
> +  vdda-pll-supply:
> +    description:
> +      1.2V supply to CSIPHY IP blocks.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible

[Severity: Low]
This isn't a bug, but in Documentation/devicetree/bindings/media/qcom,sm815=
0-camss.yaml,
port@0 through port@3 under properties.ports duplicate the exact same
schema definition four times. Could this use patternProperties with
^port@[0-3]$ instead, matching recent Qualcomm CAMSS schemas such as
qcom,sm8650-camss.yaml, qcom,x1e80100-camss.yaml, and qcom,sm6350-camss.yam=
l?

Also, could reg and reg-names be placed immediately after compatible in
both properties and required (and clocks placed before clock-names in
required) to follow Documentation/devicetree/bindings/writing-schema.rst
and Documentation/devicetree/bindings/dts-coding-style.rst, and could the
redundant minItems entries on clocks, interrupts, and reg be dropped since
maxItems is already set to the same value?

[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8150.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        camss: camss@ac65000 {
> +            compatible =3D "qcom,sm8150-camss";
> +
> +            reg =3D <0 0xac65000 0 0x1000>,
> +              <0 0xac66000 0 0x1000>,
[ ... ]
> +            iommus =3D <&apps_smmu 0x840 0x620>,
> +              <&apps_smmu 0x860 0x620>,
> +              <&apps_smmu 0xA40 0x620>,
> +              <&apps_smmu 0xA60 0x620>,
> +              <&apps_smmu 0xC40 0x620>,
> +              <&apps_smmu 0xC60 0x620>,
> +              <&apps_smmu 0xE40 0x620>,
> +              <&apps_smmu 0xE60 0x620>;
> +
> +            interconnects =3D <&gem_noc MASTER_AMPSS_M0 0 &config_noc SL=
AVE_CAMERA_CFG 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF1 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
> +
> +            interconnect-names =3D "cam_ahb",
> +              "cam_hf_0_mnoc",
> +              "cam_hf_1_mnoc",
> +              "cam_sf_0_mnoc";
> +
> +            vdda-phy-supply =3D <&vreg_l5a_0p88>;
> +            vdda-pll-supply =3D <&vreg_l3c_1p2>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        data-lanes =3D <0 1 2 3>;
> +                        remote-endpoint =3D <&sensor_ep>;
> +                    };

[Severity: Low]
When running scripts/dtc/dt-check-style --mode=3Dstrict on
Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml, the
examples block triggers several style warnings:

1. Continuation lines in reg, reg-names, interrupts, interrupt-names,
power-domains, power-domain-names, clocks, clock-names, iommus,
interconnects, and interconnect-names are indented by 2 or 4 spaces instead
of aligning with the opening < or quote character on the first line.

2. The iommus entries 0xA40, 0xA60, 0xC40, 0xC60, 0xE40, and 0xE60 use
uppercase hex digits instead of lowercase.

3. The first entry of interconnects exceeds 80 columns in the extracted
example.

4. The labels camss and csiphy_ep0 are defined but never referenced in the
example.

In addition, dt-bindings/power/qcom-rpmpd.h is not used in the example, and
the node is named camss@ac65000 instead of the generic isp@ac65000 node
name. Could these be cleaned up in the example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev?part=3D2
