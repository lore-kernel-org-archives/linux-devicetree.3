Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430E3A875B
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952116; cv=pass; b=jm//x7t1hzawDwv8NhOCEj5CvPp0Ec6fLyfS6MubuH0Rebw6Lay2Cb+htehO02LdJb2xk7ydB2OHri/ASoLIzV7YXFmdhBLAvnemrsixTc1YresECevotIY7Q5ErlTGq8m6oms+0SKqyRR3F5X5ogaAchgZinN0fEI49QjgBjS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952116; c=relaxed/simple;
	bh=+BfKSKWqlI1AALMWRDnBgfbKxVWZIsKfVTDoY9LW9As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQ1kYfqXQHEm+0Hx8xgojK55Vr2dEaShWtdL6U4fJtAR3tOuA8gOCUElWGVUa5gujC+FtfZ8sMMuH0r7yCHumJV7MnNaVzc85mWjOocekfDQgzuzCHdIFo6WyJHJ/+km4jZJ984VIrayutbVUVpkaOyQI+H+1J32oGxK06Chypo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5BZFsRn; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5BZFsRn"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so6506737e87.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952113; cv=none;
        d=google.com; s=arc-20240605;
        b=GTbJbva9M9qjCnw0X/Vvy0oV368DL+U050BKk+/j+bvmXQnyHlFOIRxRVTvGtD1Pbw
         Ud+S2ad7tJnnFW5fp839taDV+OrvnNsxou45HJYyvf12POsVgtMkn3pJSKL/6Cewo1IS
         zuj7QCs+fNghGS9lDSZC3pyQ2b6UWwmik016VgeiXrQ/c/Js3XyKhvNONCMHJAce0SeD
         9mjG1Tu7TohRl8vpVQzUoVOU3DpPA4t/XL1HNjqhee4PSP6ASWrRbyiEZMKv1CDbh6QD
         J/Xd/7a3eBMDrJ/zV3Ef6x6dSulu2WD0TPwkDXRmT3MkrwfOoxY0woRIN/UKVzOREcIN
         Lh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        fh=dZ5UNnYbxc8AmMqK1VFwbGXWqvzXiqZRZ+7Xhn5Pzo8=;
        b=i+7oVNKI6xBJ8OLoV2mLu4Xw2i4Ur+1GGMqW9ynWGoXA87wDyj+Qyy13wWMFzTI0Kt
         eZLOu2//TS9lmV+S6NKIE8vLf1OBY4dR02rbhJQHGa7dzKb/hkWqaC+Zi1lGx31s+G0j
         wg7sJK7H5wzUMMqABIV/vNSLFL6oqmtI0sSQLyH/JB25ZwKi0K6j8Eheq/qU2CPlIYPx
         326UMoEUryHior8AIj4gVC/zkkqzOKQAnF01Wcy1vHFrWr7zW7mL3zLhJ0BA1Bav8OoP
         l93g1hN7C3iHnFWl1inoyhJR6G8+/fDG7ZpCSl4OZr/hIu8NHEHeEYF47A8IRmTA1A9j
         hNvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774952113; x=1775556913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=e5BZFsRn/cfpSycQzHhx6SgKcDUhEghskKFh5tjggHr+u1Q5FSqdzgqusYEcSCjvQ4
         exY5t/ZwDAOFgB1YJN5OD0uSazh0rbi1aaNP/EzL2I5FVQPPaHYlBt+YICa2lHtBJrzo
         sufMri1ejYJf8oRnZWnESOlRSYZcHIZ8UGZrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952113; x=1775556913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=oI51NYOqJZatesHlh1PTOC6ciJup5LjNjkIQu3Y3IDsC7H84gla4SQ73WiK50tNLYM
         okA+Pj3WuEVigntOof4tUl0M9C9hHzPieO/vTHb5Msad7Uq7jcMqZimUqGgkZM7NuPoW
         RufrcmdcCV1tiMMqGCACC9WVh/9L/3VHIHcBh9UuLB9+rq7Ml4sXx4JCyuOHcsXRbV+q
         NuFqJMx8kjAgcbSrWamRrYS+Krb2jzmdjTZm3nJYtk8IKmvgxMYn7L5kfF0vjB4sTMXk
         wvsayHBkNrAy9UEv1wnxy/SeSvx+H87ey5yId8l8gbLt17/r7ZCL9JPcnXoc5ECggF+A
         8fhg==
