Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D914A49AB
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157584; cv=none; b=bQCHnAkEx7Ny5QWzYDXkGCaOYpqg8LADOhtFMwiVa/vICjEDVaTGBBeC14JIY+kiC3Xu9zWYXmGqr3VRfF7MOCQhMjpg46tL+XB14BebRepJ2tRhxt70TnY77sIRkwso296W6vMtY7N1/2TOmzkp9OsUY7RFvL+dtdwThK6UrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157584; c=relaxed/simple;
	bh=i95j2QTUxUV26LtH2QgoMoHAgaPIWZwAcc2BGKU59l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssZfPWOXs+RLEWu5wu0xKzXKyoSb297juLCMehXSGF7Se7HYDro1Q+R2n0Njn+QIAhMgqFqSkhzOG5wlYO0iltsXm7LOWJ7aR2/h9LLisNHgehz/upYIx7YwTFSz0bq6ixXwAKfOerizL1bE7xrBAnO5HJihjaiC0ugd2FqYn6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKUVLRIo; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKUVLRIo"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so303567eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157583; x=1792762383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlBbDxtOReq89XnhI+hKh5wvHROzNIJb82m4kgAxxcQ=;
        b=UKUVLRIoql6W06i8ezjS31iaAk7KvWBvGVOBgmvSXKrgPS9UCORkxEZPhZTx2PrqkV
         GWRFfdosErzFasjwqAEteJdlfl/tIMz8cGrOcraO9m0SAtNwOPCU0RjOlNyZ7qIkFNjm
         vGF6lmDP6TB/vh00Rjpm18Uo+GJA+dusPpEjFzUPH1FEqM5qoT/V3u1K5jHB+f0SArsR
         gu4ykqKF1zwP70AOlxTl+OPoCakgHdWJdx3ukMcmyZOD2D/R1qRuAUXLPCyzIOxh8IFr
         i8akSintCeOkUQm/fB7g3IQ6pZzs863gCThTA0J06z9J/sWzrdNvCQixogl47yvC4ziR
         4Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157583; x=1792762383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FlBbDxtOReq89XnhI+hKh5wvHROzNIJb82m4kgAxxcQ=;
        b=yhbR0awhqEh2TUToD8/giPrPtuSuNAemGnGXj9HfvsC06w/vMwCWWO6M1KsqqkvOc1
         BEDXcHh+ZKDxoPZMRrEH/VWz+wqChmMt6ft7bNJYMEpaIpawQvjG29QhRE73KPNWK7Rb
         xcwHygbOD0VuJxYQ81FRiHGzw5fQlaTxFdJKoVAvzqn+VjGMyDdzC5jt7WWVDbk1spn5
         FMSXw07UTUFdZw8cDgAWmQRuxwVd9JaHzHLx3tobyzub4lLkoJKGdmYWwl+UmlrC744L
         iRRtYCArx6EaesX37PUmDD1PxaPEqjHck2WtNZ5G0WbSpSSrrmPifiiAOx7XS69M8koH
         IKbg==
X-Forwarded-Encrypted: i=1; AKwUvBx6nscbDRp0eOAIKtZmECECboJQmP3u97Fr0MIc0X0MZT4Xm+bkZtA/xxhQXfTPsQWyfGBz4NOm6Zf3@vger.kernel.org
X-Gm-Message-State: AFq9FYLqJlNLZ7oJ/HZ1KO8sarW0WgyKXf8D62iNcevInM8GziYa6kjS
	/eQd9NUOfLIZP7HFxtZeuEJRSIlI4SlrkPs8OHgI+OL71mhgu4n0dXpc
