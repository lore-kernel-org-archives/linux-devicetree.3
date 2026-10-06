Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3E54704E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 04:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260255; cv=none; b=ZzBa8pbbuGbbhXo7cr6NYl/RsexlRG4mkRQj7pGCtJ+W8AFKMkDMIaNRAu700CowmR0zDO4P4UvBPI6Lr+ARO9YzRqE6dc+cLyruaET959Zv4DHUNb0jIp3OP2K0FHy6oxDlOZOm31/xdvqBoxeyJbn5nrx2dr5uiSJSxXaiPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260255; c=relaxed/simple;
	bh=mtSCGlThRoYEVULvk1zACRXcKpEc0uGyrwRIzA3hGPM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rT9gXGSHRMq7YrdgFFE8s7CT4eJSH4F5ZUYIjCzt6uYz5SbOJ1mImrVj6hS8Uf900qlkPzTDKx/2RdEJvPEIz8UmcwSF1eF5TjW7hdQPULeC4248kCjRE0TOxwO/4lB2JLTtw4GmnrQM4pKwBC8C/3DwqL9F379Dw5xI6QKjrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUSfwTQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUSfwTQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4081F000FF;
	Tue,  6 Oct 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791260253;
	bh=Wa7TJlUO24vY7LXy+sZzppiO9CgVtOyMPLitAlGGnSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUSfwTQ7akVKqLW2TgVzO4FdyGFq/3q+tTouO8vt0acjDgdegA6wFz9KqCh5swhGW
	 hhjRV7L6Jm97g40P7AEzSZo8UX/mhxP6CUDXeWMET/zt3TYNkhwAy8q8UrErvcdsi5
	 7UmgpgQYYvxEThgaiWvJEC3Mw/NtwASMbCqDxr/v8jF3Mz6kEcdGreieFMLqRnhbDP
	 K9OMXQGfxtv5t2eMqksQ0iokr5ttVT6UzC11prYhgvsJ1dNOjadxF6YznAeWUMLkyv
	 sv84S6Mbtml54P1janK5rih20XAQFCGkDP3mHghLvtf3YVEs4G3BNSlp0HYHjJuA7y
	 IXDrghg2ZAtHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 04:17:33 +0000
Message-Id: <20261006041733.8C4081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: amlogic: missing pinctrl for fan tachometer interrupt
--

commit a6a97db21df93ac09c2154310040802278dbb495
Author: Igor Velkov <iav@iav.lv>

arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer

This commit adds the interrupt configuration for the fan tachometer to the
pwm-fan node on the ODROID-HC4, mapping it to GPIOX_7.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/=
arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509b..261a42560a5e9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -21,6 +21,8 @@ fan0: pwm-fan {
>  		#cooling-cells =3D <2>;
>  		cooling-levels =3D <0 120 170 220>;
>  		pwms =3D <&pwm_cd 1 40000 0>;
> +		interrupt-parent =3D <&gpio_intc>;
> +		interrupts =3D <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
Does this configuration leave the hardware pin direction entirely dependent=
 on
the pre-kernel bootloader state?

The pwm-fan driver requests the IRQ via devm_request_irq(), and the
meson-gpio-intc interrupt controller does not implement .irq_request_resour=
ces
to automatically mux the pin to GPIO mode.

Without an explicit pinctrl-0 property in the fan0 node, will the fan
tachometer silently fail to read the fan speed (always reporting 0) on syst=
ems
where the bootloader leaves GPIOX_7 configured as an alternate function (su=
ch
as uart_b_rx or pwm_f_x) instead of a GPIO input?

>  	};
> =20
>  	leds {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-hc4-fan-ta=
ch-v1-1-4e7cecf0b45b@iav.lv?part=3D1
