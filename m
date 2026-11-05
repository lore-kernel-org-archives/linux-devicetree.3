Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877780;
	b=m2igUH0nXm+9eW0ZTGfVJWZeKXqrf1I067Va4Wn35wylyx9TuI10ftbKw38fHj86cjby
	 QhQy5mQmPDGULBmIuJ7zgCC5P0CxDY1qSa68N4h0JE5QAbmYyjUzf+x2MtO1YmqLy7rjH
	 15AhS1180HsMgPOTHdNs4ef3SPc2iMZ5Y2GZM8zgeKllFVO+HV1ID5CQ1+FNOol0LUhPm
	 wydKgv8eixFW0lzQLwSK/Loi1Rq9uyoiP4F3q7+4sP5bLUKLCFcPonrhjVCYA24aIJP6v
	 riEcbPkntLwPvnu+SPPH2ot63NjMfVDUCcqvpaoQJ22EqlHtbFCjyJnRZAaRcTE87vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877780;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uCiBl3ya0KrIdY/h0LucHpDhAT6hJ3Jq6BGPjBFr5SA=;
	b=KmY3ZzOFLCdEsQXlMsHeEunNbJMz+u25+zI2EyOMM+l85DKgyNHIrzMW0GdYx/T1GbMY
	 QMEkPAuZshNcHH5Musv/kV+T12O5nmJx9XIH+UdPO9P6L18PpB5vIs+bo/X6N0/hIat0l
	 jwrY361LHKEmLzu5pGolmw8mDpiaTK78jo5U8/8lF3lkmWPKgZvLS34/E38CAWbR72W5k
	 U5vaAreOP50TX0lMgjdEk4nhEB3IxdLRn0Um98Bs4HFhM7LUMwn5FO7wKVPUdMydeQCUQ
	 7EvLqFSWldIGC5tO3u+0vRher8SKQyjBrKaQjc91V07zl55PdMOmSKa4yFSmP2eZ7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3M08CHa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C92606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3M08CHa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4721F0093A;
	Thu,  5 Nov 2026 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877779;
	bh=uCiBl3ya0KrIdY/h0LucHpDhAT6hJ3Jq6BGPjBFr5SA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3M08CHa0Vgs+qPGsRWJ1LTMtu5t3WgUxEBldC+KDhK0IuO/D2suaXCtgBdhFoE0m
	 fZf9tFfOeRwHQG5mEPhZIFyIQunQstdnu9nts8GhxT8jRwR6Ooa/ljtcxbxtbHD3zE
	 frBvXzafsMRMxKC7oZPRO6vyUPOBmOHk1LvyAtIaFGS+XwKzuMsa4yOYxiZ5/4q9/c
	 VArg9OwnpUxU4/H3bvAu7XlkJj9HN5JOS346m24Thz/US40joBNiLh8peuJXyVHX58
	 qvTuuWWSvH9q81olMXFxCHU9RAnvqxKpfdCm/r8rJ1G8rb7dWzW2GSREkk+Liky+7u
	 Pogq94yNfGWKw==
Message-ID: <sashiko-outbox-198942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/19] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-9-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:22:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] spi: cadence-quadspi: u8 underflow and infinite loop in cqspi_find=
_rx_high_sdr()
- [High] spi: cadence-quadspi: unclocked MMIO access in cqspi_am654_ospi_ex=
ecute_tuning()
- [Medium] spi: cadence-quadspi: broken RX bounds and gap search in cqspi_p=
hy_tuning_ddr()
- [Medium] spi: cadence-quadspi: propagate -ENOMEM from cqspi_phy_check_pat=
tern()
--

