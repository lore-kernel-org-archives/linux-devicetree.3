Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5EB3264E7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727708; cv=none; b=TF7RCW2mSs43pja31LwMSP913Y9QutZqA4mQ7fg+vwSBmBJiJeNebze92V1rDiRj0hsSCuG7OU0SJTnWsAw19oIrLsR5U4nZCgHc3vvM+cEnHugEpNMaJ/j12R8dQSjW3LFVsIwGIE+BD7uBcLxp5auYcVX4pVuKqNn67365mGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727708; c=relaxed/simple;
	bh=PmdmzZzeXkN01boOocXi+5Rp4FwVRAvI90jeUkvgDzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOi3irwRHJv2o8QRCioRNi9CLOtFx1Xa1+jzJU/UqOvp55XsfqGK8kcI8VvzAq2IVmy+SpI5LQFyAKNo6rvfPt9DjfQ0+KHqk7f06gDx8iHSqkjiw1vVtpMkdZJynK35mQTU40vuu+zzrDBnIpM326DeUCPk3vST5R2rk1Zx598=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2OoNVRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2OoNVRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FFE1F000E9;
	Mon,  3 Aug 2026 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727707;
	bh=ZyXc4luhiPwOl6mqJwkweBisKGtRDtoeaS+Lca7tTjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h2OoNVREHqIUEDUFbrBLVScDKgCImZE+VUBqeW1OA96m5L5uSfOA91S9oH1skBwXB
	 7BnwtvVhmduMTxm/t6h+jM+Fx28J2hSsUJrUqgAKU4Qainq6/1a8lKAmk+cRoTcd6t
	 2z769JPY7HZBlb6nkkygDYM2shA7uJF5jHr5HRypJBQNxGuYLGqVfzrHAGrUPgeq6v
	 LwJR+S+VwOs6cFASYuM5AoOZipm9UkAB7NlP8O9pjqni2GYdLUQR9kKmC45oDL4DZ9
	 EakASqoSP2sJWaF5QXLT6Q0dGaYzFld+G0wwSz2T8wFtD3fdZFASZXEe1tRqyDpVe2
	 vx63Eqf1ga/Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803031534.2942628-4-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:28:26 +0000
Message-Id: <20260803032826.F1FFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] A race condition between `enable_store` and `port_store` leads to =
unbalanced PHY power operations and resource leaks due to lockless state mo=
dification.
- [High] Concurrent writes to the `enable` sysfs attribute lack serializati=
on, causing double-initialization and leakage of PHY resources.

Pre-existing issues:
- [High] The sysfs `enable_store` callback fails to clear the `chip->enable=
d` flag when disabling the EUD, permanently locking the device state.
--

--- Patch [3]: [PATCH v5 3/9] usb: misc: qcom_eud: add per-path High-Speed =
PHY control ---
commit 577fea81d5ebf5fe65bcee04faa29252dcef08d7
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path High-Speed PHY control
   =20
EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

[ ... ]

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 25a6a8f110ec8..03d1c200658c8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -39,26 +41,84 @@ static const char * const eud_port_names[] =3D {
>  	"secondary",
>  };
> =20
> +struct eud_path {
> +	struct eud_chip		*chip;
> +	struct phy		*phy;
> +	u8			num;
> +};
> +
>  struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
> +	struct eud_path			*paths[EUD_MAX_PORTS];
>  	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
> +	bool				phy_enabled;
>  	u8				port_idx;
>  };
> =20
> +static int eud_phy_enable(struct eud_chip *chip)
> +{
> +	struct phy *phy;
> +	int ret;
> +
> +	if (chip->phy_enabled)
> +		return 0;

[Severity: High]
Does this lack serialization for concurrent sysfs writes? If two threads
concurrently write '1' to the 'enable' attribute, both could invoke
enable_eud() and reach here simultaneously.=20

Since there is no locking, both threads could evaluate chip->phy_enabled as
false at the same time and proceed to call phy_init() and phy_power_on().

Would this double-increment the PHY's reference counts, meaning a later call
to eud_phy_disable() would only execute once and leave the PHY references
permanently leaked?

> +
> +	phy =3D chip->paths[chip->port_idx]->phy;
> +
> +	ret =3D phy_init(phy);

[ ... ]

> @@ -130,6 +192,10 @@ static ssize_t port_store(struct device *dev, struct=
 device_attribute *attr,
>  	if (port < 0)
>  		return port;
> =20
> +	/* Check if the corresponding path is available */
> +	if (!chip->paths[port])
> +		return -EOPNOTSUPP;
> +
>  	/* Port selection must be done before enabling EUD */
>  	if (chip->enabled)
>  		return -EBUSY;
>  	writel(port, chip->base + EUD_REG_PORT_SEL);
>  	chip->port_idx =3D port;

[Severity: High]
Can this race with enable_store()? If thread A writes to the 'enable'
attribute and calls enable_eud(), which enables the PHY for the current
port_idx, could thread B write to 'port' before thread A sets
chip->enabled =3D true?

Thread A in enable_store():
    ret =3D enable_eud(chip);
    if (!ret)
        chip->enabled =3D enable;

Thread B in port_store():
    if (chip->enabled)
        return -EBUSY;
    writel(port, chip->base + EUD_REG_PORT_SEL);
    chip->port_idx =3D port;

If thread B updates chip->port_idx locklessly during this window, wouldn't a
subsequent disable operation in eud_phy_disable() use the new port_idx,
disabling a PHY that was never enabled and leaking the one that was?


[Severity: High]
This is a pre-existing issue, but does enable_store() fail to clear the
chip->enabled flag when disabling the EUD?

Looking at enable_store() in drivers/usb/misc/qcom_eud.c:

    if (enable) {
        ret =3D enable_eud(chip);
    } else {
        ret =3D disable_eud(chip);
    }

If the else branch handles disabling but omits clearing chip->enabled,
wouldn't writing '0' to 'enable' disable the hardware while leaving
chip->enabled true? This would cause subsequent attempts to write to
'port' to permanently fail with -EBUSY, breaking the new port switching
functionality introduced here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D3
