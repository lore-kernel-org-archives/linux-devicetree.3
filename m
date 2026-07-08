Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67D13B7A3
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472046; cv=none; b=I9nJXbHMbQdFoItu/KjCDlDjJZEC74qmEuYLvVX3qxNbc7JlyhynyA59ws2VgfK641AS21bsgoZsLkcJcBXKEKjp296q+ipI8feFxHBIq2TxEDfNJTazndWVniKyThaPMTs8qXja24KV+6AUbWZcnGEp92dpryL00G9ewZ0Iu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472046; c=relaxed/simple;
	bh=PLdzjuExrl6xGu+/nWsq1vld4NojAN6ZDV6qtmCGBCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZn6/GMWdULyg5SQ4uL/xuUDHxkFb6tVRmWTH9IQXEmoQi3Cd0BMYipZyVIs1pjzxIvpIpYC7dpBMHWMKk8YrZweZoEpFHQRKQ9iqbIxIKMKMPJOAbPmOZCMyFdMf3IkA5H5g+TJcrOeYC3kQhjx3hB5hyi8Hyy4Lr7RpS7hXS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH4bdPfW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH4bdPfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D941F00A3A;
	Wed,  8 Jul 2026 00:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472045;
	bh=R6PVu+9RE0D4pjpNcGqjAiVMgc5FQ9xA5+tAZGtOe5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XH4bdPfW/BoyDEQJ9AsUeSpmM/71u6oBUESJ/pYJV5Pe8QMaRxlHJNx76x/k/qP8r
	 25hGNgc93/VFBnQ540BGXns41nfTyxBBzBQysHUnBFrMAsdGE+cHJoqw6PjhuMoiBk
	 HCsb+vCoLqH7B4k8MTPbs9YkReUqnVVc/HbxU5Ko4NBbCXo/zlPK2r4GRgFGJ2lvEK
	 1OQSgYPAApWxooD5SsnKLA3GFL6hZJHad9kNjcaXCVotqG5eecSmwV+vn2gGpqUB8R
	 hS1uQtTQIkqypOoRz5CqK6X72HEr8pCtjDOHWFG2bgaHCfs9o/Qvtb+1sjX+XVDs2O
	 0bgX/1PEQMLMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-8-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-8-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:54:04 +0000
Message-Id: <20260708005405.03D941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree node for PM8010 regulators (`regulators-8`) defi=
nes `vreg_l5m_2p8` (LDO5) but is missing its required parent supply `vdd-l5=
-supply`.
--

--- Patch [8]: [PATCH v4 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim=
7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera ---
commit 95ca7f61e80f17280293495eaba4ba301dc9a920
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with =
voltage levels for IR and RGB camera

Add voltage regulators-8 for Camera on slim7x including vreg_l1m_1p2 and
vreg_l3m_1p8.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0c..0a8275d501f85 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
[ ... ]
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;

[Severity: Medium]
Is vdd-l5-supply missing from this list of parent supplies?

Later in this node, vreg_l5m_2p8 is defined as ldo5, but its parent supply
dependency is not modeled here. Because vdd-l5-supply is omitted, the
regulator core will use a dummy regulator for ldo5.

If the unmodeled parent supply (which might be vreg_bob1 given the 2.8V
output) enters a low power state or is turned off by other consumers, could
ldo5 silently lose power and cause the dependent camera hardware to fail?

> +
[ ... ]
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-x1e-camss-=
csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org?part=3D8
