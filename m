Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411543;
	b=s/gYLQ+lswezcWp0kU68SRvLR+E4qsDYroArQ0pychWbKcQwzDSdVd2M3YQ1sNN9DTTI
	 OxSC6CnaTqr3bcr1fbtZqYM+pzjcvl+RQuexa1JO7SLkwJJDXsLv/STOxMehjyVb+vfI8
	 AKhCZ/V3CQryaj5lHUMYky7EFyE+RlvZJsuiOnJgJ2Low20l32U4DEXEWf73UaOdfpWsQ
	 y2EPayCM3RwVG2ql+usxoyMD7IPT4WLWXRteAtQp+gMnE32csAM6i6jGOKuYu2e51n3+9
	 GPlZFcFkcGpqO6beG7Q2ToimS+MY3Oo/UGEAUEUG5A4Pq+BbKrgysOpxEF7ZmIfQt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zo26Y8Vd+LgyoU5254aA0CjuFyfn1ojTS+iqZdmImX4=;
	b=Fg+mYWtpCn3WdQIUYtKFf3krz5BAo5eB9xPDtHDPkrhoA+135myqYYZvbFm+Z7oamX80
	 xdAxFSODygbNTfWa9M27ivagltCVFfIlZTJ3m5hi5DRyPBIM+bybsMOxcu+cUx8rchjN4
	 0Gh05ougU7jtGHOlJ0+t4ErjQLXcGm6Od92S/lo+SVbLZ//RG+zL2sNSl6MKBu+RvJFjS
	 K91hWx1xDnVV/qC5Xvyp05MQ2BMOoxTdmgVSwCpzMIUjhES+FmAeNWEong4lx8rdK6PB8
	 FynYEtr+kTnZ2ZoNczNliRbAIdWvnlFvcNafLqTelC5V0Y46CNOzd+DI54WfzMf5uPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgB+K10g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503D606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgB+K10g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15AA1F000CA;
	Mon, 23 Nov 2026 05:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411542;
	bh=Zo26Y8Vd+LgyoU5254aA0CjuFyfn1ojTS+iqZdmImX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgB+K10gzId1WAiHReKei7PQ+N322/T6RgDpwZfT+VmNuo/0NCXM/V698t1eJR85L
	 Gwi4kMwDCkZYMNN2H2fhhCWXr4sQKl2VovqEdL4p6ZYNHl8/fA9+1a0HE4nAsfM8a4
	 TT7awE0OhVhN4X4+wYPeGF2VLBB9AlsL+zIu7bpT0tJ+pZrRZmdRmjKXKFXOnJ1ZcT
	 fe5iSjEVDLc241tAJlE2KHNq7RPAZUP3sUWDTJBJOKmPrcF0mPmMyTZw8o86Rry2DQ
	 dmMJgZVOGoRFc6Re26Id9hl7w/m7fKbogJ/juw/j805XIcAQglqnAncD4r2oNpOPkD
	 uHIssHLciQKlg==
Message-ID: <sashiko-outbox-228717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monza: add Automation HAT overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: prashanth.baddam@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-automation-hat-v2-1-bdef1a18b858@qti.qualcomm.com>
References: <20261123-automation-hat-v2-1-bdef1a18b858@qti.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:25:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: decimal LED unit addresses in Monza Automation
  HAT dtso
- [Low] arm64: dts: qcom: unused gpio.h include and unsorted Makefile
  entry
--

commit 07a4903ac9dd988a99b288586f1d04540b8de474
Author: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>

arm64: dts: qcom: monza: add Automation HAT overlay

This commit adds a devicetree overlay for the Pimoroni Automation HAT on
the Monza 40-pin JHAT connector and registers the overlay build rule in
arch/arm64/boot/dts/qcom/Makefile.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 19310879349d0..b60abdd392ea9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-evk.dtb
>  monaco-evk-camera-imx577-dtbs	:=3D monaco-evk.dtb monaco-evk-camera-imx5=
77.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-evk-camera-imx577.dtb
> =20
> +monaco-arduino-monza-automation-hat-dtbs :=3D monaco-arduino-monza.dtb m=
onaco-arduino-monza-automation-hat.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) +=3D monaco-arduino-monza-automation-hat.dtb
> +
>  monaco-evk-el2-dtbs :=3D monaco-evk.dtb monaco-el2.dtbo
> =20
>  monaco-ac-evk-ifp-mezzanine-dtbs	:=3D monaco-ac-evk.dtb monaco-evk-ifp-m=
ezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat=
.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat.dtso
> new file mode 100644
> index 0000000000000..3c35b76f9c2f2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat.dtso
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Device tree overlay for the Pimoroni Automation HAT connected to the
> + * Monza 40-pin JHAT connector.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

[Severity: Low]
This isn't a bug, but dt-bindings/gpio/gpio.h is not used in this overlay,
and the monaco-arduino-monza-automation-hat rules in the Makefile are
placed in the middle of the monaco-evk targets rather than in alphabetical
order alongside monaco-arduino-monza.dtb.

[ ... ]

> +	automation_hat_leds: led-controller@54 {
> +		compatible =3D "si-en,sn3218";
> +		reg =3D <0x54>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		led@16 {
> +			reg =3D <16>;
> +			label =3D "automation-hat:red:warn";
> +		};
> +
> +		led@17 {
> +			reg =3D <17>;
> +			label =3D "automation-hat:green:comms";
> +		};
> +
> +		led@18 {
> +			reg =3D <18>;
> +			label =3D "automation-hat:blue:power";
> +		};
> +	};
> +};

[Severity: Low]
Should these LED child nodes be named led@10, led@11, and led@12?

Devicetree unit addresses use lowercase hexadecimal to match the node's reg
property, so decimal reg values <16>, <17>, and <18> correspond to unit
addresses @10, @11, and @12 (just as monaco-arduino-monza.dts uses led@a
and led@b for reg =3D <10> and <11>).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-automation=
-hat-v2-1-bdef1a18b858@qti.qualcomm.com?part=3D1
