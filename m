Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173106;
	b=nqclCKTkA9CUEgxxZU5SV7PvARZHicbLzfsZacxWAwhc2cH6xXLXhJ5AYWxaRYO2TrQj
	 Odfc3CPqfKovUROWnIE6XTHNEDsUYjoMssIhNdkArdlahGZmApLyEUU2JnnwlEH0AA95U
	 /GlvXjW36O9p0IuBxr7A2vW6TaOTELEDhdL2TAfNA7FGJbN5KAJqNrDqFkwPq+/YhOsdd
	 mMEdsCaq61qZmzhooqXwmSrEhDrMD6Q+F3E3Jn1k+XiTDWoZGaE8VmhWocQw3S6LwGfm3
	 243SzxtB+iwpzvEd07ZFt5DEz7BbM5uolYE/ZYcG1VcIAHFvAkuuU1Yu4LU3+jsKy+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173106;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+0jvDmYpMRkDRCjGyAjujLifgFkDdi98SrDxejAju4Y=;
	b=ebyfqpql6m8hX9cXTgbKPOPau7wYEakt8V6R0LUYejDG5KVwc/D8e5U1OnuAUL6jOcuc
	 +7i5+Urb2EBiXw8p087yPHkWvWsorN1PKzVHgfC6FiW8atnqV7NwWjzZmyrs2h7Jk+cYp
	 4P181GT2fLTj4VPy14wyeDmHy3zTgydzGIG89T57hw5hJRppXi5x+F1dSI4SZwIOqJ6OX
	 eC3vem9CD7KMUm+uk/1r12wHZYg0VVEmhnAFwNmrg9fPHGHuYxMvC1wHY6J4TdkLin/as
	 NbOzp5cVKEPBsaiDAEHtcGkiztbKK5xM8OzXwwfLp9QmOtBCQvZiRDmjiWshFYb4QAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XSEEn4dc;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5964A60A6F43
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5964A60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XSEEn4dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+0jv
	DmYpMRkDRCjGyAjujLifgFkDdi98SrDxejAju4Y=; b=XSEEn4dcs+dmjgXWMrsn
	2woUGRjhi0OvAd2x1RPubcWTW0kmlTVxBRL9nr4oclr10H6nSZyLnfTxUmjKXXsV
	k8Zxi/4Vs4JkzS6aXv+/jAeghtygszaKQfQIJqAFkIVBcFhMkkh1bkTDeitDLNJZ
	Iynsy9GLzslsM1lie7wDhCl4B/DGjO7gYt/cik79ypVKr3u+s2gE90eq6hq4OtPf
	94cG89uPSwaMNN4rhE8GEyiFWEyLI6a7mdOP8XSjwM3CoUOo6hGIq/421nbJXe1P
	shNk2ADd7sQh24Rrn3Bva9tTGBEbC674jIP8V33bUvWI4evDzU0rf5QFpXXt37U2
	9w==
Received: (qmail 1450602 invoked from network); 20 Nov 2026 12:11:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 12:11:42 +0100
X-UD-Smtp-Session: l3s3148p1@aboUT7NgiOAujnuU
Date: Fri, 20 Nov 2026 12:11:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awAq7vxcY8CGjhNl@ninjato>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>


> > > +#define R9A06G032_RST_TS		1
> > > +#define R9A06G032_RST_MIIC		2
> > 
> > I didn't find any listing of the resets in the RZN1 docs, so coming up
> > with arbitrary numbers as we need them seems okay to me.
> 
> Why aren't we starting at 0?

I wondered as well but clocks are also starting from 1, so we could
argue with consistency.

