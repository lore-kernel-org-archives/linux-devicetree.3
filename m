Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0837E2EB
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288233; cv=none; b=LaLYyVEgW9L45PmAuDGtu+pOx76bWZUsygpEJUK7MreA+1wqEjHiyUtwLmh7TSxgifsF8FrB2UXVsPRWkEUA2voFnq8o8E5VSkcOQgR37NAN5DOmqv3NI7JMEcBrxaEQaGjYNe2h/8RZOVuPFjYHlFC51dbJmQ4wCnIHqho83tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288233; c=relaxed/simple;
	bh=p/UozsYJO0z6duo7WzsC3D4cFBwaT5yaJi31DXHhCj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M69sURLURQB9I4Cprf5kiY62LX38iDcqdfk6z2At2woqbeqNgLmRZYU3P4ThlxQnOYfNp+/TLqz4USRpspeJnJlWehuiw14D2bjRER4qQ6vTlDvWylonxcOlrKnEIswBtL5aYU/WiyuGVdWdmYFftGdxUKv5TTAzr2o786COvzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBtqjW6P; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBtqjW6P"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39677242021so11297581fa.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288231; x=1781893031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bKvKH4snFOx3a/w17jY1jRQJi3nETniDRUK13h/HlS8=;
        b=gBtqjW6PYy5OPoT4TwzCu84NVLgmmwe7EG8l5zZbjebV2qLCcqqndLnRFay2P4ixXJ
         tRp8Mcq8f7ZA1AYOV+KdsGrgf5IFeA77A/2iF0zZFI6esEmNGo0WjSuBOwvdYbaw5gxo
         kYW/XcaDu9Ypa6u/oyeunlShVr/4iCVV+LLQF8DEOJelMQ1qc6QSwl5sBgmFIENfZEQY
         lCMorwD5OZOIKOX3+EK3z8MiYe8iqDnFBA/qcaNVYlUj13FQbJRInuRpfne5EqeixJkX
         rDyOlOw/GPWNS845k2lO8jKmlx0ZfPoEKG83W9JPIvpKiN3nvpW3b/TAOqA7FgeyJAu+
         G2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288231; x=1781893031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKvKH4snFOx3a/w17jY1jRQJi3nETniDRUK13h/HlS8=;
        b=pmd7i5gZ37GxNR/0XCxq8UMytPYmIkVpVUf7IYzMkeJfwR4MjG84KFVhmPKYNEOdA0
         Bp+67/aLFwH5VdObYn6jq2OyNojRU4IeiJHN8Lg9YTgxYTlB2xES/3W9s85iulaLGwYF
         MRFvX/GBJROJGivxG869+kJgUI083UDvSMu42ZWuwfaF0kWG26M9pVZdQtRuYtIiG9E0
         CbG5drg2fgVSV8Gotr1ZPWgx+MIKzj2t3d860/VSDI4HnDEVgJN1PDabxiFQitrPEuXh
         6Lxffx8JpCC0HD4fThHrKrE4u4G9Pc+fhf7TcojLUxHMapFs3wTQq66vkbHVmlZMLh2k
         CqEg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/yj0I+00QFYYVBsp0HHtq2YufChSuRLNSBk9sAjCcKJ0eqC+YeXSV7bMPVmH2Wrm9iLdQxhElTgB@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4YgtQrxb6V+YSG7mDMqYYNdstZNgo8jRUZK10swLrZscHZtg
	ZR3yfYolNQP+ID5yxj8d6HxBVffAshLshuOG2BCJ4UIT6tOO1OrsDTDo
X-Gm-Gg: Acq92OEMkK0WjcQwIp1lL+kSc/9Ai7maoAlvAlPa9vjcrHUTZGiqa9fEHC4S4XiwdRj
	eSkG8/lMm2ZN3PZE0pHJBofKPlyVcM3hg4Ahky0LAYtQdgS0rVXkO/juExGZF49f5T2ujlKZ9K1
	09n53+fw4JVPJLd3V8l4xTyKPP2r7dPzCJfzjEhiY7ILBeH7XoTX7WU1vUlT0sxeHPhILVY9PKR
	ZNinBwTZTXs7qli1aKli4WBhHKvAqcqaYZVdHpuZo0AwRdIyGvNBO/rv6tDwfmEQkHcJz7Y+P16
	cTCczQd9GEwiAmb/7zKot23FZwc6Amutyb9SfXOsKLE+faswt68LaoLYGbPXkE18XzcXfrcGY36
	09GCeTKohSnJZiBmfRWM8l8kBqe0V7tcVhSv2cl1Rp8767uvCkg9YYLEVFWPd20D7m68CY910gW
	XY9d/wwOzAnCYg96f711c5HsGV5E2jfiGa+eInewbi8erFbcCP5WeFhCQps0IxThTn9T4u59Kd1
	PQ=
X-Received: by 2002:a2e:ad91:0:b0:396:74ed:a7b1 with SMTP id 38308e7fff4ca-39935620c54mr855351fa.15.1781288230370;
        Fri, 12 Jun 2026 11:17:10 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f4049bsm8116191fa.29.2026.06.12.11.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:17:08 -0700 (PDT)
Message-ID: <cc81f7fc-59e2-4cc3-baec-dbf2f8fe5388@gmail.com>
Date: Fri, 12 Jun 2026 21:17:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 4/9] net: ethernet: ravb: Remove redundant argument to
 ravb_ptp_init()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> There is no need to explicitly pass the struct platform_device pointer
> to ravb_ptp_init(), it can retrieve it directly from the private data
> structure.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

