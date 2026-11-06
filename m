Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973290;
	b=t9GJXbU2Xx+hekgFFaEh/9tU5pctyG/dqatWRY04hsauYHq5EIlX3tAVKshTTNkNG6mU
	 6wgJqL4Afdn/x0TmvfoN+4QEYpFPNGE8UzYNTiWkMil3tBvjVOF+rsaymKsL27m66Thwb
	 U9IogDDR2dcznWvZC8zKp/ieRBDmatA+9wu+jgCDvtfPf2NEdu5nReuKJ7DhDtKiPS1qo
	 4Scn+4e2W+6FHF6aWwM23asjUAduj+V9n8tRbSEDevG7ZQKRcha+lHhyerOjm1sE0hyL0
	 xC2jcsbX/DGDt8z9dFke7OimbheF0P92kpJcVHfSIIPRtisvE5pw5xc6yy9kaBC+VpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
	b=Hu0k1o80WRNBNxgLdyoBSwHfKP8ppGemdFjHQX70DMBnQnobM0LV0RgU1+MoLEQTvryv
	 pDtiALPMGbVGdHZZvCf7CqVctS1l0/Ze1x2lUK6kHiw4G0vlYWQbvyr4KuMuChsoXC7Qh
	 moarRGjyFCrfmDu9e9ATQ2qs5IqFsrTjyetedR+tMQS+Fv3vZuZU5r/E+63Z5ZeScKYLR
	 j34XFNcHt2yCU2emlppEYFgLhB1DQBm3v7wGpxQkF+b5jeChAK2Xijb6IS1bvJ5PgSVpr
	 +I7/FqCrL61Xf5gCkGHp+XKJE9mSrZNXemNQ/8BxZUN1JQ8DzcNr3V9jkxba7TJ9F+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsreXca5;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20894606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20894606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsreXca5
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f563d1c6so201441f8f.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973288; x=1794578088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=CsreXca5E1pMin31kHwPFSa+zHh0j4vm2eSTeZP4n4qoY2Nk1tQGNo7TH21ev508JH
         +4h+HGmiNKVAQuTC+w4RPqkmarRK23BfNTVJcFWVyeOXf1QlBPNwWDvZc+Bpo0199vf/
         MPmzv1CCIhaLnS0zkFdbhnExzCD7PYqRsu2tq6hgYGLm6mTJC3pMyhRhOO93HL9QX9PB
         yYqQXrIgd+IINpUK2azxMfVC1X7HJeSzOe3Ly7ghTAXg3lhI281usQhIq61cKMysoJM/
         0JjqCZdiinl5DOmM3fX04n8U51eA+hpSkBe6h99Y7zM+/+OzGs9Z3Q88EvnGFDgbttKY
         Gfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973288; x=1794578088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=cSUVS2UtSDwTBnU176MMVvYZVUDwGi07Mj4bAQDZSJC54KmAfdpNzdVK2vYS2kOYGZ
         RYebVprLJkRK4yTUN1lIk61viXdXaprKn4NXDXHqnqSgtAFhX5vogkYz19Z8hQe0CN19
         Q8fVD2Qep7nPkdalTH26GALISlWUB0x71eOQb+hauwk9SIBSfzDh8eVwJzIdWgp3gBg0
         P4IAhpAGtrsSYRA5QXdsuiPuN8YHvt5BX/N5dw3sKb8ISuEIYa/YeTr09SYua0C5ogeo
         jjaPFtg2jLXykXH7WYc5+eSqOQjZ5+NR1d5iaciSYi4FrEzydfXnx2bAeIn2AuFNxmzU
         fVtw==
X-Forwarded-Encrypted: i=1; AL+hErEM4g7W/JNTfTEo55vF5Vo6FTlJv6GMl03lJoRabuc+nhlpiRqQ5siS278nk4cZ57RoepoIK7DVTVcB@vger.kernel.org
X-Gm-Message-State: APuU4Z/8FH/bdk0u9c6YIjLwE9HmmDk1KMUw7kcxDnEjUDhZ46szEWXz
	OznJj+rMdX4tzRT078+e08w9SCnex5VHpj4ZUbEKfPqgzbQ9WC6ECEfo
X-Gm-Gg: AYBFou3BMDk4ebpaZfO+woH17drq2BL1z7a/rR1Yb9ey1HHfjj70fgVK3RU4F2VcAJS
	FikQN3Icyvuw8799f2pOxoRGU1lJGyAY7haxJSvErRYncKWkjRtLjkth52liQ+4pomQANAgG7ad
	4d08uDVFSEkTEF7KWXeouNWeKGqq3nFFpcX4ivS8+v1rlGNWEGMwAb7hvTOZ2/VNEYNJyQ9MunM
	k9nSEGoLiGklCa+U5mE3k4rXzjesaOXnsfpfb49qENTIhgugz4lDb0EUnDcNioXDOLsf/euf1OD
	4dW452AzFCroOL6550bpZqqv3euVvEVyv8j0m6pKqo7iVeYNwKXyHkKvCzkN1OtaPWvvA85tA0x
	0J2iNg27jrfADjUZD7GIAWeGvNj72Ld/eQ89GUhRu6mloZTSqjz+sCX7/xxllielsfv+leFh0YE
	y6jT2GY4NX2iyWCy2KNJtZPTgGPXFlpiOE8w+9Twpf++DLlghXtcAKt5yI7OwvLqdjVkvtRhZhz
	v6WAKPuriW5vc8HuvvQOgwtQUscl1V9GTEiDtIngXiwlX47XGIxSSSFXtmXbjNgwS7oVPgcM9Xn
	45hEMrKdIQwP2o30NZ7sPnH9qUuTXN/DxFd8RsIHo5n5yOelhfdGLAE9C7hIbzg8w5w9Tc44VZG
	Ow/0op9SqsUK5m7TdadQUHE4+w84=
X-Received: by 2002:a5d:6f0a:0:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-492760da71cmr5896957f8f.34.1793973288307;
        Fri, 06 Nov 2026 05:54:48 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:6118:66fe:a6e9:e648])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm3393124f8f.0.2026.11.06.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:54:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Fri,  6 Nov 2026 14:54:46 +0100
Message-ID: <20261106135446.1334980-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
References: <20261103110524.2812831-2-romain.tisserand@gmail.com> <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 01:58:02PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 12:05:21PM +0100, Romain TISSERAND wrote:
> > PocketGo is the brand of handheld game consoles such as the PocketGo S30
>
> Vendor prefixes are for companies and I cannot find anything about
> PocketGo, except it is a brand. What's the website?

You are right, PocketGo is not a company, it is a product line. The
S30 is made by Bittboy, which is Miyoo, see e.g.:

https://www.retroshelf.org/devices/bittboy-miyoo-wolsen-pocket-go-s30

I will drop this patch in v2 and use the existing "miyoo" prefix
instead ("miyoo,pocketgo-s30").

Thanks,
Romain
