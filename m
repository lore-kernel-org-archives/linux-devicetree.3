Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46972E739E
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718375; cv=none; b=F1EN+4F1gLbJwP+7Gqs2LdwHBx3Oj2loJFMNtoMw25a+hMPF2TtZQR61LBf06eItVCGC9sGx9n6Em8tkp9msW48BBa9/LdQ1AI9AU4kT67BIYYJqX17vx3QPZIp3PNfXDdZ4DSdhaiF6sn4QyZMSwwsLlRRtNUgI9z5MP+eOR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718375; c=relaxed/simple;
	bh=xzZ8jy/eB3bOQ+CcYNMdRNrUdThdyWrUwV1urwTAXe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnUPbFBcj20wl0IgNC1lt1DS+FwimjDVRgRNcMSzJGm0CfqE1icYDpBvVs0yFdpktBV3oak6PrwV4SqP7SV7M7ziCN39lQreggWH8xYT6ME/ITBknpCN9zWeju0HEDNGAqVuGSZE5cpIVNrDSY2I+6vkgmo2k/ENyPf8rKjHwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=hQgy00tv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="hQgy00tv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10356715e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786718370; x=1787323170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWSFL1IqtGsSxd9as+S5YrQgQ2uQorKxfncBRjktmv8=;
        b=hQgy00tvRZS9PgjlkmT2FBYZeq8fNyNDVWKK0y1BjwzTIk91wJF2PcQgUefyYkkXdS
         yNYl3GubsEYrYmoZZ6yWFoprI3byvCp7hUt8ASpOaKQ6C2gRx8WSJY2aFTiBc3UCu1ZJ
         ROkK7lusvWv/07uJY0aXFnVJWCgj6WcsFr+Y4R4DCupi/1xQJynMys0RXOVCDdDEgNxO
         MbVC4n0+CmEZS5FImIrByvpR/2bNOayQrNTOOfJM/fFfaranFaqJ5TPuXmIna5JyDCnx
         ljVDOG/dl9vicmGmEstJ5+ebONS5ujwuMtCkJhI/9TBhXNP1LoxyXjpbv+SYNY9wVFOt
         enTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718370; x=1787323170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWSFL1IqtGsSxd9as+S5YrQgQ2uQorKxfncBRjktmv8=;
        b=S5lmtwwBvT+xOFKeenna+Fvb/apk8NeLEqPn3GZ7uUKOT2Ubr/HJlzmYZckAqFoKXs
         QiWaPy3pP+KKKYOO6qRzCS1MIHFom0pHfNNtdiO6QJ8DlrQ4vkUJgHXtbikVNFJjjqlV
         VI5D3JfO9ByBfiTboHOGIfE5q6kZgJi9YX0U4MkUkCdyqkOKKx4IZben/q7+qMGEyhiI
         wSCyUuxVbFkYoymK2obNq73egoumvL3xdYYkMWScykyHYAaVt6GGOicoOBtu3ST5fDEN
         Bsm9AUcIdyVsytpWZm/XDX9z8YpzT8bBN9uAkfkvqIUSSFIX+Y+DzGNQgyCsmpnK0wDt
         hJzA==
X-Gm-Message-State: AOJu0YyXpTnQiMJ1lUyMf0mDaBH3/QAMqTFq5W6PFJ1WWxkDxQtqkvs0
	oIue3kJ3pFg/WHWDlvVxP48H2s8ljJQFDrESLxfL0KA268t+jtZsuqpmMX8tS11WJw0=
