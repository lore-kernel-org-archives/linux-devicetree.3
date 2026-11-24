Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795555305;
	b=PaKa+bUnzgv5hps8AMDQYtZ8C01djLG0kOb25SSaWqRVL+nSUbqV1pcryTqd+CjetlsO
	 caXI9Xehcq+yQh+YhQfFhefTu9cUFomJrkQMCSPxNn1eLePkxR48fZaBrnQmSe9AlHdan
	 r2KN9FJLGo9B946yFumZsjyZ4IHqjX3lR480Mw4xmeLu81okZWm1+p/DW/Pvn+hyA8xde
	 UpbhXjsSLwVrPcJ2Z7Np9yj7XmuwWLxCVkHUcK3zZIuuRj7rDshK4+Z6CqiBchrZwtzRU
	 ueT+npXco3gO0OG9grGpGFVTwKTJBDEcaASPE7z+7A6fCrYFYjIFXOjxB+9on6CxkQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
	b=HFDCAv4hU21912L+dQqefdvw66MSi9d5WNgg2qlMEhpQqRMEzJ35XTuWFdxW8gGqGU6Q
	 nLfRXYCXNQ7CkF7KNfNPji3eQJ52mZa8wB3vDenAInawe8cUeyqiF1RWx4zFZ30pe1tWg
	 sLn4HeYn06ejmWMTHGE4+gdWGGy/eH/lxygujGJLmhjX3xgVA2kMZXgTkBSY1IqDh/57a
	 FNEnv1q/zu8kQGb03IWtZQSK0gvfzxA1nneDphgYxfUtFngRqlVUKjR8tXfzj7YXSxm5m
	 ihzDKZRphjRnK6Q4IGoF0AOzGH7k7UGul2pypvXlSl1Vn+Oqs+m7mVQ9CQeos2Ixw+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8;
	arc=fail smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE058606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE058606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YI+KcRB8
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b335ef6441so36334787b3.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555304; cv=none;
        d=google.com; s=arc-20260327;
        b=GZ83eZ2b+ry1rxhkU9mT+AnAzj5VdCo64rqbGd3q80LbS5QZNK9hyOWR3ougCYt646
         rpmSOYCICSTlF/y4RXMiVfcrkv75VC3V7v46uFhIkm3UA6sHU20FOyWkQ6iIOJLjhfrz
         HoVH2k0/5o5khQS4fgH8fXE7wpPjYz9OU+yv+ck5su7jD5/dHE5IepV9VlacTEqQ8lJZ
         eOQrFd7Xjb2eRM93OVRirQt+EJGG1YeObPjXMR2avxs9kl9wFNnmbX12lucVUz/tNZ/1
         FNCVVEE9Hyw/jt1hLa85buz5EG34Ne5vg41rIi9YGexbcV0B0DUrFxThZXD4IGq1b0Ic
         ijsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        fh=71zR9vwAGa6CEdWncJQmIiYLZyJ8Ur7JcOBhp9S2BxI=;
        b=VY0cGs1SbeV6on8iFCsFDIVtsl1pBhEhNw9gRmU21FYNWcp6sXvd7pfBrnflGa9En4
         gwuUbPsnaS+GT0n5QZZW9LldClaqeMSuTRFpMx3Dwa2tSY97kmivpIpIZ3ra2m2iwkdH
         ict7wHGSFcHNuXuGE9nfP6UgP+LJXBgi6D6uNDprqNPDqggCFfTloWf4xFZh5xED0a5n
         ULDkpv+zL3SCgtGZs4A9QFYC7iqXI/WdUrxADwMEF/OBmqGgmxBmhyWolB1FWWDOqis1
         uagZr9y7QXd4f0IKQKFggRsW8TXm1GirZJTU+fMEqJd7RU3l8JYtsJa/oanST7kOyXzM
         yWGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555304; x=1796160104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=YI+KcRB8+lAE9AY5pSod3xhKPrtxh2vzQXySdKNHgIsa/d5VW56FCDTYBIXj4Yd+vf
         XtPdVN4LsEWfC0NcrPhBRyn8Zs/EHBcZuDttbTCGszkcRGZIBfnuwTiNwLF88AuUZwsK
         WM4X4BboEaxjz/5rvZIfiY1YuivEiVlvsPjsxcqN2ljh62EKE/MzIuXiUEJz0U8Qb6bv
         yZtl8Q8TJ+Kd25h+TvhE7cPrN7htZZMDtHLRw6VpWyYBbBCh4Bi+H1VH5oSZQHANrxNv
         NZVvkw79EUuHYxMmw8Fd7BjHdqAliEIsrVaWpUaUm3dGS8wJI9spy8UVJjh5QnnZBv0Z
         qTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555304; x=1796160104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=oxmQ1IhR/xMqjN4/SpZkz58uG0QEWpzXb7ceNrkBX0uCcyqJt0t6cPuqCyI58+pz1I
         c227COyxLVtAMJGC0U1Avi3Z62vEbYEMSp4Y219c9NWlG7JMZFrB5vYp8aGS5aS5KRue
         Gienm0UJ2TztjLGukS76Hiilz3bMnLSRYuNI0X8jBPx8Bc79Ot6Csakj9+1bxu46egp3
         kyt186+oK5q9+D2ggWl8KWV6caE5jzle0pJnkmBuyKAouuWEHUfZEku+n4yG+Bdmtra1
         oty6rGpEaN0W00iHwRMBVYOdeg6yKPH0rv1UH60CnoZJr8o2OJMYdNFizIVcjsByye+K
         SytA==
