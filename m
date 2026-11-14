Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656430;
	b=AjMNPKvC8GTwgr8GRIpEJtX42gugQSwSxUm/Ir/egkXowwpxyuO6nF/emS0/QE5BE6DI
	 +wZl50kIDNskB+qCLudufKlFGnB19eAyyUCNzIlor9OXPsineO2VjouL/tJRpUtd1J+Ds
	 22OA3Q3j0RVY9mNISf6DdZFAKQFezEwtGtOS+Agmd60NFJ2snkEAC1ZwRLZcH+MWyAxLv
	 JANytW37uS6EsU+n0WHJ6koq7VKGWyjCrln0QBrWkAUXmt919feJX4w3t+XRAAq6R65ud
	 iPX5ULImWCmHnG7t/VGMpbkF7h9WrNsFL85y6utDt5tevDH8gieeMmMuvKu0HjhEF2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UE2EtJv1aRGKi57hWh6uZ03DM5IZsmC2ocSNqQtEoR0=;
	b=nEG0Kqo4M8eSYlixVpEJx5gSHLIi/X4u/WpB+sAMrAvIir6O7xBv8ZYdwMMYqWjK5k2K
	 YXX6rehQhbvC0WCbnZ9QisWV1D8k8EMWYgrYvw4Tz68WjqPQV0Qf8wu4rAEAkh8ZXrPVk
	 GpUPtzKpYALKVFp0NfVNlIJxgIZWaXT1LitBVnXaRvGe37dvpOfTyG6WsCoGvYB39zKLK
	 pFldKE1MRXBvpKkfysYAWrd/oNWtR1grbwIeTTehH4+Gz3ARervc4BFaL6si1lgeo8AC7
	 XH08JPYLdfaSfTPRBCFmcAC0EFiTj4AeFCW4NDqC4QguH80JfuWI55J53xP8ZB2g+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTTWVy4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A5606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTTWVy4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D041F000C4;
	Sat, 14 Nov 2026 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794656430;
	bh=UE2EtJv1aRGKi57hWh6uZ03DM5IZsmC2ocSNqQtEoR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTTWVy4WPPF6jFcj0TO1K1pm/aQ0adPnIdqroTaoIEN8WdxwxqR7+8QL5nFqKsaqj
	 t3KTIswwkXJWQNe9b9FCV3W+CpRa0h7wPL1QudLwO9rrDS1PC4U0Z4pJeSsj3nmqFj
	 NYZ98bLDr/Hxa2MEVH/Ea7Ho6/wPB4cthx7nZhn5BqqPDrWpn7rx217ZX2kxR4VxXu
	 taWPwSQtXMLm3WeS4VFqSFOQkhy21l9LgQtf5SzscjycRberVmRWTQJZBFM4UQFoPU
	 o88aE14NZWEdXZV7AKUCv3wP7rtzl8YaUqTzCJtlhcl0SMVtqb1nL8jU9Uewn1/RiI
	 zSpN5hykhWn6g==
Message-ID: <sashiko-outbox-214415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] power: supply: Add Qualcomm SMB1351 charger
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Nguyen" <thenguyen1024@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114112155.85068-3-thenguyen1024@gmail.com>
References: <20261114112155.85068-1-thenguyen1024@gmail.com>
 <20261114112155.85068-3-thenguyen1024@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:40:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] power: supply: qcom_smb1351: race on retry_until while
  smb1351_work() runs
- [Low] power: supply: qcom_smb1351: unlocked work scheduling in
  smb1351_probe()
--

commit 51205e0d5cfa98bce2fcb03aa43f9fb231439ca3
Author: Adrian Nguyen <thenguyen1024@gmail.com>

power: supply: Add Qualcomm SMB1351 charger driver

This commit adds a power supply driver for the Qualcomm SMB1351/SMB1350
parallel charger that keeps charging disabled over I2C and reports VBUS
presence and charger status.

> diff --git a/drivers/power/supply/qcom_smb1351.c b/drivers/power/supply/q=
com_smb1351.c
> new file mode 100644
> index 0000000000000..33289c767bdb1
> --- /dev/null
> +++ b/drivers/power/supply/qcom_smb1351.c

[ ... ]

