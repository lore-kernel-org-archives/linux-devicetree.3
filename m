Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397477;
	b=052sZN/lhaUVLSrvysdSj4PoU7frwnbPCYvjSkoiEQ146S7fBWTXCnWmu/szhbwD8yw+
	 wSHaNHPQbhiMqTCCH3GGcV5+MPL1eu/xgWEA+GiZZsSrgbalYTHzxSARY99ZsQFl0iyQt
	 wC6m2+v9/4VdvrsJXmUG7GMm5hjg7aHCsmKaUquXY+d9d5YvZlHzhx/OCP+v9o/IjRWts
	 +enBIVHZ20ECzmyx6yEu+kl2ZIXlMATfSWnEZqDYLXpGChFQZaDbHJ3kEde8qf1XZ3QhN
	 Voph1j5lT3Ky484Fb5br4RNrZLWLNGLbRFb1Xf8r1bJGZYDW4wHyUTWzakMihs0Wstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YJVdS3+lHtbrS3kodDgKvpZML9moom6D07Q8dm2HCCc=;
	b=OdmrP/aFCsNHX5X4nzTdfD36RzGB2bntsr+mRAJIGW7kVMBniFxbTm23Rr/JU7X+7eDQ
	 Y6LZrITS/0d8gh+63MdRo0ADJ3oukw+mCkOfJnzbxzUst6TUDSxtRHim5lM69rMjSbSyE
	 lVxgjA82jrA7B3LfuaWiHcrGbMzAdvmJdrgbPU9q6MuckCXucgpnV+nTSYzKNR9sQlBiI
	 6nQ8wrfWyWg7uPkOZlL9wWUAkvCbyswK5yHCo2fDU96S0kzN1lTCx2LjWY79BoVTwbG3n
	 vf1FhFBVKcj2VKB34Plae64BTJl6LszBAN3QnOtAG4QZicykauDuo8nj+9b3pRLAh1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdFgEvqe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CF606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdFgEvqe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A531D1F000C6;
	Mon, 23 Nov 2026 01:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397476;
	bh=YJVdS3+lHtbrS3kodDgKvpZML9moom6D07Q8dm2HCCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HdFgEvqecnLfR29G4tH/2KmlKl4VuZiP+/CTS+F2mlJFyAzbZUohQ4cbg9T1rXHh9
	 NxZ1JOiL3ju2u3Ly1UkPUqiO8gl1EzQy/AXbcFXAPoNkLgh7f0aO4lnYAbwrK4Acm5
	 M0gMm1JYW2LyMNgwP8efUw0ZFTQxtDNoNPquLuo6Xa9ZbWMx7uiz8O3GInclV71hQV
	 VR6IQTbO5l2OJUIXMfQFUOeG7UrIHL3h787tkeSH9Zd1uUMdPZr+LuKT+D+yDP1zCY
	 ULn/2Wm4HXl1qRPde8FFZS7sOmBFktHRm9hjPVu8aG1BZ07S35qa0bDN4cr2t7UBoe
	 1tFQ7EXeR+cUQ==
Message-ID: <sashiko-outbox-228518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: Enable front and
 back camera
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123-op6-upstream-cameras-v1-3-234fb3b7bb18@ixit.cz>
References: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
 <20261123-op6-upstream-cameras-v1-3-234fb3b7bb18@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:31:15 +0000
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
- [Low] arm64: dts: qcom: regulator GPIO pinctrl placed on camera sensor
  nodes
--

commit 255c3e91ccc8d6209496c3a95ff032200871681d
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-oneplus: Enable front and back camera

This commit adds Devicetree nodes, regulators, and pinctrl configurations
to enable the front (Sony IMX371) and rear (Sony IMX376k) cameras on
OnePlus 6 and 6T.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 1df09da3c4d71..92317f23bdd15 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi

[ ... ]

> @@ -961,6 +1108,98 @@ &usb_1_hsphy {
>  &tlmm {
>  	gpio-reserved-ranges =3D <0 4>, <81 4>;
> =20
> +	sub_cam_default: sub-cam-default-state {
> +		rst-pins {
> +			pins =3D "gpio23";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		ana-pins {
> +			pins =3D "gpio78";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		dig-pins {
> +			pins =3D "gpio79";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +	};
> +
> +	sub_cam_sleep: sub-cam-sleep-state {
> +		rst-pins {
> +			pins =3D "gpio23";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		ana-pins {
> +			pins =3D "gpio78";
> +			function =3D "gpio";
> +			bias-pull-down;
> +			drive-strength =3D <2>;
> +		};
> +
> +		dig-pins {
> +			pins =3D "gpio79";
> +			function =3D "gpio";
> +			bias-pull-down;
> +			drive-strength =3D <2>;
> +		};
> +	};
> +
> +	front_cam_default: front-cam-default-state {
> +		rst-pins {
> +			pins =3D "gpio9";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		ana-pins {
> +			pins =3D "gpio104";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		dig-pins {
> +			pins =3D "gpio117";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +	};
> +
> +	front_cam_sleep: front-cam-sleep-state {
> +		rst-pins {
> +			pins =3D "gpio9";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <2>;
> +		};
> +
> +		ana-pins {
> +			pins =3D "gpio104";
> +			function =3D "gpio";
> +			bias-pull-down;
> +			drive-strength =3D <2>;
> +		};
> +
> +		dig-pins {
> +			pins =3D "gpio117";
> +			function =3D "gpio";
> +			bias-pull-down;
> +			drive-strength =3D <2>;
> +		};
> +	};

[Severity: Low]
Should the pinctrl states for gpio78, gpio79, gpio104, and gpio117 be
attached to sub_cam_vana, sub_cam_vdig, front_cam_vana, and
front_cam_vdig instead of the sub_cam and front_cam sensor nodes?

Because the regulator-fixed nodes own those enable GPIOs and have no
pinctrl-0 properties, reg_fixed_voltage_probe() requests and drives the
pins before the CCI I2C camera sensors probe (or leaves them unconfigured
when the mipi-ccs driver is not bound).  Splitting the regulator pinconf
into separate states on the regulator nodes would also match
panel_vci_3v3 and panel_vddi_poc_1p8 earlier in this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-op6-upstre=
am-cameras-v1-0-234fb3b7bb18@ixit.cz?part=3D3
