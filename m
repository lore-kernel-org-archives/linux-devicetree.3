Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792526;
	b=cyP1Hxu+w8hg2WHksKdSmtsCcveMOvLCc4ysNpjcJgS68dNBIRC5sKyg4ebGXCyzxSL7
	 1CWm6XbQ5mIUbzko2T3c2ueEGkPL9mucts7fnWz6TDgA0mciyv6QeC7i3KHi0arm5hsTM
	 IyO3JCnQhRdlSPOTSjHD8zTk9yllh8v1swiRE9W3/o3BXFFAjzPeL7sTtUIU7vFS1eGTb
	 FrwvPUhL19/bv3uH1fkIsDMSifNnMzekL275nNRz/PTXZEMbpfF/ufDc6gK9i+gexlPhN
	 Xr9R3GUoYTwX2XGUXqwPfFWeiV2D4LV8qGGsnJYXZycM+cI++cLt+qENUuUdMc9ICHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hhie013VkcghD5MbCuEnnc6P6tF3QMuwBSxlDI673gs=;
	b=E4eNETZshL2hRqMcQm0/RHdNP+VeN7xnCH6YNxxUxJyKhvWGwRclB5vyR3uTOFIsfMLA
	 dkC9eLXU4isNjbQyn33a6LtKPgzDSFSEqRrAfdUccxtidWdr4p4hWkol1vk+XdGw4M+BP
	 xRAF+YBli3XyRPUg63IgDu2XIlp5YlO+uG7CKcr0Gh+otT0C4KyCQ3ijfqjN3vmPPXG2R
	 NUDSnCCDO/KRLsZabaAzYNuzw+IwvoY14x4f5p2sdyYNABEUzjmW0GuLU5mI0bc8Gylyf
	 vUend9FOqFgT0ehliw1TPfC3X3DCqwH1oSX/0bhujB2MPYP5CGPaG3gcttuCynlNZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvUCYAS+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F4606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvUCYAS+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800CA1F000C1;
	Fri, 27 Nov 2026 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792525;
	bh=hhie013VkcghD5MbCuEnnc6P6tF3QMuwBSxlDI673gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvUCYAS+45p283AfoW+4rnADlYDV2OF8tcjdrByLPMRKonLV/5QQwqG2o5/AV5c3P
	 s4ahQ3bZIHoBVCQyxmUy4K435ClVg2KGzm5LfwuMueSeSXLIT9xHsCmPwQXWVyyftG
	 CGKevlgNXG+LqRKAJ0xt80sghe8b9BdIsaBoIk54b8nRAtDtJU92msqIj2hCEpt9VR
	 GwBxgLCRRFtkf1/kd17jsaeGAdlzBmba+IFuApbAlSUAba6BsMkrPQNJgVVcDifO3J
	 1FG+iahqS+7tGP62TYgJlnJyAoxKSSj8sb+VmR2O+g9jYYljiCPHd5/I+q9Q/NbJR7
	 7YpkwLK6Zt3Gg==
Message-ID: <sashiko-outbox-237686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/10] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: bod@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-5-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
 <20261127-x1e-camss-csi2-phy-dtsi-v8-5-2793b8e5138c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:15:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: missing vdd-l5-supply for PM8010 ldo5 in
  regulators-8
- [Low] arm64: dts: qcom: undocumented and unused vreg_l7b_2p8 added to
  regulators-0
--

commit 0271545ba5bc95caf81fa08cab4ecc35f7923b14
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels=
 for IR and RGB camera

This commit adds the PM8010 RPMh regulator node (`regulators-8`) and
`vreg_l7b_2p8` to the Lenovo ThinkPad T14s devicetree to supply the IR and
RGB camera sensors.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 1536ad8d47933..e239ce1e3fdc3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -644,6 +644,13 @@ vreg_l6b_1p8: ldo6 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
> =20
> +		vreg_l7b_2p8: ldo7 {
> +			regulator-name =3D "vreg_l7b_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <2800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l8b_3p0: ldo8 {
>  			regulator-name =3D "vreg_l8b_3p0";
>  			regulator-min-microvolt =3D <3072000>;

[Severity: Low]
Is vreg_l7b_2p8 under regulators-0 (PM8550, pmic-id "b") intended to be
included here?

The commit message describes adding only the PM8010 camera PMIC rails
(vreg_l1m through vreg_l7m), and the T14s camera sensors use vreg_l5m_2p8
and vreg_l7m_2p8 for their 2.8V supplies, leaving vreg_l7b_2p8 unused in
the T14s devicetrees.

> @@ -887,6 +894,58 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;

[ ... ]

> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

[Severity: Medium]
Should regulators-8 also declare vdd-l5-supply for ldo5?

In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data[] defines
ldo5 with supply_name "vdd-l5".  Without vdd-l5-supply on regulators-8,
regulator_resolve_supply() falls back to the dummy regulator for
vreg_l5m_2p8 and will not enable or keep its upstream parent rail active
when the IR camera sensor powers on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-x1e-camss-=
csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org?part=3D5
