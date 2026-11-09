Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794204926;
	b=4Ec53zRRD64Q+KsRj53r6hZibMXVZ5s4OdWWqhRbUa6MZSbZNVDRrknPBYJ1COhtrqEu
	 isqi2ZrLH5R82OF9x4yFYUbnDvxP80qeyALPBXiZUUe/cN0i+7jowh0F4HRShjbYdIjxC
	 Dlvua6nuWjcFMEYLrQGYY08wXjrVVGYyubYckmpyxKUInW+gotbTioeBi5VUQ66kyGDUn
	 cQogF5zfpc9OZWSBScmpQLxJawr6B3/4vEOeIrm51WFh7oAYGvjFe7zz238KLB0n9+2X0
	 LSsTvtcT0tJMU52dv1+NZ73N0Fhw1vDNalLsNLB6WuljTMgxYUyNUQBvGNjgYyA2nDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
	b=pXJMfVPvAK8BaVgS6t7euEOR2vbd1sL/hX6HssHovgV1hCy8Gwe2kXyYZRPqLiK0p/6M
	 xRYqBIqfYZR0k0CON7JIsWWXlL1n0q5JZN1XFJhN3PosM8dnrlbIEoBu9FgLrGbC2V0nm
	 sfdxePmqAQkj/5yLx0Tu+G3jW2YOBd15YwJo4Qjt4vnFvDKdDpLGe/X7cLQl+8iIg/Y4Q
	 lmayEJf3SCwEOvtr6anZNhoBr8dixxn3c/TY0KR5GYcEsm1zICLEagGP66GBpxQ9Nny7R
	 BlcL+9RyUQg+NM1/TqFPoQt96C8BUbnsZFsdi8ElqlEtWn8jtq6woaRDcugmQ8Uy/NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnjAxhbN;
	arc=fail smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE6606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnjAxhbN
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso84451066b.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204924; cv=none;
        d=google.com; s=arc-20260327;
        b=pcA3gtVLOEGc4AZXOjJzUmPxRg12GPP0kxqj17/9jUC9mho9sXkVPbUYKBla1DmAID
         FhZm6CIUl/8+JIG0blRgY/VcieB84FAKv53PK3s9buG9+Gfwmd80Js5OrnQpNhoUYeDU
         HJSdGFmlNX7GTDhrRKcXEe9WlxOr+p3p2KtmfmWNc0/r8bu15V5SqJon1zoz4nXxtSW5
         lhoDqsFNMq5x8NIv6Qv/5NoTA719K72UzzRf4ZXTKF6K+BqHksPQy7AxV+7nzqsRQn/7
         VkH1xoync3FsKza8KiTS1jfxa0uYqUqI+gNYbp5Fj0bpi/bCx2fay8gTptowvnkT+pR5
         7A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        fh=ZpA30xOADSTMSMGbOdQtZponFHNVLAzZeu9dwMG9XCk=;
        b=DkX8mrUIigb6x2SwutSe2s1stwBRF1sSzCzdrqRdGvJ6+J+CZSzlDm2hHcq9MTrtMq
         7ctQeZM4jNOIS84qr8GnI3NO+44DlzfBcuuW47Ptjs7yOg42kbQq+QHQTVY2eDtT/zlp
         K2CUHX+hobIfdGeaBfTOx9GJ/iBxRHdj/LIBxphXk7DCX5C1mMV+HkKU9j3A0131e2fh
         FS24kDHb+7SZ2kn3rQJ07xQIK8++kiUNubztf3Et5xFC6uUncwML3EoRjb39FLhXDkZG
         7qgVPe2IlHaJMPzmlFwoj7sTFh/lp/l+BvU1fMPh4KsEV3/+IDAmAv1iw8DHSXT/kYvY
         K6Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204924; x=1794809724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=VnjAxhbNIjKY+l3FrLTmF03OxcKJy99I711bzC3orIvQ/IyAT8tKQ1hKmQCwmbXoPR
         NGkudxmIUppfph+Fay5VwyDK8YO6d5x4aT7B195TrKrr5HfSwfg3KS7Q+PAYuhNhEPiZ
         IRenmIGzDopf4rYBDPbHVT/JQiS+FFrkbVxUynpEC1iK/+YOcP6QSwUx1yCz23ybDlcZ
         Y0fYXmWkLUJ0pXjH0yv1XqMBAArtkh8qyC5x2xrKIwOCmyiDeMmIfSUS/ABWouNZWEaa
         H12QVsoGGcFF3yvgGG+8UzKvr2Y9RB3LSzfnt0J6ZOp0TL3PJ3H1uIJuyrSmZaRtmYi4
         Y3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204924; x=1794809724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=h6/d44kZ0Z4r0aGFm8ca2hcCxoWVKirwQQSEu+Zz21PccmerPUA0E0P6EZbpYuqvDW
         lMpxiASc9R/3Lew9aHo+XppSoBQ+2XQsEdug6IddnJPLUhsJYyoHeMgaDDm5wzyBJ/6g
         J+AY17dd6UE7Q3ZqVc3kBcGeeexk/JsuzP8N1943NJusg8CMwPbL/C3uvQ3F7gtDMrsD
         bYZJpjiiozBrWAC0yRRg+o7ns8sq+R8RuHJshgs89Q2PR2SfIOXBKid2AxxOniJ7DTDP
         FWoyJV3Tp+UW0uht4fUNeFceJ5s31gOGxiQFsgMDdL8ZpIEGv91VRN7gKSNryN90SRuP
         XPGg==
