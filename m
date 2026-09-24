Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E07368277
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226792; cv=pass; b=q8M0cKtaq6hICEUTpPUnM22AmDwC9ziTQzx1fPUT5pl6ocUjDZ/1GzT/PsSm4nJBYx3L49wn/zPO2JzTO84AD3dVXEVa1Vq5YBPpW1bjbVm4RQxH1X5Uqaz2mry7ii2R77TlBcjtstORSRfT0IvSrzWII+S2I/rMn94xwaE/FlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226792; c=relaxed/simple;
	bh=9SPc+L7BuklXAX0yw4Mp3qv1IcpydHf7I9c54H106T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBo/UqD3KRpWCMSvdKy4O441YZC06xbkBAM/K8V8MuS5USH8INV9/yK8787QK4oq11w8BhkmRRlDmyGVfz0F4LbV9fXM6VWyDIMLzgq9fIrNLC8PczIa1ZgyXP+6WFjVLLVnP37eN4N4ZNtDMVDt5Q5Od49b5cqCFp78q8wHP6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK6pt7aV; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK6pt7aV"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c293a9e09b9so79117966b.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790226789; cv=none;
        d=google.com; s=arc-20260327;
        b=gNl8cwqFBut82Fm9H76H7utTnTLzicl1IyPZPCfAZWfaX7PSU2MRNVqxj5/0CsvVY7
         qmv1EYjRnB/PZ8w5tW9JgkNWtXIQFCo0tePRoB/JYwhat85dxid6ocG4XebZcsba+QiU
         V7xD945mnu6SR8vHDpDPUXp/o4G2f2FplbqBPXcrywCZNzydnRwb+GAq3j3AdNUDCr6r
         74V/I+vc151B+ol3pvGbJyao4tjqONraIcjFE9QZMor22rNlL/bPGvSCF1qJRQqMCgkm
         S7/x/AQp3tNHmdnGgP9jsR3NbrVHgmRj0wc92OG/0LGsx05XDO+6HaNmeGLW77qmIzgn
         zCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        fh=M30LaduzMPOio4TRGhMVvys+KZCZVowNqWpCQQ6rc3I=;
        b=VU90nqvx28ka08rowLTQ9ShWNM5pc8j8W1W8XEOH/UpBehjJ5smo8x5Q0vlO93zBCD
         sTGkewk4ikTAxrhhL6QNPJ2rBi2rMOXZUJdOlApCnfCQG6dTvplsvM2UALtYvg1LYuwc
         B4PAbRMrm+8EwyLIAsIv/4d0+1Kx8G5RnVmEwr5ixvaURuewSekrXD0enYg7juWBrBcn
         7C2rJaYG3IQYAULtStUTsBeTvf3PCMllFqPzMVaesIRUmGtjT4ShmRWny0SdPheVweWv
         PU4E0V1c4xBBF6nBBqpkGHmVpirS/WO1y/C9PEeZLPQJcV5WJ78a6VNocbs6PDxUogiO
         XVTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226789; x=1790831589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        b=OK6pt7aVK0xjEc12L3rBNbz8MONbNK+CnPwzCHc98+GSLBog6424xNdPz4MgcjRycL
         yPf6U3zYOMSp2rpQOoKMXlSPRy55uZX7YELxjB3twhmcNJ4KjQpBqpMDDLlBf4pgLYl4
         DZ1lOVI8YhkhFJKe2tRmXn45UIMdVbFoWAwBT/IrPkzBdFqm+RQrfOkTYupMarkGIfAE
         dlJqcfdFE4jKNz0Jg8y9I7yuTGCu3KoXgNzlE45AZnWQjZ1PZpZnjLkbY+r85LuxSPpW
         ZIYM27F7tmmX69D9hr+q0xiTnxpTXLauPgQwsg95MjIvQyOHXED5gYM/WLC43TNWppd3
         HlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226789; x=1790831589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        b=X8gaD7hy3Kp2PeqQrqFHlPMpxwL9/Vn7sKn682sacyQ5MZcgOTLpzUfWSgls5lso5z
         pBnGTMBjgH8RMJq734jI8ap2sI9DkbWBZFg3V+mxRBrVGQbIqPYvsgNZRZOjY7BYfcrp
         Z1BLGVI/arMEcykGJFvhBzBe/6j0RWDklaNmspwTJmfaNw+zpEQ5KWJMtjGHRzuK+Y20
         +s3ecXxSbIKa9RT6tsYzoLNwr1kModQaX9vWeZQuZiYJAgs3GlO+Fj4l+tsmKsQe6WL8
         eAO8olq4Ji+OWrFDrDMhgZqMfUaNpbYiwggXBGr/9R5cNlCMhfdawGh+f3cP/HsD6K/K
         23rg==