X-Forwarded-Encrypted: i=1; AJvYcCUbdogPz4tjuqJ1uF/SA3wOPadZd01B0G1JWnZJCDiAoQDeRpUtEyvyx7HmSTiQmILqfT/2jk7UnHj2@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKeRotOi3GhQ46tFCF0y26wnYdSv4L61bZ1u9r1IJqE8m0lCn
	wyNdC2B05ivk3AmGBmNq5nE294COyX72sNdKVWeafsGTqdGxSTqeVRznTkli7SZAntnkD0zt1Wf
	1FAGVy3Z3kNVmVNmbJcOvTds9Kc4qngQsuHtaT+j/
X-Gm-Gg: ATEYQzxitsneFEDstpbY52YS8B8NQq1/090obFX9T+yMmEXLJ6lTabZ0MxErYwtSC7w
	IH3SFD/pjqG65xZzTtcg3fpHabgJkSALAtV14tFynmxYkqbr17QuXTfjTuU4hsMfYDOQskdxSqg
	KImU8MEPULNmDfbxvrCwy+yZMtCJwTlvs/YaFE1OcYISr84Hxf7fpBC+leA/xtIiOR22FveILyd
	ie5NrJzF5lN63wGJRk6+qsy6+LGa3w0pfEnmbQD83D4i6DIY38vQjlU2nGSWIOj3axCOfPYQ0JG
	J6A0WWKXWRlJlx5AERR8pO0npSlX5HFAnJquWw==
X-Received: by 2002:a05:6512:10d1:b0:5a2:a5f6:dfce with SMTP id
 2adb3069b0e04-5a2ab7ea285mr5687077e87.11.1774952111900; Tue, 31 Mar 2026
 03:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll> <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
In-Reply-To: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Mar 2026 18:15:00 +0800
X-Gm-Features: AQROBzCSfOwC7PpxPWsVcV8RwypXUnG7y9-g_GLDlmzGCrhYIDEBqda8qgwR7SE
Message-ID: <CAGXv+5F2nMwftF4JvXLuJr8Oz9VSoB1f1qq9mPcMYegmJ6BP_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 4:36=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > > -    required:
> > > -      - compatible
> >
> > Not really, this affects existing ABI and might make the child schema
> > being applied. Basically regulators node can be anything now.
> >
> > This is definitely not a binding we want. The syntax for parent schema
> > when listing only compatibles is requiring this compatible. You cannot
> > have here whatever empty node.
>
> Hi, it felt quite strange to me too, but that's what I thought you
> meant with your previous suggestion [1].
> To keep the required attribute I would be happy to reintroduce the
> compatible here, in the regulator schema and the pmic dtsi.
>
> Before I do that and resubmit, could you please help me understand
> what you meant before?

I think the point is that compatibles for regulator sub-nodes on MFDs
is no longer accepted.

Instead if you want to have a separate binding for the regulator part,
you would need to reference the binding directly.

Say the binding is at bindings/regulator/mt6392.yaml, in this patch
you would have something after the "additionalProperties: false" like:

allOf:
  - if:
      properties:
        "compatible":
          contains:
            const: mediatek,mt6392
    then:
      properties:
        regulators:
          $ref: /schemas/regulator/mt6392.yaml
    else:
      properties:
        regulators:
          required:
            - compatible

And drop the "required: - compatible" part from the common regulator
node bits of the binding.


ChenYu

> Thank you!
>
> [1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/10506=
0.html
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com
>
