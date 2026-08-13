Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E233DD525
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643930; cv=none; b=MrSuC/rmZQ2IEB4RDTxTjVw2tjtqjJQEJYuSM7Yr0fmgVs8fl7YY077fHfd2ZnXo0u5mrZmO2olm6J53z/cA+I3LIJa2Y/RZs9QxTWj6c8jMpgVukfMABviN06lB0a+1L3GTxlt6/v/59AKCy9R7T33R2HaN8zCr7XDDaH6wQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643930; c=relaxed/simple;
	bh=2RODNFRVPU6uuQwVEHu9eaTCDxC+hDYzwok3cfMAXVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q5VataNFY0WOdlrOJUyFCNVuETAjc/VSByUjyLfb5PCdS38gispTns4csIkatF01jltvKFnfSwdjJDbZK5HhLHpITTIfI3ZoAIQv10befGenzytBzd9MLUbM0mhEsbqJOA8ThV2ATrDfPerUGB8Fjo5PEzZGtVYqqXnIqoOPnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoFcxKCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoFcxKCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD571F000E9;
	Thu, 13 Aug 2026 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786643922;
	bh=O1ncw13mpEKeXIc4/mnEivZq1wnbTjvxlvlQmn+Cg4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoFcxKCMNUiWsHfh3tXuZEdDq8f0kuvoWwxDpKv3lfwt5WTApqyydNwrFtb3Q2ShO
	 QhWbF0CnEd0skPOqRKhZpcbJl2D+tI4rCvOAUI1EUBB6ib2OaoRCNWAlBS8Sq3UsUm
	 aC3vcUbyECqSg4bfugkdgMrHLoW4sjgDgPeiBYRVRXozgbQp5FILZnEU+5aOV+8nBb
	 e/e5Zy5g2/st2t6IAH89qUzo5gRWtwasCha6PWOH3RTcoRK+XSUHlqO9i1bioDD/Jw
	 e4imE389p6VM+gtIxnxE+nrYCbJcmPU9PmwKyU4XZmQtg3q4OqBKf7NoVnJ6AA9xYo
	 3ZuUJMHAQhzeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS
 display overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-lvds-support-v2-3-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-3-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 17:58:31 +0000
Message-Id: <20260813175842.1BD571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The introduced 'lontium,lt9211c' compatible string is unsupporte=
d by the driver and dt-bindings, and lacks a fallback.
- [Medium] The introduced 'boe,dv215fhm-r01' compatible string is unsupport=
ed and lacks a fallback.
- [Medium] The reset GPIO for the LT9211C bridge lacks a pinctrl configurat=
ion.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS d=
isplay overlay ---
commit f8ec082b3378414f04ce77574b9aa99cf0a7904b
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-ind=
ustrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..8e60b8631169a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-=
boe,dv215fhm-r01.dtso
> @@ -0,0 +1,105 @@
[ ... ]
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
> +
> +	hdmi-connector {
> +		status =3D "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: Medium]
Is this compatible string supported by the panel-simple driver?

Without a generic fallback or an explicit panel-timing node in the DT, will
the DRM panel driver fail to attach and leave the display non-functional?

> +		power-supply =3D <&lcd_disp_bias>;
> +
> +		status =3D "okay";
[ ... ]
> +&i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	status =3D "okay";
> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible =3D "lontium,lt9211c";

[Severity: Medium]
Does the upstream lontium-lt9211 driver support the "c" suffix in this
compatible string?

If not, would it be better to provide a fallback like "lontium,lt9211" so
device matching does not fail and the display pipeline can initialize?

> +		reg =3D <0x29>;
> +		reset-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this reset GPIO need a corresponding pinctrl configuration (pinctrl-na=
mes,
pinctrl-0)?

On Qualcomm platforms, if the bootloader leaves the pin in an alternate
function, asserting the reset GPIO might not propagate to the physical pad,
causing the bridge to silently fail to come out of reset.

> +		vccio-supply =3D <&vreg_l18b_1p8>;
> +
> +		status =3D "okay";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-lvds-suppo=
rt-v2-0-6b11035e8ab0@oss.qualcomm.com?part=3D3
