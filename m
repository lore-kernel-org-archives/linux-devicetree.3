Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732370;
	b=vYhZGZYarpGMjfdjhu1yzHz+TglLShC0bXlms1qklbI6jikSdHq4NEIwBvTLhKdeqlxZ
	 z7PjAs9lqsVrzpK2kKnC8MmJf2fY6YE73JSejyCIT0Fs+KBsPZFODHObLJVFkXLyisitt
	 CFMl0+pOZp6pyEqa9J5503/zH3vq0Np+M2vKX37AW2kRMPzn5/ZEsJ/xii2MnUe3CQMCr
	 UFNLaqoh3YzocQYgecoMFbKUCKeL8B30z0l0cel9FvMeHWww8r9gydkkjSJyweimi5abk
	 Rai2CumSer4XWgKedLohyOYaqJVsVcVRVo1uroS/PrSZV0xyfJdS9pvfxcFgGEFPUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OS22PSJEXDHAtqwm5cqM8Xp7o95NLRABb8fia/4aHKg=;
	b=38Bux9Osn2LRgo5g4hnbICQmOqJG5yELQMUjEUkbG46DTySi3VW3Ztgt2tfzZtjCyrWZ
	 Aje5FCJZg7Bfa+FRNWkNPG2TUp1hlNI2JpJRo8kSaVjr2efHl4Nh1DUBlcdTN1gIsba4K
	 BWzz/+dwcepiu7prFQqLCOUUOOOanZX5t2NNNPYMJPlRGY4O0yVoalZl8wm2BEN1eDa+n
	 Y4qdlWrA5oDEqSOGjJ7Ok2oxEL/RVm2RBBuFYWIm2uQ8fayuLDQC5lvKP+WHZbeHLnrYq
	 OyRpV3Oee4Q6xQz4NdtKL9hhZTfpB56H5waP+YdQ3AHY0rV1ykaizwgborOBPVImWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FE7PAo6h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6B4606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FE7PAo6h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45E31F000C4;
	Sun, 15 Nov 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732369;
	bh=OS22PSJEXDHAtqwm5cqM8Xp7o95NLRABb8fia/4aHKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FE7PAo6hopZYzJ3Foxj++aULto02zvwORfc+hYYlkeEa0jyK9+fMikWz7ieYqR6DT
	 4SHX6xXNl/boI6//2s8G6HXZb9piJ2HUl6FQxTcej6Yvw3l2KYIqWi5hVNxZPqT785
	 8bJXdn7UJ7rLDJ24wOyasQ1QOQuvHx68k2lnYuUhU3wmAqw9Ar1uk60qvptwICGPha
	 KndMJC1jQ18KYSjuGLzRGh4ROfUGmKWoRbPTidz2ZSIjqW0Fm85NzgHI91BBC4xKi1
	 /xQvFQkptulaJy+l7ZNeQoOtLUGtdBZbSEQXmvsnlbmiWZSi/Xzojym6tsQc0Aw4hv
	 i6EQY0932vlHQ==
Message-ID: <sashiko-outbox-215304@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] iio: light: ltr501: Switch to read_avail() op
 from manual attribute registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115083741.62140-2-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
 <20261115083741.62140-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:46:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: light: ltr501: out-of-bounds write in ltr501_probe() gain
  table init
--

commit 738578de8560e9585a0ad5b6cdbf8ce32003ccdc
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Switch to read_avail() op from manual attribute registr=
ation

This commit switches the ltr501 driver from manual sysfs attribute group
registration to the IIO read_avail() callback and consolidates the
per-chip iio_info structures.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 24733607d1b49..3662aed5225bc 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -164,6 +178,8 @@ struct ltr501_data {
>  	struct regmap_field *reg_als_prst;
>  	struct regmap_field *reg_ps_prst;
>  	uint32_t near_level;
> +	struct ltr501_gain als_gain_tbl[ARRAY_SIZE(ltr559_als_gain_tbl)];
> +	u32 als_gain_tbl_len;
>  };

[ ... ]

> @@ -1548,7 +1500,16 @@ static int ltr501_probe(struct i2c_client *client)
>  				     &data->near_level))
>  		data->near_level =3D 0;
> =20
> -	indio_dev->info =3D data->chip_info->info;
> +	for (int i =3D 0; i < data->chip_info->als_gain_tbl_size; i++) {
> +		if (data->chip_info->als_gain[i].scale =3D=3D LTR501_RESERVED_GAIN)
> +			continue;
> +
> +		data->als_gain_tbl[j++].scale =3D data->chip_info->als_gain[i].scale;
> +		data->als_gain_tbl[j++].uscale =3D data->chip_info->als_gain[i].uscale;
> +	}
> +	data->als_gain_tbl_len =3D j;

[Severity: High]
Does post-incrementing j on both assignments overflow data->als_gain_tbl[]?

Because data->als_gain_tbl is an array of struct ltr501_gain rather than
int, incrementing j twice per iteration splits each gain entry across two
adjacent array elements (leaving the other field of each element zeroed)
and advances j to 12 for chips using ltr559_als_gain_tbl (6 non-reserved
entries).  That writes 4 elements past the 8-element als_gain_tbl array,
overwriting als_gain_tbl_len and past the end of struct ltr501_data, while
leaving corrupted scale values for ltr501_read_avail().

Assigning the struct in one step (data->als_gain_tbl[j++] =3D
data->chip_info->als_gain[i]) and setting data->als_gain_tbl_len =3D j * 2
would avoid the overflow and give ltr501_read_avail() the expected int
count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115083741.6214=
0-1-clamor95@gmail.com?part=3D1
