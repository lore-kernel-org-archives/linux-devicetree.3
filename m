Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4047D470
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243011; cv=pass; b=nZENgPmRLVHH7h4VTiuC/Z9CJm+qb4NqEi6f7kfiVvzweBO1wTh+iAWo8r/sXscwh/dlua4tdp3V57CRdeu708+DPJWAepZoo+gwGCgcF5i6UkjU2c9fgfkXP9bA1CtoUCe4QKZoYKnWgJYSObK3zoAhgZI6xkfXVf7BAytsD/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243011; c=relaxed/simple;
	bh=nM7522pMTSm6ohXpjcirSMLxO2bUSl44i0fllcYRFAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoHi53YAHvmia9iICxLzsEXg+vs2XjQZr8CnQmQqS9iLk+0pk+MNosakF7PHobHBM9NoHfzvbMrxW5Ry4wMRWqfU3+k374uOv3peaYk78ETgs/os1yY6cHKeBImhBLz7ViOyHkaSKY2PUYQbsN3wKEP5Q9f2j44BjSqLHdWZDM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOlEWY0M; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOlEWY0M"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15d111ca99so2764666b.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243008; cv=none;
        d=google.com; s=arc-20260327;
        b=kZuAzm9n2uhsG6da58/oDpAH9uPaZdQFlEK2dhAyhjwwrhMDFNYDKn7KbVdqgT04hb
         uu/p+9sqX60eMN00aSyoMVro2G57Jd+v8SyZxPJlfucjxR0jtP4nEHTURWF4B4Re/aHD
         t78P55HhSHK0/5fYhoSwX6by95FkG3/FYsscYrHrNsapQ0gSbpuORVOhd9PxNIdciOw7
         KyR5AQ6FSADrPF/+LqLU6XRKMOHEDYi5JRxm3GyLzRmROV8lHQzC8BlmfNk+gFMwksCV
         r7p73nflc9DW0pAEGjKp6UNzBOyTZOgVrsDxjY0khgMzwgwE1gHcsRHw+Lx5O7vd1fhY
         4K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        fh=6fw5CH+5a44ACKJNE4MZZSASwSUhwOGKqpAwbJ1QfeM=;
        b=lmYzjaBY5FOluuzFIXgVz03aEsNvwtO/HZiJAR2zjffAnhGU1+mfkGJlicfSY/cxs5
         epXeNtEEol4Juk/3PWBk88yqFdRLgFpTh8jYs/f8PPArHHbLS1dHrRYEnSanfBvdnPYN
         Fx0KzY06fbXUBmPgNFlRpFZvs3SGrGZrpkDvw0TBRa1ZKwf8nRrGUEx9uLLwsjYJ1mSH
         sBUZ+2cyITLD0pfjsLCDIFxGQ9pHC8xthFykuDTCSL37d8fMHE+mHDmD2/drFSN61NrK
         2k/VJ2ZYYVsEMqcAB06EJq62gHqnx6XJByQy6BuyTsaftIYD9YJrPQeduXmM6SSHQeQ/
         QxUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243008; x=1787847808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=bOlEWY0Mb292rIMAKTE6vd/2FxvUetWzvZEY63S9Avih8hLO9+PCK5rb0GHwFLtbKH
         kk6Yyekz7v8JyRhvAMKxxrElNC5posK7Q/kEiwL2lTIIDaq9/a08fizXIo7lDyJrgqP0
         b5gdhtWHvAoPgZjSNxI+CQ4NsOydysVImcu+u/xsGrEcKrPHk5smpVKqGROCgs7aVEkv
         yFqwB/fLbbyTtVeP8L4wcLkSq/Ot1NHJjgJ8Y/wFGbCLecv3jNkvmi+gt/rtzxb6/A5F
         2a6XcFm0RVzDVbzeeb5oq8dNKe2jOt7WD5xzQ7b54KuQM0ddOntBTLtv02t+AFfyfokM
         Igwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243008; x=1787847808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=ZWFw9DkDx/gd/7IHDuIROM4LKx1a7qVLD+2J2x50SxMOge/qDzQ5GeeMdWaOLj4MmR
         4uHAMLVhBA5j50jVf9m//7i96DMFx+4tLraafxaO/n1qgGlSEUDT2jl+1cCivEX1KhRR
         pg2OW2j93gzQZHNdiBWDgWts6UIYL4eF/EhxAHU0Ql9bDKziPjWdPv0Z4xjKAB1epq8x
         wXGp9VS2oI4gDtFocXiKl675yO3N21JDG0Q6pmbx1s8gBVfCF6/Jc06e+OfW8enWcJmC
         ye8dSFng8JJKFuJ7nGN+EEGG+Yh266kQTR3te+EPMn7kiXn5TIBvXJe4gZa2uM/dIgEx
         aEnQ==
X-Forwarded-Encrypted: i=1; AHgh+RplHOsEQHI/mMhpHf2nBs5GGWzB3C19oZ5bqjUvqt6JOZc5I8dzjyqgylq2hGiIs/zmh65RbSf/etkR@vger.kernel.org
X-Gm-Message-State: AOJu0YwWlG0G0y82IbwVqpqT1qU+UnQk/SbwXz/j+lgH45ioMbOkF/xg
	/XKCdsWIfF1w/r/RISDkvL/zzMjjSoYAlVjDzjT0IvO3xTvERj+RWwOqCbW22qGAeZa1KntcniP
	ag8P7BWkluPM4YiY7y3j8MWOX+FTa3Qc=
X-Gm-Gg: AR+sD13RI19cYp6h9oXIsWlrEItx8m2uu69fZWauweLfukOxuPKNFLXrURhLVqPLS2Y
	8e+QT1wRFS/HCAHkRZ+6wLsq3cP9nsgOlGVrwep8fyD8mRlt/0DI3KPjUIIBgcNpmrBJ9wom9f8
	WW/rFHA3DUfb3gpIQ498/mi1o1VzeWml0HjDIYfnwHGlKauHEJ+Zl68GvqSfeohwcUDa1PHdCgB
	h+uztJ9/ZYkIuFm8FgVcAI1HsMl2oBlt4wqObpyhNNOoZ8KxoOW5slGrEPrzSHu43KW6pQqz6pu
	xRwc8xvgR9gE6r9cv0HvAyuDnVQJ098Q2VHUNXORT1A=
X-Received: by 2002:a17:907:a647:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c23e86dd23fmr1141726266b.6.1787243007488; Thu, 20 Aug 2026
 09:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-2-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-2-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:23:16 +0200
X-Gm-Features: AcwNN1WN15gIPFE-wS5GMikP40k9b6tUzSd1TSg8R6uNQUbH06o6RfXy9sJzOY8
Message-ID: <CAORyz2Lgo=teK89gxm6QBMfREY=_cAFN2TuLUFvwGcYpozkWww@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
