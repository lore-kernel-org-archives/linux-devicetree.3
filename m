Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995E30E0EE
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651351; cv=none; b=oYqHsVcYKQdDUCIq8gVaUoWN5+d8DJfScMrPBiLdVkybAPct9N9T8v6RGlJ7dRXUnVh/+rI0qFVpMpHRk81XvcbMi+Efj9/DS+uNqZE0bHZI07doJGDv97xGs5qd5AfAS8TtW3t4KoaWpWMlYTVlXvPYV288eMj3ywy+Vb55wSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651351; c=relaxed/simple;
	bh=KAPFGa8apvmZnWXaA7VcM3+x2PjRGFMC18ZP4qMJdzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUVKPOwEwC2i4sNtqjXGnrANn4Lec7WaVaYLE2y+44w4WEKPQkscMZdS5CzIF72D66zE7X3AMHmuJ+B1aGXf7y/o/FpY8/zcSWzCCufK+ytRBYmwbNLepF0AV91PRqCEXl5hS1s05edlA8npfZpq1Aq8Zhr0i7wRFWfJ7bG83ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+VPgirn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+VPgirn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903974854dso29749115e9.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651348; x=1780256148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MA5zBTVqqPAZ1JUYUScqIpW2iGsfMAiQgXisbURssgs=;
        b=J+VPgirnzu9o2DwsDtdsjK65F1vP4ps2od7SX0VQLOgW1fkh8Mi1b/llHrsTTFqdAp
         GP2yr83mlweNeQNEvntbvZqlMYujD+vXE6Id5tG7FbovpUjxG0kdepwnepZYLxyq0YgU
         FDmBsqY8zIre0LNMDp0ZTLZWsZiVtGwlVrCnaH2hqZM5j2P/0d07ZOPnP1DzL6ybxqIo
         SKvLBD8vB2qhuAyIUgN3eZIE5YjRM2A0ThU7HeqTut9YKqd0lwREr+wJ347gZ5pjLIHN
         TvAXokg1QWy8Gw9qM+1iBepz5weKOb8HGmmdZcU9xxs4/tBYL0Vo7Xtc96Un3kL5A629
         FXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651348; x=1780256148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA5zBTVqqPAZ1JUYUScqIpW2iGsfMAiQgXisbURssgs=;
        b=PtRqRaHKIT/j/IqV2QXw/vBZ8UIyoV86T8AqB3Lf1Nrocm3yhGjTkwXnxupxRaFKAZ
         8k9kDIGB9victz9XtUwTnzKOeTVptjbIkBtKmYwtA/3Pb0pYQs78YloMWuA7xCGIWnoW
         0578pla15QOTecyrRsjnjH0NZJlBN4N8qj3gRDBInmIyPjOL7aviE8UAHGkxkYo53g8b
         cp89p00DR5iMrf/OSyv1XwYUes3eva53tJxjhDrvSmG5XeGBXuP6JQTnAnTghryoexCR
         2nkggA6S5j4igds/Ql8xZ7kTU+87QEcMIWEQpVddWe6+5jz9lhTHXn1ufudUxWjKKMo8
         5Y6w==
X-Forwarded-Encrypted: i=1; AFNElJ/wYLvXuRQRIidPXHe/RH7l7ReVSpo1hATnMVr6MSpCh3sR7Rx7QEbSo4rx8woX0OvUVUwhm4JesLkp@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCUc/dVTJZLWkcWs7dQZZzT/C5DQcZ0BhNfXL5FQFLM8pCzG9
	sWHxjPKm7BLgSbmf7LnsVTHDRxqAv9Ehzz4aEoyTgfbo2mHwNRVius0e
X-Gm-Gg: Acq92OGFSSaSRy58UqmxB+HUxjQ14XGyTyi+jtW/kdjmwvF5A6N3GOCPp9rumXxHRjO
	2OvWTUGjBnLDu/1lNKeVQHTSI/l/bsJ49iiwXkddi6gCcr5ITCuyQceVDs52Q5BNIHHDS5ppvaT
	IJkiidcUNtovBV3s4boCyiLar28aJRjTmpEuHjAZsdRlkQ6ruafbYJw/RfHYGW+AZajIvIoJm8Q
	aI7Oqgv5DGn7O8qaFxifdQ16u0OfMe8gaVVmMQZJwUXAjPYMMyTvfXm/GQD9UsqpLRikz/bF2Vj
	1D+aR7079KhTlO5/1YdN0BJbN7mKFuyUuPz6tVDK8kHzJEgs8rPpjOIlkOQVJ9SvOjx0ypQclKH
	PGBunVJsevKhndmaXklGvGpiw1c+DCCCvQKLs9TFAGHjyMx8K7I6zPcOqNDWI62u/a0YRzyfyc8
	6ajU+5M6CUq4BcDPw=
X-Received: by 2002:a05:600c:4ecc:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490426d4bf0mr192598335e9.18.1779651348168;
        Sun, 24 May 2026 12:35:48 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454b7d57sm193410105e9.15.2026.05.24.12.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:35:47 -0700 (PDT)
Date: Sun, 24 May 2026 21:35:45 +0200
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] counter: add GPIO-based quadrature encoder driver
Message-ID: <2u2lqetlfph2leoggp6d7sxqv4toxpnsts2f2zgq3pwt7ae4ol@ploty2jwm3t3>
References: <20260520044525.128529-1-wbg@kernel.org>
 <20260521002627.172691-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521002627.172691-1-wbg@kernel.org>

