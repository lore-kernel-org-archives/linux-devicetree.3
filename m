Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FF3438BD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315240; cv=none; b=eVhYRAIzGVbDPVZ2+LP6+DwPzBfM+zZlI1vEP2g8RSfTBt5hxAj+EHbcNmZPkrqpi2gO3qlMOk1skZ5WwprTxv8IRZzhtarURZur2O3vlTsOI+lIxPDePnYK4aDdUklyqXU0G4MvhCRKgzp4lmnJmGzbNmIrrIbHE5DHOyLN8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315240; c=relaxed/simple;
	bh=GC9iasOfJyEyC7t+WwC4TkNH2AfHq+hVbzAul22+ko8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FKHfySk8jfak27xRUOmuNzcYR1AK8GwODbt9SS6k7FoJMECLq+PDoeC/+rQ7LUiBs9QYGYBmqIXYsnbhIQ7MuxagcLv1Ywy/KW8yp2x5IDjLAla0XVZQa9zAEcfE73u9rDmLzFPgUX5Enp7IJwLTEkgNREIpPRwpRj6NNUDhCxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfy3K3pf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfy3K3pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575D01F000E9;
	Fri, 17 Jul 2026 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315238;
	bh=YF1p9t64+wLslp62/AIpa9EUacbJi35eeDl1AzfFzlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wfy3K3pfYPanpfbgn58RQ5DZ1NeauZxeaoe+xRpLQDCcH+b0odfmJoFcuMsECXYGg
	 cXrspt50wFUUL7vK0IQxHKozjFRMVdFglK2qRCau8tLKEtkDcWWj2A9k9ARp61uEeX
	 zRob7K4ylvbWPRCQc6HiNMqEYp/zIpSY64GHRY8SdigqzzzceBEwzzbWQSYqR4ihgg
	 LXa6iSs8Z09GyAC/2iWilyiRYJNGqnBSEzvvT+uez2XgvLvrJWgURmbKN1YiDRPMf9
	 CASUbfOsNCecZIg0sgLAgMYORWD1QF1NAOZLeUYuXimi4aDbxD8flKrMGP1BMVKs4Y
	 /cQn405793Zzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/17] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-9-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:07:17 +0000
Message-Id: <20260717190718.575D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware `read_delay` is neither applied during PHY tuning sweeps =
nor preserved after tuning succeeds.
- [High] The variable `ret` is returned uninitialized if tuning is skipped =
due to a missing pattern partition offset.
- [High] The `execute_tuning` callback modifies shared controller hardware =
registers without holding the SPI bus lock.
- [Medium] Missing clamping in dual-region PHY tuning calculation causes in=
teger wrap-around.
- [Medium] Unconditional loop increment corrupts the successful TX delay va=
lue during RX low boundary search.
--

--- Patch [8]: [PATCH v5 08/17] spi: cadence-quadspi: add PHY tuning suppor=
t ---
commit 60d05f5aa8117400f4e61a7bebf88a390815be00
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit introduces delay-line PHY calibration for Cadence QSPI controll=
ers
to enable high-speed DDR/SDR operation. It adds an execute_tuning callback
that sweeps through RX and TX delay parameters and tests them using a known
data pattern.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 046fa5d69b0f7..22a5c88bbd8dc 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -2048,15 +2048,22 @@ static int cqspi_phy_apply_setting(struct cqspi_f=
lash_pdata *f_pdata,
>  				   struct phy_setting *phy)
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	unsigned int reg;
>  	int ret;
> =20
>  	reg =3D readl(cqspi->iobase + CQSPI_REG_READCAPTURE);
>  	reg |=3D BIT(CQSPI_REG_READCAPTURE_EDGE_LSB);
>  	writel(reg, cqspi->iobase + CQSPI_REG_READCAPTURE);
> =20
>  	cqspi_set_dll(cqspi->iobase, phy->rx, phy->tx);

[Severity: High]
Does this execute_tuning process run without the SPI bus lock?

Since cqspi_phy_apply_setting() modifies global hardware registers directly,
and the caller subsequently invokes spi_mem_exec_op() to verify the pattern,
could a concurrent transaction on another chip select interfere and cause
register data races?

> =20
>  	ret =3D cqspi_resync_dll(cqspi);
>  	if (ret)
>  		return ret;
> =20
>  	f_pdata->phy_setting.rx =3D phy->rx;
>  	f_pdata->phy_setting.tx =3D phy->tx;
>  	f_pdata->phy_setting.read_delay =3D phy->read_delay;
>  	return 0;
>  }

