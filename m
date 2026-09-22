Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243C499F0F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101896; cv=none; b=V6psZRhrWFOiekIq/+zX/EaZA4bbw7FMdAl750HvEdQ6zpNs713s7liS6cvo1jVSazh92HVj9gmg8qdmpLr+HXw2UmkmO949+vJzjqO3YeF+TkYKXXTSDhcm2LtLllyCRcgg8n56we+bC6k54xb7YyhB4y8yV+Nz6OY07inBWo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101896; c=relaxed/simple;
	bh=moMHCS4t+tDnbmEDTLbWt4z4kAvfRAn99PlbI3azQ/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S4b6JUY2GHgSWknBsNj7uYoIsgtFNn5aBHtJVnHxotT2rd0/J4/3FsEjEktd1Ju7+SNWgJvPV50OmtoPy9zIPDZNR8qhBND64XZzQvk46SKhxolZqjT5qtLNcpXEoVoSWj73S4GAK2K0FFo2nRHrXmHcxgxkRQ7yVuiBDMGoL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3owqa6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3owqa6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA61F00893;
	Tue, 22 Sep 2026 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101895;
	bh=EB+iSw/bAyGsmtX/r+i3BiVuQfsgYU8bPJl/fmN8ycI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3owqa6pYKYk7Y4ty2P6abEDJlWWAwdNoe+Jg19pfYHgvmNPLGfi0hLZG/6fg8BpV
	 cvQ8Ctmzc6mmTjQqccbvQZ58FeV9OUp4HkYUwoOX9hO6INUaykRnSIftXy3tajfVXL
	 IvcCr4HMjg5aosrCKIUjG4t3cdu2y4/NWPoDbMGvVXHGSgL57jJYs1j4b/7NvkcoHz
	 YOeT7r36c5NMGx/OFYPUVxkInWas2+HvjRGqxEhGXl3hK9EP6VEMCPbb7zay21aoL3
	 +43B7Cy4o8+uY3ZS5EEZTCc/8Sb0XajdHKqDBRVM3ISciKG3z131eV3KmM4hPuWz6N
	 Sm91cVGxjQ1/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 18:31:34 +0000
Message-Id: <20260922183135.18EA61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing #thermal-sensor-cells on pmk8550_vadc breaks thermal =
zones
--

commit 2a17ffae5a77fa31a5cd42aff532d2ad2eb0c1c2
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs

This commit adds thermal zones for the ThinkPad T14s and describes the
board temperature sensors exposed through the PMK8550 VADC. It includes
passive and shutdown thermal zones for the keyboard area and back cover,
along with monitoring-only zones.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b=
/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 5cc6a63d1ef66..9407868864ad3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -10,6 +10,117 @@ / {
>  	compatible =3D "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>  		     "qcom,x1e78100", "qcom,x1e80100";
> =20
> +	thermal-zones {
> +		soc-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			critical-action =3D "shutdown";
> +			polling-delay-passive =3D <500>;
> +
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;

[Severity: High]
Will this thermal zone fail to parse and register at runtime due to the tar=
get
pmk8550_vadc node missing the #thermal-sensor-cells property?

Without these thermal zones registering successfully, the system might lack
the intended thermal throttling for the keyboard constraint and the 73=C2=
=B0C
shutdown trip, risking hardware overheating under load.

[ ... ]
> @@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
>  &pmk8550_pwm {
>  	status =3D "okay";
>  };
> +
> +&pmk8550_vadc {
> +	channel@144 {
> +		qcom,adc-tm;
> +	};

[Severity: High]
Should this extension of pmk8550_vadc include #thermal-sensor-cells =3D <1>=
; ?

Since the base definition in hamoa-pmics.dtsi omits it, it appears to be
required here for the framework to parse it as a valid thermal sensor provi=
der.
Otherwise, of_parse_phandle_with_args() returns -EINVAL unconditionally at
boot when evaluating the thermal-sensors properties above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922181818.5503=
-1-daniel.lezcano@oss.qualcomm.com?part=3D1
