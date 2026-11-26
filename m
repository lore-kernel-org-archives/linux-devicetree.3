Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722458;
	b=tAekX5Dtzrbv8vV7B7mkzcyGrmAb0zslNi/2aY3cACHgfWIoThjcZ7Wpp4sVgCz2cNhG
	 a+yfd8d8s4sjkjpHzyVdoI0qsxG1uVeQ/7CMZ3UsHGrX/aM2dM5vFz9kVBCjrdsabBiwf
	 p4VxEyu1GZ5VKf7bj9AhvqmeAweiUFF4aOfdjRt49UjXIyS2MsTerGZx07BuRwdHulEhK
	 2xcbGlq0OPfLZRJkdLe9epjxtlUfSGCmKBnR78snY4FeFbd1jzhrDaHkxW+gJ056uj9Um
	 3Sh5d++pIX9rVeCXZtpQ1atbYE9uAabFe5FoQHTrvPJpAI85ly/9v87xXK3AMaW1cUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZwNdfJEWUtgIHR9kPjR/JEPXv3O1ikOBjSKnFDPee5I=;
	b=Fbm5NcUSz01JTrtGLh997vpNTKZdX6toWd74sXve+MK4yNWoh472VukkieMsTIc9Mf/O
	 /AIa5pIkTtbT2M904Kr6nI9trv8fh2QjW0DZEl+jP7IbXQW47oYnsl1Uw4EturUT4V0Ym
	 uZ4pqo3KIK+VRO1l1BSeIqfBqVtklP1GFUNfCO9Bwq0/7/cU/aVt018gsnUb1F5/R75Qd
	 JYybK+0+fjSbgGFCAkXk+72y9ajOLFiVcQ/0xZNEH9kPDJHMdw34bx+skmXluD4TXezbm
	 7CJ5slyrXJT1VTSyj8ctnRm/eoqYbBYp/dyJzmot0RQmn59LtMmYbgnLWNhdAf+1TFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dBpi6LwM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dBpi6LwM
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so4686511a12.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795722456; cv=none;
        d=google.com; s=arc-20260327;
        b=Sa8TegA4lDZ/VT3osRazO8Nx3sFTvlQ0sRbUU3OS1X8g3WmTG37n5mragdo2W5wijy
         DF/jXB2Fqi8nO/zi00a6gVB9YXO/uA16QL20W8fG9mhz5+Y32OQiITc54gby6zChsM/s
         jPckw6Zr/mwjB82247PAITvUH6nHluX5f4eUc33q6vA1kPU3mTUg6RmGIhJ5IOS7OylK
         EknK3g7Pp4aS4cqcQ36M3FPo+i1vLTuxqNVhGDpQfaqRkopXLl37OdPin50CG5YmsaYy
         2GXW9QuPZ1D+Mf+Tq3n4tzISX21vv6rW2Z6bxZOIWV7LJURLkE6tZ/W2ItQPALbn2XYo
         72AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZwNdfJEWUtgIHR9kPjR/JEPXv3O1ikOBjSKnFDPee5I=;
        fh=VGUNi3EYn147q0tYo8UylzR5uDIobTQiGt6y0fTMLjg=;
        b=TmJWrSo7JZQj31uMzOYAskVWRhjzbnqn5jkw2Y0UbYCugGqqeBf/qSR2z5KDLPjxiP
         3df1jCL4KjW6fmzX9WN8Tn0yUWdl8a5pr9SuLT4tyfFjQRj4o/GJnxhwMqdfZY8W2xi4
         ZCYfkU3GldDgHTGtPM65DcJxbivt7t6On0mcsDZmuusxBMMZThM368QcF6VS86LF2rkJ
         YiSg48PlGcPh8tTcTpWt6cxqUVjHMPNsX5J2ZAPfyEmiGVpM4FlOCMPGlq1cagGK0eyK
         HKe1JK4c1xCkBVUfGry9gmXEOtoI0vOBMBI58m7zLvEQXC+9JCZJeBlGFBkhGWQ12tja
         vN2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722456; x=1796327256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZwNdfJEWUtgIHR9kPjR/JEPXv3O1ikOBjSKnFDPee5I=;
        b=dBpi6LwMnydME8z5YCPafEBeeY+nZhqmMSUpxMVL29N5W0LptXUyc9FJBNMI7CuSSx
         dAqFsEVOaM3roEl2J8v3Mq72n6857vqacS0z46eZTYBK2dBJd4+Ce39JhqrptUGGJAXh
         4v4qFVOQdsInFebh5ZJf6DIJuhyiXF0fZ1t1e7rGB9AKZvedWBQJH0sXvH6Nj8vQYElt
         OigEsjbdVqzmONCXNO2K6FP7IUg1MaSfj6lvwXi3gqF2K6Scsf0mp5FvubqcKsQ8O/iC
         iOKgpj56X4/kyZ2HRKVX6XEps5xlMSD8gDD+8WoKo5oyr11DGJ/4poKCzQa+N/05g3Fh
         KHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722456; x=1796327256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwNdfJEWUtgIHR9kPjR/JEPXv3O1ikOBjSKnFDPee5I=;
        b=Ujc5V9IMprQRi4AmVnu7kNA9Za2fkzANyLs1SwullrzjdFSEfIeI/n6LvyOi8ERRoI
         4LfvOK0GEix8VN6PlSvDrs0yN8ahQrN/0gAs9VRu7GcAe6qIFn05h3OM9IlzQiom0iXn
         TVPvSVaAo5TYEgQISmz+dOjdao08p27qjOkDVOqfbayfOqG5Y3iqvObXHWB/HF8GDf5v
         rYXZKwE18fX6JuuU89111qoPVjBI3ltNq2dCItgN4o7dVk6bZjJNGViibNHY+DSJSmTE
         3wbENH1Wz0N9CpfAyMzLZvp9Z9Gc2PSydbxD/JjnZ3/EEXsLsv7R6Wpti5Ayb2DfS/ur
         sm1A==
