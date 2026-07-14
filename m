Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A82D2394
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011007; cv=pass; b=rYPcjsW7eu/d642SIBD0cad6pRQVkD90LKO0fVW4A9vsTSVxnnRqKJVsDuYGvq4YU/gXmone9oDuJIw6wCI+7/WJBmYqnBdTfq4Su85Y+WsakkjwmshchQykHRsDSWldZNkUs3HUMWYHxCXw6uLb885xcK+6fHQs1xmiM+Rad/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011007; c=relaxed/simple;
	bh=nNtgHm6gS76O+B9Srd0Wr2aCF/mjym9uwgYYwgdjclg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qu+mvvc7/2dIiotHlVlz6SsAZ6eioCIkb6zvX/X53WbEzlTRCulHN6xFOeA7zuulgnGn20Uk6HZ217sf3kdWVsLAma08s71HwzB1A28cQwmFzEoZGC1sH7aYJ+IAr+yj/KWz7iY7RuF4/KHGgmXhmJd8P9lcGk9lYf1dyoXZMFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=MwK60GA2; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="MwK60GA2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de008b020so302607f8f.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784011004; cv=none;
        d=google.com; s=arc-20260327;
        b=r4Vd0BLuPbyejlvFRJ61yxfO2FYtQc6tp7dddDvAKUG1D5zmWxJKjiJwZ1hF/4XNWg
         bG4mWhRBJj+X7c3B79msu83TzxXwPk3jJNGak8l3fiu9TQejVV0XnmjA/9l+Ija4rNT3
         tCeLsOT9WLDWWEv3s+NRMrnrFHOt36+J5dHraFx/vcAadr0DgWjbVNviVZpDHB3lIfzk
         AdVYgrDLoz539ql7CriKS1mGhY3A7O6FTY/Mf3wjWmtoICrA5wxHV64YPcX5n2Nt7Uie
         smcgSlH9NOcndqGGSUQNuXhJ3fehBJJNiVOlorX8iN/g0AlDLBLfOwuBUxnmF/OiE+4T
         iSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        fh=G004vhOITHcWghgFTvos2Yiln8UHRdZlOI6AJeZdgro=;
        b=LXv2mAyBGz/w4uLfr7GlXGf+Wrfpf/odISro3vkWLyznpyN2IV5SzZinR4z0YdjXOT
         PIS91SGpJbDznRuf421ypTxIk2DpI+9C4e74kaWMNpRIJemuk5ZR2Yj0UoJ2Uslsx8OU
         kV8QVsOsh0p6wzOvhWQUB0Suft5B1IdRdEP7fyLt4Lr9OkT5Aq+bxujMp1PrYkUs2/wb
         S1438flFRuhHZk4YV1rX8lUuO87B6z0Mh8Acq5PwzzqImoJgSaWPJ7QV5OuKluq5sHDr
         dkeVOrrxZAXtL6MWnhNVHB0QmpD02uMSY4ogxaEZWbOjRPjPRaKh3O/TQIcnJzODanJ5
         Sklw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784011004; x=1784615804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        b=MwK60GA2D3IoTC7mIeTz0k8tEOVY5a6nkYzGdHkJZ6mOSwzuUSltzGDvMPq8Vz4l4y
         1bOz4HzmkpD1ddxxmFBHsqVbNjgC6LqyGJwAxfEgvNOlX4iP5jiPWhVopQ03HEdO/4HN
         fdTDv70pVG1rvHQZDh/NAdni+E1CJlbArr9IqcysnTh1wVAICCAdMEjhB+UpWw86KaJT
         pL1ARO/oPgKpyrwGl/67iUKPbi17QX/a30lFRWoKE0beswyLk9FqK4l6hPC33YPi1gc0
         L3uZn6Tz7hNSmvrJ6/Znve16YzcG4HDDn1nkLU9edkei9rwihtJ81J2PGyTxtY2nCW32
         s6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011004; x=1784615804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCojHCJqKCZD1pOeyWJ1gcjn0kakXpXScxWlytGoI3E=;
        b=NSG0hIl45vcs//+FQbZ5ZWdudmII05NSBZQ4P5Gtj7H5gvvHnANAdwAX+YWXVh0d6n
         o388y2mQStwlKqwgJn4yfxqadBk1g0/p1s0aGtSH8u0rVvZUGTU4S/oasbgXNrGx/wAf
         WXS6nPEncSx0eoXmhsE+DobtccLGrrWrz6tdLR0X/7m3X7PlfFDx0I9EvpwnjfjLUEZX
         jamWbI7K9rpqLBwCxXraaLym2xw4WtMiz7yETOG5XZyeTD80hlVdf10jOPcp7OMHzZpI
         HFsGE0Lr/85wTVMRrwbgqBov6JwFAdtXqRhUg0Qeoz1B/GBtvMhZcJMs6hpAkBL9WmYH
         pTSA==
