Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267945;
	b=VUsIljg+B9rKmG0ivsDyIvKfFn93Yyf5uFvVQC6a2pAkfsoEdwAfh9+ulfryKlejcWD2
	 XxsQWKtafBoc7640gg8PFDGxJLv7SUx1Ak5oex0m5OGF9mYMt5TA7S1/BEEsb+TCrEJi6
	 p+w9z70KgASQb7dCwt9+BUOExm8GyFGoRHtvmDBNeSXea0Ky+228j4gM9FbyVXKlNMGeT
	 LRkTZAkfQsrOf5WoNCYURwllEZ8pDZqAFOM0OAbFjV7vXwjfozXMM9sMgyxO9j/hUUO4Y
	 re9Ri6Negpn1QoqYOHq0X/ATJqEOg/Wj1ReNznYU4k9iMQ4u4bKNr9nsSdCGB7ADjGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267945;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=X9fMC0zqN3ETxlJdsyr5ayEq0uPBqTA5dIHIwwyBzMg=;
	b=Xi0SxauxXGuLZKTsquQG8jcm1fXuBYOU/utQJfYrFpPdy9EndI8Sw/tar2cCb1uP8dM1
	 h0gsPHUYmkzfRdCQ7KtnaGYySnGdPoWoE43iIsSJsjtUOv/Esk1UU2IQp4PH1D5PIGS0q
	 6BMvWMW5h6VvjXnnRWdN7LkV3pNK2Pe2YL0BXjlf1CTNlN+o1Uu8+W2FzPcneEqh0g6yJ
	 QMkJ9mOaFSmKdKb1cXHwlbKrgaRSHz/dLQC2T1njewcCGLrB92+l+U2eC2GR3STqFeVS6
	 C8yv0yaC0BIHuV1MW5C8CBhdtMFw7vuklTL3ulQo/WW/zWmql5C53UMFf1mKxXb7Mrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093E606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D093E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso961138a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267944; x=1794872744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X9fMC0zqN3ETxlJdsyr5ayEq0uPBqTA5dIHIwwyBzMg=;
        b=1AjIo2WK32/bY3XYzNjhsOMBp9a9o9ootULt19NlAqSsEpxDcK1/gWeDmdQSh6XsAA
         kwgcJ1PjIqB4YtomZyxdEv8bA7zFKIVF/4Zd5V+KhnkkxOFAPoIN5V/Bf3wWWRsAaNdG
         pMnQwThBkjPyo0tJeiRNMIQfm4y9S9XZg1/TLMDzlzSTfbXsEL3K631NVuoSEk+GjVym
         AgpcU8iG+HrV4RsNvs/zrvvaMLnSeUJI4LiRMb/jhmamfZM8SwEt1D473FWFVWC1sd3y
         JZLBJqI1I3Y/Pp80h6YqmAsIbQ5qe6/Jp3VDY/405OhHD58ln7VIz+F2xQRUc1brVoYs
         MRiw==
X-Forwarded-Encrypted: i=1; AL+hErG+D/iz/rfqrzvLBb8+Jhr9wPbETb881zZ2Sdk+WW4i/ptH25xC7/xKZtgVItWvvYlt5xkXUIpyoVji@vger.kernel.org
X-Gm-Message-State: APuU4Z8k+wQWsvpJgGmKCFj5j/UF4+FfV2potfxjgAe0PULGMeddHwG4
	6B8NLsdU7uKkSgTPWx5j7bkVd+SXXmJLdcQI1nBPp4tx4aRRmvE+FB01jaIWE3wt
X-Gm-Gg: AYBFou2nUU6UwWdDDddPF/oZVp30khFl+pCm1cBMIzrUGbsK+9NGMiDN5+yGni/dZG3
	Q0/mQByah0jTTJwmCw6CswNeQhR26RWlODMyZ4YwwgOPGQE+F1Qtx76d/6pZyj72kvxSZV0ntEc
	fOv5UMau3nS47zQHxWgZsAiXiM2mb9u2GISO9INTm/zxXvf1pxC6cXv2sLMSsizFy8e5sbBm5F0
	IPhRtLO4tgK+G2prCAjoDgc6jQx3kklzNphRDRTeYn47G8v8jNLYJVPw9lNqR1lqMAD6J1gxhmt
	0sE3kmEFEN8B2bYGFxZfOa3UdAvyZIOGNIb5i9pBg1p81wR7Qjm88VNUrLF0GAI8AwAyRcM3ixE
	ujTcX47z4DvspzSDYwatcBMDuSBFdVznTp3ozGdJ34k9ZiDFm6+8lUDQJsIxDpDTOfETsiOWokN
	XZwwv5Wnecp7UVHZkFFYq1kl+2TODpqxrM6xAO9bRuQEw34rd6eVwkv3pTe13MdV2+liwsnLvDM
	xU5iorC/I90/EFDqIjtAkoZUmrIQXuey2OwVT2GQ6dRQNi7XbrvEwHf5ArD41Uv9/Xv/cbS+KE4
	tBCGhDbmbh0h6ugOgyU7t59rIhiePXzdpavvM8tgTl1eUiEnBmY/o2hRC/JYpvAA1Fr8euw62Dk
	1sMC4Y5CMx+UmWH25vQkJReXIwhFsUPMpKqCEx39Yy3g=
X-Received: by 2002:a17:90b:54c3:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b166ae44eamr1282165a91.9.1794267944213;
        Mon, 09 Nov 2026 15:45:44 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm1353102a91.12.2026.11.09.15.45.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 15:45:42 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so3079611eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:45:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFaeq8kTNkLOXNR0td5PqQP0uBPBq8t0ryLlQruDcKI+xcOJlnkLKCl/b5vwJeYh6VtFqpiVsGFmR6C@vger.kernel.org
X-Received: by 2002:a05:7301:6790:b0:36a:1904:60a3 with SMTP id
 5a478bee46e88-3751ef79800mr1511776eec.15.1794267942134; Mon, 09 Nov 2026
 15:45:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-mxl-gsw1xx-reset-v2-2-46c1da093893@telaak.dev> <179426744353.994134.16211561618771955131@kernel.org>
In-Reply-To: <179426744353.994134.16211561618771955131@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 9 Nov 2026 18:45:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5oMoZoJ9ivcOBe97MmT5t0wa4aj1dc8BS_YXOsbPO0bA@mail.gmail.com>
X-Gm-Features: AclHuK-cQP4T-VAWBA1r5t7qJjfPj8sdhzoAjpgY1zmdvVatkQxJQLIbryTxlWU
Message-ID: <CAPY4CJ5oMoZoJ9ivcOBe97MmT5t0wa4aj1dc8BS_YXOsbPO0bA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: netdev-bot+sashiko@kernel.org
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If CONFIG_RESET_GPIO is disabled, does this lookup silently return NULL even
> when the switch node has reset-gpios?

Yes, as for every driver that gets its reset-gpios through the
reset-gpio fallback. A platform that uses reset-gpios enables
RESET_GPIO.

> Would a gpiod based lookup, or a gpiod fallback, make the documented
> property work whatever the reset framework config is?

v1 did that; Daniel asked for reset-gpio instead, so v2 uses the reset
controller API.

> Does this full chip reset conflict with the slew rate binding?

It does: a board that adds reset-gpios gets the power-on defaults for
the slew rates it does not set. v3 will say so in the binding.

> Does each deferred probe then repeat the full 250 ms + 1 s blocking pulse?

Yes. The switch is not registered at that point, so the cost is the
delay, and only when the conduit defers.

pw-bot: cr
