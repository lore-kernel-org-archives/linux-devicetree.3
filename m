Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847074;
	b=TijmjynJJod+UDbYzxucpGwoK3B2KxziGGQ9Tki3sL2r19qWyR6NMirEIUjbHDTHQFNb
	 s+/vG1UyNrvKKE6RQ/G9H+/GEf5WuCSj8YqKsBBU+RMCiUxA3ZdqKAIWIpRWnjHNtrL34
	 So445Qio5YTCBdYqsK1t51QMTBGlIqeMSOzSyBKBz2IkjRYC2hOAJqMm1r1Z1iIiOnD5G
	 /3mIRW3vK0LCxnKtxk5WBuQaCtArGh75Dk6rFHIabdCv1VGZ3gRJSzo8oJdk6hSWNsKds
	 5avSAW9sPpirbdLszXjSfS9mkkkexf6fJL3g7+A/slXhdOjn7NPGAocohelTfjbevpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
	b=FKcPx9/0yea32p3ufRtvfduPcCtuSgBpB1UpMJNAcKWyyEFARdD4CsK3UuXjIEUAIdGT
	 B3SiL0dTYufje+h1zxTxS+t84LyycnAP5mGLbVIu+P3anvRznnw6FI4RoCyMNsr5PAMPp
	 aK+1LzLeh4epNTrMibmENYZj3E+/1wg2nAc+RVpuZ0UVk1FWzYYpqyPW6VWtjG/qSbKuX
	 +kWFVZs327i7WxehWPlVisFOZZNGEpufRTkTAWBoOYNQjyOVmjlfiXb+2nT/wGUDPLWDO
	 1EQRyh4qYlJ0lTz3mT/cVnmbQ1GbDw2H/OkeWk3cf+l7ZAR+rlegE3wSRs1ib1xT9MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4CB606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4CB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-497614c95f0so1758913f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=eNqMq4pdG7+RtREnW0nLtbAhfw8loOwD8ch/NLM+mhlO9edO9Xpuh8aJi6/ITtGecp
         SN5fptk7D0/UooZZhSLhlEfkd024Hbrq8zj1AoWJH6DXOsRvSXZ7CpdvuM/cLqVATFcx
         2BKKTLjWXhEvZPkxdUO3iReMBvWvi/3LRR+U5SrooY0v1uRabJ+zptC8o7Gt02M3Egis
         TSW9HwosoAUxvxas8Oqp6Wg+kevVJHOZVQqrkA6N7+U/g6/Js/3IkmN1DGa1UQruVY4H
         cpSmDdTkTw+Qf7cBPBY6VP4Ej5rn9x09uZyaCeQql8eSz30sM/zAD9iliCtW1VhTQCl4
         lghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=1suK0ORO8/gkMzGbAdr/b7oL7QCjh1HcAITdhozlEHdVYMwVWJjLHDpDMZmsD5+NLO
         zGp9gmHL4JLsf6IVHlbstS7Adu24/Unw8IcBIzKkkBae8HwVcTx12G7U1dY7QZAbi/BQ
         7CdgV7QSP8l9pTBMiIiyCk7gluDleliI17NPRs/BS3EuWJddAhub7UfZ+S3yDd1Z9Z/9
         m4zvnMxFkLnDo78jS2FrJpKobaj450JG+NNrQGBy9iRMn5KyoK1en4E2Pbtvy7MMu4kh
         Tj7lMR5k0EdblJHvwHDkWs+c2zlABQR1zHk3cj3hpRyWtVZex59ty1KG5hiJJBIC7YgP
         v6HA==
X-Forwarded-Encrypted: i=1; AL+hErGMJB9FWUSSvcsiUB87rP5AL3tTVyUppMHUvzBfeWXspdDm/lKLe8qDQv67tbUVBzzTd1jyydRgCsaT@vger.kernel.org
X-Gm-Message-State: APuU4Z8qWlQkErD+H1kLP6/PBwdlCLGM8DsoSoCjolQyC7mEXuziAeIK
	fU3cuxvEHdhPaTgUhcd5tnkMZN1AOvyiHeQeRlgRWAvl2/xcz0oFKPVp
X-Gm-Gg: AZFdTZf/mdT5Lg/04jrrqncCLURNjLa+8y7oems1Zmahomcyv05aGOJHQra81tmH19B
	b9MKFGh0+5IZlZIh1x8NK5Gz9SiD9dhXhZb1FZm8F3sLcNx8A/umGM9LKwSJxPf8LhszDueYB9y
	nPh8H8Ie37vwuaBzOGQh5grJ527f61T+m0oUJm9a5hJ9LUk6rgAiebfTsc/fcsO907bsNKUflKn
	sNjsu8KTww59bNQbI7N+ui+w+EA2+7UjZI5b7F4R0eeD3p5DoH34XpKbjGQjdom0uBLLRVpWvxB
	0Qpm61ZKKe9dnIK84KoZQ+nhlr8w7vtN4jWttKzuCfsaPD6zCWaDH3RuUtKCUYQnMGxt1+EyOB7
	0M4dTPwhDKA/NK4lXuDkP9u+ThneuflySszedjSmRUhpJAG687+B9fuvMyirCJCi7zlI9j9ZMtw
	RSmj3r5AGrmSBbGz/TRmAbzemz7qss1uappE6qlWZpQbL6MLJ125LcdBWRQamhQlIWEgKeWEKOr
	QvhNsXe7X8FnvbPOt/RkPDXaHTa45zeYrjrqpH+sHNY8lzvKnjkEjgLLSrEbSN3XzvEcNS9I+HC
	tDQxt0UG15zPUa8JH630sGgQiOdEwY5ERZVYTSpkU+eI2n+qi+nakZfsznIqAJ6Exh4Zug93tqW
	qzWB6jb0h3krVWPaS
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
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
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel
