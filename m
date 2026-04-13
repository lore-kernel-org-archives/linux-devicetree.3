Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CAD3C1992
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083966; cv=none; b=EE20viYV2IGYq3nGT/Ae9DFd2y9uhORZgvrk8PmF3rN3RPyb/qrAh6I+09Ctq023iq+dc5bJOdZ3zYjU7WQQJk4zADzIoyZLAsO72eGYxWHCQq/ZJrZZo0cajHtkNvUJkQ36Zr0hImwGP59B5YCddBcw3pziU3DWOIs7g9b0Btg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083966; c=relaxed/simple;
	bh=Eltpam/vgsJqWDDmBNuLJKAQCg+4CI1hVv/dIvLONqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYvlUf5myuCb7hl6NSFUpwGGKEip+MnPoJOuhZIxNMmUEBPR/KjH6jfrXYUiDNmzsjqtjCrp7HxG4KsST42rKOFteoSf00YJEQUhUk1C69aRNW8K46H4xWdXgdwolEBo+JXqKDYndeSd8MSHCxFPMVwCwCvOlePso63fatKmJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE2huxmg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE2huxmg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so5443384e87.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083963; x=1776688763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=dE2huxmgsrvgeQjSjbFocoh53G8iOpb9tXjIh2gY7JQ0RG0Frm83BxuPJp5yN29h0Z
         oyqRsBOeFrBhgncksJeeBQmksTuHmJLrMc7xKck6iSQajEldHsrgXGjnAra0ajck62sg
         V1KnbdVsUgq7iv1A50dRhJEVabUmZbJ6ZyUHzmJNXBGFjXInr8gY4XbYFttuDmONGd7S
         Mq+B3eB+UMlHGC5A7T3W5XPzXA4YFoTMbtVauSvqBAgT3i1czHTj3Ipo0TrqPhbw2ldM
         ePFKEoqNA/MGfdJOsXehiAZbclL0sFsS23R2Sn8GnUgCpNoCTFPNiB2JJyV1/1VRo9wG
         DJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083963; x=1776688763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=rL35g+Yiqpa1XAGy2mIMMLYF469i7sTVNdU9J9bNU2/nPvuZDMQv2QFsS+hmjHN4G7
         cKSOWKglAZPJ4ah74mzkCgPAKaed0Uyouj+JF11dUEOu9eN9wdQ2ebix4nctlVGvStyz
         ROvFSUldOXduLHDjibJrCd5JJYNbMZJX48P2kT6PmabuNKMqa6I1GC1T2Fzzry7B3V4f
         DiYV1iMHvPMlF/ivOOOgGl5V/qffnu3OOnR9AZS+48qmkHeeCqUY+mMRez4oHLD8pR78
         zVVY+tBo6IZyOod9LXTOnq0ogczbhENLd4XdjtDzdk0ipxZ8R36xLaA7GD9xKq9pateO
         s2ig==
X-Forwarded-Encrypted: i=1; AFNElJ8i7ZWd7mwA7gFFhFXxpY8aa9Z2sWCRQYssF9xVvTdJHtAszqvMM1vZk1YvTHnWuix5nd7+YDLsfwMp@vger.kernel.org
X-Gm-Message-State: AOJu0Yytub12CwvN1ifiC7dgw8Z87qgBWstpV0LSc1li5QlsFmuK/38w
	0yH5HbKaTQR/mI7kebMe49iNh3lvlOk2fnXJh/fZ4A9+fTPi+moU6J+v
X-Gm-Gg: AeBDievWk8ffC3YN9p038TeA+mn4Qk8NcCJZ0WQpyYCbCk3s6CDBY7Q/B3nDsTj0UYt
	Nd5fyovgzFpVY8BlW3/LHWaENP9APgFPOXb2Fkt+5fwiYYj9Z3vI+P3ZRH7GFItmJDetSvm12M+
	T8Be8288VWUoqbqM+Dp+MgnnI5p1NNPdEzw+Bs4aHBD9oC0oH/6utIRcgaCd0akv4e4lAbnTc2O
	g+CPwPoh7ZsFcTHHfPm1wBeoA0RO75cwjVbysnQwBv99uTN5v9WGYn0PaG9HvO4SUIAKLMi1XwU
	3foqP9Evu0txxf9h+GbhgrB/1FdFPp8cH584wAe38K80EJe7qt8o8aVWSEzC7arG4QOppwHD/Mt
	BsWzD/hv7fhU8E5S8DUNqQGw2e++cKWdtO0wlHea8IEkSRwEPxjUovXr+TGPo3KsXBtfMc6H7g8
	pCBWmmXW6GFdYoPvqwtmLcWtHPD7dJwttiCed0LIZprMzqig==
X-Received: by 2002:a05:6512:3503:b0:5a1:1496:922 with SMTP id 2adb3069b0e04-5a3efd8b5c4mr4514818e87.33.1776083962516;
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef00327sm2532549e87.73.2026.04.13.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
From: bigunclemax@gmail.com
To: richard.genoud@bootlin.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	joao@schimsalabim.eu,
	jstultz@google.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	p.zabel@pengutronix.de,
	paulk@sys-base.io,
	robh@kernel.org,
	samuel@sholland.org,
	thomas.petazzoni@bootlin.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org
Subject: [PATCH v4 2/4] pwm: sun50i: Add H616 PWM support
Date: Mon, 13 Apr 2026 15:39:20 +0300
Message-ID: <20260413123920.2459916-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305091959.2530374-3-richard.genoud@bootlin.com>
References: <20260305091959.2530374-3-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Richard,

> +
> +/* PWM Capture Fall Lock Register */
> +#define H616_PWM_CFLR(x)		(0x74 + (x) * 0x20)
> +
> +#define H616_PWM_PAIR_IDX(chan)		((chan) >> 2)
> +

It looks like there's a typo or a mistake in the PAIR_IDX calculation.
It should be like ((chan) >> 1).
For example, for the 5th channel the result will be 1, but it should be 2.

Best regards
Maksim
