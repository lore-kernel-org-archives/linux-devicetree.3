Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE9387348
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643090; cv=none; b=Ie667zWjqKBwm1eHe3FJ0asEKaHpkvgvnF+yNQMXVD3UqS/RjxukPZcdydRTAH3hoq7E0Y98kz3P4vmZ3dfrXKPeVJjaSCc4+cREN91xow7iUZ54CMEI8JJgh2ELXTIZprcD26Eu7SSUA5lqBna7fbT5JKiZEww/8KWQeVNUVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643090; c=relaxed/simple;
	bh=q8VOQ7oUZPcfIZfT6zDxS3pe/PuZXn9dmvjBDX5RWGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eeWP8VW/wA2bZ5TpO0N/S/p2v1bO7QP1mLNoDcDh0u+MrDyBQhxbaLaF3XeDWq//Uc1YkgvSZJqz9d53/m2lHvpEnyqBj9hELh5spYjy5WUnMJkMSOObhZk+ikjREL9QrlIijho6T7NvjIU1A4zLAo32BdEHkxJgD/z6xaeYtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUC83wpd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUC83wpd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1521F00A3A;
	Thu, 13 Aug 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786643088;
	bh=J8jgK7VlW3b/kDKMTgqOwHRvubR21v58oJU1a4mgTm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DUC83wpdj/ZfM9PQvPF4jUnb/JXhke82aYas2EPdQpGPO3Y/1Sp0mntlhpyQ0eGLF
	 V9/DsrFhj2PmeXL4UaeQZh5FxQrpDfpKs1A/v9kYeRY+S+kBgvwcwHhvw8nKCocdUY
	 nQ9fnaQ2MIGID9eNKKrmmXAb7KJMJs3oHkHtnWL4E1IQ3aogOM6eTVKXWZphOV0YZg
	 dImj/8nOaGp5/RPTsK6JbiDIUmNlEzXESS7yPIjzywWTWmVXO/OTH+TZWdRJj37Tgg
	 4c86q24K5AQB/Wd7eklVczPvDaJBmR7k51sxi5fgxHZTXxdl2miVbFjdq3fvALzTNI
	 fYzIRXzBlEK+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 17:44:47 +0000
Message-Id: <20260813174448.1B1521F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing driver support for compatible strings 'boe,dv215fhm-r01'=
 and 'lontium,lt9211c'.
--

--- Patch [1]: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS displa=
y overlay ---
commit 982b78f0ee343a881d363b06b3c257a529f0e73b
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add LVDS display overlay

This commit adds a device tree overlay for the Lemans EVK IFP mezzanine to
support LVDS display output. It wires up the Lontium LT9211C DSI-to-LVDS
bridge and a BOE dv215fhm-r01 LVDS panel.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..82b6eeddbb8b0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
[ ... ]
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Lemans EVK LVDS";
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: Medium]
Will this panel successfully probe? It looks like the compatible string
"boe,dv215fhm-r01" does not exist in the kernel tree's match tables (e.g.,
in panel-simple.c), and there is no generic fallback compatible string
provided here.=20

Does the panel driver need to be updated upstream first, or should this node
include a fallback like "panel-lvds" along with explicit DT timings so the
generic driver can bind to it?

> +		power-supply =3D <&lcd_disp_bias>;
> +
> +		status =3D "okay";
[ ... ]
> +&i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qup_i2c1_default>;
> +
> +	status =3D "okay";
> +
> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible =3D "lontium,lt9211c";

[Severity: Medium]
Is the "lontium,lt9211c" compatible string currently supported by the bridge
driver? It appears the lontium bridge driver might only match against
"lontium,lt9211", which would prevent the driver core from binding to this
bridge node.=20

Could this use a fallback compatible string (e.g., "lontium,lt9211") if the
devices are sufficiently compatible, or is a driver update missing from this
series?

> +		reg =3D <0x2d>;
> +		reset-gpios =3D <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		vccio-supply =3D <&vreg_s4a>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-lvds-suppo=
rt-v2-0-6b11035e8ab0@oss.qualcomm.com?part=3D1
