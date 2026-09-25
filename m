Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6343B5839
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315494; cv=none; b=hr40r+sHg1b/CTNoHvlaD+YQutpfPcJnTyY+whkxkGKy/SKmh+CP0kqHttJQBfSRweFzuql6Pdn8BpfxVE5CtUw0dOIXe8inh5Jv8J6p9Ac/zIUGaKeCeCw4j4pkyTKnFAUIZfJ0/Y+nqLxcUizsjlJmheAY49Rg1e5Yl3pBQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315494; c=relaxed/simple;
	bh=lIUHybqSJSBk+TiWzxhmJgUuj7pMHAWCC6lALOiGJ0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mjwo7LGev4HDiczwXuYungroT74Fr9WBS0h5RPWroOLkLWyvfj4WubJhwQGD9/gZOY7oQqt8onNdsuu0+DDkJwFs4XY3msmKhbfhN6fhNMF/JB90K/gP9yO6IxO7zpI3NzCFpZtpXq+tYGtkUiKBhL1H0yDt6GzbkOXfHCgln80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oA8bdEu0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oA8bdEu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD501F000FF;
	Fri, 25 Sep 2026 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790315493;
	bh=o6f1R33iMlCjn/EcSH+CvOdvqypALTh44XpAzIQfSEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oA8bdEu0TYHiAZXmseaC4WWnEAgu+VXeOXsAABkPPOH1Olle/sJwCk8k5YCxvkR53
	 TLANJ2tuXsSwsB7K42dykEe0WJnrs/yG+k8BNejRFOL12dLoT/0qWyC+yX0S1Dwzbg
	 uSGL9pcsjc+G9uCos6I3dSz52BN7Xqk+HyspzzrsKtdOdO3diDXYQzlHXPaZiyByIP
	 ABsVrYKGY6EiFqNXKObHKwT+UvNkVoVmClwM7ZYOhkZd1PPwGx+GNvaS5zg6Kk6RXe
	 5+SjQvxaEMlY29tb2oFitj/hSQVLZscEtYHnBoo4Z2v9izjWdSG1hUX65cfHsKP/yU
	 5WcC4JZDVSCQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add T7 peripheral nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-t7-node-new-v2-3-319d3c19b4b2@amlogic.com>
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-3-319d3c19b4b2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 05:51:32 +0000
Message-Id: <20260925055133.0FD501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: useless regulator properties without gpio
--

commit 61a44d137e93474e04a70d0ea481b570b8e6131c
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

arm64: dts: amlogic: add T7 peripheral nodes

This patch adds device tree descriptions for the peripherals on the Amlogic
T7 SoC and the T7 A311D2 AN400 board. It introduces support for the T7
Ethernet controller, SPI controllers, I2C controllers, UARTs, pinctrl group=
s,
regulators, and reserved memory.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/ar=
ch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index ca7536f772ff1..50df961fba75b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> @@ -24,12 +24,159 @@ memory@0 {

[ ... ]

> +	vddqlp_0v6: regulator-vddqlp-0v6 {
> +		vin-supply =3D <&dc_in>;
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDDQLP_0V6";
> +		regulator-min-microvolt =3D <600000>;
> +		regulator-max-microvolt =3D <600000>;
> +		startup-delay-us =3D <70000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

[Severity: Low]
Is it intentional to include enable-active-high and startup-delay-us
properties for vddqlp_0v6 without defining a control gpio?

Without a gpio defined, the regulator core has no mechanism to toggle the
regulator, meaning enable-active-high has no effect. This appears to be a
device tree schema violation, although it does not cause a failure since the
regulator is marked regulator-always-on.

> +
> +	vdd_ddr: regulator-vdd-ddr {
> +		vin-supply =3D <&dc_in>;
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_DDR";
> +		regulator-min-microvolt =3D <800000>;
> +		regulator-max-microvolt =3D <800000>;
> +		startup-delay-us =3D <70000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

[Severity: Low]
Does vdd_ddr also need a control gpio?

Like vddqlp_0v6 above, it specifies enable-active-high and startup-delay-us
but lacks a gpio property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-t7-node-ne=
w-v2-0-319d3c19b4b2@amlogic.com?part=3D3
