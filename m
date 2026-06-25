Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45CE2F3600
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356367; cv=none; b=QNqTQ9M5tbI/CgKqopXm58FEg1LvBUxIeWeJxtPCH+j36dzHTkfPPomX70y0069gN05AE0/TUL93EUkI67eXxmjXjavku5AW6WCV85UX6kMYoDXrSm9EF462fUNY6Pzl6G5fQF864fAGzKjHSDz3WQMgYkyBUBxBLFpi2QMWkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356367; c=relaxed/simple;
	bh=BfUpTwDnm/+gp2FBcezAXq/bH/daKdlyxa5vbfpupDw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dmE4ykPc4KHCheVyvGtG4W7Hhk1utYmawQUN292CtnGM+uxzCjx6V/kD6fNkY5r15sY4JygiNTKDqo7zibJrrvIyD8+vw3Y1XIqEJtevf+9FcpbpY7Mj1S9aLxgaTV3iAWrdhl9PgFrguetNfJwocNJOWCMcX5qK4EKOYkzP6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdKktpW9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdKktpW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4F81F000E9;
	Thu, 25 Jun 2026 02:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782356366;
	bh=avXWWg+j1E3+3kJoRvQbitlmoOR8W82Q+/SqLJ8QQUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdKktpW9lGsiJCdkkQZUFknd7olJ+EDbsu/vtu7sMJAkNPmtH6NztF4l9qzRWqdpO
	 DLw5JOaG+jN07oCJ7OQF0rdcyijQmaMOGzoQYIS0dve8axZFmNVW/inZZNHHZ+9beL
	 j+Br7TBqTaw4LxDmjukAilsSxnH5Gz5TpbHy7TqV1aKQk+ea3ZpPF62KC7ZboF4uvp
	 ru+8N2CGhyMxqJBO3txvZSZ6N7s9KeYtVzSDmtFJkKHulXGc4u5j78IXauCik6MZtN
	 KKIaodBR4qcwzqHtEVXcPq6KI1ZlOJabx9RdB7X/Xctl53magpaMpDALyVhKQZQhdA
	 qjDKJfhtGqSlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260625023958.569299-5-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-5-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 02:59:25 +0000
Message-Id: <20260625025926.3A4F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The custom `ma35_usb_phy_xlate` callback accesses `args->args[0]` =
without verifying `args->args_count`, leading to a potential read of uninit=
ialized stack memory.
- [High] The driver breaks Device Tree backward compatibility by unconditio=
nally relying on the parent's `of_node` for the syscon regmap, removing the=
 legacy 'nuvoton,sys' phandle fallback.
- [High] The driver fails to explicitly clear the 'MISCFCR0_UHOVRCURH' bit =
if the 'nuvoton,oc-active-high' property is absent, leading to persistent i=
ncorrect hardware state across soft reboots.
- [High] The driver incorrectly skips PHY clock stabilization checks if the=
 `SUSPEND` bit is already set, potentially leading to hardware hangs.
- [Medium] The variable 'val' in `ma35_role_sw_get` is used uninitialized i=
f the `regmap_read` call fails.
--

commit ff3f6d83cfb95f48a64d4c533549a7465a41d150
Author: Joey Lu <a0987203069@gmail.com>

phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

This commit extends the driver to support both PHY ports and integrates OTG
role switching. It introduces a custom xlate function, unifies the init
callback, removes redundant clock management, and registers a USB role swit=
ch.

> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
[ ... ]
> +static int ma35_usb_phy_init(struct phy *phy)
> +{
> +	struct ma35_phy_port *port =3D phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p =3D container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
> +	unsigned int n =3D port->idx;
> +	unsigned int val;
> +	int ret;
> +
> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
> +
> +	if (val & USBPMISCR_PHY_SUSPEND(n))
> +		return 0;

[Severity: High]
Does returning early here skip necessary PHY clock stabilization checks?

The previous implementation specifically polled the clock stable bit
even when the suspend bit was already set. By returning immediately,
the USB controller might start accessing the PHY before its newly ungated
clock has fully stabilized, potentially resulting in bus hangs.

[ ... ]
> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
> +{
> +	struct ma35_usb_phy *p =3D usb_role_switch_get_drvdata(sw);
> +	u32 val;
> +
> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
> +
> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
> +}

[Severity: Medium]
Is it possible for val to be evaluated uninitialized here?

If regmap_read() encounters an error, it returns a non-zero error code
and leaves val unmodified. This could cause the function to return an
incorrect USB role based on stack garbage.

[ ... ]
> +static struct phy *ma35_usb_phy_xlate(struct device *dev,
> +				      const struct of_phandle_args *args)
> +{
> +	struct ma35_usb_phy *p =3D dev_get_drvdata(dev);
> +
> +	if (args->args[0] >=3D MA35_PHY_NUM)
> +		return ERR_PTR(-EINVAL);

[Severity: High]
Does this code safely handle device trees where the number of phy cells is =
zero?

If args_count is zero, args->args would be uninitialized stack memory,
which could result in returning an incorrect PHY port or out-of-bounds
access. Should there be a check for args->args_count >=3D 1?

[ ... ]
> +static int ma35_usb_phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	p->sysreg =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(p->sysreg))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
> +				     "failed to get parent SYS regmap\n");

[Severity: High]
Does this break Device Tree backward compatibility?

The old implementation relied on a "nuvoton,sys" phandle fallback which has
been removed here. Systems using older device tree binaries might fail to
probe the USB PHY on kernel upgrades if the node isn't a direct child of
the syscon.

[ ... ]
> +	if (of_property_read_bool(pdev->dev.of_node, "nuvoton,oc-active-high"))
> +		regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0,
> +				   MISCFCR0_UHOVRCURH, MISCFCR0_UHOVRCURH);

[Severity: High]
If the "nuvoton,oc-active-high" property is absent, should this code explic=
itly
clear the MISCFCR0_UHOVRCURH bit?

Without an else branch to clear the bit, a soft reboot could incorrectly
inherit an active-high state set by a bootloader or previous kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625023958.5692=
99-1-a0987203069@gmail.com?part=3D4
