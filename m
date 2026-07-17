Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32595344DB7
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784316252; cv=none; b=qThiot+59NURwhAQFriIGq1p7e/wK8D9NLXFYEEX4/2FpmvM/XVoJdykLWxpudbm1qdN6H8Kx5kHFCj9DAXQ2LSQxVpCdfhVLQeZvriyto544BUU9RUzrunceNaiviSqWvQzAgiDeWOWDCernBsHId/EKiG1mSv4p+zTy3m1sjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784316252; c=relaxed/simple;
	bh=i71kbj0daJEyWvKCv7hWa+ti9iO0+jSwUChNux5/KiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mkECdtvD8/T4mvv4xt19+a5Jp5U96hGAcVxHoIdTXfXVspJk8jeAcp75uz6383FAaVHdRnAOPzPa82YhW3ebKDXmgTHYby4x3jPX3LUNKAaQRXvGoTVi60dEIPYI+QbcI0oCCeuMVeyZHnaXdyvqoaK1m1VPtBhgp3zQvwkuSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/zJJybx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/zJJybx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C2B1F000E9;
	Fri, 17 Jul 2026 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784316250;
	bh=P2v6mCh+hQAOt4gOuUSgU5W/vDb8znYoCjKY0tw2Yw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/zJJybxtIXiNEA9UIkWTfrBik6lD1MCn/zo6OUD9Jj8kRW3iVKdbh9+HusRmdij7
	 FB98osd9JOaVrj2epOd8aErQOrKdkUGZf9wQHq1B6fJXWKuTbUAvox/npqtBQRqUN+
	 usICp+SgQq/asDktKXnTYtg7q7Wot5IQ6aA3JwPa0i4RUOPp5Kp2omTLKGdIjF4A1s
	 y4atTl8UWg5iugL2URy0Ogo/RZr5yoUdznjHzqgZfntMf1m9V3V91FEL9JQi6hVFtE
	 /PeG/ad1c3BRlQYiYq/aISp14xVMoFzMP7Xa3DMgdIE/YTc1n0S41taD56dbOviTtH
	 LY5zKWWrw3J1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/17] mtd: spi-nor: run controller optimization
 before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717185116.2065505-18-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-18-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:24:09 +0000
Message-Id: <20260717192410.A3C2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Tuned max_freq is unconditionally applied to all read operations, =
causing PHY mismatch and data corruption during temporary protocol downgrad=
es like 1-1-1 OTP reads.
- [High] An uninitialized variable in the CQSPI controller's tuning impleme=
ntation can incorrectly report success when tuning is skipped, causing the =
SPI clock to run at high frequencies without PHY calibration.
--

--- Patch [17]: [PATCH v5 17/17] mtd: spi-nor: run controller optimization =
before dirmap creation ---
commit 2bd8b43f8358132165659bf7cc2e06b7b61244b6
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spi-nor: run controller optimization before dirmap creation

This commit runs controller optimization in spi_nor_probe() before creating
dirmaps so the validated frequency is available at construction time. It
stores the configured read op template in nor->max_read_op and propagates
the validated max_freq into every read op.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b683c077a233d..2efcdc7f637fb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -216,6 +216,9 @@ static struct spi_mem_op spi_nor_spimem_get_read_op(s=
truct spi_nor *nor)
>  	if (spi_nor_protocol_is_dtr(nor->read_proto))
>  		op.dummy.nbytes *=3D 2;
> =20
> +	/* Propagate the validated frequency; zero before tuning. */
> +	op.max_freq =3D nor->max_read_op.max_freq;
> +

[Severity: High]
Could this cause issues when read operations temporarily downgrade the
protocol?

If a read operation temporarily downgrades to 1-1-1, it looks like this will
unconditionally apply the DTR-tuned max_freq.

For example, in spi_nor_otp_read_secr():

    nor->read_proto =3D SNOR_PROTO_1_1_1;
    ...
    ret =3D spi_nor_read_data(nor, addr, len, buf);

Could propagating the DTR-calibrated frequency into an SDR 1-1-1 read op
cause the SPI controller to erroneously engage a DTR-calibrated PHY and
corrupt the data?

>  	return op;
>  }
> =20

[ ... ]

> @@ -3843,6 +3846,17 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  			return -ENOMEM;
>  	}
> =20
> +	/*
> +	 * Populate the persistent template and run PHY tuning before dirmap
> +	 * creation so the validated frequency feeds into the dirmap op.
> +	 * Tuning failure is non-fatal; the device operates at base speed.
> +	 */
> +	nor->max_read_op =3D spi_nor_spimem_get_read_op(nor);
> +
> +	ret =3D spi_mem_execute_tuning(spimem, &nor->max_read_op, NULL);

[Severity: High]
Does passing NULL for the write_op here expose an uninitialized return value
in some SPI controllers?

Looking at cqspi_am654_ospi_execute_tuning() in the Cadence QSPI driver,
if write_op is NULL and the pattern partition isn't found, it skips tuning:

drivers/spi/spi-cadence-quadspi.c:cqspi_am654_ospi_execute_tuning() {
    int ret;
    ...
    if (!f_pdata->phy_pattern_partition_offset) {
        dev_warn(dev, "pattern partition not found, skipping tuning\n");
        goto out;
    }
    ...
out:
    if (!ret) {
        read_op->max_freq =3D mem->spi->post_config_max_speed_hz;
}

Since ret is uninitialized when the partition is missing, could it happen
to be 0 and falsely report success? If this happens, it looks like it would
enable high-speed operations without a tuned PHY.

> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_dbg(dev, "Controller optimization failed: %d\n", ret);
> +
>  	ret =3D spi_nor_create_read_dirmap(nor);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D17
