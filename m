Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082716;
	b=VUYHXX4iChwZb1RH6S2/3niQB5J89C8bnRpGGxJPD8ZoHsJwVYP7USN5ft3f550+FX/P
	 82nryRf/5zqat2q51zIC4VjnJKtEaSvToRnvS0dJukkKR1e/7le1qYk4kG2mb/g4WcjaR
	 +UlDKVnkEmPht6NNRqYxegaIJ9icTxdEzbaB/rRN7G7snDVi2mTjCHvK3tgD3NX6PmkWX
	 1G6rlR6qEgBPfa1tAWV1Su3E0adWY2olN/FdjH7x5h5epdWJ2ojIKC7qo2C719klbZ80w
	 kprfnaK/d7kNXE/XT6JS4Y9hKsCI6ztRFMgZO52hOQJblb+4DFsXT8ARiQsPEvL5x2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fZu+jAojDyqkl6I/1YdJ6WLyMmw0Si/fnB0PEamsP+g=;
	b=gTp+YNOEvaZZy/ArABo9DvMx/P50GJFUkODSnlDFcpZByghhBfeuu2Y2MhVv/zQ2ggSA
	 5pia6tlRRMJL/NMCu6GDVDrZyIetpjidBycOQpTI+na7pxxctE+WJ6KaCcvc5zzTpMk+5
	 Ry9/uuoEQAMymD5+wwFe4eKaI9s819S3ZVYxfKt7ELMdtVDWv5EeJb/nNVmF+YnfsuweI
	 /sl5/XZKzZzdvTO3N398vOM+2E7DN/4Xk3M5Wj1WtOgnVPOVsPLS3Ym7Tp5uIQWeeUcTk
	 KrY0ZhZ+YtYlv2NZVospoTySh+JJtrxUoNpXAKdKgQHl7TzLV0N14hQ8D2dSmG1uStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUvvWxVP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B2606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUvvWxVP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005E21F000C6;
	Thu, 19 Nov 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082716;
	bh=fZu+jAojDyqkl6I/1YdJ6WLyMmw0Si/fnB0PEamsP+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUvvWxVPBj+QXtiYC7MzF9Fhl/v9akCrvhCGHizRd9trEt8R8s+SGusU/aT0S/DKh
	 0NRxmdQmcABYYuG/Ry9WNInErL/K5zwroTTutnFahq6EarXtoMw8BD36MJ/fFR6Xy2
	 wg7zWa5YQ28QWRNbLsM9qQKN/VNiI2APhjqOVgpJBdxC4U6kQQX/ZSYBwqkjuj8MEV
	 mc73JmyO/ueAzCFjCMD0PtFcJp4aMMk18dRnTAVpameJ3T1b9IZR4e/1LhooNkg0Zl
	 kXDg/ajGOtn/I19uNQb8XgkL9sVeJeZLD2aJUbHyAAE2sKesBnnt81SUKqTEhA8NyL
	 pK0mMk7EC7bCg==
Message-ID: <sashiko-outbox-222909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-sa8255p-emac-dts-v3-2-e2c365d95a0b@oss.qualcomm.com>
References: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
 <20261118-sa8255p-emac-dts-v3-2-e2c365d95a0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:05:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] arm64: dts: qcom: lemans-sa8255p-ride: non-compliant MDIO PHY
  nodes
- [Low] arm64: dts: qcom: lemans-sa8255p-ride: out-of-order serdes label
  nodes
- [Low] arm64: dts: qcom: lemans-sa8255p-ride: invalid snps,ps-speed =3D
  <2500>
--

commit 15bc324c5c1543ac7a9409abaa0230b88cd074cf
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

This commit adds the ethernet and serdes PHY nodes for the gearvm variant
of the Lemans SA8255P Ride board and enables the corresponding SCMI nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm6=
4/boot/dts/qcom/lemans-sa8255p-ride.dts
> index 6f19064997a4b..991626589cc34 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
[ ... ]
> @@ -101,6 +103,173 @@ trip1 {
>  	};
>  };
> =20
> +&ethernet0 {
> +	phy-handle =3D <&hsgmii_phy0>;
> +	phy-mode =3D "2500base-x";
> +
> +	pinctrl-0 =3D <&ethernet0_default>;
> +	pinctrl-names =3D "default";
> +
> +	snps,mtl-rx-config =3D <&mtl_rx_setup>;
> +	snps,mtl-tx-config =3D <&mtl_tx_setup>;
> +	snps,ps-speed =3D <2500>;

[Severity: Low]
Should snps,ps-speed =3D <2500> be dropped from both ethernet0 and
ethernet1?

stmmac_check_pcs_mode() only uses snps,ps-speed for MAC-to-MAC SGMII links
and only accepts 10, 100, or 1000, whereas both nodes here use external
PHYs with phy-mode =3D "2500base-x".

> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hsgmii_phy0: phy@8 {
> +			compatible =3D "ethernet-phy-id31c3.1c33";
> +			reg =3D <0x8>;
> +			device_type =3D "ethernet-phy";
> +			resets =3D <&scmi7_rst 0>;
> +			reset-names =3D "phy";
> +			reset-assert-us =3D <11000>;
> +			reset-deassert-us =3D <70000>;
> +		};
> +
> +		hsgmii_phy1: phy@0 {
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
Should these MDIO child nodes be named ethernet-phy@0 and ethernet-phy@8?

Documentation/devicetree/bindings/net/ethernet-phy.yaml selects nodes
matching ^ethernet-phy(@[a-f0-9]+)?$, while snps,dwmac.yaml references
mdio.yaml with unevaluatedProperties: false, so naming them phy@8 and
phy@0 leaves compatible, resets, and reset-names unevaluated during
dtbs_check.

Also, device_type =3D "ethernet-phy" is deprecated and rejected by dtschema,
and unit address 0 should be ordered before unit address 8.

[ ... ]

> @@ -205,6 +398,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
>  	};
>  };
> =20
> +&serdes0 {
> +	status =3D "okay";
> +};
> +
> +&serdes1 {
> +	status =3D "okay";
> +};

[Severity: Low]
This isn't a bug, but &serdes0 and &serdes1 are placed after &tlmm instead
of in alphabetical order between &scmi23 and &sleep_clk.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-sa8255p-em=
ac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com?part=3D2
