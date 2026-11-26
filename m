Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654157;
	b=4ETfSRrB+4/9wGSMvq3Q4KiGTiOwDN6lwIOsz/KA4zMfCyF6UkM8SlKR+0Lpx/Bnp8tc
	 tvqB2O+/5YA1x8E1vR+PqxMqaAlikOGpHDB7IFQgYshycCq3DCtyP0iBC9ayJAhp9wT2/
	 Zv757uP7rCRL1rHKXaKoih5jztgF9wLtjyT83jahOCfn4QDyFyceTjgZVAaMuzNBCyssa
	 AoEFM6T84+R6fEDy6zc2O4DCKZsquFGdc2kq1bk7HmoSFkUODOq8PEKxIHqlh6q169ZeU
	 82lGCsbiyusbh6iJg0TJZCWqs7pdot9JYUsqCHNmY6/ajeYVvI2Dx2Cybg7j3r+W9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654157;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZH7wIRa8HvBD1WFzsZXyuYww4crO0sAmsO3sq1M+jg4=;
	b=Ejn2HEOej0PNl5z9kRu0H+ASibo6Qh/1tG8aiNiaFsoBLTVY6Dfu8OdlMz+fErLZcnVW
	 mXjB0rBvbu/apIOzJa0rLK642FHo6AWz1MBnwbDWq1GWIDeC9ejwsiJDXSuBm6N/fwLR2
	 SQ/7ZDqi3972tJ4Nn09PDX/VSFS2piwPf5I/JUsS7pimsj49zDvaayoVsCJUDH/8C9x+I
	 m0h9o0wbszc29jIvVxjbvIK5NJCsta1dEnn3xyvOap0i+csQhIqx4aWYcikbdb0gNBtqE
	 sx+S3eVVrri46IxSMVx9G0Hn1Oa3EQ1pupLR4FKhxrIRVjyvPF7ytztaZGGbjdxE+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=og9ID4EB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DD606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=og9ID4EB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB971F000CA;
	Thu, 26 Nov 2026 00:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654157;
	bh=ZH7wIRa8HvBD1WFzsZXyuYww4crO0sAmsO3sq1M+jg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=og9ID4EBY9mbuQgUw+C3cdJh0qoKayyFvG4wJVQRaguPN90E1oTP3HPMerSjViO8b
	 WYMtql709UM3f2VA+mcWI7aCxbwj6dOfdID0+CWShnlSAuZJTfRN3QEJ9oWIDc6muk
	 fPMuVE4XWT3/mbW1z6dvwRKZbDn0Co33N0bZRPfF9d5JrvIA0mq48/1JWClzspPivX
	 BOPofwHSFRTJSsGdrYsOe5wbEyLdx3uI3ahpSPitfbKkTyRSR3JK9Q5X6/R0OhTagc
	 mTyPujoSo2ew+dgnuvkCp1zQNtRPOd+0YO8Q0q2TzEpYtV5gq8TW3VakGOVZKxvrnH
	 vXP9eieyOnkIg==
Message-ID: <sashiko-outbox-234502@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/20] ARM: dts: ux500: Move the pin controller out of
 the simple bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-18-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
 <20261126-ux500-dts-after-powerdomains-v1-18-791cd62d8870@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:49:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ARM: dts: ux500: pinctrl node before soc breaks
  nmk_pinctrl_probe() GPIO lookup
--

commit fe9e72b390eb8a161cbbc201a9ac8765c960dd3d
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Move the pin controller out of the simple bus

This commit moves the pinctrl node and its board-specific extensions out of
the /soc simple-bus node to the root node across the Ux500 device trees.

> diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/=
ste-dbx5x0.dtsi
> index 920d07fbf00e7..05d91367a38af 100644
> --- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> @@ -107,6 +107,14 @@ map0 {
>  		};
>  	};
> =20
> +	pinctrl: pinctrl {
> +		compatible =3D "stericsson,db8500-pinctrl";
> +		nomadik-gpio-chips =3D <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>,
> +					<&gpio4>, <&gpio5>, <&gpio6>, <&gpio7>,
> +					<&gpio8>;
> +		prcm =3D <&prcmu>;
> +	};
> +
>  	soc {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;

[Severity: High]
Does placing pinctrl before the soc node cause nmk_pinctrl_probe() to
run before the gpio0..gpio8 platform devices exist?

nmk_pinctrl_driver is registered at core_initcall, and nomadik-gpio-chips
is not parsed by fw_devlink.  When of_platform_populate() walks the root
children in DTB order, it creates and probes /pinctrl before descending
into /soc to create gpio0..gpio8.  nmk_gpio_populate_chip() then fails
to find the GPIO platform devices on platform_bus_type:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:nmk_pinctrl_probe() {
    ...
		nmk_chip =3D nmk_gpio_populate_chip(gpio_fwnode, pdev);
		if (IS_ERR(nmk_chip))
			dev_err(&pdev->dev,
				"could not populate nmk chip struct - continue anyway\n");
    ...
}

Because nmk_pinctrl_probe() continues and registers the pinctrl device
with nmk_gpio_chips[] unpopulated, claiming pinctrl hogs fails with
-EINVAL, and drivers that probe before subsys_initcall(nmk_gpio_init)
(such as the PL011 UART driver at arch_initcall) fail
pinctrl_bind_pins() with -EINVAL.

Placing the pinctrl node after the soc node ensures that the GPIO
platform devices under /soc are registered before /pinctrl is created.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ux500-dts-=
after-powerdomains-v1-0-791cd62d8870@kernel.org?part=3D18
