Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C19A1C84A2
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821063; cv=pass; b=fmL6K9QKfGtNrmwVotIhxfhRHak7qCUxiA//JMlxyLrR9hIL5sAH/0fBBU2Y3lHCqhzfNFZlcjbeI4l/p/y0DE+GMOvW7y8BvNUc30JIe2a8EPoQA1tiouFmygvAvFgs3FlH/CZxHoHGESabnSX6aiQtM5aSXj/6elvw8N19JqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821063; c=relaxed/simple;
	bh=Xm41jBuPvhC4Qx47xCYgrq9jjV5qcdDYuRSYD38mbYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGBBjuACP31Ijpq03pChGtDLjiAWMp7Mx6u8JZnjWts++oKb0pGepHqP2Lapw46t+moTNp4+KWyqEXWEFdHr8jwG8bFZ4HXf4JkWE0TmTsVQcn+5HpZAYxIO/jVuFc7VQb1FpciIe3HG2B7COXZDCjqTm1gF/T9aQCwrILMakG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXR1Vs49; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXR1Vs49"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so133146166b.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789821058; cv=none;
        d=google.com; s=arc-20260327;
        b=RLjmp+0SuaqizKpwtRTPLxBQs+D2F3r8vWHKE4WSP7zjmd77LBC3fEwk4Oxuh9lwDW
         NvlhTKvcsgUXONPJg7pFIev83EfoGjudPCw3gvZaPvz9XY6/D0YhVTElVxzDReR62QX4
         M5sSRRnWQwz0pn6nVByoHLp+PyR9FK/kcfte5Hg+MWHyONz4PCaeOcpH21INVw8CuOPi
         vfkXS25x8H1EHxInfbpg70/VgjAfAckJ13074YFZpJ9YCy+NSW1jy73Sbp506Lads/oo
         Y0UCKwI+UqRdse1x+u2nfVCT4XK2yYiLqgqasMhir2P/6l4wkXzPOChYoCKRPspr4KIN
         WYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        fh=usfPI0LjksaCxBhqCHmhFOcYRUfhEbFdTJwGAYbvv90=;
        b=kMm7367LtOuljXVz1cehysmvYJ7pSAIVF+ciyDV5IPFHujJOqnnFg3LmjQRmc8XJUa
         L0ZpUJTLlq+k9DPjnuoeQTWS6TDGhdcAMTo++OZG4TPrK7cTyFsLX/SaYsUL04JA+Dh2
         oTg0yJdNKbFpWXNyne3Rhio12NGdnNcQ88TfSh4qEvOZ1w7XrN5ZAPGg4ZcuzgRDvy6K
         Punp76xQLzVm71xSp0K/Ge3ZTkRuNzT0a/FEgtMVOAZACjY00M/5xnRinkDRwOuqfv9o
         sPlz8G76wBaGTmEOE1wlYXV4JR2I5sxXtaXPgy7TDOCTd8S/QkAs3jigj8GszKtvMcos
         ccdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821058; x=1790425858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        b=RXR1Vs49vR3Ncz/4eDnUq5KCxQ+L7XOUeZqJNIz7PAvrHdhGJWtfeWDpdlrJYtM36E
         1hb/eJbQIq+kkgDoJTPkfbS3iqW3F9PdITkmJ4/5hr5liaWBLri7piVuWvsSuHdUKh2L
         C2iq+/FV1VzeTEwizbwApJA9YXD3NsjSLrIlM84GI/OtZeyiYGXMbHtTQHg8Chtn+DfK
         ZRgoCLI8tFJF5xxHuSXygkZq11eV1K0p54EpdKLF1/zwD5tSwfLvPmqqsdo9PKgVAQsX
         lSgpxsR+/aIOEyyzt4KbHE8EZheCUrFBaKWADvz5ykhEPh++GSkbvN1ZrSy3G1bS3mxm
         8bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821058; x=1790425858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        b=QsnvckB1eK/RNR1B01ntZlSuTItSRqFNdES9nONU6KTmm6A8aJVbbcrlREC+qD6Sn5
         Gyw9GkHOlGOhbq6pVk8b0KySDo5mM8XiUeKQRMgaSilSkM8enOqgoQ0/eoAx8mOq/ez1
         elhETMpztMx2FyzwQ6dBCP4jWmxZ9S12Il4HTCjBFR40E8IrFCQfyrOH7LPIk/poPvrP
         YmYtHrl0I5vxi755pmmyA88u05LYoanzw7ybWzd9vBs0WIN45/1JYQnibIdyqoLJxUDQ
         6eyGpRuVzRhGA0lWCVPWysjeGN1ok+HrpMkGky8gL86jpAXL21y+dGcVA3g6d1w7Na3G
         jdlg==
X-Forwarded-Encrypted: i=1; AKwUvBwTV4aGBpTGCnzJTC+wnQ6MSR6+5oO86+Jyt/g6TxH0NXcY/ooIcB7YMbXTxXciRtRe1wVMLZOtph4v@vger.kernel.org
X-Gm-Message-State: AFuF++k6uSCkLBQnvWDwI9FJ6z27Iym6KsQdEM4znLDe3xJJb/7cm+DF
	mZrw/H6SZJ+N4vHvBsC3FOnv4xoVYzyaQT/KykCkOQ+LW2IbGJpx8mSt6xYUAlvK6N+J7ZI/2H8
	xqWODVa7MIemoBXF2j2Fc/eDAcdR0QqNZWB156CYlLw==
