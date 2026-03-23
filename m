Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93732D0D4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262352; cv=none; b=NRRpFFQdJcIIXvQUtCewGwzEUwj6pzc+LPwwjSRZgQGx94EXvz6pbTbBjgl4B6yQT0VB3oKHGzHWjC+V5aSAyBoNYqkJVez9lpxvqQY/Qsc5L4chRQ+xdVfA2+o2CWetIna6Mvv0gkMHYz8ms57+w/ohNkSlvW2KYB9x8jQn3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262352; c=relaxed/simple;
	bh=UDWEIvLyNmaQHFkjgBBa621HLD+9p3aJymavqogy3yA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4iXA4NIWQz4ST56jV9tIJ5kCBkZzl4T9gscjURLyB3XoecFd43fJc0kFd+gx1AXORYnxalSi4Nr9hgaCdK4W25acqThgOCEMKbIeVvL4SJDr2KAd9Xhy/KRJWU7vIFzUzn1+BRK+eCS8tgmHS45XtPOjgiJAPxlLoVaPr6Y/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj/TKRNT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj/TKRNT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso37970885e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262349; x=1774867149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyAmQ54MQqnSyXW1uh9rMURaCJZjCt+AxwiUOewIEsw=;
        b=Nj/TKRNTawvBVxhqCoI4DIRqW0JH5YWrf43d8tgMQDFkxnxBQDbv0fWghw5GGkqBHw
         eqUpgq9Vr8JgCqi5tCzo7LQQsbZnObPSNhrn5WL9kjuwOaxQS4o2tp9NicMFHBjUL61o
         buvpqq3wZU4+zD8jPCjyoNd2RL+nxVPF145QPFPKgGg+WMcP6NywaKmjMSdR98ieQ0ox
         zbIJVNd9zPo6fkA9EMBpD68q/CshyxZvSWQ4I8f1QTwCwIh7DNRzaVd65GIZIwCmvZYU
         RbTLAlupYmNcVhz0TC2Da65DLYdaz4uGnlmHC4Mn3AWfWWH8zXULeKX/nKOhBLLEP+Te
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262349; x=1774867149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyAmQ54MQqnSyXW1uh9rMURaCJZjCt+AxwiUOewIEsw=;
        b=pzeMYNImL+mTd0ksml8d8m+grKBhNQb2+ORcWuQBjTS/siB1/AcmR/W4dKYPqEXATt
         Lu62FuTBo3Jh7R9LfuPMTL1iZAYHljxrjAqkmUUL2r5caWdgbk2KjzFCzAtBL0iXREVe
         Hyr5w7pE3lQYYSKQv9UG0zJ5F5PVRPWepKl3gpBsKdn56D8HrD6wfw6cEnWj/rqGyXcv
         /0OWKyI7SOx1MpQeCbkquNnDK5NoLvL3+S/pV3SFRYiaVtLwIo3LvyrkVy/rUjYBQgoK
         odGBDpGKO22gtZuVEX357VmVOL8ACl4mjv0pn6tJ8AkxGxwappy1LrjXw4NxWkYPvVaS
         /7vA==
X-Forwarded-Encrypted: i=1; AJvYcCUk2uyJvB+gtgkeZp7oBG0ItSkG1aZfbONmkj23f/EeqVIN21ftZAEZbMt5p6OvO4XiXdSjp+SoL9qR@vger.kernel.org
X-Gm-Message-State: AOJu0YxtixLqaBocJ1rRgbK8vo4h55YEx8NvvEZF9mydaz2fx+2OVN/w
	YMMKwJB3ZogCF3JO7NyyQu4AI2U59znsuN8MB72Pi8Wv8yxV9jQy/th3
X-Gm-Gg: ATEYQzzap6kTuxZg+F1S6HaJoTxF40VGeulmHbHUa13LekKRvw8Jv2PkZsKaxNFvBfc
	Ju7tVyGtk3p15/kTgnQQTafMLbmkEcJavxGvFZcpqj8qNdWWR+Gn+VYJ7pbhT2KmOzYCl+3UpiN
	owv0xdBlBIb07SxLOHW+fh9fCVL+qjUPLgqfLYcwd0lYKNa5wW3MO98xiWDU77nu0YS1qy4+2DB
	ejXUHxO+yNZZ7tqX32iWPeQ8AdyCrsB46w4W9ghjH7HdBRuq+RlBZQKZlcdPHH7qjDVJ/QfHQja
	FUXoyRSUiQxX1oBiPmMdlLpx1HIQyoIiQFjrzPjngI0lHf3vlUzj9kjJj3TF+sow5irCQJVR7++
	FGDG7VwQ5F9YESOl4iSRUmflOwG6qQpXiLckVBytxr3s90lisVwRppjF4133DlzzUlt8Rog8wDO
	YUsQmSMpTSHbdyX4SxZa4WPENNWYoOC45DhUWPYYgk3xpOX41bHYcHoLDWUioXfIuQi5lhAFCw2
	uf81vtVG4SYrUP/UchPY5pBo8iwWnIG1FQfOjKkUfuPtLm9za4=
X-Received: by 2002:a05:600c:3b8c:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-486ff03f4d3mr174115625e9.32.1774262349253;
        Mon, 23 Mar 2026 03:39:09 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm28050250f8f.24.2026.03.23.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:39:08 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 23 Mar 2026 10:39:06 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 3/9] iio: frequency: ad9910: add simple parallel
 port mode support
Message-ID: <oqspz57p3xgzeq2lvcvhgihu3yeucufdjxurwc3dpuvj6dfu6j@kv23vp6xxud3>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
 <20260318-ad9910-iio-driver-v2-3-e79f93becf11@analog.com>
 <abru0mNtpJSPSJux@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abru0mNtpJSPSJux@ashevche-desk.local>

On 26/03/18 08:28PM, Andy Shevchenko wrote:
> On Wed, Mar 18, 2026 at 05:56:03PM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add parallel port channel with frequency scale, frequency offset, phase
> > offset, and amplitude offset extended attributes for configuring the
> > parallel data path.

...
 
> > +	case IIO_CHAN_INFO_ENABLE:
> > +		val = !!val;
> 
> Only used once, why do we need this...

Next patches introduce more channels here, so the additions are easier to review.
 
> > +		switch (chan->channel) {
> > +		case AD9910_CHANNEL_PARALLEL_PORT:
> > +			tmp32 = FIELD_PREP(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK, val);
> 
> ...and not just here?
> 
> > +			return ad9910_reg32_update(st, AD9910_REG_CFR2,
> > +						   AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> > +						   tmp32, true);
> > +		default:
> > +			return -EINVAL;
> > +		}

-- 
Kind regards,

Rodrigo Alencar
