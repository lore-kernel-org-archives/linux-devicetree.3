Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564548;
	b=4YBDpjBm22sR20k1bpCzmN1RKo7svlliCEpTndEm4rar1FkFMKnObiIG05lhoHFMQulm
	 GjuaVjiiIqM19BC/bN0pfq27UZ0jRnpcQFvhiKCKi4wkqaqI1muZGorkBG0F1WZDpPVkg
	 mq/e+/erS0HBgzXJJEUIvpBlyRkcSVJCdFwUdVIUrOYWzkHvJAjhGL2yMALOHCgpZhRp5
	 YqBKnH0mH9KtTRsYqUzJCnuQzqcYONSA/UDm/LW6MRKyFRB4UMVhzNqwscBfhp/UNWR5P
	 yaNOMQwSDG0A56ciqJcHz2osKcOSiJ1Llsxq/mvv20KiPMibfcVlc2kigGDZLw+OKTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
	b=d61u0XuN419Ogr1T8iqRnb8vTWd2A/siK8daqLmZhjAZ+/EyJJ4V0diQ526KsGYZfBHh
	 JzEGhzlT+sHyZpgD1a05pWnVMtqk7SGLk2a1TvtQTIX7BZsjZ8fCvVh2vzpUGkc/cCnWU
	 /2RRUao8Ak+jHaORP26ItllP9rN3gPDJt7LAuI+Puc/hzW7rE5AuvVYVDSE4x+I75mb3W
	 3J48PvDap+OBAu+xrychBFGGd164SpwFXeR5700YiWlrb/EZV9Kog5iv42EMTIaBcx4wv
	 XyEu6JhHzfqgDiRxcc78wx8FwE6I6A1RJNfwlmkEAX1ZtilxP6wMsVEDq+RjAA1wBFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FgY7gSIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEF3606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FgY7gSIV
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so307244a12.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564547; cv=none;
        d=google.com; s=arc-20260327;
        b=gCk0wAhcvk8NYkeSZZykPGYYWGPPl2JDx7Dt7CXxlkvX0at3sBGOF9wEqE6uMwU/Mj
         t+lmgbMZeMgUazh+gYPlA49uuKLKa66wpefRupImj1xt8U7MCDWzphIUDlFSpnRH22AC
         MT+eXoE4UWYogtx2sfRZDlSW0I47VkF3WU5AmfPFAFfLOaqeYeNKafPE/Zt0x53S75iy
         HaGSwyyqc/cOoFaWjcyeeoIyVBOluVfjabQM9/ggB+kVvQ5PbUykP+64gToGvZXLs/NJ
         r7LCmdijKm4LDX0fpwhYQ2mLiQJCONfJwo9E06S3tUm8eeMENrYGnHdNOh1fDybEFmFY
         veaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=Ug+XF5+PrPOUikiG4njC4iDPSUwEG/A6zPieiRF1SUM=;
        b=TuMR4WJD5FiIOzstlGlJ7KhHgt3rRqvRBzNCkgWsHhmXbP3NRd8koF37N60yEhvwpt
         W9UlLyTCm5Z5KE7+L6tlT0u/xANWkwYCJ+BD31pUQ3jFChTD4bHr85+pMxW7kmahI3VH
         HUfns3onxVVAXDuTUGQXoQpymq5B47Fpc0PaTwYuOFjTXDf0VIO/0yANC9KyKkYJwkU8
         Yy2pNoje3qrHPUe3IHLjQICBF/zyAeh5xU0GeWqjT9BcLc7i7/uzp2teEQdaDq9f+6vm
         dH4CiUulrtvqVWKIhRfym49j9EzL4UBWNmiXjF0eSYyf+o1J/kvvy/OPN7nOphU7iAoS
         MrAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564547; x=1793169347; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=FgY7gSIVOV2uA7vw9EZsEGG3BxZ5DossJx+qLSXH7jcTd78d/1boYvZNMC5b+gfpat
         Lu5QBxvNddjU+XuUzGosWbTZ+Tvy264/OtWORjCZzs6ZgnL94RUrIV/kW+4OwzqhAk0l
         sJtGzKVtMEF7jY8uor4Q5YqrZ63FZ+7aTjdaPGxewj4EGzQnWtC7gEPWacmCle0fl043
         LpcxMQq/9YzRy8s7X+EswZKWdx9Z8dacMsUkyyI7u63vfN51ulMTYCW6XhlBxxT6ABV6
         ZBmDu51cj/jgbO2mitOsVy7UXMD8Ozl52X4OmPLzO4nT4BSwAqxsrEiQVVi3nJA5kxds
         oZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564547; x=1793169347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=uO+LF+Ia9ZXz/sz/LnG205LaCYw7slmU1VTCGc9bYXB3R7tAmSC/v0XGqWCwEXRQ5h
         Chhed4cqYomzXOgytDbW1/dviNcm/QW44NMFWryD4K/wRuBWDsXNQgdV7sqyB+pNVZwB
         BQRKj4sjK84LKqJYl44DvizgOcD58HM+eNIoHhS5LsYVQHng4bnRCwHWkl5IcabxELJ2
         qD4I4jwJAGbZYo3eTfs9Q9Ub2Bh253uOtZG8LKt4HQNsts6tvTHSpK3ThYH22OJ40OBH
         1hU9Z2wdlsoGfUNm0IZ8QEHynmrZa6iQcCWK5NrTfXicR43kUlGJPPP0pK9rSScB+5Jl
         LmeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxebdSkstMumF1I2G8tMotyAaqW4CsTFjCmupLGiF9LtUrRFgqlqyLTG2NK4eTdUeT39ZXCtCXfGSRY@vger.kernel.org
X-Gm-Message-State: AFq9FYLf5pX+5TmtTcHs3jx/cJcEmSMLP5ssH/gRjXl0X+7ycN+fG+s/
	Apg4Biw5DQ4poT+7YiCGyGD4/d4yVt+URSlmQToIHQeZ8gK6Avz9yIgzUZ8gzSYesgnTL3hUAxl
	bvuFps7MEoCTAzSERxIBPnEKME5TER2s=
X-Gm-Gg: AYBFou2gfe1R3rhm+fCEidZMbDg6ZDfk0e6ATJmitiSIAyEjrxzRdmVhQcBwg45hB36
	BR/WB/7CxkZW5khcLo4QNS+Cnocc0HU94FoHs4MzWEo2siZLWzW/M5txF6L+V44XgQw93GFl+5T
	h8pHg+Wo69NdTBTqJ6P1SQEAc4HZEBpBPgK2pnnGMTicRSsYz8Q/ZehV0fJR1gE616PAbIGLRq/
	bqug6Fi9KnlhswvzsC0rO2j5ZWuW5itDNYCuPR3/T+linIlq0qRWyFxQOKa0XCYiAyuWFt2W2nw
	e0V9lqJdkFrpnc5MIPezofLn8ErTreZawzzrzzy/nR+yHgKI+HV6p7lV9xtA06AT2QZZQyDOhpB
	ySJnwE1VDrt8lcDBxHpkhK/OmdwCZeeVAw8U3U13WdqGN5K1ilaVB7CSH
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.
