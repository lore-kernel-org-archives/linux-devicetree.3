Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8D3D1AA0
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212598; cv=none; b=XpOyrs5Revaj2qN/ipWknMmGovahiJdjBE+UhsMKRqFkGJiUFgnn7QJN6+U8MQ6Nm8rgxUvcqV2luBmxxmVyYu8KSN0d1cXLfi9RpcrlvuIUdoo0vj9nAy8ekjIDUBIbCXUZackHj5YEbmum/dVwD0p0o3VXO0BfzxPb51TbSx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212598; c=relaxed/simple;
	bh=SYgBo7ET/7xg1LQhKiogbvgvYfZS0mYrVznf2X6/4tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MjUNLR9+cj3v3ga4+8azAIQIijATTQRT+q60Jzq4bQtVI22PRyhD3UmOYR+KabRJ0nXfNce+Nsq4x7kUCb+f+DMKLl8bHYQJat8K8AREU1qi3mwNoQU4U4995CZSTI7LzLC7DX9TJ+sGv9OR9F07Ej/1FGgSURewXdLPG2u9gWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOIbX35W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOIbX35W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DEA1F000E9;
	Tue, 23 Jun 2026 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782212597;
	bh=eUO0/8Wt17VMEgXVEw35ukQ8tqRNjvaljQtqVUNaNeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOIbX35WVplJzGIlsd1Qb8BqqsJKME4znkoXTe0qCJZ4oeKppo4cUK2XXIEGBwqJ+
	 8TAeWsQRN//b3EsGo+pTMl1VFG02qXRbm4qzFNympG32YOz1O2lTwt0NaKt6E0cqIQ
	 z/aSHN+TeITtxGF1WXiAK4dFBUm8iJuZvWhLrIT+qyrlYh1rn26D3rUjw7d93OWdlr
	 wfLDlfpukSsDnPq33Drl9KUV6/jzz8W6ry3k6mSjjTX4z2TzoL+R6SnQl/UCpNMjib
	 RrkqgMQkv+/HojXFF83QY8F1a2RULR/l+V25BIrf02EsQSSokrwtpNSiGBm9ytnu/i
	 0vQl76Symcjeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] iio: dac: ad5686: consume optional reset
 signal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-ad5686-new-features-v4-6-28962a57db0f@analog.com>
References: <20260623-ad5686-new-features-v4-0-28962a57db0f@analog.com>
 <20260623-ad5686-new-features-v4-6-28962a57db0f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:03:16 +0000
Message-Id: <20260623110316.E2DEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing power-up/reset recovery delay after reset deassertion.
- [Medium] Ignored return values from reset control operations.
--

commit 6b4f1604bc9722fb4790d1198babf7ca8eb4d482
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: consume optional reset signal

This commit adds support for an optional reset control in the probe
function. It manually generates a reset pulse after the device is
powered up.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -509,6 +516,11 @@ int ad5686_probe(struct device *dev,
>  	/* 4.5us power-up time: Datasheet Table 4: Timing Characteristics */
>  	fsleep(5);
> =20
> +	/* 1us >> 30ns reset pulse activation time: Datasheet Table 4 */
> +	reset_control_assert(rstc);
> +	fsleep(1);
> +	reset_control_deassert(rstc);

[Severity: Medium]
Should we check the return values of reset_control_assert() and
reset_control_deassert() here?

If the reset controller is backed by a fallible bus (such as an I2C or
SPI GPIO expander), these calls can fail. If deassertion fails and the
return value is ignored, the driver might proceed while the hardware
is still stuck in reset, causing subsequent bus communications to silently
fail.

[Severity: Medium]
Does the hardware require a stabilization delay after the reset line is
deasserted before we start communicating with it?

Similar to the 4.5us power-up time handled above, if the device needs
recovery time after a hardware reset, proceeding immediately to the
initialization and first register writes might result in corrupted or
dropped commands.

> +
>  	/* Initialize masks to all ones */
>  	st->pwr_down_mask =3D ~0;
>  	st->pwr_down_mode =3D ~0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-ad5686-new=
-features-v4-0-28962a57db0f@analog.com?part=3D6
