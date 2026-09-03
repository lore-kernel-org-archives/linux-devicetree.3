Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253A1A682E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430578; cv=pass; b=eRIHNTHTqeQm0XMEDZX/WgJhZzG6RYP0U1xGXLYvw0xAq69jFH5VBXQxS7VqnZ3yFBh0zZXN87/yAuu0iTIM3Ejc/iJ8n057yfc+hvtEa+PNcdhYGJSF8BxD2cKWNOHIUdkVTdBWe/y3XR8jsUNxxmZ1beQgkMjiNfNv1qQ2s5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430578; c=relaxed/simple;
	bh=WVlbokzFReA7Tc6/DcRmPk4toil5vu4Fw2X7RHf/oFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Atin4QBGFckMILLdEOpIKl2RCZqSF3Nguhinqx6Xqd5UdrhXkyxU2yzmT3rx+3EjtkY2/T5k5qtRoEiYuvXZtqXdmHXgsJv+VLMjBK9MHO0elZmhDafq+WjNf22h3m4hUdlnNiHhEru5ZB2GfFZ4UYk2M2xFzoczcwv3QtZaZyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWdqxMcz; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWdqxMcz"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c254cfed751so90995566b.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788430562; cv=none;
        d=google.com; s=arc-20260327;
        b=T912v6sg83/iEPP1nxJFm+zHbLMYfCiG9B2ZD89AuvMZCNecPhVMtmmjMt6SPG/YjY
         OWfzjH14LWb+BYQbp3K4PambkIWWWaD1v9A1X8PDyM9AfwK79PBPRbR2U5RyhorwQwYd
         YLo5Er66znpRe4AfsJmrBPUPETsdwT4njwBoQ2+FH7RYpTP05k7S0leKxNkouEAVu4fQ
         8NwWYq40RRhNT6TPHGW3+HbrC3PjhVdXgKCCrCy9nIDQ+pq/ADMSoTy5VQ4wnCkE52dF
         pz/K/fzJUd+LzGHReTdTV8wywqw2bUgpUZY3Cm58lC7rTvXl4wsMZIDBSxl7VRHRXXHx
         2CPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        fh=o3s7+rMUNel7Js2/ogE+ecE2SgN/bTqZxCJAjuEgXWE=;
        b=tByBeICWHd5smFA3MUskB6TrPS+mb20J8qLUvz0ZsYQ+4PVu5kSJ/hY1OFqNvKwkn9
         bAyEfpIB1p7ADu7WkNp52VuUQdEmI7tDzmopvmSjbHA6HzLLgim2+SrI/6zjwSFkY5sd
         VfmcbN9t3ZurIhsBTTf+D063JZlngocPdZs13bHR4v1Mpg4Unvo43ApNjqH1aJprks97
         IjoJ3dRMDAPEf7XFxD8Ko1RKgEYJ+DMu5YDQv8+EOk9rqrBSeKeS0yQdhFWKtxjiLv8Z
         EEKmgqgVJPs0lnViEIcFGeVB8ZWweWJ+c/YoCI3WuiDz/DWAWRttUMunOByb/jgD0QOc
         CErg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788430562; x=1789035362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        b=qWdqxMczZ7H3eXZTsxRSgMTrRuvR0sQzkGGyIdOFsN0cX/JyX5AZtKNFGNigOfd+zt
         FOsN0KjlyfMw2TmXeYwJ1u1uwWlIaNK+Y6EKjcl4anSE1aliDXDAOwcxFS6xzPNV8sqY
         Ma+xUeGQQXh68mIcaWguPMm6Px+xkRrBceKEY4YcZGMsFnAV0SRATOF5ZFlJsmTjyAf9
         R1zVeBBfPTEuqtq3lktzurbJlYFFqOBh47ct30fMu4SxBzqb01l2WwhHt1x3VzouI2Rj
         wj29lfcFu5yqmpqwrY9L81j5QmkAkvJzyQHZp3oMbDZHzvWdggGbutVxjxUsnZgVrhB1
         /Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430562; x=1789035362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        b=JqtMm5DEcv9mc+rfI0ElmObwVQWy9dyKGcpSVJA1KmriQ28Hu4sW/q9VpTTHwGSC0B
         YI7azutReJXYprcqVOw69OdZhz2SnjfSZTNGeXC2aa8Qd7iDt48wVZ8FVsekJR20Q7Vc
         LYj+kySeQnMejnJgUg2yOh0RZiJznmqrdle56dgTDIkUIlx+wGKizQtLQKtYUatRtYCd
         ogPpzqfB/fiKpE4msKDvHErS8d7Z0fCLBRXAJPwmG01ON+YGD5Q13qi7VwyMbHSPkkfK
         sJV2W84HepIV4riXC09wrVc5YEd1JQZRHgW8VGiCU9NE+9GY52xAbs7KBdObSl7UZQU3
         1lNw==
X-Forwarded-Encrypted: i=1; AKwUvBxG251083ZlNde2V80/yC0DOHpd8rpbQnbR5zRzZjyr9O/95RJcS6Nfh2hdk2wCiJwAGEygSZj1USTb@vger.kernel.org
X-Gm-Message-State: AFuF++mHdhCWwcvF/fjEx77zw7DO7HJXYkc9W2ipejk74DCIqZfhaCPV
	wZlgWks/TQ9Mx6uUhagTEjVSZ7XEKU0TlAD7es0full1RINTs1YRoMbLlzwpCoiy8Zr8kAmu20L
	mk4bAp28EjXiltVFm8fYLqSmgMq4fdP/lUg2OnWQNBwcN
