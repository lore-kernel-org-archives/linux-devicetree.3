Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566389;
	b=fhDsixO5xqsRF9xjYcW5XoY/QjacRCrkdgA3nCnT+uh0d8E5R7QU3H2xE4nw49lIAEa9
	 J1ZYWXKcqAX/ndXCQq/f+ulKDoGF4KhEtF0U+jzg7/SHQptdJeo+aWfB78m3Bhy2zVmsq
	 Lyq0zviuu3k6Dh1nLRPewjN6R4VD1FzU/xx6ZNe8R1ntl0nJN0VAbGXA104qoED/9oshI
	 Mb3KKk9WyXGZCkkig6+lAzmDMF9W7aJyS8c1FILlrQwD1OS4JWcSGZ6YgYSreaal4IIOL
	 aQS3AqcEgLqxspf313uWuBVvAXz2f+G72vh6BW2Fnb2sZGpRApRKLiWEqsQkKAnCMpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
	b=DFtLCGKU2epRwqDZ1Tk8jubHmtc/duDnFEM8w+1PxKLRdgokhLDvjJ/A8LtMHFQTQXyd
	 OXEeFTS/ODKYuM+r8RO0SpyeG6Z3iT4lpy59wBKj7fWv/aB3ne3dYVifKJLIVUEB2CQq3
	 5kv9EuTepaX7AOgMVEwlaGt2DUcexNekzV/ZqnzCz4gl6HvR3OC8lf6ZZQZnuthclfx9Z
	 fehEqi1dbX2nQUzROTKkt1FG8jGl5MmSiwn+sH9OobRm4kYbv/J887Y7jdQ9jApxeUdgD
	 uqfNKighMv471WB+hbM/1OvJAy2ewCxtfjO+vadBRuYkktVyzZn6W5ATb7HLnCNfQjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ED0606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8ED0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so394063a12.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=nF7Kjv7SMUWhw5HndxXNNZehigE+hCe7vdki3yJe0fHubi32u379iwljLuhb+ogP3t
         Cdx1oFjPt7Iwp35rwk1XYrVWrT1VmBwBoqxqCj986Ezk1mecjJt1xYOLVmgjNV1upHpP
         Id1GmWd4WgIWCg7uY3+g1pBg5mF8gUmCH0Umt1sjRYoXA7uOmPxgWOfFFYJ2DFRcjCvx
         wJjzzAPTo7a8b6Va0wmEQMxLgDkjnqImZJf68ZScyMljbEoIr4KkL+YTxASx8B3R8RwP
         KQglSGEO6rrtnoTnAxZhvyvxPTZ3Hgs5P7qiBN+1mXoc9bA5dihWP6NU2dxOdUwSoNzo
         XMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=tt9EtZAJLIRt79Uh08K+WRuhkuHAFpOgmi7YRAl+K4E=;
        b=EtdMztCS38blhgoQSw/5TPBjw/exerx7dLOSxDdVtmIT+lbKSLM9XzSe8SQBk12hGr
         7Tgo2wsTer82teMWHF9mZKKC1fHQOxmi+JWDaN9mIjTb8sH7ca9OufDv0D3ikObZjLd4
         NGOnxaIL6VBiq/5Kxhn0WTc53MbzezMePalR/Kt4kWTH9S6o3AcjgDnw69LP0hCpQlg9
         7eZeFyiSy5nmJ30zo7tNEvoJYlOZnND6DXzhn8uJaPwinLzS/V57DPviqrx9JsS4ayNu
         H0dfBPxyvJd6Dsn/bg+x6ennSaNjg9xmBwGB5GSNy6Lz2jBgk9+4mDQdjY3sYDodBKrT
         Q8sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=C2aW6AfO2tXqS0Oxlx14bTBMVNZFQOYYIP++4Zjy0XAUzXRNiZIyd/we1pVq076aHi
         iVYIhUPzTRpHWbk8TgjZRClfvVa/ZIrYZGMbZO3DJMSCV5UIvg3fS/yC6mcleMkr5AZl
         CDc9kVye1E9N/IkJg93m7mi7sqO0whCAZMX9QcPqw07cX41RvUCWYBX2Ni2g9I4qZnBc
         vQc5Edq7qEPfSyUtvQ+/172O9D4MiKBbq1sWvU7Tk2+K4adLUinXmEHtrQ6sATHMl6NQ
         saHvu7vFC0jl/+EFXD61TpmMKJksXH1W78BY/OXH4ikoNly2no/97ZmvjpXcLfZRBf40
         7B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=F4DgvwoVRF0ynDuXzLO6Oj5p3OCJ90TuEw7FsMa/TxixDB9ZV54DQXRTr4RZuM/d+k
         ML1r0zcRcbzwFBT/KSMp7h4/As/sjqh4CvXYOPvQZegZw9exoKHdZAUYbZZCwnD2I/qK
         5OTl/fbTm0U89vl7z77daqavveyetD5MSTUtaW1uLP/ipqnNK59BxR6mPbP2mkme/+tb
         +le994V4uM8/ZekTEP1VPQygAl1pjpk8IMPEQTDNfeu5Qy7CY3lxDzcM88NhIpSJd8UU
         tcfRZ7s44I5smrzQWj3UsEsw3IQFiCbFvOCpw9jZRSCRJejOmBF8+rIeij/1lF+DCoBs
         Z+yw==
X-Forwarded-Encrypted: i=1; AKwUvBwPyAy3eZaGMPKCPt6jI91iLb7cvFH0LWsFSs1+qsAZRZCAb2AvPdap8NMwZsGVaPJU2STNWBKQuQZf@vger.kernel.org
X-Gm-Message-State: AFq9FYLmhsJJ79lgeYfclz9Oa4AXuPpp+NP4LkZtM4JXdz5CHmHTVa+I
	yzF1pvNN0ErJJbcWrDIjcHll/bu2svACfMBIvTXJRC0AaC4xpig8RTFy2G1oX6d9FOog3mKpMMA
	zbIfe68EBagrV/uCcU/0Viz5dA06LfEI=
X-Gm-Gg: AYBFou1JKBxp2dbX9HjnNQS/laqOe9eNq3ZLUWt9fDm9CE+nhhNWtennv/cHmtYlAps
	bV1gBBkp+dYtoCeatyAdAyV2vPuH89fIBN4g3qGmVZm04bb2luZgsc/mT1hs2MSedeTBitna/nI
	3GJEkJ5DqmuQ5X/MISlEvh6/F93bBKNj2y/9MgWyKhrL5FMFFgruGAd1pynFxlsmKIY5sF4MmEb
	FAyOSYfWvLAP6ubJ1oyTP2mI6kRT1DY+fkpJSYGihO0YnQJyicVJvkvuPqJ+xWvEL+tZmk4JfP2
	4Eo2+lZVCA06xJ1be58CyuoryPRHV3WdafF6dkIMUvu7pEEWNBkWJ5eSulABcsiSAsfUkzcjHAn
	d+/GP0+bkg5IlzKeMO9Fw7TB3/8LSCsicktw=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
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
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.
