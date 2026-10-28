Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155200;
	b=xkYtxfA4GX88AT+9+jVph0ho3e98cfqqyQbHgZkqSXuAbVWBphVb+0PM1JSXPcqymk9m
	 mbdjU1epHGrqAdGJnmA3B40vBttgmT2JeeXv69dBqKT8jybU2a8y91E9kg/Za92sPF8be
	 s9TVmNqUCn03/kmOn1pQ43S3reDdebENEnoaDrVsCZkYtqSFAUtTGHgTylOPuvLa+02pf
	 xyWU4AHyOZgGd7OzqU7wO7ndQy4GKrZzzhfWsOXOBzrF0FV7oCoYkR/IZkJO7p4iWEtWI
	 NhpB2ZMyQLY8NNaZT+S2BrCUPIBk0Rpd4dDW8x0P6jyxzBHsMbuiAtc7oxRTFbencOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
	b=XHSAzTR8IS2ajEULE/gCP8nb4PO6vYvysZHGZvCzoSf9Tq601vZIKDUn6xpnXvSEuLc3
	 ZV1ncp7MnCRiWO2ruOFvWJG8+DSRoiTHyUPcV75+BRWRFoyOHP5t+gUd+ZieFZKlIHoc2
	 nKGHIu3k0cDWmpJRO6lmpXHmp99EO17Z0fhu8I5FBcHDPDDHdphajqFdU7xJ46HEJluqA
	 Ti5JRo4ZmPitlBsZQk86I1Dly0ihtnHBE/5fxz/g8I6m0uqLdgVHiVZQNm9QzR9hpFjxi
	 kgTUUSVuXyQVmjJ+heWemGm8apltLWJt05uEmlHzto20RRWNljUYkV2IxPRaqPdey7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWoIigvq;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E0606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWoIigvq
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99071945aa7so312732241.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155199; x=1793759999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
        b=RWoIigvqvu2Ej8Oo8yU9qnRczeMA2FfGfYTvYHgIz8Z/TK3KnYp5KT9ktyA1OpKhXb
         rww8NjYMYxiMajA1EqeiPaOV9b1J+eFxwne7kJGTL1Ra2uw+YH2LsZvLhc+3KSng4+CJ
         Wjq73WkdZKv7fY/Z+WtRehwsdpIdGy1FLWOAU1OkdpzwZhA2vmAA7OhZdmZUZBlbyx3f
         jZKCQD+Yk/d0nQ7Rt+q5VjpQt/WX/z5TcGt1z9mtYyFYOKOgjXNOeAw41Xj0vmmSThip
         ZIgBlxGYO24fOePTI8TPrsl9Au6zt0kQPXb9wZPH/nybYHLX0sG9eYXGHZh8I3R9Y9zV
         GBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155199; x=1793759999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
        b=i12NqDqM3CdrZv5l4/ccfG///BT7MrmVdfj+IARTJeF1tatCWM1C1b6t1qS29wRhqT
         Y2s4QJE/FzBmKT0NGEosePieRfT/IyfAz4C+aiW0cl/Og6P7jmcLSSj43Hi/54Sj0zan
         rYDZAOVbZK2klFlCykRMDm0gX57k2U3JYIWjCUKrQw5EXJZoIMo4C6F8084GCEYAA/w8
         ReQ0PyejGvT9TZ3sLcZs4BRPffsIqYWRvm8+lxNSrOWDzyRuFk97786TiqslUURrb/ln
         hv+4RZ4f+GB/yULKr0T82J5KSM5LgOiA7PZb5TayWzr/7ctkI8Nf6nHNR1d1n0FA5l73
         2HVA==
X-Forwarded-Encrypted: i=1; AKwUvBxS3h24DUbcFNA7G46DILwN4hCHZAbpaqguu33/sOG3DvYaSchAPEZqQB2ecKj/OjVDENAXod1u5qAE@vger.kernel.org
X-Gm-Message-State: AFq9FYLUKMUKtQxk9HvQfreGzGBhWD2VnVCzeit+JEsKv85MeHATWNmX
	iVsjOeOXjqv8LLozCL9M0aagoFfAU6KdfOsl1PvUV+bpw/UzqPLodgYq