[Severity: High]
Is the new read_delay value actually programmed into the hardware during
the tuning sweeps?

While cqspi_phy_apply_setting() updates f_pdata->phy_setting.read_delay,
it doesn't appear to write this value to the CQSPI_REG_READCAPTURE
register, meaning all reads during the sweep might still be using the
static initial read delay.

[ ... ]
> @@ -2314,6 +2314,12 @@ static int cqspi_phy_tuning_ddr(struct cqspi_flash=
_pdata *f_pdata,
>  	rxlow.tx =3D CQSPI_PHY_TX_LOOKUP_LOW_START;
>  	do {
>  		dev_dbg(dev, "Searching for Golden Primary rxlow on TX =3D %d\n",
>  			rxlow.tx);
>  		rxlow.read_delay =3D CQSPI_PHY_INIT_RD;
>  		ret =3D cqspi_find_rx_low_ddr(f_pdata, mem, &rxlow);
>  		rxlow.tx +=3D CQSPI_PHY_DDR_SEARCH_STEP;
>  	} while (ret && rxlow.tx <=3D CQSPI_PHY_TX_LOOKUP_LOW_END);

[Severity: Medium]
Will this unconditionally increment rxlow.tx even when the pattern search
succeeds?

If ret =3D=3D 0, the loop breaks, but rxlow.tx has already been incremented=
 by
CQSPI_PHY_DDR_SEARCH_STEP. This seems to skew the successful TX boundary
by 4 taps and could corrupt the later midpoint calculation.

[ ... ]
> @@ -3037,6 +3037,10 @@ static int cqspi_phy_tuning_ddr(struct cqspi_flash=
_pdata *f_pdata,
>  		if ((abs(gaplow.tx - bottomleft.tx) +
>  		     abs(gaplow.rx - bottomleft.rx)) <
>  		    (abs(gaphigh.tx - topright.tx) +
>  		     abs(gaphigh.rx - topright.rx))) {
>  			/* Topright further: Use Region 2, 16 taps inward */
>  			searchpoint =3D topright;
>  			searchpoint.tx -=3D 16;
>  			searchpoint.rx -=3D (16 * (topright.rx - bottomleft.rx)) /
>  					  (topright.tx - bottomleft.tx);

[Severity: Medium]
Could this calculation cause an integer underflow on the 8-bit unsigned
rx and tx values?

If the resulting coordinate drops below zero, it looks like it would
wrap around and apply a very large, incorrect delay to the PHY. Should
this use clamping similar to the single-region temperature compensation
path above?

[ ... ]
> @@ -3237,6 +3237,10 @@ static int cqspi_am654_ospi_execute_tuning(struct =
spi_mem *mem,
>  			dev_warn(dev,
>  				 "failed to write pattern to cache: %d, skipping tuning\n",
>  				 ret);
>  			goto out;
>  		}
> =20
>  		f_pdata->phy_write_op =3D *write_op;
>  	} else {
>  		if (!f_pdata->phy_pattern_partition_offset) {
>  			dev_warn(dev, "pattern partition not found, skipping tuning\n");
>  			goto out;
>  		}

[Severity: High]
Does this path return an uninitialized stack variable?

The local variable ret is declared but not initialized. If write_op
is NULL and the spi-phy-pattern-partition property is missing, taking
this goto will return whatever garbage is on the stack.

[ ... ]
> @@ -3274,6 +3274,8 @@ static int cqspi_am654_ospi_execute_tuning(struct s=
pi_mem *mem,
>  		ret =3D cqspi_phy_tuning_sdr(f_pdata, mem);
>  	}
> =20
>  	if (ret)
>  		dev_warn(dev, "tuning failed: %d\n", ret);
> =20
>  	cqspi_phy_post_config(cqspi, f_pdata->read_delay);

[Severity: High]
Does this discard the tuned read delay?

cqspi_phy_post_config() is called with f_pdata->read_delay (the static
DT value) instead of f_pdata->phy_setting.read_delay. This seems to
overwrite the hardware with the untuned delay, dropping the results of
the calibration.

Also, should cqspi_configure() be updated to check use_tuned_phy and
apply f_pdata->phy_setting instead of unconditionally using
f_pdata->read_delay during context switches? Without this, the DLL
parameters might be lost on a CS switch.

> +
> +out:
> +	/*
> +	 * On success, write back the validated maximum speed into the caller's
> +	 * op templates so that those specific ops bypass the cap in subsequent
> +	 * exec_op calls.
> +	 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D8
