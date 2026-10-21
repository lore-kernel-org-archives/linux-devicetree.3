Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548518;
	b=EeDCeZuKYK1R66sWT5BcGwPYarDoloJPU8h9VMSrfcEfQgslO7jRdwYsMB8pdUnej1En
	 j2Pb2nIPO11zunRuaCJHkXBX6nqT1zseqSd7Ua3bP0ZNjYablTyRy7pG1gP3Z5g13vcTm
	 eAwpxm4IoI7zx4CVOYpAjOoGW84A78VJdrMgdrhTzlLb96g25nEZ/KbgQ5xKNNN6Sg6C8
	 yoAfQaG9F3tQPnCcAf/mlVmFJrZ1tgARgc86p0Eqhj/lDVWGMYLe+nZzpCN5DNc0QY6+k
	 xXzhhEutOwA+JNq0nsGtpz63KjkfRaSUc0WsIJ2J4g2jOSxwgmNpX037THP1rqG0nCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DPSIyIEk0FaAkUIZHXeI5kjH5kkKiAm2j6s3EqMnHss=;
	b=nulSGutThjQIe5boTuHgTkVqSf1WHVK9JMqYVn3RtdjEWct84MrjU4ppfT3QPQiJjmok
	 Y/TnuU4CuNRsWLTI+5etSZvcjTtiQqzfbWjENlxqc7BxMqTpxOn/Du35zShNHi5y5BfSW
	 /4OZ/bWB27Og7ee4+F8Gsw7yS7Ya4iCV3lmoLqQRX0rxUwuZ4+B4OiSECYYUtCI8FNNWT
	 3XGbptg15BQ5ZaMwR9Suwg3HdxvEDivGSZkqrb1FkD2tV385WfrywraoOAVrpYBoPwfwy
	 8OKZ4ol/wWEGXm24GuTdeLn3rMqssqDSbwp2Hj/nGQs7p1XUXfKOW9Yibe3UzjlZ1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5Gzn+hf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3243606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5Gzn+hf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C4C1F000C9;
	Wed, 21 Oct 2026 02:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548517;
	bh=DPSIyIEk0FaAkUIZHXeI5kjH5kkKiAm2j6s3EqMnHss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5Gzn+hfMZezDi4iWyzLC5vVMhiEaE/MzUdOyyAD4Mic3VRZ0LqZn9ARthaXbVI5q
	 LVH12tx4GvgNePIuMGOwk4YtkGstcMPEMzrrjZzj9ifJx8GdNWg5M5YfzMTZBQvsUi
	 AoLOuO7cfETHA3cKGObETa84CEKknHuWEJP8olnhUMUjfbzSEjTCrj6GwgZ7hnD1fg
	 kMToMxY9Skb//64z3J++o9QLx0UO0nkngrR499Chd8dP9HyAZa2jyeIcUrx5Hz3Q3V
	 MU723AURzAmvLj6wQ8Mn7Nmr1gIEM96p97PPhEz9cWvs1QqeeyCZsN1iZ8tV2x9C68
	 wBFo8uyAN0oPA==
Message-ID: <sashiko-outbox-179682@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] spi: add KUnit tests for the multi-CS framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonathan Santos" <Jonathan.Santos@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <cb439b0d9a5b0daa5109929debfddee21b56778a.1792435248.git.Jonathan.Santos@analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <cb439b0d9a5b0daa5109929debfddee21b56778a.1792435248.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:08:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] spi: tests: spi_cs_config suite only tests local spi_validate_cs=
_config()
- [Medium] spi: tests: last_cs_index_mask_filters_slots() does not test mas=
k filtering
--

commit c0274670e3ec066a2b9eb903dcadd09d2e349d14
Author: Jonathan Santos <Jonathan.Santos@analog.com>

spi: add KUnit tests for the multi-CS framework

This commit adds KUnit test suites for the SPI multi-CS framework covering
device naming, last-asserted CS tracking, and CS array validation. It also
exposes SPI_INVALID_CS, spi_dev_set_name(), and spi_is_last_cs() in
drivers/spi/internals.h for KUnit testing.

> diff --git a/drivers/spi/tests/spi-multi-cs-kunit.c b/drivers/spi/tests/s=
pi-multi-cs-kunit.c
> new file mode 100644
> index 0000000000000..314de7dc86064
> --- /dev/null
> +++ b/drivers/spi/tests/spi-multi-cs-kunit.c

[ ... ]

> +/*
> + * cs_index_mask only has bit 0 set even though num_chipselect=3D2:
> + * slot 1 is skipped by spi_for_each_valid_cs, only slot 0 is checked.
> + * last_cs[0] matches.
> + */
> +static void last_cs_index_mask_filters_slots(struct kunit *test)
> +{
> +	const u8 cs[] =3D { 0, 1 };
> +	struct spi_device *spi =3D alloc_spi(test, cs, ARRAY_SIZE(cs), 8);
> +
> +	/* override mask: only slot 0 active. */
> +	spi->cs_index_mask =3D BIT(0);
> +	spi->controller->last_cs[0] =3D 0;
> +	spi->controller->last_cs[1] =3D SPI_INVALID_CS;
> +
> +	KUNIT_EXPECT_TRUE(test, spi_is_last_cs(spi));
> +}