X-Forwarded-Encrypted: i=1; AL+hErG1YCz4ObVrn6CmXgVDeGjfFpZEaANNCdLYoB3+niBv1J22apI3zgaSBLUbzC+jdV9qWuWwKNlJlaEF@vger.kernel.org
X-Gm-Message-State: APuU4Z+5qjDgNr6b3q+dEzQVAZ5uOdOC2rk4QNFgrhEGDbC2YOKAJz2F
	jZArls1omsHYX0U1zAo7ZZ9tCJtdLubi3B5zIBjCu3//LOnLDKkeO0GovZaoTRYbM4VkM2YJxkV
	0j+HoMtFsKsAilXyGt7UwI18KSftTMEo=
X-Gm-Gg: AZFdTZcXOnBJBcIZf/ctrS5ZSPNIG+bWG9X2sORvtMxQwAW4MPCoxUaZe3E9ZmBRUNs
	EkkzXunP5XNoWRb3pOf+15Z3dwRH47ltLDIPpEUs4aa/HIbTlS6O2MI89W1PH5ZZ/5hxHwLruuN
	FaIUE+YU8o8681n3SDwqY1bil64EEyWK75kr0QUt1D7meucwyzp2XCrz1Yc+stsm3/F1XjvDRi8
	9X4rU0TvCSVt0hVCL3FiYPY46O0lyReftzQDaAaPFAVb2Bxx28CQCnZo77phOLDSYiDidIy3Dsp
	Bb9Z7VBkjdJtGvGP0N8I4nZv8joQFWNpedNVUi7h3OiP0mZef39tR5zrCx3bleLO8fISXln5y5C
	qjC8kW7QgBMkesSrMpwdarPnZbuZywSnXOmj1sw==
X-Received: by 2002:a17:907:9283:b0:c51:b3bf:14da with SMTP id
 a640c23a62f3a-c51b3bf1f93mr487105366b.39.1795722456064; Thu, 26 Nov 2026
 11:47:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125183742.3039752-4-a.shimko.dev@gmail.com> <179571839263.3135.10510245952431569206@kernel.org>
