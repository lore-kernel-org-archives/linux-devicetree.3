Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D351A6800
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808882; cv=none; b=nzZyym12UjfUk5RzU29NT0hsBlHUR1hyskQvaxIcSGVfrol8snvJcWyie8Ms1pfkICXkahFCmvTEWZwazRbCludvBEiDHuq83go6TvegXO/kMHAqs3EFUKYvFsIwLjU/JzUDfbU7nAm2kL01YO2Pq3gLGIqtNwEcc4yMwnfc01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808882; c=relaxed/simple;
	bh=bQuIknwUAnLHPnKnNOKK5q/bQvPCDO39GmpJAik2LyE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/RI0uOxNEcUjl1xGohIWk3TI7oHzbGRC00BCieTBrqGKu6ZZdGoO1XF+XjhsDHO/DJLjF0nZC1dx+V+auYxBeY+02FrNDHS4SUFpu+beSXsu1xnYWgJ4wwrgfKHEvlCPT/k5kc7F6o74E5vg4a8RByRnDRf+JxBB0EXxH0O9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjLsIKbu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjLsIKbu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44509921fbcso6870908f8f.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779808879; x=1780413679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xp8ClnbyHhWUm1Sal94B2cp4j1rAGYr4sDBJeF678B0=;
        b=UjLsIKbuiNhOuI8YsJwUBha/Vf4P6nR/kIKxBRn46odWyB7wSc0HPg3gn0ZbN1Uw+o
         PrAaeIXjfB0ekGvpBV+znTSnbI8Kt1b7pOJX+kZIMODbRYWk5MfzCLdhw0bPD6baOL0P
         gNA8aBei66XdSFrGfj0w/ZsGzOFwP/oAI0Qm2NdApNmzNfpPVeoMr9inpUim0eqUTClY
         ogyg6z445VESOlMp+4PSpXqE2tw5pcM1Y8qeUiYmD9BViRVdA5JPnbD6s4vznpmUQ38i
         BcUx4Bpx34TraktP7gyhFLiv+FOtd7/qgid/A7Jlbj7u+/wq3zVMAV/2tNq+mZt5wocB
         /yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808879; x=1780413679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp8ClnbyHhWUm1Sal94B2cp4j1rAGYr4sDBJeF678B0=;
        b=eXob2Y1Nc8IU7YTgCJaTipDDMTLaD3qU35eQqpb74kPbfIHreMDj6EBaz1FfodD+Jh
         N25nl7nIZcLmeHtYdlzxZAwSq2bGXEaL3ZvPeYhMREd8YXugIGhKIGqxixVeypLC37FQ
         vsRU2Z/Rq9S1/GsVJZHIilc1jIWJw/gNQ49AlNrvI58v8tJOVH3IyXBrwKk1/rj55wJt
         AEanEmlJv88BeUZ+gxQRaUrmas3hYn7iEbv4rclJsJOAQYt1bqOyiUPZ6ufy1HK4gLrA
         w80Bd2BBfrFnC8XAgho1RNJTgwwfZjqbou4i5Nr+eO5MW8iMCiVkdfWkEfCwAeegHQu2
         5EVw==
X-Forwarded-Encrypted: i=1; AFNElJ86Vf3/JOYdQ/4lDVmzixpqVhpBb05tuy9XLDl6AW9nwWCACDP3c4llqS2gdoral4E3a7jx8CCBunNV@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5X5NdPl/KCryJ7VpgYyam0eJ7rL5hJT86MgJRNgFe51rsjl7
	FbRtuvF2wf8xbHflT+e1fUebhrtZ/I/eqL5AF72tveNRIod8/KtZh53y
X-Gm-Gg: Acq92OEo0K+1Og8Kj093/CxNSOVLJ6uJTGozl74up8R7jbdirzUzc0kIh8DO+Y1zJne
	TeLUMTtyDaBKH+/iAhVkw9upGcsABh6XpyEYBxBUNfm8wmp5vipTUDFgREhJ4OK1AUEzMdId6fh
	cQPtmE8hXZ0XXiIPcRmIwpFb1IUuO9MlYpPXx2/tUhmuXtfZex+QGq5MHXOSreNg7vGOuJA1PZS
	spHd9EHm8pAkLAi2uPOccwkT6f2Lxiy/JoSeLhQbmRsdazQjQ1LoASzBF9mp1t8AAJXLnMvZqvq
	uqanEKpQFu3aqBdK+dKHzONOeV1fYVaXDm0Dm3W9HgMePVjcUpD0Mh8lzYOiG/jySNpWpLEWcaM
	7RzBH8BHQBBQk/XCHXoqfL7k5+4vTkEy85u0qZYwae9v1rAi+D2O0hCVSkraEJlvt692yoOaS1q
	RJjHn5vwUvEXDfuDMryq2eK2JMrX0SQV/Jrx9GhLSzvESOAXjmOj1bNmTIidbz5NSgQs6l0B85n
	KDThFPHLMXXR9EjW/Li66hZSSQiBFaMjLrgK0sz/ENhqNsanA==
X-Received: by 2002:a05:6000:1ac7:b0:43d:67d1:2022 with SMTP id ffacd0b85a97d-45eb36890ccmr33778656f8f.19.1779808879251;
        Tue, 26 May 2026 08:21:19 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm39351825f8f.27.2026.05.26.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:21:17 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 26 May 2026 16:21:15 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v5 11/13] iio: frequency: ad9910: show channel priority
 in debugfs
Message-ID: <fuitiyrpt5calptts43egdyggz6xa7xl5racf74pogpextfrrr@mavfidgywg4o>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
 <20260517-ad9910-iio-driver-v5-11-31599c88314a@analog.com>
 <20260522190746.4c802584@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522190746.4c802584@jic23-huawei>

On 26/05/22 07:07PM, Jonathan Cameron wrote:
> On Sun, 17 May 2026 19:37:55 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Expose frequency_source, phase_source and amplitude_source attributes in
> > debugfs. Those indicate from which channel the specific DDS parameter is
> > being sourced by returning its label. The implementation follows the
> > priority table found in the datasheet.
> > 
> 
> Examples here would be good.
> 
> I guess maybe this suffers the same label problem as the parent stuff.
> Same solution?

I suppose that labels here a more informative. Otherwise, we would have to
expose the interface that outputs the channel prefix to the drivers.
 
-- 
Kind regards,

Rodrigo Alencar
