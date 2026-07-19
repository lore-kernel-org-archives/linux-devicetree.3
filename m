Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5B3B5820
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784485074; cv=none; b=MRWdqsx33Sr5R1ZlV9vW2RXB/0p8iMzZ2YG/5Nzx4kn1Lapdr1SqtuRSc05uX6XmlKCgJGbSoF0vLohEmrkxiuZXPe1D7qufedY7QV2avEnwo45raGQbOrg64UoqKUXGl8cNiPnUc17XTkCBrNqtx7t1IFNlR+YutqbVSOHRD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784485074; c=relaxed/simple;
	bh=mSpUeX4/uXbE/+3fxBeunudmt1QUs/Euof72eQlEi/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CBR/hDaG5I5AZG2rUJSIQgi2Ir2nPx8+Ow0yvZpDeQV5gPQqCvHdjC/tdYLV7iuiO6EGM0Ofbga664SlliybXBCsUZButeqyfUOSKtEsvHysxfbGtc4vW/aSONeQXNFqlDyRP7L0kWY1pxxYufi8gdHTFeAq0s2DDLydDdGiY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciEPbKJc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciEPbKJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B583C1F000E9;
	Sun, 19 Jul 2026 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784485073;
	bh=r+ARHeZIxPAAqR6Vi9Wt/pAWA30aoX/QTEUEVz3DC0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ciEPbKJcORBmBcrTKydBhu/hdQlAhVQ+epEKsSFEHE4bNFIJ/7RcNEY2saejTU62n
	 fdiziOzy2yqBS+5MhPk5UaTsTGKssSex3aWUVPAB7A2xpKILTugcK+OLOcHlgIM+01
	 /j+PrcJegijgKSlgQttQDECrDi2nOZaN5JzyA5Y4ynQPMOr8ObY9AK8DkAqeUlxSP9
	 CNdClDAzy4UMk8VkzEeZM+1rHFI3FKPP1wMK6bq3884QQ8FNgBx7d+kRc9Bdy/DQ0i
	 Vd60UU44k2EbuNGhI7X0fU4Nu55HlsaFOugIy+ECehmQLgd7H965WuXtCNIqZbcpT3
	 DU28vjz0ZrxLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 18:17:52 +0000
Message-Id: <20260719181752.B583C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `lontium,lt9211c` compatible string has no matching driver or =
fallback, preventing the bridge from probing.
- [Low] The `panel-lvds` node violates the `panel-lvds.yaml` DT schema bind=
ings regarding the compatible string and the use of the `ports` node.
--

--- Patch [1]: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display o=
verlay ---
commit 2607cce8051c05162f525ecd61797d0bdba55e07
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add LVDS display overlay

This patch adds a DTBO overlay for the Lemans EVK IFP mezzanine to support
LVDS display output. It wires up a Lontium LT9211C DSI-to-LVDS bridge and a
BOE 1080p LVDS panel.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..17c20e86e950b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
[ ... ]
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01", "panel-lvds";

[Severity: Low]
Will this cause dtbs_check validation failures? The panel-lvds.yaml schema
does not currently document the "boe,dv215fhm-r01" compatible string.

> +		data-mapping =3D "vesa-24";
> +		width-mm =3D <476>;
> +		height-mm =3D <268>;
> +		power-supply =3D <&lcd_disp_bias>;
> +		status =3D "okay";
> +
> +		panel-timing {
[ ... ]
> +		};
> +
> +		ports {

[Severity: Low]
Additionally, while the Linux DRM driver successfully parses the ports node
for dual-link LVDS at runtime, the panel-lvds.yaml schema restricts the
node to a strict single port. Will this trigger unevaluatedProperties warni=
ngs
during schema compilation?

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
[ ... ]
> +&i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qup_i2c1_default>;
> +	status =3D "okay";
> +
> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible =3D "lontium,lt9211c";

[Severity: High]
Is there a matching driver or fallback for this compatible string?=20

The existing driver in drivers/gpu/drm/bridge/lontium-lt9211.c only binds to
"lontium,lt9211". Without a valid fallback here, will the bridge fail to
probe and leave the LVDS display dead?

> +		reg =3D <0x2d>;
> +		reset-gpios =3D <&tlmm 37 GPIO_ACTIVE_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-lvds-suppo=
rt-v1-0-1f1aca3213ba@oss.qualcomm.com?part=3D1
