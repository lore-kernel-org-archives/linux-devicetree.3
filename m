Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7373E44F6
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781365164; cv=none; b=Mg5hbzbzTR04GJje3PJ75wwk53Yh1t86C51HtSfITAjoNBVRuF4wxiW1SXLT6tiq9jUJzB2RLaWVlg8P2bVn8UGR3no9liunvrprO6lJOTOVnY4AY9MC+JRRDV0vdDI1qlqRZj5SmL2XPKKFAUr9n0fc66gRWAP5RktriBR0QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781365164; c=relaxed/simple;
	bh=/z/uJcHq7PBaTOzrKCVMvYfLipWmodz6FmZdNMRkdKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZnZCEWc473cNhYejhrmbKFibbx0hOQJhnG0PTf7FlR5KKWR+yy/vzvVGu+OObt4Y33CNMMrumZpAUhNCqGFc7VHZhc4QUeSmDlZPO0JNxpOdz8NfK/eZYcsnVFmTnwgloomnNxbBb5mrtAONGi0zVq+npd3FdWl+RdSzmomkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BLFwYYyW; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BLFwYYyW"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69e505c7e22so652962eaf.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781365160; x=1781969960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKts3zC1pZWU/tdG0AkBqX+GZ23M67qUNv4e5eCuZeQ=;
        b=BLFwYYyWjMvpuCXkNHGjs1CbUiUmOMtg/NUZSf0JLuaZmks9+JYFzV9AM44TkBCoKi
         a+ZT+s5Co3UmuADrGXt2FPwKgFRjzP7Z59epyQN6xBuVDzopCKulqSMt+K5aUCns6d8W
         WRFtl8gvGjLpos5CMj0s/YPFRL2oRwvZiHF/yRG+SdDHHvu6xcNAXlDBYWB96Pza2PsK
         Y5Ww8dm48LvQ9J7lmqNvfLPp8Ec57H/8ivVDYCgEkkkhmbeGGcODIDd5sggz5C2jJCFH
         iAUU1OdEofKF+GQxUgnIHSriFR8dvMxvEBSvhEe6U0gtlazDJWl3+tkOn7KB/ANKq8bg
         lpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781365160; x=1781969960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKts3zC1pZWU/tdG0AkBqX+GZ23M67qUNv4e5eCuZeQ=;
        b=kJWpOPfjKd+qERiKZt4uV0ZMac8LfqIK33IzaxAev1/OX4zm+SNrAO8PvalwvSTthJ
         ACoqc/pQjk84FV3H/7IjdI53h4+xRDmKj6KvrNaTc8hGhWFJmFJbE3GiczTQ0KoXbvss
         lm+dWvDJ4oNVE+O3Sfsml4PQ7yQ7R8UJej2dt/u766pCm5nXdSuVZqT2oj/Yp8ItuWId
         xC76PPuwLDNSm8FA0zf5dQZWA75a+A/tZk4oTTsXsGbQGKpG8A6d+ZaL4PDlaYk3ouTh
         hyp5oYV6/LgD1TqYfImRlFcf9PvM35jYQxYEBP4hMg0wkmNT4/wIIKNJ/tZ/4SKf9o6A
         kLYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9/MmRG548lwXzATsL0tda0gRIjAN0cRN7NEpaXyFW2KCGLfSBh17zzfXpId9NXqQYgDYeu8Pw2X1M@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKLPB5+wfaXL2Snw26aiD9eWc8Z7mdoVuIMWT3ER67Vl7QIdK
	/QgUFU2fXjUgR/0KnYNWkrbajeDPB2/TQQhUvIhdyJnbBVrSL72bGWibUM3tDVxGKSc=
X-Gm-Gg: Acq92OFj7ONrnKT10lxPryqQI2T3K11LoY2b31uemyAXXLUhSSAImE1EIO76pz0YJ2Y
	qA54Ij05GLq5BJsFRAjq+xTsAhjuyS3OgH9QSvNzqwIMs2zsuCGaBz+Z8wrarJUZaKku7ZgQvNL
	5JhiXYNVEkxgD3RetERAY/R8tM11SMcnvO7ig5wV00i1a2AXeDaKl8ujqci1sx3bbnFfD01oUxs
	9+gzprJknztpy+1oBCXwYNpJwjA0c4LGT/RDI4ugpZbbsxKlpCukc1151hkF3fg3SZOjIOZAUwj
	GK0RydYxinVaxd/5BxubgU/4dSU4V0ZuPBm6BQUpWBXtZvYtkJ3r+oncVeMBd2JynSfLxqoakqF
	YcWrAfcsWtgxwYlkCOF60VFdRfdlvsp+PFNSa3mlkAxC3Q5R9o/34aIfbWLI7pGA7/BdqIzA8jg
	Z39yEDZ/5CBjyE6uA4nWWpqh2rfUizMsL9XH2Tv2b35+2G3P0jaHNp2gxunU3k6OZ0OCCLK+mio
	w==
X-Received: by 2002:a05:6820:618:b0:69e:43a2:348 with SMTP id 006d021491bc7-69edc6d4369mr4531364eaf.33.1781365160437;
        Sat, 13 Jun 2026 08:39:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cb9a:87cc:1314:fef5? ([2600:8803:e7e4:500:cb9a:87cc:1314:fef5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69ed8575597sm3832633eaf.12.2026.06.13.08.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 08:39:19 -0700 (PDT)
Message-ID: <0b57442c-c1fa-4c06-992b-28cbd046a7c2@baylibre.com>
Date: Sat, 13 Jun 2026 10:39:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: iio: magnetometer: add QST QMC5883L
 Sensor
To: Jonathan Cameron <jic23@kernel.org>,
 Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Siratul Islam <email@sirat.me>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260612124557.13750-1-email@sirat.me>
 <20260612124557.13750-3-email@sirat.me> <20260612151324.0000704d@gmail.com>
 <20260612144529.7521b4f8@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260612144529.7521b4f8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 8:45 AM, Jonathan Cameron wrote:
> On Fri, 12 Jun 2026 15:13:24 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
>> On Fri, 12 Jun 2026 18:45:26 +0600
>> Siratul Islam <email@sirat.me> wrote:
>>
>>> +QST QMC5883L 3-Axis Magnetic Sensor
>>> +M:	Siratul Islam <email@sirat.me>
>>> +L:	linux-iio@vger.kernel.org  
>>
>> There's no point in having the IIO list in your MAINTAINERS
>> entry, get_maintainer.pl would return it automatically based
>> on the driver file's path.
> True, but I'm not sure there is a standard convention for whether
> lists should be added in this case or not.  
> 
> One of those things where we should decide on an answer perhaps
> and stick to it.  Andy, Nuno, David, Dt folk what do you think?
> 

Given that the vast majority of MAINTAINERS entries already have
L:, it seems like it would be easiest to just stick with that
convention.

Even if we cleaned up the 140+ IIO entries that don't strictly
need L: linux-iio@vger.kernel.org but already have it, people
still may just copy the convention from other entries.
