Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367C36998C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134452; cv=pass; b=V9PlJaYUVkXb/0WF0WVw9EPO0gcUL9BO/rwDLX9M2Qg+20QN/Glt+wO6ijrQw3S2k9qzVHM2CbFaT2YenzhpTQ3TJhpPNdXDAjTQ/6b0yhxTdZnsoszlat1sblqAgZijuQTW6Go7oDErneHU/kkwNx+1iJFh2ZTTrsKLRY59Xqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134452; c=relaxed/simple;
	bh=YnLY/uIq0MHeIUU0GiHv7hsHvbJb3s5yfhW9DXpM1N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAULvr07X2/0l0zT4MKkF/KxYYvuOTRnJjH2NNs39rXJ/6WvQEu69PguFbdoQCpoT3U4UGl1hEaCpFcr6RjSD0jmNQQfgTzje4HGpyweasrnDz9c2OWptbC9dulC0cVn4vhI6S2lQcvUk6AddI/H1xAgFG6ayJHqKcMnx1+bHJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMfBgqEr; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMfBgqEr"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so32614016d6.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780134451; cv=none;
        d=google.com; s=arc-20240605;
        b=HxSMv94jbK5Pg84rQV3ySU/DJv1xzCpmsg3QZ3A4g+WpvmOTIbhCgIwgodUQK591ej
         sjr01WVODD/wSc4SlnWhVpZGF70SkV4R83W2fQ76zNnBx1K7SuSTAveUAvgfqsMqiTA2
         QZocEmui/3DWahE2zngcclI8lEH6jLhLaLSrWXFx7oDkAoeeW89cD6Qo6T2yQYO4A9uk
         /8dLaliVSQCwg1Qzss6rxYrR4UdvcCRYwb+O9jn5W/kEkrPRKm+ewcdL9egBRfxFv+dd
         +HLYiAy/lMT5y9u7CYfEyDqfSEcExyBVuQ2d/pgzeGsUk+Uc1mgIO9fb9GtQQ5fIMo8Z
         zhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        fh=h5tvTIWZA+PwHF1zQWQGrlYa5TzXZCY11aW3IsIxNWc=;
        b=S6kqzB4iLJ4kHOpSq7YrK2vPHSfZTva6vfcdtGXW5IiZ7yFaOXRq6kOdAXlDUoawhz
         WULD6i5sSF1q5qa6LOmajbQcg1YZ5wbPuqZe0TvYX2RLhrT7ytQpERLOmHa0uL/Phu9X
         MELbrAjXEhRdiskV0GFSv/ToqpR0js+LoC0A/nqNlotpM9Zh0vcupfJiBZv+91L0DdOR
         qlIXlH0FQjL53Vc83OzLHkJuA0CC9cxpgJKvY1dqPJ9dwRP3n8nUbk7PUN30up3Trsnh
         KjTtIffg/WQoTe1JCZNENN1QYNCqJg9o1ju0kdChQwOPAl9TbdPld1rwwl08mB5X3T8b
         xLiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134451; x=1780739251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=QMfBgqEr7K+THe+HBKxkPElNK9tZRLxyYElolXOFwWoF+durMlKLcQ3h5xa8J1Aa2f
         0SMJ1xcZjKJEQcBOIWhKLIFJWDVQNFbyvLmEsWrV9UxFJNklMLHD8G3AWiCUlW2W1HEE
         uiHz/ARjGQdQeb3GJA6tSsqpUr+ROD3eQoTClIxTlfRNVcjYMeXxuQdqK/yA189I1RcN
         kRmPt6xgp3P+U7Jy3iR2rHXGeP7z3ip2ZYU/SrSiVy60tN6UjI0y+yizs2DnnS92xScP
         2/V0MDlOtB+wZiyVMSOkX72tOUVpb0s3RW1qGSQX3F/TKPsrxZBVGT/js/r52mRrpufb
         x23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134451; x=1780739251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=iQH6Q43UAj1YngheLLLoITcauYne7OYWZIM5eTwTipjm2NA2uKpwiomWfT2O5GLZ+y
         uAIX0hDj+zKAUk7cRegJGyrtOEcgWBgrMaXaGffxZgX9a0RKHRXNcOdZKfuBshwAJibZ
         xkzDRLUgLOV0WMTsqtKDBkwAkyE/0ePT5xcGJx/u2vcjgXrt7K0nt5vvj/9XzHrtQjeX
         95dQCrYB6XN4fQihCui9Bg5m3ngXKUM+zZLi9rHtZ4EObSzxNpS3gdL2QDeb7K818Gam
         Y1epEx8KgEFf2D2tcx+4FMklnXGxrW4JVyK367PzIYIm0crlKvWxsP5xedqd8PpN6yq1
         9hQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dcSrEbkvJYmq2GLQXUfD0iL4smU41hiOrX+crPSxDRWH+RQXJ9dx8PZtCCCxEQ6Bo4Lnbhbv2qP8H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LKL5GWDQ/i9tGLN/RCFo3zBBssko//j6T7VJbUji7LuG/zqg
	7/0SXGV/ZRxAEOHCN2+hCqBmYl2MjDDqlipQqvtgltNlwNJ18uVNUWjx0tIeVoRw+ou5FLlQJiP
	q2usHvoXObzAdpwqjUYv972p2HQJuVvo=
