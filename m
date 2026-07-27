Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0002D97B9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115866; cv=none; b=r2d3Y+eftLI1/JTF9Dza0TLCwSGAixoJDw/0KdvFqT10LiObLckSUPtrP+zXL+wr6tceWSZK6R1jF5krtwQFaUrTrJ1FhbzdMzwNq/coMSybZ71SlYS2oIgppJ0Ye9KN3t9TnlZ6enAJCtrJpaG88F5+TOG1drrqT5mDZlX04eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115866; c=relaxed/simple;
	bh=XZMA4YyOr7W0CBh64idUQldUZg3at3AIB5JSnnTB5uE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TxbLj0BJmWOlxeQlT5upWSn5qgxQF4L9ap0TIdcdFmERt0xcxUAaq240OiNkxc3gYpv7aY1kTrh3Np4x1bBUi5B20R9Op1tepUHaUlchCAtKP5VngO2G+WqGUUIBdS4ToQUFuwQKZ0ULmiFq4+qn0DikhYD8vl+cUxroJGf5t08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irdawZv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irdawZv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863351F00A3A;
	Mon, 27 Jul 2026 01:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785115864;
	bh=EOL5tsTVIZUT6QcrfEjeyp3EV6XYkSpkvujOo1aPAHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irdawZv8dwrmLJrQ7aOv0DqzshEXlI7w02KjO4/i+iu0qtn/Mcm4lJtRT0INr31tC
	 FZi5byLaZkmc0ykWS8PUj8Gi9xnVCW0GbbDXZNkIsHd3hulHdGKnOVgTbsDuijWrNW
	 lVx4LUbbFHZSmTlpplnx5sEAzatFXw2HnpbJJx7Z0UYlCzckhQNJ9A1S70mLGtlG+f
	 sr8uz7w6zwjg7SpDv3LdX2AL3f648SnG2BMBfysHJfjBXb1K89GInnodL/8P7sQDut
	 coPr0V0vskA9d9qlpmENKzZOmF3vYOvT+YYakEO9Kr/ixiEJ5nKTs6VLQMBluqv4uq
	 bcO61ESg77j1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/11] power: supply: max17042_battery: Propagate
 status register errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727011319.621794-6-vincent.cloutier@icloud.com>
References: <20260727011319.621794-1-vincent.cloutier@icloud.com>
 <20260727011319.621794-6-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 01:31:04 +0000
Message-Id: <20260727013104.863351F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe failure leaves device interrupts actively enabled on the har=
dware, potentially causing an interrupt storm.
- [High] Multiple hardware configuration functions ignore the return value =
of regmap_read, using uninitialized stack variables to write arbitrary valu=
es to hardware registers.
- [High] The threaded IRQ handler returns IRQ_HANDLED upon failing to read =
the device status, defeating the kernel's spurious interrupt detector and r=
isking a hard interrupt storm.
--

--- Patch [5]: [PATCH v4 05/11] power: supply: max17042_battery: Propagate =
status register errors ---
commit bced78410601fcdc0467a660acdbfd2bb2e4527e
Author: Vincent Cloutier <vincent@cloutier.co>

power: supply: max17042_battery: Propagate status register errors

The driver adds error checking for the initial STATUS read and final POR
clear during initialization. A failed read will now propagate the error
instead of ignoring it, and the POR-clear result is returned directly.

> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supp=
ly/max17042_battery.c
> index 38abd3604643b..9210bdb4d67eb 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -908,8 +908,7 @@ static int max17042_init_chip(struct max17042_chip *c=
hip)
>  	}
> =20
>  	/* Init complete, Clear the POR bit */
> -	regmap_update_bits(map, MAX17042_STATUS, STATUS_POR_BIT, 0x0);
> -	return 0;
> +	return regmap_clear_bits(map, MAX17042_STATUS, STATUS_POR_BIT);
>  }
> =20
>  static void max17042_set_soc_threshold(struct max17042_chip *chip, u16 o=
ff)

[Severity: High]
This is a pre-existing issue, but functions like max17042_set_soc_threshold
and max17042_load_new_capacity_params ignore the return value of regmap_rea=
d.

If the I2C read fails, can this lead to uninitialized stack variables
(soc, vfSoc, full_cap0) being bit-shifted and written directly back
to critical hardware registers?

For example:
drivers/power/supply/max17042_battery.c:max17042_set_soc_threshold() {
    ...
    regmap_read(map, MAX17042_RepSOC, &soc);
    soc_tr =3D (soc + off) << 8;
    ...
}

[ ... ]

> @@ -1248,7 +1247,10 @@ static int max17042_probe(struct i2c_client *clien=
t, struct device *dev, int irq
> =20
>  	chip->irq =3D irq;
> =20
> -	regmap_read(chip->regmap, MAX17042_STATUS, &val);
> +	ret =3D regmap_read(chip->regmap, MAX17042_STATUS, &val);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read status\n");
> +

[Severity: High]
This isn't a bug introduced by this patch, but returning here exposes a mis=
sing
cleanup step.

If this new read fails, we return an error and the devm framework frees
the IRQ handler. However, earlier in max17042_probe, we enable hardware ale=
rts
with regmap_update_bits(chip->regmap, MAX17042_CONFIG, CFG_ALRT_BIT_ENBL, .=
..).

Since there is no devm-managed cleanup or manual unwind for this alert
enablement, and the IRQ is requested with IRQF_SHARED, could this leave the
device actively asserting the interrupt line without a registered handler,
resulting in an interrupt storm?

>  	if (val & STATUS_POR_BIT) {
>  		ret =3D devm_delayed_work_autocancel(dev, &chip->work,
>  						   max17042_init_worker);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
max17042_thread_handler():

drivers/power/supply/max17042_battery.c:max17042_thread_handler() {
    ...
    ret =3D regmap_read(chip->regmap, MAX17042_STATUS, &val);
    if (ret)
        return IRQ_HANDLED;
    ...
}

If regmap_read fails (e.g., due to a transient I2C bus error), the handler
returns IRQ_HANDLED without clearing the interrupt bits on the device.

Since the handler reports success (IRQ_HANDLED) while the physical device
is still asserting the shared interrupt line, does this bypass the kernel's
spurious interrupt detector and risk a hard interrupt storm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727011319.6217=
94-1-vincent.cloutier@icloud.com?part=3D5
