Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAB3C0626
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643302; cv=pass; b=uSuMzFrGjqd2jsWDcj9lHR9zeS884VWNqAyehS+7e2rWC7eKhAIp/t8YONc1pyNtLW864VxetBR/SFu6N+ZcAxNU/UlDe5G9B/KAe7M1D0uPlC4uriNIlmxmwtAorM6JGbsqfCQnWjuzJbMvlJUrRsXzZaWhVyIyHV2NVVItX8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643302; c=relaxed/simple;
	bh=fJN0yajHdbKNJg/Sb8r8Ae8JV9wC/JHTUgtXKZ3D0bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txNVkTFR5cC41ozEGUNNwZyNXIOLQUz9xiqZDbos27o8xa/zr2NK/xyAzlNSZ7h8U/qweWDJyCjiUt59G2bRKRNMtZEh4xwdnvXHKys5E9KqYouMuMkEkiUG1A9zVRepJO7yar4i8ZPIFkB1/E6iAuHSGKLmYzAPEYOmENEJVss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ9NO7AS; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ9NO7AS"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66807ba2f0fso195859d50.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786643290; cv=none;
        d=google.com; s=arc-20260327;
        b=k++1WmL1nhb1zPaZY55ZAdcGRTtqPnt5qHiWnO8Im+xTcZgPkIliaeBOy8QuDNuD4H
         5YCztaTrr4MhzBy0TFoiLWhkE5UH93zpFK2noxKeqds/JQbUx8ti+xnSm4txMmLzMwcT
         Yn60gY4nh8hZOSSMqgb7ZMrnVwrBkp7heXS0VueoL7HXkyyAx+5V25IiXYLEJ4DgJuEV
         ycLi9FpP+XwrfbTONNO/QTQ0H3JiehQVocICaZ+BV11FQMNv5RrVkKUytY5R7W5ZXl3M
         69rMFNWegQA8gegPxcmB8f2nGogqA7ffSr4tjrOajpivV4wtAGxUlhZGRpkkyBlDyaVq
         Zv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xKBoZsKQChWoyWTHFeaA8fhBCl9pWtBCM4FH4MsoEI8=;
        fh=1CTLhDbtzKafUufg8I+64Lr+0CSDxORZVvUPodg74/A=;
        b=K5OR+ReWIMmR3+Q85NzDELcWNJJHC2ufT4N4K7U0ts/YOBMqcxtYcO3Jf2b1cRq2Q8
         GjBtds1+8kCPRN3+mNhhx7jMHgzttYgSAr+SCA6Sc4xHWxYdFh9zgkw2Ih7uC2H5iYsg
         d9G7Ne7c2MQmJOK7lNCMbIHmCokYpGVSeMtpokGVMXtVOOWVrEGSr4zvvE0znk/Uh1Lt
         N59KhzcHgcPqhCFymqLMKoHL+cDqWHry9CrnFcdfeDf7UiybDIf5bxQbEK5qa89fW00M
         bALDMW+nPW8487VUQxnwzpPtSvWXbjq2y97LIanEJdLl3Lq0bc/qCsh+38gERriDyPJx
         2xxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786643290; x=1787248090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKBoZsKQChWoyWTHFeaA8fhBCl9pWtBCM4FH4MsoEI8=;
        b=YZ9NO7ASaOX4Gj9lC9QUFWE3Rt1OeX8dMJ7V7HoqrLD6LiMWrjz/Z394NlJZGmFg1M
         Hj80QBvUCyQj8hQhDprlKVKsS37baIlbq/PAC8fYYq1U3/PgHFeQ/zJbJYYbBRHId9Dj
         53VEfG3l6Zsxt+xmcrhshQwTHQ3Sw+1uCluzXZwBpxix3KV25YxYvzvbCoV7J7+vdYP2
         LjXBXaYNVx+XtWm4U4Dzb5A8nCig65YNj06WMauEZX926U6hp0ZgG62o2MbfB3V8qfgR
         V8O/CTua0Qyzd8CtG3HLATSUTuZt4ExrFCRljdo/ouoBlqj9O6xhtRRd8wulYD/TdJoP
         1CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643290; x=1787248090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKBoZsKQChWoyWTHFeaA8fhBCl9pWtBCM4FH4MsoEI8=;
        b=BQxtC81PDOQt16/dWi2buiaYt7GvSuxbgbUXREQmvd8eAynylxB7r2hS3gQmWv0r0s
         u9wCB1AfMFAswksCRZfgWe/dVfGtBVSewR8e97INCuBuAbGuTZEBIlTu09e0ZF+X6TNb
         6HjCXX+2lb3o6nAUEgdnKUMs9XUzptsGsM+8qfmI//A+S30Nb1FCmwcBR2CACoWpbpWv
         7HOOl+S+QX7x+BKyjkQvO3+nV7y9znI/zt+qJTrguXR63ETtrYPdbw0Kw0fpOcB7c8Kg
         oABkPP9eQw6QO5YwnUW2pmsMgNACaD50gPCn4wWX1a6o0GBFt5cD8jLJoXxmJKjnbkOx
         1bxg==
