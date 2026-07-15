Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF83BBA18
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784153107; cv=pass; b=DTaOZGKwLnbwlSTGad7QzYllCVCr5wggaqrWCW54kKGJbBzw0OHS6UuEK4Ok/uob5RVfL6W23d8Z9rL1CtrR9IVLbarbp1rV/iwaS/Zu49XURjkiiva8gRD/AECIsrOBr5ioeSBXIosiILguBy4YRe/nMrO8PQOp5Oy6KQfRNzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784153107; c=relaxed/simple;
	bh=wl/W20KdKnIqM7v6f+2D2RAhXS9EwAYkp1R56o0Q+uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiGbkskuBCpnV00eJEKZOvEt2tEIVKUoGhFx2xzob28GwwNtW3WaFmdzn4L1srgCuRbp2unZYDRpfzpHj45adH+QSxEwTI98go57Ty88V5au2qzu7p+K7rTN/lM53q16fccMYWZ5JiH7yPvC6tG9TJltmXyqjVCFt9z/aaLGx9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5MLqDbs; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5MLqDbs"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160cba3944so267759366b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784153104; cv=none;
        d=google.com; s=arc-20260327;
        b=muk4RR7m6TX29HqdnVGImN03llHmHIa3QnHTwFY3F5N1+rlPIZI6wTbhJxueQTYn+h
         CwwLWPsbXAuqzsrakVJbACR7s8fjj4p3W5bXQEgtFQ9slDtu92XQ9mGK1BZt8UDjieqP
         d721PJNxQXiSUX9wuv4H6h9yfkKGhBQy63mH6ItiqzIQh7c/iaD55a0YTRT57Kt0l1lA
         OgWZZt1nPVGoSW8FXbiZVNXGqVtUryt1u9RwEcBHyVNibu3TMOreqYgvP5OCB6zOECV+
         5sGEDv6Twjjn5PltB4GVT5M6jKZCEnkvf5xE8Xnszf6e5ydxTgcjSse4Tcfmwj4io3m3
         Mt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        fh=hBf26W5izB94Ig5k0Y6tF0FKUBhNC/yQcXZPnVMBYqk=;
        b=G2NM10WukeSZHA+KNXQYHGvFrzkOoXwYCuzeflJ4+v1k99jzPyhbmo/WKMsICCQ2zr
         P+MrEHLGw3Gev+aM1vqyzhDWYaGTPMDmwXGiQd4vBwVmErgBVaLoQxvYodcy+t10J2ZG
         UpJelS3U7XZa0uWvkoPLkayskg+X9adhJbNMo2PaBFA7k/M7GzNtd2kH283rzBu7DtN1
         zIyLmpJ++Mc3sD8QR1AsfQ8MH98Q5+oVBviKc3ASE8MMOcsotsS7XWtAsp+t4CMIWBOG
         L8iVvmlpSQcKgc3kmwoJte3CSNPM784IjP4MC1UhoHpObR0p1OjNvgTp7MFcSpRLc9/r
         KaCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153104; x=1784757904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        b=A5MLqDbslEsdnX1CsU+xo9qiR58ZUZPtyyb36UCtkVaxA/pR4rDfv4fRtD/2sQyCkm
         8MWq/EZIcd7LWy2IWEWgAakFxAx6WI7rVjDxO1BefJVAyN76BK9Qjxb4pVcgJuJKcSN6
         Vq/8nh65LDbk2DKnMMcpBsfFqmxkstYToI1a5irh5k6AOiYYzuwUkEV4HkWaz9pZQi/S
         KEUbrINTledJazbcZb1WvkwyGg6TJeQcqr/hLI7RJn6Z9xV2OqHluOTMzE7jGQjKsxqp
         t2CygGx+Aoll7Mp0gxZftr8cU9Wnmjr8bWQf110yxwfuyAMhV5uAp2PTPTiRfMgm7cj/
         F7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153104; x=1784757904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        b=Ey1D9voh9FFQpsRQnCynW/BoCf3DXi2p24FVZDukd9S5rGKI5OEuc6xnrPJ53v3SaU
         anewr60qfDIj4AO1NGs7v2bbILh2BTmtXnKQh7jYNcL2Ggmzu6pcUqeLNBt1OwlnRoF2
         mvouw3m8Fpt/fgMOUuXu7rh6TQ8LyPQrVjNh4ntO1I2MNqQ73CCkGHxX8gGDt0iH9L7V
         77ShgFg30jrxr+bOifeccy/hyKluUaF5m2W4kpfsZUu4N+K0/JdJ0Sct7/b2kstE+jA9
         PuA4odcejc1QuURj2qTVyR37Cwz8TPr9NIKl8fOg0fm42ageWEdM5PlIzN5KqT8vND5p
         Q67g==
