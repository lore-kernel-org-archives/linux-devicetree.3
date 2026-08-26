Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B836F8E9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767429; cv=none; b=aYAVqh2KAVE6Df2z+L4qvRraORz/dbWhKlpTkytYu4X6ao4GMRekeEInTXVOBW3d+qVpjks5AXkhQvOaAXSZvSsI7+7VtDWAA27N/K8TcbYAyfR0grP0ZiqtPa6rtxhi/lTDVhzB3G469h5whO8G9YvsFBSKP+pJGa8DgcH9/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767429; c=relaxed/simple;
	bh=hmzY2QkUr+iFI7KP39ouEUoFEOATdAsVMxwGLgr9ncM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iFmxA93tu1Wd+MdjQe6hkSloNCyPXY0rx/q85/rkcR3Wtm6bm9OZMxD26w7OToycjTvGSWfI/+WGXQzZlk7LYTtTZsUmy1Cg+69583a5mH6iK4eTm2EGfQOhZOyN7uJG8yhbjoLzELx7h73OohWr0eV3aZWuOoAlyY+c5QD/LjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O08bbIw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O08bbIw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738421F000E9;
	Wed, 26 Aug 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767417;
	bh=g96M6bPkEwl8FOdsvP3tbRc6/8JFrRf1gJYA5syRpwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O08bbIw3G9K7LBe8I3dXGtxnyYheDBUwRlN+MpY9+dOetomB6dm6wJjvRR/gSSsxo
	 pAA1fVetI5HOhYjOCGUC79X8RKsq9LTb4es8Qhw33Z1nkrbon1OuCKnBMDeXeB9Bn2
	 jJf4ahDHA+D5ufeBwgp92q35gf5mMemSTzjMY2PVO1UL7wuT7UkZN9kV+TsGg0+xYk
	 wzOF5BlFkDhNrzt5bcGRFnEVdPE+sfgfzqp64nxo6Rt8H2zbVPgPHRR1H4AamPpncs
	 VwLv6cXuXnNgKXOOy145W04R104zzo1cp6Yp59dKdCxOkbDqLdogke3gsp4Fz/cFYI
	 uINVfQQSOK6iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] iio: light: stk3310: add per-chip match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826175409.326131-5-jorijnvdgraaf@catcrafts.net>
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-5-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 18:03:37 +0000
Message-Id: <20260826180337.738421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] stk3310_write_event() modifies hardware registers and shared cache=
d state without holding the driver lock, leading to state desynchronization.
--

commit 1a4ec350350bbed28440d2daf132d19b8c5712c9
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

    iio: light: stk3310: add per-chip match data
   =20
    Introduce a chip_info structure carrying the device name and channel
    specification, attach it to every i2c, OF and ACPI table entry, and
    let probe take it from the match data, failing when there is none.

> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index 156888969366c..d632e6447f065 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c

[Severity: High]
This is a pre-existing issue, but does stk3310_write_event() need to hold
data->lock to prevent concurrent access?

Looking at stk3310_write_event(), it modifies hardware registers and shared
cached state without holding the driver lock:

	ret =3D regmap_bulk_write(data->regmap, reg, &buf, sizeof(buf));
	if (ret < 0) {
		dev_err(&client->dev, "failed to set PS threshold!\n");
		return ret;
	}

	if (reg =3D=3D STK3310_REG_THDH_PS)
		data->ps_thdh =3D val;
	else
		data->ps_thdl =3D val;

This allows a race between concurrent writers to cause a state
desynchronization between the hardware registers and the driver's cached
threshold values (data->ps_thdh and data->ps_thdl).

On system resume, the driver restores these incorrect cached thresholds to =
the
hardware, resulting in incorrect proximity event behavior.

Additionally, this function reads state that could concurrently be modified=
 by
stk3310_write_raw() without a lock:

	ret =3D regmap_field_read(data->reg_ps_gain, &index);

This causes a TOCTOU race on threshold bounds checking.

Could we add a mutex_lock() to stk3310_write_event() to synchronize with
stk3310_write_raw() and prevent state desynchronization?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826175409.3261=
31-1-jorijnvdgraaf@catcrafts.net?part=3D4
