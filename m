Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E92D7DC4
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284336; cv=none; b=uD3hz5MC+kRdJPeFAXL+KZLsXTyQ7Z0N/NB6HNKzqo65ItRDs19UZ53M41toU/MocXcVr4SLv/KS/x786v19wT9D6EMPE5FQ6CAW+bOItj5zS3PJ+yitZFf7+hLfol4YmZYN6lQUmpN7HxFIxeaSRivn7pbaUE1p6zr4f8RDMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284336; c=relaxed/simple;
	bh=2YOmNylVCWelqSN8uHGnOGWlcmKz35yYGs4ccN9P02Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D4SBjb3l6C/I6YfdFy3TDxpEIM7Ctbgf4ivC2yoUbWUQTbsFZyxEGkc0VXXuBfHhg5jrwQXgX5BUNDYIZRiKEpEb5U4KK2g/REPrBMvRcNvYhdb7veUXEcPgM9EkvtUPMHDyeWFdcsg1ey4gZSHdUrPpvrv4Zcu1XJ9sKlf2fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtqOJEs0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtqOJEs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3C11F00893;
	Wed, 20 May 2026 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284335;
	bh=M9xboEI3Lb0iGhYnRGHmTnd6BDnXMEJQ3ECOtRCHHWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UtqOJEs02xe1JfdNN+5suPUwHfh8cqO0nyJGx92MRpH6Y/YzbwFi/t33zNTM9DHeR
	 4el6ahNoFMADn1bvcYjd+Fv5Brsd+Dh9I/A+DPXbOaDCegUZfD2XhpMDm9DQEyZ/yf
	 T658aGrEYJY5WXKghQsskEf+mF3pOnHqD1HbCt7c73KATlK5kBink3VLEk2cAc1I32
	 lcrjVatYG/Yx2iOQvo94eOnFKfDreg0ED+hSxUN/OIYKkxYoLNwf+DKhQsIgl6wCQX
	 LNY6kdiWpLHylF9fnSPZYHJ8GGIWfdVxbheUe/pW73EnpMDlZ+W2aqP7kWD/BypJHC
	 RNMq4wXwzWzaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:38:54 +0000
Message-Id: <20260520133854.CE3C11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The DOVDD (Digital I/O) and DVDD (Digital Core) power supplies are=
 swapped, applying 1.8V to the 1.05V digital core domain and risking irreve=
rsible hardware damage.
- [Medium] The custom `vdd-csiphy3-0p9-supply` and `vdd-csiphy3-1p25-supply=
` properties are not supported by the upstream CAMSS driver.
- [Low] The patch references an undefined `&camss` label, which will cause =
a Device Tree Compiler (DTC) build failure.
- [Low] The `port@3` node is missing the required `reg =3D <3>;` property.
--

commit e96fe4e80a1f906989411986c814165ecd67c277
Author: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support

This commit adds device tree support for the Sony IMX576 front camera
sensor. It connects the sensor to the CAMSS subsystem via CSIPHY3.

> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts

[ ... ]

> @@ -547,6 +548,24 @@ vreg_bob: bob {
>  	};
>  };
> =20
> +&camss {

[Severity: Low]
Is the camss label defined anywhere in the tree? It doesn't appear to be
present in sm7225-fairphone-fp4.dts or its included dtsi files, which
would cause a build error.

> +
> +	vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;

[Severity: Medium]
Does the upstream CAMSS driver support these custom supply names? The
upstream driver maps regulator supplies using hardcoded string arrays inste=
ad
of custom supply properties like vdd-csiphy3-0p9-supply.

> +
> +	status =3D "okay";
> +
> +	ports {
> +		port@3 {

[Severity: Low]
Should this node include a reg =3D <3>; property to match the unit address?

> +			csiphy3_ep: endpoint {
> +				data-lanes =3D <0 1 2 3>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint =3D <&camera_imx576_ep>;
> +			};
> +		};
> +	};
> +};

[ ... ]

> @@ -582,6 +601,34 @@ &cci1 {
> =20
>  &cci1_i2c0 {
>  	/* Front cam (Sony IMX576) @ 0x10 */
> +	camera@10 {
> +		compatible =3D "sony,imx576";
> +		reg =3D <0x10>;
> +
> +		avdd-supply =3D <&vreg_l3p>;
> +		dovdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +		dvdd-supply =3D <&vreg_l6p>;

[Severity: High]
Can this damage the hardware? The 1.05V regulator (vreg_32m_cam_dvdd_1p05)
is assigned to dovdd-supply, while the 1.8V regulator (vreg_l6p) is assigned
to dvdd-supply.

Should these be swapped to avoid applying 1.8V to the 1.05V digital core
domain?

> +
> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520115641.1172=
9-1-himanshu.bhavani@siliconsignals.io?part=3D3
