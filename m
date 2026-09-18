Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE92E22B5
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722664; cv=none; b=goKfdKiix8ZNRJ7xgMD359qLw9GypAjRgKfET0E3GFqqEdeenwzFZM/hMNqpCntnJNEPndUDU8of+ynekU5ks6xlIvzSvDJHBEs3xzmvT8b0yxrbBbaE1U0UIXlT9Ezhg6Ee+ne/ABOJXKi2YIOyYRC8o+zKAEULA/XCJAeIZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722664; c=relaxed/simple;
	bh=JKb/4IW9Rl/O2pCjic+0Q1ufbTA8h+mlWf2G6O72d8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GrxaEEK3XnJrEFnyQfjDGddwz4xvD8vSX4SI0WWp91co8ZWnHkP5smGgEnYWhLQgPJed9kH8YnVwUEFXxsKZ6M6KyFu6Jz160QewzzNUojhpr6o5iCKXpZQ+K5G5yZSu3l4yaIzUbbHA2jKbZzEOeGhFaHBdM5tjYj7ieyC9h20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHAXKFLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHAXKFLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023EB1F00893;
	Fri, 18 Sep 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722663;
	bh=wP0arfMHsA6oCe+6UGoLp2saQOczGI3CaW7o7ddsg9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cHAXKFLI2Vsa4IiL6Eh+929C7aiggguqyRr4DachBjnoQu8JjXSMm+K6qzYNtdt2d
	 X5UOeXbAoF5NJG9KCfWmPCPclKULBAK9fKGFSSfPVLWM5OLWPfCDxKYtXce5GLs5Zx
	 7sR+xwBYpW6UA9FkPLeLe5X4Gl9KmdV6VbGs5DpphuBz4Zna4/VjI5OQqhiRiRqqIo
	 RYex61ve8RhnwjDamQkO8pbAyBf+JlPC9Rm/Y/ke9HL07jLNMak/KxXACSXX6U9fdZ
	 26FPrx8FhiSAARJfPY6yht+h1Xtye1Z8BndmFdhG4Y88c6EP26ZLfnbbvckS8UQ9Or
	 UtqFXTbhM+9sA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/21] media: i2c: it6625: use unaligned/units helpers
 to decode pixel clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-12-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-12-78d72d7886a5@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:11:02 +0000
Message-Id: <20260918091103.023EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: it6625: semantically incorrect constant KHZ_PER_MHZ for unit=
 conversion
--

commit 146d1093ddad76000491939b05b57d1dc7671652
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: it6625: use unaligned/units helpers to decode pixel clock

This commit updates the pixel clock decoding in it6625_get_pclk() to use
get_unaligned_be32() and replaces a hardcoded multiplier with a constant
from the units header.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 328bd99f27cf8..60c79a2277941 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c

[ ... ]

> @@ -633,28 +635,22 @@ static int get_audio_sampling_rate(struct it6625 *i=
t6625)
> =20
>  static u64 it6625_get_pclk(struct it6625 *it6625)
>  {

[ ... ]

>  	v4l2_dbg(1, debug, &it6625->sd, "%s: pclk=3D%u (%08x)",
>  		 __func__, pclk, pclk);
> =20
> -	return (u64)pclk * 1000;
> +	return (u64)pclk * KHZ_PER_MHZ;

[Severity: Low]
Is this the correct unit constant for this conversion?

The code in it6625_get_pclk() reads a pixel clock value in kHz and converts
it to Hz. While KHZ_PER_MHZ and HZ_PER_KHZ both evaluate to 1000, using
KHZ_PER_MHZ here is dimensionally incorrect (kHz * (kHz / MHz)).

Should this use HZ_PER_KHZ instead to properly represent the conversion
to Hz?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-upstream-i=
t6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw?part=3D12
