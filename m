Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451065;
	b=Im7C7FWS1yLEBI3eaoc/00Grfw19KahYhCkKWbOfZELxumWghiqrmfDf/CjZCBKcBcSN
	 iYTkldaTZ3p7R3Hin8O6E6VEq59/Rs2DQ3Sf5JDSDfvmkkcKwJ9OYZAF8g9HFkwGYbowl
	 qTOmaAACgxTvB5Ahq0K7ZDITmddpY5ZziskJo/ebds/R4CBfrSOxngZy3GRWOJgLTLrKV
	 AG8fX5sGFul5B/RFWTugFSnwvtbNTuXftwH+mHsfCZ9QBmyxWAV4NF0gnZObXoaW0tXXm
	 jtgtXRB85FZXl0hr7+sJljnfbjBFtkNYMT4xO/dGWlEoNbHCz3+dBz8Vxp8iKpscuFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
	b=itWsip/A601vYfi/192y5n+zhnpsWHeU4OgoFW/doMZSPYEkyb4VptjzmSVj0KVkjFNy
	 9D5/BEVTyfma+Y5RBWbEDRsJqndF/eOYfj3scmTDFs/BA/+3/l+lFRMC1fH97Ue8fJN9Q
	 tB6g+pqfqiwTRvGKevqzS9uTyxEYLiwtGznvVO5nv2/mmD9E86d0hzkrq/Mb/WbOshPNC
	 MceZEYifEEC38JtW/0zVChWQPm63HfhspKOSPmNBbl8HvaNHA5RXYtbSIztERmCEOWklM
	 UXCc4mES+vc1kZYobV0s/g0kE40NFLCeiha9JgtJ325dlFGuzjrz3P5uXO2wTYMOIZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ACF606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87ACF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c511c0e2826so404212766b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451064; cv=none;
        d=google.com; s=arc-20260327;
        b=VmfToWotnA9S3FPGeSKGbvLBBSHthTOCe9ToPaAz/zExYMQlZiU/9ESmTJSlfMz6rE
         eLeyNlYZTIaxaayZBgw+4U+ACROta6cGVkHRQKNo1SrGdQHrMGbEJt5ouPIP/tjNZu6+
         3dxOz/wRXdVBMc4JWSgiKG9JfGxLB3HQLngCJ3IPPgtP4JS8N9NJW11QNH5EpfGE7Kfq
         3cQXAxcljk5bGwGVxffa4djR39KeAlUg2507ifr+p8H8kPJRb6vtps2ZcQCwrMb2V0SV
         hvemVQRo9OYS+ym96eN6qI6OnnG/5r1WM4xZvWs4I8wFw0vH7Pt15zOfC8secdmSS/qa
         g5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        fh=+gFRvA5ClKeT3kVDAHoX0eEnMAah2roo6uqHmEJrdHk=;
        b=QXSrgdeaR2IhQwqGvA1u8tUauLZ9MoLhgrWM9OHSmg4zrT4vuOHjS2iGWrs5WevgCx
         rnuQISga201tCNA556GiQd1f/P/ldtS6juze1+UVhspPRgcHZmaULIfwCF2azZsn/H53
         eKi0uz4Pwzz01JPmwBe4l/6kOll/vgA3ki74vQz+qc5JZzxzL0n3ycv8/QJyfFaWH81B
         bwOIw7vBMuEUljTWdFTnSbe/lNRK8e7R7CZAJTb7lnUBNoN/vJe6yahf3CVOC0V1v8JZ
         FoK0bcK/MLJJ543kMyPgXVBRMRPTJPuPLqwbu9JXK01w0oYUQqDysqxG8hfDy7nHHM+1
         BqaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451064; x=1796055864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=kGG61wye3HV3NP7BQ17KP5dlch87le463+NAUdJ0Azg5wUYimKiAXVX7T+vAKgW4n4
         USmVJ6ccq1JiCOBFkF238YbF4N9Al3OehytGod9mVZIrZDCu8bHXwPxRDjfQgB/x1z4S
         dG37hmDbqD1JMdGkG1LnHRi44iWi199K6o3DAbckMhYBQRRZb2X7RzPY1yIFuQ2nrFL+
         xwLWYkuR8i2t4oLid/D0xml/jOJL9hY+et8bBtzEkPqj9JXq1XxiW3yn4r+SFuAmmJfe
         thBHf/UcvioFJlCVfIwSXNxW6mzt9E7sOVMxo03V5lZZZh/KAq2Dfgx06TI7XBA0z2Zw
         G++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451064; x=1796055864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=HD5R04SmCv8oDMjaf+RX04B5DT94f6b0fIcljHYyavLXwtl+gnUt5l6Oflweyao4Cz
         dHtcbqaCvkbqVI5/wl/Di7TPo0xyRV76au5jzZsTmJBbQkGgQnhydXGM6xg4e1+Lv+lJ
         pbmw9aKpQr6OYG1RDQzT6I1/1MJOEL0X8W0JaegZM4RCD9DyD3IMGhbklrWPvgZwY5rb
         xjuFeaR6WuhOWmm8F3RPr3LbFwoVHEQRYSujxrUVjQNgQnHLJULyQXGb3X5P8TCCfzzW
         bDrD3GcTnyLt0HEr3LL7QgQEqZUn4min0F9QHRGZqOLqGmQz1wk+KlbN/P42uXcB8WPZ
         hJ1Q==
