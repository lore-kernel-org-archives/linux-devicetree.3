Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBF429014
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651912; cv=none; b=KapO0qSl+g3dT54AjWeYVfjPriKquNr0m7XPLFsrQq4+/tyMPJHO16wbDKt7pAlizZ2l5dv6UEsq92fXLjF72Fx+SVI+g7AGVrstHT1HK3vgWSPE0qCHveT1mdoiE/RvdU2MqM70hcOoE88jllck3Xbmx8NHTF+4ENaQuLKNi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651912; c=relaxed/simple;
	bh=Jkh56OqcIimxzCzZEPhXx0b9Krzf1FVe4frArPxz9DU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJQ+PaB7uIyJffYC2Y+Sqy3UGi88jrNLa9PlB2O+SlGQFo7n2zGS4GxHPMV0JuECnL9RlDRh3RSLgMTqRpqjyLAr4720LvwQiheH/YgCLdF0wLRhlFbE/k4IUW5lmd/Km9kgw2lZdnGT5N9cGw0cImlZiHJi300bxKDZaG3weHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIcisMlG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIcisMlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440661F000FF;
	Thu, 17 Sep 2026 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651905;
	bh=6hPPpvb9simn7E5d38wbXojvKSgtshYY0R0jP6lUiiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IIcisMlGEuy1ScS+DoJFJ+6LPyn/eD9ZgdaEA4H5uLn1+p+xuppzWG21PRJb1pruF
	 vTjvQ5pFGE8PsNaeHLhLCQei0qd6anTD8pteouKIsLkoDGtrW9YqgJBAaUD/HNTV8t
	 3N+FfUCk2LwGkBdI71quSYdNyeFtel8l3nmqLU7giQKQsKOlBuka8KTyBcBdoum5sJ
	 F0ZTAtAplothUt0MMUqFEiewC5IgCck/Nkn8lABbnZbs5Ik5VfP/CwuOqN/WU5HDMF
	 mS2WJJatxNoNNfvpk/I8pLjeXP2LL7eyLM2pI0kY2RQMxE1f3tFmND6A62VGv+1UsS
	 eEf+3Ce2/qM1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/12] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-9-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-9-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:31:44 +0000
Message-Id: <20260917133145.440661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing vdd-l5-supply for vreg_l5m_2p8 regulator
--

commit 05a1506413b390bab147d74fe91fcbf51d7854fc
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with =
voltage levels for IR and RGB camera

This commit adds the pm8010 camera PMIC regulators to the Lenovo Slim 7x
device tree. It introduces regulators-8 for the camera, defining voltage
levels for the IR and RGB cameras.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index 9eb2dfd99f20d..f4064e09d6231 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
[ ... ]
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;

[Severity: Medium]
Is there a missing vdd-l5-supply property for the vreg_l5m_2p8 regulator
here?

The vdd-l5-supply is omitted in regulators-8, but ldo5 is instantiated
further down in this node. Without this supply, the regulator framework
cannot construct the proper power dependency topology. This means the parent
supply will not be implicitly enabled or correctly reference-counted if a
consumer requests vreg_l5m_2p8.

Since there is currently no consumer for vreg_l5m_2p8 introduced in this
series, this issue will only manifest if a future driver attempts to enable
this regulator.

> +
[ ... ]
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D9