X-Forwarded-Encrypted: i=1; AHgh+Rp6L3unqcQxOjujuvPHt3aMIicZ0W/w7e6BS46OF68+Pkg5qqHo1oXLHEJ6CI9ACEU9A7mGpe+AEU+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwrK1gSZF3PzZVDGfMyk0OADDurnoi94RT86nCBzJ+bwVUXp++w
	qCnSrkBsszf05FxkqwNokCCQI+LddjNw7WBUiMWv35MZUYBklmpdsVAUgAJGKL8KpNwMOUQuj0R
	AC+WktE6cVxhqUi/3EESePKxs3Z64Gv0=
X-Gm-Gg: AfdE7cmyFawRt0L18/SD1NG42ONfet0b5g8QTTlHhX9exRAKXss84cszwTOkanYB2dt
	0cPXuXkXDUMmzN0KkX27KeUCdgE4LK98w69wWPRFNSgXh6O3jgMyyexospQzgO1EISOSYrxXsF4
	lq3dr5+6UTqNsxgQNCsMnZHqlFvjawz1ul6XMJ5IclaUso3i349tGQ36fQDWBkEOFcEfvzRohFp
	LyCN4fWDjOuJOKB7Pw9SXjyZ1Qx4nrlvxUfSy4cXw41MVFu3vAFlwKHL2a3ywXD
X-Received: by 2002:a17:907:940d:b0:c15:e956:f529 with SMTP id
 a640c23a62f3a-c167921c646mr308897966b.8.1784153103447; Wed, 15 Jul 2026
 15:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <20260715191454.D12521F00AC4@smtp.kernel.org>
In-Reply-To: <20260715191454.D12521F00AC4@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 06:04:50 +0800
X-Gm-Features: AUfX_mzCJVaoRLkAFuMd2HDVFaZ_rNuQ-cMJT_rqC34HREB6SXQc34ycLqd-JyU
Message-ID: <CALj3r0ioKyJpcVLkeQskLqzcS_OcAbPsPxc7d7Zh9LiUprNguQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Does this change cause build failures when CONFIG_PCS_XPCS=m?
>
> Replacing the composite module assignment (pcs_xpcs-y) with individual
> object assignments causes Kbuild to build separate modules instead of one
> composite module, which can lead to undefined references during modpost.
>
> > +obj-$(CONFIG_PCS_XPCS_PLATFORM) += pcs-xpcs-plat.o
> > +obj-$(CONFIG_PCS_XPCS_ROCKCHIP) += pcs-xpcs-rk.o

No. This change is intentional. pcs-xpcs-rk is a platform-specific
driver and should be built as a separate module, not linked into
the composite pcs_xpcs module. There are no undefined references.