X-Gm-Gg: AYBFou1h+T0mogIhnGlCFsKXpXriEXxfj/SGAnDw9CSJNrfEDPe3E6Wr9u5I+KqsrIH
	PhJVICrmUd7Y9zcSBkRrUuXsiZU+gifWOfZFcFTKQGgvz27ORd8GumCh0NTTxV8uizEqur9xNLc
	7F5SpS0PUoiOc4qialRlt/k9pseG5ugBkmuISBqcpVSbKzQpCxMSpvzPvxa6BTbCT2B96NRihY0
	z84fDwKrC+i2oXOXi2SeqUR9QTsJ2Z1gcisUN/tZ7/eoqyV6DIy2CftVUArkouremSyU8hZiI5l
	lixynnJlZDAxcGdA+xqsUdoF0DlQoglqJnj7anKiIjM02Kh1K/SE3cu2YAbQ2qPcr+nK7gacu9N
	Acq9F+OJtJ1sne8BLbEpvYFEaMHSfW2coPY4X2vG5zDlm1wravKfsol+DUeqKjJlkZYBV2vqxiv
	niIY4bN8o0WE6R4SA1MuEiuvBkvoDiWgfMcTnGPlnWbKNCyaHRyFG1amdFjJylkGPWuUrgTAfMC
	2Duq96mNEB2Lizi9oeWfO5jtAPVYqjzgSHpIacxzE93HUlU1XoReiXbe4k+hcxQMKT9NoALTUU=
X-Received: by 2002:a05:7300:ac81:b0:34d:de2e:1fca with SMTP id 5a478bee46e88-3537dff5a5cmr44216341eec.21.1792157582543;
        Fri, 16 Oct 2026 06:33:02 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm6964225eec.5.2026.10.16.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:33:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:32:55 -0300
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 02/10] iio: backend: add devm_iio_backend_get_optional()
Message-ID: <qxuz5guawnr4higgwnwvbhag7zfw6d2derwy6j5dz2uhccevvc@dsucxvhq53ef>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-2-3c21648c8e26@analog.com>
 <atEeZPOLASHAcnjF@ashevche-desk.local>
 <atHjHqyxXj6jkObW@nsa>
 <w7waqang6lriwbcq6o5s5yuedouuwgacmnj55qsjpzjrv3jut2@cthvkakgyhpi>
 <atIkZa0noHjcl13X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atIkZa0noHjcl13X@ashevche-desk.local>

On 16/10/26 16:19, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 08:18:08AM -0300, Rodrigo Alencar wrote:
> > On 16/10/26 09:45, Nuno Sá wrote:
> > > On Thu, Oct 15, 2026 at 09:41:40PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Oct 15, 2026 at 01:49:42PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > > > 
> > > > > Frontend devices might not need a backend driver to rely on. An IIO device
> > > > > that supports backends can behave differently when they are not available
> > > > > and that should be acceptable. Such parts may provide basic functionality
> > > > > solely using the control interface (SPI for instance), being able to have
> > > > > extended features when a backend is present.
> > > > > 
> > > > > Add devm_iio_backend_get_optional(), which returns NULL when the backend
> > > > > is not described in firmware, i.e., when the io-backends property is not
> > > > > present or, for a named lookup, when the name is not listed in the
> > > > > io-backend-names property. Other errors, such as probe deferral, are
> > > > > still returned.
> > > > > 
> > > > > To make that possible, a named lookup that does not match any entry of
> > > > > io-backend-names now fails with -ENOENT, the same error returned when the
> > > > > io-backends reference is missing. Also, the missing reference is no longer
> > > > > logged as an error, leaving that to the caller.
> 
> ...
> 
> > > > >  		ret = device_property_match_string(dev, "io-backend-names", name);
> > > > > +		if (ret == -EINVAL || ret == -ENODATA)
> > > > > +			return ERR_PTR(-ENOENT);
> > > > 
> > > > No. Please, use device_property_present() instead.
> > > 
> > > Oh right! Totally forgot about that internally :). And it fits into my
> > > internal point where I don't agree much in treating -ENODATA the same
> > > way as property does not exist.
> 
> +1
> 
> > Say a frontend consumes multiple backends, but some of them are optional.
> > If we care only about the presence of the property we would fail when
> > trying to acquire the optional ones when the required ones are defined.
> > am I thinking correctly?
> 
> If there is an empty property for names, shouldn't we simply fail? I rather
> would consider the firmware table to be broken in such a case.

Not exactly for an empty property case (or not only for that),
but for a match_string() error:

https://elixir.bootlin.com/linux/v7.3-rc7/source/drivers/base/property.c#L539

-- 
Kind regards,

Rodrigo Alencar
