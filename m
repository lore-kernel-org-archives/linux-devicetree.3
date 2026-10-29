Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291941;
	b=5p/TkTvfLvtkCI5oF5DytA92vwoEgFxAM8H7jK4ysj0Gp7nGFl8de26IfUHg+t1bKpUT
	 Y3ZRBZcIwOZfAiLYtgu8TMr62J4rHrzePvIoXjOV49SNmi/e3HqJjtV+rDwECf6uH7t1d
	 VATvvkRghm0N2HSrbw4nL7DCseVJe0Zby1tdFRjZ+OMxkZCYPMj380G/zi+d1hmEjL/Ww
	 V77RGnN0wXFM25UjaPjY2NZgvNOTXid9Fn5gUfZ1fHpptDIlH3JpZN4wAHOur/utqS6uX
	 1kwwuAEmtGk750kD7cOlq+NYks5qUQ36exFZEuKLRYU/3YBQE6F2rs/EDxZG7uJ2Mgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
	b=O1dkfw/IlfZLcKWxNzfiWIlZXuV1ItV6McqaOPjaNr6KbRiPW7n7+8ZbIkKP3uv55M6B
	 2/A87JEZ4sDbxBrOKR9+fewMNCv7AQ/sekHVuOc5NYwdLc3WcoUiBl9YMQ2pgkK/xGsz+
	 Tfz0FUm6Sflc7GNWRBvYPFb5OORiUpqp5QJgVfrKkcS6J6X+CH4HkPOdr6IwK1oCiVVhy
	 4Hx4hTU6hnOcsTL7130iCC0QiA7ke1RYDRMIgbuYozP9+djmGOWjdbVgtcyB6zZYJOFp1
	 +k3w/IFGgQvQr+y25veq2X3osrhn8NZM0zg2wPaXVHvW5jy5f4pTApkbJ0Gp8mRTTCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVcVTC8T;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E26060A260B
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E26060A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVcVTC8T
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so3161108c88.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291940; x=1793896740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
        b=rVcVTC8TGQMpCG7a8sOBfuFoJLWg3xKjWScLLKASsUj3rkRZlIq3nyaHi8fO9e+FB5
         enpl4lELhHTl1EhmwzICVhyizGAri3C+TY3nDGm40h/8CXYYQ+FQQcWZsayhU2ln/nH9
         ULPdUUCkU0Ppr5gi23H/YQlVwnMA94z0lhZWhLJShAvlvPZwNp5XBfbEmEScjSS1OR4Y
         FGyXq6Q7WJIh/g8p2mVqkNgwH2zpSHz5IveuVPiDF4WC8yyYE889ISVmD0pM7oykSG/X
         yp4SUH2uNM5CfrusIGmuQi3Vuo9nEpHFYTBSrBuXGHeS3h64V0UHETPQGaE/qaTMNuwB
         Yevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291940; x=1793896740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=secPgUqYwtFyT27T12CKOEsJz45eODbglv/xrQzYdao=;
        b=Fci90tZtOeM2+h7UKfsAPX1wBA/rtLaLOx0UzIkDTfA+wbhpWlDF0QrbMt0IrIoPe0
         7xwfogequijJJZQR8vID9wGEwIlhBbGKC92Fs4PprELXd84LzEx6I1m5uG8PavYft42v
         Uwhh/US50xjelDpk8JvTV8BHqc4IRS2rsXfW2q/06aqymG6jkSszYOJAMCeB8dzxVI/E
         3PYb81iP/md7PJnfrA9Q+3uN5ldSc7lWnrQq62GIPIItGC6/QFzA6QNmegrJRrYV9+UB
         psrN2Q4Z7vllRLV5ThsItTN0pq8YsEFvveo8MddOUXBylss0Vidke0Bw+3zUmrdJ4+1P
         khlA==
X-Forwarded-Encrypted: i=1; AKwUvBwpTufOZpYp9mv7DIB64xQqDtk76LYAUmTl1eCJjl0lBMNExH3i5IupM+Q6SKKvDontm19X7ol2Cjwm@vger.kernel.org
X-Gm-Message-State: AFq9FYLokYio8jO2ea+XA5/El3QcM99uBe+LkyG591sZQAYDPdUmm96e
	wG3inU29brbfCMJ/C2ir8SOxJsPMcLHiHuzVtzwl6QN6xxpvzBcc9GR1
X-Gm-Gg: AYBFou0oxk1nkm4DqFD20wg2aoV5cwFfHSmaJbafJAwqNYbPmWRxA+RzTzlN+r2R+68
	n9Sz6hJ7bU5Kw1o9GWoGP3ddcFnTpmg62jbkP2pTdjNVLBxtxVsMXSYc/FDUI8fO/UvhY3nQi1k
	FGeZWCICWUrzIKY/iA5A3R/wAjgEPSEkTepPNYPB1+S9Rs4WrIsWbgd6xnJNuI6fv9+P/GfcVWr
	8N96h1laXTO2daBPX5edS0/67GuNb8ohnTIPm7yzKq0AYHDYsnwLAad0oZMlkCsNFha+LtjGmqN
	JjFUoo0XBeto5PjR9IN6MAS9XxrnIaV1XCJ84EDOBIWH9OaVyNXrvZ86RkvSdu3rE/EKt4EyESy
	RZV5E/+/X53JO76dMLu5OS+yX/hB2Xf+05B/ZhkZdPBEvlIzkC6ZvcFi8UEC1vXpZiQgz2bK2is
	U+SzminDUfdPTHJq5Zbos45HBctT1yWMRvGtHQLCO1w2MonG5iR4ijfdSAHuOg5x5r+dVKs3kNl
	IQa8mG5lgO2BelLTnBqg3n6S6Cw5ws+ExtEuKZPEuv2DgHSYd30vB4+6Yh51WI4h3OrWb1VhPxG
	B44jU8wSEmxHg4g5pNmkz2UJWFyR
X-Received: by 2002:a05:701b:4559:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-1a6ce4eaea4mr8107048c88.22.1793291939202;
        Thu, 29 Oct 2026 09:38:59 -0700 (PDT)
Received: from localhost ([149.28.89.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1abe9d7548fsm192739c88.13.2026.10.29.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:38:58 -0700 (PDT)
Date: Fri, 30 Oct 2026 00:38:39 +0800
From: Chang Yu <marcus.yu.56@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
 <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>

On Thu, Oct 29, 2026 at 12:20:24PM +0100, Jose A. Perez de Azpillaga wrote:
> On 10/29/26 8:48 AM, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> > 
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> > 
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements and enter SLEEP state when the device is suspended
> > or torn down.
> > 
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
> > 
> > Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> > Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> 
> 
> [snip]
> 
> > +		/* Check for digital saturation. */
> > +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
> > +			/*
> > +			 * Per the datasheet, ASTATUS is self-clearing: writing
> > +			 * the value back clears the entire register.
> > +			 */
> > +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);
> 
> 
> isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
> only and ASAT_STATUS clears on access, so the write shouldn't be needed.
> it also covers analog saturation, not only digital
> 
Aw man, how did I not notice that?

> > +			return ret ? ret : -EIO;
> 
> -EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
> wouldn't that fit better?

Sounds good to me. Jonathan, if v7 goes in, can you replace this if
block with:

		/* Check for saturation. */
		if (status & AS7343_ASTATUS_ASAT_STATUS)
			return -EOVERFLOW;

I've tested the change on hardware and everything works fine. Or do you
prefer me sending over a v8 instead?
