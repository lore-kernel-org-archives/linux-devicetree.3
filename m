Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43B3BBFDD
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556454; cv=pass; b=rywRoUFrOfQZ7mu9Zjf0GmUPtxigI9rraP3h6tVHXsjpm5FMaIKz3EpZF0nDfKVLwcMFmV/wfjq1UJ4wJSZWpxbbkzkNdgd57PcRyXg5Nnd08iryNYyLkD4g8rKjS6hoCjYnDGNj9Bd2HVhY2kBZXR0oQsLNM2ZGkMgAD2opJIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556454; c=relaxed/simple;
	bh=r6n4V8oTIiF6Cc2yyAdGZUbNGGVL2QpLuXftiOlSQEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrhirQw42XWEmSxoO3wSK7Ip8xzjmwaJqM0LhlU1PG7laW4afs3aRh6afaMJAWt/UrKA1BxzZarMNTBkIHftAu84V1PBSN/83g2FteNgy2fU734JT2oYAcWkx4YooN4p0Z1zzPGbBQD2QT6ITXU+HzVXDWzT9PuD/ot60aCTRLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2MgLzQt; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2MgLzQt"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso638422366b.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784556451; cv=none;
        d=google.com; s=arc-20260327;
        b=S2WKPYUYcpCuIUl2UVQ/dxCZmeBch1dAyrRt6RmOmPE2ACe8YlD9Li24Mcr23MPvyp
         za+wEOXzFk318VdHlj81PJcY9n6VlTXDD6ZRyeBqA1joo/e463nyuMu+H4Mb3DOHAGiy
         tqny31Kh29lZyZEsGfpT0n0LxjmgLH9YRznA9CSeEUzQgnnpJ4j5G+aPnVOKnvq4cBYc
         yrlBsaD/Itz7vbMfWvlexVc73HmEoX1vsSuqSIK5mmzsx6BP7tZRZabUYNPKMvpd36oL
         36nE217zgEGh3aztRVK/swOZJf/gakze/O2WTXiY1k37X0DtI02XC+NbXKRVQdfG0aym
         ww0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        fh=WPgUbK8Hw9D63HWY8vC6YT3DN4TVLh4oOYVP2FLcnqg=;
        b=UCyxCX0jbJ4CsfU1Sxd5ZPQlYpflZzDjjhW4cypoTOUU9ZDqWgV4gSj7TS+EedAVRQ
         jP++37EaAddPd+d82aGeZzOBzVl7RGjPVGlnXYRMpmParI4L0wQQTP+dCRVtmg4vqNMu
         2RxQGZOxdDRgT4bXk6lYUDyqytc+S5CNSVwfttyRlQqkpxvtGI3v+BTf4sM/FfiOiPId
         O6l2B3oVoGrkfTpG/8n1xpoLdFlpCtwRdBuwKVC6tFQbiKA8jqm1e2x0iYi/eDp/U0mT
         TvCjXAZ3Y+RhKvQQkuoKR7UnMOaPXk6WJYL95/TV/lj+vs6aghuKjluDCkDy36Zv35QF
         pD6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556451; x=1785161251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        b=a2MgLzQt3CGzGz5eMCYyv46AMhuVNalm1K4dR3Xeg9zOQXopfu28uSd3Dn1MyG+UDY
         LYpOHmPxBsoaN8546q6TXqs+nKWL18NMO3lr2Bupq5pBlbbYXDpur9PaRE1q9w9pPM6K
         AEW3veYlo92OAzIkA6CO/Gr94w4wDHO+jtBaD3tVY1cIG2MW62IEUP3MVFUI/xLQnpDr
         tSMJ1bDo2L7hwBKlwSJuasLfXQFZ5UZ7RdrND7BAzm4QXHB+LVZ/5QEAwP+mI8qnke1N
         /2OoDp7r6SV/+olx+3tY3o11kmS7Ndwsg3xoH8M3sT+Gu4eqZwkWQTwh8ZADyrwc4VAa
         gTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556451; x=1785161251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        b=Oh7r0BoaeKz2QVsoVUSmxr77qwu16Sl4dVKSVMvJQgcX0P2adx6rvKgzlr+znurW1Y
         2+EswJVdAjqo9y9sO6yey1GyLixbc8Qak0Y9KNF8/HLr1dK5mR+WfW/SGbjXt2LTrTDR
         0OKQKcV6KcGnT9LkLvCYmoVWsnvgoxmXRi/2T6sICY+QLgh8TPIzSCeQmDCRTFDOk/7b
         H59wznXki79LVNIhMYMYBnORwQ3UTWSLXUG1/R2G3vml0MrEgF8w0cimv8a5mQFTF1e5
         AunDHOONZB1FVQblhWMaGoYzkY6g0j8Oq4eSZ1kIL6WeMJ9w9emZH3+ECLgKZOcMKBCW
         JP4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYysJyrOc2X520R+a1jcxi2k1kZDkbITTl37cz6VDnauv8K45zhiZtKVxYb18lnTuWpBdsjiKrSGrF@vger.kernel.org