> @@ -0,0 +1,439 @@
> +	/*
> +	 * The chip can lose VBUS, and with it its configuration, without the
> +	 * PMIC charger reporting a change. If it has been reset or does not
> +	 * answer, run the work again, unless a run with its own deadline is
> +	 * already pending. Report "Unknown" rather than an error, which would
> +	 * drop the whole uevent.
> +	 */
> +	ret =3D smb1351_read_status(chip, &stat);
> +	if (ret) {
> +		spin_lock(&chip->lock);
> +		if (!delayed_work_pending(&chip->work)) {
> +			WRITE_ONCE(chip->retry_until, jiffies +
> +				   msecs_to_jiffies(SMB1351_RETRY_TIMEOUT_MS));
> +			queue_delayed_work(system_freezable_wq, &chip->work, 0);
> +		}
> +		spin_unlock(&chip->lock);
> +	}

[Severity: Medium]
Can smb1351_get_property() still overwrite chip->retry_until and bypass the
retry backoff while smb1351_work() is running?

The workqueue core clears WORK_STRUCT_PENDING_BIT before calling
smb1351_work(), so delayed_work_pending(&chip->work) returns false while
smb1351_work() is executing I2C transfers:

CPU0 (kworker)                    CPU1
smb1351_work()
  /* pending bit cleared */
  regmap_read(..., &version)
    /* fails when VBUS is lost */
                                  smb1351_get_property()
                                    smb1351_read_status() -> -ENXIO
                                    spin_lock(&chip->lock)
                                    !delayed_work_pending(&chip->work)
                                    chip->retry_until =3D jiffies + 2s
                                    queue_delayed_work(..., 0)
                                    spin_unlock(&chip->lock)
  time_before(jiffies, retry_until)
  queue_delayed_work(..., 200ms)  <-- ignored, already queued with delay 0

When userspace reads status or charge_type while smb1351_work() is running,
smb1351_get_property() extends chip->retry_until by another 2 seconds and
queues chip->work with a 0 ms delay.  smb1351_work() then sees the extended
deadline instead of expiring and setting chip->online to false, and its own
queue_delayed_work() with SMB1351_RETRY_MS becomes a no-op because the work
is already pending, re-running smb1351_work() immediately without the 200 ms
backoff.

In addition, because smb1351_get_property() reads chip->online before
smb1351_read_status() and does not recheck it under chip->lock (and
smb1351_work() updates chip->online outside chip->lock), a status read that
races with the final retry in smb1351_work() setting chip->online to false
will find !delayed_work_pending(&chip->work) after smb1351_work() finishes
and start a new 2-second retry loop.

[ ... ]

> +	/* Leave the chip to the work, it does not answer without VBUS */
> +	WRITE_ONCE(chip->retry_until,
> +		   jiffies + msecs_to_jiffies(SMB1351_RETRY_TIMEOUT_MS));
> +	enable_delayed_work(&chip->work);
> +	mod_delayed_work(system_freezable_wq, &chip->work, 0);
> +
> +	return 0;
> +}

[Severity: Low]
Can smb1351_probe() race with smb1351_external_power_changed() when enabling
and scheduling chip->work without holding chip->lock?

chip->psy is already live after devm_power_supply_register(), so
smb1351_external_power_changed() can run on another CPU while probe finishe=
s:

CPU0                              CPU1
smb1351_probe()
  devm_power_supply_register()
  ...
  chip->retry_until =3D jiffies + 2s
  enable_delayed_work(&chip->work)
                                  smb1351_external_power_changed()
                                    spin_lock(&chip->lock)
                                    chip->retry_until =3D jiffies + 2.3s
                                    mod_delayed_work(..., 300ms)
                                    spin_unlock(&chip->lock)
  mod_delayed_work(..., 0)        <-- overwrites 300ms settle delay with 0

If smb1351_external_power_changed() runs between enable_delayed_work() and
mod_delayed_work(), smb1351_probe() replaces the 300 ms VBUS settle delay
(SMB1351_SETTLE_MS) with 0, running smb1351_work() before VBUS has settled.
If smb1351_external_power_changed() runs just before enable_delayed_work(),
its mod_delayed_work() is dropped while the work is disabled and
smb1351_probe() overwrites the longer retry_until deadline and schedules the
work without the settle delay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114112155.8506=
8-1-thenguyen1024@gmail.com?part=3D2
