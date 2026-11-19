Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795074960;
	b=nnZTHyym1IMbrPwFT1ZJ/fR9eFkH41lnYYD2myCMngntHfJE51H+5qAzGAANlYrFPGkU
	 5pBTcpDJNnGyHv5o7NyoPh5IhW1pzKJ7/XlOk4rg5tw0YEGwKHBatLs5LCKAmq2eFFBLY
	 lXGSTghIMW8aB/wEM7Sn2ik+3kp4tCLmkcR5pwA21+47xVKr97k38/oUMxMsepMqXVpnI
	 UF2zVr9daj0I9lLRVIe/8Cu/GjR9xzTGuti2EFtgUVPCe/nitCOASgt1AHn2Wm0ziVkR3
	 kwWgWawELJZ345H1sadg3rRk514Qnt+5Ig0Ha4WXOeiJn3SSstQ/YaipID/QiAYUxKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
	b=UUc/eMPwjIraEMJCGYy9YwqT2goVD9yWdlWojYHqH1v6Mjnc3bk56uQAOtvwVw3OjzGQ
	 bXOpxJLLetfGIQrRd4/WuEQtAdIfP7pZBVgZqckmaJEsdHLmxajpn/OrWrJSI9nbcZ7gX
	 88W9srLSCimTVI/DMVUEC/NHyLh6TV5B7wj+XhsSLRGdBIgoC2qwJRmug8Ly5rY4WlFEr
	 /AIOcBdukrqUCOSlDwFr5MIQmfrreliyKQQPdrzEbBsSSUGoS0aOWvPwNgtFEbNAy/Ds/
	 QA+5kwovpd1Rb64bG+NZWdvoOTsFVARtchCMnoa0o6oNZ1DoVC5XXjxmjA/mL29GJEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PVYFBKnq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9D606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E9D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PVYFBKnq
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e04eda5aso16414897b3.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074959; cv=none;
        d=google.com; s=arc-20260327;
        b=sqNR8SnlrUqv0jgFfWC69dOKEvxsPkhHjllobVbxzExvYIICTnEEo7r+eULyjgrYah
         0eQDrqmgtpvtddD1aEGeatTvXyCEHu33UuifSLW8Nk8NPTEhL63wBu9HhVIzXxUEs+tI
         6rAoo+asqo8RV0yKNewqYlhXHtOMWeeUAI/VHT7veRmwngwG2F4zE/cXttQ06I7jp8fP
         GP3LEwetYLLhiNnST++9FXa/I/WzWsCXof72QNzpcKblPlreDV+/j3eVkFGxXQlVSWwk
         tLGxDbQvRpjaGbbEsihNnyzYczW56pL+I4hm4XeMcB/ZlKwehicIopXK3mw5daVJZfl8
         PU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        fh=a4oW9e39+GvCMhzUyLmuuQ09/wuq/RrqTWHPmhXHNsQ=;
        b=qD3YycKPVMLU6UrAB9UaACEXyHHy+8GpbtnRca6kISjLkybNBXLg8LvFs5gHhQ3tUv
         ob85bsUABoVMO4vIUrtCjrWMqBC29bNXc8VJukyOgP/glTqCch5pCTew+PrUsxXa7hgG
         i8Ip+TnKOWKAQ3vVAmzEeunp8hkbjrjZiPLGhjqralDSTns+UBZNl3zykxXwaZEaVSvb
         JrvGHoTWG6axekn3Ekucl+jvJ+WDZ660z/N9o0gpa8RCFtig920w2W40UrZ8TNcE4TgJ
         eaTsuCwB5RXx735yDrfVZsnJj1G5DsgZL4yYvJMcn0nbM4W0JUxqUX+gjVdme+nZ+zP8
         YjXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795074959; x=1795679759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=PVYFBKnqIYi8G5pSLWwcT7zZHYcZEN1a6HlNWUl7FyInIBVHF0nAHNB2clR4xpKZzH
         xxMZGABs3emLJXMqzBtBvGDG69uW3bSbCCT4Ep0bD8mq32Jtv0YLIYY5098DzRjRUfYn
         C3bHdetInuTfQnx6zYaqGkm2PuHd8Cm2rpZAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074959; x=1795679759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=NzJunPt34xFNsODG6Lh3MM9cFQg4G9481Sqr7aRNxwp571bK0niBPlXiCo/lTgjPtY
         2k9UbPu2x3FOnFKnS8boFSUcj7Vm1gIFYrTwowc64R/DRkhd5Q8B1VWUodfGNj+lvwgq
         qc/LWv8yfpmrjFLipkVQtG729rPufU8PAlVJjAJ5vcM1lHZG7o51OaHqZoRpjIH9SJmw
         2uqzdddD8Y6POwcgDi36JkLpS4GmIJdPZlgQSkupkkGr7gBtDsCUB86BSFNvqLran1xF
         xi9bkFLZ3TgGnXLkRUjgb1vzo2ZtsJggIAwqp1Md7O4+oDv5rnQyVC0gUerxhEKS6SLK
         g2gA==