X-Forwarded-Encrypted: i=1; AHgh+RoQiA30BqJZFPOKjtSCFzONF6BySenDTkMeb6iGqj78/lYRnMgWJBONUIHAu3uma83v6C9mGWPfWGHK@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/+6j9djV1botnP87cuS1eVQBhs3MCi17ZlpAci9Ckmyc2Do7
	QvP+B+nmM57/0x7iv4UDbk6rIJiPGrAlxnhVlazd2cB7ETPi/Sp4uSsdF3V0sP8MCY6l4itIzih
	RZHtfSxbYaluc6hmYFLopIme1MLI8N7w=
X-Gm-Gg: AR+sD11NUZlm4PnjIaEczP9xzuQel5V7NttKpDeG0lp+DeHNniKkYjm9h0W+lN1vEGu
	W29p+ZBjRCLBOHCNj7v2OgV98ZNDQBrcYCHqXkjCTzAUmu9lbfUTu9f15sRFAn2VArPLzqmYImS
	ywCiYrMtpzT9RRfb1T2Y8rK0F+WosCicYMBF1QSJSYL7iu/XZcweJiQhtSiUVKbpVTMjRkmOUD2
	8SU7XUI48AB+fxGBizHdpRKVJg0Ep+YmIu7MieLnzTll1hpIiZ024O/TpO8I+B8uutA5PWbsQ5h
	77nY2AH9N3/E6hFS2nbLVkYvtJ0q5LCb/mBMfefZTI9VPMt4AUBTqhmjg1KHIGiCfwfXWyEolh1
	Y
X-Received: by 2002:a05:690e:4091:b0:66c:486c:aa1b with SMTP id
 956f58d0204a3-66c72d2719bmr59581d50.38.1786643289594; Thu, 13 Aug 2026
 10:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624055648.127399-1-challauday369@gmail.com> <178406687202.3036881.4468660016404184803.robh@kernel.org>
In-Reply-To: <178406687202.3036881.4468660016404184803.robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Thu, 13 Aug 2026 23:17:56 +0530
X-Gm-Features: AUfX_mzsIi5SDyWoPwPYp7HUoDgTG5O7YDFhgh4xYm4uaptfNPMewu0uSRvCY6M
Message-ID: <CAAj-GBnn8rGD6o5HmVfYtEksXsL8ZPKcc_AbfKUEHtTsN1pN-A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: microchip,pic32mzda-wdt:
 Convert to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	skhan@linuxfoundation.org, tsbogend@alpha.franken.de, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:37=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 24 Jun 2026 11:26:48 +0530, Udaya Kiran Challa wrote:
> > Convert Microchip PIC32 Watchdog Timer devicetree binding
> > from legacy text format to DT schema.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> >
> > Changes since v1:
> > - Fix example indentation
> > - Correct example clock specifier from REF2CLK to LPRCCLK
> >
> > Link to v1:https://lore.kernel.org/all/20260620172354.155565-1-challaud=
ay369@gmail.com/
> > ---
> >  .../bindings/watchdog/microchip,pic32-wdt.txt | 18 --------
> >  .../watchdog/microchip,pic32mzda-wdt.yaml     | 44 +++++++++++++++++++
> >  2 files changed, 44 insertions(+), 18 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/microchi=
p,pic32-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/microchi=
p,pic32mzda-wdt.yaml
> >
>
> Applied, thanks!
>

Thank you, Rob. There are similar microchip, pic32mzda patches related to s=
pi,
sqi & rtc which are reviewed/acknowledged.

1. microchip,pic32mzda-spi.yaml
https://lore.kernel.org/all/20260622-ingenious-finch-of-fantasy-7bafaf@quol=
l/

2. microchip,pic32mzda-sqi.yaml
https://lore.kernel.org/all/20260625-omen-stark-6bb827ebcc43@spud/

3. microchip,pic32mzda-rtc.yaml
https://lore.kernel.org/all/20260703-identify-cringe-ef88079923cd@spud/

Please let me know if any further action is required from my end to
merge in the
mainline.

Regards,
Udaya Kiran Challa
