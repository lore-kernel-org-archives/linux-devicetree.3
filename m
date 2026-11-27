Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793245;
	b=es73wdQRSKL+Gt/aiR4yPNWmr4522mRQLGhE1eCYGIBChhWGgfbTi+g0JSeBbNDeswK4
	 nR5U5+fs4nzlRWZebBuhBi1Ja97qmdtqgfUVUYE3ImTc+bTK68kWiBan0RRTdfOFkh9yo
	 rmG6eg3TODPL1FkdJ/jcfDzeKZcGQ3MnmnIvtwZ2Q74A//Ain/fF4m2hjhIT2ETWVNGep
	 7epcPRr/nSt0v/YsnCpfkXtrqf86J7aiA6OBbpFUBhxSGl9LiICVtHX6r6eB1Zq/Gzb88
	 VzzpLI880DyXBaAOqFx1JkW6t7Px9dBIFa41JSB4BWE9ClQL9ILIImgDyUKBkl0N8/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793245;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k9f1LZ9c3/0MrBy7BXuv/sf6FmxnBB5G7dbRTVhGKyw=;
	b=b/kOROV5WfawHBjjkJqLboFZ4w4WfwUh48kNzdLpGEOQNDuWonP/xGxDdegio2LNhN1M
	 PIJEZR9UHZNUA8dzGmKuFiF54xuswxYpaNRRVbRM7lR24kUperyl0sb76FfVh6rUheXF6
	 2Mr0sjPdDobgHNU3wAVRe32vsqFxQYUXAPxCZjjUC2IKcjyvCBqGZU+ezUZq3PjCIEXJ+
	 YQMrpMRNR/jm36yH4poZ4sBjEtenX7NuHFc8Fcx59VliiuKgk5fENvzJd3K8E47bYRpHh
	 qTitWgxpP9qaPBqfWUG1CHSCrBNfbIm50YW0P2JDvjze1o26R44M1z4oWsVXJ86AMwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VS1Wt4cU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2F606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VS1Wt4cU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA86C1F0089A;
	Fri, 27 Nov 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793245;
	bh=k9f1LZ9c3/0MrBy7BXuv/sf6FmxnBB5G7dbRTVhGKyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VS1Wt4cU9lZ98qtL4iGw+1IERrE+b0oDiMOI2ACRznEomOiWCNhXdIb94Z4D4RXOP
	 zcUpKCI5kyDZmTPCgdFXa/MgpXbY4FnRR0ejaRoVLO32xQEgTy8JG1+B8Vq8vmR/oe
	 ZHXvnJeS7/4BzMLPkIpkTryYpCkaoxwD33kkYjBtBV3aDeeyMFLZgz5SSQoO5HHPxg
	 Xx1vRe3eyBXEKmGoOuOUL+sOY07gBtsFdI95gDFXfLfXU2faofa1mSBrK3pbqDjDL5
	 HWE9Mtkm12a0+tJeNrUeqnwwv1i17upZPAy6lX6jJYVO7KBW3Km7C60aRLrbGc876G
	 Gc1P435bLhM5Q==
Message-ID: <sashiko-outbox-237727@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/10] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: bod@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-7-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
 <20261127-x1e-camss-csi2-phy-dtsi-v8-7-2793b8e5138c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:27:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: missing vdd-l5-supply for ldo5 in slim7x
  regulators-8
--

commit 43497044580deaa94f2286bd0fc62dfadd7e9b82
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with =
voltage levels for IR and RGB camera

This commit adds the regulators-8 PM8010 RPMh regulator node with LDO1-LDO5
and LDO7 supplies for the cameras on the Lenovo Yoga Slim 7x.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index a807744d1750b..5ce1a7755c97b 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
> +
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name =3D "vreg_l2m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

[Severity: Medium]
Should regulators-8 also specify vdd-l5-supply (e.g. <&vreg_bob1>) for ldo5?

In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data[] defines ldo5
with its supply_name set to "vdd-l5". Without vdd-l5-supply on regulators-8,
regulator_resolve_supply() falls back to the dummy regulator, so enabling
vreg_l5m_2p8 will not enable or vote on its parent supply.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-x1e-camss-=
csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org?part=3D7
