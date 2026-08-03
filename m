Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B5F35E1BF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727515; cv=none; b=K3xDwJiGICngx1h1JwnQu7v3DCeX5hpufeF8nxGXYClxLXajyr13tE+tOnfLjro4YS7vtMjcirb2L/CmTw4ZKWQPXpr+FNZnthzX3kqWBd2fMsxFrA6e/Glfuhij0GyZLgx7rARJTQBKcP7lNdAohYxgJXjF0whykq28xJfOnno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727515; c=relaxed/simple;
	bh=KD/YGV4e3Oo4fXD8alCD5eW3T55u5Y+kuHR7sULhV9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r/gCVfneEX8a7tVxrg8TCVb0O+o+R06bAD2NL25NuDpXvjpT6yjDZNXiJd9SEsS5sWuNto7ABeofP6JGwNBv52JX6ZkHwTO8FF5nA2BCBL3FwspAFjEL/0gS9ytSMrW1LoRKhS4l1ettLqHqG+TJgQKhsnETyrCvr0iLrEASbyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UflqgxPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UflqgxPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0661F00A3A;
	Mon,  3 Aug 2026 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727513;
	bh=4tm/kF31bTI0I9P9WvTdIMRpi/S0qlcw577tmU4mOGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UflqgxPqXUBxI9WG4bv7kNIZAnWPZjc8pb1/6+yfT+q94zkXMdqu0Nm1SxN3ytXKk
	 pLVQ9F84pRDm1igqO3TNfR9Rjy3XNpmTbsEz4ChieSnYYaT8RpUgS5vMStidbppsoz
	 rvxeBMB3yDXuWXqalqX4RGQURQ7tmAsFv7eN8Nlsy+VNbEtexh3J1rcuVe1p7iuMXn
	 /Ds1svxM5ZsGJ66raYy0Ds1u8JW7wSC5Q7gA0nxLJ3jOhiJ8zTbUnT0a0D2i9R6UxN
	 XaWCFU4IZNHTguIIqavZXSBIp04IbTH3e0TAauIgIR1+W2PxfatQCpeBMWYQoNwv6D
	 ABnmdEgn0eNKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] usb: misc: qcom_eud: add sysfs attribute for
 port selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803031534.2942628-3-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:25:12 +0000
Message-Id: <20260803032513.4A0661F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Lockless race condition between `enable_store` and `port_store` al=
lows unsafe concurrent hardware register mutation.
- [Medium] The initial software state for the USB port is out of sync with =
the uninitialized hardware register at probe time.

Pre-existing issues:
- [High] The pre-existing failure to clear `chip->enabled` when disabling t=
he EUD permanently locks the newly added `port` sysfs attribute.
- [High] Calling `readl_poll_timeout()` from hardirq context causes a 'sche=
duling while atomic' panic.
--

--- Patch [2]: [PATCH v5 2/9] usb: misc: qcom_eud: add sysfs attribute for =
port selection ---
commit d4f0438c23f8813f8cdd1221aa0f9078442b7817
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
> @@ -40,6 +48,7 @@ struct eud_chip {
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
> +	u8				port_idx;

[Severity: Medium]
Does the initial software state of the USB port get out of sync with the
uninitialized hardware register at probe time?

During eud_probe(), devm_kzalloc() implicitly zeroes chip->port_idx, which
corresponds to 'primary':

drivers/usb/misc/qcom_eud.c:eud_probe() {
    ...
    chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
    ...
}

However, the driver's probe sequence never writes to EUD_REG_PORT_SEL to
enforce this default, nor does it read the register to populate chip->port_=
idx.

If the hardware defaults to or is left in the 'secondary' state by a bootlo=
ader,
the sysfs attribute will incorrectly report the 'primary' port is selected.

>  };

[ ... ]

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
This is a pre-existing issue, but because enable_store() never sets
chip->enabled to false when disabling the device, will this check
permanently lock out port changes once the EUD has been enabled?

If a user writes '1' to /sys/.../enable, and then writes '0', the device
successfully disables. However, because chip->enabled is never updated to f=
alse:

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
    } else {
        ret =3D disable_eud(chip);
        /* chip->enabled =3D false; is missing */
    }
    ...
}

Any subsequent write to /sys/.../port will evaluate chip->enabled as true a=
nd
reject the operation with -EBUSY indefinitely.

[Severity: High]
Does this lockless check allow unsafe concurrent hardware register mutation?

If there are concurrent writes to the enable and port sysfs attributes,
port_store() validates chip->enabled without taking a lock. Concurrently,
enable_store() could call enable_eud(), which turns on the hardware and sets
chip->enabled to true:

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
    if (enable) {
        ret =3D enable_eud(chip);
        if (!ret)
            chip->enabled =3D enable;
    ...
}

This would allow port_store() to overwrite the EUD_REG_PORT_SEL register wh=
ile
the EUD is actively being enabled, leading to undefined hardware behavior.

> +
> +	writel(port, chip->base + EUD_REG_PORT_SEL);
> +	chip->port_idx =3D port;
> +
> +	return count;
> +}

[ ... ]

[Severity: High]
This is a pre-existing issue, but does calling readl_poll_timeout() from
hardirq context cause a 'scheduling while atomic' panic?

The hardware triggers an EUD_INT_SAFE_MODE interrupt, and the primary
interrupt handler handle_eud_irq() invokes pet_eud():

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
    ...
    case EUD_INT_SAFE_MODE:
        pet_eud(chip);
        return IRQ_HANDLED;
    ...
}

Inside pet_eud(), readl_poll_timeout() is called with a 1-microsecond delay:

drivers/usb/misc/qcom_eud.c:pet_eud() {
    ...
    ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
                    reg, (reg =3D=3D 0), 1, 100);
    ...
}

Since readl_poll_timeout() internally expands to usleep_range(), it attempts
to sleep while interrupts are disabled, which triggers a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D2
