Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBD410D12
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482962; cv=none; b=MRFUcbQ4iGMaA4vd4KJBHpncycA1GPebFcIoGiOxM0r7oHy0pXN6h6IvAd3HZqILhir2WreqOjECAozGl54ZFMSxopkvOEieUVNq0Is+jWnJ42ArtPTIcIr02rbyJlDZGliuQfviBmpXd6ayzAflkiIaZKGrkvAKGfGBJ7IepIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482962; c=relaxed/simple;
	bh=b8BmgDQogRwggORM8K4eREtWvgZJXefpsvQX1y50FaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLdeD09iu5kFBHSgdDH17l1mjKgPLegtjlxULl7Bzolh1aTTrePKh9y14b3igLKZlwXshqfoExyKjHpQ/4Wz1OMiDqIBUzB7WOqeCEDYlwazICK8OAIUvQ1X/4dSuvJQzo8kp6j8ZACKNcB87MPxK6fFFH+zVLZcH3kPIov5ZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cj2kWvNP; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cj2kWvNP"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c565dd3a7so6342313c88.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777482960; x=1778087760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=Cj2kWvNPSZ8mFDgOVB9IQEtQHM1eqS27Yp//bGwnOK4bEjekHtTi+lUngWTFwqciYe
         9HD3EuMMV4lgNLYbuZeJ1k4stTstVnGZpcDBxxuUhBjRnbdoy7TTx0LCRivEnS8oH4jV
         bbcuYLe8HiPyalDNy7zruBgWoLbUCw3sMSvl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482960; x=1778087760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=bjkq4pEDSWjaBPmK19z3Iqf3v1HEY2ruR662Jt9Hh568LM8UpUdF30lFnX7A5cvyYr
         KLUNXLtb+3lKcmfVmOLtRz6qNBc9d9ZzHznMAXVuosMNQfIOsndnfCtJjNc9psqNKqg1
         qCoTdaM7JsefANf4NaIvRLFcHavnF4rIbcoTNgH5jRHiatc4+iSMkOzxaCwWbwKmnMeb
         ExxJrV77YB0Iuq8d4V9Wb8OUvoeeKczPd2wXzfB5U4mbTK094MsgFUlxMUSPt5ct2dss
         eCK6CSmJNX5HNI/I0awBOArCjv96Z2GhddBq+xt0HsJh70DBWiDwPCdF/MYkq5/yHRFT
         qiFw==
X-Forwarded-Encrypted: i=1; AFNElJ/aT3LTywXp23heK+Yk0+e7FLnOK4gsZmJse6Y54jqgz+sSqhEzlgxtITPebwV622nyC9H3qkv8uBDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oUHygVAG16xwuk04lgX0IjCVncwP93LH+EHRLOQcVOuz0vBZ
	LZgP4QUQvcfngam2VcaEM8485J86uvG5QOnMkSgQiFUa4YT3o7mHIqmkS2AHvP/VFg==
X-Gm-Gg: AeBDievWEtukGIY6YYmSORd0d8AA9HbpXBx4QFU6kwp1ZPbDTYmVk9UxRvM89fYLO1c
	rvaGD64mReJFBcUtu9wT2CDOXtj8Pc5fKOjq0vokU83oEDpcJGecWBx7u4/leykQnIKA56fx0zD
	R8WH/wpWx7Qh2FNmCJy1tqGKUK+L8ktH5U845OOQ3ALUnw+DkJ8N6wMP2vLqU19pSLKJSJ5cPZc
	hmc4NsVmD79YUf+WZD0waTAoNt6+mA5VG2iV4icjUt9IzQdQEZ9CehzyKNsEOyoXWAMoDb1jEQE
	bIVDFM4/4cOLARc9briiCu2rWcM5nQdAQQwmCiS1r5MOG0rTaYw/g6bTPURDDS/cSD4G78041Ir
	nxxETYz4eL/S3KnwfjzGMfeLVlQXshDrXPVMsUvnNyZMtvnmyHUx1sZyyzPWyu8KuLQI/TGXWRO
	N7yFlaWD7PTRwBusffDbYbz/TCtxrK9qrACO9P/KQ92yO0sw0IEEabP8vn2JwgJtKeUbR1bnv6
X-Received: by 2002:a05:7022:f8c:b0:12a:b39a:339f with SMTP id a92af1059eb24-12de2a546bamr2101891c88.21.1777482959913;
        Wed, 29 Apr 2026 10:15:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b8df:3c88:ad8d:d3d4])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12de32178cbsm2889982c88.6.2026.04.29.10.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:15:58 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, david@ixit.cz
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <afI8y70U7wFT_07h@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>

Hi,

On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
> Francesco Dolcini, 2025-11-28T18:05:37+01:00:
> > On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
> >> To reiterate, the firmware is generally available but is not part of
> >> linux-firmware and the entire process of upstreaming the chipset support is
> >> stuck on that.
> >
> > I'll try to see if any of my contact in NXP Wi-Fi group is able to help. Give
> > me a few days.
> 
> so I was in a long conversation over the past months with Jeff from NXP
> who was very helpful and tried to arrange for the upstreaming of the
> firmware. Unfortunately however, his efforts were ultimately rejected by
> the internal management.

:(

> We were directed to try to reach out to NXP via the customer support
> page which yielded nothing. The current situation is thus the same as a
> few months ago, summarized in my quote above.
> 
> Brian, what are the options here now? Would it be possible to make an
> exception and accept the patches without the firmware being in
> linux-firmware? This is an old device with no mainstream audience so I
> expect everyone who will want to use it will be able to supply the
> firmware themselves

I'm not really in the business of writing rules here nor their
exceptions. I was just pointing you at the existing rules, and how this
seemed to violate them. Since the websites have moved around a bit since
the last time, here's the page I referenced:

https://wireless.docs.kernel.org/en/latest/en/developers/documentation/submittingpatches.html#new-driver

I suppose maybe those rules are there so that we don't get drivers with
*no* legally-usable firmware, since it's about "New Drivers". This is
not a New Driver, so maybe that part doesn't have to apply.

I suppose I'll leave it up to Johannes on this part, and may be willing
to retract my NAK [1].

> and it would be great to not have to keep the
> patches in a fork, especially when trying to build on top of them
> further (such as to fix the driver-firmware incompatibilities discussed
> in one of the patches of this series).

Patch 3 is a different story. At the moment, it's definitely not
acceptable. But I tried to provide hints about how you can write proper
FW compatibility logic. I'm still not optimistic that'll be easy and
maintainable, and we still reserve the right to reject patches if they
make things unmaintainable.

(Marvell clearly didn't do any real work here on maintaining good FW
compatibility.)

Brian

> Francesco, would you perhaps still be able to help in any way?
> 
> Thank you, kind regards,
> K. B.

[1] I think you're referring to this:
    https://lore.kernel.org/all/ZUQN4Ua8byy-Fsy8@google.com/
    Re: [PATCH 0/2] net: mwifiex: add support for the SD8777 chipset
