Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782459;
	b=aIl7z6MfcGxLbr1gkdSRP/sGft4FCC6WoqaJ3pSdpeYh6aSAO1VAQkUnukIRe946XhDL
	 uJfoylCNRDuB8qe1tWSyyeDqxCRkOjBwZD7QSQGIq83M/QlI4EjN8mhKdYxqrH1ad+s/+
	 FXoy3MT+YNGll2+JF1kybqVxwPRS5Uf6KWsiH3Hm23azfvwiCkVM3CYXiKlZdGO+Gse4T
	 w1X9KkQ6Qf6UFcWSd7a+HkOh9wFmVnrEzk//6Mcrjm88s3TKT6w/EXhVuptactliYX870
	 gVWoZWRF94VnjeGaOOeO/rRojv3WzTRy8nJJwWdDkye10ZKubgqe7q3+fikb4eMKK3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
	b=qDYw+iGlzKQQ1Xk9zpyOC14I64xvjE6l9KZwFy2MYs7GHLRCyf1w2kAzz47Np36ks+z5
	 DEhhoNm1z4+R2Yn0trJFA15dVqCQN4TAxHnwJGYE2KpoTtNhCefoemdnnmUmbO52wDca9
	 ubymu5Evu5WTZX6iNvRgHi946mobDzIdUh/+JjU9x8IUGfs8eyNpTOoRN/QCFPTDNT9sp
	 17mkq6N8kNUKuOcGFH9PYtzwglNdcIqDty5JMP6tdpUlugrwauo+9w9x3D9Ha740khq0+
	 KPZ3OZo15Rl3qu18bUcb72drKFRp8ExdZtTwyatWbhdxv/klVZGeGfnA0OJkHm/5i5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE8606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EE8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso6412627b3.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782458; x=1794387258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=hxZ0G9Ms2bXEh5gQJZdNqjnx2lpt6R1XWLc8qWOrdhhjkK+LOEjyXqIOolu6ay0jTq
         GyZrycPkfvSjp3XlXU2LmYduWVgjHEwJfeVAPEtyyGOB6mgJ8UakSs7StUoej6/oZ+6L
         tGV6+SkSg5NZOvGBXbC5dZQ39prmruKSPmBQX0INnv0KscvaGOSDkkaYre2oZZ+MZ2Is
         ywu1wQqVelzsnzzG3ZrnvNx59HwAHvMlSvpIniWRyNP/y42RtWYToDxN3KHfao8vzzC9
         kSX/XpkllP4D7BRvdqFTAqnwzVBatbteWhKGYI2d/7Kyxx9irXthmzRlMFDpycX9jehZ
         xw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782458; x=1794387258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=LBab5+dkIEVdhkxHRW+pTCswuh1JuTzK0aArv6d1rJIGVZiyasPgMQNKfWQsSNnEmQ
         iMP/WrkM06S7G7xu4WlQ3W9wWBE/7Se8nfGwYcPLAIVoOujjPKxSHzeRcnkLWFiPzJk4
         mGJ4BmamqfO9h3bhhSXqxxjAtYVNGTGSCoEh6c+iCj1INHcZWy4ucOkVKxov7+hPyx4O
         9G8Nlf73zmtzQc+m1vLZd7TVtyEkLXNVVfqvQEtICDeYuwdoNUZIAKIypjr0Bt9Xpxgw
         jG+A/A+7rqoGSDUJ83mKkOjuj7QJvsLRtHhWB5jM+GkLDXhw+2o8Zsth2MPaK8M7ZwHF
         /F9w==
X-Forwarded-Encrypted: i=1; AKwUvBxCuV5jvFNg1lNhyiykqrYdjX2IAATvthJtZ3g6iAfqSIw6cn51czppTl62ZHoE66i/CXmscSUK9Nl7@vger.kernel.org
X-Gm-Message-State: APuU4Z/iVIrn2BNGBDGOc+Ou7PYxn8VMl0wW3sywavX7i82GgMpOp4uA
	cojbs9w2jkBISlidgo05aJMjMDDpniI71FWybvP43DQyY5z9vg0HgLGN
X-Gm-Gg: AYBFou1fR5USoL8I9Vv6+PEICASiMEqMgPUNB2z//A3oD/x+d7hlnQ1qAHdPxbzk6S5
	g6PyXmSOAqU9wsFp7FHn1rRwu/AYpmjnRgCyG0d3O4ecyC0yzam9qYNXC87XGPJ3OkOGDF7PXhK
	eqzp/mHO3rMQOUsfpJjPUIB1wFrYMdzS20Q+WTS4xafuZAf63pP1zBcz1Gt+m1X60urHqTyRDoT
	9gFaW4OrglXBikAL9oWC0485mWnBD4FfZ+jyDbfvzqSNUfHXkH6Cfdk3zghr+1RpqETNn21lmlG
	rJ5IIp4nt5tqPIUDRcPUc8pT/muIoiIJC+GrXmsWBJmHUYmvvmRlHygy0/tfeEtVPm1730go+VJ
	gKNh3729sHf9KubhHiS9HFh0BycYxjlI3iybuMlqmXP29YXucIcfr+nMKddQ5grnyFeEZN1I3KS
	Oe+8wSxgeTsZp4e0cbvSW/xEhAj88DlzU8PkMHpTE7MiUdMAoPx4ou7LTJaFMOOMN8BD9gpQaS1
	iu6e5PVc8tMLq1Z/lmXP1dQTwSuJXwLtMbigubrgZehfGezyJwOKJMiMtRX5sAiZYubuZ0f68hq
	1fXRzGSrnQnewdx+XZRreLKitf8IOatTCaHDQnYjIUSre+cgLUOHc0FLIxerX7oMbNQeLJE6LWl
	I0HHmku8rLCi00DrGlmeQyMdn
X-Received: by 2002:a05:690c:dc8:b0:8a8:7fda:15ee with SMTP id 00721157ae682-8b2b676a6e5mr116717537b3.50.1793782458184;
        Wed, 04 Nov 2026 00:54:18 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3174sm14420647b3.12.2026.11.04.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:54:16 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 4 Nov 2026 05:54:07 -0300
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 01/10] iio: frequency: ad9910: powerdown fix
Message-ID: <ynwpqktxxbunqm3ee3q7iogrjynlz3egrwryfb33vsp7x6wcqr@uhfsxwrpsyhu>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-1-0e9224ddf7b7@analog.com>
 <20261104002042.10064e8b@jic23-hlaptop>
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
In-Reply-To: <20261104002042.10064e8b@jic23-hlaptop>

On 04/11/26 00:20, Jonathan Cameron wrote:
> On Tue, 03 Nov 2026 11:52:57 -0300
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Enable the software powerdown on all the applicable CFR1 register bits at
> > once with an IO update.
> > 
> > It turns out that DIGITAL and REFCLK_INPUT powerdown do need an IO update
> > when enabling the powerdown, but that is not the case when powering it up
> > again. It is an asymmetric behavior, which was observed while profiling
> > power consumption in the lab.
> 
> Just to be absolutely sure I understand this right... The bug today
> wastes power but otherwise doesn't break using the device?

Correct! 

> 
> I'm just trying to judge urgency of applying this. Is it fine
> to go with the changes that follow later in the series or do
> I need to rush it in, potentially delaying the rest.

I'd say that there is no rush.

-- 
Kind regards,

Rodrigo Alencar