X-Forwarded-Encrypted: i=1; AL+hErGGjuPFvSbd2tQMOwmqrcQtVO9DykzKHCzCEGya8eIrZghUCyj8CrIoL86cH8KA2BiwME27ern2/z12@vger.kernel.org
X-Gm-Message-State: APuU4Z/uymIoppPWDauqVXjYJsQygMa7Imp3omtjID+t2RG7BwSjH+V5
	G7hQNNJq8YzU9Fbp0I/DuQzk7suPuOTwTbarJ3f8K6Gs6B7ST+a3XH4auhi8bArcsCroD9H0md3
	eYisuAtqcNX1F53YpoSTC8KX+C3vx8DY=
X-Gm-Gg: AZFdTZeGMhTTuP8yBOnwmDp9aG4VnLyB/0PNkqn+F4NOSdbHnpzJ3pPbeTUgabcsJIk
	vibLpi0u1EEYAPUqLKlMd4yvmnP2UXJJstjCZpqplMLTBwLhKPKxebVNbcZsdQhrVbhvmW3JN8W
	C7/q1gj3JOkP5SXKRSVIZlAX+Uv3gHeu/MRvFnHLUMgjQRwofJnHapN7s6frhQfqPWXqIfMnujz
	zptwpKqpBSLQHf2TdQZ/ZmuqX4dZK5nuH0aZEOyVeMfKnLH9T8nYDFSPbK9Tjrii3JSdJPvqIRC
	4NIvvu3jlFH0S/A9acFOiJcqqBbDsDjkIeGzI1yXHvr5l2Hj5ZiVVCUi7fDYyUZRz0u3Hx1J0wV
	TumLISR2j/1qRlGLhRjDeBkOlay2a3FGQ9XcPks3oSjCdK3OXMvy1z+G3iYh/y5GPj8dmaw==
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b52050f0demr45322637b3.64.1795555303828; Tue, 24 Nov 2026
 13:21:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com> <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
In-Reply-To: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:21:33 +0100
X-Gm-Features: Aa3M54qIikBwR4PI-ZQunVxuxoqfwLNl1dfjIK5NjVa_KqUN1kcswl51cnQYi_s
Message-ID: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:06=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> > On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre=
.com> wrote:
> > [...]
> >> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin=
", "FIFO"))
> >> +               return meson_card_set_fe_link(card, dai_link, np, fals=
e);
> > I suggest using the "audin" prefix. AIU / audin seem close enough on
> > all supported SoCs that we don't need a SoC generation prefix  in
> > there to handle this differently.
>
> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
> compatible?
> If so I'm not sure this is allowed nowadays. As far as I understood
> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>
>    "DO use a SoC-specific compatible for all SoC devices [...]"
Let me use an example as I realize that I wasn't very clear:
  compatible =3D "amlogic,gxbb-audin", "amlogic,audin";
Does fulfill the criteria (as far as I understand it).
What doesn't work is "amlogic,audin" alone.

The GXL example then would be:
  compatible =3D "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin"=
;

And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
  compatible =3D "amlogic,meson8-audin", "amlogic,audin";
  compatible =3D "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,=
audin";


Best regards,
Martin
