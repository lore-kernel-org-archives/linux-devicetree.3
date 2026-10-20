Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460248;
	b=x8vdRR3TtEW/N7S6Z015In+KpS5ODl3tNNmbTvlsgn/GSOrGz/mLkp/CEtlrZd7OY1+7
	 UVS78KK5W/kn8TJuTjecmxSluJWwCRgiJWl4e2Hzr1i4AJU2BGoNbYIugpd/9ZVTa7bkp
	 n1i6bdt7QY/HZ2eBd0nAW1+g0rvTOKmk8GcaMJSVDyTZmsiaNM7Bq2lsyshIfa9mwjFVf
	 5h3J9cNlPtIz7uLw4R8hv30/vJdYzYFnKLgjDy5sS1BdTW0Ilzr7NGlilieYpbaN8YT5w
	 9S5LrT2N+AL6GQzFvW7Ae+xcG2FRv01tJFJyRwmsZ7LJw5ZY3hyd4unuGXr4x4QQGgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
	b=YAj/tVMnGsgN5g0JR2bgu9P5bq8zLKlia6ATMv7hPhH4ChxYYgwC49Rj0KKCOlOdOTVy
	 GL8cIQxF/lFTkB/zXXx4qZ5tzp4SdXvWd7cDnJyR+W1c3p+E1SYX3e6iCg+GKL0qJo44F
	 tolDDmvXYNG6VXi7z/8zU+/dequyX0RIrYHanpmjpPb7yEXjEowRN7rcox7PmQMOIVBhE
	 NfBfwibrZNeY5sm4hBSF22xTQHodKFz90pdAreiHTqlhr7QzqyjQW6FhRSAqnVpPBuFkr
	 HU5e1wumg9qHDTSfXXnojnZVNPnD0Yq3No1zZp04TjFj8WT5/usnq00D/oPNmlj4nXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A9606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1701579eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460247; x=1793065047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=ecmXx3NRtnKBb0bx3OKSgxIGlOywd+JyxPJp60E/ketB3hMnkmpLkH8L4kcdJeA6Jl
         EMv31nRk4M5/ktlcZJcz0TUpYNZrDTjGmjF1tedEYBM7w+6xPr+Lrn+qPR8G3QZ6JbhG
         NESF27cdh0velfvj+2DrkT1yLnB/vDSgAZOY4mATGCWkyZKYKXVEe9SoJOmfeDb++d4E
         LsU8MtxwGj6M2KGicp3ue91OsgkOef1ZKEnqKl5cto1+sEfHdlu/c4CauXWRFZ7L2FpB
         5HAi4OaYB6E5btRgmlcTXLc2QOcDGhYjgeNwmoMugrTDSGeJXWNPju0Z3o0fQLnWuN15
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460247; x=1793065047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=CQy4ALAYYGjRv8eClnlPLbcQmurdKIsNn658/8G9RSObeZgUDYo9brWS8SquSHNXit
         zPI+XOTY5rw7GNfPNkkQM9cVsWTyqoIcY7F/ZN53eCHXwJ4LKl1UF1Opc13GAma2Y5f9
         8715chQpIfOIynby/leYVVq8Cpv/w2sxnlkvJJGNZYK1ZQLUgFhyhpkNdjL/0fv6b9sm
         yhyM1fZ7GYMNj/PZib10d4rj6n98t9yXdxPi0FCtLjLatRhZnu+HRMXlKyFLrY/kMfUH
         lE5PxGICPL8LwBtgmHuo1AGRumkIHMork2B7sKuqKjOt6Xx1s2+VIs+bpr8bjfsCe3tG
         g8xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKIXIQJQKSZNu3brbLpKWvVafoz24HxMtRkD+MU/OnsO/kD6TDTgkajc4JGtRulHYAa8/B9b241/hJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLiVlH61ojjhkIFLsvq1bB+WEJS3J4a5qWkLe2LfoHfMEMcVNl6
	YeCnnfwKMBcZZpDn8dC+uBmvYgiPFJ+algVVa6DtwNwH1W9Lzbor/OqY
X-Gm-Gg: AYBFou1R5U/SjMPeQ0BtGaXD/wNcmRA/m6HzJ9N8r9ts/1lB8A8s4VfOMfHewHekj3z
	xaR1MDPU+1f4LcPsa+OhFnNPB62uOPRKAYnW7emadJx4QjBK/wrh5Co6b/lSX8quG3Y6YRPG9qi
	OTg51e0ttBUHfZF9NDSLmBzj/jLBbyoIU+vLsvHi6vNPrVAYbCYjDh9Utb/efQBJMpqSOsnDtOo
	eLnON8Kuc3yGeDzQznpqF18DyNiDsaED4rF6LMKInBcWqUeXO58+iVwPYLVUWokBNT79a0q28Bo
	2SN+CMCBmyDkmsjcN6c3hrs+pVCnsIn18+u/lPaDfY0oRXH9YxRxWSlxk0Dic+5ZTRAPeWMfwP0
	Q/F2J0UPEk5z25Ttn+n6M92/tnlyX/lhMyj6C1+uaYWIISQiHnZn55svOHOZlQm1r/8dtblDItT
	iNrYejBo/JnrEvPXNV9xA9YrxSuWi5roJSqS2jT40n86S1LOvc8wibQs0oN5OX45uKZz5SFd92g
	GCJF4K+2F3M
X-Received: by 2002:a05:7022:120a:b0:171:a066:938e with SMTP id a92af1059eb24-18512c384b3mr12193156c88.21.1792460246891;
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37626819c88.0.2026.10.19.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:37:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <1a720dcf-9f67-423d-b998-d0db73f82899@roeck-us.net>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
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
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