X-Forwarded-Encrypted: i=1; AL+hErHMwxYvl4nHAMyReTBI/C7ZnBk/+n90oCOOJSgEktz8/cgXxnea9XoLpPLnki0RU0VKY3V2DUaYf+OR@vger.kernel.org
X-Gm-Message-State: APuU4Z9FRaERUrw5DS4+soOoYY1+0NIXkKk+wGlivqJqvlXfkzoPxukl
	i+j/bg8PgtP263sphHJnY0FBFIr9x6cRapTcOD+O8nl6Ui0zVuRlXC4icKMAVZmrbvtOvvqcDRy
	Dzo3TKAa9CoDpwjzd2D+nmdv+m77bFCQ=
X-Gm-Gg: AYBFou19nXeRX2JWa+b/FGTaRBwasizs+ezU8bBoC8y2lBpucJNRlyqBzjv51/vlnUT
	DwfWvB4NG0Dwp2R8SO9mFcO13L6J3aQV7ZPps1VpB3Nr+/IoN+bu9C7hf7oG4kfv8SUfyj0j9US
	TZQHMtBqq3RNiXWv7elJ5EU9RksXWiWvRZcBm4nbfK/FW4Q5ldrx0bU68VTk2fetsdvGmQYlVwX
	GoJtwcpYNcxKgRu4yE+hdODOmy88j9o/ZmRxzoGwJL+dwFsWqmAE6YVpKR6ROASjPfYc1dRkaX1
	Qd72sEnfMsgjqJUQa/V4v+WFWgASSh9a3aj+YR8oq6vtxy5wMYzasz2ghZfDGK1A+Bye1T1ghTY
	YUsJ3YFKjK2OxTTVUlG2z/msVAUrfX1mg1ZxQIYKATq7xJSglckCWLrhyZqYvuzIaXEuSCDm0aY
	GN40ytreQubZtpt0BSQMjydbsz7ZcuIFjFUU2h3n6jSple4co8GY8=
X-Received: by 2002:a17:907:3ea1:b0:c2b:4142:2db1 with SMTP id
 a640c23a62f3a-c4d6d842e53mr191712566b.40.1794204924269; Sun, 08 Nov 2026
 22:15:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108095634.100517-1-clamor95@gmail.com> <20261108095634.100517-3-clamor95@gmail.com>
 <20261108205143.134d6aa0@jic23-hlaptop>
In-Reply-To: <20261108205143.134d6aa0@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 08:15:10 +0200
X-Gm-Features: AclHuK8Qn06eeEYq6AauLfpWkIVYBvVrCQiH0heTOHXTTI9POYlOkAaf0cbYYK8
Message-ID: <CAPVz0n3uRoQAN=rk1dHyHMFxueK8Ry0UsDxkxA=jzgGP7Ykceg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] mfd: max8907: Add ADC client support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:51=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun,  8 Nov 2026 11:56:32 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index 35b2ede54f856..cf304afc782d6 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -153,6 +153,51 @@
> >  #define MAX8907_REG_MPL_CNTL         0x1E
> >
> >  /* ADC and Touch Screen Controller register map */
> > +#define MAX8907_REG_TSC_STA_INT              0x00
> > +#define MAX8907_REG_TSC_INT_MASK     0x01
> > +#define MAX8907_REG_TSC_CNFG1                0x02
> > +#define MAX8907_REG_TSC_CNFG2                0x03
>
> ....
>
> > +/* Regulator stride */
>
> I'm not sure what this means. Stride of what?  Seems to
> be some offsets in the register address.
>

Regulator register offsets.

> >  #define MAX8907_CTL                  0
> >  #define MAX8907_SEQCNT                       1
> >  #define MAX8907_VOUT                 2
> > @@ -165,6 +210,8 @@
> >  #define MAX8907_MASK_OUT5V_ENSRC     0x0E
> >  #define MAX8907_MASK_OUT5V_EN                0x01
> >  #define MAX8907_MASK_POWER_OFF               0x40
> > +#define MAX8907_MASK_RST_CFG_INT_REF_EN      0x01
> > +#define MAX8907_MASK_NREF_OK         0x10
>