X-Gm-Gg: Acq92OHuOPe4n4JmuC+zsJSroZmyxk1bV8ARL0HyECXn+NdPTV1xi9B8pSeoDYlfwZl
	PhIOq4YIyRe826TfP8zNkwvxxs/cJkMp6xGlPshEiQ9aWmutKEl+nsbpXA/DkEJKoS90wrSqdpv
	ulyCuta6NK5JdfWT4oeahRMkyqCjvn3GROer6TWGXimoLgrpQBubsOYuesThtt3zhgjOhe3X4a5
	W14Pb5jtBtrctszfT8uv8ti6biVouk5/WOjA3rjuckKl9Sq6OmMUVjTAT8GdJjmN/9VRQ9I5nT5
	y9wPssmGsF+wiz+z1HWo3bdG9bSlxY5hpegvHkrxAzQbGCOQyyDr1lTHu55zFI4fiTw6zOXuhy6
	HoaY=
X-Received: by 2002:a05:6214:3207:b0:8ca:10cc:fdbc with SMTP id
 6a1803df08f44-8ccefd98b0amr53330036d6.23.1780134450763; Sat, 30 May 2026
 02:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530052812.115994-1-manishbaing2789@gmail.com> <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
In-Reply-To: <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sat, 30 May 2026 15:17:19 +0530
X-Gm-Features: AVHnY4KAZWNK2RT4qjWm79BISQq-qXuvBUOBtqIHpTd5Bcj1PcsZbOxPtlj136I
Message-ID: <CAJvdc_f4MPNcUn6C5VGB5f_mmyeq2jQ_Ln-4CWxNTF7fcXhsQA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

I sincerely apologize for the massive amount of noise I have created
on the mailing lists today.
I am new to the kernel patch submission process and made several major
workflow mistakes in rapid succession.
I am stopping all patch submissions immediately.
I will hold off on further submissions until I have properly verified
all in-tree users. I will then send a single, consolidated patch
series with corrected terminology and constraints.

Thank you for your patience and for taking the time to correct my
workflow. I will do better.

On Sat, May 30, 2026 at 2:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/05/2026 07:28, Manish Baing wrote:
> > Convert the Atmel AC97 controller binding from text
> > format to YAML schema.
> >
> > The binding constraints were updated during conversion to align with
> > actual driver behavior:
> > - Added previously undocumented 'clocks' and 'clock-names' properties.
> >   These are made required, as the driver unconditionally requests them.
> > - Removed 'ac97-gpios' from the required list, as the driver
> >   treats the reset pin as optional, and requiring it breaks existing
> >   .dtsi validation.
> > - Fixed the ac97-gpios array in the example to use standard
> >   comma-separated formatting.
> >
> > Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> > ---
> > Changes in v3:
> > - Updated the commit message to include the reasoning behind the proper=
ty changes,
> >   addressing Sashiko bot feedback.
> > Changes in v2:
> > - Added undocumented 'clocks' and 'clock-names' properties which are
> >   unconditionally required by the driver.
> > - Removed 'ac97-gpios' from the required list, as the driver treats
>
>
> Srsly, stop. I don't even know where to reply...
>
> Best regards,
> Krzysztof
