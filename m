Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D8495526
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851660; cv=pass; b=X2IB+AHvEFqg+cgYR5huR1y2ZRReBOSuzBSNau/Jwi6gMvXAHmlIRDE/Sjmyb8A2mv0pnRtyQbbbBze8HCnzeBOYc0d/z8vG9rBkFcakDn8X4TDYlMuDpbL+aWJeR8a5F2kGnla2B1CQd6Pk6dONxKx3EwDLBqfOyo85IQ9NkPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851660; c=relaxed/simple;
	bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3ThqXfherndlKupiRk4vhPbXwRXNv/2+oG8upWOMuE5nDsAx5PyVT70XBSYknLExLh8z0mT1r6L76o5tJRGLSA6OV9xpKmfHNPri7W/MZO3A9mUgo9wngCf4DekrmgJvpYOGr+9OChdr42Atbwp+2cL+6cuvbWdJmG/xve5jYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqebu9kI; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqebu9kI"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso702661fa.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851655; cv=none;
        d=google.com; s=arc-20260327;
        b=UIvSW4KB7PGdMyGJnTG1VBgK3PccRW/tRdUYbseCTwmU3O/ZwfH0Mh58qs55Zidn2c
         cufo3rBFhA+EP3bzlbnFQ3Kg6Q7G3YnTIX3yvOApOG2YZmZAPSITQh4Lt9HQTUIwHhSY
         2vBek5vyWOBytZtS2lySdPvN8Z2b3PZT4bmmPHtZhXUbMtLTlAAInCmtKUWtvBCqmX2c
         vflHRgzhHWbyWXkZekPv3yetmyAbuCrG/5ageTdDqCaYyyUurTr5Um0uR40w1OimsOLK
         NVZCUl6SZ3S+tn+4NmPLmdn8wLOsIYAXnmYnNvCRoV2OMuetRES2dexL0nON0fovrrFs
         hqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        fh=RuK6S9Z7YSC1+qczeGb1ly/gfYy3zofjlJvDkkEcsTU=;
        b=WXZ2cVTB/L0vHAIL7HAlpraOd5D0160c+SJIsasLG5GC5hzL52KBWC7nK96KXVQlZ1
         kK4LXW32mPpZaktEjRubxnwx5k8wHSvxkNEEDS9jhzc9CZErFGUop7ZRqTqbvu1X+lo6
         QcGHH/+T9Uh6+T+ToA9mRZp7zaK7/6ZqpqABdnvl6zgRL/1QTvg9awK9u2TlPVlu3YMg
         5SDTQEOfKwM+JGfQDNqQ2uPvwPYeHaogA0b8XdSDYShrVFDYPzTwBYCGRYN5ao/Cn4OK
         smWwS5FKKV7JP2byVj8NZLlldHJRf/8oN4BURXcE65k6qsAGyz3xfJh+Eu7euqNtmJw1
         FQtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851655; x=1788456455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=eqebu9kIn1KdNwwDWR9qsI1okv8GRHyA7WCPkRLt5s/V/9miIz5qmq+h/pfFg6HLDy
         ytpDDnnx1hk3HNruDfyT+413QN6AIG1j33eWVnnrgFVjNON0909xUr3zM74oLpd7i7Ck
         WDvWTsI84NMonhzQ8+Mb1OMfbZc5Ag4NF/3f9/OW59+DAXycr2VGA/uNy0o2lZ8zRmdL
         7zX4jTy14T6kiLLh9uD/Z1cPZDgJGKeoX6PU1lia+8er9D79yDfpFP1M7OThfSXi75JW
         ojx89OwyRy03HG3pIKrca6F3NN9XURrJjM3EGZ2UafMV6vUuzr2Ny0YuWXdKIQJeD7aq
         e3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851655; x=1788456455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=bYtgMO7KwYn2X0XPRPmlTk323fkJuzcsI0yfrIGbXnSbq5xHGQWy4Xa6tZSVGmy6JQ
         zYbwIPogIb5LVWmTqnPAuBNsLGd8c9oLQlYbPC40uZN7RLCw+iqprYGeecZOHuCRopMO
         wz4c4Pz6faJyyVK1by4GIY6C7G6I/hzt0J1tS4/3MbiI9101BQFyaCluLhdy5FpkkiQd
         eqM1sUn1Y6yJF7IP8q5uo3w1g89SwV5APu67P9ToWBjhBtuDS++69s5PzDAZI8ZjZ40Z
         qWHkv5JR7MmkPKmCUzObOgdR4DZsgs47RlID6K+SaEe1f+2tay3JE58PuRJCSrlQcg7p
         2XSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotlc9akMk6sP2db+t44bfp9dBYq4+HkGR6jyV3BuOW2d+YHKC8mhGJDYyfjC+aHFYmvC3mD2Oe0z9R@vger.kernel.org
