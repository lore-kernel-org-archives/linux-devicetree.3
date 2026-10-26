Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038027;
	b=e/MbdWv8n6gGuDEZVoqBggIisg7JzWnjZhZazMcp8/5lJjVdinbz/2uhrkB0X42hDe4D
	 F4tYEM8PJI6Aon+N/9J+Bz/BYkiYXvxmP1cmW64VVmE4znAvQM+DfDmn4Azot4kUVT86p
	 7h6t/U2Aw06K1ay7act7+QDYdqLytDzKW0dcjSrKx1V75OXfqCSUY4x+quOCXWcihZAGL
	 9tb0hG46a/0nbqarW4lJaqOKoW+oAjW5yHtKuGh58BGUi4gvJ03MGGEVa1w+vkW3qDZ6x
	 oEbecW8gfvU1Aho4Hij9vBdUpZnaRvAvM7JX14bmdN3PBd2BtY5tV4/JxzBHSMh1zVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038027;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2OVpNBFqCDz13rfCVj9HIRKW913UwTa1weD/J8uthNM=;
	b=JT3Sxn3cM4GIsZIDRXBhHrcTx5xKNq/uYGye6FLiBq9uc1VACpksGDfBnjKBI2p0jIYC
	 +jx+VLjFu9XB8T7Thnw5Lz24xd4CF8X2GPMQrjipvoQhCdXXX/3rntQayKOEhrM6LUW4h
	 atS9BZgVbva3ZDw16qIG/zc6Vy7j/W2osixIoTvCiUSmSuzX3kkhe0UzF0vjhH8EdbjY5
	 OV2JYSEDp2JFJPiYXIxVmlRka8rcEwviZYZd84rbvvxytf6t/7MP7XkxQ0AjUi6ORtJEe
	 dquLNAO3FQL9XQ84xl/ZNYAcB5bcl06JYE6ZByXOx81CjQJn2TRo/9JqgTWcWn8eBGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaYkNVxs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E0606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaYkNVxs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9211F01828;
	Mon, 26 Oct 2026 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038026;
	bh=2OVpNBFqCDz13rfCVj9HIRKW913UwTa1weD/J8uthNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BaYkNVxs0ejxJ/N7XM8YfnuVdkJS1Wa2WjFHEzLlMRm+w5sR1BZ/P+ye1W4ID8Dxw
	 VXpMIV209M8eNYNrsFl0aJVbI56u2/CN69yKQt7/PK461jm6DUZp02cvECfLuzdATi
	 5VuX/vGuyrTlSeAzK5OJyavtD7DicoX6dxdukU0LZlhh0eBhcgZNlaVDp792nyvr6q
	 od40SSTHwCF+XQ8OgRJyPb2wUjFnVGFQtf33c/7V5HtONTHMINXC6vTbIMvtfVzECw
	 hFDCDQnvU2r+Vy1tAFDyyhobh9ojXwF7I3HOxjgIxhEpl/dxOWJPfYRy0/iYzfhMh7
	 tGFNGXN/HLCxQ==
Message-ID: <sashiko-outbox-185607@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] power: supply: rk817-charger: Correct the gauge
 across system sleep
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026174834.1652309-4-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
 <20261026174834.1652309-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 18:07:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] power: supply: rk817-charger: rk817_suspend() treats discharge c=
urrent as charge
- [Medium] power: supply: rk817-charger: uncalibrated hardware counter in r=
k817_bat_sleep_adjust()
- [Medium] power: supply: rk817-charger: stale charge_now_uah stamped into =
slp_charge_uah
--

commit 90ab344fb97258fd37a11933de3725ce00041ea5
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: rk817-charger: Correct the gauge across system sleep

This commit adjusts the RK817 gas gauge across system sleep by stamping
boottime, charge, current, and charging status at suspend, and then
recalibrating on resume from either a latched relax voltage or an
estimated constant-current charge delta.

> diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/=
rk817_charger.c
> index 50fbea298127f..b6714d8e4fed9 100644
> --- a/drivers/power/supply/rk817_charger.c
> +++ b/drivers/power/supply/rk817_charger.c

[ ... ]

