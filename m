Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980623839A5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907446; cv=none; b=P7q06ksOFmBUEgXWp0X4GTn4zM2+rXTDKeXOBcynXE7WLtl7Ed29T41T5LCFXRAI3j3ARvV7xk2cFoNitixozo166otClcLJ+knxBslxNgTnwsONQeihvYX5oh2rPPGlw99GyxRy9BeWfogvYccQulNDbT86wfLZVUfUwQz9csM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907446; c=relaxed/simple;
	bh=/eYVn105xxXHmCVnp4QqCYXsLcyuq+l+x7SNX0NrfPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/emdPBSP1drjh9tSG1nWQ8Afiexx0gX39CKGBUqjlOydUJelPbQXhzSvyR5zf4rs9kFjLMqgM+/inMIscSOPGP+UgKlFLqV8WAGzalAtHUPZs7nNdL3bzjnUxEA9uVjIORR+J9DCyQDvvuXTefwUghYgWb4alzlxlUBomY9oo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoS7nOiN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoS7nOiN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9741F000E9;
	Wed, 27 May 2026 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779907445;
	bh=zCAXf3PX7P90zqMDZISog+CGg/my0mCXIld1Phy/Mqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JoS7nOiNCFvhSAyNx4sdYusmkOsJIXtg7Dmbe54jLDgywafRFUkBNUelEeQ9Lv5U8
	 Ov8dSVGgdsY6xAMdpWCnCgcMdmdNJ0f5qHa8VcTY2dt17wU/cw4GMDugJ68QcfxRUW
	 N5O9LECYzif3uzml2q7r0/EeBUrr/eHM4tpL8OUKs9CEAcwjADCN8P1BvsqE3pxnp1
	 7M1pug3//Ab+Cpu88agJUZ81gIShod0iiqv+qiRPKWdQRQpurH1mn+N1W+v9Vl4Lo3
	 CkMoNqEoRNlPPDYsIso+UcjAy0FGsQqh3Ng6di2Ykg/x/8zEQEHjdE4jh/sRpgv5TM
	 HiXN3VmDpd0iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/13] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527175527.2247679-9-s-k6@ti.com>
References: <20260527175527.2247679-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:44:04 +0000
Message-Id: <20260527184405.3E9741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The final search point calculation for dual-region DDR tuning lack=
s bounds clamping, causing integer underflow/overflow on u8 types.
- [High] Outer TX sweep loops unconditionally apply an extra step increment=
 after a successful pattern check, corrupting the discovered TX coordinate.
- [High] The execute_tuning callback performs unlocked read-modify-write op=
erations on shared controller registers, risking race conditions with concu=
rrent SPI transfers.
- [High] cqspi_find_rx_high_sdr() incorrectly returns -ENOENT and aborts tu=
ning if the valid RX window is exactly one tap wide.
--

commit 58d61a0f7bbd617a13de461da80be17236414b26
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit adds an execute_tuning callback to perform delay-line PHY
calibration using a known data pattern. It performs either a 2D sweep for
DDR protocols or a 1D sweep for SDR protocols to find optimal delay points.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index f4efb92c9446a..013fd50e416bd 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1559,10 +1641,1687 @@ static bool cqspi_supports_mem_op(struct spi_me=
m *mem,
>  	return spi_mem_default_supports_op(mem, op);
>  }

[ ... ]

> +static int cqspi_find_rx_high_sdr(struct cqspi_flash_pdata *f_pdata,
> +				  struct spi_mem *mem, struct phy_setting *phy,
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
> +	} while (phy->rx > lowerbound);
> +
> +	dev_dbg(dev, "Unable to find RX high\n");
> +	return -ENOENT;
> +}

[Severity: High]
If the valid passing window is exactly 1 tap wide, no value strictly greater
than lowerbound will pass the pattern check. Would this loop decrement
phy->rx down to lowerbound and then exit returning -ENOENT? Since lowerbound
is already known to be a passing value, should this function instead
successfully return lowerbound to avoid aborting the SDR PHY tuning process?

[ ... ]

> +	/* Primary rxlow: Sweep TX window to find valid RX lower bound */
> +
> +	rxlow.tx =3D CQSPI_PHY_TX_LOOKUP_LOW_START;
> +	do {
> +		dev_dbg(dev, "Searching for Golden Primary rxlow on TX =3D %d\n",
> +			rxlow.tx);
> +		rxlow.read_delay =3D CQSPI_PHY_INIT_RD;
> +		ret =3D cqspi_find_rx_low_ddr(f_pdata, mem, &rxlow);
> +		rxlow.tx +=3D CQSPI_PHY_DDR_SEARCH_STEP;
> +	} while (ret && rxlow.tx <=3D CQSPI_PHY_TX_LOOKUP_LOW_END);

[Severity: High]
Does this unconditionally add CQSPI_PHY_DDR_SEARCH_STEP even if
cqspi_find_rx_low_ddr() returns success? If ret =3D=3D 0, rxlow.tx gets
incremented right before the loop exits, which might shift the recorded tx
coordinate away from the actual successful coordinate.

[ ... ]

> +		/* Compare Manhattan distances: choose corner furthest from gap */
> +		if ((abs(gaplow.tx - bottomleft.tx) +
> +		     abs(gaplow.rx - bottomleft.rx)) <
> +		    (abs(gaphigh.tx - topright.tx) +
> +		     abs(gaphigh.rx - topright.rx))) {
> +			/* Topright further: Use Region 2, 16 taps inward */
> +			searchpoint =3D topright;
> +			searchpoint.tx -=3D 16;
> +			searchpoint.rx -=3D (16 * (topright.rx - bottomleft.rx)) /
> +					  (topright.tx - bottomleft.tx);
> +		} else {
> +			/* Bottomleft further: Use Region 1, 16 taps inward */
> +			searchpoint =3D bottomleft;
> +			searchpoint.tx +=3D 16;
> +			searchpoint.rx +=3D (16 * (topright.rx - bottomleft.rx)) /
> +					  (topright.tx - bottomleft.tx);
> +		}

[Severity: High]
Since searchpoint.tx and searchpoint.rx are u8 types, could subtracting 16
cause an underflow if topright.tx or topright.rx is less than 16? This
might result in wrapping around to a large positive value. Should these
calculations be clamped to ensure they stay within valid bounds?

[ ... ]

> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{
> +	struct cqspi_st *cqspi =3D
> +		spi_controller_get_devdata(mem->spi->controller);
> +	struct cqspi_flash_pdata *f_pdata;

[Severity: High]
Does execute_tuning() run without holding the SPI controller's bus lock
mutex? If so, could this race with concurrent SPI transfers from other devi=
ces
on the same controller, potentially causing issues when tuning functions li=
ke
cqspi_resync_dll() perform unlocked read-modify-write operations on shared
global registers like CQSPI_REG_CONFIG?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D8