X-Gm-Message-State: AOJu0YweTL29twAYk339KJuRRKk3IjzHrJGIgc+WVKLxfT2dovs3H9YH
	aLyaljPY44wc7znyAvTfXnXD4ysyrwwLxZqAHz2vIeJMIu5FOPdqhwQJOudWQhn4hYtfiKQeWE4
	xhJcJwyR0h9A5GPYrle/yj1izdwVr6x5VWusFpnw=
X-Gm-Gg: AfdE7cmZe4g/RW2VNXRBc8aBHYAorzP06TbPOEEMKYAljHTinm0Cx129bKoBj8FtDmK
	mF2jTU483OyHEL+MESNRRQabdUV/ZjS9eolMH4n6qjFlUdCzhmn7nzrChrbk7bClIGloixqM9OW
	bJjHMbNxWQmiqHJhdmOArQdtllB2zDOOgXfUFccqKEtr9J15EM+8ygSh6n1+pTDLq2uxB6xTQSH
	o/WiGXuWy0y/RF2vuIwtq8K3zFewXOtqV+4ol9hmENygt1/KrLWoD6FXCMvgFp5IgTHbt6LCbM8
	Ko1wIYKfVHdCOV/hllKkA6rLP+0h+UK2eSz6sgJ7nZzip8Yri7+x
X-Received: by 2002:a17:907:c012:b0:c15:c3bb:c90a with SMTP id
 a640c23a62f3a-c16b47c7292mr550030766b.35.1784556450739; Mon, 20 Jul 2026
 07:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718215632.3295049-1-egbostina@gmail.com> <20260718215632.3295049-4-egbostina@gmail.com>
 <20260720-huge-sturgeon-from-shambhala-a1bdcf@quoll>
In-Reply-To: <20260720-huge-sturgeon-from-shambhala-a1bdcf@quoll>
From: Eddie <egbostina@gmail.com>
Date: Mon, 20 Jul 2026 17:07:19 +0300
X-Gm-Features: AUfX_mweWNBqk7caXjK50S4Mh9MQkC1xza8VdHGojIe6ULgydOnDi9gkyNgr6GE
Message-ID: <CAEFOc61Tan85xQhz33BuGSnJHyACvjRc+6YMFYav85CzxMwiwA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: leds: backlight: Convert TPS65217 to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, dri-devel@lists.freedesktop.org, 
	Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-omap@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
	m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 09:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sat, Jul 18, 2026 at 09:56:32PM +0000, Eduard Bostina wrote:
>  +
> > +          regulator-compatible:
> > +            $ref: /schemas/types.yaml#/definitions/string
>
> You should not need this property, it is already in regulator.yaml.

I did not find it in regulator.yaml, or in any other schema, but I
found out that it has been deprecated in 2012 by commit 13511def87b9
("regulator: deprecate regulator-compatible DT property") and was
never carried over during the conversion.

I agree it should not be in a new binding, so I will drop it.

It needs a dts change too, tps65217.dtsi names the children
regulator@0..regulator@6, while the driver matches dcdc1, dcdc2,
dcdc3, ldo1=E2=80=A6ldo4. of_regulator_match() looks at regulator-compatibl=
e
first and falls back to the node name, so without the property nothing
matches and the regulators stop probing.

So I will rename the nodes to dcdc1..ldo4 and drop
regulator-compatible, reg and the address cells.
I will send that as a separate patch in v3 along with the other fixes.

Thanks,
Eduard
