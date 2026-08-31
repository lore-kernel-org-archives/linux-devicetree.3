Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C803D9DAC
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168878; cv=pass; b=GtPQt00tUzyNzASB4/ggcHwwIm8er9gE9fp1EHkcz9mv+aRWekXyl6TOBhfuyI4pY9Wu7Cxt+N1tnN1CKetY4zOBjuNGPY7RXwWWJHltkPGjyDgcC6E3TJhKTORpe9Y45kzJq0MuauYR0abHviRDp8bIVNmHK7jRcILwhQjMqOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168878; c=relaxed/simple;
	bh=q10VzBkB2pq4QNp2zfHKGr6Ca+oT+tEYjX/lb793kOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCd3lqIqFgLTcO3kJnwGwgVeOimwj8Kfe09A5+qqrKmmM7PQ+9iW6owAMRpBUIKgQrNpLVJjO8YEO9tX1yI493MgASaD7FgzTrZNlOp+zTS3DMRQWw/uTwrmwU5Ihhz4UI+T8b1lmv/FouRWwAlaWC6S9P4MRBg6f3VanczXjm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jJitIXpz; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jJitIXpz"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1677c91969so302098366b.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168875; cv=none;
        d=google.com; s=arc-20260327;
        b=qf9gmfgD9GIoYk1XGr5BrhjeRaj7RPNc2bY4hUTU78QEgwAyFLkXkaBJfjQ3Wgvi2u
         D7ghP5H6ZojuviaYgkMx6c8lL+WYkeLLXFDCZlnm2ufTZcWUv8ssq3HvmlgM4cFFJw1q
         YF8hoyma+Uoky6WvgSmRIRikiVIDtf2cdaoWjwBScZIkr39rHT8i6UhDiAqWVrY78gQN
         DwozomqqRu2cM2wKehVN9fQjhrt00yNk1TRm1pSQ/Av5GL9PIyQh/QtORl6AG1qBw1ea
         ZD/edvyaj6CMxK2XtXjG5/Ey05/5ipAbCRJgqQVysd7lSm9xrW2a5FbdSjRztedTKlE5
         G8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        fh=rCE1yNr8UFmgMaUtKJiwSlSGWu/4IcET5YaLTN5tKGg=;
        b=Gc22T/NxGzVzlBuMgNXysgroCKxSI/R7bYPyuBHEsu8cnJbgMq6Tue9Zwx+036+yb+
         Ed617dRN09CQF3PPHKTAVhOib5B+8mr2/XzmJO0Ulb1+obyrtVI8zDY8Dz+p7sTVcu6+
         h2ZNAsfXlgA++iD+Rj+nLp74frPJ5p535IPuXi2SqVlt7gXvXfiUr7HU4WjkgEuhevR1
         H+koMbOAWQxP7+8eoPUZBC0pVFsYSvxOz0WWc0GGWqoUSIAY/plLTAFihfMLrBQi+v5q
         tVv7v/t7Gw6NQp6yP7ZcBiwPXhrnPzqyrs/vXcIMcogsDVkUamgFghxODbeFRoHoVQNh
         lcVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788168875; x=1788773675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        b=jJitIXpzL0asfeBrCuen2QTrVbcX0buEncJyF+In6HPREGiHMoXMH32ftopXuAiNhD
         3IACRB3ITc11yaTFIxRp3f3dGOlyfd8VGxh2pblq0a5g3hhp0HMnmnCESF5hXMkmHyy9
         mfI3P1hLcgfxnnyXRdYyCsLRSCNeotd4fuJIcv2A9QHmaJM1coiNNjBJhwPYbEmAQzjU
         6OiwHfdfa/vDtcD0rf2Me7J6FyNoAuLcJbKo0WdRVjCC5E7x185ZAlqQVKoSD78yWro1
         nRXRorv/Z2lEbz0OMuEwW4EhQi/kukq2yCMdTp8xeFhujOBJD1etYJyQR5Zj6btbagOq
         GyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168875; x=1788773675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        b=Rw8yMKbfKLoYjb/h59IpJo3sy70XvUgW64drYANP5+25b7O+4QxUeHbA87s/wOGgz2
         3fOFSMAKTlI+06tpVN9zJ4vIDSoAJHnxuH+uNNjkaLtI3JVHRVYO7u3igiL43zlQj9cO
         xzELgG0OB0Ku5vSisbMqtXMdOtTYlnseMNLtByV5yzmdGW1+xZc36x+oinTa6Gk3AiWn
         im9dQVpWIhT9ZiKmmRounsEyPEDU38XEm0v2mKnXHS4APtLusofFp/FGWnPBjut1H/K8
         S/cNasLN35NrjJx4AyVqfMvtLTQI8NtOxGT0OmYT7BIsPKx1u205KX+4jhn7X+WJYW+G
         M97w==
