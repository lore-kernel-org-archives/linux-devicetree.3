Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA58366066
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210698; cv=none; b=qRyfuXlxnXhRMX+fgYERq8rZ5mrgUGe5/pcTbkrLElel17FmQ7dKLlW7BP891BXTFUTgFNuNps5l7C/4zfV210btpxSMyZqjAIibkzI+GjeLFAgYEG/PSjgIzaGDZmuDxAdaJhSgugPP97bAs6hURQ31DboXMzC+jaK+UzcNTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210698; c=relaxed/simple;
	bh=y1VJXLyb6OMYWllN3OZHENRArO02DydREHzfXVD+hnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tw4hPtAAQPhGA1V3qoqVmdvd0od3Ig6jEMNVuIPgo4blWGkDvWiW7bAf4wfILAUJGhDXZ91kuHix53M74n5mGqvBSAWrMjkKfwUBJXGcO3nAaZPR9Tmp1cqX+uE5gyqnX7FIHMlGYlExSHL2cSV1Qto3mds/MfA3OWuTbbk6Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeuyW/Dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeuyW/Dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4881F000E9;
	Thu, 11 Jun 2026 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781210697;
	bh=mWYcpZA/VqJ7Tlis3jLPaXGScN4KrFhkj3ZD+vvSx9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DeuyW/Dqf1NMIXXi6D+oCi3oO2C0xdgVbrUsmhOg+EdA7wTRW2qg25q2qDET3Wfsa
	 Y2tyMhPZBPAhuSgNFm37xiWFvWpMbEpDG90C5QLhxSoh5wt5Vx5+w3Uq4qkyaAAX6o
	 Fv8kQKCXbiWbVeAGyEuJZYkrY9iVy4tSXw2ge22n9Lqo4kXq+EflZdDIHfzXkcLJ3N
	 hTL0TDl37VusRilcYf/zozKymkKcsPdkKkWRZZrPzAxbvtQoKNVTQNY+GnXiDZKvBv
	 f6vMeDoJQMRil0KeZyAYtzpqJx6vDplkjXkW85Eq8fdo0zWqiiQOrAc9li5X4rE3wR
	 XDho3SKuz3Dhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V12 8/9] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260611202607.85376-9-macroalpha82@gmail.com>
References: <20260611202607.85376-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 20:44:56 +0000
Message-Id: <20260611204457.1E4881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DMA cacheline sharing vulnerability due to `buffer` placement with=
out trailing padding.
--

commit ffab596572628e0ee5392f57ffbac77ad2c58f08
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: iio: imu: inv_icm42607: Add Gyroscope to icm42607

This commit adds gyroscope functions and IIO device registration to the
inv_icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/im=
u/inv_icm42607/inv_icm42607.h
> index 91ac75bb719e2..ddb354fc57abe 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> @@ -142,6 +143,7 @@ struct inv_icm42607_state {
>  	const struct inv_icm42607_hw *hw;
>  	struct regmap *map;
>  	struct iio_dev *indio_accel;
> +	struct iio_dev *indio_gyro;
>  	struct regulator *vddio_supply;
>  	struct inv_icm42607_suspended suspended;

[Severity: High]
Could the structure layout here cause a DMA cacheline sharing regression?

The DMA-mapped buffer array is defined at the beginning of struct
inv_icm42607_state. While its start is aligned to IIO_DMA_MINALIGN, its
size is only 6 bytes, and no padding separates it from subsequent members.
Consequently, the buffer shares a CPU cacheline with other struct members
(such as hw, map, and lock), depending on the architecture's cacheline
size.

When regmap_bulk_read() triggers an SPI DMA transfer, the SPI core maps
the buffer with DMA_FROM_DEVICE. If another thread attempts to acquire
st->lock while the DMA transfer is ongoing (for instance, reading from the
other sensor exposed by the driver), it will modify the mutex wait queue,
dirtying the shared cacheline in the CPU cache.

When the DMA transfer completes, dma_unmap_single() invalidates the
cacheline, silently discarding the concurrent writes to the mutex. This can
corrupt the mutex state and cause blocked threads to hang forever, leading
to a system deadlock.

Would it be safer to move the DMA buffer array to the end of the structure
so that the IIO_DMA_MINALIGN alignment guarantees it occupies its own
cacheline without trailing members sharing the space?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611202607.8537=
6-1-macroalpha82@gmail.com?part=3D8
