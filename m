Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C69511E8D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678357; cv=none; b=UXzgWUQPNVWzZpU3Q2SK4knUFBHH5d3elRpqg0x3WZq47E7gHIDq9TAi4hzbVhY1N02W5eTU1Zhj9mcu2gWUt/OfjuRWIJuoltodDLqU8RSVSiVOQZIY0WJ8boyI+mpBVLm6c/Fqn8jhyrNXClAqadaILwHAcqnWrpIhpO0sJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678357; c=relaxed/simple;
	bh=gFwbEs5mEr91BmM3tLvTDEdqjhGcyf6byhwSd+EGwLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUnQUlwFnjdfC8V3b54oE7tjH2HYhp07CGVT5fp4lWWRkdo8Oo1qaRXk6yxj5V0I+G5fKp8+Ev2ETXoJ4Yc+6TGIlZQCShFd/IjvnlDuJt747Dl1au7Knhet2xN+7O8/jwSgqmuvw4ib/deWQnruAIWpR/fV/iJmly7XGYM/d28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXnhhK77; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXnhhK77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A1B1F000FF;
	Tue, 29 Sep 2026 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790678342;
	bh=yjXZpjwiTcaJAJ6OHqDsA1sBdMLAAESxUSfIxauAHb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UXnhhK77Sq98kuyQfZWH5jR+ZswmQqaAYa4q9Gw+mb/Joah6xv7DNlPS3hBX209+u
	 xSkjrxi9Y9IRxqkMSg68bfExzmzozJMKG7bLssANbNIqfhUzmz21J7O+5VwJh+h9Ou
	 zybNUAJ2TiyBQmSwDhOSdo3sllwvOuAeV2IPL2sllNEwX5bK78L6NVXBuzsmpJIFZD
	 NIgFmt+a9FmV6Tu4yF/qGGLS2SGol6J6la0EGoXxZC8N4mepO9oK1Ia/muQWafEuIY
	 I9rLmqvoD2DnMsoWF9c178fD/VaJySKgqMQxog5Awuu+mivXqYfwcqWPOrKnTUnU3+
	 4MgIBvzKvpsSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] power: reset: syscon-reboot-mode: enable
 supplies for the next stage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-3-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-3-5a34ca72065a@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 10:39:01 +0000
Message-Id: <20260929103901.E1A1B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] power: reset: uninitialized pointer passed to regulator_bulk_enabl=
e()
--

commit cdeebbc0731de671c753a5b987cb44186458c7fb
Author: Alexey Charkov <alchark@flipper.net>

power: reset: syscon-reboot-mode: enable supplies for the next stage

This patch adds support for enabling power supplies named in the reboot mode
node when a boot mode is written. It requests the supplies in the probe
function using of_regulator_bulk_get_all() and enables them during reboot to
ensure the PMIC configuration is suitable for early boot code on the next
startup.

Link: https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a4=
7f1@flipper.net/

> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/res=
et/syscon-reboot-mode.c
> index e0772c9f70f7a..5ef882d818161 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
[ ... ]
> @@ -28,6 +32,20 @@ static int syscon_reboot_mode_write(struct reboot_mode=
_driver *reboot,
> =20
>  	syscon_rbm =3D container_of(reboot, struct syscon_reboot_mode, reboot);
> =20
> +	/*
> +	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
> +	 * system, and may need supplies that the running system had powered
> +	 * down. Enable them here, and deliberately leave them enabled: the
> +	 * system is on its way down, and what runs next may not know how to
> +	 * turn them on.
> +	 */
> +	if (syscon_rbm->num_supplies) {
> +		ret =3D regulator_bulk_enable(syscon_rbm->num_supplies,
> +					    syscon_rbm->supplies);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code introduce a regression if regulator_bulk_enable() fails?

The commit message notes a separate fix for the core API issue where
of_regulator_bulk_get_all() leaves the supply names uninitialized. Because
of_regulator_bulk_get_all() uses kmalloc_objs() internally (which does not
zero memory), the 'supply' field in the returned array contains garbage
pointers:

drivers/regulator/of_regulator.c:of_regulator_bulk_get_all() {
    ...
    _consumers =3D kmalloc_objs(struct regulator_bulk_data, num_consumers);
    ...
}

If regulator_bulk_enable() fails, the error path in the regulator core will
attempt to print the name of the failing supply:

drivers/regulator/core.c:regulator_bulk_enable() {
    ...
    pr_err("Failed to enable %s: %pe\n", consumers[i].supply,
           ERR_PTR(consumers[i].ret));
    ...
}

Because this patch relies on an uninitialized array from
of_regulator_bulk_get_all(), applying it independently introduces a regress=
ion
where the kernel will panic if a hardware issue or misconfiguration causes
regulator_bulk_enable() to fail during reboot.

> +		if (ret < 0)
> +			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
> +	}
> +
>  	ret =3D regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>  				 syscon_rbm->mask, magic);
[ ... ]
> @@ -59,6 +85,21 @@ static int syscon_reboot_mode_probe(struct platform_de=
vice *pdev)
> =20
>  	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
> =20
> +	ret =3D of_regulator_bulk_get_all(&pdev->dev, pdev->dev.of_node,
> +					&syscon_rbm->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't get reboot mode supplies\n");
> +
> +	syscon_rbm->num_supplies =3D ret;
> +	if (syscon_rbm->num_supplies) {
> +		ret =3D devm_add_action_or_reset(&pdev->dev,
> +					       syscon_reboot_mode_put_supplies,
> +					       syscon_rbm);
> +		if (ret)
> +			return ret;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-b4-rk3576-=
reboot-mode-v2-0-5a34ca72065a@flipper.net?part=3D3