> @@ -1323,12 +1336,96 @@ static int rk817_charger_probe(struct platform_de=
vice *pdev)
>  	return 0;
>  }
> =20
> +/*
> + * The coulomb counter is erratic while the system sleeps, and the signa=
ls
> + * that could correct it (a live relax status, a finished charge) are go=
ne
> + * before the monitor runs again. Correct from what persists instead, as
> + * the BSP driver does.
> + */
> +static void rk817_bat_sleep_adjust(struct rk817_charger *charger)
> +{
> +	struct rk808 *rk808 =3D charger->rk808;
> +	time64_t elapsed =3D ktime_get_boottime_seconds() - charger->slp_bootti=
me;
> +	int expected_uah, moved_uah, charge_uah, credit_uah, tmp;
> +	unsigned int sts;
> +	u8 bulk_reg[4];
> +
> +	if (!charger->battery_present || elapsed <=3D 0)
> +		return;
> +
> +	regmap_read(rk808->regmap, RK817_SYS_STS, &sts);
> +	charger->plugged_in =3D (sts & RK817_PLUG_IN_STS);
> +
> +	/* Start from what the counter did during sleep, not the pre-sleep soc.=
 */
> +	regmap_bulk_read(rk808->regmap, RK817_GAS_GAUGE_Q_PRES_H3,
> +			 bulk_reg, 4);
> +	tmp =3D get_unaligned_be32(bulk_reg);
> +	charge_uah =3D tmp > 0 ? ADC_TO_CHARGE_UAH(tmp, charger->res_div) : 0;
> +	if (charge_uah > charger->fcc_mah * 1000)
> +		charge_uah =3D charger->fcc_mah * 1000;
> +	charger->soc =3D div_s64((s64)charge_uah * 100, charger->fcc_mah);
> +
> +	/* Flags were cleared at suspend: any pair now is from this sleep. */
> +	charger->relax_voltage_uv =3D rk817_bat_relax_voltage_uv(charger, false=
);
> +	dev_dbg(charger->dev,
> +		"resume after %llds: counter %d uAh (%d at suspend), battery %d uV, re=
lax %d uV\n",
> +		elapsed, charge_uah, charger->slp_charge_uah,
> +		rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_BAT_VOL_H),
> +		charger->relax_voltage_uv);
> +	if (charger->relax_voltage_uv) {
> +		rk817_bat_ocv_recalibrate(charger);
> +		return;
> +	}
> +
> +	if (!charger->slp_charging || !charger->plugged_in)
> +		return;
> +
> +	moved_uah =3D charge_uah - charger->slp_charge_uah;
> +	expected_uah =3D div_s64((s64)charger->slp_cur_ua * elapsed, 3600);
> +	credit_uah =3D expected_uah - moved_uah;
> +
> +	dev_info(charger->dev,
> +		 "slept charging for %llds: counter moved %d of expected %d uAh\n",
> +		 (long long)elapsed, moved_uah, expected_uah);
> +
> +	if (credit_uah <=3D 0)
> +		return;

[Severity: Medium]
What happens to the hardware coulomb counter (RK817_GAS_GAUGE_Q_PRES_H3) wh=
en
it overshoots charger->fcc_mah * 1000 or underflows below 0 during sleep?

In rk817_bat_sleep_adjust(), charge_uah and charger->soc are clamped in
software to [0, charger->fcc_mah * 1000] without writing the clamped value
back to RK817_GAS_GAUGE_Q_INIT_H3.

If a relax voltage was latched during sleep (for example, after finishing
charge and resting at 95%-100% OCV, or resting at 0%-5% OCV after counter
underflow), rk817_bat_sleep_adjust() calls rk817_bat_ocv_recalibrate():

drivers/power/supply/rk817_charger.c:rk817_bat_ocv_recalibrate() {
    ...
	ocv_soc =3D power_supply_batinfo_ocv2cap(charger->bat_info,
					       charger->relax_voltage_uv,
					       20) * 1000;
	if (ocv_soc < 0 || abs(ocv_soc - charger->soc) <=3D 5000)
		return;
    ...
}

Because charger->soc was already clamped to 100000 (or 0),
abs(ocv_soc - charger->soc) <=3D 5000 holds and rk817_bat_ocv_recalibrate()
returns without updating RK817_GAS_GAUGE_Q_INIT_H3.

Similarly, if no relax voltage was latched, rk817_bat_sleep_adjust() returns
without writing RK817_GAS_GAUGE_Q_INIT_H3 whenever !charger->slp_charging,
!charger->plugged_in, or credit_uah <=3D 0 (which happens whenever the coun=
ter
over-counted during sleep), and moved_uah =3D charge_uah - charger->slp_cha=
rge_uah
is computed from the clamped charge_uah rather than the actual counter delt=
a.

