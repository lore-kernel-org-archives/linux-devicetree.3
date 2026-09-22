Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC647A877
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107922; cv=none; b=f6h6QJozEb2HbOjBH2JE+AACJ/vDGG4K+MkpwwTsUpgf0nLjKrjIljfjO8ex4I9YnU6OQPLTO4hanpJFaqgCv4r/rglaxQjUUSd2BmuID8a6FIMqNa8b7rOSwCPu7WtfukNxBTxeLEmfHKTpfpo6lK1umYhQKOZhfarJvF2aAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107922; c=relaxed/simple;
	bh=aqAO44oVJZWkbQ5H4F6tKoONla0jOhHwSy6Wee3w5BQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l7ref5dOIOY3PwAJkYJMW0Nayy8ZD8cHLJtDcOzwy9slqmISxxcrUALhl+aseV9R34LvR6YGja2+kVB7OVhCI2bNzNfWw5mHBUG3wS1a9SHkxY6ztpQkqn2NeBnIpXF07eoNFNyji9wXZhiB5AGbE26D0/DoCqC9IwvGMzOEMOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKkc6LRI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKkc6LRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142541F00898;
	Tue, 22 Sep 2026 20:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107905;
	bh=ofCOxYNe4Pjhxh6pKt05VYjUepgAxPKSJsJGu3LsunQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKkc6LRIaZz0XpIjkctEaYkAL4a9IuiZ/q/DN+Qj/pi2i/cUKctJCtP65Qttg4qKt
	 scdhqWfbZKa2GonC7RTcCexXF/NcR7BGV+23FY7BNG6XlvZ/kRn5fcZHot9mqYNAO7
	 OTzkl9BW2DWUGljYrrM/IVgYhlQkKARQpKlLrrqx7qDysPGt3/s9dxX4JxVsPt2vEO
	 HBUbNqekr2+9ta7YqJm6zJBxF/PfGujye5K4EwTaZMpeaknTefJ5mBlfCzzkxNVHr/
	 1oYu6DaZfvwBU3206VxornEEU6/uYO5bdUBR7p/s/w6UoHSG9LfHESzaDGm5ngk+Vl
	 eW/AksJBjA84g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/14] dpll: sit9531x: add support to get and set
 frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-9-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-9-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:44 +0000
Message-Id: <20260922201145.142541F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dpll: sit9531x: unconditional NVM commit on I2C write failure corr=
upts hardware state
--

commit 6cf2285c5820470a1c24c7b915f31d2eb06496d4
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set frequency on pins

This commit introduces frequency getting and setting for the sit9531x
DPLL driver. It handles both input frequency reporting from firmware
and output frequency configuration by writing new dividers to the chip.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,
> +			     u8 pll_idx, u64 frequency)
> +{
> +	u64 fvco, divo;
> +	int rc, ret;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	rc =3D sit9531x_output_divo_calc(sitdev, out_idx, pll_idx, frequency,
> +				       &fvco, &divo);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D sit9531x_prg_enter(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D sit9531x_output_divo_write(sitdev, out_idx, divo);
> +	/*
> +	 * Step 4: NVM update + loop lock.  Always run prg_commit() so the chip
> +	 * leaves the PRG_CMD state with the output loops re-locked, even when a
> +	 * write above failed; keep the first error to return.  It also carries
> +	 * the required post-lock settling sleep.
> +	 */
> +	ret =3D sit9531x_prg_commit(sitdev);

[Severity: High]
Will this persist corrupted values to non-volatile memory if an I2C bus err=
or
occurs during the divider write?

If a multi-byte I2C write for the output divider fails in
sit9531x_output_divo_write() or its rollback sequence, the error path
unconditionally calls sit9531x_prg_commit() to re-lock the loops.

However, looking at sit9531x_prg_commit(), it unconditionally issues the
SIT9531X_UPDATE_NVM command:

static int sit9531x_prg_commit(struct sit9531x_dev *sitdev)
{
        int rc, rc2 =3D 0, rc3;
        u8 attempt;

        rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
                               SIT9531X_UPDATE_NVM);
        ...
}

This persists the partially-written divider values into NVM, which
could permanently break the device's default boot configuration. Should this
path call sit9531x_prg_abort() instead when sit9531x_output_divo_write()
returns an error, so the loops can be safely re-locked without issuing an
NVM update?

> +	if (ret && !rc)
> +		rc =3D ret;
> +	if (rc)
> +		return rc;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D8
