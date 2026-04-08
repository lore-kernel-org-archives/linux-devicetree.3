Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2C3B38BD
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642786; cv=pass; b=F4lKoZdnwKCKhDTUMBle6kfOeLyQ74po5ryKg5MGBVegby/3cplO91SD6HBEHw0IBxQ52I5YuO+xd0EdU3+V9anOVUNgTTPdxaHecSkH8Pp1tx2LFo4+2HTrfGKj87S6/l2I8iKtoLHc55ZD3RXN2B2SvO4F5Bx1j3CXrjk6Tpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642786; c=relaxed/simple;
	bh=xGgP9fDYtS3WSr2U3WvlhSJekoZgxb/5k6D0cZPb1qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3C4qYj55HLud6Oao51GPWzb2pgqcMYmhlYZeWov1R3MMjuTb9J9FNxSPqM65qCq0flP+BwL2eS8INjLAvfjfClQXtLi8zUHD9Ya9bG7UeliqhJnf+apAbjN9o7yMbtoJe22wjhfvbW/PuhNSM8N8AYGqxPrJDcgLAPaQ5j9bp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrBro6kx; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrBro6kx"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-685013eb58fso1713859eaf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642778; cv=none;
        d=google.com; s=arc-20240605;
        b=jFLzuvKVQGVl0C5/j6Dh3QjjEX3MK6JixjARv+WxhWqSbPtOudrq+0zEDAUwAfBcHJ
         WwZGFvy3YjwAp+szM4TnJo+UY6ZAIC7iYmuqOywWzwA4taNuqhwqY4z0EYaTwwx3iurh
         gpdV0FxnXrj7QGQPg9/qwEUkrtdEgPvfZ/NndzBSJbD0H6QQob8OjLgXj0hhF3uZ9EJX
         n7v5fz3w5XxwRxjKkAVtZ/CiKtmv6Yq57cNLgECSCvNbIVmTEX4YnD5t/ze4DN/UQDql
         8Gzl7Mz/gEOp8x60dk/DbBMjD6gii+8/iIFJy5Ezw2gE7f4Uj/sF5QmXLhEO2suZXV5u
         OAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        fh=WLfKOrXqnxXPvzHmRVFb0bF193Q7Oxp/ypONCVvents=;
        b=YA7liBpGSHUXxp1rT2IaXV42BeFwNBmJLVDp7yE4Mzsgz0MvTFjbr3Ud903d7LB/RR
         C4iQ9S36Fexgm7zy4cIhONIf7GgiPLCYPhgoSEyz5/6ScapoA2H4EW4WZ7TXQrYS0881
         tOy2FC5hiKBul9FacBhjL9NbnQaN5aOAKGDt+oBVDO2gLj/IMbdBBNaMVUsaD4OoBGZe
         pEUXos4yvdRZKtWcqTV5sTHCC4l9Ov7Cvf/7OrOjAdfzuG0ssG7ZCWdBmFXbw00l2A4W
         ww/zD9kgW8U7qKbMuSLSzCKADjx1z8ONG82l9n5QBrP4MWzNXWtnbvYTfO19hIQ/kOmT
         l2kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775642778; x=1776247578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        b=KrBro6kxjtdDn/pnUhcBskwqj6Lw1WDC1YDuUsz96TZ6CVv9QAoKOUdm5GCzYZfOim
         AmuWUo4W21DlPlnbAkKYJwZ3OPPBnWJeQRrkFuZTy2EnwtlKgHjOgJwRVqo4cnzLsxYD
         D4KwnfVR5jjs7EVLSKlo9nU5Z+KQphwYi7yBo1MB16DVlhhZTKDOZu1X+p2g/p17J9Ri
         c31cPKz7a6I375lHmvIkhHfIBrvqzn7HC5xJMr3mTcPnqaJh15iDES6OZxtvsR5PBcqJ
         J9MevgQKkmrRsKVTnxzeX8ZhBYwY9ho+EfPFrKbUQsafgKFDIIeQ/+lFvTVvHJvlcEEI
         nMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642778; x=1776247578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        b=tWnwrMbufLHS0aU4JQluLBEvEryVFso8G7L9UQUSspCPeikKCFRwXMNvcnm7BUc32n
         FCaI94Hc3imYX5o5914FhuYTbz6HzorQtPuxjtoFRTjOSODUsKYZCJ3RtkQYyyOtaUnw
         IUwqHBTgEJt71/iH6t3ysx7++TgkKhdOtcWnqPJfTzH/pBQOGrOhRmD5o5gStuORAG8i
         AVd0jxQQ8ff6RZGxagUHJv5MSlQc6RhS4YhBEFt/thHZhNm4g6BvLZAQgHauyhlmmSGl
         +9cstsEykqdmWRe1FuugFTkbrcD+EmhsFdODJyuAgv33CP9WLEOcY/7XT6MsWzWS04DB
         n06w==
