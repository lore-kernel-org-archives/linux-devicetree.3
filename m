Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788936;
	b=NpDykSebAjXde6Yp53Z4Egl4D0e7UffIeZ7GmmBCDUpWWB6A3E8uAm87JhI1RfqygvJ4
	 CDAlu/GKPLP3DV++hCaLnf/ehT/G3AULl8jrS8bj7fmgMwWKFd2wqBRLpHCz9UYydqC+e
	 Ux88JxW0HT9JXqWS92wF7CnfLvyFWSkRWzDXgH5HfKVJufbBF8xGDjXqIPLqAX8f42YPz
	 mu0vOwuBEHdUhPNU862Ux42Fzjc4T4U8kdxwfufRJ6nvzxS7Ted7/+ThGcVOVgeBFoFoC
	 4HZqC6H+6R/N69pop0dVyl+ujfnoKH//N8R6dofExiGF+TnWIuwzRCLMZf65tb33Vaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XcxeTKpuNX8kxjdTrHpVqZ+9BXhL1ipReN914ooOtpo=;
	b=O0/URg+AAG+z54i1HPI7iYqXeg5xm/0Dnu5o+09db/amTVPW83ySxdg1a/0TxAh2b3VP
	 mNU92pIsL0RrzyOKwQwFUPaPgwurCacaUq++T5s9gyUi9JkP3U9C3+JKdmIjpSSYbwyeQ
	 cYC/tqsmnpK6qrCDpPHDhXMpyWNwjc0+A0q/fKIvElYhpYgjgzf/JR8OPWoibjnXdS+27
	 3G536/6cDKLpH2HjQaDkupmbXH4rzfwWprEfSEXLE+03rUnWe5bInz9YNXaxkx7Kyrmht
	 dUCgbh9FhUe/Ay/tSPQ97MbyIDk71nLDFxR6a0/JUbisCEzUfpJQZA9uNtwVbZb71BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxcQOpWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628C606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxcQOpWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D999A1F000C1;
	Wed,  4 Nov 2026 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788936;
	bh=XcxeTKpuNX8kxjdTrHpVqZ+9BXhL1ipReN914ooOtpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dxcQOpWgcMlRhGsECuibOHMZa8HK9K3umNaW9REy1TnteJpkIIkk2d0Yh/1u8AneT
	 r6qkIiFqD3mwbBivpkSAn4yOiHROKWoeQohzSuR0GngZRSyJWEOAdrRWUFAKIVYgDr
	 H/GIJ+htWfFZe2V8LbwHzKRjcgfatK5zYnLyIkthZEWFhn9FtacpuN8YrCPPsUCVca
	 w98v++2yqA/+KpEDwkZSQWaMJz00FSOOk3A3NphrvNK0Q5MHH2taNwtr+rMca7eKzQ
	 ttGw+g25t3Nd/4DYJs44kctECkSTUkUFi8VoUIc9ez0Lt0ShiIuq15aEO6jphIVKZG
	 6w3wmKx4vIQAQ==
Message-ID: <sashiko-outbox-197114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
 <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:42:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: lemans-gearvm: missing SCMI power-domains on ethe=
rnet nodes
- [Low] arm64: dts: qcom: lemans-sa8255p-ride: non-compliant MDIO PHY nodes
- [Low] arm64: dts: qcom: lemans-sa8255p: out-of-order soc and serdes nodes
- [Low] arm64: dts: qcom: lemans-sa8255p-ride: invalid snps,ps-speed =3D <2=
500>
--

commit 81e11e3cdbf7c26506804bb78d74a7572b18ad5a
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

This commit adds the ethernet0 and ethernet1 nodes along with their serdes =
PHY
nodes for the gearvm variant of the lemans SA8255P Ride board, and enables
scmi7 and scmi8 to serve the EMACs.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans-gearvm.dtsi
> index 91c97a55f2787..96a54f32f0eeb 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,18 @@ &cpufreq_hw {
>  	clock-names =3D "xo", "alternate";
>  };
> =20
> +&ethernet0 {
> +	compatible =3D "qcom,sa8255p-ethqos";
> +	phys =3D <&serdes0>;
> +	phy-names =3D "serdes";
> +};
> +
> +&ethernet1 {
> +	compatible =3D "qcom,sa8255p-ethqos";
> +	phys =3D <&serdes1>;
> +	phy-names =3D "serdes";
> +};

[Severity: Low]
Should power-domains and power-domain-names for ethernet0 and ethernet1 be
placed here in arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi rather than in
arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts?

Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml marks both
power-domains and power-domain-names as required properties when compatible=
 is
set to qcom,sa8255p-ethqos.

Because scmi7_pd and scmi8_pd are defined in lemans-gearvm.dtsi, and all ot=
her
peripherals in lemans-gearvm.dtsi (including serdes0, serdes1, and ufs_mem_=
hc,
as well as ethernet0 and ethernet1 in lemans-embedded.dtsi) define their
SoC/VM power-domains in the DTSI file, any other board DTS including
lemans-gearvm.dtsi without duplicating those properties would fail devicetr=
ee
schema validation.

[ ... ]

