Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02818A6D4
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 01:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572304; cv=none; b=SMSMzAX7xXBjBjiLBxCkABdJaPtaWwkrjV81sIl+l3LgNID/KNbeo0KLG64eWNF4NC4SdnWNFxnxmCsMrBHvTt2sSBd8wKwOmTTK6JGj3uuLYc9djuhtoRSnS8jrtzcY17G40khvMS9QIP6Jvxe1BU852AYfS6UiIQCdvpy6Z+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572304; c=relaxed/simple;
	bh=TFEc2VP69HMJAhigh5cIV0X6oCKYo5likgBOVH/xrtY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTXR6cIcz3JvGjRyoVs4m/ZFxVgn7YaJiiERa6q+MAhBLNYhRuYQAYQCMTiD2b7ueYPbCNd5D6eDrMG9wTjOWzgk6MYmuEREqf2yE7ibWIKXTgwNn8S+dVVgiFbYx5MuG8dThAXTJQwe4oWfXnbqinRxG+qLm6vcJ0jmjVrV10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eV/vAnCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eV/vAnCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3AE1F00A3D;
	Sat,  5 Sep 2026 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788572302;
	bh=CG9vioD1V0Ao7GEOitTBRrKO8MtT6isyrQUx0aQJT48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eV/vAnCWQ08gpniPWELpNAcYrcBvLQKlf0Knfw4RGNLIfI/65NCDL+sN4f/pWxCgy
	 cV7kZjSszp7ihUinCW/FuEckcTU89lyXbCQ3GB9WGeDR9k54AzVGmtbfPxhZsErRMq
	 5SIDe059DyB+PgiqCTrrEh02Ul8JHLAWb1mj5LfswxEziaOe8jPxISEwYphmsKJ1La
	 5EyeFCd90ehxJuFJrqnsn5t/GbkSR2T0gVE/xq5ftJDObHxcMpx/CrKjqRenAUgYRx
	 dXGfLSwaxEtbE/6WnP+jnRCcOEK3XB1l50CxLMjZIiD96ZpgWb0xoFIIUgTHVjoOJZ
	 iqe5tPZ87hpuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 01:38:21 +0000
Message-Id: <20260905013822.2B3AE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Driver Support / Undocumented Compatible Strings
--

commit 78dfb1b1aa86e3fb2e9b0abac38907b8140f5130
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add LVDS display overlay

This commit adds a device tree overlay for the Lemans EVK IFP mezzanine to
support LVDS display output. It configures the LT9211C DSI-to-LVDS bridge a=
nd
a BOE dv215fhm-r01 panel.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..bd3e13c46a1e7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
[ ... ]
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Lemans EVK LVDS";
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: Medium]
Will the panel_lvds node probe successfully during boot?=20

The compatible string "boe,dv215fhm-r01" in
arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso appears to be
undocumented and unsupported by the panel-simple driver. Because there is no
generic fallback (such as "panel-lvds") with explicitly supplied timings, t=
he
driver core will not find a matching OF entry and the binding will fail
deterministically.

Could a generic fallback be added, or does this compatible string need to be
added to the driver bindings first?

> +		power-supply =3D <&lcd_disp_bias>;
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
Is it expected that the lt9211c_codec bridge device lacks a driver match?

Similar to the panel node above, the compatible string "lontium,lt9211c" is
undocumented and not supported by the existing lontium-lt9211 driver. Witho=
ut
a matching driver entry or a generic fallback like "lontium,lt9211", the
bridge will not probe, leaving the display pipeline uninitialized.

Does the lontium-lt9211 driver need to be updated to match this compatible,=
 or
should this node include a generic fallback?

> +		reg =3D <0x2d>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-lvds-suppo=
rt-v3-0-b40a1b03f63c@oss.qualcomm.com?part=3D1