On 2026-05-21 09:26, William Breathitt Gray wrote:
> From: Wadim Mueller <wafgo01@gmail.com>
> 
> On Wed, May 20, 2026 at 01:45:20PM +0900, William Breathitt Gray wrote:
> > On Fri, May 15, 2026 at 05:36:15PM +0200, Wadim Mueller wrote:
> > > +static int gpio_qenc_a_delta(struct gpio_qenc_priv *priv, int a, int b,
> > > +			     int prev_a, int prev_b)
> > > +{
> > > +	int state = CREATE_QE_STATE(prev_a, prev_b, a, b);
> > > +
> > > +	switch (priv->function) {
> > > +	case COUNTER_FUNCTION_QUADRATURE_X4:
> > > +		return gpio_qenc_quad_x4_table[state];
> > > +
> > > +	case COUNTER_FUNCTION_QUADRATURE_X2_A:
> > > +		/* Both edges of A; sign comes from current A vs B. */
> > > +		return (a == b) ? -1 : 1;
> > > +
> > > +	case COUNTER_FUNCTION_QUADRATURE_X1_A:
> > > +		/* Rising edge of A only. */
> > > +		if (!prev_a && a)
> > > +			return b ? -1 : 1;
> > > +		return 0;
> > 
> > Quadrature X1 count modes trigger on the falling edge when the direction
> > is backward. This isn't simply a requirement by definition, but
> > necessary for the proper interpretation of the quadrature encoding.
> > 
> > Let's evaluate an incremental encoder used in a positioning application
> > as typical use case.[^1] These are commonly implemented using a rotating
> > shaft with a quadrature-offset pattern; aligned sensors detect the
> > physical A/B pattern as the shaft rotates.[^2] As the shaft rotates a
> > quadrature encoding emerges whose A-B phase difference allows us to
> > determine direction: forward when rising edge of signal A leads B, and
> > backward when it trails.[^3]
> > 
> > Now consider what happens to the signals when the rotation changes
> > direction: there is a phase change between Signals A and B.[^4] The A/B
> > pattern on the shaft is physically present so it has not changed; rather
> > the pattern is now fed backwards to the sensors due to the direction
> > reversal. The key point is the physical boundaries of the pattern are
> > located in the same shaft positions they have always been, yet the
> > signal edges representing those boundaries have flipped as a result of
> > the direction change: positions marked by rising edges now appear as
> > falling edges.
> > 
> > In Quadrature X4 and X2, the pattern reversal doesn't affect positioning
> > because we count on both edges, so swapping rising and falling edges
> > nets the same position count. Quadrature X1 presents a problem because
> > we count on a single edge type, so a phase-difference in the encoding
> > results in a physical shift in real-life position. The way to account
> > for that phase shift is to swap counting to the other edge type when the
> > direction changes. That's how dedicated quadrature encoder devices solve
> > this problem.
> > 
> > I'm not sure of the best way to solve the Quadrature X1 problem in this
> > driver. Right now we fire off interrupts on both edges, so perhaps
> > there's a way for us to determine whether we're firing on a rising edge
> > or falling edge and evaluate accordingly. Does the GPIO subsystem
> > provide an indication for which edge triggered the interrupt? Or would
> > it make sense to provide two interrupt service routines (one on rising
> > edge and one on falling edge) and handle it that way?
> 
> The simplest method might be to evaluate the current GPIO level to
> determine the edge polarity. Because we trigger on both edges, we can
> assume a high level means a low-high transition (rising edge) and a low
> level means a high-low transition (falling edge).
> 
> Using that assumption, we can implement the Quadrature X1 case by
> checking the current state and direction, and adjusting the counting
> accordingly when applicable: count up if rising edge and forward
> direction, and count down if falling edge and backward direction.
>

Implemented in following v5 as suggested in both signal-A and signal-B ISRs.  One
caveat I called out in the source: in pure X1 mode the driver never
sees both edges of both signals, so direction is whatever the last
X4/X2 sample produced (or whatever userspace set via sysfs).  In
practice X1 fits applications that already know the direction or
that have just calibrated in X4.

> Quadrature X1 A is handled by the signal A interrupt service routine:
> 
> 	/* COUNTER_FUNCTION_QUADRATURE_X1_A */
> 	if (ca)
> 		if (direction == COUNTER_COUNT_DIRECTION_FORWARD)
> 			count++;
> 	else
> 		if (direction == COUNTER_COUNT_DIRECTION_BACKWARD)
> 			count--;
> 
> Quadrature X1 B is handled by the signal B interrupt service routine:
> 
> 	/* COUNTER_FUNCTION_QUADRATURE_X1_B */
> 	if (cb)
> 		if (direction == COUNTER_COUNT_DIRECTION_FORWARD)
> 			count++;
> 	else
> 		if (direction == COUNTER_COUNT_DIRECTION_BACKWARD)
> 			count--;
> 
> There's an obvious caveat that this method only works if we're able to
> check the GPIO level before the next edge arrives (we're limited to low
> frequencies), but that's a caveat present regardless for our software
> counter so I believe this is an acceptable solution.
> 
> William Breathitt Gray