commit ce4fb0e8743e77133f1ba6c00a646ccc15a0b0a7
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit adds delay-line PHY calibration support for AM654-based Cadence
OSPI controllers via the spi_controller_mem_ops execute_tuning callback. It
implements a 2D RX/TX delay sweep for DDR protocols and a 1D RX delay sweep
for SDR protocols using a known tuning pattern.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 4be37081d066c..b0f01621b323c 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1558,10 +1717,1572 @@ static bool cqspi_supports_mem_op(struct spi_me=
m *mem,
[ ... ]
> +static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
> +				   struct spi_mem *mem)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct spi_mem_op op;
> +	u8 *read_data;
> +	int ret;
> +
> +	read_data =3D kmalloc_array(ARRAY_SIZE(phy_tuning_pattern),
> +				  sizeof(phy_tuning_pattern[0]), GFP_KERNEL);
> +	if (!read_data)
> +		return -ENOMEM;
> +
> +	op =3D f_pdata->phy_read_op;
> +	op.data.buf.in =3D read_data;
> +	op.data.nbytes =3D sizeof(phy_tuning_pattern);
> +
> +	ret =3D ctlr->mem_ops->exec_op(mem, &op);
> +	if (ret)
> +		goto out;
> +
> +	if (memcmp(read_data, phy_tuning_pattern, sizeof(phy_tuning_pattern)))
> +		ret =3D -EAGAIN;
> +
> +out:
> +	kfree(read_data);
> +	return ret;
> +}
[ ... ]
> +static int cqspi_find_rx_low_ddr(struct cqspi_flash_pdata *f_pdata,
> +				 struct spi_mem *mem, struct cqspi_phy_setting *phy)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	do {
> +		phy->rx =3D CQSPI_PHY_RX_LOW_SEARCH_START;
> +		do {
> +			ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +			if (!ret) {
> +				ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +				if (!ret)
> +					return 0;
> +			}
> +
> +			phy->rx +=3D CQSPI_PHY_DDR_SEARCH_STEP;
> +		} while (phy->rx <=3D CQSPI_PHY_RX_LOW_SEARCH_END);
> +
> +		phy->read_delay++;
> +	} while (phy->read_delay <=3D CQSPI_PHY_MAX_RD);
> +
> +	dev_dbg(dev, "Unable to find RX low\n");
> +	return -ENOENT;
> +}

[Severity: Medium]
As reported by Sashiko on v10 [1], in drivers/spi/spi-cadence-quadspi.c,
cqspi_phy_check_pattern() allocates read_data with kmalloc_array() on every
call and returns -ENOMEM on allocation failure.

However, the sweep helpers (cqspi_find_rx_low_ddr(), cqspi_find_rx_low_sdr(=
),
cqspi_find_rx_high_ddr(), cqspi_find_rx_high_sdr(), cqspi_find_tx_low_ddr(),
and cqspi_find_tx_high_ddr()) only check if (!ret) and ignore the specific
error code, continuing to sweep across all remaining delay taps and ultimat=
ely
returning -ENOENT instead of -ENOMEM.

Similarly, the void binary-search helpers cqspi_phy_find_gaplow_ddr() and
cqspi_phy_find_gaphigh_ddr() treat any non-zero return from
cqspi_phy_check_pattern() as a pattern mismatch and bisect the search window
in the wrong direction.

Should -ENOMEM be propagated immediately, or could the 128-byte buffer be
allocated once before the tuning sweep?

[ ... ]
> +static int cqspi_find_rx_high_sdr(struct cqspi_flash_pdata *f_pdata,
> +				  struct spi_mem *mem, struct cqspi_phy_setting *phy,
> +				  u8 lowerbound)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	phy->rx =3D CQSPI_PHY_MAX_DELAY;
> +	do {
> +		ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +		if (!ret) {
> +			ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +			if (!ret)
> +				return 0;
> +		}
> +		phy->rx--;
> +	} while (phy->rx >=3D lowerbound);
> +
> +	dev_dbg(dev, "Unable to find RX high\n");
> +	return -ENOENT;
> +}

[Severity: High]
As reported by Sashiko on v10 [2], can phy->rx underflow and cause an infin=
ite
loop in cqspi_find_rx_high_sdr() in drivers/spi/spi-cadence-quadspi.c?

In struct cqspi_phy_setting, rx is a u8, and the lowerbound parameter of
cqspi_find_rx_high_sdr() is also a u8. During SDR tuning,
cqspi_phy_tuning_sdr() first calls cqspi_find_rx_low_sdr(), which scans upw=
ard
starting from phy->rx =3D 0, and then passes rxlow.rx as lowerbound to
cqspi_find_rx_high_sdr():

	rxhigh.read_delay =3D rxlow.read_delay;
	ret =3D cqspi_find_rx_high_sdr(f_pdata, mem, &rxhigh, rxlow.rx);

Whenever tap 0 passes the pattern check in cqspi_find_rx_low_sdr(), rxlow.rx
is 0, so lowerbound is 0. If cqspi_phy_apply_setting() or
cqspi_phy_check_pattern() subsequently fails down through phy->rx =3D=3D 0 =
in
cqspi_find_rx_high_sdr() (for example due to a marginal pass at tap 0, a
transient read error, or DLL lock timeout), phy->rx-- wraps from 0 to 255 a=
nd
the unsigned condition phy->rx >=3D lowerbound remains true forever while h=
olding
the SPI controller mutexes.

