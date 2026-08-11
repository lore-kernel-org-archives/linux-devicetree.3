Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC947CC72
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485468; cv=none; b=Z0RFMj/InQYX3xZCKNvwib9rJz6iwz6BvErtiER366LIUTLBF4wcQRtmEfHSeViUG9B4hReEekb4DZ+V+py00CiV7bEVT9mzaXUZSMMoDzK2xMKdgDEQCMXSIC4eFMJv/2naZz+tZWxg6vKXVE15AJ4TT7l6i0BJPpJzBg/SEzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485468; c=relaxed/simple;
	bh=5uTxakirkBOf7AT52Z40Mu8yZC3d2qArXze73MrSbAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y7KUgU8uAADkjMit8X6jcxb4001X7vp5GnJthKGNUHPDWRKRckBNV93wrBFdHbB2ZtSugMB+7BNO82xbr4PUoY6TulCnNuvNVazIn1YaxM6Z2AomQcl31Y79/y2lwWdEL/BVMkYlNoAgeQvbf34MHcF9hQM71w9OGjJqHBOUpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbacGNJM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbacGNJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31FB1F000E9;
	Tue, 11 Aug 2026 21:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485466;
	bh=P9avM0G3Mfe+GdeYDOFv+ve7UYzm/onEjm31uBp4Uy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EbacGNJMgkxbjF8GPDe9TtwgZL7dGlW4txV82iEaR1a1ywnAqJ+AN7bGAwKoPD8Fz
	 om1dE/Ew2rEk50UDC/FVbAW8dGuexiM86T/l74/wtUrvVJXALkKRi3HhuGlbfQf2jD
	 XVoObx8+svn8Z6Wkz7Lthkh66IhxNbQlv4SV2SBio5EEz6r0BoAgFj11nT52r4KzCq
	 +4zvTsZmBKKFTiScxgzyF2oLQBEhrEJFQrZLcxiVEQBUVbjLp5OgyN+ZcgfPRYpVYL
	 3uPijKBGp5Svr/759hzmAEngFHelEV4tCBZ95f+iAGxiU2fX+W3sSTnNbNLafTArWQ
	 GcOqrV1AHDT7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:57:46 +0000
Message-Id: <20260811215746.A31FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Writing '0' to the 'enable' sysfs attribute disables the hardware =
but fails to update the internal `chip->enabled` state to false.
- [High] The hardirq handler calls `readl_poll_timeout()`, which internally=
 uses `usleep_range()` and causes a 'scheduling while atomic' panic.
- [High] Concurrent sysfs writes to 'enable' can cause PHY reference count =
leaks due to missing state locking.
--

--- Patch [4]: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch=
 support ---
commit 815da4bb92fc6ba59cfd8252e67e13ba90e1b715
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path role switch support

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. This commit restructures the driver to support
per-path role switches and removes the single chip-level role switch. It
also removes the role switch call from enable_eud().

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 03d1c200658c8..48a4441b0c9c0 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> =20
> -	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> +	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does writing '0' to the
'enable' sysfs attribute leave the software state permanently enabled?

Looking at enable_store() in drivers/usb/misc/qcom_eud.c, it calls
disable_eud() but fails to update the internal chip->enabled state to false:

        } else {
                ret =3D disable_eud(chip);
        }

Because port_store() checks if chip->enabled is true and returns -EBUSY,
does this lock the user out of changing the port configuration after the
EUD is enabled and disabled once?

[Severity: High]
This isn't a bug introduced by this patch, but can concurrent sysfs writes
to 'enable' cause PHY reference count leaks?

Looking at enable_store() in drivers/usb/misc/qcom_eud.c, it calls
enable_eud() without acquiring any state lock:

        if (enable) {
                ret =3D enable_eud(chip);

Inside eud_phy_enable(), chip->phy_enabled is checked and modified without
locking:

        if (chip->phy_enabled)
                return 0;

        phy =3D chip->paths[chip->port_idx]->phy;

If two threads simultaneously write '1' to the 'enable' sysfs attribute,
both could observe chip->phy_enabled as false and initialize the PHY
multiple times. When disable_eud() is later called, it will only power
off the PHY once.=20

Does this leak the PHY reference counts and leave the hardware permanently
powered on?

[ ... ]

> @@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *da=
ta)

[Severity: High]
This isn't a bug introduced by this patch, but does the hardirq handler call
a sleeping function?

When the EUD_INT_SAFE_MODE interrupt triggers, the primary interrupt handler
handle_eud_irq() in drivers/usb/misc/qcom_eud.c (which executes in hardirq
context) invokes pet_eud():

        case EUD_INT_SAFE_MODE:
                pet_eud(chip);
                return IRQ_HANDLED;

Inside pet_eud(), it calls readl_poll_timeout() with a non-zero delay_us:

                ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_D=
ET,
                                        reg, (reg =3D=3D 0), 1, 100);

Since a non-zero delay_us causes readl_poll_timeout() to internally call
usleep_range(), will this cause a 'scheduling while atomic' panic?

>  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  {
>  	struct eud_chip *chip =3D data;
> +	struct eud_path *path;
>  	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D4