Since rk817_bat_calib_cap() only caps RK817_GAS_GAUGE_Q_PRES_H3 when
charge_status =3D=3D CHARGE_FINISH && charger->soc_cal, won't the hardware
accumulator retain the phantom excess above full capacity (or deficit below=
 0)
and keep the reported SoC pinned after resume?

> +
> +	/*
> +	 * Credit the shortfall, saturating at full - covers a charge that
> +	 * terminated during sleep. A constant-current estimate reads high
> +	 * across a taper; the cap bounds it, the next rested pair corrects
> +	 * the rest.
> +	 */
> +	charge_uah +=3D credit_uah;
> +	if (charge_uah > charger->fcc_mah * 1000)
> +		charge_uah =3D charger->fcc_mah * 1000;
> +
> +	charger->soc =3D div_s64((s64)charge_uah * 100, charger->fcc_mah);
> +	tmp =3D CHARGE_TO_ADC(charge_uah / 1000, charger->res_div);
> +	put_unaligned_be32(tmp, bulk_reg);
> +	regmap_bulk_write(rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
> +			  bulk_reg, 4);
> +	rk817_record_battery_nvram_values(charger);
> +}
> +
>  static int __maybe_unused rk817_suspend(struct device *dev)
>  {
>  	struct rk817_charger *charger =3D dev_get_drvdata(dev);
> =20
>  	cancel_delayed_work_sync(&charger->work);
> =20
> +	charger->slp_boottime =3D ktime_get_boottime_seconds();
> +	charger->slp_charge_uah =3D charger->charge_now_uah;

[Severity: Medium]
Can charger->slp_charge_uah be stamped with a stale charger->charge_now_uah
value here?

In rk817_charging_monitor(), rk817_read_props() populates
charger->charge_now_uah from RK817_GAS_GAUGE_Q_PRES_H3 before
rk817_bat_calib_cap() and rk817_bat_ocv_recalibrate() run. When either of
those functions rewrites RK817_GAS_GAUGE_Q_INIT_H3, charger->charge_now_uah=
 is
not updated until the next 8-second monitor cycle.

Likewise, in rk817_resume(), rk817_bat_sleep_adjust() reads
RK817_GAS_GAUGE_Q_PRES_H3 into a local charge_uah variable and either calls
rk817_bat_ocv_recalibrate() or writes the credited charge to
RK817_GAS_GAUGE_Q_INIT_H3 without updating charger->charge_now_uah.

If the system suspends during the 8-second window after a recalibration, or
after rk817_resume() before the queued charger->work executes (which
cancel_delayed_work_sync(&charger->work) then cancels), wouldn't
rk817_suspend() stamp the stale charger->charge_now_uah into
charger->slp_charge_uah and skew moved_uah and credit_uah on the next resum=
e?

> +	charger->slp_cur_ua =3D abs(charger->cur_avg_ua);
> +	charger->slp_charging =3D charger->plugged_in &&
> +				(charger->charge_status =3D=3D CC_OR_CV_CHRG ||
> +				 charger->charge_status =3D=3D TRICKLE_CHRG);

[Severity: Medium]
Could taking abs(charger->cur_avg_ua) in rk817_suspend() cause
rk817_bat_sleep_adjust() to credit discharge current as charge?

In rk817_read_props(), charger->cur_avg_ua is a signed value where negative
readings indicate net battery discharge, which rk817_bat_get_prop() checks
before inspecting charger->charge_status:

drivers/power/supply/rk817_charger.c:rk817_bat_get_prop() {
    ...
	case POWER_SUPPLY_PROP_STATUS:
		if (charger->cur_avg_ua < 0) {
			val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
			break;
		}
    ...
}

If the system suspends while plugged in with charge_status =3D=3D CC_OR_CV_=
CHRG or
TRICKLE_CHRG while charger->cur_avg_ua < 0 (for instance, when pre-suspend
system load exceeds the input current limit, or right after plug-in before =
the
average current register slews positive), rk817_suspend() sets
charger->slp_charging =3D true and turns the negative current into a positi=
ve
charger->slp_cur_ua. On resume, wouldn't rk817_bat_sleep_adjust() then comp=
ute
a positive expected_uah from that discharge rate and credit phantom charge =
to
charger->soc, RK817_GAS_GAUGE_Q_INIT_H3, and NVRAM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026174834.1652=
309-1-macroalpha82@gmail.com?part=3D3
