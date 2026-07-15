Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FF3D1A81
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105085; cv=none; b=h++POCWb9oTWvJRSmFxpcdqgfVC/DLPZSWzDeyFooDUggTsyMvOxbZPCfng6l8NE+Jk94pMUGzj3/JA2MS94wlE/4jkP+gb1WCkjDc1VGPduQ/mj/gVBPh4zGeakiUIskV+tc57ANvoiEj9Gfgx+ehsBAS/pyPqhaIK/V3xKkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105085; c=relaxed/simple;
	bh=N3wD4okQaCyl3GXAvOk7XCkD9tulNAH6mOxeuKKV4hg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzefwSK3axLVp7JRX8y8bUvyykbjGex6GVHZW7QJSfGmhv1np9soYmKzG5ejIV6vtQdUho0IY1EaaXk1C7vqGiGBxnVvhRiCrK8nkqacLI+2zphl5h5mS4jaGiqNQIwGagrlZwCB+uAR7DW1xSw2J96xRRak4HnKs5qx5kuPJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDqK8SVC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDqK8SVC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c19bad03so45931575e9.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784105076; x=1784709876; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hz7WPKd8nuv0g834JzI7w/vUzS6TIu2DOFmMdBw0Pc=;
        b=hDqK8SVCIWITNQGqRF/V2WYEiWU5oQglBAOoqU16mSqkwfNxZNko7n/9Ul0nFGnZ/B
         I5tyIIhhPaOTbTplQ3We+mp5+LivyBgPu9YPu37SMOOjwjD0BIQFm41qr68Q22Eg1Rln
         AUQZWJwBsBmacuCDbA4iSOc5z1X2WxRGfO8xw6bTgVb78rc7/41DmbTTXhtYRxeuA5eD
         Rtj4be5jBCwS8mngyizNerZaI+hiw+VOq3JD+b1AXzUKljgKXN2P5/5SbDd7FNBATOyQ
         WIZN9aASLXZauWpgcEVTJp/6mc6mpnQfYkjkrom34ThDXlUf3mGuwVBmAuNGYj9MWg5H
         SZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105076; x=1784709876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hz7WPKd8nuv0g834JzI7w/vUzS6TIu2DOFmMdBw0Pc=;
        b=O07r6gGLEzmfR9PjNlx83V7GfIr5Oj8Z4h2iiFMGvsOfuqElu7DXecOdPuF31ENXf5
         rsfv7BJnqcf+44/DkxteJ7hc9oBsApbLNhpBuHW9rrTdUSJrQf/fkpHyhGC1HXN98+Tw
         /5NemyWeR0+Pq3taxSplUznOjSptgsUl9tvQA0ZJozwxj8hgirR/E4FAjhEyT4736WVa
         f0mO3mhgqFljIpmREOgSyuHAkanZite/u/dmvsV1MGCQ0qMWnkbX5eemTnR/EGaGV/1T
         /YkkhNJfFJjk7AyDPMJQVs6QK8UzQU1RjLaXFxyWED0f3ZDtd7oxF9iapAI+am/IFdjE
         Oliw==
X-Forwarded-Encrypted: i=1; AHgh+RpjcR2FADZO6B44sIVnlW1SZK+L5PbnPxAKiCibMvtzjbSofSEiZvaZymWng5vN6cauUJuur5OKSjkk@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrh/Y3wjJD8VEItvh5Iy9bQ4FYfWgmPbFBSRBE+dc2x25MQxB
	gEyHmdDi4CnQe/f0RuxAMolC3jPp1Xh9VzIw63O1tAxX7PmfoRy8TX6Y
X-Gm-Gg: AfdE7cnETkNMD98kVjtK5x9mHpHuwFRwVY/kb4WCJBsNRO/61pOpzWxnS8d07ea+Pd4
	FSjUYwQkNItisyt+t1Js5o07fQmZUfZRq7RQ9qxWJBEE9t7eX1sfK+iYp9tzV3AqfdWTg7qi9/i
	2w0T+tJYJTAsYULlIT3EE0C8yf5TG/Aq/F5aPd8HUwtQTh80WMmut6k10sLk/6goqpTUBwumfpM
	/PZTEpDMeiH+0Ycal58WlXnTw45BRcZpxCZUNGDsXiIJFygNkfbzl9HQUdWECSoPzgFI/TjiHzA
	eWUcfe/Dm56YWNxdR++29XdBDNLggk21Ntm2ZfTsS8eCuwJKByWG97RoJVlHiEQezIRVXdYU6dG
	EP6IHJBbkX/uGmEQxiDqGJqy/AlKWYUI7nYo0OfIya3YcWVP+jJrXzKp1i+5BBiKKQ6NyhFSi+B
	uJ3/kKNyGM6ud5iEw+54lmqMdMMf+6dz5j0G3QLJAZrCYy
