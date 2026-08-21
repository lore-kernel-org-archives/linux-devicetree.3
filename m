Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08549362C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329646; cv=none; b=obgGoXDGydDpH7uc4h+neGa7RIQaOCEkoVvObOsMD0/VZ7sRPAQQ3fJDlYuCC6Zc2fSYWgPBVeoAokQs4vIeYlABBj4WzyVYwUW3cD141/EltIYaEomPmuQMmp6NCf5IYPpNDiBqcdVTknX9hIFI/KmYvmV5GnB5321srFTwkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329646; c=relaxed/simple;
	bh=ng59kkrYSyvGQ2UHtwXg6HAg0JtQS7FlY2qFbbH5XDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V7sQggrvaSEC4cYID2OGaOznEq73Ezwj8CgzqYY9aYAP1H+SckA5eai9L1bOD59Vrwr/RUyWHW04K9dLEPHpNdsbmqSwiOg3cKw3b/beJnjjXiDrsX03TSCQSHfSv/Xsh24OmkpZA9ke4yQmcBNncrqIgGckRmz/WjQEpwLFG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyMwO77P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyMwO77P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A2B1F000E9;
	Fri, 21 Aug 2026 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329644;
	bh=Ulf1GDo4AdVTzbJocdEwvi2Zu0oHZKg0ae9ZG/qS9KY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyMwO77P/x+SGFb7Nv/xWt/Lr2BladV5ubLk77yHHstyfiix/LJRW5j7z7y28SmPk
	 CNix/KN+92zyfxXcQL5HxUIYmqQvL+KFdPpoW/SXwRzMNb37pM9b/5ySr9VTVKjIuQ
	 9Xkj0edco8xnJGAkwY1TVKcggVB7awHMCfQkST/6pWhcFTQdjzOzg2jxlwJy9y4Xxt
	 51RI1EhvS5sRlDNrN6VtetaMmDnz++nZIhLDlMqjMNGIWramBHjPyESIcwLYaAGwaQ
	 8zsBS737Zfe0xcZhEjRtEFmncAEZ/DNnx9xxBLZRo1ZEbcG4u7oY0q1+kwUnjUtnoe
	 MDuxgQBWZT68g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:27:23 +0000
Message-Id: <20260821162724.63A2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device interrupt `client->irq` is managed via `devm_request_th=
readed_irq()` and can fire while manual cleanup is performed in `hd3ss3220_=
remove()` and the `probe()` error paths, leading to a use-after-free.
--

--- Patch [2]: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply re=
gulators ---
commit 1452abf55fe5c07be0afe4c56142e011df996897
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: hd3ss3220: Add support for supply regulators

This commit adds support for supply regulators for the HD3SS3220. It ensures
VDD5 is enabled 2ms before VCC33 is applied to prevent the device from being
backpowered and wedging the I2C bus.

> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index d0de5a2488f95..b53455abc0480 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c

[ ... ]

> @@ -379,6 +407,10 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (IS_ERR(hd3ss3220->regmap))
>  		return PTR_ERR(hd3ss3220->regmap);
> =20
> +	ret =3D hd3ss3220_power_up(hd3ss3220->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* For backward compatibility check the connector child node first */
>  	connector =3D device_get_named_child_node(hd3ss3220->dev, "connector");
>  	if (connector) {

[Severity: High]
This is a pre-existing issue, but could the manual resource cleanup in the
error paths and remove function cause a use-after-free?

The device interrupt client->irq is managed via devm_request_threaded_irq().
Devres resources are destroyed by the core after the remove callback return=
s,
or after probe returns an error.

However, typec_unregister_port() and usb_role_switch_put() are called
manually inside hd3ss3220_remove() and the probe error path before the
interrupt is disabled by devres:

drivers/usb/typec/hd3ss3220.c:hd3ss3220_probe() {
    ...
err_unreg_port:
    typec_unregister_port(hd3ss3220->port);
err_put_role:
    usb_role_switch_put(hd3ss3220->role_sw);
    ...
}

If an interrupt fires concurrently during this window,
hd3ss3220_irq_handler() will call hd3ss3220_set_role(), which dereferences
hd3ss3220->port and hd3ss3220->role_sw after they have been freed.

Does the interrupt need to be explicitly disabled, or should the port and r=
ole
switch cleanup be handled via devm_add_action_or_reset() to ensure correct
ordering?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-hd3ss3220-=
regulators-v1-0-405e5c4fb306@flipper.net?part=3D2