X-Gm-Gg: AR+sD139dquXxMh27jnuTJ/2vL+QSNOAHJSnOHYE2He1vX8w7AlJZMKo9IHsjkgeXMu
	URQjvDr08EaPEjbLNNUIc7UQqzSkKBRQPn4DJdFjoHofpBqTLwMOW46f7BtLPhpQATP1c2FfK08
	pqOTm6BPoLJv89PD0Dj6GZbMrKG8BX0kVAdhGF/EOpWErWehEKBA6aNSHHTem0xzPWEmOUB7glw
	EkzuSrsURhJHUWWNEIr4nDTMupf7n1G7oMo6GDJa+1iIHyL1/ahS7Eg66JLhmr6E+ypG1Gomltg
	HZBLxxLEO211C/tKSRbmRx9Ry0pGMgKV72pSHcAgwwwzPz5c6Grgg0/U30Jcy1+VOwHF3JeNa+C
	lzKWLZ/srS/eEPvwYmxzJzlxmmVDqOXSenpntVQwTP5zvXdLcFUV1HmLLL3qxfL+FPw3gHqIiYD
	nMwNLQJccBQ8heJ5HU+TQ90kYa7k4t2mMsEfLfg5WVPWvAOfgLgvYtL8WV+09yte6npckQUk2ve
	xv6DZJ9K17V7+ZetoWL52CZPxKZY3sU7e1MH7HC5tZH17KwTfQ53hS/heCnGwSgmhpGT8b43nwh
	VhoHKJGQIsMaQCUqqsZ+/VNe9fMh
X-Received: by 2002:a05:600c:5397:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499879857d0mr93390555e9.13.1786718369651;
        Fri, 14 Aug 2026 07:39:29 -0700 (PDT)
Received: from ?IPV6:2003:e6:6714:e500:bfe4:7b00:fa11:e276? (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899bff2csm31594145e9.7.2026.08.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:39:29 -0700 (PDT)
Message-ID: <b88b5e1c-e85f-4fa1-80ac-1ab66592a86c@9elements.com>
Date: Fri, 14 Aug 2026 16:39:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] ARM: dts: aspeed: anacapa: fix dt-check-style
 strict violations
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 colin.huang2@amd.com
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
 <20260813-anacapa-devlop-phase-devicetree-v5-13-c7058f63dc67@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-13-c7058f63dc67@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 1:59 PM, Colin Huang via B4 Relay wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Run scripts/dtc/dt-check-style --mode strict against the Facebook
> Anacapa board device trees and fix the reported violations:
> 
>   - aspeed-bmc-facebook-anacapa.dts: drop a duplicate trailing blank
>     line at end of file.
>   - aspeed-bmc-facebook-anacapa-dvt.dts,
>     aspeed-bmc-facebook-anacapa-evt2.dts,
>     aspeed-bmc-facebook-anacapa-evt1.dts:
>     - reorder compatible/model so compatible comes first
>     - add required blank lines before child nodes and before the
>       status property
>     - sort properties into the tool's canonical bucket order (e.g.
>       bus-frequency before gpio-line-names before ngpios before
>       status in the &sgpiom0 override, m25p,fast-read/label ordering
>       in flash@0, #gpio-cells/gpio-controller/gpio-line-names
>       ordering in gpio@24 and gpio@38)
>     - align multi-line property continuations (io-channels,
>       pinctrl-0) under the opening '<' column
>     - fix child-name-order and child-address-order violations
>       (framebuffer before video in reserved-memory, gpio@24 before
>       power-monitor@N, regulator-p3v3-bmc-aux before reserved-memory)
>     - remove redundant node labels that were never &-referenced
>       anywhere in the tree (i2c8mux0ch0, i2c8mux0ch1, i2c13mux0ch7,
>       spi_gpio); these labels only existed for node-merge overrides
>       via #include and are not needed since nodes merge by name and
>       unit address
> 
> One unused-labels warning remains in evt1.dts for the p3v3_bmc_aux
> label: it is genuinely referenced via "&p3v3_bmc_aux" in
> aspeed-bmc-facebook-anacapa-evt2.dts, which #include's evt1.dts.
> dt-check-style only tracks same-file references for non-.dtsi
> files, so this is a known false positive of the per-file checker
> given this board family's #include-based override architecture,
> and is not fixed here to avoid breaking the regulator reference.
> 
> All four files pass "dt-check-style --mode strict" except for that
> documented false positive.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Hi Colin,

I might be wrong here, but the commit message feels written by an LLM.

If you have used AI assistance for your series (or only for this patch) 
then please note that, even if you have only used it for the commit 
message, you must declare it via the "Assisted-by" trailer [0][1].

Tan

[0] 
https://docs.kernel.org/process/submitting-patches.html#using-assisted-by
[1] https://docs.kernel.org/process/coding-assistants.html
