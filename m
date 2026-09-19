Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B92248AF
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823887; cv=none; b=h+243yQxnU6je23UjTNDQPBvwG89UcuuqHqL2fnNS6YXQuXFuqoRje+otOJ11sZtodhS+9hCVLe0+dQ+vIb65aK0+0JVxd6NJaH5f8qZ8RG6y5JEVxEivwLIvR9czx+nHdVUzD5Rf+sMo+N//KYqYFWX39CfmhRpaQkLucYpbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823887; c=relaxed/simple;
	bh=mB6gjqFVNYugWLU6vwXbHJZfq1pD9ilhYpAc/8L5b3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZIYZfQyARDj6mm7pvbsSUTjHSWEyGEAw5uv0hx0KEofCkq0QCJRrNXc4V6TXsC6L6V/wqk5B+LcER/qn2tED6XIve++r+rSM1c+ntF0r1jp4F7FxMFvuzngBbsO6tAIeX3Y6rtH1YGx8iN0mlNsxUUfFyiSgI8EXCWZ8TljaTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dsERdrM8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dsERdrM8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so22163895e9.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789823884; x=1790428684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=dsERdrM8wrzDZbd9rXNU3oCESGOofGLcz6iOubTex+qe39SL58qh49bFfR1DZ7eIX9
         Ng9lpFI7U54dH+tPW93s1HVi/OZtiSGUR6t9+xhv5tccEiQTTOFMST/x3Hgv8vr9vT/Q
         C546bYIXv7o0hRsmnRuPosOs/9pWFfkiZE0mj0PWQlkoqGxKw/c2C8dWL8CbGLG/ZLPe
         Vrf4pGCZCKWqfN4b0OGdZZzBLK0eQe8Oiux5h/I18I+Y8yePLLrKmHgwu/P0TPbIzIS5
         /IlptPZyJzwkCDs+ihKKcw7TBID7gXwwNlJCVCY924uDpjhgEp+u/FuUfzz0GQhveycm
         GXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823884; x=1790428684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynO7gNGl3+DgbWqmrpV3fne3h6bOndWTZo/kOSRwgfY=;
        b=j8dgjmr36IpEn1eivej5ue+OBwN69VgJeKTBWfFTzVi6a1uRYUAlZIWQs1wnbndU6r
         9ePbycjXvoViARPgt2673TtFTpA5HU1iQgLN96hmKaAfQ1NJOfa2O39zOj2NTUvoLvF0
         fFlFNj0cL/lXwkdMPwOhHqu50ItdNA/NYDSr71z6dLNgaBgFwfryLRpwK+8Du4cX4zuo
         RjnZhQuq6RYZg5RAJgxG3onlM7q0BWLYhiVJVvQfkXYFZ3a1lcd0Te4TY5AIQh531+Da
         PtdGo5e20KF18SF60iljYPyuR6aTam2xWkobVi5/8vgFH0DIiGCrP/GHZbusoO23ux77
         zMmw==
X-Forwarded-Encrypted: i=1; AKwUvBxzubVc30c/q2rQ9vyHC2A4nQYDX8XsCKG4HozmfKUnjPm/bBy0OaEy4oXR1ERsiqFYaulENtn7oJ1y@vger.kernel.org
X-Gm-Message-State: AFuF++mi10Q/6/KfaTohXMJyLJhvDTwokMiqD7wtnd8rNNrH508PdFxf
	j9HHw+cbmM1Im32R9DTRkaGLEnw4a/gvGOad9v4FwPOvpVOMI/P2RGnEE6v4+ARKMas=
X-Gm-Gg: AYBFou0VYe9IkQf/wZcB+GVyR2FDEOI71rmqENyC5TQwlnV61Mule+sehyECFroB5mk
	oWb9Br00c80xTba0l9F2v22bCBzNLeNENjrqnbM6UYEVUg2S1ZEem4TQG2HKehZthECoxemaPLe
	jzw4dUmrA4DpuNKn0Y2wlOFqzVibSb9jge/vs0cESmhwFnfQVQ9Nhawan+FPQ+OWyYzbNTv/gJ/
	vW4LOTJKboA4PVFC66f1ari3sBy/lkh0TpCGEdjBurVtm91uoUPUVgiPiye70Ve5fVdN9iqjere
	SCZeHqG4kLO7HmDWM2+Hy5CcrVN9W6CaldkE8hexIPdwWMn3AEXmAUCny3PurRbtR14oHkZSdN9
	taufa/S0bLhuWc9BQNVoglvZXe5Vqs0Wbu+rNhXyqqeortTdKlfPgvhN2WY3XCr1py2h9po1Wff
	yzOHgkCbxbTNLZsYD/eKJYa3CIahFGumbnJpcnqqWrZ2euldREfz3ElGIX8/9JYJAxqBLkUuz4+
	F7Yg0VxX5rQGeMYOCX76nhSYzuV8CxyskOf+toNBdaMzP3/HWNWTJhdmtGdSxoDYQ==
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr71850835e9.29.1789823883840;
        Sat, 19 Sep 2026 06:18:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm70658255e9.0.2026.09.19.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:18:02 -0700 (PDT)
Message-ID: <275bb967-21f9-429d-89fb-efb8a498f388@tuxon.dev>
Date: Sat, 19 Sep 2026 16:17:59 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v6 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc: add
 sama7d65 and dt node example
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Language: en-US
In-Reply-To: <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add support for sama7d65 and a dt node example that shows tag can be used
> to reference a packet stored in the OTP memory.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
