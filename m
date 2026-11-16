Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829984;
	b=G3VkzTvBfXN0wE5TuG2SrxPz5eJkPXMiwPY7eqApMOWHlY8EBVn/rd692qB+zMkA1jtT
	 iVUNgeblx9NpNXM4YLEQthCRwKuXOlpQy1o6r6YuS0WH+6X5SqXDKzK6o+fwDXJOMTiqY
	 8ezd/PAQxteTOjaMOTrpljAaLDd7Hx7CET+u3vqtYkEePigDXRS/36gDfQ4Q82rbQrfS8
	 RUXJkoLWdN8Rsr8ISgcLUWxezTwuNuDJ3HYfdpdUnc7PQHN0sfqPyQpJOYzoCyIQA6/8Q
	 aRur22gAvQ1fPnjS+PUxHg3qXlUvJGXDuwvt5HSYPvuZvJvL9WMhPayUBXUfBdtm77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
	b=n9o7+2aGzXwNWqD6+uwDRC4uc6bzvyxksiqNUXfeHNzUamgZOJWjaRYR8M6bIWQvokQn
	 bdNQ1y3T1pXjBJxyoyp3jWCgs1ufhcbOj35fN8bgJtzOX6bEGX65Xb+U0jkfUgNfHUEeJ
	 kGcZ6VzU8Ce+m5LzcdTz1qvDKf6ScoDHEaU/oXeoa3ixw0lahx1qcBWpF0vf0x7VcrkBK
	 HtpiD5sPZy27E0jSId/JuJvX+zeQDQVJcNJ4lcQUFPuyCmr5iXMunFdB+zym4uM24vIXB
	 BGrHEZAqK8FEfBFDQJZC8iErySqHGvwBoDgvFFtkF8tfevrUpP8jjrn5t7k9mblzYTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EQorfjr/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C3606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792C3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQorfjr/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1380782f8f.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829983; x=1795434783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=EQorfjr/le+xrt6rRx0aqewV5C/72AyI7slViP9I2mMqrY2frCMiC9eA2kU6PldTfe
         d2ppNxxBW57kub0UzJYDi2m1bmxBnaQkiv+DBn7m73b82wtWpXZge2XEBVq8Yj5BdyiG
         YuY+Hzn4cGfJDC2pvnbKrEDdfYWt2Z2iBDbH4ycXbvMHzeqt/2lqu3i70CUXVOK26kmu
         GVLINhavriOSnCa0I1E/mKgT9MiAv+t0eJFkLeN7vlyZTXhcdbFV3CpeBKR3d8JeJxZI
         3rV3PATeMttVTD4o/HvUX4HGKlhQviYoK1XMcV4K8Zc9LjGTSHhnLxeKxHdxvvktLTto
         fhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829983; x=1795434783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=ZUU1+4O/3OKLE5O316/TGo1wIcI0TLDWB+WA+7Z2CRAFBtsudLg8ZHa+WBZH0Gdxbk
         gc5bQBezpqt6+iIJz1MlMJ/pkK9LyeW0Vixc0gKGXh2b/nQ/pkViVFKS5O5JJLnjmdHE
         xzao+xLPTGjuxkItJa7r2yhvkoItQeTebU1ODieGdyu4c1rw9abavlexl+wdMfToN5bG
         +ZB+HVtrqawmPE9+Jo2KSeFthGuVesJ+zy97AdM/WCzQQYP5MHGzBTUh932VJWJaaNIj
         56k//RhEd65xaCX6LzLExn8nU/I7cI6oMJZHScFl2ZY26QA15i1JZ9hsCUtCwH24JCFi
         VOwg==
X-Forwarded-Encrypted: i=1; AL+hErGqIDYNyr+wwAa76figDiqt1zgfXbNGhtJwxdTKZeAjG0uZNQVJ7lPL2hDQ0rjhqrRWf9BQ8N1RrVEV@vger.kernel.org
X-Gm-Message-State: APuU4Z/acJ8JPXz0ChQ8oa1NypgvrkdUJw0ovnVF5laeKCFKx7Yn4KVV
	QkM6zO8NlTsSaVIiuGHkHJ58O+ExxFmOpfdHPWbfh6QzdCfJuw4wzDvO
