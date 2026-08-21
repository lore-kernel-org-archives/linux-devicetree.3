Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD235C689
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312822; cv=none; b=sUkd4RPgs14gYgNzsbEE2nbKOHzZaCExs9OhV9YuMQbfZaAuHToA3AAXtrRbTKMIlTUPQDFGxY76P8KXYj8wZkQvgUyWfvw6VInXzxvq5Z+7NMF9tJ+SWuRsGUoJHIFx+F5jb0LnLIAAPX+abgrPGmfpHdiDJQnDRF9VVvo2lAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312822; c=relaxed/simple;
	bh=vAdcROyZLyHVEiPyIeBlzuY7DF+JCQicJLL4X/az/rM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuVaF49NG/ivgyMxOKeVE+CRX6ueM5Z8VjYD2hbVpl6DEfsiy/pB4t6YwUnmb8t5V4K7m2RxvUZ57r0ZhBPhIspl6Emu7N3lBs+TOgpPOX85vEPHRG/jq3CCE0hCzrrBXupeGGTLBUZIu416XrvlMBuPP2b2OfGyBB8+VDZQ1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmN3dpzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmN3dpzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57441F000E9;
	Fri, 21 Aug 2026 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787312812;
	bh=5/mVvny7ET416kI3nWXXTRwqGEI9z5zUPjbn9e1rGlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmN3dpzG2zyU2oGs8yN4tUKHXVPu7GIbLD2OPrrb/oYNx73Cab8Sb5eisNkcc0pO3
	 923yTpclMsPdOAzmc6vb8hBbw5N70IwdfZEDnJq2QValJxdl4JfIlS2+i++IPUp6VO
	 cVpbM5dhvAXTWM2Dnfuf+p8MXN4iXSSc734MIbOwNz4SHw4NXrM5O95ymrsy15vE+G
	 PhN6O+fT5M3OR5+B8i+VQzciUTTQxEyo1sthjLckPr3gXodzO1e4lnEmtoJgoj09Jv
	 I0Z8VVOOgF4m16sUJsg3vREu+2NgkZHODIIWY2C79Asie+v4laLHd8OhMhkH4onVYz
	 H0SP6flkP7BVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-next-patches-v3-7-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
 <20260821-next-patches-v3-7-cd64bcef6e21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:46:52 +0000
Message-Id: <20260821114652.A57441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Contradiction in Supported Features regarding backlight.
- [Low] Unnecessary Hardware Enablement of SPI2 bus.
- [Low] Invalid `brightness-levels` array in `backlight-dsi` causes boot wa=
rning.
- [Low] The dtb targets in `arch/arm64/boot/dts/qcom/Makefile` are not sort=
ed alphabetically.
--

--- Patch [7]: [PATCH v3 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T ---
commit 5a94602cab46fa97db70f855960005f354c8b9aa
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Xiaomi Redmi 9T

This commit adds the devicetree for the Xiaomi Redmi 9T smartphone, based on
the Bengal/SM6115 SoC. It defines memory regions, regulators, and enables
various peripherals like SimpleFB and remoteprocs.

> Supported functionality as of this initial submission:
>=20
> * Display via SimpleFB/SimpleDRM
> * GPU
> * I2C peripherals (Backlight)

[Severity: Medium]
Is the commit message accurate about backlight support? The device tree mar=
ks
both the backlight-dsi and lm36923_bl nodes with status =3D "disabled", whi=
ch
would prevent the driver from probing.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 821101c6d338e..63d678ab215e4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,6 +340,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4250-oneplus-billie2.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-fxtec-pro1x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115p-lenovo-j606f.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6115-xiaomi-lemon.dtb

[Severity: Low]
Does this break alphabetical ordering in the Makefile? The hyphen character
comes before 'p' in ASCII, so sm6115-xiaomi-lemon.dtb should probably be
placed before sm6115p-lenovo-j606f.dtb to prevent future merge conflicts.

>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6125-sony-xperia-seine-pdx201.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm6125-xiaomi-ginkgo.dtb
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm6=
4/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> new file mode 100644
> index 0000000000000..881e05b70116b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
[ ... ]
> +	backlight_dsi: backlight-dsi {
> +		compatible =3D "led-backlight";
> +		leds =3D <&led_backlight>;
> +		brightness-levels =3D <255>;

[Severity: Low]
Does this single-element brightness-levels array trigger a boot warning? In
led_bl_parse_levels(), the driver checks if there is more than 1 level and
emits a "Not enough levels defined" warning if only one is present.

> +		default-brightness-level =3D <190>;
> +		/* Backlight controllers can differ between panel variants */
> +		status =3D "disabled";
> +	};
[ ... ]
> +&spi2 {
> +	status =3D "okay";
> +};

[Severity: Low]
Is it necessary to enable the spi2 bus here? It appears to be enabled
without any child nodes or pinctrl configurations, which might hold
unnecessary power and clock resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v3-0-cd64bcef6e21@gmail.com?part=3D7
