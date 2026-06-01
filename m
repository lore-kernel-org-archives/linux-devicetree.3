Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809C367B8D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304963; cv=none; b=VBAXFVVTYCsZXwhZUBDNohnjfzOOuYw0FkDy6LBajlTtv9SItbgb8lfaJjtHCuT2fz1Pjr45CRlN40IyXPJ97LnMc4UvxvINpuEV6NFkCoLQiV3W6sEDfa6qWDFwy3WY4gP8tdmsIWYkQ1fFLyLD5AVJiOJ6sHzYkYrwosp7gHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304963; c=relaxed/simple;
	bh=EIS1Yl/+J4oVBpDXfQgoA1U0gn7Ky3fFACeBj1Bi588=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fldHPtjrE5l8l+cs8A3la2S4xTE0+zT7hKMqSA5kUhLp8sHyyzCbG9sjOhhjBSTe3rYrQGPHwY3iq/9HdsF9xIfWyJ4XrrYBU91L2ptP/zVIrHbLA9RqkW/LX+Gl88V3lGcD1tAEEk9TGLZn01fDCj4vXM/oRAUhNbGiaKImxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKhUg6SB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKhUg6SB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76661F00893;
	Mon,  1 Jun 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780304962;
	bh=vhdC4G8GWu5IwD345jCy8vRrR0MZO7ZOWWyrk4XM/ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKhUg6SB7v6WOgvEpNEntF8nqfVQFyRhD73xPevMArbAzOG52+9OYWBw/xSalIEfB
	 W8Ha9YwpsZkDNpR1BmCUoKlhR4dgZxwydUzOvsbuZygOmkcBsr+mKc6TN3vvRuddaF
	 MNSuUnOU162dermCKfXVYDtNmQ4RiSEsKM500fYleArDJ+zF3PC+9/5ncFHDSctiiY
	 qCAsRd390pGxxtz9VVd5vdWB6rqm5SfN3Ksu9ZRsKypoHM4S1U09JyhjaYL/aF+Ofi
	 aH5h6L3QLoXyePtQ+NiFD8WfhwYJI3SF8k/6ePn/4pJCLIJrHZTcqqB0ddOTASrOyC
	 dW/4LIORbP6aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi via B4 Relay" <devnull+linux.smankusors.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 09:09:21 +0000
Message-Id: <20260601090921.B76661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Device Tree binding schema violation: `qcom,ci-hdrc` defines 3 cloc=
ks, but the `ci-hdrc-usb2.yaml` schema restricts `clocks` and `clock-names`=
 properties to a maximum of 2 items.

Pre-existing issues:
- [High] The APQ8064 device tree misses the RPM fabric clock dependency for=
 its USB nodes (`usb1`, `usb3`, `usb4`), leading to broken USB functionalit=
y.
--

commit bf5021df5ce13a6b631bed12c18c025b975c7150
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks

The RPM clock controller manages clocks shared between the application
processor and the RPM firmware, including fabric and bus clocks required
by several peripherals.

With the RPM clock controller now available in the device tree, the USB
controller must explicitly declare its dependency on
RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
would consider it unused and disable it, breaking USB functionality.

This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
clock. The XCVR clock is in fact used for PHY/reset handling rather than
as the main core clock.

> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.

[Severity: High]
This is a pre-existing issue, but since the commit message notes that
APQ8064 is broken due to the missing RPM fabric clock dependency, should we
fix the usb1, usb3, and usb4 nodes in arch/arm/boot/dts/qcom/qcom-apq8064.d=
tsi
as well?

For example, in qcom-apq8064.dtsi the usb1 node currently looks like this:

usb1: usb@12500000 {
    ...
    clocks =3D <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
    clock-names =3D "core", "iface";
}

Since rpmcc is already enabled for APQ8064, the clock framework will disable
the RPM fabric clock as unused, rendering the APQ8064 USB controller fully
inoperable. Is it worth including a fix for qcom-apq8064.dtsi in this patch
series to restore that functionality?

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8960.dtsi
> index fd28401cebb5e..1ae399c5a81f0 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi

[ ... ]

> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg =3D <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names =3D "core", "iface";
> +			clocks =3D <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names =3D "iface",
> +				      "core",
> +				      "fs";

[Severity: Low]
Does adding a third clock here violate the device tree binding schema?

Looking at Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml, the clo=
cks
and clock-names properties are restricted to a maximum of 2 items:

  clocks:
    minItems: 1
    maxItems: 2

  clock-names:
    minItems: 1
    maxItems: 2

Will this cause dtbs_check validation failures? Even if the ci_hdrc_msm
driver handles the optional fs clock correctly at runtime using
devm_clk_get_optional(), should the schema be updated to allow up to 3
items before adding them to the device tree?

>  			assigned-clocks =3D <&gcc USB_HS1_XCVR_CLK>;
>  			assigned-clock-rates =3D <60000000>;
>  			resets =3D <&gcc USB_HS1_RESET>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-msm8960-wi=
fi-v3-0-fec6ac8dba02@smankusors.com?part=3D5