X-Received: by 2002:a7b:c38b:0:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4953c28b6bdmr14477935e9.32.1784105076212;
        Wed, 15 Jul 2026 01:44:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-239.ip49.fastwebnet.it. [93.34.89.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953f643acdsm3214055e9.3.2026.07.15.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:44:35 -0700 (PDT)
Message-ID: <6a574873.3027643f.39eab0.b4c0@mx.google.com>
X-Google-Original-Message-ID: <aldIcfPxkeociXyX@Ansuel-XPS.>
Date: Wed, 15 Jul 2026 10:44:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org,
	heiko@sntech.de, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
 <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>

On Wed, Jul 15, 2026 at 04:17:50PM +0800, Coia Prant wrote:
> Maxime Chevallier <maxime.chevallier@bootlin.com> 于2026年7月15日周三 15:31写道：
> >
> > Hi,
> >
> > +Christian
> >
> > On 7/14/26 21:08, Coia Prant wrote:
> > > The current XPCS creation logic in stmmac_pcs_setup() is problematic
> > > for several reasons.
> > >
> > > First, if a device tree specifies a "pcs-handle" but no select_pcs()
> > > callback is provided by the platform driver, the created XPCS is never
> > > used. The phylink framework requires select_pcs() to actually return
> > > the PCS to the core, so the pcs-handle property becomes effectively
> > > useless without the matching callback. This is confusing for developers
> > > who expect that specifying a pcs-handle in their device tree should be
> > > sufficient to enable the PCS.
> >
> > I think Christian's work on fwnode PCS would help a lot with that PCS
> > handling in stmmac:
> >
> > https://lore.kernel.org/netdev/20260618125752.1223-1-ansuelsmth@gmail.com/
> >
> > I don't know when Christian plans to iterate, it could be worth using
> > that new fwnode mechanism here ?
> >
> > Maxime
> 
> Hi Maxime,
> 
> Thanks for pointing me to Christian's work. This looks like a
> much-needed improvement.
> 
> I actually spent all night debugging call traces caused by the current
> stmmac PCS lifetime management, and it was not a pleasant experience.
> The code feels like accumulated technical debt that should be cleaned
> up.
>

Yes we also got a similar situation with an ipq50xx SoC where the
standalone PCS feature was implemented (I can add reference to OpenWrt
code) and we also had some ""magic"" code to implement PCS as it does use
the DWMAC plat. It seems for DWMAC PCS is very abstracted and have at least
3 different implementation aside from the common "select_pcs" one.
 
> Regarding timeline: since Christian's series is still in RFC with an
> uncertain merge date, I'd prefer to keep this series as-is for now, as
> it solves the problem for Rockchip and has already started receiving
> review feedback. Once Christian's fwnode PCS work lands in net-next,
> I'm happy to rebase and convert the Rockchip glue driver to the new
> interface.

The series in RFC just because i posted while net-next was closed but it's
not in RFC state. (sashiko is starting to hallucinate problems) I plan to
post v10 today but still low review aside from ""lovely"" bot.

> 
> One thing I'd really like to see: the ability to specify the logical
> MII port instance via something like:
> 
>     pcs-handle = <&pcs MII_PortX>;
> 
> That would make the DT binding much cleaner and more flexible for
> multi-port configurations.

That is exactly one of the main feature of this new implementation as is
already used downstream by Airoha SoC where a PCIe PCS expose 2 PCS from a
single provider. (the code use the simple consumer/provider pattern and the
driver have complete freedom of applying whatever logic is needed when
returning the correct cell)

I think the idea of Maxime is to test that series on most Scenario as
possible to verify for fragility or regression on it.

(but just for Maxime the feature is getting actively used on OpenWrt by 3
different SoC and no complain for now)

-- 
	Ansuel
