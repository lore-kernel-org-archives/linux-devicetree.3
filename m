Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426046;
	b=j4FuYLaNABxLFX4W/dHovfpsJbGSVZb4LF3a2JwFcPy3tGuaiFmhYYHVsxPQhOcC2TrW
	 X79VmDzJGAiZ3HH4fwsERVDyLM2g1Si2o8LgYd0tGXS+SlZUferUZLcucSDEENlrAI2Ur
	 RdVMJVjXbj53bsJPmm8/3hT3npUYQHH22cwfsG1zIx4fGr2mmpzw1C/hHInhy4RfKUoIi
	 nTbAY4kpSf3ldQcpP7czbDBoUpEyPRiMvDWG5ekgzy7N3fuCRvIqIBiB4TUfc89oVFDKi
	 L3X7FFBN6H4pvpwywGau3cblGx0yETiKOZrUymZQMJ+NdYkh33eGxhwQWu7FJVVeFMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
	b=WT5dzeac+H5i5OoR/VUkrMJpuMYuuwfHzABBL14yZDakXNywejy/ooS8iQrFzDtpGd0q
	 Jzqz8Ej26JcrX1PhdIatCvzgGozH9GMDV8BZT1vt1CItp2Fb9itb+5TSpmXnGII0Degne
	 gytErQWsPpF8mKoqDZagjvBgrHz2QJx0vtpg2ILyr0FOQ/3UVmDlGlLlVPQK0kcovcjck
	 fYJnXvmlQm47yBmsaRGWTLdg/WxL5AXvLuRBFjgoJNg3K9BQDuO/KUBW84DX9Xrk+sQQ/
	 KDRpAEklRvyHtHhnOvLhjKoDaOnHnezAPsdBqZ9I+5gONGdq5PdC+IXKw8zC9tATDIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93761606AAE8
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93761606AAE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so5872187eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426046; cv=none;
        d=google.com; s=arc-20260327;
        b=IF/zZrUslGkQ07d/KkJ91hebV2+oReidiFCQgd8EaQj/1tI1gbjDxSvYGwqeS2AZV0
         QkBip+kIut6Uyj0KdmTaG7UnZ7RvWBHZn83i5R3D9KqELZ+eq7CaQ7Krvy0dacBgW6LV
         nJQr3yKVwCb2Dn3Ddv2Xe64bwVzIrXX3I+uYr0TS+yPXwKmjzt0rtvUJwB8ppIBkWU5q
         +cfsEqlktD/nYlWmeXZWgtr5kXpOVgdsIAV8ixex9O1QqGzCWhDViTQ0FQIiVy4Yn7/h
         FPTqtQJrP7Aky3dXRTOOf6VYW2UEL0jEpjrMIHdniBsGAyKdCRu+c1nJnn5i5Cqzd1cO
         Ko6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        fh=a8Tz+LzXoU8dkumWvX17DO/EAk7+D5fvoi5F5kl+fzc=;
        b=m1rZGUsFI6R0SeuNNvCDTedOcawRvVo8SbP6mmM7FkWtDuTdgGEWg8QYuexINf+6pH
         wAIAGUUBer/K1c4vPgaSv+lwJTMBGlwj22l8Tvmn8C/pTNW0ZvEFwRLnnf0qusVrLBqE
         jRVepdFsfE85EDfc5GAn/XV3JKYwq/Y8dc7Z/lh3i+VxRJPdyWE9vhIsRMND2u5HMtMW
         T7t/CzTIceggz5dCT7/jOvJE4JKLpKAlDeoHa6DmFRPy2Ilu0Mv2u0KYmUPoKcGZ2F4N
         1BpHd+RU0gJOBDBnHszixto6mZLqypD0XReIxqVBSScqYaiIFMrRZ+wY8uvl+Y8qkfdT
         eqyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426046; x=1793030846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=IoMtSIzZ9V1R9FIBfWfd5i2fmLTABAnN9sSr/jsrn3j1VU7yRqgsgxXCplEYoNgeRO
         fUK7dI1I3ae8Eb5LFLibzs1NebQxGtWMGaZRJwucN5STa+gRLx58xI0k4HYcvC0Ye/VO
         Keg80OUbiPn9KRWtob6unTbO9PzP1havbwvm0+KafAeqpiZiq1x9+gzsKwBsN7YRHDGE
         +fao+U49ElPaA2TyrQ06S9zLUjdeLHWSlLv+zvUArfRfkzio6Pc1vZKN7iBSe0lk1wx6
         x6BoiIkbWUwVBbRcQj1KivctyNFUIvn0/3E96/KPE0hTBbC4wX0zPb3IjaLQ4+qdZ35A
         jw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426046; x=1793030846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=VK3xz48WxlqZl8KuqtWA+kpZHLFT+AnAmpDlpdN/fCDO6Uc4YbB9HtRQywGOOeQIWV
         OzX/PyNtcJoh/iD2oNCQ2dTGMNAV4MzDD5XgFAxMjANVzui4MzXpSSSYakxMNoS5rMLl
         d59uTQluB8ShwR4w3Dy4yosfuYv7bDTwyltt/U7f02loz0yzQcCXbJqQPkq4mD2uCfWf
         8ZuAhscB2JOyAXFO9n8oeKpCygm2LneBWTuk5bHcQnLZNZVI4/Ws7NTmIU5kJRHfM8h3
         OjWOzHPUTskiz6dbgh0o3EhnRfJKptjQrfEXJvMDtWkIY48VVkLcQPs1vmUaEpWvTi94
         MikA==