[Severity: Medium]
In drivers/spi/spi.c, spi_is_last_cs() sets last =3D true whenever any acti=
ve
slot matches, and never clears last on a non-matching slot:

drivers/spi/spi.c:spi_is_last_cs() {
	u8 idx;
	bool last =3D false;

	spi_for_each_valid_cs(spi, idx) {
		if (spi->controller->last_cs[idx] =3D=3D spi_get_chipselect(spi, idx))
			last =3D true;
	}
	return last;
}

In last_cs_index_mask_filters_slots(), slot 0 is set to match
(last_cs[0] =3D 0 with cs[0] =3D 0) and slot 1 is set not to match
(last_cs[1] =3D SPI_INVALID_CS with cs[1] =3D 1) while cs_index_mask is BIT=
(0).
Because slot 0 matches, spi_is_last_cs() will return true even if
cs_index_mask is ignored and slot 1 is also evaluated.

To verify that cs_index_mask actually filters out inactive slots, shouldn't
this test set the active slot 0 to a non-matching value (such as
SPI_INVALID_CS), set the masked-out slot 1 to match (last_cs[1] =3D 1), and
expect spi_is_last_cs(spi) to return false?

[ ... ]

> +/*
> + * Validate and normalise the CS configuration of @spi against the contr=
oller's
> + * @num_chipselect limit. Arithmetic Analysis only, no device-model call=
s or bus
> + * scan.
> + *
> + * On success the unused chip_select[] slots are filled with SPI_INVALID=
_CS.
> + */
> +static int spi_validate_cs_config(struct spi_device *spi,
> +				  u16 ctlr_num_chipselect)
> +{
> +	int idx;
> +
> +	if (spi->num_chipselect > SPI_DEVICE_CS_CNT_MAX)
> +		return -EOVERFLOW;
> +
> +	for (idx =3D 0; idx < spi->num_chipselect; idx++) {
> +		if (spi_get_chipselect(spi, idx) >=3D ctlr_num_chipselect)
> +			return -EINVAL;
> +	}
> +
> +	/* No duplicate physical CS values within the same device. */
> +	for (idx =3D 0; idx < spi->num_chipselect; idx++) {
> +		for (int j =3D idx + 1; j < spi->num_chipselect; j++) {
> +			if (spi_get_chipselect(spi, idx) =3D=3D spi_get_chipselect(spi, j))
> +				return -EBUSY;
> +		}
> +	}
> +
> +	/* Fill unused slots before the contiguity check modifies chip_select[]=
. */
> +	for (idx =3D spi->num_chipselect; idx < SPI_DEVICE_CS_CNT_MAX; idx++)
> +		spi_set_chipselect(spi, idx, SPI_INVALID_CS);
> +
> +	/* CS values must form a ascending contiguous sequence. */
> +	for (idx =3D 1; idx < spi->num_chipselect; idx++) {
> +		if (spi_get_chipselect(spi, idx) !=3D spi_get_chipselect(spi, idx - 1)=
 + 1)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
All of the test cases in spi_cs_config_suite (cs_cfg_single_valid(),
cs_cfg_multi_valid(), cs_cfg_overflow(), cs_cfg_out_of_range(),
cs_cfg_duplicate(), cs_cfg_gap(), cs_cfg_descending(), and cs_cfg_max_cs())
call this test-local spi_validate_cs_config() helper rather than exercising
the SPI core validation logic in __spi_add_device() in drivers/spi/spi.c:

drivers/spi/spi.c:__spi_add_device() {
	...
	if (spi->num_chipselect > SPI_DEVICE_CS_CNT_MAX) {
		dev_err(dev, "num_cs %d > max %d\n", spi->num_chipselect,
			SPI_DEVICE_CS_CNT_MAX);
		return -EOVERFLOW;
	}
	...
	/* Restrict CS logical values to a contiguous sequence */
	for (idx =3D 1; idx < spi->num_chipselect; idx++) {
		if (spi_get_chipselect(spi, idx) !=3D spi_get_chipselect(spi, idx - 1) + =
1) {
			...
			return -EINVAL;
		}
	}
	...
}

In addition, alloc_spi() initializes ctlr->num_chipselect =3D ctlr_num_cs,
which is never read because spi_validate_cs_config() takes a separate
ctlr_num_chipselect argument instead of checking
spi->controller->num_chipselect.

Could the CS validation logic in __spi_add_device() be factored out into a
helper in drivers/spi/spi.c and exposed via VISIBLE_IF_KUNIT and
EXPORT_SYMBOL_IF_KUNIT in drivers/spi/internals.h so that spi_cs_config_sui=
te
tests the actual SPI core implementation?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792435248.gi=
t.Jonathan.Santos@analog.com?part=3D7
