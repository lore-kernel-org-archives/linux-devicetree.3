Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7534D92C
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495843; cv=none; b=V6m7EE8Uu29fUDvjbrKvoCGOoktlJVR5AnNgiWbcxv+yKfW/FiPdEP1nRaAh/dzKgrrlE2yuvK30dJQuG/aJj9qABPOykPFn1Gqkt6JRa5+gPYzTtUsPAlzN1Z5SePFbo/mTncNHATrh0X4hzP/hsQGoacmRD4ive4u8j/Xh/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495843; c=relaxed/simple;
	bh=Wsqebf9WrjFQdgwRqy5yFQGUTloZSCm7NH3pE60b+qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUs0VZ+mueVDc8UKDJ1/5IKMTY2+RLLpPgLKKfLosPgZQLH7yUsn4PvyrLMd1Eg7IanlKD1vnexBySplF3xPF+ehtdxziASkNRCx06Wnqn9Rel5+JuNi3uN70DclnGmnHTwXmkOftdSqracA1swQX7I10bREG9byAYbtaTEcIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6mX16lC; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6mX16lC"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304545f5206so17291636eec.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495841; x=1781100641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+Nsk+vqXIyBd7fxqKZqUNL8HC5XArruDYOxkLJDrxI=;
        b=P6mX16lC9WYAN6OdLoY3aojdeY8rapdYV029YnqCmvlCD60P4ttZIDWxgYobZm1IqZ
         ZZs56eCfrzAkbv5TmUpG25ZmJB7bWgNiwxyKuQn0fEbAnTQ6qRpNzpbLQQ/IH40Jy3dg
         cFyFx91vE1+ggtwqJHolc15JZz0DN2ZiZLkEY44auMWte0HqBTjNwmUKW6UBrDSgVBoN
         2y3kY0o4ofm7kWapIEco+yZRExSZVux8Ho4xcMI472tVQ27WiiffcxgvmylTmhGfGt6+
         Q/ZSuEtXy418QT+7psPHbvzz4uskYOw5i0WyVe7dWUpmCmuoITlryH5UAjW2FkRN+HGw
         L0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495841; x=1781100641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+Nsk+vqXIyBd7fxqKZqUNL8HC5XArruDYOxkLJDrxI=;
        b=GWTD+EQQYt61eVf00sS3VxQCB4BkeRHFLZxfM0tLz04YKK7TZMKLbMl+pdmFijOUgH
         ZKc1XWEwkII4AP0F8cR7mpfkQLZIaq6Cuu6rNyFv7ODHrwwQksdN1foVvkzyQ6flFv99
         y3AaYfWwbpZrKkAxto8lzri8r66iiyPjTEcLxlu3dnveSVCXY67jTNq6oOn3weG3iPUi
         k/rwW9K3j6S41gaAsdtvNKGGWNfjRGWsysRsEboExkO/d7nh5CSzVfOEvhf9rSgLpF/p
         w/FSNj6G2UWh1lXNNJsSKyBZC64xisK7ssEz0Z4Kiomj1Qcx56m7bHu4BeSRKnuGiRLf
         4mXw==
X-Forwarded-Encrypted: i=1; AFNElJ8+mS4H/NF0AeLL4ok9JI6GwRXbEhrqb8GtUYIwmS/qEvkyqdI3kZal2LQHgoLgEmHqZuejuVgwsNTg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ttpm6jWFZ8Ez32c9b93K0baVAAyTBYNLMNOXxgzLskQG960G
	v7EoK01WpQdgxNysdJB35ii7AgthIMSyhGXIhbWUjqj5ZQ5cYgkwiYZ9
X-Gm-Gg: Acq92OFusDyEwt7GmRKOEwbcjUUEEDXOXS5nHeZyLK1x2AlteVWnGmuIznVDO2nmvnC
	Zr6TUIkaDh3Pd0gYNYu5j5YlXWoqx/BCG7aLQ/4pjAcBxMhZ0QB3ry8ZZyfwEYkLBs2lQrtN93a
	RzYFssjqcKj2Gs3m4FFLuqNi/EDTjKm82iMlzenP3OPeDLUIKWDEdxq901f73dSYV5tcF/0skO8
	Kw53AcLBcIB5sazUqAhlEc5vFrgfSlFyikaiObQMVsgbu7Ps5ofiA0PGe2BW2T+bURL7QIEPgTf
	3icCUVMgSL93EX6sWqUVNhrASjO+RkHCrHkaaI+PIaC+3LAgQlSN9CHGHWLlUyQSLCANsp1nHaw
	0HNjVpHxkQXtl9h46iJLplS0daa9TEUKLcdA/RB70TDE0yRrJML39oAG69j/KF9XcLIccHDGxZt
	kMaIwnaJmoQ7pzbu+WkYgltX/EU2jHNEUZOVOMKdfMsxrcKb8bxUd+cA==
X-Received: by 2002:a05:693c:25c4:b0:304:cc9c:35ae with SMTP id 5a478bee46e88-3074fa3b7abmr1608250eec.4.1780495840722;
        Wed, 03 Jun 2026 07:10:40 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db525a1sm2453217eec.1.2026.06.03.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:11:06 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v2 0/4] iio: adc: Add support for LTC2378 and similar ADCs
Message-ID: <aiA1-tAnRjYQu2EO@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1779976379.git.marcelo.schmitt@analog.com>
 <ah_e4ovBsXQ-BVcw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah_e4ovBsXQ-BVcw@ashevche-desk.local>

On 06/03, Andy Shevchenko wrote:
> On Thu, May 28, 2026 at 12:02:53PM -0300, Marcelo Schmitt wrote:
> > This patch series adds support for LTC2378 and similar low noise, low power,
> > high speed, successive approximation register (SAR) ADCs. These ADCs are similar
> > among each other, varying mainly on the amount of precision bits, maximum sample
> > rate, and input configuration (either fully differential or pseudo-differential).
> > 
> > The initial support patch enables single-shot sample read with a GPIO connected
> > to the CNV pin.
> > 
> > The second support patch enables high-speed data captures with SPI offloading.
> > The setup is similar to AD4030, with a specialized PWM generator being used both
> > for SPI offload triggering and conversion start signaling.
> > 
> > The last support patch enables running buffered data captures without SPI offloading.
> > 
> > Some structures and variables are introduced earlier to reduce diff in latter patches.
> > 
> > The initial version of the LTC2378 driver was developed by Ioan-Daniel. Though,
> > despite of the many changes I made to the code, I've kept him as module author
> > to provide credit for his work.
> 
> No datasheet link, no explanation why the brand new driver is needed.
> No need to resend, just answer the above questions.

Hello Andy, thank you for having a look at this set.

In short, this new driver is needed for supporting LTC2378-20 and similar ADCs.
Even though these parts are somewhat similar to AD4000, the available HDL for
high speed sample rate mode is different and the wiring configuration is also
different. Because of that, I think cramming LTC2378 support into AD4000 driver
might not be a good idea. I'll add a note about that in v3 together with
datasheet links.

There are some good points that Jonathan and sashiko raised in v2 and I'm still
working out a solution for some of them. Will share a v3 after tackling out the
remaining issues.

Thanks,
Marcelo

> 
> > Link to v1: https://lore.kernel.org/linux-iio/cover.1779117444.git.marcelo.schmitt1@gmail.com/
> 
> -- 
> With Best Regards,
> Andy Shevchenko