[ ... ]
> +static void cqspi_phy_find_gaplow_ddr(struct cqspi_flash_pdata *f_pdata,
> +				      struct spi_mem *mem,
> +				      struct cqspi_phy_setting *bottomleft,
> +				      struct cqspi_phy_setting *topright,
> +				      struct cqspi_phy_setting *gaplow)
> +{
> +	struct cqspi_phy_setting left, right, mid;
> +	int ret;
> +
> +	left =3D *bottomleft;
> +	right =3D *topright;
> +
> +	mid.tx =3D left.tx + ((right.tx - left.tx) / 2);
> +	mid.rx =3D left.rx + ((right.rx - left.rx) / 2);
> +	mid.read_delay =3D left.read_delay;
> +
> +	do {
> +		ret =3D cqspi_phy_apply_setting(f_pdata, &mid);
> +		if (!ret)
> +			ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +
> +		if (ret) {
> +			/* The pattern was not found. Go to the lower half. */
> +			right.tx =3D mid.tx;
> +			right.rx =3D mid.rx;
> +
> +			mid.tx =3D left.tx + ((mid.tx - left.tx) / 2);
> +			mid.rx =3D left.rx + ((mid.rx - left.rx) / 2);
> +		} else {
> +			/* The pattern was found. Go to the upper half. */
> +			left.tx =3D mid.tx;
> +			left.rx =3D mid.rx;
> +
> +			mid.tx =3D mid.tx + ((right.tx - mid.tx) / 2);
> +			mid.rx =3D mid.rx + ((right.rx - mid.rx) / 2);
> +		}
> +
> +		/* Break the loop if the window has closed. */
> +	} while ((right.tx - left.tx >=3D 2) && (right.rx - left.rx >=3D 2));
> +
> +	*gaplow =3D mid;
> +}
[ ... ]
> +static int cqspi_phy_tuning_ddr(struct cqspi_flash_pdata *f_pdata,
> +				struct spi_mem *mem)
> +{
[ ... ]
> +	rx_window =3D rxhigh.rx - rxlow.rx;
> +	txlow.rx =3D rxlow.rx + (rx_window / 4);
> +	dev_dbg(dev, "Searching for Golden txlow on RX =3D %d\n", txlow.rx);
> +	txlow.read_delay =3D CQSPI_PHY_INIT_RD;
> +	ret =3D cqspi_find_tx_low_ddr(f_pdata, mem, &txlow);
> +	if (ret)
> +		goto out;
[ ... ]
> +		/* Compare Manhattan distances: choose corner furthest from gap */
> +		if ((abs(gaplow.tx - bottomleft.tx) +
> +		     abs(gaplow.rx - bottomleft.rx)) <
> +		    (abs(gaphigh.tx - topright.tx) +
> +		     abs(gaphigh.rx - topright.rx))) {
> +			/* Topright further: Use Region 2, 16 taps inward */
> +			searchpoint =3D topright;
> +			searchpoint.tx =3D clamp((int)topright.tx - 16,
> +					       0, CQSPI_PHY_MAX_DELAY);
> +			searchpoint.rx =3D clamp((int)topright.rx -
> +					       (16 * (topright.rx - bottomleft.rx)) /
> +					       (topright.tx - bottomleft.tx),
> +					       0, CQSPI_PHY_MAX_DELAY);
> +		} else {
> +			/* Bottomleft further: Use Region 1, 16 taps inward */
> +			searchpoint =3D bottomleft;
> +			searchpoint.tx =3D clamp((int)bottomleft.tx + 16,
> +					       0, CQSPI_PHY_MAX_DELAY);
> +			searchpoint.rx =3D clamp((int)bottomleft.rx +
> +					       (16 * (topright.rx - bottomleft.rx)) /
> +					       (topright.tx - bottomleft.tx),
> +					       0, CQSPI_PHY_MAX_DELAY);
> +		}
> +	}

[Severity: Medium]
In drivers/spi/spi-cadence-quadspi.c, does cqspi_phy_tuning_ddr() handle the
case where rxhigh.rx is smaller than or close to rxlow.rx across different
read_delay values?

cqspi_find_rx_low_ddr() searches phy->rx in 0..40 across read_delay 1..4,
while cqspi_find_rx_high_ddr() searches phy->rx in 24..127 across read_delay
4..1. Because those RX ranges overlap in 24..40 and rxlow and rxhigh can be
found at different read_delay values, rxhigh.rx can be less than or nearly
equal to rxlow.rx:

1. In cqspi_phy_tuning_ddr(), rx_window =3D rxhigh.rx - rxlow.rx becomes
   negative when rxhigh.rx < rxlow.rx, which steps txlow.rx =3D rxlow.rx +
   (rx_window / 4) and backuppoint.rx =3D rxlow.rx + ((rx_window * 3) / 4)
   below rxlow.rx.

