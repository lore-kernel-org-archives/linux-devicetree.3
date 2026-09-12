Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C067230BDB
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226970; cv=none; b=rBVoGoJgez85vWd2qCWEkmjfW1h+TOXCAxXP6gPa0HR3odAjSbYqpm6zwMvajxETH0xlT757VP6ukpWn5BPK9EDFBsgBLW0Rc7SeJZia6wndLI1e0mge6SLyzvWhbzwRa6TNryb4HVEgAIpNalz64BDVnKQLILVOZ61aAtuHYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226970; c=relaxed/simple;
	bh=PXYLx2rehl+r9ATfGamd80bXix5LtEpT3E6n2bT6DLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AuChaqLwWicUkI8fgdY3Eaa3Yi4Y90/bqzIymxz4skEoDLSu99dQflB12Y8mWjshKbDSMreIr/PsyHJAj/S8BItuMyoiFzMy0cPVNPmMmT1jdI5vRCyLFOE3VZCyZCCSP6oYVHuwoQl/x/zkEHAfHEoMKpjp46SEfTpUgGuCkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDNBK9zk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDNBK9zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7031F00893;
	Sat, 12 Sep 2026 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789226969;
	bh=Ha52ymBZoXjDrN7HDBFwxRGJxh/s2J0MrOVZ+c3q03w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QDNBK9zkWLiopocTfe4KvAV6+VDciwQ5YhvHtNtb0xzfLZ9gUWtLbOGdlVTQqTUVN
	 GEDRW2I2yZnsZzcQKgvAAtv8zUttz+eiVVEv3efdtcOXbKBVft+K1o9VQvkYrC3Fp9
	 nh9QN/fDig6J3UeikuLjjRdE6HuzJh7yYY+Xy9BU/vZ+Ak85Wpzih019QZhI7JtSJp
	 +uIv+ep0Ji+8C0xHRt6vM/shz6UVELaxDWnxg1GYWTfCVKsQty08SfJxLmatB8Tcda
	 EvV9znAVQmZtgiE4sITmvB9S2fkhx3gRZkXgu89vO+VMJHdytrXS+5pz5fQgi3yrT4
	 pyiJGwR3wZ7fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] power: supply: bq256xx: Expose VBUS state
 through extcon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Reza Kurniawan" <imkyufie@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-riva-usb-v2-1-997fe0171ee5@gmail.com>
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-1-997fe0171ee5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 15:29:28 +0000
Message-Id: <20260912152928.7C7031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but an uninitial=
ized stack pointer bat_info is dereferenced in the error path if battery in=
fo is missing.
--

commit 63c7018777c13e9b5077c305354b34365e65a932
Author: Reza Kurniawan <imkyufie@gmail.com>

power: supply: bq256xx: Expose VBUS state through extcon

Useful for USB controllers needing to sense VBUS state changes. This is
needed for devices like Xiaomi Redmi 5A (riva) that doesn't have its VBUS
session comparator wired directly to the USB connector pin to automatically
enable certain USB functions upon the presence of a USB power input.

> diff --git a/drivers/power/supply/bq256xx_charger.c b/drivers/power/suppl=
y/bq256xx_charger.c
> index 4b1f81b1ed867..454bc497b0d81 100644
> --- a/drivers/power/supply/bq256xx_charger.c
> +++ b/drivers/power/supply/bq256xx_charger.c

[ ... ]

> @@ -1743,6 +1817,12 @@ static int bq256xx_probe(struct i2c_client *client)
>  	if (!IS_ERR_OR_NULL(bq->usb3_phy))
>  		usb_register_notifier(bq->usb3_phy, &bq->usb_nb);
> =20
> +	ret =3D bq256xx_extcon_init(bq);
> +	if (ret) {
> +		dev_err(dev, "Failed to register extcon device\n");
> +		return ret;
> +	}
> +
>  	if (client->irq) {
>  		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>  						bq256xx_irq_handler_thread,

[Severity: Critical]
This isn't a bug introduced by this patch, but looking at bq256xx_hw_init()
called shortly after this block in bq256xx_probe(), is it possible for the
bat_info pointer to remain uninitialized and cause memory corruption?

If power_supply_get_battery_info() returns an error other than -ENOMEM
(such as -ENODEV when no "monitored-battery" node is defined), bat_info
remains uninitialized, but it is then dereferenced in the error handling
path:

drivers/power/supply/bq256xx_charger.c:bq256xx_hw_init() {
	struct power_supply_battery_info *bat_info;
	...
	ret =3D power_supply_get_battery_info(bq->charger, &bat_info);
	if (ret =3D=3D -ENOMEM)
		return ret;

	if (ret) {
		dev_warn(bq->dev, "battery info missing, default values will be applied\n=
");

		bat_info->constant_charge_current_max_ua =3D
				bq->chip_info->bq256xx_def_ichg;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-riva-usb-v=
2-0-997fe0171ee5@gmail.com?part=3D1