X-Forwarded-Encrypted: i=1; AJvYcCWT8j5fygDgKgPpMWMEkiYvMHcZ69CPGSI/rv6IIRavGdw4B1qLzG3iG1wH5jldAbDdPXmCJOOJiLNg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrf/SGtuuuljoeIoYa24B+LSlAL0sH17jGycV4K2ux/l1lhOBT
	Izu+UknjYHA/+oeXteqhrCayLkxq7W28DQEliF2eURH4APU+RHGYfTLwf0qDS06+wrpp68hs/Ee
	mDH4owMcwOcwm2b/pizPdxu6LC2ByIq8=
X-Gm-Gg: AeBDiesmaWhT3IQVCKf7IYt0hnwmjXnACv+McGc0bxsNnGk+i+hJvO1srbfrhfHv7cC
	ud/0cVXFhOHa3DO14fwKqIQR7M2ZE/e7HblcgKwJ93pWJCggzIkU7QqvzSZPWfhG/sWsFu8jEGZ
	pnjPkDjODSyITu1bkkQ+8cKPc4GMM3ZqbugOq2yV2xCAJe8t8cWNsmWe2cP0ztrEhyzbDkJEG3B
	H9rVVjKTo447mpGMkSLWGxXhI+fmZSpd9Ods79bd/QiKqI4aaNdlxSjgDFDDKyGvnz6/g1N//pW
	i9Ubaey2qWiUVa29d9E=
X-Received: by 2002:a05:6820:4c81:b0:689:dfc8:5e39 with SMTP id
 006d021491bc7-689dfd7aa8emr204810eaf.43.1775642778479; Wed, 08 Apr 2026
 03:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com> <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
In-Reply-To: <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Wed, 8 Apr 2026 18:06:07 +0800
X-Gm-Features: AQROBzCq50vj9APjUGuuVNzjUTGEAXBg2-1gD7Ml450ww7_QTh7MwqGYJLjBzS8
Message-ID: <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"

> > > > +&mac3 {
> > > > +     status = "okay";
> > > > +     phy-mode = "rmii";
> > > > +     pinctrl-names = "default";
> > > > +     pinctrl-0 = <&pinctrl_rmii4_default>;
> > > > +     fixed-link {
> > > > +             speed = <100>;
> > > > +             full-duplex;
> > > > +     };
> > >
> > > What is on the other end of this fixed link?
> >
> > The other end of this fixed link is the CPU port of a Marvell 88E6393X
> > switch. We are using this switch in unmanaged mode rather than using
> > the DSA subsystem. Therefore, we use a fixed-link to force the mac3 to
> > 100Mbps full-duplex RMII to match the CPU port configuration.
>
> You are mixing up terms. The 88E6393X does not have a dedicated port
> for connecting to the host CPU. Any port can be connected to the host,
> using DSA tags. And all the ports are 1G or faster, so it seems odd to
> limit it to 100Mbps. There is something consider a CPU port, but that
> connects the internal Z80 CPU to the switch fabric.
>

I apologize for the confusing terminology. I meant the port 0 of the
88E6393X is connected to the AST2600 mac3. Regarding the 100Mbps RMII
limitation, this is a strict hardware design constraint on our
specific board.

> > > > +};
> > > > +
> > > > +&mdio0 {
> > > > +     status = "okay";
> > > > +};
> > >
> > > If there are no devices on the bus, why enable it?
> >
> > We intentionally enable it so user-space tools can access the switch
> > registers. I have added a comment in v13 to clarify this.
>
> Why would user space want to access the switch registers for an
> unmanaged switch? It sounds like you are using Marvells SDK in
> userspace to manage the switch, rather than using DSA.
>

We do have a custom user-space daemon that configures the switch
registers for our specific use case. Should I remove the &mdio0 node
if it is only enabled and has no other configuration in the upstream
device tree?

P.K. Lee
