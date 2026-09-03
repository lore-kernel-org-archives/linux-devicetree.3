Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6EC4CC293
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471296; cv=pass; b=oncTwK32PIXoC5y6Rv1v4D7yWIMA+uMjTW5d9YWW+l6BzunVyq3b1960ISKpoNMlAOPgOxUgTrPcNvo5TPr1sbILEO8T7HIM9w8JwVVbUYRNrI1uWbOLcZUHyvF7/YJsw0XhJ/drZJoArIUp9WtRJ1mJqEIlKX07OlWMjkokP5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471296; c=relaxed/simple;
	bh=c0Ib+92aTyUG4W5cg5TtzgrxwOV4xuB+U2C9Sig53gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J76UBc091czWZdmeCDiauO35Yds8cgnINycQx+iNV1Uc3KzEAOdjnmar4KgQAQhlnwzB6RWTnc7MnUrutA+76lfWYcUmJnaklwx8Z1UsnOEGDxxeXmJjO4nINgjMb1ZAwbHcjAonbyBxJHkLw2uUPxqPY1hdNjVcV7W3SiCySM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEdy5oiJ; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEdy5oiJ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cc39e06bdso4428926d6.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788471291; cv=none;
        d=google.com; s=arc-20260327;
        b=fygjdeoMuE8oxQJHV5SLoakoPr31Jy99iccrNlJlHRGCa5PstFS4q1OTiGGU3zaQPS
         wASedZwoEsfG21p1okI6KMsEAJvjMiUuqv7C8ResLdmCbqSSwqDp3DFicbHG0XPN3PZC
         PCRfo7iosFtNlzpp6uEyVgH93eWZQDBnGNKocmqWHijahiS9TzFJs0cVAZckRbqj9Pge
         s3HgTpqB0FKt6p2ujyloTv3dVTvJnX06M3GLwd7qJYhIgz0NiMMyKaaVPb74/8xy7bJf
         wZqqa80CeZNEPykv6NP/rnrks/yQFHKY9Ut751IGRWFBLvi5wgqJZOPzU9bYqNj1yQNZ
         OtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        fh=0V/EShC49u4+pSwWIm5F+9iKE1b27rA4EGEZmfwqn/Q=;
        b=lbUmXsN39+qiO71ZhQfLuFqW/CZv4HGSEHiHSmaWem4RHTS7uNXsGhSdhV6p38miFt
         qR5HjPBTDKVFHXAwAoBKmz26D3W4RU/wB4R7ISdj9xhboaBraxiTTVpUcQjNcycTU6cc
         xhjjtTSqCBI/xD5uAt3LnB4U3z52+nzHNB4/aNA+IxaC5XxVMkjPUcAlR4E11Nee4FFb
         DSNCqFrLSn4Vj0Osh3HVzO3z7vlQJv55W0uPaqH+XCOVVZgpk9Fv/YCRd+SS8khiPD7w
         a4oNJGte9jLLmMCe/NNGSp6FReJZm9onnb9YZyROdqjGXHHwQmTBqsWYMIIj1G6+rGw7
         m03Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788471291; x=1789076091; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        b=cEdy5oiJUzYYChthNXsTcfabPJehP8D35kdRLGRouxP8p9nifwUWUHi/+XfrE6aNyS
         tPuppe4ziQKts4YRR3fZlGc2uz8jiLFK1Soi8mkWUikCa/1yI7bwipHL230I4LfmhiQn
         7z2cpMXF5Ickz1e0O262cPNG4qMHB7R7QL3DioBKA2xyUORLV0KEsnI0wCZRKzD6fhJR
         tb1SA+gOrRHln8D9KJgffnqfLCbyTGJoSv4QFny4smnIogzDDxxFf6sEPUIgKNqAx14T
         sWhfcCf7s8YS4EjOZPShfHg+Zzr15LF6pqZj0/HpiwR5Y4/RV5cdho0T2x8FhhIrpIWs
         prvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471291; x=1789076091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        b=qt/VZE6i2kSlBZJ3Yul35PiHkiy3v3NIk1aKuGWvt8BcSOUIrTVTCP7GcMVVnJKUOO
         z8Q1UDerljda3wVZwjYdO1CEBw9R31+JbSMP8WTRpL5gSAGZXMkfd8Eu093Z7qRR9db1
         B/W5vDOEWl2hYwiZk1jXGm25P+9nNBdXtusZ/fJ0MKSu1AnCW0c0oyFuE0Hv4O9a2ec5
         h3iQWc38n3q5d7KWhQaOEgKpqPAbpKhS3pmkqar/lF22QKJ5/EsxZ6nuo4BzkSPnRNsY
         ROydCRQtLzx3sTu0AAFm3qRAYvX+aFhEu+JIg85lb79h4l84lbezygZyrQOZu4iyXHwq
         83fg==
