Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73001F4631
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489050; cv=none; b=ht00aZwd1NIi1tS2BayD/a9dNC3zwjsd6Ba2c36tON7DqkX+AaZc4VJ3Y1WNcKFd1OC26lcY/oR6NCrUi81zHBB228oDpIrC92aUCVusDPCuZlf+al16shqGFOiXfE8s4C/fU1mZbwI1HqwdwIlzX+noIJfxmeWTUnkwU3RiuF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489050; c=relaxed/simple;
	bh=DAw4JxnUtGkEQZ+K5aXpb9DlfRjujHomzxjuX2PxS0Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UItymPVjin3R8IU8WfAwul9XKOK16zW6JhHsJoC8qiqrnIwHBFut2vC3DsupVAvp+ugopRlDj+VXx0of4k8y4rDL+rmRC1QKzrQxMe5ff/Y1PfPwGknzX99LwRw8cL25JP2XTczTZt90MhPT8jfBMjmMul+jYLsQBdExQH76VLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N22U0sio; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N22U0sio"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so102131066b.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780489048; x=1781093848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqHxoYQzLKR/tGoWFgMeS9pXy4BlkN8McTt2BqpaK9U=;
        b=N22U0sioPS90X6oMviNw6Rvq+i6r658Md4yi2s09qkdDNir8emH7yBVMXQKCFPHefO
         PmLC1SRP63/Ra7yglSf/LwmMVgslqlWEJhlSLtWzhIEv3Yo3a2eaqTBtBnlrvKTGB9aP
         4zExIGAoxexzrgPNTIajBWxgAlICvgRQjfkgborUDYgMIu6RrLCOxiVONWbom4kle9k/
         Zdnug/MLCwOsu70dQLJ+p2bu73qAAB5L3sUpWVn0Okqgng+AJh3VBywTWjDbeaa0Vh98
         Yymp/NywvS2yoGB421Qkw1zHi3rWTvT+mDh1BY4NMGWhwTSdeevrtwR2pHIn80ndhKFH
         wKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489048; x=1781093848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqHxoYQzLKR/tGoWFgMeS9pXy4BlkN8McTt2BqpaK9U=;
        b=niArR7prWJPYtkgDcjMgRFQgdg6PemKkz6gkctkqRA1E6ua/d3Zq+5261mvBjXwCg/
         Zh8dNhDzz23zdp0tNl9eGh3dlqLimr3WQ+fRL0BtC6a3ummNixGqqZgp+ZXB3pPcomUg
         BReu+ODMosShH6SaV0pi7qrhql+EljOYGJzDiSgjuQZIICpL93u9kCYL7iUFDulWuBv4
         rkzcR3Pi405Ns05nIMAmWuObb6TqvXZ4CMkMEBqLEL2lXIuJVFvMmIGUem6dxiSVqKFh
         9IJ9OOg4iT4r8zeHm4Geh80DjlzWKD6KQAiK3HUSmQj3oj+DYZZE4NAUFcQPAr6XcHex
         HDXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z9MV0vFDszILUF+lBkQkFFNt/gocDLWz2YZFKCfBJkJHIsOX1DUbVkm1ktaJ2Vqx0FXNdlc7kaOr/@vger.kernel.org
X-Gm-Message-State: AOJu0YzxTULWGYzW08VQBjJl3Bv4EOzL9jpNz3Ap3F+MsuOy9swGYhOH
	itpg7H6Umu+CFiYYrBOAViFFi7ZqVhmTxTzFJ4GZRUD99lQNoto+VGKS
X-Gm-Gg: Acq92OFhD/WuZpnbxUjYCq93XwAPeGuI6eBvxEULaLvxTXqqWT1f8IuVk8rAHLyUr1d
	/7c3OsbyQZyuq3cqOIpNSgw24eh2eqe/EWfggvT+hbfnMIxVfUAWHcpzFYfcliC1/0zD5bojYiw
	8Y5MIftqFIWjXXkmBoVgGxdabYT+0iUDqJ1djmPBUC5gXUdN/Rfu3kTUBbVPSDoQQBlJen7JJ+X
	7ezeMUkwK+zFvumF23FPi3nFgy4rAYseOz/8tA/tZBwddVCW8PeMm8oaGzVgXSn2K7zK1Qqkp2q
	y1B2axPvSbaqCZ3ua42m5eb3gz2tJ1TjTMk0Ic1SB7WV3Nr6FcTFhidElDuCc2eftrEgvgOTxb8
	2+ljdtuEWU13eyMfsjXD6sxjpr1FnBUmWuqagFGu7tEDVTLampDIp4BVJNHTtSHH+la7scHyDW6
	922dceru0n5pCOM/68NkYIsTC782kF968O0qYHU3J0eQ+oj+qywrh8JHm8vzQ7gBgTicDX2GLZ7
	Vpx6BM7Ye1t1701E+fc6B23F3lDiGFet+RwziGMV+EhQke/+w==
X-Received: by 2002:a17:906:6a13:b0:bc1:d3d2:9348 with SMTP id a640c23a62f3a-bf09ea6587emr146364666b.20.1780489047981;
        Wed, 03 Jun 2026 05:17:27 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055500875sm139987966b.53.2026.06.03.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:17:27 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 13:17:25 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 05/12] iio: dac: ad5686: add support for missing power
 supplies
Message-ID: <p3ydzrkizeysxlzc355xzgeboipihgo45w34uwn7a4lb63jgek@kr5r5hgjh354>
References: <20260602-ad5686-new-features-v1-0-691e01883d27@analog.com>
 <20260602-ad5686-new-features-v1-5-691e01883d27@analog.com>
 <ah8oz29R8mem6H5X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8oz29R8mem6H5X@ashevche-desk.local>

On 26/06/02 10:02PM, Andy Shevchenko wrote:
> On Tue, Jun 02, 2026 at 05:33:52PM +0100, Rodrigo Alencar via B4 Relay wrote:
> > 
> > Get and enable regulators for vdd, vlogic and vref input power pins. Vdd
> > is the input power supply, while vlogic powers the digital side. vref is
> > replacing vcc, which is being deprecated, but still supported. The value
> > of vref_mv is checked so that a device without internal voltage reference
> > cannot proceed without an explicit supply. For correct operation, vdd and
> > vlogic are required, then devm_regulator_get_enable() is used so the
> > driver can still work without them by using the stub/dummy regulators.
> > Error report uses dev_err_probe(), which helps debugging an init issue.
> 
> ...
> 
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> > +	if (ret == -ENODEV) /* vcc-supply is deprecated, but supported still */
> > +		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> 
> >  	if (ret < 0 && ret != -ENODEV)
> 
> It can be deduplicated now with
> 
> 	else if (ret < 0)

Not really, because ret is overwritten with

	ret = devm_regulator_get_enable_read_voltage(dev, "vcc")

so the check for if (ret < 0 && ret != -ENODEV) is intentional
 
> > -		return ret;
> > +		return dev_err_probe(dev, ret, "failed to read vref voltage\n");

-- 
Kind regards,

Rodrigo Alencar
