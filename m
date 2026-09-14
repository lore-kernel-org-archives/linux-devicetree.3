Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6B739989D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369302; cv=none; b=LJVghsB3+Sr+fqUSPIIw5iyGQ5qIVUKqO7/mLWnkdfIIIcoLpaq7qcs2IFsTxnS3tyF5KGITGwNBke4Tx2xqNcEaLD6CW0E+TxDwbv3Zjjx4gl0wMX9rJFT+bVCiRvdNqIvaqhHfT19gHrWWqE6/2PyMxsYty2h//tM2ePS2+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369302; c=relaxed/simple;
	bh=ap09DdLvwSP+3/FzyypI6BzWnxbJgEE72fW8xklk07Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WRPbhwksTAWVXQgRONyZiFbIi5HLNrGnqHIH5lza+N0X5E8G02EAeao1+EkmcFrm60b/9VuXVqXVN1zztOTgc88JF/UuAVtsjyiMgrfKjhP4ecLixUXh9asdAo6kFyHRJrv7GmBCJW5JJSqZRndZ4BP2301JUWLibTPnrVFbrxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahRIKnz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahRIKnz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCE61F00893;
	Mon, 14 Sep 2026 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789369301;
	bh=lOcuteBAui70LMwomHoOTNzunoUJ8YSVIRnIVfere8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahRIKnz+FqqvDqtPoQMkfS1qYA93RnqTF7rxxgd9GkFKsGx5RSuQwK+z1pO33Bt51
	 Cf43KNX/w+S/6w9TDRSJBQwIL/8DPGeKJVwFfqDOlbEsSxtwX4fSVmxBYxj5zla+Uw
	 CBesmMoXjdDQNA/457PVjgJ5+j8KUlY1dvY8htUkhuW6xSZI2JQXrSw2W8DecmC1fA
	 hGQhjszrt4jPoqBthYYALDVU2IUPpif35be2Imp2D5rp+K3hOGyGXED00UE0k/ySqD
	 00Q1y4lHiAN2uGntfm8jBDobdngZF/L+xEsztHw0vWLLpbS9HuVqRBvJo91V9GICZ2
	 z88DBmFyh60pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: st: ensure IMX335 is enabled on
 stm32mp257f-ev1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-2-2f2bd719bb63@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
 <20260914-stm32mp2-dk-camera-v1-2-2f2bd719bb63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:01:40 +0000
Message-Id: <20260914070140.CCCE61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using a GPIO hog to enable the camera's local regulator bypasses=
 the regulator framework, breaking runtime power management and risking pow=
er sequencing violations.
--

commit b096d3a18793729d58affdc2e7b576dc33241f8d
Author: Alain Volmat <alain.volmat@foss.st.com>

arm64: dts: st: ensure IMX335 is enabled on stm32mp257f-ev1

This commit removes the dedicated fixed regulators for the IMX335 camera
and instead routes its supplies directly to the system scmi_v3v3 supply.
It also adds a GPIO hog to unconditionally drive the camera's enable pin hi=
gh.

> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot=
/dts/st/stm32mp257f-ev1.dts
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
[ ... ]
> +&gpioi {
> +	/* Enable the IMX335 power line */
> +	imx335-en-hog {
> +		gpio-hog;
> +		gpios =3D <0 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "imx335_en";
> +	};
> +};

[Severity: Medium]
Does using a GPIO hog here bypass the regulator framework and break runtime
power management?=20

Since the hog forces the regulator's enable pin HIGH unconditionally as soon
as the GPIO controller probes, the camera module appears to be powered on at
all times. Does this defeat the IMX335 driver's runtime PM which attempts to
manage the power sequences to save power?

[ ... ]
>  imx335: camera@1a {
>  		compatible =3D "sony,imx335";
>  		reg =3D <0x1a>;
>  		clocks =3D <&clk_ext_camera>;
> -		avdd-supply =3D <&imx335_2v9>;
> -		ovdd-supply =3D <&imx335_1v8>;
> -		dvdd-supply =3D <&imx335_1v2>;
> +		avdd-supply =3D <&scmi_v3v3>;
> +		ovdd-supply =3D <&scmi_v3v3>;
> +		dvdd-supply =3D <&scmi_v3v3>;
>  		reset-gpios =3D <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;

[Severity: Medium]
By pointing the camera's supplies directly to the system supply instead of a
fixed regulator that owns the enable GPIO, will the runtime PM toggle reque=
sts
from the IMX335 driver be ignored by the actual hardware?

If the main scmi_v3v3 supply is disabled during suspend while the GPIO block
remains active, the EN pin might be driven HIGH into an unpowered regulator.
Could this risk hardware back-powering via ESD diodes?

Should this enable GPIO be modeled as a fixed regulator instead of a hog to
maintain proper power sequencing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-stm32mp2-d=
k-camera-v1-0-2f2bd719bb63@foss.st.com?part=3D2