> [ ... ]
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> > new file mode 100644
> > index 0000000000000..ed969a38d544d
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     switch (addr) {
> > +     case 0:
> > +             return ROCKCHIP_MMD_MII;
> > +     case 1:
> > +             return ROCKCHIP_MMD_MII1;
> [ ... ]
> > +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /* Writable only on MII */
> > +     switch (reg) {
> > +     case DW_VR_MII_AN_CTRL:
> > +     case DW_VR_MII_AN_INTR_STS:
> > +     case DW_VR_MII_EEE_MCTRL0:
> > +     case DW_VR_MII_EEE_MCTRL1:
> > +     case DW_VR_MII_DIG_CTRL2:
> > +             return ROCKCHIP_MMD_MII;
> > +     default:
> > +             break;
> > +     }
>
> [Severity: High]
> Can this asymmetric remapping between reads and writes cause configuration
> corruption on port 0?
>
> In xpcs_rk_mdio_write_remapping(), writes to these VEND2 registers are
> unconditionally mapped to ROCKCHIP_MMD_MII (port 0). However,
> xpcs_rk_mdio_read_remapping() lacks an equivalent redirect for reads.
>
> Because the generic XPCS driver uses read-modify-write operations on VEND2
> control registers for ports 1-3, this will result in reading from the target
> port's MMD but overwriting port 0's configuration.

No. Read remapping is performed by hardware. The VEND2 registers
reflect the settings of MII0; the corresponding bits for MII1-3 are
read-only. This is a hardware feature, not a bug.


> [ ... ]
>
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> > +     struct device *dev = &pxpcs->pdev->dev;
> > +     int ret;
> > +
> > +     pxpcs->csr_clk = devm_clk_get(dev, "csr");
> > +     if (IS_ERR(pxpcs->csr_clk))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->csr_clk),
> > +                                      "Failed to get CSR clock\n");
> > +
> > +     pm_runtime_set_suspended(dev);
> > +     ret = devm_pm_runtime_enable(dev);
>
> [Severity: Medium]
> Will this leak the csr_clk if the device is removed while active?
>
> The generic devm_pm_runtime_enable() runs pm_runtime_disable() on cleanup,
> which cancels pending suspends but does not synchronously suspend an active
> device.
>
> Since this driver lacks a .remove callback to manually suspend the device,
> xpcs_rk_pm_runtime_suspend() might never be invoked on unbind, leaving the
> clock prepare and enable counts unbalanced.

You are correct. I followed the same pattern as pcs-xpcs-plat.c,
but I agree this could be a problem. I will add a .remove callback
in v2 that calls pm_runtime_force_suspend() before devres cleanup
runs, ensuring the clock enable count is balanced before clk_put().

> [Severity: Medium]
> Could this blind cast lead to type confusion?
>
> The code extracts driver data from the platform device associated with
> pcs_np without validating if the device is actually compatible with
> rockchip,rk3568-xpcs or bound to this driver.
>
> If a misconfigured device tree points to a different type of device (like
> an I2C controller), casting its drvdata to struct dw_xpcs_rk * and
> dereferencing it could crash the system.

This would only happen with a misconfigured device tree. However,
for robustness, I will add a compatible string check in v2 before
dereferencing drvdata.

> [Severity: High]
> Is there a use-after-free race condition when accessing drvdata here?
>
> This checks and dereferences pxpcs->bus before establishing a device link
> to lock the supplier.
>
> If a user concurrently unbinds the XPCS supplier driver (for example, via
> sysfs), devres will free the dw_xpcs_rk structure and clear the drvdata.
> The consumer driver might then dereference the freed pxpcs->bus before
> device_link_add() is called.

No. of_find_device_by_node() increments the reference count of the
device. The supplier cannot be unbound between of_find_device_by_node()
and put_device() because the reference count is held.

> [ ... ]
>
> > +static struct platform_driver xpcs_rk_driver = {
> > +     .probe = xpcs_rk_probe,
> > +     .driver = {
> > +             .name = "rk_xpcs-dwxpcs",
> > +             .pm = &xpcs_rk_pm_ops,
>
> [Severity: Low]
> Will this assignment cause dead code when CONFIG_PM is disabled?
>
> Assigning the dev_pm_ops structure unconditionally to the .pm field without
> the pm_ptr() wrapper results in dead code and possible compiler warnings
> when CONFIG_PM is not set, which violates the PM subsystem guidelines.

You are correct. I will use pm_ptr() to wrap the PM ops in v2.

Thanks,
Coia
