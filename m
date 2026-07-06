Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01705442107
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333452; cv=none; b=m3Ndrrvp0AxWC4oUPpUCGd8bzWlcdITZxvO5ScpxXfnXZBvEUT5Z18uIhA4KkLPJQFxys0fUwr7LUjx3dih5dKIQzIgFTzzIG0HiDv5GHlCkd74o47mo+eHYwvpBZnTmKIIX8M3JCjUichff3A6R1rCRDSa9Wmy0ol8xfnpRL4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333452; c=relaxed/simple;
	bh=MDDWKzU7bVITlTeJ+MTNbamKyFsrkVGf5W5/4Rl3Mko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MuLL0UhJZOOZyIauN+AZuIMWHTgP2VdduXO0vXSQ2kPjOy1EFNUp8Ge4Qe8vayPwUduiRp+TQLqwi//CRombhvkRMDrJgN1Cc9t3+O7yG5zfI7xOSApQlObEGdTGehTOvTb9MVEsfTqrhzRGy+MuhBUFrcZDkn1YU7ZD9AkUdMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCUGbsdk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCUGbsdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465171F000E9;
	Mon,  6 Jul 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783333450;
	bh=DJbhMIGX2V09Y30VEGMlPKNg7Rfg+45P3hRiH5KjFY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCUGbsdksaFJRMWswyS7ecijpTu8KCBLOCDOb4mAuupX34pGcibpIIhGeKY7sQ/oQ
	 SR/fHdzlBddEMgQ+s62unIFL3FrQU4rc3rqSMPXIDVxMUcEJP0ySP8+uRwTdoz2UrX
	 /9A3VE5m1VKboynKtquaMKu5ERqV2BWM6ipmiKu90Cm8UYM0UegycvzWFo0VqzVVYi
	 O1Q30Tv+KY9uUDuKgXD2XEwOGSA8PjwfI/dVrEeAnHk0M9VgtBy3icLfsAcWLvlklh
	 /4Ce3w5Z6uRYRy3oeeK+tzD3TRu5PF3EVuA2sff8F/UYJvJmR4apr4g1L1NsIrFJZL
	 46Iht6e9wqPfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706101526.2556226-3-jackyhuang@nvidia.com>
References: <20260706101526.2556226-1-jackyhuang@nvidia.com>
 <20260706101526.2556226-3-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:24:09 +0000
Message-Id: <20260706102410.465171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The cp2112a and cp2112b USB devices are incorrectly modeled as int=
erface nodes, preventing their device tree properties from being applied.
--

commit 19bf252306e94b75647bff8b12082b57f05638b9
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

This commit adds the device tree for the Aspeed AST2600 BMC for NVIDIA's
Vera Rubin NVL compute platform.

Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidi=
a.com/

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> new file mode 100644
> index 0000000000000..5d17450e4869e
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts

[ ... ]

> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112a: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: High]
Does this incorrectly nest cp2112a inside an interface@1 node?

The CP2112 is a single-interface USB Class 0 device. According to the USB
device tree bindings and the kernel's usb_of_has_combined_node() logic,
shouldn't this be defined as a standalone device node directly on device@1,
similar to how cp2112c and cp2112g are defined?

By nesting cp2112a inside interface@1 with reg =3D <1 1> (specifying interf=
ace
1 when the CP2112 only has interface 0), it seems the USB subsystem will
fail to match the OF node to the device. Could this cause the
gpio-controller and interrupt-controller properties to be ignored?

[ ... ]

> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112b: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: High]
Are the properties for cp2112b also incorrectly nested in an interface@1
child node here?

Similar to cp2112a above, defining this inside an interface node rather than
directly on device@1 could prevent the USB core from attaching the OF nodes
to the instantiated devices, silently breaking GPIO and interrupt control.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706101526.2556=
226-1-jackyhuang@nvidia.com?part=3D2
