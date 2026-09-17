Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38E53A886
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652228; cv=none; b=I9e+G0pfgP9GOhslNTa47fnwsWOkuN49FIuU3AiFA/8ModGT8Ux9fq3q3d4pIfTVazqFpuw8HPKS2JFp/AbaHnBabLE3HG6uNHK4t7Jo/ZxMaEsS8f0z1NWfuVNJBlwk1ma4QwTKOUjeVw9BZCT+DGz7yu/CVcHwV+yFnvzTa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652228; c=relaxed/simple;
	bh=N2Ss+EuHC1Fvcj7W7lgOFkxPiihykeIv6v4QUHeB2l0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i42zVtBNym29+80bYCCjB3kH/NGKIWh+kZY+wOIxi8F+toZxc4y+rYoVRLMUmRbZW92JuF8/hP8W2NYWbLUx1E4PXTH8oiUgtMaRsqheQ2JgvXY1nppnNJEskzbh6O3jSwLWBhanMgWTmYgXTp1usQtPyY5axT7we1pxqYNPulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IavlKToN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IavlKToN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFB11F000FF;
	Thu, 17 Sep 2026 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789652211;
	bh=4rcf6K+8Wp2kGLQVbR0rpPuv+6O6SQuofZjdcErjoMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IavlKToNfjS65lFMN3jQpeZjC+SLTKW4VyhV/fqRxVgfZgrx3zUuC1qLL5pPz2Ve6
	 gBYeV97U2OI2V/CeVFrZpaJUg1JjO0I6I5RVGdhJVMiwXN8SghB4KhppV+NGcd1jgP
	 l3p29UXd3dni4wQcByGBehbr4p4MahdnSdqK7rFTokwxdqfs0iO/BYeObtbj1BEMtB
	 fLQVTRBCUgw/JuIXgsQKICaRsOVGIJrUy7p3Oi/lqxN/+X7n8Y86o41u6shrlC/duS
	 7duAblJHUgW6eoVfhwy4JJ8QMrR8XqK9MXWX5b/oefFwYWKbajGUblion3jLz+InVv
	 uaDnIPuezLvjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/12] arm64: dts: qcom:
 x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-12-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-12-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:36:50 +0000
Message-Id: <20260917133651.7CFB11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dts: qcom: overvoltage on ov02e10 dvdd-supply due to wrong reg=
ulator
--

commit e30274aeaba1c791b56315068d522957cf040acf
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boo=
t/dts/qcom/x1-dell-thena.dtsi
> index 4cda708455d84..5a3bf4eb4ef68 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
[ ... ]
> @@ -794,6 +796,71 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
> =20
[ ... ]
> +&cci1_i2c1 {
> +	camera@10 {
> +		compatible =3D "ovti,ov02e10";
> +		reg =3D <0x10>;
[ ... ]
> +		orientation =3D <MEDIA_ORIENTATION_FRONT>;
> +
> +		avdd-supply =3D <&vreg_l7b_2p8>;
> +		dvdd-supply =3D <&vreg_l7b_2p8>;

[Severity: Critical]
Could this cause an overvoltage condition on the OV02E10 sensor hardware?

It appears that the 2.8V regulator (vreg_l7b_2p8) is being assigned to the
digital core supply (dvdd-supply), which typically expects 1.2V or 1.8V. Wh=
en
the sensor driver probes and enables the regulator bulk, unconditionally
applying 2.8V to the digital core might cause permanent hardware damage.

Other similar boards (such as the Lenovo Yoga Slim7x) assign a 1.2V or 1.8V
regulator to dvdd-supply. Is this possibly a copy-paste error from the
avdd-supply line above it?

> +		dovdd-supply =3D <&vreg_cam_1p8>;
> +
> +		port {
> +			ov02e10_ep: endpoint {
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <360000000>;
> +				remote-endpoint =3D <&csiphy4_in_ep>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D12
