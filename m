Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6993451AA
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827922; cv=none; b=YNWqH61hhmsqB2wwbpARntx3Hyf6M/m2QVSi6+khHCUtyBqJD1mo8EaUeS+7trh6aSA4yzhBX3NJ0L7oagsFX8KDVqtLFvDODPE4zCbcHRo+YQO8WqtiC/hLRQInVvm+bCsvMo6AABN2XU2tXUyOVGKf2clgZQvSWK87yiirzOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827922; c=relaxed/simple;
	bh=S/ViNZ2YtzcrRDHfzV5246E+VEqBUQTYkIoaPYG9LJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8LnBcVNE52rgkri3yVGQndUyC60cpPlZFnY7Kg9OaUC4AlP7H6nbZcyCt1fvD/5dvmxpt6FNI7evV/3u6YINFGw2G7kDhJFoZXZTGCbNjzgAmQREYMU6WsFanTKqqB/s7TkwNP8YTqz5oTMm0psU3ttEHKI21gj+ujZjl1dyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dTmkw0N/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dTmkw0N/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so22635175e9.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827919; x=1790432719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=dTmkw0N/pkZVW6rzNqFqTAB+Gqa0JEtYh4hv4tx/KwbSf6B1ifrzV6hdpNnq/BVIOl
         v7YwfTiWBkQ2xV0C8oXcJSx5ASyPOvjVjENhzXdY6QRNJnLq8cyS4deIgE+9c5zR4np5
         qVkyTQ6V8E7xNGmj2GEuos/txbQAwUeFYF8nWAwdoQzZmvUmsfn2ZBrPiTnsrLSrqYlJ
         +5pKMmqrAZEFTFdzMsKLlQmpm39ZDpPF2hEeejAkqOyecKnuKZMCMWrO7NlkdEL/Pn+8
         Ml9uahvIz/eYY/71AdB2dEZGd0AR6QaPMUSpOUsu1BJ25cSQX7k6mfbl9BGpb9kbBG6i
         X+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827919; x=1790432719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=0X1W+rm3k7FSb+/XLWOiLafifGk9IMzQULT72ialSgfSUu1XzsYLHZxP3CPV1b0qF8
         YExXYgXT+Ew5htuUx3xXKYYvSkMFk0gIn49vRV44y8IZf+7LqM1Q2E6U8QnAjMVbl73p
         5MN76BQ06v+4zr4pu/VqfiirqgRCWcgyVOdxj1tl84FDTrXShjzu1G6Am9lJeaUrnmlK
         cObJoBr/topQgnHi4pKOMWMi8grQRruGtHRtoEyKz8h+FeCBXYcLbhzSpbLkCYsptOWh
         M9y5/0JS66OuXiin4s0APgIBovQRfilSfPgJs0pJx2J5kjlAGEyiMkLY1Ev8jAYabCko
         Q5ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/7WNXRB0tO/QYvlXhw3GKHJ9F8xuGOI0dMgYPuYUyo5T3xOILDjwQp73wxIec9Kr2/19Hm4S3IkaT@vger.kernel.org
X-Gm-Message-State: AFuF++lttq/NSvISPoh4WJazPPdy/uiE4Q/bSoaKiqzrOEumgKnSLnnk
	F/Lk8XaUSEUB2i8bPuu8lnbd3tuDu8iY6aS7vn2ji+kc3Ou77jYEZA44FQbX8exhGOc=
X-Gm-Gg: AYBFou34+Kfbinl2nlfuEFaB4JGd5TOyUuiPhRUFmh2RcJn3EQ87bVM52VXNLVPlTok
	cjUNG7dw97hZRSwqeoiqQjvFLukd6w3Dj5fAfMvAVOWeZSClEoKeKsBnMFJKdqvzbNuQHVf1qkG
	9QF6XvQ5rYT+x4Y/M8xMwF+Wsy7NzO615AyAb9qNCTbMhlcB61hba78IEIkseP+ezfkrpwJWk2P
	o0rpzVG7QCn3P+5+NIL4ANyfYKtJqGyJAOsf4byAJ7GuhHJtle3NsOTHEGc+Gv7EHeZr9SumkbH
	G6/C10Fh5KnhaAn0sGJ1BZgvV7mXSth8F1FUH7sPfwFWkVLUDuQyv1BLXsgfqGsZgrJI/mkCTiK
	NFbBcvCr+PavmZq6Qes3v4+dg8SY6vMzfTBHZPKN2GYFTp3RVSC6lhRDZX8tbWAE5KbRXh7REy1
	yhaxBt6cNQK6O5Y8oYR73YpweH+fwbprsPEtH7GR3SL+neknHtjz1mQycYYHUyXgt+nr/6R+5DI
	oBu0FI2IjklHstk3GnGeXh76Ay+Df8wUHR9Wx1hJwqRQBhqJSL6t26s
X-Received: by 2002:a05:600c:19d1:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fc5743bc4mr79415245e9.23.1789827919214;
        Sat, 19 Sep 2026 07:25:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm78403545e9.7.2026.09.19.07.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:18 -0700 (PDT)
Message-ID: <c2c649b7-0f6b-4271-974e-a84559c10231@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:16 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
