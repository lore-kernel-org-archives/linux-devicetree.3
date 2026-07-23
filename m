Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858BA4749C5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807295; cv=none; b=psDwzOyuSc5xH57lW7zMGfXFzcaVBhY6oW6IEkxCalaUow3EwUUg3tcyBnXj4ibbNLnBnd503wXy+PKOLxGhj8s5S5SbxVYq3vNlAvHnZBPeMVtGqYfhvWEay51QRwjpt3YS7ThadXnVWbGl8/NUdpp6ucaALj7ueiIIw5SNB+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807295; c=relaxed/simple;
	bh=Q7N7rBlryX2SYfbJcTZPG4GzP41xl/BiCYT2Y3sYeqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QvWoLsnZtcKq49QyYSqsVfdx7AKYoG2lnBaTjB8Icacqh8QbvAdw/DGGFs1yXAggX6Et0r3qewh+8YiZcgk58mkeoFtM6CTtzYdpFafxqEI49klxAvfA7VJPV0N3kpAvvbmLH0vMs/fpXf1RuFmX+SDI2Xe3JKOGbZ5KEGdnmho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C101F000E9;
	Thu, 23 Jul 2026 11:48:04 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/17] spi: cadence-quadspi: skip DDR PHY tuning for
 2-byte-address ops (i2383)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20260723110219.3180747-10-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-10-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:48:04 +0000
Message-Id: <20260723114804.F2C101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] PHY tuning results are completely ignored for normal flash ope=
rations because the PHY is explicitly disabled after tuning, rendering the =
entire PHY tuning infrastructure a no-op.
- [High] The function `cqspi_am654_ospi_execute_tuning()` evaluates and ret=
urns an uninitialized `ret` variable if `write_op` is NULL and `f_pdata->ph=
y_pattern_partition_offset` is 0.
- [High] Dereference of `cqspi->ddata` without a NULL check in `cqspi_mem_o=
p_execute_tuning()`.
--

--- Patch [9]: [PATCH v6 09/17] spi: cadence-quadspi: skip DDR PHY tuning f=
or 2-byte-address ops (i2383) ---
commit 4c906c102926bb1609336a42cd87a62ace96246a
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)

Erratum i2383 on AM654 locks the address phase in PHY DDR mode when a
2-byte column address is used. DDR PHY tuning must not be attempted for
such operations; non-PHY DDR usage is unaffected. Add
CQSPI_NO_PHY_TUNING_WITH_ODDR_2B_ADDR quirk and check it in
cqspi_am654_ospi_execute_tuning().

Link: https://www.ti.com/lit/er/sprz544c/sprz544c.pdf

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 22a5c88bbd8dc..5070ffc53d5e8 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -3183,6 +3184,20 @@ static int cqspi_am654_ospi_execute_tuning(struct =
spi_mem *mem,
>  		return -EOPNOTSUPP;
>  	}
> =20
> +	/*
> +	 * Erratum i2383: in PHY DDR mode, a 2-byte column address locks up
> +	 * the address phase. Skip DDR PHY tuning for such operations.
> +	 */
> +	if ((cqspi->ddata->quirks & CQSPI_NO_PHY_TUNING_WITH_ODDR_2B_ADDR) &&
> +	    read_op->addr.nbytes =3D=3D 2 &&
> +	    (read_op->cmd.dtr || read_op->addr.dtr || read_op->dummy.dtr ||
> +	     read_op->data.dtr)) {
> +		dev_dbg(dev,
> +			"i2383: skipping DDR PHY tuning (2-byte address)\n");
> +		read_op->max_freq =3D 0;
> +		return 0;
> +	}
> +

[Severity: High]
Does this code dereference cqspi->ddata without checking if it is NULL?

Looking at cqspi_mem_op_execute_tuning():

static int cqspi_mem_op_execute_tuning(...)
{
	struct cqspi_st *cqspi =3D
		spi_controller_get_devdata(mem->spi->controller);

	if (!cqspi->ddata->execute_tuning)
		return -EOPNOTSUPP;
...

If the driver design allows ddata to be NULL, this will cause a kernel panic
due to a NULL pointer dereference.

[Severity: High]
Can cqspi_am654_ospi_execute_tuning() evaluate an uninitialized variable?

Looking at cqspi_am654_ospi_execute_tuning():

	int ret;
...
	if (write_op) {
...
	} else {
		if (!f_pdata->phy_pattern_partition_offset) {
			dev_warn(dev, "pattern partition not found, skipping tuning\n");
			goto out;
		}
...
	}
...
out:
	if (!ret) {

If write_op is NULL and f_pdata->phy_pattern_partition_offset is 0, the code
jumps to the out label and evaluates the uninitialized ret variable.

[Severity: Critical]
Are the PHY tuning results completely ignored for normal flash operations?

In cqspi_am654_ospi_execute_tuning(), after tuning finishes:

	cqspi_phy_post_config(cqspi, f_pdata->read_delay);

This passes the untuned default f_pdata->read_delay and explicitly disables
the PHY in cqspi_phy_post_config().

Then in cqspi_configure():

	cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
			       f_pdata->read_delay);

During normal operations, dqs is hardcoded to false and the untuned read_de=
lay
is used, which bypasses the PHY tuning entirely.

>  	if (write_op) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D9
