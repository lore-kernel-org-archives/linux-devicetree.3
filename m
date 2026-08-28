Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CFF2248B3
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930110; cv=none; b=RR5rVbMlPE8MPirkEskPD13A/7lfLrgy3uS7GMI1BFbykLdIhovmhnbaUnUu/smEjuYamLgPL3j0psWrvvkvCszJxDNQ7UC//2tIYPQpmN26pEMT2JgM2HqGhLWql5tSa9Ll1Qros3LLvZvqRPOrWDeUy9HLCBmGtoQVqdnGfpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930110; c=relaxed/simple;
	bh=WtxNHvIKde9/sew6kGlFC8taaxQqPm9kT6tqTqLxfEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWMoVGJjyAPVMDWtK9vWik9wMSV7aO+Rd71f0yGhYw+ncGbaPcYjfZdZjp3JTtTRb4UhmbHXlzZ9VkwZssKsTNP3aJiRYVRGsQpR8RePstaNjWe4SmMooYdNgP45mo5ORy32p7GPoUboxWlTgU+Ow9ebTnS5KmcDXuJqYBG96bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9tUQM4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9tUQM4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598DB1F000E9;
	Fri, 28 Aug 2026 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930108;
	bh=XfBkPIq7VigDfTUSCsn49Hk0PZbkxgtQ22uGEeHh7jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j9tUQM4n+ZDjjLceCgJ8GxHi0UHx3hEX49M0kYgJm+EE+q6D2xnTUeDhenME8NIlV
	 C7NVg9Uj81GMTBC4PkRf3LxQ39IhzVQqZxuXQHQRfFO0xMNAuzBQAnovAbFFF/Lk4U
	 3g4luhiLlU2ZxTI5bPblU5lWqZ33+yUOtPCh/WltGyAu2yaa4lCnBYNGMHh9rFG6sx
	 MmPYeetOY7UJLiWR+J39uuuUQ/N8AXyLfFkykfmQxYV6Z6VlN6Ro4dQC2s3CJbUTXP
	 Oq5a8lxYi4ukrIRnh/rykWYbYB6KLD6OkAsGYdzGqLtq1PL2sWxjEro20A+P2v6A/w
	 RlSQ2Tl7itz/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] iio: adc: rzt2h: claim direct mode on single reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260828145943.2077589-5-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-5-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:15:08 +0000
Message-Id: <20260828151508.598DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe 1-jiffy hardware timeout causes spurious failures.
- [High] Late interrupt triggers spurious completion for subsequent reads o=
n timeout.
--

commit 804ca0ac39c62632fae66702cb8c967efd8b7dee
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

iio: adc: rzt2h: claim direct mode on single reads
   =20
Claim direct mode around the single read to prevent it from conflicting
with an ongoing buffered read.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 995308a419f12..95bcebdc02cb3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -158,8 +158,13 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_=
dev,
>  	struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> =20
>  	switch (mask) {
> -	case IIO_CHAN_INFO_RAW:
> +	case IIO_CHAN_INFO_RAW: {
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
>  		return rzt2h_adc_read_single(adc, chan->channel, val);

[Severity: High]
This isn't a bug introduced by this patch, but this is a pre-existing issue
in rzt2h_adc_read_single(). Can the 1-jiffy timeout expire instantaneously
and cause spurious failures?

Looking at rzt2h_adc_read_single():

	ret =3D wait_for_completion_timeout(&adc->completion, usecs_to_jiffies(1));
	if (!ret) {
		ret =3D -ETIMEDOUT;
		goto disable;
	}

A 1-jiffy timeout can expire almost instantaneously if the next timer tick
occurs immediately after the call. Even though the conversion takes ~0.32us,
could it be outraced by the timer tick, causing the driver to incorrectly a=
ssume
a hardware failure and abort the read?

[Severity: High]
This is also a pre-existing issue, but does a timeout in rzt2h_adc_read_sin=
gle()
leave a pending interrupt that could corrupt subsequent reads?

If a timeout occurs, the cleanup path calls rzt2h_adc_stop() to disable dev=
ice
interrupts, but it does not synchronize with the IRQ controller. A pending =
or
concurrently running ISR will unconditionally signal completion:

static irqreturn_t rzt2h_adc_isr(int irq, void *private)
{
	struct rzt2h_adc *adc =3D private;

	complete(&adc->completion);

	return IRQ_HANDLED;
}

If this late ISR executes immediately after a subsequent read calls
reinit_completion(), could the new read falsely complete instantly and retu=
rn
stale or garbage data from the ADC before the hardware actually finishes?

> +	}
>  	case IIO_CHAN_INFO_SCALE:
>  		*val =3D 1800;
>  		*val2 =3D 12;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828145943.2077=
589-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D4
