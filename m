Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735937;
	b=GSuuesg+iSXJC77Q/8ITTqgb2b+hxYYWdm834G4Avn5XZ/oJ+6Z4sSkSHf+d5sCeQI2F
	 fDfAFZAxQVjDhU8hN1gCP0h1WFN7RlnB6TDuSksUDSC7v4YXrruobYZaEhWBYfmsF4B2b
	 u2uW/1na7foXixOv3THeiHpZUCqwEr37PsscL9ZoxrG7T8qv3jmKbfvKHMTSV6vZ/VC/z
	 eDnOO2taUVG+99oKF4CJJSGXiW66DZBxQcfN3a3vk8VdhtAcvS26LNwYGX9PDk0JkVl1O
	 gE5OEH26xduQbNrjkrF5IJtFBCo8/5afqIJvshZVlNgl6K5qCR/QzbgVr42v3I46NvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735937;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8LO6gMYxE+TOLJg9c8n9D6wo/KLzB4ZidZCUlxWly20=;
	b=u9+7q3fQ23XhXtORlydrK+pywT08WBfkidy4s6Py42bOHsU5ddmx12TyM8QO8e8FHFSq
	 GdYhM6Ax8/nDdcjTA/UksXMzZJksXrVP3YRG0cGN7okIwDb0MsfhwedwGANMKOSuu6m2y
	 yhprCNkicNa6os/Ut7+QZ4+GFq/6JQk7ud2Js//dBsqiIzn/v2LM8St8Ov/s1XV79dbTD
	 PhuUWbbGljpBofJAPijFCxxPCepbcYdj/ct/FxWZ5KRLoEScRIuG3mJyUy7zCNN87ek4l
	 quHjNz2GCeI3T8xUcxBie3wIMpfakIRu1LDdMZySUmQt2QkaElALMBNvHrDCLwxGaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URbSJpQn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F53606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URbSJpQn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B771F00919;
	Tue,  3 Nov 2026 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735937;
	bh=8LO6gMYxE+TOLJg9c8n9D6wo/KLzB4ZidZCUlxWly20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URbSJpQnjmawPb7533+jRJ5zxJR1/ZWU9LZYeAWrOAFFe5zTcVWONMOgxm842cztY
	 5Y6wul2QT1PkZypQKOhBgTq0VqBLyK0nqpDhAbBfNMRWvJj9JVFtP/HI3dLZZyb614
	 iPaj5G9xqDr2M02tk0IXuqm+gfde2X1jt0t/3oKPkGwygzBd5G+rbzMsSLGu7RHdam
	 R7GpP2C3NaKyEh26TKTfj6FB0ODysegHzwm1TFzc0Hh77ggvEVtVngYleX1Gst3nTn
	 W7esIBzrNUkmDYZu8XCwYh17RBRJ3PqXP5u2Nkj0iVnJ5LFSCff07TTB7k7ZyYK/BB
	 unUTbAXe5mT0g==
Message-ID: <sashiko-outbox-195948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261103195007.9721-2-ansuelsmth@gmail.com>
References: <20261103195007.9721-1-ansuelsmth@gmail.com>
 <20261103195007.9721-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 19:58:56 +0000
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
- [Medium] dt-bindings: phy: airoha: Gen2 QPHY modeled as sub-PHY of Gen3 P=
HY
- [Medium] dt-bindings: phy: airoha: single 4-byte registers modeled as reg=
 blocks
--

commit e8f61fa61bb7ae6492d5b28847c5a694f3cca2ec
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY

This commit adds the Device Tree binding schema for the Airoha AN7583 Gen3
PCIe PHY, defining its register regions and QPHY phandle link.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen=
3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-=
phy.yaml
> new file mode 100644
> index 0000000000000..a8ec5ac781ccc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.y=
aml
> @@ -0,0 +1,65 @@

[ ... ]

> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: xr-dtime
> +      - const: rx-aeq
> +
> +  phys:
> +    items:
> +      - description: phandle to QPHY phy for Gen2 support
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - phys
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    phy@1fc7f000 {
> +        compatible =3D "airoha,an7583-pcie-gen3-phy";
> +        reg =3D <0x1fc7f000 0x1000>,
> +              <0x1fc7e000 0x1000>,
> +              <0x1fc30044 0x4>,
> +              <0x1fc35030 0x4>;
> +        reg-names =3D "g3-ana", "g3-pma",
> +                    "xr-dtime", "rx-aeq";

[Severity: Medium]
As reported by Krzysztof Kozlowski on v2 [1], should the reg and reg-names
properties describe the enclosing hardware register blocks rather than
mapping two individual 4-byte registers for xr-dtime (0x1fc30044, size 0x4)
and rx-aeq (0x1fc35030, size 0x4)?

In the companion driver header drivers/phy/airoha/phy-an7583-pcie-regs.h,
these regions are accessed at offset 0x0 via REG_PCIE_PEXTP_DIG_GLB44 and
REG_PCIE_PEXTP_DIG_LN_RX30:

    /* Stone Portrait XR DTIME */
    #define REG_PCIE_PEXTP_DIG_GLB44		0x0

    /* Stone Portrait RX AEQ */
    #define REG_PCIE_PEXTP_DIG_LN_RX30		0x0

Consistent with the MediaTek and Airoha PEXTP register layout in
drivers/phy/mediatek/phy-mtk-pcie-sphy.c and
drivers/phy/phy-airoha-pcie-regs.h, 0x1fc30044 is offset 0x44 within the
PEXTP_DIG_GLB block at 0x1fc30000, and 0x1fc35030 is offset 0x30 within the
PEXTP_DIG_LN_RX block at 0x1fc35000 (offset 0x5030 from 0x1fc30000).

Mapping only 4 bytes per register in the binding prevents accessing any
other registers in those PEXTP blocks without changing the binding ABI.

> +
> +        phys =3D <&pcie1_phy PHY_TYPE_PCIE>;

[Severity: Medium]
As reported by Rob Herring on v3 [2], why is the Gen2 QPHY linked as a
required phys property on the Gen3 PHY node instead of referencing both the
Gen2 and Gen3 PHYs from the PCIe host controller?

The commit message states that QPHY setup must be done in the PCIe PHY
setup and calibration phase or calibration might fail. However, looking at
an7583_pcie_phy_init() and an7583_pcie_phy_exit() in the companion driver
(drivers/phy/airoha/phy-an7583-pcie.c), there is no interleaved register
access or cross-calibration between the two PHYs:

    static int an7583_pcie_phy_init(struct phy *phy)
    {
        ...
        an7583_pcie_phy_init_default(pcie_phy);
        ...
        setbits(pcie_phy->g3_pma + REG_SS_DA_XPON_PWDB_0,
                G3_PMA_DA_XPON_CDR_PR_PWDB);

        ret =3D phy_init(pcie_phy->qp_phy);
        if (ret)
                return ret;

        msleep(PHY_HW_INIT_TIME_MS);

        return 0;
    }

    static int an7583_pcie_phy_exit(struct phy *phy)
    {
        ...
        ret =3D phy_exit(pcie_phy->qp_phy);
        if (ret)
                return ret;

        an7583_pcie_phy_deinit(pcie_phy);

        return 0;
    }

In addition, an7583_pcie_phy_probe() retrieves qp_phy using
devm_phy_optional_get() even though phys is marked required in this binding
schema. Could both PHYs be linked directly to the PCIe host controller
instead of nesting phys inside the Gen3 PHY binding?

[1] https://lore.kernel.org/r/20260831-elastic-turquoise-puma-f032fc@quoll
[2] https://lore.kernel.org/r/20260917215107.GA3884839-robh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103195007.9721=
-1-ansuelsmth@gmail.com?part=3D1
