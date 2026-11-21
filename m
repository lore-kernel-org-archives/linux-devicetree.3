Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232848;
	b=HOAZfCf3u/H0mnqdwy1CvAdiN7K4WPUyCMOT6XUMyqXnSjUVjgeFlYFvyqVYaqEfWQbw
	 rsqlK0zcZO3wjlnSQqQ3Lk7CgkT8f8RX9GrfmAPJOpWtlgSlcZOFXzAVT/XAjBEj3yZwq
	 +3A5qALNMP2DrxRPbOU4QwqC7FvWjB87AqtFlpo0GkaEp1/MUkhLgJuelEBOSKHvd8iUx
	 i07C1xIDloE4lj2ouSJXmf7QXIwTeR85G6IrtQe45Q7slvcO06a17z0oN7vTtnD5H/wQH
	 7rgXanNPS3Vjcn1RW2a9z24LHHq8MT/skZxRCmswvuGBZzI31zks9kKw4+aPBzsPQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232848;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NefLLPefkjH1B6l1iL9VhR6JuVY7bjoE3/WD0X5PSTk=;
	b=V3zXyoz50TvnisdJUL2O1cW/KOjRMjzpw0A43k6RmOe6m9hSZgXv7n7E+DhP5VbUfvkq
	 dcwiweCH5Fat+3vqDzT4+PiqrlTi2e2YoY5rh5/gXxCOSdRtB5swm+FguBvVJI6VXDWc7
	 pwUCZWboek3f0Wcy3FKR0nF1DOnnhIHiC6sgR21tFO8TS8vIoPlsZQ8unN0hMks5cB1YQ
	 Fvdw672tHEn7Ji2kXbJnbhxbOP3Ba06Ci+FJmdhv/2IbmYn5Z7SYr3MCRm9rlUDx1F683
	 LOTyo47jdBQgCVGzFaIXse+ZB9bMtmgxcg+32DjDBmjo+xgn/vpbMJ8v1XaRbbTL1kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcVddzWB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79587606A6A8
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcVddzWB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13031F000C6;
	Sat, 21 Nov 2026 03:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795232848;
	bh=NefLLPefkjH1B6l1iL9VhR6JuVY7bjoE3/WD0X5PSTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcVddzWBbN6y54XzHjy+vzKI8NwGap5Lx/LAb50YAa/f3YZoNJ9byD9cu+rZlUutL
	 IEuMYDsoVTZbvbD1s4RLL0NIruVU7/hMnekEJWA/6MjJ3sgdbMqd5vOYEUcZJguQn4
	 5ZdWBe/rOB8RYE03ZIKFnaN57PXR1+49teyEQYpX+GA3+tdBmZWklRSmKW7utEr2OM
	 OZzotQ2n02/U9XhStCDzJafja48MK7tiKzSoPEMqxVoxaqJIlzA5OJWFxcFhG6J+wB
	 Rn2Pdrks4b4SigR7hYLX5vJbP0Lw8WTEHVcvpLtj78K+07/I9+u1ZSof4ShT/kI/Go
	 fSCpD2ggZv5mg==
Message-ID: <sashiko-outbox-226601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: ti: am65-cpts: implement
 PTP_SYS_OFFSET_PRECISE
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4af45df52cdd96da920bc36d29bc341615bbe95b.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
 <4af45df52cdd96da920bc36d29bc341615bbe95b.1795143925.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 03:47:27 +0000
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
- [Medium] am65-cpts: missing per-pop TS_PEND delay in
  am65_cpts_fifo_pop_event()
--

commit e2b0e8be4be95c8c4617e693d71c09e33009c74e
Author: James Clark <jjc@jclark.com>

net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

This commit adds hardware-supported PTP_SYS_OFFSET_PRECISE cross-timestampi=
ng
to the TI K3 CPTS driver by routing a selected bit of the Global Timebase
Counter (GTC) to a CPTS hardware timestamp input.

> diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/t=
i/am65-cpts.c
> index 3ce3b2245efba..4987909d3bc2b 100644
> --- a/drivers/net/ethernet/ti/am65-cpts.c
> +++ b/drivers/net/ethernet/ti/am65-cpts.c
[ ... ]
> @@ -797,6 +841,243 @@ static int am65_cpts_ptp_enable(struct ptp_clock_in=
fo *ptp,
[ ... ]
> +/*
> + * Read the FIFO until it is empty, then accept the next push event. One
> + * __am65_cpts_fifo_read() takes at most AM65_CPTS_FIFO_DEPTH events, an=
d after
> + * a burst of push edges (a request that wakes up late leaves the input =
enabled
> + * for many periods) more can be waiting. A push event left behind would=
 be
> + * taken for the next attempt's. With the push input disabled no new push
> + * events arrive, so after enough passes every old one has been read eve=
n if
> + * packet events keep the FIFO busy. The lock is dropped between passes;=
 a push
> + * event read meanwhile by the IRQ thread is ignored, as nothing is arme=
d.
> + */
> +static int am65_cpts_gtc_push_arm(struct am65_cpts *cpts)
> +{
> +	unsigned long flags;
> +	int i;
> +
> +	for (i =3D 0; i < AM65_CPTS_GTC_PUSH_DRAIN_PASSES; i++) {
> +		spin_lock_irqsave(&cpts->lock, flags);
> +		__am65_cpts_fifo_read(cpts);
> +		/*
> +		 * TS_PEND is valid only once four CPTS_RFT_CLK periods plus
> +		 * four CPPI_ICLK periods have passed since a pop. Read a
> +		 * register so that the last pop has reached the CPTS, then
> +		 * wait. 100 ns is enough for clocks of 80 MHz or more.
> +		 */
> +		am65_cpts_read32(cpts, intstat_raw);
> +		ndelay(100);
> +		if (!(am65_cpts_read32(cpts, intstat_raw) &
> +		      AM65_CPTS_INTSTAT_RAW_TS_PEND)) {
> +			cpts->gtc_push_armed =3D true;
> +			spin_unlock_irqrestore(&cpts->lock, flags);
> +			return 0;
> +		}
> +		spin_unlock_irqrestore(&cpts->lock, flags);
> +	}
> +	return -EBUSY;
> +}

[Severity: Medium]
Does __am65_cpts_fifo_read() only pop a single disarmed GTC push event per
pass in am65_cpts_gtc_push_arm()?

When __am65_cpts_fifo_read() drains a disarmed GTC push event,
am65_cpts_gtc_push_event() returns immediately and the next loop iteration
calls am65_cpts_fifo_pop_event() without waiting for the four CPTS_RFT_CLK
plus four CPPI_ICLK periods after writing event_pop:

drivers/net/ethernet/ti/am65-cpts.c:am65_cpts_fifo_pop_event() {
	u32 r =3D am65_cpts_read32(cpts, intstat_raw);

	if (r & AM65_CPTS_INTSTAT_RAW_TS_PEND) {
		...
		am65_cpts_write32(cpts, AM65_CPTS_EVENT_POP, event_pop);
		return false;
	}
	return true;
}

Because TS_PEND is not valid yet on that immediate re-entry,
am65_cpts_fifo_pop_event() sees TS_PEND clear and breaks out of
__am65_cpts_fifo_read() after popping just one event.  If a request wakes
up ~3 ms late so 9 to 16 push events accumulate in the 16-entry FIFO,
AM65_CPTS_GTC_PUSH_DRAIN_PASSES (8) passes only drain 8 events and
am65_cpts_gtc_push_arm() fails with -EBUSY (aborting
am65_cpts_ptp_getcrosststamp() without retrying).  A disarmed push event
sitting ahead of an AM65_CPTS_EV_PUSH event in the FIFO can similarly cause
am65_cpts_gettime() to stop reading the FIFO early and return a stale
cpts->timestamp.

Should the post-pop register read and ndelay(100) be moved into
am65_cpts_fifo_pop_event() right after writing event_pop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795143925.gi=
t.jjc@jclark.com?part=3D2
