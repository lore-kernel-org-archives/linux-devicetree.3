Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456835;
	b=Q5YYZ4koO4F/+x1KtB2KkUgFaXSTdL/PDirRw7ND9evS3nZfMbIVno/ToLnHooYjmGjI
	 ihir4UQjk1m1dv8mabrmvIYYElN1sgXk7Yuy722JMTvjk5cAZOrKfZXWVV4F8WEdfKoNd
	 CWQO0v7f+e24tJRA8B2FOZP5NagVWcJjkpONmXwkL7PfbaertP3p0JJj5yBV9rRnGUB5d
	 x1Tw6yUoQnbvZmr+1K0uNZpPaOu1aSYTV433HgFXmQ7ASOgVu1NBOhlccWcauWPuF1wRe
	 RAMR/i4XIFuq90HdoEuj6I3o/Iw5Lmqrd5pLn6m7qgufy4g4erst83J6dFpb8iA3MUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
	b=ZmRjMZyyPfjRy2vD4jYqpZmqn3vlFg8Hqfp33842XYSjI7rbJNfcIEy1y/PY9Woojls9
	 XyfNLyEO4cbzyiRE+j6iSU9GbqGUYoIHXl29CkBjXZtApaMjvKt9NJPzaTscvEaWE/13D
	 X4XBkQu4Ztp0WFjwdOgdhN4Oin8uAU3bbS5Tf7EHBBk5I6e7WJgbj7JJi4yW4LzeB/dGJ
	 U7PTKrb/9V+MuY7Jcleg5IKebkC7xoyLJELHjJqk28us8BDuTUX1V4I01B83otCVN4mxc
	 aiSPZ9rASHDRK8CSJax+IlSNfKt0b9Kz6RohD9KEf8INPLym2DnPe2uRlox+5Yp1lAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gpznAi3u;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50F606A327
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A50F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gpznAi3u
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e831e86ebfso12588365ad.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 17:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456835; x=1793061635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
        b=gpznAi3uGEOKnGWouZFQYOBEKOrEFwHdWUhFGPUzyTOoxMBeIkh4nyCicymokkb+Sm
         aOq/RMO4WOuWYELo+CiMnj/+TbIwxNTO5B9+Hunf7JXl5in9PfrohInzRRLhOfqZIoIa
         2UyEBa4Q546/a2XBjO3F0dFp/1menTnVYDUIbmdOj3BoEuio0pc330Wwtz6W1pazC3Ac
         YPwhb5mIwWJlm4CPpdnm7zHzVUq+WdjHHvmSh/P7FsFm0l4z4Gk5LZfsp3ZYfqWNq78O
         95XyxciZJCdiSs3AhnGfSi2IywVjuqtDeatMc04TUoUU9TuPmZkUfQ5gLFGAsvotLSDU
         Ii+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456835; x=1793061635;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
        b=MAzB93fG+WA6g466ZcWtFtnBgNUik/imJF4GIE4/7PBmYQItsUW675ufDJZLkr9pfN
         YY7Eg/+pZSB9Ckp4jSmSnjp+rYekh/rNKC15mez9OShsG21GA4Gvh16xPr9yfMj8xWXb
         MzaLir5A2uOQymstUVGWuydLy0mduzGu/sYkAco0o8fX9ZCVt9rMgD55Vu4VHKdr91zD
         kcZH0Eaxd3fXc3JOp1RqJ8+SCgJnxmf2D6+hHDnfdHC/tsGw+n1pZAg2yGUsGP2fSKLd
         uYoiPCUTWxexkmzjzPOLL8Ax/5RitAjzzqkNBAvRjXMXycUgUam1d2tN1NwTJi15JhDA
         JUXg==
X-Forwarded-Encrypted: i=1; AKwUvByIQDt0bVm8SJpVNOhsF18SaL+7MxPlS1rorMDYGyoxEXYOTq8zjATreUlTRtl6LHpYsUBtXhwtif2M@vger.kernel.org
X-Gm-Message-State: AFq9FYI5RLMzvAVXZF/17hRowF5Qq/1gjSPe/dGsJaA91r9el/T2wffg
	HfR/SClk/CtUW8ZyhQDYzji3uDlyamUTm4hm3naTLWXRn376taso7LQ6
X-Gm-Gg: AYBFou3KFefPlkxIPMDC1bWSN8XBw60GqtUw50qObTP7nU0Xd9iGFKBtK1Dz/Eke9FQ
	dpp7lTRiCnIDiTN/HPwWhLO2Vib3CulrjjwJjlMe5y3zd3a93xjx+3S4cjpWJtca0nkFYIXiaCX
	WI5s/ytR83V1CmY80FIa+QUyy+g4xUEyiy/s6jM4Lg5fOO3dOylHkNX3jvR0MqujdFwhLh6bmwu
	gpIWkmsGUNihdtJ/yzUMOtHo8MhKU8UwwJutp3C5/KD/5ziI6/FT7PB2EcLQRX8G68ez74muSB8
	eDz4B28Q4WgNs3/pg5wUp3KlXa0+ByqKQNhC9AJIMiMk0nb78bWR/6N7U2hCYHWdT6oqf5+T4yo
	JbIdieykrcsf4XSH5t02B5Bb97mTUwrOlnklvHiL8wBHsQnJ/gf8r1ZC041kIn13dCKBxlT4WY+
	Lp982mMhNB22vQJJOEbcmyjNiJV6vgDop9igUt6UqQUiNzsUvXq8g9Wvnr5v2RTc8Vzfic9XusL
	mGZ8xRT5d85R72mZ9gHokAVb4kvxPiSEqbBZbPENV2OkXSz
X-Received: by 2002:a17:90b:4c92:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3acef134becmr8381372a91.12.1792456834493;
        Mon, 19 Oct 2026 17:40:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1769191a91.11.2026.10.19.17.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:40:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d23a754b-81a6-484a-a1f1-2f0548e28b68@roeck-us.net>
Date: Mon, 19 Oct 2026 17:40:31 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] hwmon: pmbus: 0-based thermal sensor index,
 mps,mpq8785 #thermal-sensor-cells
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
 Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <atCS6zOqNzo30q3J@L18297.iliad.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <atCS6zOqNzo30q3J@L18297.iliad.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 01:46, Vincent Jardin wrote:
> Hi Guenter,
> 
> This one is a gentle ping on this series:
>    https://lore.kernel.org/all/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr/
>    https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr/
>    https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr/
> 
> Patch 1 is the pmbus_core fix you asked for (0-based thermal sensor
> index, with your comment), and the patch 2 has the Conor's Acked-by.
> Could you take them into hwmon-next for v7.4?
> 
Sorry, I was out for several weeks, and just came back a couple
of days ago. Unfortunately this (and many other patches) is going
to miss the commit window.

Guenter

