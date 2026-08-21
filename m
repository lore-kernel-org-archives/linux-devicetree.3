Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7463FADF7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787339922; cv=none; b=sWpi8uQusRlX/a5RZefRTmAa8Fc6T4fHL7I2Sk9tv9dHqk0+/sCp3UxBKof++FFL1bk8gPNCSZJ3dG/zZLbgcdVrwhJ009IuD0SvfZlJH/cUc7LllOD3sLa8VtkcmACBgT9XjqAdJ0fNNmXyhpWVtYeVLjcmzcsR2sBfvQ126ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787339922; c=relaxed/simple;
	bh=dyWX+s85fTBt9c2JlvMZxAles40YKvnD8i9BnJwfT6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J+l2D8TDaMvwrWaeHJOwnkwwB/ExEQtGW3TOGzy2NxQcELT+E0hk57RTfA8sJJOxiDN+lKPls5ufWEcgT6sDX5t2RN2tuNjkJmHw+v8f7MVZ5NUiKF8oiXTsdqc0In05dbdRJePSbEJ0+XUyDOKIkwJ9ILAzyLFdzjzYyWigN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ6AS+wp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ6AS+wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D817D1F000E9;
	Fri, 21 Aug 2026 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787339921;
	bh=Q97Gt8RMQszKo3EGmPNRp9jxCWk+CukK5mBnIJessWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QQ6AS+wpMgEGWH0PgQalqobkEG7PTr3/8yvmjjcEgt3IeD0njXdtwOpq1+Jyks2zP
	 dOS6M3RxVF33iOHwQNapR7+lthyXfa/2C6pDRf2cW+3+lIj8JbfpRN4g4eeJn8zWRI
	 U/dxXVp8DyoZERIN54PCEcJnQTrdMuQxdteHY+ly0sQHZ2mu+g5EOGl4NW1t1jRH2K
	 ZyKx4jCqXARCsIBzvxy+n6befxmeKqk+WU7KznZSY0pSCniBBylIxAB/lXwFmeBaw2
	 mHCHkQba+TQJoWaoAonTP13vCqmzTlR4JQ0fmWcadzYzA9kU3RwdCGFpsg7dzyDsUR
	 CStFXGCNgwyfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com>
References: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 19:18:40 +0000
Message-Id: <20260821191840.D817D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example contains phandle references to unde=
fined labels, which will cause `make dt_binding_check` to fail.
--

--- Patch [1]: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT s=
chema ---
commit b755cd6cba207356ee219dac6c62ba31935acb54
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

regulator: dt-bindings: ti,tps6586x: Convert to DT schema

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Add child regulator node properties that were missing in the text
binding but used in existing DTS files.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml=
 b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> new file mode 100644
> index 0000000000000..82c3a3c811200
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml

[ ... ]

> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      pmic@34 {
> +          compatible =3D "ti,tps6586x";
> +          reg =3D <0x34>;
> +          interrupts =3D <0 88 0x4>;
> +
> +          #gpio-cells =3D <2>;
> +          gpio-controller;
> +
> +          ti,system-power-controller;
> +
> +          sys-supply =3D <&vdd_5v0_sys>;
> +          vin-sm0-supply =3D <&sys_reg>;
> +          vin-sm1-supply =3D <&sys_reg>;
> +          vin-sm2-supply =3D <&sys_reg>;
> +          vinldo01-supply =3D <&sm2_reg>;
> +          vinldo23-supply =3D <&sm2_reg>;
> +          vinldo4-supply =3D <&sm2_reg>;
> +          vinldo678-supply =3D <&sm2_reg>;
> +          vinldo9-supply =3D <&sm2_reg>;
> +
> +          regulators {
> +              sys {

[Severity: Low]
Will this example fail to compile during make dt_binding_check?

The phandles <&vdd_5v0_sys>, <&sys_reg>, and <&sm2_reg> are referenced here,
but the labels are not defined in the snippet.

In the old text binding, the sys_reg and sm2_reg labels were defined on the
child nodes (e.g., sys_reg: sys { ... }), but they appear to have been omit=
ted
in this conversion.

> +                  regulator-name =3D "vdd_sys";
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-ti-tps6586=
x-v1-1-93cb46b32b27@gmail.com?part=3D1