X-Gm-Gg: AZFdTZcRKaPVfaWnyYqPycVjGvsZ06umcUpK1Hozfix4qSUpYj0kB/oUsMQ22li5WgB
	VQfU5+OLtnZSiLWKhtsSAlf+NCZN66QRT0xqDfPqOJXe9NxveFwe1NyErXcgFnaLYn2sMwlEkHm
	IU4WWg6w3hwQNOVEPIg+NR2pruYlWyUxlvxbymu7czEUeNRHGJilgckjzwFCYdFLc8CQYjLpNb7
	mE4NrnxQbRE8ioenuGkye3C62Z0QUZX3teLs4XSmJyKiOibz+deIPI+EkkQgPSZiW5oXtPQGSrT
	cGz+w8OmhVfyk11TaR3a3vA5eTfJD3RaDar21vh1kP1yR5fQqli7rhLlFfj/DeG2v1OJnWNXGxq
	8mB55CBpz9Az1OPYEWU7g1bdL/TA9UtgvZogNBh/kSnrgvu/iZHvDGH4dhH/QQjicpZGjRYyV3y
	thPq17vfKf3YBCUB5ta6382uYKFuHvNeSNpr/veJh6EELUEqVJ2hVY8mq9+pEI1JRcsr+lnM5Nj
	+pk9qkZe6h9SEauD1EqD8FtIYlGc98DVQw12jPWDDzDHbrCgSXHFj4Vdx6powcfSroGdYxkIRTy
	QgiYz/O83ys0Ej0iwew6LbqJobElz0nIkUfSPBKReaO1yQFdW8al/Ihh0TsBSXsUtQ==
X-Received: by 2002:a05:6000:2c01:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-49c741b14a0mr24577066f8f.48.1794829982872;
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm23686370f8f.0.2026.11.16.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Date: Mon, 16 Nov 2026 11:53:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, linux-mips@linux-mips.org, Ralf Baechle
 <ralf@linux-mips.org>, Joe Perches <joe@perches.com>, Alejandro Colomar
 <alx@kernel.org>, linux-hardening@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Johan Hovold
 <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: Off-by-one in arch/mips/bcm47xx/time.c (was: [PATCH v6 02/19]
 string: Add strprefix())
Message-ID: <20261116115300.544a33ec@pumpkin>
In-Reply-To: <avriaVSTl4jL0OEo@ashevche-desk.local>
References: <cover.1794667407.git.alx@kernel.org>
	<0eaa4ce73a2b164fd49e3a9f71244a2e3f45b7bb.1794667407.git.alx@kernel.org>
	<c113f651d1ce1b2d42ab9d0c59ae5a0cd17ddb6a.camel@perches.com>
	<avi54hgKgovNHfKy@devuan>
	<avriaVSTl4jL0OEo@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 13:00:57 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Nov 14, 2026 at 08:49:21PM +0100, Alejandro Colomar wrote:
> 
> [...]
> 
> > > And these are all candidates for converted uses to
> > > whatever is the function name or steq:
> > > 
> > > $ git grep -P '[^w]strncmp\s*\(\s*[\w\.\-\>\s]*,\s*\"\w*"\s*,\s*\d+\s*\)' -- '*.[ch]' | wc -l
> > > 946  
> > 
> > Looking at those, I've seen a bug in BCM47XX, introduced in 2224de9d152b
> > (2013-10-29; "MIPS: BCM47XX: Fix clock detection for BCM5354 with 200MHz
> >  clock").
> > 
> > Look at this line of code:
> > 
> > 	$ grep strncmp arch/mips/bcm47xx/time.c
> > 			if (len >= 0 && !strncmp(buf, "200", 4))
> > 
> > That strncmp(3) call is wrong, as it's really behaving as strcmp(3),
> > since the 4 is off-by-one.  I'd like to know what was the intention.
> > Was it meant to be !strncmp(buf, "200", 3)?  Or was it meant to be just
> > !strcmp(buf, "200")?  
> 
> When in doubts, preserve current behaviour over refactoring.
> 

That entire function is strange...

David