X-Forwarded-Encrypted: i=1; AKwUvBwfGN93BzL6fJx815R+tn64955CvZbkh2vCZSyOAM9/+gGvC8uK1HBzhIgJ5r2ehlvgoZaxVJ82U9jQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJz/lFM1b6NBZAV8i2eFdu/CQxgHyb5AOWUNgj24bg+Z2SEJ7QX
	VKPO6C+HZX7oyxG/JBKs1hn+TbQe/M0p+76+HM//ADHZFeGEXJ6yYcX+AzXmhcTCYhmf8V9LLHA
	0gK9wIAJikzRAxlxazMxREyZHV4ApVYE4JQ==
X-Gm-Gg: AYBFou148OeIJm+Me2uXd+mxjbJwV7fG+0Gha8s1j+LD6Z86wUgT+Fbac/3O0wArAXO
	B4aal3R9ac3QegLceCDsxoJbKX7IphQQducC5OADxyIEkvCwcYoY5lfRe4QYYurb+V9VS0XcWCb
	/NLAVl2yd6cOELWzKZ0YQEfJROEVlabFYsUfW3qIdxXVkHjfTlsmO+8MVoZEb33w67J7nxQ9QAL
	w0kiFBzJNYDqsZrmDLIoIuhDQHsfuGwqxXSmmpB3On1ITU6/9LipWsExcX0Nh4Wd5bP/jUMfRUX
	frrK2cUtK6zhL3wdk/A+XmEQD7ZlEOvstASAo/DkZKvRePVMlwif5EflPQYUO1juXqlLdvNtaer
	o1H5c/h7GiGQC
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id
 5a478bee46e88-361a2c38d17mr11330019eec.33.1792426045527; Mon, 19 Oct 2026
 09:07:25 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org> <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
 <20261019160202.GE2663669@google.com>
In-Reply-To: <20261019160202.GE2663669@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 19:07:12 +0300
X-Gm-Features: AclHuK9VJmJMQJiC82ERiz5L-8HMq7v4t7pij145Dauw6OWtgiTFIN9w7D539M0
Message-ID: <CAPVz0n2oCKyLKG+pXFw2hAfMTXXSjrwwsFRrhzC24d33LOi-zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
>
> > =D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
17:52 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Wrong subject line.
> > >
> >
> > What do you mean by "Wrong subject line"? Specify.
>
> This is a LEDs patch, but you have incorrectly tagged it as `mfd:`.
> Honestly, I would have thought it would have been obvious, hence the
> lack of further explanation.
>

Uh, yes, I have figured this out already, but thank you for
explanation and patience.

> > > > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lig=
hting
> > > > Management Unit.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++=
++++
> > > >  1 file changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks=
,aat2870.yaml
> > >
> > > [...]
> > >
> > > --
> > > Lee Jones
>
> --
> Lee Jones
