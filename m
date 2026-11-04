Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781497;
	b=UZh5KfEaa0HxIF64toPEwdbbNa4E6Unm1d6zagVz2wuIjvl70rC1y8HGlInZIhmYbgU3
	 iBhfNSC1jai+5sl9yzxDJhK+KNiNDjqd36rm9IuNDDdklK5RSSr8TIhaSgHYtrUssoZnx
	 7xnIfHHm8M/Ow4ek39Vq1FiQkE1MSthhD7lskLhJeL37pmsKPTp/ij3x4Mx4JPGRh6fUt
	 Fl8FLGImxUn4c4+MktX8auN3YfXlOq4fhvGf46TCzcs39+h77hzVwFc4NBu4cUUOKZu+g
	 ZuDDHiGIth8kCZ1rgUhwV8z9q28EiGQar3Czxf94c91nLmUZTyLZcKDCQj+np28smew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781497;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
	b=VrChStOufkQxplj2TWi0JNseU0OdLXeH8fvlV/rih6wL63O/d6YmbQfaGateRAs6Wuqs
	 CDzPBPygs40ag6p3/lLc3KmMkWLd8/JWSXQJCbN9mqcvlBB/Pkt+BIAgWYrtky5NPbw2i
	 2ILE8Grq5mYODhiZZwlpWMxGvdFTQ1Kp/Zl6WdHyTXHl/yNwkqzov4ESqomwWXg+kAz73
	 w85n3ll/BWvScUD4s++CY1xuHBS1KJOQbht4TEGnQweEkLnMofeLJU1wyTyA+42Xlh2wv
	 8ab9XXzWLWOS328pXh0p0xoNgBrTsvItgDaX9OpC4qa3+VvL6QjCEROnqUJmxz7WqoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E82C606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E82C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso267657a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781497; x=1794386297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
        b=Ifpb6j/tHnHOoKYY+wNxrlVAsaOuP7sdOxMQKJ5o6hLBTD77eAY2RLVdV6DcEEvv9p
         P+NwtphYdT9/spdkIFtjWNnBXvHz+wkYiAbeyAP/UAMj1jvmsxaSvfTfrFKSaLQ7iqXg
         DbyrN1Dp3wMjGAYFJ1c3fZtEVoR+IQQfhUqaGcd4kyWHcwQ5QlWHCvcK/ScMUzrXz/1g
         Z3bF2iHc7qfpS8/7eG+cflndSmfeNOhqgYkaSxLBRKeR2+SZVuIxlJmy/uLESnmlnrxX
         uQEoKjHCtGlXfLPeE4NanL5+uCLT0wOV/jvoIjLSD5XQwe5t/hHzX1C5k+zg5y0MsC69
         cafQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuVdo87+/OnBASk9PFhbJgoYQ970b+Jpi68VWJk0+Zb33Kf7ZiiNYV5zpkhdSS4ukrKH1zgLByofuv@vger.kernel.org
X-Gm-Message-State: APuU4Z9G39f2ARnRMAwH5zPN5Xu7OdMYsyRpoeSpTCD7CJ+JfCpZq9Mw
	6roRxL/1wthZyR+/D5hbtJHaefk2Kzbz5btSf1iLEAmJIYJgd0XHpS4LJJcEsQ/s
X-Gm-Gg: AYBFou2K+/D1QCBPC9KcNAHGWkMG4xK1gL13pasdHj0gLkfmTUjjLbxLGWiq0l0JrTM
	/TW10HtW35ANXkPnKxTK2jmHSgHDlabO3Gfi4lUKHpRd4OzCxLbm9iLQiy6onDyTuesqkEcVktz
	6iH2zNMuyVVDflBmK9Bq7uluxqK2FN0GBdYs5YLoc0oD807nCgn4AUMJaL6qzD+ZsWEW5v4JBpb
	kwKVqC8eVkpweOMiVVRzzSTNoYJVBgRBw8nnuX+YqBxXPoxUtNaR3IpLcBtCMujf5DeMukEmlNX
	Ij3ZgZk9fXc/o1Kh5qmDQkd6EtoQ82AmgfZGV83Qx+wre8rV8gKcveuoMKiwznT4HvxeV4zeMTJ
	OTWiFVj2rRv6KhEaNcB3QhXQPabfZxN7WFa11Fq4IO3QGyzJs3bAyfbvx9hHRUNi2LQOv5Jhgyw
	iX9qNFR8Zv6Jr8R4c3PLdzuKeU1EwfacWrToECUrmNKAQHTKRqEqc42aoE+exJTBB406JmcgPN+
	XohQv19ILnLKneAKwe5pbiSCUk15tOfx0JwChcYfMvIwTnLegZvQ+Q5TcHTUKpGDaPkzrC7dXle
	199i+7E17SDqCUFWVuAMXFy59mo7W+ZM1tFejKETs08CAePGT4VOSjdYYTTcu0JlDAIuRbusMne
	E11Pr4Wa23GMfYJJyy+ezUqXBrnHWxLba8tKmaVeUnq0=
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr13980660a91.67.1793781496787;
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0945104dasm3192612a91.17.2026.11.04.00.38.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d6765756fso17469eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzrkK12rInUKNr7onSh9JRirmX+z0SB98bHWw/aMQrrfQkZ6Ku1uLwiI6cYpQ8hc2HfHhZbLKXfOfBg@vger.kernel.org
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id
 5a478bee46e88-36a423c6223mr23977690eec.14.1793781495997; Wed, 04 Nov 2026
 00:38:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
In-Reply-To: <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:38:04 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
X-Gm-Features: AclHuK9iITvqHHty7IqgPcA0y5Bp8oR0AxaQXRkiXUsTXH1SHKpldLZV4qph5bo
Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Same comment as for the DT binding patch.

Will do.

> More common pattern is to retrieve the address of priv with
> gpiochip_get_data(). You already pass that address to
> devm_gpiochip_add_data().

Thanks for the review. v2 will use gpiochip_get_data(), drop both else
branches and add the blank line after the header comment.
