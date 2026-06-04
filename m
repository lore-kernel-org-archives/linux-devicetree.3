Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FA42F7F14
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568618; cv=none; b=Sp/R2XY2tQUCVnphUBYKf8HCEezBHzGR1FAMt9Qhu2/gmjmQlrbdZ1cWZWyLKQwB9uOjFsux41e14/5tMwB/kwdVJSf7he6fkXAQjUivC9bRWxiwy1csK/EAWEQqbbsyzCljp20P9sjFQp/JSrmWGgeLfsBFCsZD3nXO1BnFCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568618; c=relaxed/simple;
	bh=pMrU86ypFhkDCBxR/4xBHCI/uT80UMz9Cxl43WYUtCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DMh/61WKlxfLk71W8Lu1zs46PY0O9KMMpQ+CvNLbH63tusbryRMIxLaFvZ5z5SrO5UWMmN8DLUg6j9uyXXKHHhyJKTo2nsQ2Djh2KIkuWtZ1xHI0AUdkhZIzJc2d+U6zFEc/4Y43TcEhCuoVJiw3C3SzOJewuwjChvwmaOR5HPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIWhDF4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIWhDF4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2431F00893;
	Thu,  4 Jun 2026 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780568617;
	bh=Q1LsA3nSmSROFbmp+n5+LgDT4N55hEX8eHiUDKDjrRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TIWhDF4zRlBRWBhpahWdyWncCH0zZ9jAZLk4PpFNc+IQoZVNqc7AfldIyGFcKoiG0
	 3KLYA1MtHBJe+KCIl9JL99NaTX14zjfFWn9nXlhfzGMwGvDqMm57ohCaY6lJbLP4bv
	 5cJsn3PVVZBKGft8XdfMZrluqOIh+p8uubnJmftL+1Yp98JQ2Xy11Y9at3cQ55H6nT
	 Gw/DRuPDMr61aIXl15oUo7zmxHGsUQe0oFC3uxGq0nmpa+R88FvfCi27lmBs7equyW
	 wKfDm/QBB/5VvGhM1UatvJKBYp1WPJrnvMWEtIf5T8BvmAoZ7pSC242rXQWWu/Ms9N
	 g7zCSqyJy4faA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260604101220.1092822-3-a0987203069@gmail.com>
References: <20260604101220.1092822-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 10:23:35 +0000
Message-Id: <20260604102336.3F2431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver implements a dummy USB role switch that falsely reports=
 success without modifying hardware state.
- [High] Race condition exposing the PHY provider before initialization com=
pletes leads to a Use-After-Free.
- [High] PHY initialization fails due to polling clock stability bits while=
 the PHY clock is disabled.
- [Medium] Ignoring the return value of `regmap_read()` results in the use =
of uninitialized stack memory.
--

commit 9e57cc2572b36a8f75f7ca9bc25a14c367c18b1a
Author: Joey Lu <a0987203069@gmail.com>
Subject: phy: nuvoton: Add MA35D1 USB2 OTG PHY driver

Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC. It=20
implements Power-On Reset sequence, optional resistor calibration trim,=20
and a USB role switch.

> diff --git a/drivers/phy/nuvoton/phy-ma35d1-otg.c b/drivers/phy/nuvoton/p=
hy-ma35d1-otg.c
> new file mode 100644
> index 0000000000000..53bc6ddf755e6
> --- /dev/null
> +++ b/drivers/phy/nuvoton/phy-ma35d1-otg.c
[ ... ]
> +static int ma35_otg_phy_init(struct phy *phy)
> +{
> +	struct ma35_otg_phy *p =3D phy_get_drvdata(phy);
> +	unsigned int n =3D p->phy_idx;
> +	u32 ready_mask =3D USBPMISCR_PHY_HOST_READY(n);
> +	unsigned int val;
> +	int ret;
> +
> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
> +	if ((val & ready_mask) =3D=3D ready_mask)
> +		return 0;

[Severity: Medium]
Does ignoring the return value of regmap_read() risk evaluating uninitializ=
ed
stack memory here?

If the read fails, val remains uninitialized, and using it in the bitwise
operation could cause non-deterministic behavior, such as incorrectly skipp=
ing
the PHY power-on reset sequence.

> +
> +	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +			   USBPMISCR_PHY_CTL_MASK(n),
> +			   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
> +	msleep(20);
> +
> +	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +			   USBPMISCR_PHY_CTL_MASK(n),
> +			   USBPMISCR_PHY_SUSPEND(n));
> +
> +	ret =3D regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR, val,
> +				       (val & ready_mask) =3D=3D ready_mask,
> +				       10, 1000);

