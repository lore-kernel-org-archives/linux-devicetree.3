Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F03F1674
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533130; cv=none; b=Y5U4HgrEtQfQD5GLFAXZJKuzzgvuvG2LzOXK1hPopjLA26xMGcwc/G7R5JvP8DlxAst2dbi7ZxMfjzBL3cNOuMb0tXYU9oBTpABsz8LE4YnyCVpNJzhbzr6zxHvWzEXlfok9TqOMaIVTNsOmN+U0XEIU/mu3gTzZagPxOJ0u+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533130; c=relaxed/simple;
	bh=taTuI/uTOMXjIXPXu667WK4H5vUawgRfjbE0mglsoXM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzNB2zzX09SC0iySxEh0RGaNIy5aMwHdd6zMZ1Zc352uobi9Qc2Ha5K+26wbFB0dX4sOYRaOgiA7wbcKmFIujIut/xS9TbeYmV6aF5iPh4owJxxpD9vCHO+OwWgSc4LdZlSectPEUZ6T9bdwjrIVVvbzy1NbqcVf66j3hWVvL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ffCKJX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4ffCKJX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20451545e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533123; x=1782137923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=T4ffCKJXecs/GEA3jL3SD9gnWfr2vZCj6s+uKJMMshsFFDI+ko8XEr6+TbrR8m3i5w
         YV/D8ZbqmYPpF8gP4XFZ50gbvntssElJc3kN83H/4Vs7DK0Srnk9CzW+6MVRfPz4Kbzq
         avGNXPh8FXrGXCoRwi/vCEP/+kSUUrwkwejWyKqyhvKfrVeLm4xGZL5jUwRvDBfbIZYk
         tL5CaCze5IdjLR9/VmmIpv1mzMGGg7wbZk7Vpam05Y5OlPp//KEFH+BsI7Af/xf+sxf0
         2AhsWkNBEkbr17ObfDRHyZMX7Ynul1uB5Z6S5jQGFmPApFw+qbZYV1xjjLABhsHL53qp
         Ltpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533123; x=1782137923;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=jKJqoN8Bj/YOZiWADfit0CCCQKw53Z0IW0Rhk4LddElfboU06YE65PGxFprALu7fAR
         Wwwp1hvyd2CiOjUNBep2OKgcqnhUvkfQFVJsgSGvSsuD0rWOFjVAqwzgOYmySzDgXocg
         AO3vFLCNdD0ML/SKOi2nLFkmMbTflm+OHkKaYFNhfo4huJG2bOSJzDVNztUNhZISAf5E
         K5QevNJczz/UK+wGxok/b5pG5yfIo1xhgLnJ4nrSIRWdH+db/IrfCVKq5l0U5h4yw+uB
         NCFGEgDtkNTCXkJjDG4rQtzI7EDqeweT351UOvStwei4ALSW6dNqj6Ov8HMh03ZnDPVa
         aqfA==
X-Forwarded-Encrypted: i=1; AFNElJ/SqE4Ss5Qn/bs1GA6ytXkS16X6fnCVcOLW40Y1na7Icq4RFMD7QFRkReXOk7RN6BG7cTYn31JgZbF7@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoXAPVhfzHsp0CFL/K00mDN7m8ym1gvLF7r5Rfjcr9WqXEFLB
	GqkkebIOmTIcpZ2izztY8wxfUae+QF5YAXwlPOqLF0ribv5NKielVBmi
X-Gm-Gg: Acq92OEC9aCDotY5c0pyMuRHdyEBWbV5OxYMANP2mtH9/HpdFnsjI1MKsZ5OaW9Hn+I
	X9l46jCvw2DsUdEvf5/aNAe+TDBTxIA8dUFmFrz4wL31eqSyv1A7RtAYjSE8ni3VJgVPASbCMtC
	+xSddnynXo7glmKqUNmdqUc3v08vnXHcAd4wZTGV0p0gd1dqK6B2GJCBB165RY5hnRtibY6dS43
	Tdpqiduwvncz2qJPjRZuW6bH+hIyqguurk2SvNg+nKb6zYcltEeFoQYtO+7qXfFjG+XFp3RP7Fy
	zlKsM/rbzjgLDCkNji6MXrcWDaMKmYBxetQ5ERZaNFBjVl7oqwIWQ90j8qMvGjdURIWn8FFX7ei
	1L0xzlcVgC3yJZN7y3rBRB3+MUMkzvEwoJvPBzBxIEAGu3z91NfweEQu1qoRw6PC43G3jHKbg3M
	BZkCu+ye2WNBqf9QXKCxdrs0YFdKbZQSkRHE4e595eid1Lj/X82lmQsw==
X-Received: by 2002:a05:600c:3153:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490ec4fe7c2mr195111285e9.20.1781533122746;
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm283566035e9.3.2026.06.15.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Message-ID: <6a3009c2.561280e1.2acd9f.2f06@mx.google.com>
X-Google-Original-Message-ID: <ajAJvXT9R7UrMqQA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:18:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-2-ansuelsmth@gmail.com>
 <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>

On Mon, Jun 15, 2026 at 03:33:34PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add in phylink struct a copy of supported_interfaces from phylink_config
> > and make use of that instead of relying on phylink_config value.
> > 
> > This in preparation for support of PCS handling internally to phylink
> > where a PCS can be removed or added after the phylink is created and we
> > need both a reference of the supported_interfaces value from
> > phylink_config and an internal value that can be updated with the new
> > PCS info.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193..4d59c0dd78db 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -60,6 +60,11 @@ struct phylink {
> >  	/* The link configuration settings */
> >  	struct phylink_link_state link_config;
> >  
> > +	/* What interface are supported by the current link.
> > +	 * Can change on removal or addition of new PCS.
> > +	 */
> > +	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
> 
> Can you clarify a bit what you mean here ? Is that the combination of the
> interfaces the MAC supports AND the currently in-use PCS ?
> 

Combination of interface the MAC supports and the currently attached PCS
(not the current one in use)

The fact that it can change is due to the fact that PCS can be attached
later and supported_interfaces can be updated accordingly.

-- 
	Ansuel
