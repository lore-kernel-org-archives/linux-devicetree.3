Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D6558206
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083959; cv=none; b=DjkHCwIPdURCXqRb4rNEihDJk4X8cpEQ2XTB77XqYs0kSDEsqTeNyNzuOY6JA/afaUgTw5GNFRuP94YePrzwa57UynLNlLC91USjtoI6sIVhaWAUgtR3TCf/WuaoSc4NmWQ8aki/Gk3IzwSS8FkOrf5yNSrVyGZlC8Sh2jAyDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083959; c=relaxed/simple;
	bh=yY42bZk4aO+XhM+hepl6fLx57WK+q2lI0bjUfpsDrp0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DNWpvYxcG1QzuPffMS9g27LG/qtA5xUamfvkaYE3JuZM59uYK/mdsg16TlGo8MUBAaSJjMPDP1ZtQjy9IceXdCIsFHCNNPPTHtagxrcZm0WyJTzMR1Qbn4sV73lyk6ZcrNWVuEAsrvWkTfMZuhS43zZC4NBKqpDUFIWoIOzv6/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHCzIlEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHCzIlEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8A51F000C4;
	Thu, 15 Oct 2026 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083948;
	bh=pJLLprYT9z2WXb2jWgbgJRXvjYmbM/4oZwClx9P2wY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KHCzIlEh9cOXat0zOw3N1O0TZfF/U1yAjbetgYPipsU5DE1lKctRXFg5Dad8TSvpw
	 LDYBKMPXSquAJhbxkCO+LTbrioyA58GdPA1j7h1Ss2HgE1Sk/0hJJNszoXi09BQb9E
	 qujFEJG2pfJSwiudfjrDdKOwoK4y/qjNhJZfnxKk0AJy5veMe60J74hSewpS62s9ch
	 eYnC0OLMlkovTFf+rFiZw6U5cQYe2MfN3zKan2k1QOBrrvbEfNcfQa/HXsuKlDUzy8
	 PzTlhwQ0mIJH9QdM4vRJwawg3RkxP6VdBDz2Z0aQ8OT6YQQb9e8iSashz0X0R/inix
	 AE9ipL+W5BJcQ==
Message-ID: <sashiko-outbox-173234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015165404.519741-5-cjd@cjdns.fr>
References: <20261015165404.519741-1-cjd@cjdns.fr>
 <20261015165404.519741-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:05:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clocksource: memory leak of econet_timer.irqs on success path
--

commit ef0bb74d87af020e62a370267e55ff45f7da1e01
Author: Caleb James DeLisle <cjd@cjdns.fr>

    clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

    EN751627 is based on the 1004Kc which uses a different interrupt number
    for each CPU timer. Support both this and the EN751221 which uses a
    single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 1859335345b59..edb3db3125ce3 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks =3D of_address_count(np);
> +	int num_irqs =3D of_irq_count(np);
>  	struct clk *clk;
> -	int ret;
> +	int ret, i;
> +
[ ... ]
> +	econet_timer.num_irqs =3D num_irqs;
> +	econet_timer.irqs =3D kcalloc(num_irqs, sizeof(*econet_timer.irqs),
> +				    GFP_KERNEL);
> +	if (!econet_timer.irqs)
> +		return -ENOMEM;
> +
[ ... ]
>  	sched_clock_register(sched_clock_read, ECONET_BITS,
>  			     econet_timer.freq_hz);
> @@ -212,6 +291,32 @@ static int __init timer_init(struct device_node *np)
>  		(econet_timer.freq_hz / 1000) % 1000);
> =20
>  	return 0;

[Severity: Low]
Does this code leak econet_timer.irqs on the success path?

The array is only used to populate the per-CPU cd->irq during initializatio=
n in
cevt_init() and does not appear to be accessed again. Could we safely call
kfree(econet_timer.irqs) here before returning 0, rather than retaining it
permanently?

> +
> +out_irq_free:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015165404.5197=
41-1-cjd@cjdns.fr?part=3D4
