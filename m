Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E246A5F4
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052668; cv=none; b=kapLxTFuC0RXEKnyJhTodh7ifIq7M/zygMW1V/Gi7TO5FTlSNTeGIkgUERE82KYNzBFevlV3LzCk3GN4jN8dHVFeOD0D3djdn4Fz3ZqGI8Sc+zMcUFAmg6S4hQfBst+1dYrsSjmF4VYPNhIbGr288F5E7mzPC4CyjvfJIrpa1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052668; c=relaxed/simple;
	bh=34Tk8hFf2kmRMBjY2LDB8H6WrFBwxCMdp8HtQJlrF24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw5pqPB/Ic5adhGvrh/j0SGCICj0tjtVrejx40z0hUJp9jMsZHYc06KDcmvp8nu+IPHbz4TMaEZL8BU1dWOPQ7jqbPzr5kAcGEZJMlxg+m0xwdJYtU+Wyn8vBM2FFW99gFDsLXu3Pg2r9aIdwrd36BKrjV4BkMusYKw8kHi7Y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BFG6MyN0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BFG6MyN0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2979186f8f.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787052664; x=1787657464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=BFG6MyN0Muz0meok6YmouVSAlvzC67kX/ZV00aJNBXUKLcK9yD4amtBelxvPxyZKiY
         fITYL+iGPBG5vuRWglVAGUT9miBkALEsA/nEPPOfxWSbWjpaKM12hAQFvROvqrB75o/9
         APLrF579V0PspvENvn6IjUxXKZ1L7/4azd24KGviT6WtjidCUshk48XBfahq2PW6bmIW
         T6og23XktrZoyTPjWT0k354AFmDi6kOMdlO8QJu5Oolm3xdKbku7UdARVEPcpPDbQM0F
         VSb4qbBK7D80AEC7mvgAevm7WLeLFnIh9Raqs6m9ahOD3vqYX50NH9Ab2doZY79lhqrf
         FVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052664; x=1787657464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzUhoMzeL3A3db0AUGhPTEVPs2wp/05yY0aTmKXk1EA=;
        b=i7tDOi/UuMfAfMMYTITNc2aHB6QMLNQubMtJI4Yj2ZB6IJ0ProMNrS5NCDJUw/D5ym
         mfM1aJNkL9zkfB7nS7hCea0wbX7xU06+VyqWBZnY2lw8po3Q/cXxGeCZUnvARV1Ic6or
         w1QeX5wQPejAQdbXceIdKa9cbI68fMwW3HtyStWYOF9VUYvWhbk0pI/oQiGA8XHCMwOl
         eNh5WWdqFWWb1zhtJOyWmL4Gsbpc22TWDi6t/rbqlPyl29/PgQFLsAuSQ9RyIxYiKbDi
         lWw8tNeHNpJqFBUatOENYW9z/X8bv4Gch+revpZ2pvMwz6z/rbW5oS6rN71kjjMcIZIg
         xuAw==
X-Forwarded-Encrypted: i=1; AHgh+RqWz+pS9+RWFNT+6ohFwcZcQCofs1UJm2UrEzvGA9W1Wm21MaNRkPG9M7Y9P+xSSjrRBaAH57L/5QIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01wzfhtL90VeHc4xitsgK/WcWfCQ+vL976tU1RHYoXYsEq043
	L7oW2M+XgjRY+WCKOmDAaBjN6Ip70Sm3VRIkYzUcI7G3m4o5YaXOiE5hU+Ruurz4gXY=
X-Gm-Gg: AR+sD11waXnQDEDQVsK9YzQPy3YNjXgiHg2hVuwrifk6Op37/CWuxKEOleP0VViPxmq
	QatBG80ICpyhnc2X0qZwpnidINNxhrOp+JnznH5uQstOQ0B/eU2VERkm43oMXz+LNI9Ux1IHmIj
	k0NWdMuhsHkI79cKt3mOE0KwSEj/2UzcbJ4W71Su4EaAp34iU/vg4CR9mDXeut7b0YXiuU9kPeE
	Ws9GTW/59GpJ2ioRzp+qKT2BvjKHA2K91vNNJbRpmUOnf20uocXci/dNWDAHdp2zFDfTxknTaBq
	a9k4TGcjMwwICyv32708jAM29JfrqjnGxqeOERIdnXhB71ZkHi+VCa7GsPwaD8SSq5S27nNfqIP
	Ef4qzONHgf4xbBZK2M94ozkPPt/JbZ3WchzjyJieQFNlK3c+NX054BxXe0AFBOByeyZSTJyXFVD
	hRQdmx4+MdY5SLTiD2jL2Gda4G+WFiZqqek4513pWlzm2ZXaUkxWnwqd0+4aAIAGbtYwi6rFeIY
	h+Rjux5zhfnWI4I763XQY5liCBpFWoAMyhZbTAwQkhL
X-Received: by 2002:a05:6000:41eb:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-4816079ece5mr60246879f8f.23.1787052663977;
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6400:1700:1386:b860:6632:a42b? ([2a02:2f04:6400:1700:1386:b860:6632:a42b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77f41sm10674828f8f.27.2026.08.18.04.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:31:03 -0700 (PDT)
Message-ID: <f29963f3-54af-4eca-9122-fe757c00a90c@tuxon.dev>
Date: Tue, 18 Aug 2026 14:30:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
 <7533fcaa-c676-48f4-924e-bba9195d4871@tuxon.dev>
 <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260817-tricky-monkey-of-admiration-3caebf-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Marc,

On 8/17/26 19:59, Marc Kleine-Budde wrote:
> On 10.08.2026 16:00:16, Claudiu Beznea wrote:
>> Gentle ping on this series.
> 
> Who takes the DT changes?

Apologies, I missed to previously mention the merge strategy:
- patch 1 should go though Renesas tree (taken by Geert)
- patches 2-6 should go though the CAN tree
- patches 7-8 should go though Renesas tree (taken by Geert) as Wolfram already
   mentioned

Thank you,
Claudiu

