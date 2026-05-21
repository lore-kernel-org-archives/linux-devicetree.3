Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AF3349CCC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377018; cv=none; b=b6Oza1AIi46c+scwesyHRzPIEVc5A//pNJI7WbQ8/x7ske+KF7MhSYPN1mLmOgegwxsV99rjCY7v/sFVBuTeXa/ONU7B9nBejHuZEnNLVzHQ4Pp4MomW+z5+QqYl/IHlOId4E7xrKSyAbkuf6o/inCFDueYOgWvvWMPTgIMJZ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377018; c=relaxed/simple;
	bh=CZ6UCaoKFcxyhpL5zWZ7Yz/Qg7pO2PA8TlEFhiouX/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rGf74vug3f/pSE08LJkqgc8qW22uzTnTQ5PoYFwn1DKjxNweY2vTzrnKTFqOXwj2JOfQLRUAYR4BMRNuMfCLcvHF9s7Fdt6lblJxH27HyeDDs39mlPL4gX2EBBu9JdzJLpW4ZtU7w5W3CwxehyvoC2p3P6LoN7UgkMXKsF+QiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGTXLXW1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGTXLXW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8192E1F00A3B;
	Thu, 21 May 2026 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377017;
	bh=SzvulqIfCf8YVTZqD/FAQxd3Q3IjlepRJhX79z5mHGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CGTXLXW1e9GP6BdxTtrGn3xPKW0Gh8MRDobU6q4zBqioWVpT95Fz92AhzJtY8yAL+
	 hyRiVll1JyLupJGqLY9P2511pcsxgvGE63VmBnh6t1ofCT+f+/0GzYPnH7FTm38teo
	 qQ7+5nXHbwmL1eunNtsLcxccOzQlQvPdt4u7LEzFyUPf17G2uhv9b91GuECvhgOuv1
	 xi69RRZ0AYnSWHU8Cu0McWp2ksveXSvx/NFTgZ0B8+jVyBe/hqL5NdWFFq9c35K+1N
	 MgfKveUwPf2QxKYRDZl209zzjRUs+iVoujMdb66b1WGYMQxZwCBVC+tCL3XqDByCMP
	 NluW6J9TZ/vCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/15] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521150038.103538-24-ivitro@gmail.com>
References: <20260521150038.103538-24-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:23:36 +0000
Message-Id: <20260521152336.8192E1F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ILITEK touch controller interrupt is configured for a rising=
 edge trigger (`IRQ_TYPE_EDGE_RISING`), despite being an active-low signal =
(`TOUCH_INT#`).
--

commit c5a7c369552e8dfc7c50d86e7c345bdd74ec3403
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 7" DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch Dis=
play
7" DSI on the Verdin DSI_1 interface. It configures the SN65DSI83 DSI-to-LV=
DS
bridge and the Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch=
-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-ds=
i.dtso
> new file mode 100644
> index 0000000000000..0fa8306324b38
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dt=
so
[ ... ]
> +	touch@41 {
> +		compatible =3D "ilitek,ili2132";
> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
Is this interrupt trigger configuration correct? The comment identifies the
signal as TOUCH_INT#, where the '#' suffix conventionally denotes an active=
-low
signal.

Configuring the trigger as IRQ_TYPE_EDGE_RISING means the hardware interrupt
will fire when the touch controller releases the line, rather than when it
asserts it. Should this regression be addressed by configuring it as
IRQ_TYPE_EDGE_FALLING or IRQ_TYPE_LEVEL_LOW instead?

> +		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
> +		reset-gpios =3D <&main_gpio0 35 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521150038.1035=
38-17-ivitro@gmail.com?part=3D7
