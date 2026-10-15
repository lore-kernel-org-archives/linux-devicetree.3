Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6268E3DD86F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056073; cv=none; b=AmUlPmpdN2PYZQconN5WHDjmj5e6ENsjMWMpwOFxuBOGyHQSzfE1bXWXc7zaWHk1f205lxGOwLc6D5LFidD9u6EilsAgdjvYyTpOePLrX72HfW9AfXUFD2l0THpuZntfy5ZMQdgwxyfQy4qRZ1kaPv2pS9rWJHQUdgRiuxKum9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056073; c=relaxed/simple;
	bh=BVcDLfpDj/oFkCe26qke9KzcwFHeCJSdn66nfZMpo14=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MU5j+eU7y61r2+taqcMyb5Nj5o1Rg1htAzx0/5YepPhuuIqrTIHktRSAAjKFGC1F6NbjnFgJcpHHg0QwePKgolikxODsCGC2pwgVjlPuxx2ZX0BCceiXvgO5I4kNYSnC25JGIW5Xs4EUMuBi+p/cUhdVqG0FzE6syxMF9O3YR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB0uk+3M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB0uk+3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947B31F000C4;
	Thu, 15 Oct 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056071;
	bh=BPEjcWcIJgQmPAxkJ+vFij99DVDAbya65v2U827pyLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gB0uk+3MBXHdUWX7hQKB2AMvTUGV5iupezQ0+V+wQDsyFQfmz2ZmtgRWgD3b+Zb6Y
	 Y40JK5bizCPFoXZcScyO5zQn/XqMwwYzPkENZCThDQYDZnE8y1Aw7vz53pC/2pTnIx
	 Q5hl08HgHEILU9DwMBLzc58HzmVcTwb55y85qqKubqhZsIywfIGwvjYUuuQzdc3hrc
	 GsruyZ10BziQAK3YjTujrEtMj0Z3X+Zmm0PsrYDBJ4lUmh78xabBrNjqZgP/+NP6sb
	 dkfdV/YIyhTjxVAiYaVehvKiOESUxnz6FBi+kvZYRKW0FLioQsMegWBpdlUBCWEUPA
	 2K6KODmlcXHEg==
Message-ID: <sashiko-outbox-172562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: oneplus-kebab: new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-kebab_dts-v1-2-1fee1204a18b@fhannenheim.net>
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
 <20261015-kebab_dts-v1-2-1fee1204a18b@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:21:10 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dts: i2c2 controller left disabled preventing PMIC probe
- [Medium] dts: pm8008_default pinctrl state is defined but unreferenced
- [Low] dts: gpio-keys-state pinctrl is dead boilerplate
- [Low] dts: downstream qcom,kona root compatible string
--

commit cbd728f8988cb73cd4c57ae40422faf37ea262a5
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: oneplus-kebab: new device

This commit adds the initial device-tree support for the OnePlus 8T. It
configures the framebuffer, battery, I2C devices including the PM8008 PMIC
and fuel gauge, and pin states.

Downstream reference: https://github.com/LineageOS/android_kernel_oneplus_s=
m8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay=
.dts

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm=
64/boot/dts/qcom/sm8250-oneplus-kebab.dts
> new file mode 100644
> index 0000000000000..3e9802db1464b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "sm8250-oneplus-common.dtsi"
> +
> +/ {
> +	model =3D "OnePlus 8T";
> +	compatible =3D "oneplus,kebab", "qcom,sm8250", "qcom,kona";

[Severity: Low]
Does the inclusion of the downstream "qcom,kona" string here violate the
upstream devicetree bindings for the qcom,sm8250 SoC family?=20

It appears this vendor code name is not recognized by upstream schemas.

> +};
> +

[ ... ]

> +&i2c2 {

[Severity: High]
Is the status =3D "okay"; property missing for this I2C controller?

Because it is disabled by default in the base sm8250.dtsi, without explicit=
ly
enabling it, the bus and its child devices (like the PM8008 PMIC and its
regulators) will likely be ignored and not probed.

> +	pm8008: pmic@8 {
> +		compatible =3D "qcom,pm8008";
> +		reg =3D <0x8>;
> +
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <112 IRQ_TYPE_EDGE_RISING>;
> +
> +		reset-gpios =3D <&tlmm 93 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Should this consumer node reference the pm8008_default pinctrl state using
pinctrl-names and pinctrl-0 properties?

As it stands, the reset pin configuration (gpio93) defined in pm8008_default
won't be applied by the pinctrl subsystem, which might lead to PMIC probe
failure if the reset pin relies on the pull-up to avoid floating.

[ ... ]

> +		pinctrl {
> +			gpio-keys-state {
> +				pins =3D "gpio1";
> +				function =3D "normal";
> +			};
> +		};

[Severity: Low]
Is this gpio-keys-state referenced anywhere?

It looks like it might be an unused artifact copied from a DT binding examp=
le,
as it has no phandle label and isn't consumed by any other node.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-kebab_dts-=
v1-0-1fee1204a18b@fhannenheim.net?part=3D2
