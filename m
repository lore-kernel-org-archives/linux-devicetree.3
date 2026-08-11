Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF43FFAC3
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485264; cv=none; b=kGBKQUMRTauDB1kQZLVPQRgsgmdt1KprSavqwFB86bif0Z3gHryHYqKgD0LJtOMYcoejGXsWfExqniOUQuXz9vS0Vd1svA6qCycG+UmsK1HB3av8+FvL162e2Duw6kirBiI2kpVUTeDpMiFpQ8A5gp6B9QuwYoG65VrWzIY9JI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485264; c=relaxed/simple;
	bh=yvfjvUiDiygXp7uzf+FOj0tgnFkQH8fbF578S7/tpPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O0wwfeQurH91U9P58PtJBZKzeEp1W/f4fZJR6HjoZ3mnOTrYnP2HOWAD+xhODFdwi+3/aEPkzxw4iNL/qOe/pd9tlfdWR2yF/dEY0aXs/rqm0+6fQi54v2AA1Nyp0Za3EwkvK4kSzLXiEQEKR8yJ4Fx//kp5KvloGYUcGf+SUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv/u9dd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv/u9dd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBC41F000E9;
	Tue, 11 Aug 2026 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485262;
	bh=uDYeWCdVyDrKahIK3w7QUs5NMprFcUrSAJCupD7ItkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mv/u9dd5e5RQsYW6GTrd8r7W4UniiOMs+Zq6ljkp7dRHq0ZlD2u+k4G3kmOlIi3cs
	 R8V4hzotYZlueKKa1xA80tjEBt0PhCes8+dAsZ6lO3jR9ZXFSipvd6aee1jJRi6IEc
	 nuje1m1kJBJ4pe4xZK/qk+Yxc2svtQ3MuB1r0CQqzH68eU0WHoQf8gxpaqqd7mcRfz
	 HjBu4vZXdYyXQl1mmT6jpB8sRfUgbonr4vuYO1E59a2AfuZMQhMnr/2mqBpozk5X0z
	 3Q4pzQHOmKMz/A6PRYAO6ear5/sqICX65wceGpzg3Q+l8+Fq1o8iRWbLTTM4LfETCX
	 KzO2QMw9kRwVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] usb: misc: qcom_eud: add sysfs attribute for
 port selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260811213610.2956147-3-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:54:21 +0000
Message-Id: <20260811215422.4DBC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The `port` attribute unconditionally allows selecting a secondar=
y port on single-port hardware platforms.
- [Medium] The initial software state of `port_idx` is not synchronized wit=
h the hardware configuration during device probe.

Pre-existing issues:
- [High] The `chip->enabled` flag is never cleared when EUD is disabled, pe=
rmanently blocking subsequent port changes.
- [High] Simultaneous active interrupts cause an unhandled interrupt storm =
in `handle_eud_irq`.
--

--- Patch [2]: [PATCH v6 2/9] usb: misc: qcom_eud: add sysfs attribute for =
port selection ---
commit 6f4483594010ca910c4a59bd283f5067e4e3b31e
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add sysfs attribute for port selection

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation.

[ ... ]

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 926419ca560fc..25a6a8f110ec8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
> =20
>  static DEVICE_ATTR_RW(enable);
> =20
> +static ssize_t port_show(struct device *dev, struct device_attribute *at=
tr, char *buf)
> +{
> +	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);

[Severity: Medium]
Could the initial software state of chip->port_idx be out of sync with the
hardware?

If the bootloader configures EUD_REG_PORT_SEL to the secondary port prior
to kernel boot, eud_probe() leaves port_idx as 0 from its initial
allocation.

Will port_show() erroneously return "primary" while the hardware is
actually configured for the secondary port?

> +}
> +
> +static ssize_t port_store(struct device *dev, struct device_attribute *a=
ttr,
> +			  const char *buf, size_t count)
> +{
> +	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +	int port;
> +
> +	port =3D sysfs_match_string(eud_port_names, buf);
> +	if (port < 0)
> +		return port;
> +
> +	/* Port selection must be done before enabling EUD */
> +	if (chip->enabled)
> +		return -EBUSY;

[Severity: High]
This is a pre-existing issue, but since the new port_store() function
relies on chip->enabled, does the driver ever clear this flag when EUD is
disabled?

Looking at enable_store(), when a user writes '0', it calls disable_eud()
but it doesn't appear to set chip->enabled to false:

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
    } else {
        ret =3D disable_eud(chip);
    }
    ...
}

Once enabled, will chip->enabled stay true forever and permanently block
subsequent port changes?

> +
> +	writel(port, chip->base + EUD_REG_PORT_SEL);
> +	chip->port_idx =3D port;

[Severity: Medium]
Does this code allow selecting a secondary port on hardware platforms that
only physically support a single port?

I don't see a check against device tree capabilities or a mechanism like
is_visible() to hide this attribute on single-port devices. Unconditionally
configuring the hardware register to a non-existent port could lead to
undefined behavior.

> +
> +	return count;
> +}
> +

[ ... ]

While reviewing the rest of the file, I noticed another detail:

[Severity: High]
This is a pre-existing issue, but can the interrupt handler experience an
unhandled interrupt storm if multiple statuses are asserted?

If both EUD_INT_VBUS and EUD_INT_SAFE_MODE are asserted simultaneously,
the switch statement in handle_eud_irq() looks like it might fail to handle
the combined bitmask:

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
    ...
    switch (reg & EUD_INT_ALL) {
    case EUD_INT_VBUS:
        usb_attach_detach(chip);
        return IRQ_WAKE_THREAD;
    case EUD_INT_SAFE_MODE:
        pet_eud(chip);
        return IRQ_HANDLED;
    default:
        return IRQ_NONE;
    }
}

Since EUD_INT_ALL includes both bits, wouldn't reg & EUD_INT_ALL evaluate
to 0x14, fall through to the default case, and return IRQ_NONE without
clearing either interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D2
