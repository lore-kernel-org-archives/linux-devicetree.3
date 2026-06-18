Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF333101BC
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769703; cv=none; b=s7EK8OiTM6vGGD+S+BquKi87d5Y557NCr+VAM+folMJ/UnZguDLuh4ZV7VXKiXsbt0Evsff1Uv3lJxZu9c/KHDpEZiibqohg1YhLOVXdyfJ5U51CeMrJ6GwOoNSQgh0rUU2VX2S8aMoVWk5bWEHLXZNrjkqdZYcqfAFn4bJsvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769703; c=relaxed/simple;
	bh=3tXseGrm6uyWTC3VJEmWG0cZXgHrLNkWRhJttxbL3W8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ObIdAv4cC1140VeTjHIdsugT29XvLd8aglmxF1Ej8RQqOjlci3DvsUCURjk1MThQVgwFqvtvP5epEBzfSw4lVG52geAqGImeLyGq0RGn3oBIG9VENoFwaafA1IYA3WC+PPjsPLuA6ymDF5ZXRbx8L7k8s6NflFqV5VmHknR8y20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc99YHsM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc99YHsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FFE1F000E9;
	Thu, 18 Jun 2026 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769702;
	bh=DzLfMBK2D7T5oaHk2tVTd3Yzs7EmHakGl6qrO8aJYno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jc99YHsMlTQhYGq7PvQ9zdffcbTewoUCIZBitdRjjcxEiH9a6Ubo8T76JEamHtuMy
	 bCXqAwNzfBdWTsg9mXZG6/5SqfT56zc8WYROqP8drWIRqoTbYyKgv223wxxzQ+Ocjs
	 GXKd25PBGHepLDptz2LN7/Sm10iNpyp1NjU2+Mlb6vT/sPexSf2tu3Ut0kmswVVlX9
	 PZvaHb3f4/eHyU4k+VKjMSmszgU0JRyKvuzxFyjyvJdwobZNy6WdPCbYbuNDIWDGsX
	 vcOQ5pvzamPLY/1wkFyrDqNWE4e/TttE6GZBiOxJD+999bmhHh1FN4VG7y3TUoAdf4
	 49Z+Mh6bwqy5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/16] mtd: spi-nor: run PHY tuning after init and
 update dirmap frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-17-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-17-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:01:41 +0000
Message-Id: <20260618080142.33FFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If probe steps fail after device initialization, `spi_nor_probe()`=
 returns without restoring hardware state, leaving the device in an inconsi=
stent configuration across soft reboots.
--

commit 7ac575a84edff91451a5b41913132dbcedb404cd
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spi-nor: run PHY tuning after init and update dirmap frequency

Run PHY tuning in spi_nor_probe() before creating dirmaps so the validated
frequency is available at dirmap construction time, falling back to base
rate on failure.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2c9859fb07949..e9e66d28fa52a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
[ ... ]
> @@ -3773,6 +3776,17 @@ static int spi_nor_probe(struct spi_mem *spimem)
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
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_warn(dev, "Failed to execute PHY tuning: %d\n", ret);
> +
>  	ret =3D spi_nor_create_read_dirmap(nor);
>  	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does spi_nor_probe() fail to
restore the hardware state on error paths after device initialization?

Looking at the error returns here for spi_nor_create_read_dirmap() and
subsequent calls like spi_nor_create_write_dirmap() or mtd_device_register(=
),
the function returns the error code directly without calling spi_nor_restor=
e().

Because spi_nor_scan() executes spi_nor_init() earlier in the probe to
modify the physical flash hardware state (such as enabling 4-byte address
mode or Octal DTR mode), returning without unwinding these changes leaves
the flash in a non-default mode.

Unlike spi_nor_remove() and spi_nor_shutdown() which explicitly call
spi_nor_restore() to revert the flash to its default 3-byte/1-1-1 state,
this error path lacks teardown, and spi_nor_restore() is not registered as
a devm action.

If probe fails here, could this prevent the system's ROM bootloader from
reading the flash after a soft reboot, effectively bricking the device
until a hard power cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D16