X-Gm-Gg: AYBFou37wC4PAZBwMCgGOrSm0rUmsv/P5aX015mwxcW+RAXSvqD7Zi9hn7BAFwOnrGZ
	PKQriyXlctMMsN4YzBqviC7IlVDKmT2fKMslkIvRhBmSBuhNTDwdVI+63ggEqsbz9gdAKOdqI1U
	AFDpvJWN+MoM1ajQZmn8DN8F7m/p9NthkXarT7niRccWUf2WsR66kHjCNOjXGk0IKdXAVI5JUpF
	gW2vE4cIc7hkDnDrgaXLx/d0tmXc2oQhJTZ5okbx2/OnywswDgXleEfUnUUkmw3kKiQOvZTQod2
	vCAyypD32Fb5+CHMdd0DSeMzoxSu39Cv012UCo976uHAFcYL0ter0fiKoA==
X-Received: by 2002:a17:907:3f82:b0:c29:d1b2:35df with SMTP id
 a640c23a62f3a-c2a1581946amr470610666b.10.1789821057622; Sat, 19 Sep 2026
 05:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917204624.2427486-1-coiaprant@gmail.com> <20260917204624.2427486-8-coiaprant@gmail.com>
 <20260918204847.2B6441F00898@smtp.kernel.org>
In-Reply-To: <20260918204847.2B6441F00898@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sat, 19 Sep 2026 20:30:45 +0800
X-Gm-Features: AcwNN1Wj96ApSAjh0B3vVvs2DEQWJ6lwYwJqIyKTrL4WkG90sIjEWZrkuc7fyp8
Message-ID: <CALj3r0hL9fewnCgcO4wT+5q=nWgcR6TXR=HXoYjQwtANo-B7Bg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, 
	linux-phy@lists.infradead.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8819=E6=97=A5=E5=91=
=A8=E5=85=AD 04:48=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] net: pcs: use-after-free in xpcs_rk_create() during concurrent s=
upplier unbind
> - [Low] kconfig: unmet dependency warning due to PM_GENERIC_DOMAINS selec=
t without PM
> --
>
> commit 7e2d67535ce6f3173f2984680b0a77b61caaf964
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a platform glue driver for the Synopsys DesignWare XPCS
> on Rockchip RK3568 SoCs. It implements a virtual MDIO bus to translate
> MDIO operations into APB3 memory-mapped register accesses.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> > +     select GENERIC_PHY
> > +     select PM_GENERIC_DOMAINS
>
> [Severity: Low]
> Will this cause a Kconfig unmet direct dependency warning during compilat=
ion
> when PM is not enabled?
>
> Because PCS_XPCS_ROCKCHIP has a COMPILE_TEST fallback in its depends on
> list, it can be enabled on architectures without CONFIG_PM. Forcefully
> selecting PM_GENERIC_DOMAINS (which depends on PM) without inheriting
> that dependency could lead to a configuration mismatch.
>
> Could this Kconfig entry add a dependency on PM, or only conditionally
> select PM_GENERIC_DOMAINS?

Thanks for the review. You're right, I was only considering the real
Rockchip build. COMPILE_TEST allows the symbol to be enabled on any
architecture, including ones with CONFIG_PM=3Dn, and in that case
select PM_GENERIC_DOMAINS would force it on against its own depends on
PM.

I'll change the select to be conditional:

    select PM_GENERIC_DOMAINS if PM

With PM=3Dn, PM_GENERIC_DOMAINS stays off and there is no unmet
dependency. The driver still compiles because dev_pm_genpd_rpm_always_on()
is a stub returning -EOPNOTSUPP in that configuration, and COMPILE_TEST
does not run on hardware anyway.

> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +     /*
> > +      * Pin the supplier before reading its drvdata: device_link_add()
> > +      * refuses to create a managed link while the supplier is being
> > +      * unbound, so if it succeeds the drvdata cannot be freed under u=
s.
> > +      * The link is released automatically when the consumer device is
> > +      * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), which covers all prob=
e
> > +      * failure paths, so no explicit device_link_remove() is needed.
> > +      */
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
>
> [Severity: High]
> Is this sequence in xpcs_rk_create() safe against a concurrent supplier
> unbind?
>
> The comment assumes device_link_add() returns NULL if the supplier is
> unbinding, but it actually succeeds and creates a link with a state like
> DL_STATE_SUPPLIER_UNBIND or DL_STATE_DORMANT.
>
> If userspace concurrently unbinds the XPCS supplier device while this
> consumer MAC driver is probing, reading the drvdata via
> platform_get_drvdata(pdev) might yield a pointer to devres memory that
> has already been freed by the supplier's remove path.
>
> Should this code acquire the device lock on the supplier, or otherwise
> verify the device is fully bound before dereferencing its drvdata?

Thanks for the review. This is a valid concern and I've fixed it in v8.

You're right that device_link_add() does not fail when the supplier is
being unbound. Looking at device_link_init_status(), a supplier in
DL_DEV_UNBINDING state produces a link with DL_STATE_SUPPLIER_UNBIND,
and the function returns non-NULL. The check at the top of
device_link_add() is device_pm_initialized(), not device_is_bound(), so
a supplier that is mid-unbind passes it.

The drvdata is now read under the supplier's device_lock, with a
device_is_bound() check:

        device_lock(&pdev->dev);
        if (!device_is_bound(&pdev->dev)) {
                device_unlock(&pdev->dev);
                put_device(&pdev->dev);
                return ERR_PTR(-EPROBE_DEFER);
        }
        pxpcs =3D platform_get_drvdata(pdev);
        device_unlock(&pdev->dev);

device_lock() serializes with __device_release_driver(), which also
takes the supplier's device lock while running its remove path, and
device_is_bound() confirms the driver is still attached before we read
its data. If the supplier is unbinding, we return -EPROBE_DEFER and
retry.

The device link is still established first so that the PM ordering and
the automatic cleanup on consumer removal are in place, but it is the
lock plus the bound check that keeps the drvdata valid, not the link
itself. I've updated the comment to say that.

Thanks,
Coia