X-Gm-Gg: AYBFou0AEF6Epdd+Vf+44GwXLnWoI+/k8781m+d7Y0Tw64epBHlkV8JSCPKLcoWiWqa
	sUsGfI7MyueS3elq4glxD7bLABIBMUeaKpZYconjTIaB51vQY1MR4u6vv9Gt5qDXhK63q9AA8hA
	dMQtmgrQs3iulFhPrD+X2cceWqA+H3R3IbEuK5PkJe7KnXNxqTQFJ7ejqmvv/E/fFrwZTShOa7/
	tSysCmY2KsxfehmblLBgXVJXHLp1N5SdXLza7rHQV4dmT38+42q3aCO3PRvNB8SHMhcjKh8tC1+
	Jdei7c0C6rFcD0vgMCWdbyUWNmx9tVRzrYTUS2kBxeiKV50NJu6ZkRo1n5cPM1w5EiugELLJAKp
	Tjm1ksaiFRkgnXbmeB/RwARJtBQpJ+ZaiS0HvZjwMK/5YjKjy3LRqFrvE6zfWK7pumSZbYX/w5x
	pP43G/vjH+gK5BI6QR9XaYeiyV4yJWa0CEPqAxsHtbmwZSRgVUaNhVxYZxh4HVF8LAD+stZ6x0j
	r4L3nV9te1mnQodVmo4F7CzjFgHoFxJNU9hVOGXokOPvknkyxJgjkHfxwT9uH9cbftgsg2UEvd/
	ct+W0m9Nww4St+z3KsDaLHyo7f1eByz5uGJ/9YQmVfbNjbKByVF1jYhEDVrMHbu+WjIN7sFHAw=
	=
X-Received: by 2002:a05:6102:508d:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d03a4c76camr507860137.21.1793155199338;
        Tue, 27 Oct 2026 19:39:59 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea397a24asm4467382137.1.2026.10.27.19.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:39:58 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] iio: adc: ti-ads1298: fix the data read path
Date: Tue, 27 Oct 2026 23:39:51 -0300
Message-ID: <20261028023951.33149-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5jL47A-6vQJYOX@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-2-stephanbrrs8@gmail.com> <at5jL47A-6vQJYOX@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 25, 2026 at 10:14:39PM +0200, Andy Shevchenko wrote:
> > +	/* Only changes while no transfer is in flight */
> > +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +		buffered = priv->buffered;
>
> Strictly speaking you need to assign buffered to make any compiler not being
> confused by the scoped_guard(), which cases IIRC we used to have the past.

OK, I'll initialise it.

> > +	ret = ads1298_write_cmd(priv, ADS1298_CMD_START);
> > +	if (ret) {
> > +		scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +			priv->buffered = false;
> > +	}
> > +
> > +	return ret;
>
> Before write_cmd is called the buffered might have been triggered. Is it okay?

Yes, and on purpose. By postenable the core has set up the scan mask and
the buffer, so a sample arriving before START is pushed like any other.
The chip does not convert before START anyway, unless its START pin is
tied high. The other order is the problem: a DRDY between START and
setting the flag would be taken as a single-shot read.

> > +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +		priv->buffered = false;
> > +
> > +	return ret ?: ret2;
> >  }
>
> The code lacks of comments on why in all error cases (either first one, or
> second, or both are triggered) it's fine to continue. And what will be the
> meaning of the returned value in all three cases?

The core goes on with the teardown whatever predisable returns
(iio_disable_buffers() says so), so the driver must stop using the scan
in every case. The return value only reaches whoever wrote to
buffer/enable, and it is the first error.

If STOP fails, the chip may keep converting, but once the flag is clear
the completions leave the scan alone. In v2 the flag was cleared only
after the wait, which was wrong, v3 clears it right after STOP. If the 
wait times out, a completion that already saw the flag set could still 
be pushing. The SPI core completes every message, so I'm inclined to 
wait without a limit there, as on unbind, and return only the STOP error.

I'll put that in a comment. Jonathan asked to rework this part, so the
code may change, but the explanation stays.

Thanks,
Stephan
