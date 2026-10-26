Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037682;
	b=4UnI655sJTAz9fevGSYG/nZacJsAVB6OoAsDgsEaQ1+bmbSPJokk2z2H3eradF91ZUxv
	 1nhoXmBe7qd+IOyuWCSbPo/3WBN396maCJUUVAzXpeuMjhNyFDEzzXzxXf01dbRVdGFfu
	 wcsZcA4NyLxKMPGNoWgP3dL3Yem0gWfLndMLb5f+cxowpp1+MpkvqXbS4PXS141Lcqbtr
	 hNmIF4gtZXpLfHm+nR+wp1TagY3i+PixR1PEgWCARX+F7Y4iUf5H5EXCwJgwpifReLPyt
	 FTYP2ndekt52zTexQMr5Opta+MnMUFpVJWvdyV02TeAtiphKf3zNqhBAvCzZXKaQt6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037682;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TohlbKUJL5j2+/TZgljHWGwBPV7jvLBkm7KTJEvvm9Q=;
	b=khULgK8mrWNnuj8Jpe0gOlgQoZ6XPLNMT5WHViWN0F9svdoSsAjHYM9nL9m1ck7+1iwM
	 bCrCTNKwdhx4a60XiKCF6Bt15Z4FDvYTuoCkAV6G6WA0QG7fz3TgQk4XeAvTxbAUb7RF0
	 eny81X8WRlD0Pkn8z0UauzgvS/ieFqlHVet3IIU128Z4GquKga3TYvu8w25b5dIoHFHrk
	 aOiOELVOZLba8oi8OZHxmFj+PP81nw/HWCoN4GfIR+83077qERRvtmsySH/PGAfwAQOfz
	 6/DvR8USc5tXPO3x8/c6/S1QYzbMoh8b/PJg7eHcua9lHlTbSby+jC+TuF7g7MaKdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTmdoep7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452C606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTmdoep7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA361F01825;
	Mon, 26 Oct 2026 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793037682;
	bh=TohlbKUJL5j2+/TZgljHWGwBPV7jvLBkm7KTJEvvm9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTmdoep7jHM2WMB9ermguIG78FqJ3L8uE9GpGJMM8rgzdUSHwdepQIHB9zjgVQsal
	 2btswcsnNhDK9s6piIkXGSKjzN9sfVaDt8ePb3J1B8wA9s16oFi0T7oUL4ZKCdYxjs
	 BESzLGC0Nj11ds179jodcu3O79BKo4lLDgBvF7IEfRsK21U3RYJBJE93jEXuqhNPhL
	 UU1ZM0LuzH5rMlnbvFQ0D/58ozxNDZmxyPzDBExRJjnwK4Z1EmTPO6jr3/9fXZIhFa
	 aWlOADZGAeRgIvA08mmlNZJFqLuAnvvQ4yNtTzvQyzdd3MVzzAlvyIIa8ATneGhUdE
	 UDI0mlm2WnW3A==
Message-ID: <sashiko-outbox-185605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] power: supply: rk817-charger: Resolve boot state of
 charge from the coulomb counter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026174834.1652309-3-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
 <20261026174834.1652309-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 18:01:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power: supply: rk817-charger: flawed keep_saved check on unplugg=
ed boot
--

commit ca12b28c400d82b7a66e329e1e7db82f71128a48
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: rk817-charger: Resolve boot state of charge from the coulomb=
 counter

This commit resolves the boot state of charge from the coulomb counter on
non-first boots instead of relying on PWRON_VOL when OFF_CNT is three or
more, and adds periodic recalibration against the relaxed open-circuit
voltage pair. It also exposes POWER_SUPPLY_PROP_VOLTAGE_BOOT and
POWER_SUPPLY_PROP_VOLTAGE_OCV.

> diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/=
rk817_charger.c
> index 86da0462fb594..50fbea298127f 100644
> --- a/drivers/power/supply/rk817_charger.c
> +++ b/drivers/power/supply/rk817_charger.c

[ ... ]

> @@ -803,39 +889,54 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_=
charger *charger,
>  		if (ret < 0)
>  			return ret;
> =20
> +		/*
> +		 * The coulomb counter keeps counting while the system is off,
> +		 * so take it, capped at full, unless it reads invalid; the
> +		 * saved soc is then at most one update interval old. A counter
> +		 * that is merely wrong is corrected by the next rested relax
> +		 * pair.
> +		 */
>  		regmap_bulk_read(rk808->regmap, RK817_GAS_GAUGE_Q_PRES_H3,
>  				 bulk_reg, 4);
>  		tmp =3D get_unaligned_be32(bulk_reg);