X-Forwarded-Encrypted: i=1; AL+hErEKexzAalDkDage8mhEPelLGR4JqqUnJxIx1YbDkZWEUGhD0mEuVbjI18MHXLo1kn7djm+7GuJoXyPu@vger.kernel.org
X-Gm-Message-State: APuU4Z/RnoEVWNJ1S/CjXQcXJu7iQ3KWDivGfadpriuHPvnI1OwKu3ic
	caeK1JXjcengKbcQmKhjz0E3d/zJIOhwtK6Vk+u9qSjLFBqdpwBqbYIXmikoQACZcJT20FBZgbx
	4SEpPSBThVglCi2GydK2J+Ym0PlXcie8=
X-Gm-Gg: AZFdTZeAmgyxrOAa962ATmOqLdFeaUX/5rLOC1JAU/xo6iRGi4cwXzhctVRYG4R7I+u
	lIzsL+5BZBbLQubCJ2tQOA0JgL8urDtqe0dtgPuljKgQJSx3LdR8JMvefDVAblzTFQXT0xS/l8p
	vcKrfVDyisDN4iJPPsMkLjakHYf+xi3Mq/aAo5g6jT2oYdFylbpeLptv/LgXuLFVbr025NNgGHq
	NSjfRCFBwPsIAs7Fkb9vJ6qEGwg98l4J7vAjYluuGk29qi4/3crlmfzSZL6t+HwepIQtQqht0QW
	qE2cAdXYy9VSslrAtSL1TxKcC+m02TlZ27BWA6Q8A1mWSnaAogN/HEkLri7mCWNtCasL2kFVTsd
	FYvgv5fzJzWj1yYU0a8tlDC9BQBvrpLYEqjttmw==
X-Received: by 2002:a17:906:231a:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c513aad2400mr684425566b.25.1795451063824; Mon, 23 Nov 2026
 08:24:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-4-a.shimko.dev@gmail.com> <179543998366.3135.8537500779592480863@kernel.org>
In-Reply-To: <179543998366.3135.8537500779592480863@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:24:12 +0300
X-Gm-Features: Aa3M54pFMGCEqfrknuxTm9QQEvcIIV5arWsj3tZLkp59n888HFnWQSHbf7MxHro
Message-ID: <CAOPX747Whtrpa-aP=AhtaFfqMpqHHYVMJ7jNZWCdgmMc1_GYag@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control support
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In drivers/net/phy/dap8211r.c, dap8211r_led_hw_control_get()
>   (lines 312-351) does not undo what dap8211r_led_hw_control_set()=E2=80=
=A6
> - [Low] dap8211r_led_hw_control_set() in drivers/net/phy/dap8211r.c first
>   clears FORCE_EN(index) in LED_COMCON (0xA00B) with=E2=80=A6
>
> --
>
> net: phy: dap8211r: add PHY LED control support
>
> This adds PHY LED support for the three LEDs on the DAP8211R. It adds a
> dap8211r_write_ext() helper for indirect extended register writes. It als=
o
> implements the led_brightness_set, led_hw_is_supported, led_hw_control_se=
t
> and led_hw_control_get callbacks, using force mode for brightness and the
> LED_x_CON registers for hardware triggers.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 1fe20efd394d7..b0fb3cf89b55a 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
>
> [ ... ]
>
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +     int ret;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_0_CON + index;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret =3D dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R=
_LED_FORCE_EN(index), 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Low]
>
> Force mode is cleared in LED_COMCON here, but the new rules are only
> written to LED_x_CON later by a separate dap8211r_write_ext() call. Each
> helper takes and drops the MDIO bus lock on its own. In between, won't th=
e
> LED follow whatever LED_x_CON held before (power-on, bootloader, or
> previous trigger rules)?
>
> If the final dap8211r_write_ext() fails, the function returns an error bu=
t
> leaves force mode off and the stale rules active. set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c ignores the return value:
>
>     led_cdev->hw_control_set(led_cdev, trigger_data->mode);
>
> so the trigger would assume the new mode is in effect.
>
> Would it work to write LED_x_CON first and clear FORCE_EN afterwards? The
> rule register has no visible effect while force mode is on.

Agreed. mxl86110_led_hw_control_set() does exactly this. I'll reorder the c=
alls
in dap8211r_led_hw_control_set() the same way in v5,

> [Severity: Medium]
>
> Does dap8211r_led_hw_control_get() return the same rules that
> dap8211r_led_hw_control_set() writes? I see three mismatches.
>
> First, hw_control_set() turns TRIGGER_NETDEV_LINK into LINK_10 | LINK_100=
 |
> LINK_1000. This function only reports the three speed bits and never
> reports TRIGGER_NETDEV_LINK.

i'll add it, thanks

> Second, hw_control_set() always sets DAP8211R_LED_ACT_BLINK along with
> TX/RX, but bit 13 is never checked here. The kernel-doc on hw_control_set=
()
> says the LED does not blink on traffic without ACT_BLINK unless another
> rule is active. A register with TX/RX set, ACT_BLINK clear and no
> link/duplex bit would still be reported as tx/rx offload.

i.e., if ACT_BLINK =3D=3D 0 but txrx are active (by some reason), then
-EOPNOTSUPP should be
returned, because the register state does not correspond to an
operational state. Oh, that's
important i think. Yes, it should be fixed.

> Third, any other LED_x_CON bits are silently ignored, and 0 is returned
> anyway.
>

ok

> rtl8211f_led_hw_control_get() in the realtek driver reports
> TRIGGER_NETDEV_LINK when all three speed bits are set. Could the same
> approach be used here?

Yes, i think so

--
Best regards,
artem

pw-bot: cr