In-Reply-To: <179571839263.3135.10510245952431569206@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 26 Nov 2026 22:47:25 +0300
X-Gm-Features: Aa3M54r1QwvC9Q1S7Exzevzv30OuVOCFWJaZiHNYt3jh78euCSa6FdkwbAkWzIw
Message-ID: <CAOPX747OUSNbg2vqba3LL8r0chrTdpz6hOg1yf-n_wMX+fpQag@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: phy: dap8211r: add PHY LED control support
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 9:39=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] dap8211r_led_hw_control_get() (drivers/net/phy/dap8211r.c:322)
>   builds its rules only from LED_x_CON (0xA00C + index, read at line=E2=
=80=A6
> - [Medium] Speculative, because it depends on the reset scope of
>   DAP8211R_PHY_CON (0xA001) bit 15, which the code cannot show.


> [Severity: Medium]
> Will this LED setup survive the next call to dap8211r_config_init()? The
> driver keeps no copy of LED_COMCON or LED0..2_CON. config_init does a chi=
p
> software reset and then reprograms only RGMII_CON:
>
> drivers/net/phy/dap8211r.c:dap8211r_config_init() {
>     ...
>         ret =3D dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PH=
Y_SW_RST, 0);
>     ...
>         ret =3D dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, DAP8211R_=
RGMII_CONFIG_MASK, set);
>     ...
> }
>
> config_init runs again from phy_init_hw(). phy_attach_direct() calls
> phy_init_hw(), so for MAC drivers that connect the PHY in ndo_open this
> happens on every ifup. mdio_bus_phy_resume() calls it too. The LED
> classdevs are registered only once, at probe.
>
> DAP8211R_PHY_SW_RST might also reset 0xA00B-0xA00E to their defaults. In
> that case the LEDs would go back to power-on behaviour after an
> ifdown/ifup or a suspend/resume. Meanwhile ledtrig-netdev would keep
> hw_control=3Dtrue and its cached mode, or the LED core would keep its cac=
hed
> brightness.
>
> This depends on the reset scope of PHY_CON bit 15, and the code doesn't
> show it. If the LED registers survive the reset, this doesn't apply.
>
> Can the reset scope be confirmed? If the LED registers are cleared, could
> they be restored after the reset?
>
> > +static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 i=
ndex, unsigned long *rules)
> > +{
>
> [ ... ]
>
> > +     led_mode =3D dap8211r_read_ext(phydev, led_reg);
> > +     if (led_mode < 0)
> > +             return led_mode;

Confirmed on real hardware: asserting DAP8211R_PHY_SW_RST (bit 15 of
PHY_CON 0xA001) across ifdown/ifup cycles preserves the contents of
LED_COMCON (0xA00B) and LED0..2_CON (0xA00C..0xA00E). Therefore, no
saving or restoring of the LED registers in dap8211r_config_init() is
needed.

> [Severity: Medium]
> Should this also check DAP8211R_LED_FORCE_EN(index) in DAP8211R_LED_COMCO=
N?
>
> dap8211r_led_brightness_set() sets that bit and leaves LED_x_CON alone.
> The old rules stay in the register while the LED is forced on or off. Onl=
y
> dap8211r_led_hw_control_set() clears FORCE_EN.
>
> Consider switching the trigger from netdev to none:
>
> echo none > trigger
>   led_trigger_remove()
>     led_trigger_set(led_cdev, NULL)
>       __led_trigger_set()
>         led_set_brightness(led_cdev, LED_OFF)
>           ...
>             dap8211r_led_brightness_set()   <- FORCE_EN set, forced off
>
> In the same way, writing a non-zero value to brightness while no trigger
> is set leaves the LED forced on.
>
> Then switch back to netdev:
>
> echo netdev > trigger
>   __led_trigger_set()
>     flush_work(&led_cdev->set_brightness_work);
>     netdev_trig_activate()
>
> When the PHY has an attached netdev, netdev_trig_activate() does:
>
>     trigger_data->hw_control =3D true;
>     set_device_name(trigger_data, name, strlen(name));
>
>     rc =3D led_cdev->hw_control_get(led_cdev, &mode);
>     if (!rc)
>         trigger_data->mode =3D mode;
>
> On this path, set_device_name() skips set_baseline_state():
>
>     /* Skip if we're called from netdev_trig_activate() and hw_control is=
 true */
>     if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->l=
ed_cdev))
>         set_baseline_state(trigger_data);
>
> hw_control_set() is never called, so FORCE_EN stays set. hw_control_get()
> then returns 0 with the stale LED_x_CON rules.
>
> Does the LED then stay forced off (or on) while sysfs shows netdev as
> offloaded with link/rx/tx set? It looks like it only recovers when a mode
> attribute or device_name is written again.
>
> That doesn't match the kernel-doc above either, which says force mode
> "will be disabled when hardware LED control is requested".
>
> For comparison, gpy_led_brightness_set() in mxl-gpy.c clears the hardware
> rule register on LED_OFF:
>
>         if (value =3D=3D LED_OFF)
>                 return phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LED(i=
ndex), 0);
>
> One option is for hw_control_get() to return no rules or an error when
> FORCE_EN(index) is set. Another is for brightness_set() to clear LED_x_CO=
N.
> Would either of those work here?

agreed

pw-bot: cr
