Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644A289367
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115694; cv=none; b=iBjbI75eu9Z+gGwtD83v/l5IlfkPFEklKC88sp2/4zF12CCyzCbyYElX6JAnuLcJwMom28hEQv+f2IkrUXyRge7NhsCgyuP3BcagjpK3yqY/oeGoha6CIgnBMPT9kR3hgL+wJqKuOqKvTyzBNlNZl4hRaByuto0cgZQPYGKjrEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115694; c=relaxed/simple;
	bh=OrEo/WjgRyhXffJPPGm0Q9uaaZtazn3MkL9TUAOgoew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ibpo+3cgpJNKI8wqVhM4HMr0E0BN3A4LvH3C5KBhXS1ozfhnSctI8wWbrsUwDM8Jo6zwasjcf3i9yzadFjeXlqcX8gK68RvUKl0EHn9+xH7rVBmO/hv1IMXn9ko9UPBg1rooQaiq6hsX70/fR9HtwJRtQsGkOlX4n1kc3evnLS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKFHgL/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKFHgL/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97791F00A3D;
	Mon, 27 Jul 2026 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785115693;
	bh=7n6CxUlA04zNRrKbut9hUcpO5KgrW0IMs2Q88wSQFdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKFHgL/W+hYIfUS9NEcI/4X7xs+u1xAU94/ANJz0DzpknJUz6W8BoiZlixpQHC0jn
	 63r96Uj3OVXP18NHMZmOqCUWHfMn1za8kdEEI1k4ysb7+yK4vm8PXnQ+XXKCH0xcaC
	 4dJ57lyOXnHnOFOTTLPUj5/NVInjTbPzBfh3S95eJYm1TF0tsclTn3H4xzvPB5Y4Xy
	 l2bCBJ2fiAK598Lqlcl0TVKv0t9ZRu3Og3t3eITbDSd3lF10LktC2gGNL7EDiMcnYY
	 kskNghPY/qHdFpsS/tv6dhkUXnK5FYjKli2q7U7O4e0lD+/5O8J/cbzhqhugdogtAc
	 AUSzpZ6BjZi4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/11] power: supply: max17042_battery: Program
 MAX17055 EZ Config values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727011319.621794-8-vincent.cloutier@icloud.com>
References: <20260727011319.621794-1-vincent.cloutier@icloud.com>
 <20260727011319.621794-8-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 01:28:12 +0000
Message-Id: <20260727012812.B97791F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Returning -ERANGE for deterministic configuration errors causes =
the init worker to retry infinitely, wasting system resources.
- [Medium] Missing dPAcc re-derivation when only ModelCfg is configured, le=
ading to incoherent accumulator state.
--

--- Patch [7]: [PATCH v4 07/11] power: supply: max17042_battery: Program MA=
X17055 EZ Config values ---
commit bd3ee7ab717292e5ba55e9546c583b92b58089e3
Author: Vincent Cloutier <vincent@cloutier.co>

    power: supply: max17042_battery: Program MAX17055 EZ Config values
   =20
    MAX17055 EZ Config requires DesignCap, dQAcc, IChgTerm, and dPAcc to
    be programmed coherently. Write each supplied stable register once, wait
    1 ms, and verify its read-back instead of relying on the unchecked gene=
ric
    POR override path.

> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supp=
ly/max17042_battery.c
> index 27d881d4324f0..600b2689f3160 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
[ ... ]
> @@ -849,10 +875,75 @@ static inline void max17042_override_por_values(str=
uct max17042_chip *chip)
>  		max17042_override_por(map, MAX17055_ModelCfg, config->model_cfg);
>  }
> =20
> +static int max17055_override_battery_values(struct max17042_chip *chip)
> +{
> +	struct max17042_config_data *config =3D chip->config_data;
> +	struct regmap *map =3D chip->regmap;
> +	unsigned int design_cap;
> +	unsigned int model_cfg;
> +	unsigned int dqacc;
> +	u64 dpacc;
> +	int ret;
[ ... ]
> +	if (!config->design_cap && !config->dqacc)
> +		return 0;

[Severity: Medium]
If config->model_cfg is provided but config->design_cap and config->dqacc a=
re 0,
does this early return bypass dPAcc derivation?

Since max17042_override_por_values() updates MAX17055_ModelCfg, if the new
model_cfg alters the VCHG bit, the accumulator's factor changes and strictly
requires dPAcc to be re-derived. By exiting early, the driver leaves dPAcc =
at
its POR default, which may not match the newly selected charge-voltage rang=
e.

> +
> +	ret =3D regmap_read(map, MAX17042_DesignCap, &design_cap);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(map, MAX17042_dQacc, &dqacc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(map, MAX17055_ModelCfg, &model_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (!design_cap || !dqacc)
> +		return -ERANGE;

[Severity: Medium]
Will returning -ERANGE here cause max17042_init_worker() to retry infinitel=
y?

If the POR default registers evaluate to 0 or if the dpacc calculation exce=
eds
U16_MAX, this returns a deterministic -ERANGE error. This propagates back to
max17042_init_worker(), which catches the error and continuously reschedules
itself every 10 seconds, constantly waking up the CPU and spamming the log:

drivers/power/supply/max17042_battery.c:max17042_init_worker() {
    ...
    if (chip->enable_por_init && chip->config_data)
        ret =3D max17042_init_chip(chip);

    if (ret) {
        if (chip->chip_type =3D=3D MAXIM_DEVICE_TYPE_MAX17055) {
            dev_warn_ratelimited(chip->dev,
                "initialization failed: %d, retrying\n", ret);
            schedule_delayed_work(&chip->work,
                msecs_to_jiffies(MAX17055_INIT_RETRY_DELAY_MS));
        }
    ...
}

> +
> +	dpacc =3D (u64)dqacc *
> +		(model_cfg & MAX17055_MODELCFG_VCHG_BIT ?
> +		 MAX17055_DPACC_VCHG_FACTOR : MAX17055_DPACC_FACTOR);
> +	do_div(dpacc, design_cap);
> +	if (dpacc > U16_MAX)
> +		return -ERANGE;
> +
> +	return max17055_write_verify_reg(map, MAX17042_dPacc, (u16)dpacc);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727011319.6217=
94-1-vincent.cloutier@icloud.com?part=3D7
