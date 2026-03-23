Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768BD3ACA68
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273950; cv=none; b=kczIn/UZ4Xe4x3ZgiLU1Oz47ea53v7jqhTL84uREmhLpAh4oY5pGihHoOWm1rW/qsXyn1Q8/B4SGjedaa4nfDESTMW/GihFsgNmDgRp4yzINniXCstJ2eXK1awZwx70HdPYjFEnLe67lnrk58f13SUklkU9j80Jp8bsdxZhITLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273950; c=relaxed/simple;
	bh=V9zYOFpxU8rawRpfv/BFGFNrqy6ZmN0G2ccZ7JYxBHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6uaspq+j1ErDhPihxk3T29GdVZTvM9gIdqYq4uali2MvZtFvP8hoKt4OC4RzIvpcK18RLjTvL2HpFtblz/C+3ciIjXmmVhLGfkYSYu3HxfS+H6QGFbrR5QDimnd5gM1+z0t8S7trgFNsOeE9/KHUSXjiaNhds0YqhsN6dxjTws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCE42txG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCE42txG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso35036125e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273948; x=1774878748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQnsLjDmafPYI4Y+8OWgwJoOxkQ/JQ7/o5WC1Fd1bcM=;
        b=SCE42txGUf1VEYKGd6A39Ut65Ow0vpxtZ4qkFq1ttwY8SAuh4RxTH5ug/ZZvL46RB+
         h3teegLKHjMAEqaUF2zAqGP09S9oHLqkM02aiOcIU+1MGM/ajH+UOq77w1b8x2DtjL8F
         ByrWVXvFZ3BEQMQnJvnsubi2+aDgYXVcMge1cjBZHfJfBGUBYW1rKUEqSEZ2jCSHDFAa
         9hZfAEub8cOI1Xyq9zu8bpKtYxna2YTLtsWddXYnQYOVq5DGTbNzwvKKoynieLHqZwgy
         0j86kijU34TdbxFIHE1a32v759d+qepH2X348B9vr1fkHRUluKjCg51VCt/uZiQngCVD
         ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273948; x=1774878748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQnsLjDmafPYI4Y+8OWgwJoOxkQ/JQ7/o5WC1Fd1bcM=;
        b=crNe6CAQNry4X6uSrvcAVzKlYE6YvZAb9WJIlOvSjzeJtbRZEcp+oC2Cc4oNWloOEr
         6U/dfXm6QO7e7CpP9nmIhGUnum+/u4UyqiWcsOOwixoXeoqBq/MjeSx34ZLkJNAt5RY5
         8mjdkiYavKRA/XPn8pvi2aJR04DqysZeVTFRErZr4g6pDmOE+3kbx+YVvjCRzY/c5o7g
         uApx+5XZH7nfOv41Jti5xcltYNGhVTizJifIdCxNO1kBG7PRMIfOJeiX398ilGr9ADPt
         cMyoA2181wiavzo0v9aFHqN2nz1C22Br3SCbvTY/ZeAFvYCXf1hr5Sv70cknuTGyirM8
         jTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxEHBSfT12+MnkY0C2jzz/y9M6AlFYKTwGfjmedorSDiQA2KtEsTUgGJq+tJwAr5NJ6gTqak+IjKOQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PGHOWw+mwh0vH4/tbbdEK3vlugauSeqS2maecFWzYM4WtKQv
	W4vyPOeu3xI03QvSHNMLFzeTH5TUv6joHShBxYY5c6XWg7mKqCQb2cMT
X-Gm-Gg: ATEYQzwy0nZpQ2HXcHcr3nD9wVvT3OnfVGSSgRqGh4Yw79kNymnjD8HEUGZHHo4q/2N
	8DnekR4xsn1GGOG1uphB3vh63u81ReP4L7wcrIKCdg7sjRYe+R3d9I92PkDHL57Zo+VIdHvvh6n
	SFeQ70C9rICKEkxyJJGp9ApgaiXpxVPieVyysw5vNMwwCT5dAsZ3wbTZtlRbmGCoOKsRaT/hEL6
	deunSqO6bt4HNjRnCKHxIK1zI5qQhxocWlbIa+Thh+0hl7QIE/kRlmVnhhoEgvhnEZcEa1bow+A
	5rspsL+hJ9qrDr4cRD2hz6MfsJVDyG79zaA1/vsHxiqOZa1rIcjMu3OYDWubIktPMzE7d+fN6hS
	+oQBcnwNh2BrdLe/E0mgWn+73u2VorHvwgyT2YA1y9KfEArV9eEF2/xiAtg9/M9lI3cE39Whodc
	0UDRbiCvPzAAFlL5aevS1UpHGaN5B2dZRv2sbMA0A3RA==
X-Received: by 2002:a05:600c:3d97:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-486febb5989mr171871435e9.4.1774273947572;
        Mon, 23 Mar 2026 06:52:27 -0700 (PDT)
Received: from [10.40.217.234] ([31.171.155.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7dc4a2sm318980305e9.5.2026.03.23.06.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:52:26 -0700 (PDT)
Message-ID: <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
Date: Mon, 23 Mar 2026 14:52:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260319-yearly-wrongful-883f7fd86a69@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.03.2026 17:50, Conor Dooley wrote:

>> I described a use case in my cover letter (PATCH 0). Perhaps our approach to
>> tackle the issue is not correct in the first place. The term "virtual clock
>> controller guard" is something we named it, but it's literally just a clock
>> provider which combines several other clocks and input GPIO signals in order
>> for the consumers to check whether they are allowed to probe already or have
>> to wait until the input clocks are enabled.
> 
> Can you explain how this is different to gpio-gate-clock? AFAICT, you're
> trying to support clocks that are enabled by a gpio, and that's what it
> is for.
> 
It partially covers the similar use case, but differs in the sense that 
gpio-gate-clock controls the clock via GPIO (enable/disable), the 
clock-controller-guard gets the GPIO status signals whether the clock 
_was_ enabled externally because a CPU has no direct access to the 
clock. So perhaps the terminology I came up with is not so 
self-explanatory, that's why I posted it for review and other opinions.