X-Forwarded-Encrypted: i=1; AKwUvBw0erDM6A8/nhWRLHp8uGHNYD2HDQuTiAhEKJdBM2SIMZp9lwOmL70QbkO8dlEGQhLS+Y8HjqGcUQhK@vger.kernel.org
X-Gm-Message-State: AFuF++lpD2Q0Pr7nTvi79CKJIFrK7sBimt8LRZ+6R6RBwOiT3t5ERhp4
	G/ljROcvUDYO8CKbwBFskRoivmd1PX0MwfNjFUWpIqxNeoZlhbNoFg8cb6Plqkp54gWaarD7yXj
	mOb5Z6F1Xl64bGYDdMw5ejutIpQFk1DM=
X-Gm-Gg: AYBFou32C7kJRI8N8nGkPYN2vZmL4aSvWm9JnsgPh63Qq8Ce6fvzsRfGTqIJyjH16rx
	EKIBJcQ0GZxZmzHqu9fQlkA2NzscXuJH3usYYfZuxISZ7xpihQTyTHXezkPgyln75N0jCZl24ra
	xp4OQSdxYOD/FLiWSkmilLobZ9JLzABE55vtmgL030sTPFdqRrjMmUE1YJyTMNFcWnbLNo3r83z
	IPv3horHzarexo9nOm2KzQZlc5Sp9u1XEqgSobnlNmJFhBBjj2FzYMs33a9JntFrMx7aQJl8NI/
	wTPa8BCCXYj+KxOne+xfqqloN/QkZp5rPw25fV1RDYNPorwWUWqwOWKhTU0wRcYmZ1KzQtRHhuB
	jWPnghMUCyMnFwp9Sp0Zj3fRuwbBTa0vkG4hD3+BUtAZqkM7ZW8WhXh3x5d4gTr3bZejg8D1vTd
	rvp03J3m1YEmuoNhHsdH6Mc27bSVB8X5O2RFw4dBs=
X-Received: by 2002:ad4:5e89:0:b0:910:3903:5155 with SMTP id
 6a1803df08f44-9103ef2b2e8mr27924686d6.12.1788471291386; Thu, 03 Sep 2026
 14:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse> <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net> <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
 <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com> <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
In-Reply-To: <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 22:34:38 +0100
X-Gm-Features: AcwNN1Uv2D9v_pw-GfsGiOZWG3HscrogeRdJ_FG015jSQ-YyAbQg2DlcsnVPCoA
Message-ID: <CALeDE9OCZJBKpsAhNJdN9yZTv009PxbLtprg4ErivhQ+boQo-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:17, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/3/26 13:55, Peter Robinson wrote:
> > On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> >>
> >> On 9/3/26 11:47, Stefan Wahren wrote:
> >> [snip]
> >>>>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
> >>>> It should apply cleanly against Florian's next branch here:
> >>>> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
> >>> this branch based on 7.2-rc1, not sure this is intended.
> >>
> >> It is intended to be based upon the last -rc1 that was released.
> >> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
> >> branch on top.
> >
> > But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)
>
> All of the /next branches have now been rebased against v7.3-rc1.

Awesome, thanks, much appreciated.
