Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A13BCD04
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129439; cv=none; b=aOB1tJfrnFe+OM+w6pyT0kxTgb+mMVPILUXuamZt9iCkDeMVp8H99zXT3CbffCSxtmQIESbw/be6FFFoT9jagvDsJhSnn81miJ0FYk9+C/C7admZfsMhuKTyciVg3rhu2TNlD6qAUGzI7gIDNnMbkZd8zvzJC4AK31+xcIPGe2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129439; c=relaxed/simple;
	bh=h3HK5ZJuqxB8hK8mDajz+PWbIpA1hOmpEnfhuZXJZfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n7tLrryXV/wfAkGGq42om1EKwgcOzIVbqWsirGiy7VTmuZ47eItIdWa7NK3PPdNWWau4Fx0SyngaQ+IvVgHHYVOeVmfA6i7kMpVPvkzVzEsRRvyvLTIZ9Qhqicf1xYdLK5C0WJ+qyymlOos4rn4sVDXXklw/Xu2Eu/zQAmBtxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtRPFndj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtRPFndj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E5A1F000FF;
	Sun,  4 Oct 2026 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129437;
	bh=PqV/2zKfnbCxXgiezeTuD28QODea5yNLwnsBqi2dqPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EtRPFndjGiDFzNu9+vlTAM4+y2zbF3vwQzVrdBiH2Ms+K8CX8fD6+Qh5AJLDEmzNw
	 jHmPrKjQ/a49nTmIi14JYhoPOaTZMEL09FnYKDFIIleQ5Jq+jjOObu3t8ttYPdfm0t
	 bg4939xVB3dwWl30CpHaDsmSIyJraGmCHho7qwJcGYemblR5W6GNg1Ergz/GqB/s5p
	 qamquKrW7WTsdUdM4akuwwuRcq1zs+rmyJT3WW7GryPPK+vYclgKz3XDRt1IhmeV65
	 f6Bp0wEprGLMSFlNEDOV7EnMR0E7Jpe/MgS2mAcmM/STBfVKoDZslQ+zEOipAOIsjy
	 gZgKGeahlEnpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] ARM: tegra: lg-x3: Add backlight LED controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004154456.145362-8-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
 <20261004154456.145362-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:57:16 +0000
Message-Id: <20261004155716.B2E5A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] driver core: ti,lm3533 unconditional probe failure without platfor=
m data
- [High] gpio: lm3533-core requests unnamed GPIO while DT provides enable-g=
pios
- [Medium] dts: tegra30-lg-x3: undocumented addition of unrelated hardware =
nodes
--

commit ff4e61027a1ca9aeb5769dcf34e03e97e0cb0683
Author: Svyatoslav Ryhel <clamor95@gmail.com>

    ARM: tegra: lg-x3: Add backlight LED controller node
   =20
    Add node for TI LM3533 LED controller used in this device for panel
    backlight.

>     ARM: tegra: lg-x3: Add backlight LED controller node
>   =20
>     Add node for TI LM3533 LED controller used in this device for panel
>     backlight.

[Severity: Medium]
Does this patch also silently introduce other hardware modifications, such =
as
a light sensor (avago,apds9900), haptic engine (imagis,isa1200), camera
flash LEDs (ti,lm3559), and critical power management parameters like
nvidia,suspend-mode =3D <1>?

The commit message explicitly claims the sole purpose of the patch is to add
the backlight LED controller node. Including unrelated changes hides potent=
ial
regressions.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot=
/dts/nvidia/tegra30-lg-p880.dts
> index f888987ce1340..3a5e66d869b1b 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
> @@ -155,6 +155,8 @@ panel@1 {
>  				vdd-supply =3D <&vcc_3v0_lcd>;
>  				vddio-supply =3D <&iovcc_1v8_lcd>;
> =20
> +				backlight =3D <&backlight>;
> +

[Severity: High]
Since the lm3533-core.c driver lacks Device Tree parsing and explicitly
requires platform data, won't lm3533_device_init() immediately fail with
-EINVAL?

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    ...
    if (!pdata) {
        dev_err(lm3533->dev, "no platform data\n");
        return -EINVAL;
    }
    ...
}

Because the backlight device never registers, will the panel driver
indefinitely wait for it via drm_panel_of_backlight(), returning
-EPROBE_DEFER and permanently breaking the primary display initialization?

[ ... ]

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 1f10f4bfb5f24..2dbef0185a0b8 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -1170,6 +1170,30 @@ rmi4-f11@11 {
>  			};
>  		};
> =20
> +		led-controller@36 {
> +			compatible =3D "ti,lm3533";
> +			reg =3D <0x36>;
> +
> +			enable-gpios =3D <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_HIGH>;

[Severity: High]
The device tree node specifies enable-gpios, but the driver acquires the GP=
IO
using a NULL connection ID:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    ...
    lm3533->hwen =3D devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
    ...
}

With a NULL con_id, the GPIO subsystem only searches for properties named
'gpios' or 'gpio'. Will this fail to match 'enable-gpios' and cause the dri=
ver
to fail probe with -ENOENT?

> +			vin-supply =3D <&vdd_3v3_vbat>;
> +
> +			ti,boost-ovp-microvolt =3D <24000000>;
> +			ti,boost-freq-hz =3D <500000>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			backlight: backlight@0 {
> +				compatible =3D "ti,lm3533-backlight";
> +				reg =3D <0>;
> +
> +				led-max-microamp =3D <23400>;
> +				led-sources =3D <0 1>;
> +
> +				ti,linear-mapping-mode;
> +			};
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004154456.1453=
62-1-clamor95@gmail.com?part=3D7
