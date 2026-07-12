Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFCD3ABD80
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783864720; cv=none; b=UpfsY+lnBjjMpyo+axmWw8LRdBleWJ2MbpPghxddA1B7Oa9FGaAZ8wLRQquJns7vaZGKLokZOYOo79Gn28baFsD5s2SfC/l2vlKf27xxktC3jYWrWN4t4Hz8+c7s8GLb8z+2ZNoM/Dhx3im1u66+52/TWLwZmlvBd1AB8x95DwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783864720; c=relaxed/simple;
	bh=w+JjwWpU7u6Sj5dDNh+nrrjlEv3ktCLEYKNzuZAZmpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+5LpgZkN2R0D9nECWASPcN6lhKc2IXuQizoCmNMBaR3yAVJ1doqC2LQP6V8o9IYfhdjWqpHUV1iF0KK7MDm20WLXkQnQT9o2aptRrb9aIU/8Jg4/GcCqRtL4o+zNbgGz6s6dS9ps4tmxRQ0Ly4lz8X3xfRpmFfVDI1RlM7hUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3TxJ8IT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3TxJ8IT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493e497643fso14169245e9.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783864717; x=1784469517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9zXjV22J71EDQFdZq67DVS643C3Jg95hBfmkaDyXoDE=;
        b=q3TxJ8IThnMBa6FqtGhLCaXaFc0lf4myX6pVp3fGhMjlvG32w2UqHFjEiYKjTS0x9o
         4mjqbJU9J4Urbjsnt4xVWl0b8FEah4KDjVfGK3NfeagIT6p0P5pAm+G/6RKGIl0/vrUv
         MCQgHkdSVbb51T5kte6weY/kS7vBvkcEuHfa6ZAjGMwctCQ+baCyk1b4BWJH10QKOh35
         R/UISAkeFCVR/ae9juc4tQPvXChvkzXfQKXNfULc2qZFAamkriCEX+DCu42uK6f1sc75
         vTqnL+xsaf5g2RXM9004J9G9r5y8aAiWZGWESZE/sMPuBU5t1E2jHgcSXTgMDD8UUuN3
         EIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783864717; x=1784469517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zXjV22J71EDQFdZq67DVS643C3Jg95hBfmkaDyXoDE=;
        b=kcPtp4XVcwk/xlpnU675iKNnesRH5a7nTNvKAY8EkuiB835WDWN62Xeq9qdimi99Qg
         lUVKPFViTIudEYkMB2g3y3XwiaabJ97ieah7eWKpKRtUD6Khmw0O//jU+qeBaIv/9duV
         zSRIbpTkSMPOYwV4B2jPleVqw70YmLvTwtk0Dp3mxoROiec1uU6Y0+0KmhFFYdz17zwR
         S+wzgFDS0ATxe8QA7xl3/wj15ZnFJBuG1QmugsooSIZ4kbN8y3c3Ebf7LaVn5Gl3D7MY
         Cx4DHNbNmhNgnw2naosONy4QzKuDY+HqPeAI/bTiBtG/tcohj+jnR0HNmP8iLJSjH3o6
         ssFg==
X-Forwarded-Encrypted: i=1; AHgh+RocyJXlvUYVBI/Z3Pb9zwM3pmWOcYRl6G0A9OLAm+l6WLSFlfIq6w8AuEN34Jrtp+vM5PpT3lBP54KC@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqwzn7R7b4bRY8N68OpRKiKUPfkI4j7kcjevxcOF4tQGxP+cz
	DMzedNm9arbsl6BnWZjAJCj0+x460L6nfsHX0XppPhpkNcVDXvCgv5iO
X-Gm-Gg: AfdE7cnXHZNiD9u79W1gVUj/5WnOarCnE5wnBmfkt0u9ygpYKAqiumvz9JJqGF5jlwv
	UE7wTnx4UAtPQkzS9SzSqlJ/V1YZggjHLi2N3z8vqEEE99FYtnOh6D7ThECZJZsl+jbsAgY4Oss
	IvHRHepxkO21Qe8TkaWbLoPD6th3tKCkDfiMnQ7SDZDtNI7fO4RQxm30utiZmjl7xkOcn3+1n1R
	eAv326wTd+YmehHprHTnjkosRwaCjkStGtJlGSoQVbX5crHe5KOvRh/cVjQF9PA7IyX9tC/ooU/
	plXvYIrlIJOwOSPZMlcu65K7uDEzYU+vOgCDor3V5Yj53VFtd+eoZJtaFVRhFtxjETkh7bY2n7Z
	maXpCHHeBMdE/wbTzXRHJdfCzA0thV2pdC0Kavu54CMowjmZD4BYBTe4RXXd91QX7b0i8XJQGfC
	x4IVM6vItrjT0+aWf0774SnQ8QUSA0P9tlbzYvx4JrjKeN2jFoP6Tx8+R7foSCOjoEHgGorOOWv
	HQdgrlweHLmloJwgdPh1VhjG1Vqeew=
X-Received: by 2002:a05:600c:3e19:b0:493:f28e:462a with SMTP id 5b1f17b1804b1-493f87e6ba2mr57487265e9.12.1783864716979;
        Sun, 12 Jul 2026 06:58:36 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm260892055e9.9.2026.07.12.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:58:36 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:58:34 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <alOdipBb0WS7a86A@GLaDOS.station>
References: <cover.1783689915.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
 <20260710214130.GA1387333-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710214130.GA1387333-robh@kernel.org>

Hi Rob,

On Fri, Jul 10, 2026 at 04:41:30PM -0500, Rob Herring wrote:
> On Fri, Jul 10, 2026 at 07:43:07PM +0200, Stefano Radaelli wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Something wrong with the Acked-by here. It goes with the Signed-off-by.
> 
> > 

Thank you, something went wrong here :D

Best Regards,
Stefano
