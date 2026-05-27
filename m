Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7233EAF3
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908377; cv=none; b=gAPUcvUxKlnc/BSa5MQ5xBbesTJWtfzX8zBmgUFhEM/rtcnZb6iwaqVLRkuQEqgtKSBggz1Ue6kyXspWClpB9+9Yp9ek8I2rOnZUdHo3o/+sJamgZ89PAs4vhy3T4IMw+rhFqDvupRmoiPb4g4/sDmFQnldjBRr4XWoDYI0ZyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908377; c=relaxed/simple;
	bh=4zuyREOC5lgNYrra6Fz8g1kPV4iWaLfUYtpE31MFce0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSMC+rPRnKI/s+9PG+OojfNXQ6YurgoER+tJHIZauBqQIsuamMidHK06E6q9WT8Sngy4gsUs/ZCI6eOrDGsZjq8pdab8vUnpjKaNP/JTaDgd/F6OGOqGFNmwg5G/IzBFQn/yBQ/Hnh7jfRd5n3Xd0rMBjQWHLg0sn9pZkRxQt0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgLcanAt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgLcanAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5221F000E9;
	Wed, 27 May 2026 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779908376;
	bh=tHRJSLkrOAz4FvGXxpzbFy8Fq+Q4G/iqZA7z/IhfG+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgLcanAtPggLy4Wk3jaWgW67I4GCc8cSMmH+DzvviGCZ9VV5qx3nGVV1Wnz3BIBan
	 7pRRMl6aCJK/IysHjlAv/xqioVcCxS1a7mKK7NJ/ZeJbLaZUPL3+e5vILNKG/Soh7V
	 gcbfuZw3f9RHFJ1BFgS/L9T1RRG6uOhjcNyxPUX+Zl39vjR0TY0fibiPPJB+DADshT
	 KznMWyiLAAiFrIyTcRYzS//LzsUNVFaSNjJTv5M/jyh+E6hceiNOY1wDqeY7TEfFsM
	 VacBZOqgzkwo7/kOVtrVK4ZninFuz+zTPZpIUkMin/1jG4in95QmYqbrLi+Aneo5tw
	 vz3GSaTOK47xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/13] mtd: spi-nor: run PHY tuning after init and
 update dirmap frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-14-s-k6@ti.com>
References: <20260527175527.2247679-14-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:59:35 +0000
Message-Id: <20260527185935.CA5221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Tuning is executed after dirmap creation and patches the dirmap st=
ructure directly, bypassing the controller's hardware configuration phase.
- [High] Tuning failure bypasses the base frequency cap for fallback dirmap=
s due to conditional patching.
--

commit ad67f29c6fb3475170cb4cfded7c7f162b82e81d
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spi-nor: run PHY tuning after init and update dirmap frequency

This commit introduces a persistent max_read_op field, populates it with
the read op layout, and runs spi_mem_execute_tuning() after dirmap
creation. It then updates the dirmap's op template with the validated
frequency so subsequent reads use the tuned speed.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2c9859fb07949..207e0679549ec 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
[ ... ]
> @@ -3773,6 +3776,9 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  			return -ENOMEM;
>  	}
> =20
> +	/* Populate the persistent template with the correct op layout for tuni=
ng. */
> +	nor->max_read_op =3D spi_nor_spimem_get_read_op(nor);
> +
>  	ret =3D spi_nor_create_read_dirmap(nor);
>  	if (ret)
>  		return ret;
> @@ -3781,6 +3787,19 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	if (ret)
>  		return ret;
> =20
> +	/* Tuning failure is non-fatal; the device operates at base speed. */
> +	ret =3D spi_mem_execute_tuning(spimem, &nor->max_read_op, NULL);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_warn(dev, "Failed to execute PHY tuning: %d\n", ret);
> +
> +	/*
> +	 * The dirmap was created before tuning ran; update its op template
> +	 * to use the validated frequency.
> +	 */
> +	if (!ret && nor->dirmap.rdesc)
> +		nor->dirmap.rdesc->info.primary_op_tmpl.max_freq =3D
> +			nor->max_read_op.max_freq;

[Severity: High]
Does patching the dirmap template directly bypass the hardware configuration
phase?

During dirmap creation via spi_nor_create_read_dirmap(), the SPI core calls
the controller's dirmap_create callback to configure hardware registers,
clocks, and memory mappings based on the operation template provided at that
time.

Since the template has a frequency of 0 before tuning, does mutating the
frequency inside the descriptor post-creation leave the hardware controller
unaware of the validated clock rate? If so, native dirmap reads might
permanently execute using the unvalidated hardware configuration.

Would it be safer to run spi_mem_execute_tuning() before creating the
dirmaps to ensure the controller sees the correct frequency?

[Severity: High]
Can a tuning failure leave the fallback dirmap operating at the maximum
unvalidated speed?

During spi_nor_create_read_dirmap(), if native dirmaps are unsupported, the
SPI core uses a fallback path that passes the op template to
spi_mem_supports_op(). This eventually calls spi_mem_adjust_op_freq(),
which can mutate the template's max_freq from 0 to max_speed_hz.

If tuning fails, the conditional block here skips synchronizing the
template back to 0. When fallback dirmap reads are later executed, the
spi_mem_apply_base_freq_cap() logic will see the op explicitly set to
max_speed_hz.

Could this cause an untuned device to bypass the conservative base frequency
cap and incorrectly operate at maximum speed, risking data corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D13
