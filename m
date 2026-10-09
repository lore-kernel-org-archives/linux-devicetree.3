Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6413CEB9D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536593; cv=none; b=m944AlaX0fCOdVtlo6j3gHZ8h2sMurNOxAiDdECTP1IuARRB8JNmua4hhinINmHGazxVhFbSuxj4C+fI5fJZxQsyNmNDfPvCopI7up8vguYnxIgXJJJ2vcbve1DpgDPTohCX3QrGWbVyfGxNb2GW93yNccxxsbn5ZWWhWZOi6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536593; c=relaxed/simple;
	bh=R1+YfW46c5ApA1KMVDTkFihckX/R/tUDjnjqObpu9FM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lxTdVF7n6vLy29b/d/z+KInzTRbjTJRhMB0q+C7dTRxNAiRe3OwlDo3EKQICySi6VkJkZiW1rkp4bcmf5C2rOr1JKDfyLN3UzS4sUuNIwLfYynwKksa+/PrPkIMq3efd+JEc4tuB4Wjv9b4eJhHktySD2fgL1Dp4xDXoGHhsb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnFf+Cg0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnFf+Cg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41431F00893;
	Fri,  9 Oct 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536592;
	bh=3BoExyb3vqynVWlKTink29dF+apuuxIFS28/aMLZJE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnFf+Cg0JVMo6WVIq6SSs/bst7NzV6HsBrArb0ydZnwBxIxMXwIbeCD+edQ2oOvpl
	 IUiT1yfzRpI+kj3nQ6ixMbBMBozJKZo5HgM3NPKR7JrLZEsDC9B+wfhsOqi8UAaP2z
	 TMtgXerlKdnqyq++RdSMnSWGrc3nCt8e3hzXlV3imiRC1j3EmZCrRvsCb7HFSRCcIG
	 q04S4ycun1wvDaSSxD3PFkJsutU4udLKLlovKm/8osnSaUBPo2PNGGbHtiqpjLQuhI
	 ZQm5A96YH9KfM34hlZc/ymaTKaXdMYfh97S3zDqeWV4wZVUB98CxmDUG7Xx0hAzjGl
	 O/GNbFqnOUNgA==
Message-ID: <sashiko-outbox-165120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576
 front camera support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009085041.181160-1-himanshu.bhavani@siliconsignals.io>
References: <20261009085041.181160-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:03:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] dts: missing video-interface-devices.h header breaks build
- [Low] dts: undefined &camss label reference breaks build
- [Low] dts: missing reg property on unit-addressed port@3 node
- [Low] dts: undocumented compatible string sony,imx576
--

commit e48e7d28c163e33e1162a6d841602d728e3532e7
Author: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support

This commit adds device tree support for the Sony IMX576 front camera
sensor and connects it to CAMSS via CSIPHY3.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 5d20ad93b0c54..b0c9b103cdc9c 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -17,6 +17,8 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>

[Severity: Low]
Is it possible this include breaks the device tree compilation? The
dt-bindings/media/video-interface-devices.h header does not seem to exist in
the tree, and the C preprocessor will fail to find it.

>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -547,6 +549,29 @@ vreg_bob: bob {
>  	};
>  };
> =20
> +&camss {

[Severity: Low]
Does this node reference an undefined label? The camss label does not appear
to be defined in sm6350.dtsi, sm7225.dtsi, or any other included device tree
file, which would result in a fatal device tree compiler error.

> +	vdd-csiphy0-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy0-1p25-supply =3D <&vreg_l22a>;
> +	vdd-csiphy1-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy1-1p25-supply =3D <&vreg_l22a>;
> +	vdd-csiphy2-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy2-1p25-supply =3D <&vreg_l22a>;
> +	vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;
> +
> +	status =3D "okay";
> +
> +	ports {
> +		port@3 {

[Severity: Low]
Should this unit-addressed node include a reg property? Device tree
specifications require nodes with a unit address like port@3 to have a
corresponding reg or ranges property. Omitting it causes a dtc warning
(unit_address_vs_reg) and fails schema validation.

> +			csiphy3_ep: endpoint {
> +				data-lanes =3D <0 1 2 3>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint =3D <&camera_imx576_ep>;
> +			};
> +		};
> +	};
> +};
> +
[ ... ]
> @@ -581,7 +606,34 @@ &cci1 {
>  };
> =20
>  &cci1_i2c0 {
> -	/* Front cam (Sony IMX576) @ 0x10 */
> +	camera@10 {
> +		compatible =3D "sony,imx576";

[Severity: Low]
Is this compatible string missing from the device tree bindings? There is no
corresponding YAML schema for sony,imx576 in Documentation/devicetree/bindi=
ngs,
which will cause dtbs_check validation to fail.

> +		reg =3D <0x10>;
> +
> +		vana-supply =3D <&vreg_l3p>;
> +		vif-supply =3D <&vreg_l6p>;
> +		vdig-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +
> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates =3D <24000000>;
> +
> +		reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam_mclk1_default>;
> +		pinctrl-names =3D "default";
> +
> +		orientation =3D <MEDIA_ORIENTATION_FRONT>;

[Severity: Low]
Will this macro correctly expand? MEDIA_ORIENTATION_FRONT relies on the
dt-bindings/media/video-interface-devices.h header, which as noted earlier
is missing from the kernel tree and will cause a build failure.

> +		rotation =3D <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies =3D /bits/ 64 <1017000000>;
> +				remote-endpoint =3D <&csiphy3_ep>;
> +			};
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009085041.1811=
60-1-himanshu.bhavani@siliconsignals.io?part=3D1