X-Gm-Message-State: AFuF++mlWe2n/O7NFSjusmHJbEWtB5FKp2qNFEdyUbEAddzW6O4bfo7A
	lUShw7vl/m9UMy/MAyrJwJWk1dhJCNZsLxEK1M2b5/CQ5lQIaaeQZNuodtEsUPbVXXwzZEV0ZVP
	NPkF8E/6iJ1e9rFjEUgE2+FUzLpJ7eTg=
X-Gm-Gg: AR+sD1095fiE12+vteq3yso7D3WbZkNMyem5rCksb//BgHSPt799D5KPRrZgnXeseUB
	NXF68M6eUaQRdiasHfFIS+jS/3duaJRTXZtA8BrZVCdaMgnm9a86FiaY+YgOTmKxFJbGEa8yOUq
	3QbBXPIXTcvq1Edlww8RCOmFm7vDHV6ex1Yt5De5C1oGVheOjnpv2cWDShw6+sHknsJmroBXhVl
	junX/ihvtcn+FG16VCPkrxDoe+3z+nKzi3T22M+Xrd26wjqYxWZ9EUM3bToJ8teq2/DHfXbq8Aw
	2UqA5J/DRPIRwolsE2qZPLmOk1Rvd8Gyrn5RRF+DXao+jzJ5e/7yVi5dne/a7FZ3bNI7sht2dQ6
	K2Q8QF/BrDwjE2R5lScNbUWi2yg==
X-Received: by 2002:a05:651c:43c7:10b0:3a1:980f:5905 with SMTP id
 38308e7fff4ca-3a30187d5eemr119801fa.3.1787851655217; Thu, 27 Aug 2026
 10:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827130335.6606-1-gvalkov@gmail.com> <20260827130335.6606-2-gvalkov@gmail.com>
 <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
In-Reply-To: <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 20:27:23 +0300
X-Gm-Features: AcwNN1XMmtv8Tl2z9UfKPdkvBE_-gNrpL34xpH-g_gnIEgIMH3CQYCP7LMwA5gY
Message-ID: <CADOrJmY5jZvn8zEu-jCntGChXSY9wRd3bsOy1GB0EWNTY9GK6Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with
 platform reg domain
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, 
	wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com, 
	error27@gmail.com, s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 18:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/08/2026 15:03, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > The change affects only platforms which explicitly define this flag, and
> > helps overcome the incorrect behaviour of proprietary radio firmware.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Tested-on: WRT3200ACM, OpenWrt
>
> OK, so this comment from v6 was not about binding, but this is still
> wrong - there is no such tag. Just make it a standard sentence.
>
> Do not introduce OpenWRT rules in to the upstream kernel.

Dropped the invalid tag. I hope this is suitable:
The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

I sent v8:
https://lore.kernel.org/linux-wireless/20260827171937.28878-1-gvalkov@gmail.com/T/#t

Greetings!
Georgi Valkov
