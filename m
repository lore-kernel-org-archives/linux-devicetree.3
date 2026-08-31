Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7C31E828
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181766; cv=none; b=n1ngAaCg2rBGCialhRR4sdDXtZF29/duiyCHFUb+2YrpjCxf66M7yCIo14RoqUZJvEYdiPj/Uq3+sOxHxi/L3TIm7Z8IEcsvngMo9W4qx0mIxF7x1s6UXTlCNTIxasiIxOJymlqw2LaCMYuYwc0DRlOr6mTFJiNi2D++6nHu3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181766; c=relaxed/simple;
	bh=wEk/CSduIDy3y77BOhVW/7T7N3x8NruFyaCJSoC/otQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIzup/LEKVsBOmJtO9IsNXmZfSG4PCwV157k3Phk9nV7fKG94A/MJrGHbsa4ulq7Ir+2k2RhiTErLM0zsCb0ZgQ2WxyntTshRZF5x1N3xYZxouYyUZdSiLio/0tbkaNYCN7ltWxJxpVqJvxlRTYfuW/3cMwp5jrqz1KunxCbOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1lS+LTN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1lS+LTN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so25486725e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181763; x=1788786563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMImnaz5ozXUWY8puoivAmaKF1Q7q8KDEeU/7MhVTEE=;
        b=l1lS+LTNsFDonqNbTGDKjYk4QZMzAuRXQWM4G1flipAOiMQhzkXUphzj2fu1E/vj36
         ar1Vi2xwGaogpdY5tDzRCaqL0hjv3rZxCFpp9MOhQGLE58fGpFIrx6AQSnFzEGhzk3IF
         k7a0gN2dWvtpse4JHSRNLuTnspQ33EpyOSuCA+CWKdZvSTfc3ADQ/Q7GUiO+ishSW5/+
         zSAvFHDLFwzgH5FFfGIvHhpHIET1dlcNwgkvMbu6ccHXjjwwhGDm5puVkat1xxOfvNGz
         TpQ+EIY0ntVt7FoFrSW40oPng5nBvHKKbChQPckjxfJ807RiG6lplufxQlUY2FPyoMWl
         wtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181763; x=1788786563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMImnaz5ozXUWY8puoivAmaKF1Q7q8KDEeU/7MhVTEE=;
        b=Ow0bMY/YroyS84xsDyRKk0K9xirYM8nt7zZe6zAFcRomKeBfBSF9dcQZC37IpRGMyB
         CoI0micfWYh477TtYF++/ozCp9g/4CoNz+99hs1eVkRuwFG3C6SkZ4QgqzlbLB1gD7jV
         Kboy6YgBeg/uaXV5WkRzRkztprLMfdLb6LNrOaYRSVrbpgXT0OidEdXIsP/N+Kvb5xPy
         RCtust/nt1T74sLFOXQ25pNPnOFq8PQQn45o+pc8eFVoGEnPiTgOPM6RxSqV4YIRjbyp
         /8B3dMV3TI7XVOWrC8bdaOYPzdMIe24qxNyWhchhxZpP4XGAfPu4dMg3y+kZ7lVFexpP
         T3UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJauFweDyZck7dLxH+X/4sJOPXEPiZyBbvhfi5pMCme987QJspUS9HCgXF1D2utUmOoHIGLemNI01V@vger.kernel.org
X-Gm-Message-State: AFuF++nR4K5XnSYh1qNwdVjVbWY0v6liBTHi3rC65DUro593maprl+fk
	NwPX614bKu81eeVBtZgcSIcAe2g8wNyUWDaYRgRgASSb/I7wdv4tOobr
X-Gm-Gg: AR+sD13dhH+VrZFtPZnFWcC1xr6NfTd8inshZ90/xbRWnsqDkDG0g6blSmGTz1sGtWP
	fC2nCxeDUFfq/iH87zJ2U04k1UOUJ98QzF040UhO8My9K1m73/li1kN5tzzUrJLrUtU9KZDN2+z
	EZolXhhxx2cw7OvnZIyHIKuPV8fui2V3ZJ1oiWwCOBXpAj4vWeC3GDd7toTEtn/6N3NrxHDbkzn
	5bfaB1i5uXEyb6FJ7p1hvlJogWBzAwas0W/C1VX29nFO8lubbjPQOcan3HA8H7fODB593jmdo4f
	ngIu+bBhLxugv2qEgdGPuBV3wucKMp75FgBFEFVBnAmCO1yoD3lTKSiXAXjayK9G5YiHRCl2KTT
	dkdBWDrwg3WF9CvBzTN/U8MxCxmKtjqywdUJYExz12obsVEDZnWNR9ODQ6LP/HJ1wNrmP9YZcJz
	tPtWDh+vHa1wKH70A6p+nYUVxVOvH9vb+fcLGVJmHXXQndWrJ8K2d+qYvjj/Llh3fUpvs4D0kGM
	Oi8MpaxJL6rhVwpX8Q3G3oWuzbsmNx5mAICwan3eX+/x0ILf1+nThcQhp8FA3rONG7AjqAgn0e2
	AYEB4Fp1InDmeLSaZvgyqRk5HixPXQp2e1hn4PEhSbsAaMlybr92v6vJE44WMIQXusLP8VXCHuq
	+XJ/+uW+JJo+gfuJ+4IGtC7UUMCXHjAk0NmIGHjfZUNgA1jNvabvXjd4yAKXB23pqKQ3fqA==
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr9272375e9.3.1788181762855;
        Mon, 31 Aug 2026 06:09:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm318698485e9.2.2026.08.31.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:09:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:09:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 7/8] iio: accel: mma8452: Fix use-after-free bug in
 error error path
Message-ID: <20260831150919.000048d7@gmail.com>
In-Reply-To: <20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
	<20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:17:10 +0200
Esben Haabendal <esben@geanix.com> wrote:

> If mma8452_probe() fails in iio_device_register() or later, we could end up
> with runtime suspend callback being called with a now freed device pointer.
> 
> Fixes: 96c0cb2bbfe0 ("iio: mma8452: add support for runtime power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
