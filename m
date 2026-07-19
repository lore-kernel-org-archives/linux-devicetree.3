Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75658398910
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470648; cv=none; b=Y3GR4zzEwIuiJeGd7hBxiA8ERHXKk4S9uCS61qL4PSCoaD5sudyq0gVPUp9KlwcF8GSNhyL/NLn2NPSjO4lWHEoYSrGMW6zzw73fQIgnnY64/nvB5jm1m7Vj//WaoSIYqJy5AksBHBsXmI8BYdt0r3DdIHfAH1Kn/b3nYiBurLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470648; c=relaxed/simple;
	bh=/akf6O4r6B+pjYqtGmLHi+i5Tex5jnNCYF9S1biaXt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku5YNHPdUABeGpXuXao3jjsJGTyYcmCwieIRSpTAqvbd9A8HdgHinJHDzeqAq1VWfcpFO6C68w+K3QqrILFt6mIdIY+TQMq948W39xz68iJ5iCPBqetPHjP8+78P0Zk3jZKnzkeSx2jP1o4M+w+zqfwEBvJNGY6RHy1a/Bl/zpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvMfAgG5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvMfAgG5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cae1a3a744so70051915ad.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470643; x=1785075443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6BhvuCaJxLeCOCt8FTry4ejtKQiQZ1HVnQoy4r2/7k=;
        b=fvMfAgG50eJYGT8xhWcfki9reph32zpIVH//+C0EKaucERy6Sd1QtHz9m7C+QC2l33
         ZKGwOBLoFAjsT5A6NT48Br+RHb2eAetztcvgEQkak3Rda5gUaMZIT6HJJJZNDCW73MyW
         G4cORiKKBYO1hL1LZRjt40ItiaTfxLubBypjyuw9S8DjMYsJ+Tkfy7xheDOTAGbBesSl
         HcfA64zbW+4wmBIr9P8hO+kGm3OLwnTpFY++c/CqlXymSV3oS4TJd3FuCW5OGxF5fQe5
         zpMUiH6Ltdo5PtVx2ULUnIXYJXD4qYinVOoy3e/9CtYPf6rJa2+rYRIm2ZuaSK+hu8/Q
         27vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470643; x=1785075443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6BhvuCaJxLeCOCt8FTry4ejtKQiQZ1HVnQoy4r2/7k=;
        b=heXF/D6I0upgYEU+I8wL3hBESSpG0v/yAmttohXG6eMEbgfXN1MGdIRq+pnXPTpE5b
         J/BnNxm3UZHLJQXuE8ufG7g6lrPwqZGEzHIMxqqnbWBH4dwuZwP5Nh5gspJyLUGPIlem
         iBXwEPezesZdlPkvQcBf56f+L2bhl/9NMJBkbsd6AaPIWDIS0gqIn5lCKccy3YKtNf/s
         AEUb8XJP8shuTWPXB1Ph12SHvW06nz1YBgOFDzCaVVQgzipin1/xAfhO5/jBIsQEnVt6
         hFa4aM9NIEv4vHOzD41kuoQi/sYdvc4N+fzWETfw1rPtE+mVsOcApiFwRRtC5t1UbvsW
         +zHA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkw5LuToZhhfJ6WTroQ70GU+xBfoJFlO0m6jzSHtQjCQps4ElC5efPS56fHZ1HpjhNHjgiw8pEJFw8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YV5MWYoN4jTo4StFN7oGxb4sKpc6ONlZTD1F1XeFsKZOBC0I
	dxbRpMVP2KiQ7QI19lCKeuE09q34v98rgxr9WEkknFAe5tlRg0IKfFlW
X-Gm-Gg: AfdE7ckGeEo8odu+H1cO9aemdIVnjnzwaOMcZyW2jtz2DhJlN4H3al98nGUTtJ7xgiD
	sZeLIeVYQ5z0ovoxlWxdcILDdpQn6xn2u+pd0WbetWmpoNzzhn8rJxNVvBB65XEFPjUJJeYeqv/
	zwAiTAl+ePLeBOAmTsNvq8dKzfuPhH3vhq8q+4SJ0iARonDn4LNAX0MHgqPyS/24lGcGCNIgAbI
	HTq+bgaMm1nJmCmkT87POq22Yy3JMVGXjiILaYllGU2HpqSJEotFEXnVdY9Zo6k3nHPGFXbrhcW
	qTnzudYzePwhMqJ0LRv2WzN96XJPJqbDsa8LshK1RLkt7aTvR+tkOBPD6Cz/kuZmPvtss8otIt5
	D2u/Y26i0KIcPxbgcjvpkvHmbiKWMUJYZ9tf8VQZU+BL8gDXEDM1EchuWvwCrkDOGB+ZYrZb/qC
	XJNS4eP6u10E+hR0c=
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr124159515ad.24.1784470643477;
        Sun, 19 Jul 2026 07:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471513bsm40475355ad.57.2026.07.19.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <6c8460d2-ef2b-403f-b80a-2afcc07a2051@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:57PM +0800, Zaixiang Xu wrote:
> Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
> family and the compatible GXCAS GXHT30, with the ALERT interrupt,
> nRESET GPIO and VDD supply as optional properties.
> 
> The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
> and differ only in accuracy and packaging, while the STS30, STS31,
> STS32 and STS35 are temperature-only parts. Within each group the
> parts share the same software interface, so model them with a
> fallback to the base part of their group: "sensirion,sht30" for the
> SHT parts and "sensirion,sts30" for the STS parts.
> 
> The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
> as fallback as well.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
