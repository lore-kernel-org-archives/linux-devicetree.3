Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C858221FB4
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409944; cv=pass; b=JHDQLuu3AaCMsDQy0v735Hew0RwKoq6pisD0M6M8RzR0+3SYvR1Z8K8mMSm7meZJkexFh77wN9UjEHSyxEvybcRzKHhSaTaPL5qHvMih75q8DVZmARQNfjiva8zgFwkSyaMpiO9xi5BW4QQ3sqEsKD+lVLZOH+kEZ9gM+Qa1mWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409944; c=relaxed/simple;
	bh=sLN/8L1y06cQ6KWA4CLKB+Y1mIYSPe3mmBiGBLZ+Ins=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asCHNk+JFkTQjZk+rQLlpSAYe531bHbwLmp9+sGTBJkS3antzRh4n5pGk6z8A/er39hZffdHW9IiS1NeJJbHuJE4d/mISbrVIOc3l7Po+/rugkSVIlzXvCtMJ3Xf71cbDm/RSft1DePwtCAFa8y2XKDNNqDA/OK2X5D7YRR492o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PXyW+AXA; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PXyW+AXA"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ab08d289d1so1228874eaf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785409938; cv=none;
        d=google.com; s=arc-20260327;
        b=Ukx5edRoJPAXHrLiEpDvlu60HgBukhudtdVq3ATZ/cohmOrG7N618d9JFWRE8MPdLJ
         ObyebOGd5u5kBtXw7hQd5ZHCzIbuTPPYyKuYhdErXNJ3u46lDTp5M/QPHH8giyGeFW8p
         BobUnxxhWP0Ru1aniY4ja/DPclUieSthKkKNLSaOwmqqCDr9BgJyHL3ESU50zhDkCmlN
         mb8NMxB9jftgf5CpFdwnTtumKa8XhQnXVZaqR4XwFhhkqfRLGGSKDbO47+mOWpTw8IvT
         ObLjEsARRFZm8AswXAWy3tvHqAQQsdULnSYcP+juZR9mEi3ogw5hcoVFYyzjVjaxVPIs
         sB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        fh=BDVLQKxLgBrnar9YMnu1Ly9o8ZFNmWBkn6ScNkXK4O4=;
        b=J7J8eTU4eBhMNQ8Cqhv0xYi/IK8PUBccMrznEqBNS8TeXpXWD/RJyEp8rf+Ei5DKoL
         lQlkVjccPOvISkSPDNH6bwPuGmQP5wFPgYKpRVSb0zGRqK8/6hDvzD/xUNRkpPxexMF9
         Av3v9PWKTD3OsgPKcLV+AKaZrutC9qqH5/5jW/vyCJJ7LyHtFFse/3cBqFLDYEhvmnnF
         cZK/N5U8nfklu+kY+49mx/AOZDaNQS59nLWJJZOjHOnIItkvjokq9QkRvUcn/YBlLX7a
         WWXJLm1IgAapSm9W9iGq3Hmh6hgQs5N085wQEBPNzv8iqtTuZc42teFTu1WUB4xp6vbb
         iISQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785409938; x=1786014738; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        b=PXyW+AXANS3ydiN/LP3CDYr8822XsQ2Eas0p2c7hq8DNiI4s2KOsJCI/XN4vQ7lALJ
         qcM/nlUYI05Q6HmLTHvHc2gCnxxtnt/VM1vfy/xnHHNnzK+o5UwH2lz0aLsZg3x799v/
         WzkBM5y9NCzW3bGxoT6dA4ERz5fTfwjjkjluadPVlax2F7ThlIGCYKrjD1rkNOZnzD3T
         qWK0xOFl7dweMkgQ7UJMNWve71q1LI7AcSo2fK+GJmntWsgh573E4qB9vT7BtSb5ED1h
         vwvdjDKLtmKS2WwKWM6bV4F05N5MnjkBbzcl92hfteiDx0wyN0AcSIGMJ+Uffkm1kFYM
         O8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409938; x=1786014738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        b=L5iy7jYA97+IuRbXabUMq8OPrHmZayLttaG6mjMrKBSLPW0DtkjgFwTRCyHRPGKfHI
         jIGTbauLku16KJXwi4M+y6m/Ed/qvRMJ8gqtxsUcUrKzRpOsTt+0zpadTVsjFpxjaOOQ
         6CkobSEpWOwEPOegYiFZeLzg8E+QYEh12l0uuzL4v+CBnIUTwQ55j2p2q34vYWLyTEoH
         3rqjRbHnj1LCj8hfT/nik+xVIfYz8DSNPAtf9bMLaRjXO2itPRGYrsdHrKneFOM04cym
         ufbXBuyRtnLkrH24T/uPEECh9KmfD5aqgHYjkiV4oEDBRSU3lzQxliADiuIOVdXqHLKp
         fAUA==
X-Forwarded-Encrypted: i=1; AHgh+RqbjizJezP8ZK+E0MAHjpi/uiSpmfs8MUq3BQT2FzhzEuNA/RECUOd0u0mMuHfh9lFgsTZeeXNOg+L2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EI4ySeFBBqLE5oBqy7LMy/oZMXqU7/n6MO09A3EAn7M17PqQ
	MhdlVss0sYO5TGo8MLxCRpfkshodRE4atbqKOyEAIAW0dfODfPLQN6VYUxtwQsWuTUV4B12pzF3
	kGwPzdg+Tw3lq6epQtiOJZewek7BlK68c8HPqxFH0kA==
X-Gm-Gg: AR+sD12vqBRrkpoIxMVUxv9FADsaA2aWRQZ/l/bQYeBJvnUPCA1HO0mk3zSBbu7pTiJ
	Pp358Bg58ohWoyoA8KBwkNtYPZPDJFxdGucUXExTvbz0BXD0z/AV7WZMeYd8t09apg0TceSN1ST
	lrUWoK8aIlCuF0zM4HZdm2ZSUGX9S7Y4NTGEjhVLSXghbT48Jozqj2SxtV+Sq1ojIJBtr4YoCrB
	HUBZjkscS4+HP6E0Cr9zYlBShVrzl85Lea9LnptjlZopX74zRv13BaM4CosOEu43pdYVym/DxTt
	jCn3tvrlSkiZQiNu2kq4dyP88aJlkYNZfw9cqb2ut6+T9g/UANon22rYfMAbf2XKSMRi/C8vNfE
	2cNFwSBHGn2OsIImrqcoTXKgfTwXNpEkILswByk6qQnzwPfpIUz7DHHeMlxWdoQ==
X-Received: by 2002:a05:6820:1c9b:b0:6a1:9a5c:b60d with SMTP id
 006d021491bc7-6acbc15dddbmr1193434eaf.65.1785409938066; Thu, 30 Jul 2026
 04:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <178455866124.1426769.18237320419273419942@freya> <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
 <178461038136.1426769.8068222330738680407@freya>
In-Reply-To: <178461038136.1426769.8068222330738680407@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 30 Jul 2026 12:12:01 +0100
X-Gm-Features: AUfX_myGTmVBH34m2Jz8-C-my113aiV1VSAYpXPgOIiCRDk6IfxzvOQH-m-YR4A
Message-ID: <CAPY8ntDk+4aseGqijPz8Y9cGFzN=4zHPEj3HiHgetn=O_ufh_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Tue, 21 Jul 2026 at 06:06, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,

<snip>

> > > and implement
> > > it using the common raw sensor model directly?
> > >
> > > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> > > quite similar, so I'm happy to help in whatever way I can on getting this
> > > working with the new model too :-)

I'd also noticed that all the Starvis 2 sensors are very similar, to
the extent that it seemed worth a very quick test to see how much
needed to change for the imx678 driver to work with imx662.

The answer turned out to be really not much:
- PIXEL_RATE
- PIX_PER_CLK
- ID
- native and active areas
- min_hmax
- common_regs (culled nearly all of them, although I do have the
spreadsheet from Sony which needs to be added to my next version)
- VMAX_DEFAULT setup if you want the full frame rate.

Those would all parameterise quite easily.

I also have an IMX675 module from Soho Enterprises which is a 5MPix
Starvis 2 sensor. I don't have a datasheet for it at present.
That streams OK at the requested rates by just updating the active
area to 2608x1960 and ignoring the ID. However I can only receive test
patterns as all the active images I get are pure black :( I'm hoping
it's a faulty module, but will keep poking.

There is also IMX585 as an 8MPix Starvis2 sensor. I'd hoped Naush had
one to test, but it seems not. In the meantime I've compared against
the driver Will Whang sent to linux-media a while back [1] and that
also looks largely the same.

And the imx908 Starvis 3 driver that has just been posted [2] is also
looking incredibly similar.

So the big question is whether it is better to have separate drivers
for all these sensors, or one combined Starvis2/3 driver? Do we shoot
ourselves in the foot when we come to add functionality and find that
it only applies to some models?
The awkward part would be testing all variants when patches are
submitted, as I suspect there won't be one person that has access to
all of them.

Thoughts appreciated.

  Dave

[1] https://lore.kernel.org/linux-media/20250816055432.131912-1-will@willwhang.com/
[2] https://lore.kernel.org/linux-media/20260730021525.166811-1-lachlan.michael@sony.com/T/#t
