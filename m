Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F363B3BF5
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784485044; cv=none; b=igVXxfwvMRPZVHV4WCee0icP3IObqfjHKTPFtoxEv3kgp2rqCwEv2GfhSWQo/B4luIXkPjEe7fPVIqjf21r5ojG00lhdV1Fe+scBjj0+JvVk5LxbpEVlPbqnO6SwprTm1++1VnBwJjjKRV6hVB6zOK/28yI3iAiNY9DKeHfQtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784485044; c=relaxed/simple;
	bh=Zg51ZGBpEcfalb+FcnEqWbNFPLpzzGex2X3Xk3rETdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sYeEPQjdr/wMTytQFTgDTCsHYP41uKA78zUSaxZF32aie1KJn/qWJp+NycI1+fxPKqjqYe7Cc+FXuYzH/2HFg67rb3qQ2ArO9TkEPNqM6VGj48dbiUxGeJQtxubnc/PRGYeNvfLmRaK84doFPVWdkbWHgKhSePVLbB+NzYnrtR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMYe7PFX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMYe7PFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FC41F000E9;
	Sun, 19 Jul 2026 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784485041;
	bh=bxS+HRDpwiyFsfByFIQ3b2Rr2QgXwuq1esZvZJuGnYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMYe7PFXib5l+D6d2zwxqRzPqbepNfrubuywC9xuqL2TufCYpFRWvSW7OEc3FVpNR
	 +ww8joznbvB4x/ZSdPE8LHlurej6VoDobiT9F3NP4Kyh0/YQq2qmtIa8nObOZhsvlQ
	 zlAQFgn0RAc0RlLRGV12z7WqsCQNqR18qYJbcYYt39kOVJDfqpDB/O2vAC3pTbRZ1Q
	 STJAwFDpT43j5MZrG7uNvOO5t3UkrDJEaxE+OAWf/0VsqyyDJp8Y51VW7rmyBjaILH
	 3o3LndDSjavNHes/FDiBID4ErfUycAxIn3sHtk5EYo2Bl2F0htzubyE4yduTdZfzuO
	 VjCCUwpF4d6Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260719-lvds-support-v1-3-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-3-1f1aca3213ba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 18:17:20 +0000
Message-Id: <20260719181721.38FC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The LVDS bridge device tree node uses an unsupported `compatible` =
string (`"lontium,lt9211c"`), which will prevent the driver from matching a=
nd probing, and lacks a fallback compatible string.
- [Low] The compatible strings `"lontium,lt9211c"` and `"boe,dv215fhm-r01"`=
 are used but not documented in any device tree bindings schema.
- [Low] The `panel-lvds` node defines multiple ports inside a `ports` conta=
iner, violating the `panel-lvds` DT binding schema.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS disp=
lay overlay ---
commit 8bcbc23969051c16954909a078c84444cd4362af
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

This commit adds a DTBO overlay for the QCS6490 RB3 Gen2 industrial mezzani=
ne
to support LVDS display output via the Lontium LT9211C DSI-to-LVDS bridge.
It wires up the LT9211C bridge on I2C1 and adds a dual-channel panel-lvds n=
ode.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-ind=
ustrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..65af688503429
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-=
boe,dv215fhm-r01.dtso
> @@ -0,0 +1,110 @@
[ ... ]
> +	hdmi-connector {
> +		status =3D "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01", "panel-lvds";

[Severity: Low]
Are these compatible strings documented in the device tree bindings?

A search of the tree reveals no schema definitions for boe,dv215fhm-r01
in the panel bindings. This will cause make dtbs_check validation to fail.

> +		data-mapping =3D "vesa-24";
> +		width-mm =3D <476>;
> +		height-mm =3D <268>;
> +
> +		status =3D "okay";
[ ... ]
> +		panel-timing {
> +			clock-frequency =3D <148500000>;
[ ... ]
> +			de-active =3D <1>;
> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[Severity: Low]
Will this ports container cause a device tree validation failure?

This overlay matches the generic panel-lvds binding, which strictly requires
and only allows a single port property. Panels requiring dual LVDS ports
typically use dedicated schemas that explicitly support a ports container
instead of falling back to the strictly single-port panel-lvds.

> +
> +			port@0 {
> +				reg =3D <0>;
[ ... ]
> +&i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible =3D "lontium,lt9211c";

[Severity: High]
Will the display bridge driver successfully probe with this compatible stri=
ng?

The upstream Lontium LT9211 driver and its match tables only support and ma=
tch
the lontium,lt9211 compatible string. Because the overlay specifies
lontium,lt9211c without providing a supported fallback like:

    compatible =3D "lontium,lt9211c", "lontium,lt9211";

the I2C subsystem might fail to bind the driver to the device,
resulting in a dead display output.

[Severity: Low]
Additionally, is the lontium,lt9211c compatible string documented?

It does not appear to be present in the lontium,lt9211.yaml schema,
which will also trigger dtbs_check warnings during device tree validation.

> +		reg =3D <0x29>;
> +		reset-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-lvds-suppo=
rt-v1-0-1f1aca3213ba@oss.qualcomm.com?part=3D3