2. In cqspi_phy_find_gaplow_ddr() and cqspi_phy_find_gaphigh_ddr(), the loop
   condition is:

	} while ((right.tx - left.tx >=3D 2) && (right.rx - left.rx >=3D 2));

   Because both axes are combined with &&, the binary search stops as soon =
as
   the narrower axis span drops below 2 (or after a single iteration if
   topright.rx <=3D bottomleft.rx + 1), leaving the wider axis unsearched.

3. In the final point calculation in cqspi_phy_tuning_ddr(), when
   topright.rx < bottomleft.rx, (topright.rx - bottomleft.rx) is negative,
   which pushes searchpoint.rx outward past the valid RX boundary (above
   topright.rx for Region 2 or below bottomleft.rx for Region 1) instead of
   inward.

[ ... ]
> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{
[ ... ]
> +	if (read_op->cmd.dtr || read_op->addr.dtr || read_op->dummy.dtr ||
> +	    read_op->data.dtr) {
> +		f_pdata->use_dqs =3D true;
> +		cqspi_phy_pre_config(cqspi, f_pdata, false);
> +		ret =3D cqspi_phy_tuning_ddr(f_pdata, mem);
> +	} else {
> +		f_pdata->use_dqs =3D false;
> +		cqspi_phy_pre_config(cqspi, f_pdata, true);
> +		ret =3D cqspi_phy_tuning_sdr(f_pdata, mem);
> +	}
> +
> +	if (ret)
> +		dev_warn(dev, "tuning failed: %d\n", ret);
> +
> +	cqspi_phy_post_config(cqspi, f_pdata->read_delay);
> +
> +out:
> +	if (!ret) {
> +		read_op->max_freq =3D mem->spi->post_config_max_speed_hz;
> +		if (write_op) {
> +			write_op->max_freq =3D mem->spi->post_config_max_speed_hz;
> +			f_pdata->phy_write_op.max_freq =3D
> +				mem->spi->post_config_max_speed_hz;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int cqspi_mem_op_execute_tuning(struct spi_mem *mem,
> +				       struct spi_mem_op *read_op,
> +				       struct spi_mem_op *write_op)
> +{
> +	struct cqspi_st *cqspi =3D
> +		spi_controller_get_devdata(mem->spi->controller);
> +
> +	if (!cqspi->ddata || !cqspi->ddata->execute_tuning)
> +		return -EOPNOTSUPP;
> +
> +	return cqspi->ddata->execute_tuning(mem, read_op, write_op);
> +}

[Severity: High]
Can cqspi_am654_ospi_execute_tuning() access MMIO registers while the
controller is runtime-suspended?

In drivers/spi/spi-cadence-quadspi.c, cqspi_probe() enables runtime PM with
autosuspend on &pdev->dev without setting host->auto_runtime_pm. As a resul=
t,
spi_mem_access_start() does not wake the controller, and cqspi_exec_mem_op()
acquires and releases runtime PM (and cqspi->inflight_ops) around each
individual memory operation:

	ret =3D pm_runtime_resume_and_get(dev);
	if (ret) {
		dev_err(&mem->spi->dev, "resume failed with %d\n", ret);
		goto dec_inflight_refcount;
	}

	ret =3D cqspi_mem_process(mem, op);

	pm_runtime_put_autosuspend(dev);

Unlike cqspi_exec_mem_op(), cqspi_mem_op_execute_tuning() does not hold a
runtime PM reference or an inflight_ops reference across the tuning sequenc=
e.
When cqspi_write_pattern_to_cache() or cqspi_phy_check_pattern() returns fr=
om
ctlr->mem_ops->exec_op(), the runtime PM usage count drops back to zero, so
direct MMIO accesses in cqspi_phy_pre_config(), cqspi_phy_apply_setting(),
cqspi_set_dll(), cqspi_resync_dll(), and cqspi_phy_post_config() run without
an active runtime PM reference. If autosuspend triggers between operations,
cqspi_runtime_suspend() can gate the clocks during MMIO access or
cqspi_runtime_resume() can reinitialize the controller mid-calibration.

Should cqspi_mem_op_execute_tuning() hold pm_runtime_resume_and_get() and
cqspi->inflight_ops across the execute_tuning callback in the same way as
cqspi_exec_mem_op()?

[1] https://lore.kernel.org/r/20260929063529.1235417-9-s-k6@ti.com
[2] https://lore.kernel.org/r/20260929063529.1235417-9-s-k6@ti.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D8
