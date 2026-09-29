Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3F50E5B0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686299; cv=none; b=iiOHxbGoP1a99we768o++TaTlRIJpGAMdyzuZE+cHqiEbif+P3skSO7qDBEih2F5Ho1wXEiv56KcPcDNPxsMhbRI2KQA/pJZKVU4+4PVP43P/0kEZVUVaAK/NIL0LnWgkGf4SKY9rGMWyyPuEoeTBB9I0vbwuKaLw14E41Kefg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686299; c=relaxed/simple;
	bh=OW2g28Ro+Qikjs2znlc3ERqsB1kY1CnqQWGXwpVGPck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=csPFgVqHdkyGfawVn8JSAncBkep7tGYTyomSlDiUtZ+z9K6mdNnv6KYmkA713yyF9QugMnoQUB05cT7Q2gOtS0+mx7eoics1IcwwDo/0jR18HVm7J1KOY++SPz26F5/fxVsYJHw3BYnGgSt6ODSTW41E5zoXHcsEIUOOkGAaPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD9qWvQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD9qWvQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996AD1F000FF;
	Tue, 29 Sep 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686297;
	bh=jqvwIe9G/16DUannTx9xGOqAsvHio2Ec+D9acmV6n+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lD9qWvQWPidy84nBwQovkwTNDJPu+Z9q/nYLJZrQrC9RZq/O11gQzLIeIOTEAD4w3
	 u3OVN5py9I0CAy1rWTnryfen4RNnc+8tnO627owa2Oj7/nPed09dfdMAtN/0NQ2T99
	 02TEGLcQUYJhapezwVBG1gQiRwWRtDZk0w/aBnEKNSi+ey/tdpyQJ72ZSK77vqatqQ
	 jTByatZRzZywFGTNgtkENl/dtXsdbgRNsUS4Mf5j9Hc0osWIM4KKniu5XywYvKPozb
	 O1t3m7Hb8fix7rm4dF6HaMiaKx77DgQcBNQ94RQPRv1xG9W4b1H4SDgWYXpMM4iu9p
	 l7ZOEuN6rSVjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:51:37 +0000
Message-Id: <20260929125137.996AD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: rzt2h: missing MMIO flush before ndelay() in rzt2h_adc=
_stop()
--

commit 1a5e9531ca2dbd42c2e42cbda9b1697ed221201c
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

iio: adc: rzt2h: Wait for the analog part to stop after a forced stop

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating. This
commit adds a delay after clearing the bit to ensure the hardware stops
before reconfiguring it.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 8ba7b0fde8a19..d53888730f003 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
[ ... ]
> @@ -124,6 +126,13 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
>  	reg &=3D ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
> =20
>  	writew(reg, adc->base + RZT2H_ADCSR_REG);
> +
> +	/*
> +	 * When a conversion is forcibly stopped, the analog part of the A/D
> +	 * converter takes up to 2 ADCLK cycles to stop operating.
> +	 */
> +	ndelay(DIV_ROUND_UP_ULL((u64)RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
> +				adc->adclk_rate));

[Severity: Medium]
Will this short delay complete before the write has actually reached the ADC
hardware?

Since writew() is a posted write on ARM architectures, the CPU does not blo=
ck
until the transaction reaches the peripheral. Because ndelay() is called
immediately afterward and the delay is very short, the CPU might finish
waiting before the stop command even arrives at the ADC hardware.

Does this need a dummy readback (e.g., readw()) to flush the write buffer
before calling ndelay(), to guarantee the stop command has arrived before
timing the 2 ADCLK cycles?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929124248.2370=
32-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