> @@ -3218,6 +3230,24 @@ &uart21 {
>  			     "perf";
>  };
> =20
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg =3D <0x0 0x08901000 0x0 0xe10>;
> +		#phy-cells =3D <0>;
> +		power-domains =3D <&scmi7_dvfs 0>;
> +		status =3D "disabled";
> +	};
> +
> +	serdes1: phy@8902000 {
> +		compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg =3D <0x0 0x08902000 0x0 0xe10>;
> +		#phy-cells =3D <0>;
> +		power-domains =3D <&scmi8_dvfs 0>;
> +		status =3D "disabled";
> +	};
> +};

[Severity: Low]
This isn't a bug, but both arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi and
arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts sort top-level label
references alphabetically.

In lemans-gearvm.dtsi, &soc is placed after &uart21 instead of between &scm
and &spi0, and status =3D "disabled" in serdes0 and serdes1 is missing a
preceding blank line. Similarly, in lemans-sa8255p-ride.dts, &serdes0 and
&serdes1 are placed after &tlmm instead of between &scmi23 and &sleep_clk.
Could these nodes be moved into alphabetical order?

> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm6=
4/boot/dts/qcom/lemans-sa8255p-ride.dts
> index 6f19064997a4b..2b3c9e90802bf 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

[ ... ]

> @@ -101,6 +103,179 @@ trip1 {
>  	};
>  };
> =20
> +&ethernet0 {
> +	phy-handle =3D <&sgmii_phy0>;
> +	phy-mode =3D "2500base-x";
> +
> +	pinctrl-0 =3D <&ethernet0_default>;
> +	pinctrl-names =3D "default";
> +
> +	snps,mtl-rx-config =3D <&mtl_rx_setup>;
> +	snps,mtl-tx-config =3D <&mtl_tx_setup>;
> +	snps,ps-speed =3D <2500>;

[Severity: Low]
Is snps,ps-speed =3D <2500> on ethernet0 and ethernet1 intended here?

In drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c,
stmmac_probe_config_dt() parses snps,ps-speed into plat->mac_port_sel_speed,
which is only consumed by stmmac_check_pcs_mode() in
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:

    static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
    {
        int interface =3D priv->plat->interface;

        if (priv->dma_cap.pcs) {
            if ((interface =3D=3D PHY_INTERFACE_MODE_RGMII) ||
                (interface =3D=3D PHY_INTERFACE_MODE_RGMII_ID) ||
                (interface =3D=3D PHY_INTERFACE_MODE_RGMII_RXID) ||
                (interface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)) {
                netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
                priv->hw->pcs =3D STMMAC_PCS_RGMII;
            } else if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
                netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
                priv->hw->pcs =3D STMMAC_PCS_SGMII;
            }
        }
    }

When evaluated, stmmac_check_pcs_mode() only checks PHY_INTERFACE_MODE_SGMII
and only accepts speeds of 10, 100, or 1000. Because ethernet0 and ethernet1
use external PHYs with phy-mode =3D "2500base-x", snps,ps-speed =3D <2500> =
is
unused and specifies an unsupported speed value. Should snps,ps-speed be
dropped from both ethernet0 and ethernet1?

> +
> +	power-domains =3D <&scmi7_pd 0>, <&scmi7_pd 1>;
> +	power-domain-names =3D "core", "mdio";
> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		sgmii_phy0: phy@8 {
> +			compatible =3D "ethernet-phy-id31c3.1c33";
> +			reg =3D <0x8>;
> +			device_type =3D "ethernet-phy";
> +			resets =3D <&scmi7_rst 0>;
> +			reset-names =3D "phy";
> +			reset-assert-us =3D <11000>;
> +			reset-deassert-us =3D <70000>;
> +		};
> +
> +		sgmii_phy1: phy@0 {
> +			compatible =3D "ethernet-phy-id31c3.1c33";
> +			reg =3D <0x0>;
> +			device_type =3D "ethernet-phy";
> +			resets =3D <&scmi8_rst 0>;
> +			reset-names =3D "phy";
> +			reset-assert-us =3D <11000>;
> +			reset-deassert-us =3D <70000>;
> +		};
> +	};

[Severity: Low]
Will sgmii_phy0 and sgmii_phy1 under ethernet0->mdio pass make dtbs_check w=
ith
this node naming and property set?

Documentation/devicetree/bindings/net/ethernet-phy.yaml selects Ethernet PHY
nodes via the nodename pattern ^ethernet-phy(@[a-f0-9]+)?$, while
Documentation/devicetree/bindings/net/snps,dwmac.yaml references mdio.yaml#
with unevaluatedProperties: false. Naming the child nodes phy@8 and phy@0
prevents ethernet-phy.yaml from matching them, leaving compatible, resets, =
and
reset-names unevaluated against mdio.yaml.

In addition, both nodes include the deprecated pre-FDT property
device_type =3D "ethernet-phy" (which is not allowed by dtschema and is not
needed by of_mdiobus_child_is_phy() in drivers/net/mdio/of_mdio.c), and unit
address 8 is placed before unit address 0.

Should these be renamed to ethernet-phy@0 and ethernet-phy@8, ordered by
ascending unit address, and have device_type =3D "ethernet-phy" removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-sa8255p-em=
ac-dts-v2-0-05f9355df966@oss.qualcomm.com?part=3D2
