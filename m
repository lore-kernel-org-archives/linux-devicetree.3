Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB2499F0E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320699; cv=none; b=fqq6QknKb2+prGsyrH011aM9KcknusTKTDBt1WmBwwULBC17ZmkFK3BJb6gCx3/vfbt7TVf86LRTT4PBrMrdMaSbW3ts/oVQP+GyzFqjHFZKfxPHpLsaiP5xjCWDz/DFZrSZ5YsNLPZd3tWFh+kHCv1dxyYbS7UEFZZqJrJ2m3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320699; c=relaxed/simple;
	bh=3U8J7HMMLE1EZZfZ4k0UixVcadC/oYhD2fVsc+CE9CI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WRBgK0ympCEN3buEoREu9Todx7dObk4Nhiib2qm2M18LNw20yjZ8797dqLk2HiZ5ej8jwh8jliUZ8EYl8tMRe5N2P5RAcnPwzfadKtR7GInmnZZzaJd46RqLH4rKx5gdgUnJupMINDOFYNnyLJKRxVHGr6m6gMrUjnC93sThilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWan1o/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWan1o/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A591F000E9;
	Fri, 21 Aug 2026 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787320697;
	bh=8RwJtKUzfWDycsUBvjF7PlDEQQb3jNLsT4BHRbuUlUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWan1o/gtOYGkfHeWdmWSJqB6HtCFJ+MDpxUJNuAUYzizRtehi4pppiw7mWgjnN/U
	 O9BIftFaj3DFko1XuokwJvq5p+eMW8mqg1+2zr91wAqJuOiKWAWo3GqOZaqrGlby4w
	 J1D2cSoRC3QG4IvDuOw+9BeiBpOIkk2DDrQ7a5RY9tuwC1PyQQ4NE3cCCd5bzNdOPK
	 1NX6x+wWpKc8NjBaqVJhhgAqw2unnq15PpSrKD6Ex6zO8avdI07Rxqtp1JOzNh2LXU
	 9JIYcWwFPNWSv4SZRKJtITfBdTWnvIB9tXvq+aG1+6MS4AgCMa5oNsY+0WoFY3+1na
	 iTTIJ6xfT1seA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/18] spi: cadence-quadspi: reprogram PHY DLL on
 runtime resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20260821114822.4040338-15-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-15-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:58:17 +0000
Message-Id: <20260821135817.84A591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing fallback to non-PHY mode when DLL resync fails during resu=
me, breaking subsequent SPI transfers and causing silent data corruption.
--

--- Patch [14]: [PATCH v8 14/18] spi: cadence-quadspi: reprogram PHY DLL on=
 runtime resume ---
commit d9e9d29f6693cbe5e675d990e2acc004b9dd86eb
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: reprogram PHY DLL on runtime resume

This commit reprograms the PHY DLL and relocks it during runtime resume
for all calibrated chip selects. It treats a DLL resync failure as a
non-fatal warning so the system can theoretically degrade to non-PHY speed
without blocking the resume path.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index d4181b501d8df..c78d4ce1c930a 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -4030,6 +4030,23 @@ static int cqspi_runtime_resume(struct device *dev)
> =20
>  	cqspi->current_cs =3D -1;
>  	cqspi->sclk =3D 0;
> +
> +	for (cs =3D 0; cs < CQSPI_MAX_CHIPSELECT; cs++) {
> +		struct cqspi_flash_pdata *f_pdata =3D &cqspi->f_pdata[cs];
> +
> +		if (!f_pdata->use_tuned_phy)
> +			continue;
> +
> +		cqspi_phy_set_dll_master(cqspi);
> +
> +		cqspi_set_dll(cqspi->iobase, f_pdata->phy_setting.rx,
> +			      f_pdata->phy_setting.tx);
> +		ret =3D cqspi_resync_dll(cqspi);
> +		if (ret)
> +			dev_warn(dev, "cs%d: PHY DLL resync failed on resume: %d\n",
> +				 cs, ret);
[Severity: High]
If cqspi_resync_dll() fails, should this also set f_pdata->use_tuned_phy
to false?

The commit message mentions that on failure the system degrades to non-PHY
speed, but without explicitly disabling use_tuned_phy, subsequent transfers
will still attempt to use the PHY.

Because cqspi_set_dll() updates the CQSPI_REG_PHY_CONFIG register, the
global hardware state now matches f_pdata->phy_setting. During the next
transfer, cqspi_tune_phy() will see that the hardware registers match the
desired values and bypass its own cqspi_resync_dll() call:

drivers/spi/spi-cadence-quadspi.c:cqspi_tune_phy() {
    ...
	reg =3D readl(reg_base + CQSPI_REG_PHY_CONFIG);
	if (((reg >> CQSPI_REG_PHY_CONFIG_RX_DEL_LSB) &
	     CQSPI_REG_PHY_CONFIG_RX_DEL_MASK) !=3D f_pdata->phy_setting.rx ||
	    ((reg >> CQSPI_REG_PHY_CONFIG_TX_DEL_LSB) &
	     CQSPI_REG_PHY_CONFIG_TX_DEL_MASK) !=3D f_pdata->phy_setting.tx) {
		cqspi_set_dll(reg_base, f_pdata->phy_setting.rx,
			      f_pdata->phy_setting.tx);
		ret =3D cqspi_resync_dll(cqspi);
		if (ret)
			return ret;
	}
    ...
}

Could this cause cqspi_tune_phy() to incorrectly proceed and enable the PHY
with an unlocked DLL, leading to data corruption?

> +	}
> +
>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D14
