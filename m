Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC03F413A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724178; cv=none; b=J4GjbJl34Zw/gFJugg1pTXxvXcujtj3IAVpcvwQOSnv++OfUS5ynz8KZGTK6014stDs+tnkWRx9GBrBRqLKT6nsR3+IcEI9kdJKKNFhf2vlFC5l13ItJOIG0MzaiLDdoY7i0s7YPsgsvWfOiksDYNJahchVgmQ6tolKTmoIfBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724178; c=relaxed/simple;
	bh=S3aoBbYiav/AkxzLyfItp3DumOz73SBXmalkC7iKKsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dMCUk/LetY7bQYHUZB1LH4KlDu+h2Er5YqIa9pF6Yqz6ccKiWiP0o0xYfo33tvCGeszwcQMxyTWOwdQNVQ1JMc36I38/3x57s+ofJkrad+Lvwz6w5zMsU1QU87YrKI9p8L+jE4WWLwYgeg+8I3uN2+aXvT8wVfZ4UGTnvn1mkbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkU9HqcR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkU9HqcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F3CC19425;
	Thu, 14 May 2026 02:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778724178;
	bh=S3aoBbYiav/AkxzLyfItp3DumOz73SBXmalkC7iKKsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UkU9HqcR0zF1+pS7KyQi3ZPaWGlaotHHiS0ThX6CRsEBqe2eGyoe417tO/HoPH47E
	 orLFyMaYFlqP7ABdgA7OamcV0w+iLjyqmskz3jYCzAzOaozOgVBLRlcIjPuhzElghl
	 SY1svOd3bh/tpwr1XrDK4/pqckaVg5pS4qRyXbLnjLh6/9wn0k721JxRZKUq9tEMdK
	 IVSOgQGj+iU+zFi6fwokR4i8i8r4vlc9TCRZK4TI7vFFANIcSXgIB7FtSV2OUeFaXo
	 e2P1F2byVcPgci1quHvyCmtgR8iMxPX54IL2y+kYpDc9h6LUNLgOasnjv+1HrZguu8
	 yGBpMzCIyxSvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 06/11] iio: imu: inv_icm42607: Add Buffer support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512221634.256747-7-macroalpha82@gmail.com>
References: <20260512221634.256747-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:02:57 +0000
Message-Id: <20260514020258.15F3CC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Hardware FIFO stream corruption via inadvertent read of FIFO_D=
ATA register
- [High] Uninitialized variable and inverted bounds check in FIFO parsing l=
oops
--

commit 1ef48549ddf09f109d55e87b2f2e81329ea2a547
Author: Chris Morgan <macromorgan@hotmail.com>

    iio: imu: inv_icm42607: Add Buffer support for icm42607

This commit adds buffer support for the inv_icm42607 hardware by implementi=
ng
FIFO parsing and reading functions.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> new file mode 100644
> index 0000000000000..0919b4241241a
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c

[ ... ]

> +int inv_icm42607_buffer_fifo_read(struct inv_icm42607_state *st,
> +				  unsigned int max)
> +{
> +	const void *accel, *gyro, *timestamp;
> +	size_t i, max_count;
> +	const s8 *temp;
> +	ssize_t size;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* reset all samples counters */
> +	st->fifo.count =3D 0;
> +	st->fifo.nb.gyro =3D 0;
> +	st->fifo.nb.accel =3D 0;
> +	st->fifo.nb.total =3D 0;
> +
> +	/* compute maximum FIFO read size */
> +	if (max =3D=3D 0)
> +		max_count =3D sizeof(st->fifo.data);
> +	else
> +		max_count =3D min((max * inv_icm42607_get_packet_size(st->fifo.en)),
> +				sizeof(st->fifo.data));
> +
> +	/* read FIFO count value */
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_FIFO_COUNTH,
> +			       st->buffer, sizeof(u8) * 3);

Does reading 3 bytes here fetch the COUNTH, COUNTL, and FIFO_DATA registers?

If so, could this inadvertent read of the FIFO_DATA register automatically
dequeue 1 byte from the hardware FIFO?

This could cause the subsequent regmap_noinc_read() to fetch misaligned
packet headers, corrupting the decoded sensor stream. Should this be a
2-byte read instead?

> +	if (ret)
> +		return ret;
> +	st->fifo.count =3D be16_to_cpup(st->buffer);
> +
> +	/* check and clamp FIFO count value */
> +	if (st->fifo.count =3D=3D 0)
> +		return 0;
> +
> +	st->fifo.count =3D min(st->fifo.count, max_count);
> +
> +	/* read all FIFO data in internal buffer */
> +	ret =3D regmap_noinc_read(st->map, INV_ICM42607_REG_FIFO_DATA,
> +				st->fifo.data, st->fifo.count);
> +	if (ret)
> +		return ret;
> +
> +	/* compute number of samples for each sensor */
> +	for (i =3D 0; i < st->fifo.count && i + size > st->fifo.count; i +=3D s=
ize) {

Is the size variable uninitialized on the first iteration of this loop?

Also, is the i + size > st->fifo.count condition logically inverted? This
appears to require the packet to overflow the buffer boundaries to continue,
which could cause the loop to terminate prematurely or not run at all.

Could this inverted logic allow a partial packet to bypass boundaries and
cause an out-of-bounds read inside inv_icm42607_fifo_is_data_valid() later
in the loop?

> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp);
> +		if (size <=3D 0)
> +			break;
> +		if (gyro !=3D NULL && inv_icm42607_fifo_is_data_valid(gyro))
> +			st->fifo.nb.gyro++;
> +		if (accel !=3D NULL && inv_icm42607_fifo_is_data_valid(accel))
> +			st->fifo.nb.accel++;
> +		st->fifo.nb.total++;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D6