X-Forwarded-Encrypted: i=1; AKwUvBxRN2SJe38Gg+7fDuYBqa03ydI/HUT3sQ08NachoEhrMB5/PoOMOpVX+xKc65xDuHTD95Kpezx8k12j@vger.kernel.org
X-Gm-Message-State: AFuF++mEGzJiSZPSlBon5V5G6NYVcJtqJwXTk+i3yVc2l6XR5nrn6LHZ
	4R6ZkvRjZfzPqyW/QdZojqctIXtqp+p6Gtx4eSxSkYjhVN1mJTV76DBKn2maBRhVZsU8We/WR/P
	t4CvjxoH1zUCRSauMEnhSr7SErBCVwhxZCaTmHgnCMg==
X-Gm-Gg: AYBFou3rtISQRPpkPSg5LRFZFWTX0A2H6mJbLXX+ABq2iaKb7eCBGC/aehU0cFBHvJs
	A7fqVWvnZvjasGbO10WRb2fBtv6AaoYoc1H/sx3lPW/TOAZJf5G3HRVSuc8zdx+J6FbSbswzAQC
	TDVxt2eW865Qk8J7a6W1jEdvDSry7zf+nAfaqxo883cBoaf70ts6X0XUyBCV2BSKwTXLrCldS+a
	M7nRsIfu2QFCsxgdddvuqyEfs7mnvrHj3pS1s2fH/V6sTbfx3T6yGclCwDLxxXK3kKb+8cvo6J8
	8jGm9EkaGrCg7XmLmy9OqhoaDJYmjhHFMiG+AILWLanPbTDKNnV3B0SmFQ==
X-Received: by 2002:a17:907:a2c8:b0:c29:3838:dd69 with SMTP id
 a640c23a62f3a-c2ac256657bmr83116266b.39.1790226788805; Wed, 23 Sep 2026
 22:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-8-coiaprant@gmail.com>
 <20260923200523.E766D1F00898@smtp.kernel.org>
In-Reply-To: <20260923200523.E766D1F00898@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:12:57 +0800
X-Gm-Features: AclHuK-lw6TEGWFDRwVyt75CcRiJm_UXyDL5fRY6bD8kdC3GnVL_Pk8dt0Fcf5w
Message-ID: <CALj3r0jt0hFRGrhxiqWnD2XmKrj4vy1U1to-1XrhT_ZesJ19Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	olteanv@gmail.com, wsa+renesas@sang-engineering.com, vkoul@kernel.org, 
	neil.armstrong@linaro.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=91=
=A8=E5=9B=9B 04:05=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] pm: unbalanced pm_runtime_enable on teardown
> --
>
> commit 43d28493f3eec64a96af219e5448ffe0efe56d58
> Author: Coia Prant <coiaprant@gmail.com>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit introduces a new platform glue driver for the Synopsys Design=
Ware
> XPCS on Rockchip RK3568 SoCs. It implements an MDIO bus that translates
> requests to APB3 memory-mapped registers. It also adds necessary clock an=
d
> power domain management for the device.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..35ee980a759e5
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static void xpcs_rk_exit_clk(void *data)
> > +{
> > +     struct dw_xpcs_rk *pxpcs =3D data;
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     pm_runtime_force_suspend(dev);
> > +     clk_disable_unprepare(pxpcs->eee_clk);
> > +}
>
> [Severity: Medium]
> Could this lead to an unbalanced pm_runtime_enable?
>
> In xpcs_rk_init_clk(), pm_runtime_enable(dev) is called, and this functio=
n
> xpcs_rk_exit_clk() is registered as the devm teardown action. However,
> pm_runtime_disable(dev) is not called here.
>
> If the driver is unbound via sysfs or fails to probe later in the sequenc=
e,
> the teardown action runs but leaves PM runtime enabled. This can trigger
> kernel warnings about an unbalanced pm_runtime_enable and break subsequen=
t
> device binding PM state.

pm_runtime_force_suspend() calls pm_runtime_disable() unconditionally
before invoking the runtime_suspend callback, so runtime PM is already
disabled on the success path. The runtime_suspend callback in this
driver always returns 0, so the error path that re-enables runtime PM
is never taken. No change needed.
