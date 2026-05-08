Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F262FFDCC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257947; cv=none; b=eB1YhsfJhCcGzVXwAy13QTqnb7d6GGOaEGA9i9+m9WdQ7+heJzhgJ4Q4q9mdbtrLK6s2wiXrFgLwaE9vUaMoaUbjJ0L2YRoa+j3QoBZZTRnqtF2m+4waAK13f3jIKETd1wS1k+VPbV7c1omqIGPi2JpFLuAay9CSYzIvo5/Q6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257947; c=relaxed/simple;
	bh=GWIbRu7yojEgT6ggCcPoA5yjsOKw95UadSdJiJadnWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XapvFoEh0zm5OG6XhbjdHmq6Yt90LTw9Edz7k58c3e1xc69wntY86wMcNvlQX/wK++LLtqBcjtlXB0acEC+RcYLH5RS1VS5sjmn9wUm7J/LDLaGVGqcDvxDwUcIZrbTbnBIXHG9LjEEUSAVu41H8+8mo6/vp177fascpwCx8E08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riXHkQPD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riXHkQPD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1036258b3a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257945; x=1778862745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI2eSrUIuw6745cX7kAtjWSrj9maOslSs37JhU20zZ8=;
        b=riXHkQPDRus6Byi4cR+bUex59EinOYk7putUMfhKHSxkW2c3Ey8tHuJo97YfIRV6Rf
         fKqKvur0kEBzZHxX8gxFhunGVs8dS6w8czyMuPmxgJpbsFDr0XFcyd3J+yPga13ZVJp4
         2eZ15ODNeb1VuJOe0qbHK7Sb6Dfm+4P8CKDpdTTQWriy8f1vihQuBv8ED+Remt4m3SZg
         7Z6Hj0iYYFu4dyQLqGGQZNGy72vhe2zgJn/T+Qo1tiaeh73hPA0byV1jbRyu9cmafRBq
         bna+7xxxi63j80sUEbga0OgISngHwarA0lUYYy50q4KwcVjY7UOtGmps3WTM3sCTylxR
         U19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257945; x=1778862745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qI2eSrUIuw6745cX7kAtjWSrj9maOslSs37JhU20zZ8=;
        b=FhhBaTyYeeum3nBokivXXMDCUrId48EK1B9dUdm9A77HQkfvYuKKnDkV3EKKBwDM1f
         nwVqnjAo0OitdrzDz8Grliyb5A8F3V+do4cdlfGqKFMZJGrXZjkugRD4Lyi7gQcfVIxB
         mh8t0zKdOPLoOtOV+JJHBn03YlGDkpVUsyoNkl76d2lJFwihN58JOU3UUdGR+voqElbV
         0yQmVhMpQhlbUQUeb/vUmFRYhhVZrqeHatDy9OClWKVwvefn18Di4l1yD9IHrMXByW9a
         HcYhfXTwGm5kqAdW0HzgQNAoGLR8dEk5ymvuW7TeKyds88kYgKaaAUPCW8qOUPvOAhyD
         +lNg==
X-Forwarded-Encrypted: i=1; AFNElJ+H/I/FIYtj9f2lufnJuIUg9U4BFFrXMLULXx13Y0onrnmFnGQLn62Ww7dJwNOFo09/RgM1weuXsQSv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxly7PdM/IsnvC9kwkFfCacBwv0/1fEeYQuQqNlpfT4d2ru/P9n
	cleK6EvXsu0IqpCruz5jpSuGK1KWMz7Ko79+XW3cG+iqAN37HBleccGJ
X-Gm-Gg: AeBDieu1Kfu8UDiUWsTLJ3T5cUQFDZuD8Zw61tFlxN/sMz2bbAfuZVqDeY/yvY4EcjS
	BDKPe9Hw9sfdwscjhpzbl96NC+f7sHyl42614XLAY9huBGyxhMbxxBKmr9sUB96pouYoHXS7WYB
	G1XdnSk7dGrNWzMeR/15/gzVHl670AOduHQ7RNL9nNgHmIvamy+Hsh785Ax9feTLyOuTemEwzAC
	Ni0Gm3fdESYhyP1le9ES9B9zeV8qUeuLu98+GbwWjGYA4/3QSRA037zem0D3NoK0lsRNGgCO8be
	+y/7oQqnRzgJQXu0e0ANZR7tfVfjsQC/PGk/D5PgPJqECildofYW5EfZXgmyy9ZeYQPCUAknUJp
	aUbbWgpaI6blqYhCr55k+wb/FyxUE3E6oJlwgYIr6xJ2cRCDEdd/92nkEVl591nsGQyUaL5PI/7
	OZO63FVML3or47Fi0a+nW4usOEB/69Yagu/c3t
X-Received: by 2002:aa7:8890:0:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83cf6a38ea5mr3684067b3a.29.1778257945345;
        Fri, 08 May 2026 09:32:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm12247875b3a.57.2026.05.08.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:32:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 May 2026 09:32:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt:
 interrupts are not required
Message-ID: <72cb3b5f-f669-431e-a02c-81537045254b@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>

On Thu, May 07, 2026 at 12:24:09PM +0200, Wolfram Sang wrote:
> It is now understood how the watchdog can do its job without the need of
> an interrupt. So, it is not required anymore but optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Waiting for DT maintainer approval.

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> index 7e3ee533cd56..0e4b5b529e9c 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> @@ -29,7 +29,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - clocks
>  
>  allOf:
