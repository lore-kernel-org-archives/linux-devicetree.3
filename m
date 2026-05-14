Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD33A5E82
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787579; cv=none; b=kjy33sUGETg1Ml6YTNuV2oo5ik7wWPGRQwsrmOW2gdvTHga25wqynaJEAHmKEZ2VoyWUyDJjohaAORvPwqv6s8Ou3qiXqJJdwHJirKL4Y8OPzZi8t7fdggRckHkwPEwXp4ieW/dmYHg54kG8yymIqxW67R/PgPLm0NmBrhviuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787579; c=relaxed/simple;
	bh=msSf4L6GiQrO/DKqO+RtEyg9I1CF0NW45IDKWijPB0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C9tMzt3ed8TKUyLVVlzgZ29F+luqZn26Z+jiRoEZVxJEcmHhmvn+rw91WkAQEbRqxFdeJxU1vkXIkHMEr7XYdf+YF0MJqJ0BVXiNV7U8JwJWMoqlhmWXfTjamzUqoqwDGaO1svkKiz8o4X6XAk7oYBLU5Ng9k5vzr0rc79UDL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChX3TwhD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChX3TwhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04706C2BCB3;
	Thu, 14 May 2026 19:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787579;
	bh=msSf4L6GiQrO/DKqO+RtEyg9I1CF0NW45IDKWijPB0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ChX3TwhDfNIqMHwBtVQFZPOVq08iyinzpBOMtPIqVZycEkq9ppP8ADT3QqUr0Ti+t
	 M+RhOtn888JvheSqrTfxUR+u4Hd2n2FhweKkB62jwrCas9yjXyAIOIHZZU/SpSuNwK
	 uKYVWPPwG4OhfjxVWrjTnZk5CAVnKuAQJwiiumWHWm3dg4scRL8kTJGhfJXjk8V+wA
	 QsdKFwkYUBO+kTTAAPWrGPrWUlJBH2uBHNpAG4qMPAzYQlDGd18/26uB6EAeSsL0iC
	 OFkc6fbu6wnepiMuP830bYydD++nOkEDIEGSTFgmUq1TAfaHSYthN/y+iBCcoOb86o
	 HVe4R8NZzpF9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] iio: temperature: ltc2983: Use local device
 pointer consistently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514144712.64374-3-liviu.stan@analog.com>
References: <20260514144712.64374-3-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:39:38 +0000
Message-Id: <20260514193939.04706C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added 'dev' variable in `__ltc2983_chan_assign_common` is=
 declared but never used, leading to compiler warnings.
--

commit cab83c99167bc9d0ae1294b92a3bded27d02aabf
Author: Liviu Stan <liviu.stan@analog.com>

iio: temperature: ltc2983: Use local device pointer consistently

This patch adds local dev pointers across various functions in the driver
to replace bare references to st->spi->dev.

> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/=
ltc2983.c
> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c
> @@ -351,6 +351,7 @@ static int __ltc2983_chan_assign_common(struct ltc298=
3_data *st,
>  					const struct ltc2983_sensor *sensor,
>  					u32 chan_val)
>  {
> +	struct device *dev =3D &st->spi->dev;
>  	u32 reg =3D LTC2983_CHAN_ASSIGN_ADDR(sensor->chan);
> =20
>  	chan_val |=3D LTC2983_CHAN_TYPE(sensor->type);

Does this leave the newly added dev variable entirely unused?

It looks like the dev_dbg() call immediately following this still uses
&st->spi->dev instead of the local dev pointer.

This will cause an unused-variable compiler warning, which breaks builds
configured with W=3D1 or -Werror and can harm bisectability.

While this oversight is fixed later in the patch series in commit
7aff450fb9c7b5749766cff8040dd8d12bc74f0c, each patch must compile
cleanly and independently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D2
