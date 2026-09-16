Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAFD378D9A
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546495; cv=none; b=O82svklWutmiZz8QIIWr3z5J3/iQEIyzWYcAJTo9eY2sES95xQxL7kf9r8o4GUx7nbn23vZX/s9WGQ+fQsTMof6GMdyT9dMilmpZm6GEcFzX8yDjJRsyAq7yzvZvILRtxpnNTBVpOf10vxsWfytLRANYtCUyO862lCmPZYhoH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546495; c=relaxed/simple;
	bh=+HvGC+90yunmJuQ3AUNpTBuqVz17iL9afEC4jlzvKKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aypy4fPhChLKwKAAFiEBSny+jzZmDmfOjaBCtksF905ESE/qzVRHE8D7KBA0cvQkeXdlUSkZVu+C+wwRZ/EsNBLzUB8NBMNAJU6kQXp6BIAq/VeEuN8jwJPNrnu+1JphLwYw53+ASYDKTJaMOUQpUO0MsKlXQ28kP59lKrBv77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogQhsAyj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogQhsAyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9311F000FF;
	Wed, 16 Sep 2026 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546485;
	bh=ny/1efHkXCo1qlBZf0DPxl8bVzh5aB2/bSzECInMrYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogQhsAyj38QUTMJGEjnb6y0wpAYvfVtJK4Eav45PwBjLQnL49ezeLHbYiWp6dlopp
	 ZzSmLx5EXMY9aaX8RjiGNMt8+zNAbsEljHQMhfITRswEWkiDcU9/9oGzSqJ3jd9HXI
	 z8QhSAIPupUaJgb1RSz5jH9HlEjElUtEsyj8mLzn4OnsskmnXCGO9RkKwj+jg9evFT
	 Pg8YKpIYPXfR3ay++vqnrxPtaLxYuVWAQyg8wResv+pVWXy9GX6lhNiOr3t2vaorXz
	 VcxvmK7QqY7hVTzk0SwWvyKRm2Iig4tqWHDnIuuyVJlDRaP2L6B9pLjEiXmw3/YEFk
	 oNxvazgx775Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/10] iio: accel: mma8452: Add comment block for
 struct mma8452_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-mma8452-open-drain-v9-7-0dd24fa2f3d7@geanix.com>
References: <20260916-mma8452-open-drain-v9-0-0dd24fa2f3d7@geanix.com>
 <20260916-mma8452-open-drain-v9-7-0dd24fa2f3d7@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:14:44 +0000
Message-Id: <20260916081445.3F9311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] doc: typo in mma8452_data kernel-doc comment
--

commit 984d9aedf92a8a6dbe4c1ae78737aa03bd9dfc22
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Add comment block for struct mma8452_data

The struct mma8452_data is central for this driver, and it makes sense to
have a description of the fields in it to make it easier to work with the
driver.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index b70bc86381280..223bef4f7baf8 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -104,6 +104,21 @@
> =20
>  #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
> =20
> +/**
> + * struct mma8452_data - IIO device private data structure
> + * @client:			the I2C client object
> + * @lock:			mutex for synchronziation of register

[Severity: Low]
This isn't a bug, but there's a typo here (synchronziation).

> + *				read-modify-write sequences and holding chip in
> + *				STANDBY mode while writing to registers
> + * @orientation:		mounting matrix, flipped axis etc.
> + * @chip_info:			chip specific data
> + * @regs:			reference to voltage regulators
> + * @buffer:			triggered buffer
> + * @sleep_val:			time in ms to sleep while waiting for drdy
> + * @ctrl_reg1:			CTRL_REG1 register shadow value
> + * @data_cfg:			DATA_CFG register shadow value
> + * @open_drain:			true for irq pin in open-drain mode
> + */
>  struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-mma8452-op=
en-drain-v9-0-0dd24fa2f3d7@geanix.com?part=3D7
