Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8947886D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128152; cv=none; b=p5vZ6Ed6auXyCRIIq0ZEmgvutMI+gIQHmFKCPFdd4KH07tz9704omNLofpJg4alKmW+X9jQURncRXfBZcNhn6ymBDCxDbAIfDk8FIFZM9Oq4+YyYc/br+gSUpQO0/x6n3nFD/ldM2dN+yDr7W8Ji6z6MBDibB051LGSGfThmxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128152; c=relaxed/simple;
	bh=bL2hacoZzQ5gLT+Rwai/yPI8d5f2HDFACrjOHZ623pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kebc7gSjKq6EZRDIszFOHhGSNhwsBPUXrK99toSbN8bPxaue6lsFpP19CAiN3PGZNauzneLwJR2CH/5WRydkGKumi48qLB5ZsvVyyqmYebQwFmLhviYFUxngsUcq2clweRPajiImnedKUFTpLNm/GYlODaDFkcHWafi7W8GmWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AX930QXr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AX930QXr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso39392065e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784128149; x=1784732949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bVztOB3O4YAwA3M395fM/99xxJfLRhYZpgM8cgrPo0=;
        b=AX930QXrqQfo0JnMQFDlkkR5fNSRSWGIiPjgZg2CBk1PFDTaIyGFheqB1vi4Ty6Ytt
         tgA+8UFh6UIMssskoSbu63upYlc0q25McS38NJ0BR3PqlvTbSMIj7EEZUpBv2/vvCnxA
         riDjvy4BqTul27Aue8cdH6Ng+Bpt2pkHrLlgxtELx3WZnWbCzbgvWVqDYldIDSDcDYt+
         a8bU5fwCs/H/S3QlG6W/MsaG0C1Y/1JABeqzpMKxJ+xcxLEFGF10+ntVPssb+eJg0s0j
         3R0xuk0pUW1EG/QLVUFoC9+U6H3oeCWFXQNqYpQ2L7CFOZgHK7MX7ih7g1ObzWlNhn9e
         T9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128149; x=1784732949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6bVztOB3O4YAwA3M395fM/99xxJfLRhYZpgM8cgrPo0=;
        b=krEIrxSrurAQ3zsNjnV2QpYMweEmBV3d6qL+FMpx101vxvmy8HT2O1Oj58BFRSnChg
         V0SLwBuO1K53XC3Cm6qO524hX7TllxSB+TWxd/EgVrJXYcXQZvfFwsGBp44Ra/Qpu8Ku
         rPtiOvtZVrazhrjBczbtqpGtGGe5cAeV9jQMsRYe/wA8uXttk6338/L5Mmh1OsJMzqKN
         6T5te6Uij8f98UuEg8NnBZWbaSJrn/TXBBwQuTT1WrO82sL0hkba3hZsclHWNnr1pUVc
         nGct/cSnUWzsB3/arlYpYouCUNBJ0vOcximxoXPY0JO2foFCneAc7Aetw7OM8mUTZST6
         cL2w==
X-Forwarded-Encrypted: i=1; AHgh+RrCt1BUUkIewnGK1+0fjoUEtLy9rWU5Zrz3BBBUiwdUOeKfQA8J84xRBOsq0xxIycTF12KQtaE9RKMv@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVcb9NcHmZ5oqD8iZ78w2DPCuwrYbQsmpZ0zbn25ocSlQD8YQ
	O7B07fybn7uCHXQlEJ6cadfhxOXgdrb2Z+SMkHxM1obrjNQUCg7R1bkQ
X-Gm-Gg: AfdE7ckkMJjmRe5tzK6cMkinZOmtQvcVuFOAvDkb+wEkdDBk+8sdrkCqU9p9x08z4FE
	ajCPQZ1LK7RjG0Ia42IiaXfwnlXfSAjH6KF04vLZXm5mKN03t486clI9NpuWTTzefLRdDlbSuMD
	5SJx2R/wpwM4eCYaFTOSC1a7iClLvh0P4WX9QpLJReMoAHQTc7Uyu8MoI0SbjFj2ZGZsVrtaBk1
	4/qc/TglLGFmria0Iux2NOOZokfA6vG34wtYQmxHcRPmXPoRQ9qgBO42djTI7pqzIFzvNRZURg/
	+M/4BXvD9aJqNvBEzCazFzGH3tArZ5tRyJnNDVd2LQsT3C89cpSGyF2nS81BdgqaIPKksm0vFEW
	4ye83Jo2kn+cbNUTRaf+rcvH1hNNZT29nN5ZHp8uSbH8tfZr4cJL0fl4q1/vesXqUNRco1Kaz+4
	sq0a6lIyA4fyF0lJ5a35wsRq/1Ceo=
X-Received: by 2002:a05:600c:4e49:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-4953905c584mr78564075e9.0.1784128149136;
        Wed, 15 Jul 2026 08:09:09 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm15895004f8f.36.2026.07.15.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:09:08 -0700 (PDT)
Date: Wed, 15 Jul 2026 17:09:06 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Popa <stefan.popa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	Nuno Sa <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siratul Islam <siratul.islam@linux.dev>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Ciprian Hegbeli <ciprian.hegbeli@analog.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <gowx5duel4pfytvbtkaxln3zza27uazb4dfedpckesilyfmpgt@ripmeuwrjuup>
References: <20260715063652.368501-1-stefan.popa@analog.com>
 <20260715063652.368501-3-stefan.popa@analog.com>
 <aldGAbF4AN8X5CRY@ashevche-desk.local>
 <4r6grtnbddwtaflsak37y4hlofgiudksd3orxamry6eyhnueky@mg75uai5aeu2>
 <aleSCUZhZmhceTqV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aleSCUZhZmhceTqV@ashevche-desk.local>

On Wed, Jul 15, 2026 at 04:58:33PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 03:41:45PM +0200, Nuno Sá wrote:
> > On Wed, Jul 15, 2026 at 11:34:09AM +0300, Andy Shevchenko wrote:
> > > On Wed, Jul 15, 2026 at 09:36:17AM +0300, Stefan Popa wrote:
> 
> ...
> 
> > > > +MAXIM MAX40080 CURRENT SENSE AMPLIFIER DRIVER
> > > > +M:	Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> > > > +M:	Stefan Popa <stefan.popa@analog.com>
> > > > +L:	linux-iio@vger.kernel.org
> > > > +S:	Supported
> > > > +W:	https://ez.analog.com/linux-software-drivers
> > > > +F:	Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> > > > +F:	drivers/iio/adc/max40080.c
> > > 
> > > David usually asks this to be split between patches to avoid "orphaned" files
> > > from the MAINTAINERS perspective.
> > 
> > I think checkpatch also complains if you do it like the above.
> 
> Yep, but DT people say that this is checkpatch's particular problem. They have
> their own "maintainer" database via the special field in each of the binding
> schemas. Since that discussion with DT people, I'm not going to fight for this
> kind of changes, it may be just an IIO level one (if we want this).

Hmm was not aware of the above. No strong feelings about that.

- Nuno Sá

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
