Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EE32DCF45
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516844; cv=none; b=Hb+YiqNzfWGadScSjDSI0qO7K0bdIRVrsPPzBxjMjnKNBI/10z9Sbe7wrkrBanm0PO2sGiHAAb9u+2BVZ42TlW6MvG+lHCIrRr4ybEkCgBC/Ze0lwAHs0+9zjmDSfiDlOA7rvJKr/4eBUjQsic70hjoHKMgsjyYMtH/TSMZJrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516844; c=relaxed/simple;
	bh=fv1JW4+105B677wuHHIIpkevdQkYozYdmIDnlh3VszY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fon80JZsAyoJmn+FDDBZhENuvFMxmOAvuFW8F6RsZAQL0hjUhI/TH+PxXYbAyb4tdoPJyvMdJgVC31+Zvw2L18eBxRGJ823uPs8er/fipjy8N6vMpQLSauwu7kYPhbcd2Zvyo4CzLL0nM/O4QY9WPaslXknj739fBZOxDG8CZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeLbgbxb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeLbgbxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF92C1F00899;
	Wed, 16 Sep 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516843;
	bh=cUzsMEldnvZauxkhbcXtyMfYfTraUW6L3Ydxm5kXKy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IeLbgbxbOh/6aaeffrEB4A4o4OFJW5udH4knfXJVyJTpzDHfnlGeY0vjk5hw4UDZ6
	 pQuIveeu8r5VWSW9YkpeNKkuTxzPwlrkAqfUaIHJiYEtICpahGI9068/IFKK1AiESY
	 7+3jzd3IwKJCx3zEDBk1pO6Qq7uEXhMiZ6k6vR9VFXJOV7Gf4T3JJh2iGUthyvqle8
	 XSvv5IJcGVlijYBPsxFRZOFs/Jo9UgdYW9gUk/jqrW0sxCXoVZ92I2NRFQX8FyEuGe
	 wdXOap4w+msgT9cNTaLcsYdWk5fZ56N7HtObOMqCcSSrtJPw7nGF8D/4hBzInHRcLN
	 4VXWMbHy+NUVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 13/15] dpll: sit9531x: add support to get
 fractional frequency offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915000015.80480-14-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-14-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:42 +0000
Message-Id: <20260916000042.EF92C1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: hardware debug registers left permanently unlocked after F=
FO read
--

commit 646045e3cead4abd726338075ac84407fac3714f
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
dpll: sit9531x: add support to get fractional frequency offset

This commit introduces support for reading the fractional frequency offset=
=20
(FFO) of a PLL's reference on the sit9531x device. It achieves this by=20
comparing the running divider of the feedback loop to the configured=20
divider through the chip's debug window.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 356d1eac4ec54..88bfa63b29755 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -1224,6 +1224,76 @@ static int sit9531x_is_xo_doubler_enabled(struct s=
it9531x_dev *sitdev)
>  	return (~val >> SIT9531X_XO_DOUBLER_ENB_BIT) & 1u;
>  }
> =20
> +/*
> + * sit9531x_dbg_sample - latch and read a signal pathway debug sample
> + * @sitdev:	device pointer
> + * @pll_idx:	PLL index (0-3)
> + * @read_code:	which tap of the pathway to sample
> + * @buf:	result, least significant byte first
> + * @len:	bytes to read, at most SIT9531X_DBG_DATA_BYTES
> + *
> + * Return: 0 on success, <0 on error
> + */
> +static int sit9531x_dbg_sample(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			       u8 read_code, bool low_freq_clk,
> +			       u8 *buf, unsigned int len)
> +{
> +	unsigned int i;
> +	int rc;
> +	u8 v;
> +
> +	if (len > SIT9531X_DBG_DATA_BYTES)
> +		return -EINVAL;
> +
> +	rc =3D sit9531x_write_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_DEBUG,
> +				   SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		return rc;

[Severity: Medium]
Does this error path leave the PLL debug registers permanently unlocked?

The debug window is unlocked at the beginning of sit9531x_dbg_sample() with
SIT9531X_PLL_DEBUG_UNLOCK, but it appears there is no corresponding lock
operation before returning. Leaving it open could expose the device to
unintended writes or internal state corruption.

[ ... ]
> +	for (i =3D 0; i < len; i++) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DBG_DATA_0 + i,
> +					  &buf[i]);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Similarly, does the success path also leak the unlocked state?

As documented elsewhere in the driver for this hardware, leaving the debug
window open would mean normal monitoring permanently unlocks the block.
Callers of sit9531x_dbg_sample() do not appear to relock the registers upon
completion either.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D13
