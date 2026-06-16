Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC93D7D70
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633633; cv=pass; b=T4wL+oq/Ds2pjJUX2RqSqskIdJTD9lvQC0wkVK67AP6qr90zJcuODg2bwxNaxalsQgj9LWhd1fkUo0XRWfitM8qf6sLq+650+dJZRz7CUxgYVAkYUBUoCK8PPQUTDILQ9nvN/UNP1Y5XP8GD4t9thkkBTvqCf4e4aB7pn2No3yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633633; c=relaxed/simple;
	bh=XVDXOs5PD1K5upzQNmkXI9UANSCojiYwT2l1mSGO/eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5m+3upnZp67CKIy+yDCeuXw2WO8DkbzsFF3zZmPG4rOqkZPA232WCjqJueOilzchlOhKbCaWq2djmghhNOOIjplbJUwg4IdwxE3UTpUV8/Iq0OVM30gel4Xxw2xmy2fCvSqpCnJJEiXwkiCjWM7gOJZFJ7CwFGUMYSOUnyeb/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAnxvk94; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAnxvk94"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6607e80a846so5065662d50.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781633631; cv=none;
        d=google.com; s=arc-20240605;
        b=ASwAAw6exAhhs6cqqN4B+Sl1dTonirWFNsmaamVP6cw29p9uSCE0GLTJIvSCWNuPzS
         Ei3JUMSLngk95D0lEsl+cijEGA0tH9XTD+rFsQV7L+8A3Y2in9HKwkqMHgpUu4UTyAzA
         mecGII+SnB0L4TsMV8Y8sPDNRRgf+J4bfwFzodMf1QSteWHB0zD+GAtqGouBz22C23wX
         ay9SiHjP5+X4cbPSPbhTABFrbY2xzTZupchcXsCj6qBXUWJKGHybJKaSiWrvTmuDMrtG
         UX4vkI5/iPAHKkD9vEEnWjzcc7raL3RD6MEpcPZW9KnpD6tAeV1GPlh0fPu0vUNNbOKt
         bgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        fh=YZCu+W+/c5xpoO2oUo+Ma27S0uH7eXsNAYDWFY4dvr0=;
        b=JO6Q7qW8RLMaA+U5iLzn7PUuYcswOXm4SN0Q/iVnWuihfD/wmXAPO1rKufO8XGWQAu
         wLGLET9tRN9gBRfty13mWRAajlEYiR1AvBQ8NgrK2MaUIx7P0oxn5Y3krjHQMBvqdgJ5
         KN40xItPwmX8s4vnevxqNfm+bhOk6p8Az2m4Mrifg/eAEzgVaMUMb+puFit9m0Ap9G6W
         lqcwtLE9I1XjQWlCgch8CKUmvV/twzEA5v9WJBfgoCTUWFI/+/KJrX9cwLTS1gO04qWR
         pIp4AEdQyD1KQq52DRHKTbJPxKoIhLzrJQuzifqqQp6hLoayN1B0HO5o4nh1dLQ7BUeD
         2Ikg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781633631; x=1782238431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=rAnxvk947cvJ8ukLbiBKxhRl+YNdBW7Y02O9Zulprv2+8noCPttVhKT2baOBLMvEK5
         lvsHgOwNJ9PJhCoIYlRDESOCtoA/qBh4TomXhxtNyzQFaQonFC2UHlD3CLdOC9N54VAf
         qfk+PKjzZ0747AaH5uE/2cXPWPOh9RYfipXOtvJWsnusbs6Bw1tW1lsuCLCziJqgcc5Q
         WuiqaO8toIjAtVd8C4lTYrq8sgyXM3EXR0RuEcHUQxSbNmjpbbZSP4/Wg39oAUF0nnVO
         NX7CIqNty/AEFmOl8Q8iDi+SyIGQgwmGn3QdtlJtGcqAvDWaR4X5WdLEYvJJaMrmj7Nu
         R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633631; x=1782238431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=chEaHnQNAzpcGXRLPsTERRyIWE15DRLSncW/7I4mvqE7i2uEpFhmKwpNGuMxal6Myt
         E51Vp9A+JBX4+yf5cOOOZPZj6Pqkqv37U8TzTNWs3wZ/ovZuMUHbpwpm82S9lc7/Ydjs
         tQ/MK7ogOOrbDzEj9zbS9pPVSBG3yIIAReXu4EGgUkvb8ue0IKQ+58GYl7hz45YQwqN/
         HHoRWep0zjowiVDHR6/JpgxpGq/r38KnfPYGP/PHszZFa5fHwzNvLpgfK8XAXKsnsIxb
         1TlJIriaJytb2w0/L8fPH+BFFUh6JjHM8oXxjchEucErm2MQaqNFSuW/5H8POAN5BAQ3
         MZYw==