[Severity: High]
Is it possible for this polling to time out because the PHY clock isn't
enabled yet?

The polling expects the PHY clock to be stable, but the PHY clock (p->clk) =
is
only enabled later in ma35_otg_phy_power_on(). Because the Linux PHY framew=
ork
guarantees that phy_init() is called before phy_power_on(), the PHY referen=
ce
clock remains disabled during this stability polling.

> +	if (ret) {
> +		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=3D0x%08x)\n",
> +			n, val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static enum usb_role ma35_otg_read_id(struct ma35_otg_phy *p)
> +{
> +	unsigned int val;
> +
> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
> +}

[Severity: Medium]
Can this return an arbitrary USB role if regmap_read() fails?

If the read fails, the uninitialized stack variable val is evaluated, leadi=
ng
to a potentially incorrect role being reported.

> +
> +static int ma35_otg_role_sw_set(struct usb_role_switch *sw,
> +				enum usb_role role)
> +{
> +	struct ma35_otg_phy *p =3D usb_role_switch_get_drvdata(sw);
> +
> +	p->cur_role =3D role;
> +
> +	return 0;
> +}

[Severity: High]
Since the hardware mux is entirely automatic based on the physical USB ID p=
in,
should this .set callback return an error instead of falsely reporting succ=
ess?

Writing to p->cur_role doesn't configure any hardware register, and the .get
callback correctly queries the hardware directly. Returning 0 here defeats =
the
subsystem's -EOPNOTSUPP rejection for read-only switches, as writes from
userspace will appear to succeed but will not change the actual hardware st=
ate.

> +
> +static enum usb_role ma35_otg_role_sw_get(struct usb_role_switch *sw)
> +{
> +	struct ma35_otg_phy *p =3D usb_role_switch_get_drvdata(sw);
> +
> +	return ma35_otg_read_id(p);
> +}
> +
> +static int ma35_otg_role_switch_init(struct platform_device *pdev,
> +				     struct ma35_otg_phy *p)
> +{
> +	struct usb_role_switch_desc sw_desc =3D { };
> +
> +	p->cur_role =3D ma35_otg_read_id(p);
> +
> +	sw_desc.set =3D ma35_otg_role_sw_set;
> +	sw_desc.get =3D ma35_otg_role_sw_get;
> +	sw_desc.allow_userspace_control =3D true;

[Severity: High]
Is it appropriate to set allow_userspace_control to true given that the swi=
tch
strictly reflects an automatic hardware state?

> +	sw_desc.driver_data =3D p;
> +	sw_desc.fwnode =3D dev_fwnode(&pdev->dev);
[ ... ]
> +static int ma35_otg_phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	provider =3D devm_of_phy_provider_register(&pdev->dev,
> +						 of_phy_simple_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
> +				     "Failed to register PHY provider\n");
> +
> +	if (p->phy_idx =3D=3D 0) {
> +		ret =3D ma35_otg_role_switch_init(pdev, p);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Could registering the PHY provider before role switch initialization risk a
use-after-free?

If devm_of_phy_provider_register() exposes the PHY globally, a consumer on
another CPU could look up the PHY and call phy_init(), acquiring a referenc=
e.

If ma35_otg_role_switch_init() subsequently fails, probe returns an error,
triggering the devm cleanup which frees the struct ma35_otg_phy *p memory.
Because the consumer already holds a valid reference, subsequent calls to
PHY APIs will dereference the freed pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604101220.1092=
822-1-a0987203069@gmail.com?part=3D2
