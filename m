Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3573FA5F2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539242; cv=none; b=TO9OlkUR49wlCkWRTQ76FvZM3F5Cvhu448VsWSIEbMTq6+KMSG2DVk6rmchDcwv5NZAcBPk5EzEZz3aFzf3sVDd7YWz7qp8iAvDi3GQl0G6fqFSK3mHSTNJEnXhscLykPAURqe8NX8Vk9Yon6ocJf1GkUevQFYtbAiszVcB++kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539242; c=relaxed/simple;
	bh=Qh+ISSIW9F9nJWAHe5XUZH6Hyr+Xx2qDwzsQrC+22Wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kalFDQB0a6u/phile+mZBMznaW6VZdHspGs8V1L3zwzqpU9af/+pKZsOoQKGiJFUmL8UTnWa1FKHkLtX73XxvaNRD3ZVzCKGa1Guy8evU7vvaUi3orrB7cBtU907qzTtClmch5a3pTkB3iKD/5P/E1WX9ynK9CqXZ/Fqf5IixPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onGYzPO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onGYzPO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670BE1F00A3A;
	Mon, 15 Jun 2026 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539241;
	bh=hcsOnkjSbROmmF5NX+yApfiaHoZ66P0BuIBQbcgufbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=onGYzPO/WBkEAUKx2/1QWnI/JDOpg5VubQeMuBcISctWLSIC8HNnw9gUyRFv31Iww
	 EBjun6x8AfFf0lqZBhoTtYa3y6u43Nd81uY0KE9mD+8h2HEgQb72I30+pm2owwwiiM
	 LknJtErL8GzMUeG5c3xLo9Br0KNY8CC+mQEmGUnM7U19LsNh/obnONhI06BrGPEpdG
	 KUr3GaKir6NcXoLx+iGfjSLPhDh3wfNWyDBiSlzpKS6AjMwcoHFlIrJjaE9gxnBCo3
	 gOsw5w9KwlAlmFg60Dv1nn88+EgTDbMBmzpcQ4Rgwj5gfBnPGWgOF40U+quJt29XXF
	 MJ/eZMyZzYmOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 16:00:41 +0000
Message-Id: <20260615160041.670BE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect hardware alarm weekday assignment due to unsigned underf=
low when the alarm crosses a month boundary.
- [High] Unconfigured alarms in `rzn1_rtc_read_alarm` can return an invalid=
 `tm_wday` value of `-1`, risking out-of-bounds array access in userspace.
- [High] Potential spurious interrupt when sequentially updating active har=
dware alarm registers.
--

commit d278abd6309a65fff235820bea9a8e8631da47be
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: rtc: rzn1: fix alarm range check truncation on 32-bit systems

This commit fixes a silent truncation issue on 32-bit systems by changing
the alarm and farest variables from unsigned long to time64_t. It also
replaces the time_after() macro with a direct signed comparison.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index fe21fa6242881..06339adae71f6 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
[ ... ]
> @@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, str=
uct rtc_wkalrm *alrm)
>  {
>  	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
>  	struct rtc_time *tm =3D &alrm->time, tm_now;
> -	unsigned long alarm, farest;
>  	unsigned int days_ahead, wday;
> +	time64_t alarm, farest;
>  	int ret;
> =20
>  	ret =3D rzn1_rtc_read_time(dev, &tm_now);
> @@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, str=
uct rtc_wkalrm *alrm)
>  	/* We cannot set alarms more than one week ahead */
>  	farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
>  	alarm =3D rtc_tm_to_time64(tm);
> -	if (time_after(alarm, farest))
> +	if (alarm > farest)
>  		return -ERANGE;
> =20
>  	/* Convert alarm day into week day */

[Severity: High]
This isn't a bug introduced by this patch, but does the calculation for
days_ahead underflow if the alarm crosses a month boundary?

In rzn1_rtc_set_alarm(), days_ahead is typed as an unsigned int and is
calculated like this:

    days_ahead =3D tm->tm_mday - tm_now.tm_mday;
    wday =3D (tm_now.tm_wday + days_ahead) % 7;

If the alarm is set for the 1st of the next month, and today is the 31st,
the subtraction results in -30. When assigned to an unsigned int, this
underflows. Because 2^32 % 7 evaluates to 4, the resulting wday calculation
shifts the weekday by exactly 4 days, causing the hardware alarm register
to be programmed for the wrong day.

[Severity: High]
This is a pre-existing issue, but is there a risk of a spurious interrupt
when updating the active hardware alarm registers?

Just below this hunk in rzn1_rtc_set_alarm(), the match registers are
updated sequentially:

    writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
    writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
    writel(BIT(wday), rtc->base + RZN1_RTC_ALW);

The RTC core can invoke this function without first disabling the hardware
alarm if replacing an existing timer. If the hardware alarm interrupt is
active, modifying these registers sequentially could cause the intermediate
hardware state to momentarily match the current time, triggering a spurious
interrupt and prematurely expiring the next timer in the queue.

[Severity: High]
This is a pre-existing issue, but what happens in rzn1_rtc_read_alarm() if
the hardware alarm is unconfigured?

If the hardware alarm register reads 0, fls(0) - 1 evaluates to -1:

drivers/rtc/rtc-rzn1.c:rzn1_rtc_read_alarm() {
    ...
    wday =3D readl(rtc->base + RZN1_RTC_ALW);
    ...
    delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
    tm->tm_wday =3D fls(wday) - 1;
    ...
}

If the current weekday is Saturday (6), delta_days evaluates to 0:
((-1 - 6 + 7) % 7) =3D=3D 0.

Because delta_days is 0, the rtc_time64_to_tm() block is skipped, and the
function returns with tm->tm_wday =3D -1. Since rtc_valid_tm() does not
bound-check tm_wday, this -1 is passed to userspace where tools commonly
use it as an array index, which could cause an out-of-bounds memory read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D7