X-Forwarded-Encrypted: i=1; AHgh+RoBH94Lm3rJizOYQxVdAzO8qr5ezxN/DcBAP5Qvu24XnUq5EfJA9/ttrxroDt4OFoi20wHzG1mWvj78@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQYFSEb9CbYNKgmXdB/mN9N9NXlhk1qde/Hy2kAApMIt9GNk1
	smr/lvAPtRXcyv5PrfoggV1ZqqAtWm6O1lLRrU7Hl2oadghMhaZx3sYJWmTEQn6Y7fe1Z8VGuqH
	8mlEKUZZE0FqMySY+kcjBO+haxF9q9qP5LGbIqS5x4w==
X-Gm-Gg: AfdE7cm6elrz7+tHsjprN0o/goWFjWWrJGX2O8xMJV13HFzHbpfWbb3EWgNMJPP8x4s
	gbniYa2UkmQ/A9SuSgj/FyuNnaGyfmZrp3WTMQhs5CwD8mjuZXr3+4Y5JQAgSRTTYkDAUxm/p25
	Q9WC8yy0MBXLNXoxQYH7qWz/GEMx67noat8WiJ6iJAfhwhPM3nFF0LG0yL9mOzufmWr/25zwlrK
	+Ik4lZjdhpadgj5DD8DWhBnbVEt+rkf0mpQ+KsJPvZhcd7KZOS5Nu1G+UhXO5zriR20vy7zqbb9
	AWoWiROZAZi0+e8QxktFQNQCV7vsUdE2vS51km+wj+/nuuIgv1UdE8IXqw==
X-Received: by 2002:a05:6000:250d:b0:473:fc10:f675 with SMTP id
 ffacd0b85a97d-47f2dcc0fe2mr11861531f8f.18.1784011003684; Mon, 13 Jul 2026
 23:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
 <694c7c37-fb42-4994-93eb-04ed4ae299cf@lunn.ch> <f391981a-29f8-4ed3-b582-744aa47cbe1d@kernel.org>
In-Reply-To: <f391981a-29f8-4ed3-b582-744aa47cbe1d@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:36:32 +0200
X-Gm-Features: AUfX_mw96YChou-o26GCAe3iXMgSxSuxMxN9BrrwvkqSMEY9o4uLAQRa2eH9JvU
Message-ID: <CAFi2wKboRtGWsDWvJjuWXpBQdKD+W4MjZdOdqerWEyWLZDvaaw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, joel@jms.id.au, andrew@codeconstruct.com.au, 
	lkundrak@v3.sk, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2026 at 07:19, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 08. 07. 26, 18:46, Andrew Lunn wrote:
> >> +    if (silicon_revision_id =3D=3D AST2600A3_REVISION_ID)
> >> +            rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_HO=
ST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_HO=
ST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> >> +    else
> >> +            rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> >> +                                    /**
> >> +                                     * The bit 14 is reserved in the =
Datasheet.
> >> +                                     */
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_SC=
U560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_MASK,
> >> +                                    ASPEED_SCUC24_PCIDEV1_INTX_MSI_SC=
U560_EN | BIT(14) | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> >
> > checkpatch should be warning about these long lines. Traditionally,
> > the limit is 80 character lines, but recently 100 has been accepted by
> > some subsystems. The exception is when wrapping the lines will make
> > them less readable, but i don't think that applies here.
>
> FWIW 100 is fine by me. 80 is too ancient limit.

Modified to fit 100 characters-per-line limit.
No checkpatch warning.

Regards,
Gr=C3=A9goire
