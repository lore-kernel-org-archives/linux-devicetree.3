Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5053E31D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920161; cv=none; b=L7cODaAxoBFTLr6gBJpmi7emOYeVrY/YwJ/QSY9E9suHOPJhX6r43EWEsv90LbTCw+eyKe6GT7v1yFUiraWsciobBQ3u2kB4wkGdlxJox8GLBxqbKAnzX2UYmJEaHpOWSTLi/KbDbhSnmlcI8mocPmYumgz+1DppeCM5OA2AKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920161; c=relaxed/simple;
	bh=iqhwU817Bh8wtwkSFHCvKH199xxOPA3S/QxigndqQ0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1NeVxzXXCRPWF2o5zawOMVgt7lpaHvss+k3Ld5de0RxW7sBYAAnmywsGpzOca7ZnI9Bzsqt/BkOchPrApF5MAfdf6BQEI8SjKxVzMg23TRtDeZYuZxIvvj9yN7hCXAomfZjzsD2hRG7De6wqtMJGksS7Rtz3k9mgzXVYwL+zu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBA/c04d; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBA/c04d"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so543093366b.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920157; x=1792524957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=nBA/c04d03+4FS8zRFlxSo7hE+ocg/hFKDlZJjyCjvMDyfbYcoS1OYE+Zl5jkvaLi2
         dEEhTmXUkExjqrc+5fn2Xj3j84DQZDTUqK07nTDS0nc2yFz/Jpqoe86J5PPJkkh19jIR
         1PApW+oxSnf18GRALq1oS2LhB745qTTJ8RlbiaBM89OnBEkQ0kJ539o78Yl/JDN0lL3A
         epMng4KcYsLYc4j87rrh93lz1RpBz5+SY0UlF9H66FMDT9gNDenjVjR9hDlUmisvSmi5
         FHtRseykRoSX0dgmVwkvb/jc+ImjCukLqV9q+Pfe2uD5VwTMUJqdyEWos2eB+l/3HP6V
         HU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920157; x=1792524957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=OUvQvxK9KTDx6HCZJwVRS/I9+WQoy1wA9pKzvl85kYfeBIzr1z0Wx6l179ZJKMfkKP
         +0i5pS4euP3hsq0eBtJIpTFssepLcZkii/jL0NKwA5zf5kaiDsGIhEe7FdkazyTwdD5v
         WV7cDFz0hL/Fczt0E4sMZiBh5/D0eUth5fCK/V3wpAdFJ4Zx8QMD972qmyfgb1ECO9GX
         tT1F7C7pkRPfbrTX0op1iXdOt9myFTeenZnTra91hJITar+OZ5MQRo5QFUD+7Yj+V+Bm
         i0m8SS4deFPzaWa+fypOh3SsskfyFv5cy8c2qrM9X+rIz6uCKbIxWZtIcSbFpuj1faOQ
         O9tA==
X-Forwarded-Encrypted: i=1; AKwUvBwsnJ7eapoEwGtTxGKPOco6PVw/HiGijLRr9IY7wv2RXHSYmPyU7noshk1DyD02LTSK/r4lXWkYcQT9@vger.kernel.org
X-Gm-Message-State: AFq9FYJxTLNltQA6/niDOB8gmjRUFvFvxFOVEybgyPNlBuU52NusGD6R
	kML+WLYwzqziK5GIZM69c8/SdRNw4MrhHGc/JrVXvO9x8e76EIpeeqfTnCg5Vg==
X-Gm-Gg: AYBFou0U4XFkTFgFSLgz5qpPb8UgwiVtV7PjVJYHg4K7/RjS0hkvwhjuA6D/+Km9ax+
	xj9RdpA9GjZW3Oc5l2G4QBYYTVrtQKUfxuz1o3sagh64zg9Oa13gR1OR4lMsYKKxXiVf1wveDR3
	ifaJ8bD+F5bDwbioiZi3grLitPBbXUQBz47tVx+0LOYFGiIfxNVtkIa/WuoiBLYleRYgMjMLH5M
	2u8j5gQLXVWyk97nmTvdUHCebRMXPX+P/rA7DCYjuDfo3FtI9aVdEae/LpPPj6sLNVFL40qcSoi
	RPXKlNsLUNnrL9dpb9oWQDoLbxUHfS2uza6PSqgj5ah+90Rixih3CR9lrV75+0jzhRCAx62l12L
	z/rM4snhCpSfdrMq/ebYdCBSZd8dMa/tpsb9krRnUdi3JOeL5P27kckzwbZBiE4rm+tZOtVMDRz
	mnd5xxpFleZ+6RZN4MByGYFtsZeo9wqOSsZjylASQAQejhIWyrlzDnTVlFXPNmBFF8v6HF1tLrN
	752oR/aLviHjgc2jb+z
X-Received: by 2002:a17:907:9485:b0:c24:e1e9:69c with SMTP id a640c23a62f3a-c31a9715f94mr1282040766b.0.1791920157246;
        Tue, 13 Oct 2026 12:35:57 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm232266a12.20.2026.10.13.12.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:35:55 -0700 (PDT)
Message-ID: <f401636f-7edb-44dd-b47a-4c347d33ed2d@gmail.com>
Date: Tue, 13 Oct 2026 21:35:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees+treewide@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-4-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261013181803.496627-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

Thanks for the update.

On 10/13/26 8:18 PM, Svyatoslav Ryhel wrote:
> The AAT1270 is quite similar to the AAT1290, but it does not support the
> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
> address-sending capabilities.
> 
> Differentiate the chips by using a description structure with a flag to
> indicate if AS2C is supported, Maximum Movie to Flash Mode Current ratio
> and if flash timeout is fixed by the hardware.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/leds/flash/leds-aat1290.c | 91 +++++++++++++++++++++++--------
>   1 file changed, 67 insertions(+), 24 deletions(-)

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