X-Forwarded-Encrypted: i=1; AFNElJ+FdxIP6iLbFiXq1y6grfad/Ez7Ce8JLK5XJlzBW+7yd2C9P8Esh+4Hl/bqtVLt8I4lKEfgX9FI4gpt@vger.kernel.org
X-Gm-Message-State: AOJu0YyDcmS2ceW0ggx8b55yDQqYefnR/U46bsGyzcmtPQt+Fnp3iImM
	FzsVkGTHODjHCZJricsxF3zvYJx2St0d3Foel5eS6McTtBdPR56GbLEEC9B3fhIYR0eEwTUKOVe
	lLvCS9ES/RuH47xff3q1inE7BXMn6LMB1Ug==
X-Gm-Gg: AfdE7ck9gHWuhddPhl9vaXfHJgblzF7H/c47VHHu5MQKY/J7c0WbGb6JKFfpy8k6Ph8
	9hI3/iCk58W8RoOWv/+w1aFAzrvNsFdziX2d1yGw+qxg2KPBPHsO/ikxx83wlEVkjOA7fzbqZP9
	bJC1kX8Mr9c4EPoARq58TWEbcUhlLs5RG88oxGVkBmmlaULkeUh/ID6hdrAYcCcRrI2m8IaC6n8
	ZlQnlioqyM//8A/oRU2SmiLS6VtJFn1RqahjW40qDZEBhDJbuht8UK4bUT1bKTy6H6Y/43iIMzU
	KtWs
X-Received: by 2002:a05:690e:1446:b0:662:b875:b149 with SMTP id
 956f58d0204a3-662cb9a5521mr488948d50.28.1781633631026; Tue, 16 Jun 2026
 11:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
 <20260614161503.2219681-2-ekffu200098@gmail.com> <20260616131945.GA2236977-robh@kernel.org>
In-Reply-To: <20260616131945.GA2236977-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 17 Jun 2026 03:13:38 +0900
X-Gm-Features: AVVi8CfDQJdb4Q9jLQYUPY3KXB7WpMZ-iKjsv1-5FCLStEz_WwunrIBu4QHvpOQ
Message-ID: <CABFDxMGYTP4uLaH-ew+zf4++CtPY54+pDsRVO6TbC9W5nVVtBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	devicetree@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 10:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Jun 15, 2026 at 01:15:01AM +0900, Sang-Heon Jeon wrote:
> > fdt_reserve_elfcorehdr() does not check the return value of
> > memblock_reserve(), so a success message is falsely printed when the
> > reservation fails.
> >
> > Check the return value and warn on failure instead.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  drivers/of/fdt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 26f66046cc32..d985c07d7c5c 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
> >               return;
> >       }
> >
> > -     memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > +     if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
> > +             pr_warn("Failed to reserve memory for elfcorehdr\n");
>
> I would think memblock_reserve() should always succeed and if not it
> should print a message rather than having every caller print a message.

Thanks for reviewing, Rob.

You're right. After taking a closer look, memblock_reserve() either
succeeds or panics before memblock_allow_resize() called.
So the check that I added in this patchset is totally unreachable.

Please drop this patchset. I'll be more careful when sending patches next t=
ime.

> Rob

Best Regards,
Sang-Heon Jeon