[ ... ]

> +		regmap_read(rk808->regmap, RK817_GAS_GAUGE_OFF_CNT, &off_cnt);
> +		bat_uv =3D rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_BAT_VOL_H);
> +		dev_dbg(charger->dev,
> +			"boot: counter %d uAh, saved soc %d, fcc %d mAh, battery %d uV, off_c=
nt %d\n",
> +			tmp > 0 ? ADC_TO_CHARGE_UAH(tmp, charger->res_div) : 0,
> +			charger->soc, charger->fcc_mah, bat_uv, off_cnt);
> +		if (tmp > 0) {
> +			boot_charge_mah =3D ADC_TO_CHARGE_UAH(tmp,
> +							    charger->res_div) / 1000;
> +			if (boot_charge_mah > charger->fcc_mah)
> +				boot_charge_mah =3D charger->fcc_mah;
> +			boot_soc =3D boot_charge_mah * 100000 / charger->fcc_mah;
> +
> +			/*
> +			 * The gauge re-derives this count from its own ocv
> +			 * model while the pack rests, so bound it with the ocv
> +			 * table: under load the terminal voltage sits below the
> +			 * open circuit voltage, making the table a floor, and
> +			 * under charge above it, making it a ceiling on any
> +			 * saved soc that would displace the counter.
> +			 */
> +			table_soc =3D power_supply_batinfo_ocv2cap(bat_info, bat_uv,
> +								 20) * 1000;
> +			if (charger->plugged_in)
> +				keep_saved =3D boot_soc < charger->soc - 10000 &&
> +					     charger->soc <=3D table_soc + 10000;
> +			else
> +				keep_saved =3D boot_soc < table_soc - 10000;
> +
> +			if (keep_saved)
> +				dev_dbg(charger->dev,
> +					"counter %d, voltage allows %d, keeping saved soc %d\n",
> +					boot_soc, table_soc, charger->soc);
> +			else
> +				charger->soc =3D boot_soc;

[Severity: Medium]
In rk817_read_or_set_full_charge_on_boot() in
drivers/power/supply/rk817_charger.c, when !charger->plugged_in, keep_saved
is set to:

	keep_saved =3D boot_soc < table_soc - 10000;

without comparing charger->soc (from NVRAM) against either boot_soc or
table_soc.

Immediately after this branch, rk817_read_or_set_full_charge_on_boot() writ=
es
charger->soc back into the hardware coulomb counter:

	boot_charge_mah =3D charger->soc * charger->fcc_mah / 100 / 1000;
	if (boot_charge_mah > charger->fcc_mah)
		boot_charge_mah =3D charger->fcc_mah;
	tmp =3D CHARGE_TO_ADC(boot_charge_mah, charger->res_div);
	put_unaligned_be32(tmp, bulk_reg);
	ret =3D regmap_bulk_write(rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
			  bulk_reg, 4);

If a device is powered off at a low state of charge (for example,
charger->soc =3D 15000), charged while powered off, and then unplugged befo=
re
booting (!charger->plugged_in), and the gauge's internal OCV model re-deriv=
es
boot_soc to more than 10% below table_soc (say, table_soc =3D 80000 and
boot_soc =3D 65000), keep_saved evaluates to true. That discards boot_soc a=
nd
reinitializes RK817_GAS_GAUGE_Q_INIT_H3 with the stale pre-charge NVRAM
charger->soc (15000), which is even further below the table_soc floor.

Conversely, if the device is powered off at a high state of charge (for
example, charger->soc =3D 95000) and discharges while off to table_soc =3D =
50000
with boot_soc =3D 38000, keep_saved also evaluates to true and overwrites
RK817_GAS_GAUGE_Q_INIT_H3 with the stale 95000 value.

In addition, both the commit message ("Keep the PWRON_VOL lookup for the
first boot. Otherwise take the counter, capped at full, unless it reads zero
or negative, in which case keep the saved soc...") and the comment above th=
is
block say that a positive coulomb counter is adopted on boot and corrected
later by the next rested relax voltage pair.

Should the !charger->plugged_in case also verify that charger->soc is a
better estimate than boot_soc before keeping the saved value, or should
rk817_read_or_set_full_charge_on_boot() unconditionally use boot_soc when
tmp > 0 as described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026174834.1652=
309-1-macroalpha82@gmail.com?part=3D2