X-Forwarded-Encrypted: i=1; AL+hErHhDi4BjDIMyYsiREguEyNggCuOiOZY1Nep25B9mcKtbwB2o/+/1T9VicMRB8pT7Kkv4BhHNPisw5Ka@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y/6i7IyLZFCVTbPlEUjmzGNEwEnGTcS6Ou/C7rW9zarOUovRW
	0JZPJSAtcgWukvxwqy9WvK3JhPkaPbilsGIfSecPFPGHKLhKb/ivZ64KnIlEIHFwo5k87cx17KU
	aVmubjFqUNj4od57A73z58E7rV5mUKM+vucH2we12
X-Gm-Gg: AZFdTZdgW9O0kzydNuQQfV25fctcWHVfTdxqHEqeeite1vyu6NzuBA8ylExKeYZBbno
	KDvm7X2V64/bt54zYRfH8IEnvQiMChS3UdL1aHeTdDdeXlIo/XF2arx7UZTlg+R965zIOgeLIwc
	EEi3kHgeSqCf0bLhzERsKxxWpm6HXWaBA60o6PiMVlkjbMPraok3VoKeZldOWsFi8mlN0ifDusR
	c1JI4wrBzz85+//oU5TXT+cvcpNLaeob7kSaqoRj2q+lKxOICuZwm6Uw0JQ0r7CYGVnTnWdHRrE
	dCD60pLBntrYbZfI4i6zLb0FpqlmFIMbERaxN71setV1EKgbmsLW+BKI7z6qScntDy0pP1oLgGW
	jqPFeAsYQ6ppQiEVmK+yJcWJcdKM4RaMs3XPfBw/QJuSmceVo2qU0AnwuHR3hMavWPls=
X-Received: by 2002:a05:690e:4853:b0:67d:a059:2f39 with SMTP id
 956f58d0204a3-67dd3f1b3efmr1369617d50.21.1795074958750; Wed, 18 Nov 2026
 23:55:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030103418.2355854-1-wenst@chromium.org> <179491350817.164578.3923681659802112857.b4-ty@b4>
In-Reply-To: <179491350817.164578.3923681659802112857.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Nov 2026 15:55:47 +0800
X-Gm-Features: AclHuK_NKKojwe2jAIh6fAUopYilD5lO7S60sKZvTblPy9cW1Wbrg51aFpv1c_s
Message-ID: <CAGXv+5FiRyp6MzTdOo3KygM1w20YPD+eCG=-K+VVbPZUYsQQnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay
 for MT6315 regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Fri, 30 Oct 2026 18:34:15 +0800, Chen-Yu Tsai wrote:
> > On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
> > missing the regulator-ramp-delay property. Without the slew rate
> > specified, voltage increases may not have settled before switching CPU
> > or GPU to higher operating points, risking undervoltage crashes.
> >
> > Add regulator-ramp-delay properties matching the slew rates configured
> > by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, an=
d
> > 4500 uV/us for Vlcpu and Vgpu.
> >
> > [...]
>
> Applied to v7.4-next/dts64, thanks!
>
> [1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 reg=
ulators
>       commit: 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c

It looks like commit 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c ("arm64: dts:
mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators") ended up
with the regulator-ramp-delay values for Vbcpu and Vlcpu swapped:

- mt6315_6_vbuck1 (Vbcpu) got regulator-ramp-delay =3D <4500> (should be 80=
00)
- mt6315_6_vbuck3 (Vlcpu) got regulator-ramp-delay =3D <8000> (should be 45=
00)

Do you want me to send a followup patch to swap them around, or do you
want to handle it and fix it up directly in your tree?


Thanks,
ChenYu

> [2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
>       commit: 04560888cde5fd8adc325a6ce47466f80b8c668f
> [3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
>       commit: 929638df9f3b36665efd60ac71f1eed4ba36a0a5
>
> Cheers,
> Angelo
>
>