X-Gm-Gg: AYBFou2cr5euGOj1NnlFQ8C8wiSigddQKP6liyCTy3mKUOXiolNzpfuurWhEtHIiOu2
	VAqqM75XG2e6LP21OOrDgJSoSAhUGD2M3JA44vzBZWrEXiRtpb1MufCzTpxrpMf59j4CuN395kx
	+r4HkbAsnAAmnd4Tobyz39/0IUVIapWTe2AV59d/wexqa94RWm1LWCT5rTcTE9xsX9TDVG1cyEC
	s8CHkDy5YsUgj14JhjO8aNOTWTaC60PmZNY1KPDW8xRdAt7uhpJzlngg8Fo6OxC3Bs0xyECJDk8
	vmmQf+hnhRZdDLtNaLybI/1/2Zdy4FjFEWWlr5EnpnIAz8q1Bid13oENN5s=
X-Received: by 2002:a17:907:7203:b0:c25:254:292e with SMTP id
 a640c23a62f3a-c25d4c9f1a7mr635886866b.0.1788430561260; Thu, 03 Sep 2026
 03:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-8-coiaprant@gmail.com>
 <20260902150440.78D631F00A3D@smtp.kernel.org>
In-Reply-To: <20260902150440.78D631F00A3D@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 18:15:50 +0800
X-Gm-Features: AcwNN1WY1KXAlYP6ywO7GSbIWh5cdAyLJ9V8yYe_I0JGYIyWb1Ll7tKOm3JNX8k
Message-ID: <CALj3r0jnyqvPgwURmggRBZiCqDiQ4f03=tn13BFez0=W8LH00Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, 
	olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=882=E6=97=A5=E5=91=
=A8=E4=B8=89 23:04=E5=86=99=E9=81=93=EF=BC=9A
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> > @@ -12,6 +12,29 @@ config PCS_XPCS
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>
> [Severity: High]
> Is this missing a PM dependency?
>
> If the kernel is built with CONFIG_PM disabled, pm_runtime_resume_and_get=
()
> returns 0 without enabling the hardware clock. This could lead to a
> synchronous external abort (SError) when the unclocked APB registers are
> subsequently accessed in xpcs_rk_read_reg().

ARCH_ROCKCHIP already selects CONFIG_PM.

> > diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> > --- a/drivers/net/pcs/Makefile
> > +++ b/drivers/net/pcs/Makefile
> > @@ -1,10 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Makefile for Linux PCS drivers
> >
> > -pcs_xpcs-$(CONFIG_PCS_XPCS)  :=3D pcs-xpcs.o pcs-xpcs-plat.o \
> > -                                pcs-xpcs-nxp.o pcs-xpcs-wx.o
> > -
> > -obj-$(CONFIG_PCS_XPCS)               +=3D pcs_xpcs.o
> > +obj-$(CONFIG_PCS_XPCS) +=3D pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
>
> [Severity: Low]
> Does this syntax create separate modules instead of a composite module?
>
> Because pcs-xpcs.c references functions like nxp_sja1105_sgmii_pma_config
> defined in pcs-xpcs-nxp.c without EXPORT_SYMBOL being present, creating
> separate modules will break symbol resolution and cause modpost linkage
> failures when CONFIG_PCS_XPCS=3Dm.

Sure, I will revert it in next version.

> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> [ ... ]
> > +     pm_runtime_set_suspended(dev);
> > +     ret =3D devm_pm_runtime_enable(dev);
>
> [Severity: High]
> This devm action schedules pm_runtime_disable() to run during devres
> cleanup on device removal.

Yes, I will fix it in next version.

> [ ... ]
> > +static void xpcs_rk_remove(struct platform_device *pdev)
> > +{
> [ ... ]
> > +     pm_runtime_force_suspend(&pdev->dev);
> > +}
>
> [Severity: High]
> Will calling pm_runtime_force_suspend() here cause an unbalanced disable
> depth?
>
> Since pm_runtime_force_suspend() internally calls pm_runtime_disable(), t=
he
> disable depth is incremented twice during removal (once here, and once
> during the devres cleanup). When the driver is rebound, it will only be
> decremented once, leaving the depth at 1 and permanently breaking runtime
> PM hardware access.

Yes, I will fix it in next version.

> [Severity: High]
> Can a concurrent sysfs MDIO access race with xpcs_rk_remove() and crash t=
he
> system?
>
> Because the MDIO bus is registered with devm_mdiobus_register(), it remai=
ns
> active and accessible until devres cleanup runs after xpcs_rk_remove()
> returns. Calling pm_runtime_force_suspend() gates the hardware clock whil=
e
> the MDIO bus is still exposed to userspace. A concurrent sysfs read could
> increment the usage counter, call into xpcs_rk_read_reg(), and execute
> readl() on unclocked hardware, triggering an SError panic.

Yes, I will fix it in next version.

> [ ... ]
> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
> [ ... ]
> > +     xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> > +     device_unlock(&pdev->dev);
> > +     if (IS_ERR(xpcs)) {
> > +             put_device(&pdev->dev);
> > +             return xpcs;
> > +     }
> > +
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
>
> [Severity: High]
> Is there a race window between device_unlock() and device_link_add()?
>
> If a concurrent unbind of the supplier proceeds after the lock is dropped
> but before device_link_add() creates the dependency, the devm-managed
> pxpcs->bus could be torn down and freed. This would allow the MAC driver
> to continue probing with a freed MDIO bus, leading to a use-after-free.

of_find_device_by_node() increments the reference count of pdev->dev,
so the supplier cannot be unbound between the lock release and
device_link_add(). The put_device() is only called after device_link_add()
completes.