X-Forwarded-Encrypted: i=1; AHgh+RrtCFJnthLofXnljdsXqkNI4PsQeD0STwQuTyh+2LT6uJL5AQvmVdICENENkd6kofXYeI6Y2yCZzss6@vger.kernel.org
X-Gm-Message-State: AFuF++kLxyJ4dig6IK5MqEmuq9JQ+jEdTLGuyxIsTWkUiHGx9nkQMpJy
	WeFM2lIkq5GGON+Z40gnpEcwXm4zjLM2C9FbU8H/yPQEUOPO3xe3U6eXvI4pGngMGxmTk6IsBoR
	Bv0nkNshXLrMKsBR5hcAivoldv4Cl270tkofexhgPjA==
X-Gm-Gg: AR+sD12h5O4JZqG91vhT7vUQt55fcr7QczTzNbm2Yr2tvluThZwWUbmZHyWvtoYrFps
	pLSIXzTPnfZ+bdcyXuMlUwhkAIU/S4SQrJXYBq1548iAhF/boOVDhXM693V5BMEpqTym+Db1Cqu
	BacPWMgdnMsMaxpRjVb4rwSbllU/06eqGpPn9Mig8aB0aUmaOLMkc6I1o5tMcmguuKTFGvHE4Ot
	+mR4uNaDDLlj1LJrkT0h95Wx1dycd5yUDtKOLqWtmfktTAsnj3sMY7gzu3FvhQckIEbr6t6NkJ1
	Mbi2OXaG8v9nl954FdhqvN7J2u0X2sG3axjwU02fAI5w
X-Received: by 2002:a17:906:7947:b0:c25:4ba1:5953 with SMTP id
 a640c23a62f3a-c255702dfb5mr1639734466b.11.1788168874731; Mon, 31 Aug 2026
 02:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
 <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com> <20260827-uncolored-onlooker-d62c44a3323b@spud>
In-Reply-To: <20260827-uncolored-onlooker-d62c44a3323b@spud>
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Date: Mon, 31 Aug 2026 17:34:23 +0800
X-Gm-Features: AcwNN1VP0Yfh6sec6kZE6kJacWoF9mvzSerldBb-9Msqti5cyfrQxgnjl9Rv4AY
Message-ID: <CAF8VQdEA7=LRpHaVOVZxRi73kRf=0pK_etJOJ5oeULtgw4k5Bg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
To: Conor Dooley <conor@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:38=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Aug 27, 2026 at 07:02:41PM +0800, Andy Chang wrote:
> > Add the brcm,bcm4384-bt compatible string to support the
> > Synaptics BCM4384 Bluetooth controller.
>
> Please explain why a fallback compatible is not suitable here, or
> alternatively if it is, use one.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
Hi Conor,
A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.
Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.
Therefore, it requires a distinct compatible string.

>
> >
> > Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com=
>
> > ---
> >  .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluet=
ooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.=
yaml
> > index 95501e858e6f..612d21123aaa 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.ya=
ml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.ya=
ml
> > @@ -31,6 +31,7 @@ properties:
> >            - brcm,bcm43540-bt
> >            - brcm,bcm4335a0
> >            - brcm,bcm4349-bt
> > +          - brcm,bcm4384-bt
> >            - cypress,cyw4373a0-bt
> >            - infineon,cyw55572-bt
> >
> > --
> > 2.25.1
> >
