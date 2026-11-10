Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294689;
	b=urZM12fO47zb4blEXuZXVAz1cglAelUKGFGDKKwxPenU9XVPPtSxu1cKYBtd0w5aC4Xi
	 0Zo73sqZHTYBhGsRr8wja4iVZSclWQ1lasicFvwDkKmrrdV3Pm0Fk7tq1nXJyDkTL8ndh
	 D3PknXsg2XilUKpgaRP8JCPM72Uzd+0rltkPlbz+cEHLTsQB9DwZiXWkvOjjNhnAUMruA
	 TtcQuu6RfTobKpo7DAZR88l+rIw1ouYiaW2ynY4JmSg54x5eFGijl9TW6EpLNyYVKh8fI
	 aBP4TN6sJKUWnaEqe1hRKw4kLSc/m1JZIhk3V+ikcB8Ehxdz3oMo/jTofLGmej2aLzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
	b=JCbzKjK+Fhoj7Zbgq50tZSlc+AOaOlKJ5I+njjS9mxhYKaUfCZEuqKuQ7TlTcL0joKCf
	 q+Fcec7WesV2FB4coBBlourlTXWIS2y73TGUCkUS9wIH4f9GJyTsnhLR47vcg5XL7Ydl6
	 FGLfC1FY7QkRuy66YvaqM/MWrEKcQGbqRS4d528tC86lVevVLsVSaMXUglEkMLkMMl3y0
	 Hf8szcjZPUsNIcgIEKYuaFV4Awhdv2HBTr37/6xVG+AxORiuUiUH6RB/OhvARhEUCgtUn
	 9FcokSUmyhDmcFZilm5sbteJWX1zadPSaIyBNa/WN0PsjNe+n110fBxLHlPDTtzNLHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604B606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8604B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c05273c38so2028521d50.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294688; cv=none;
        d=google.com; s=arc-20260327;
        b=SR46eGnYRESaWeBq9AnRfLc/+HXSTk4w2eAFlm0JUAi0t9zW4oMp1ID6XXRgXm1PIK
         kB+b1Ac8WhY364EPWAHiV8yJPwET8uz7cHqHar6VLqgGv74nNqQV6bdmYV5acXHA5D4h
         jasGZeaXsccxEFsFhULTLVtaPk77oLAHIkkUrc+f/yIwhcZb5C5bFElDen9jDKHpSF5P
         jLA8cINk7TxxVDvaRKmne7sS2WV+ZLHPyIVnk3SHV+9aa/37r8WAcYKtM6I2s2FOSTFm
         O12fm9bTPOoCHj63qbjPzDoGbUG6yNnlIzbcv2b73pXtf1zzJZ3Xmqjiy9sw7AzqNgbp
         roMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        fh=UTm+A36wsiHm3HkKBIvF+SzUuGUeF94pALCAVYwd4rY=;
        b=TRcViLgzos+5KPF5me5dVC+pYPsGPEKVePCddxs/ehVxQqzNe+FcuxZ6JmP5Wggd5y
         guptPj1ap4W0rVn/ww5Em7e7eHUVP3k1QV/y+qAV1HtP1VnMOkFGu/ZaYWmNsHLcStOU
         nGzmHPVgNNbNQXi76W6RAEkvQL3oQlN2zAJq9xCypwN7RzlhAQJinDn6iGv1cJ1lNbq8
         SlhDNpo7/k2s/S184IqBhJac8M/Bj+5pyI/F7kQnyNm6YULZECJgXtdUTLkcZ1pQK5Xm
         X5P603jb2jrhfAZOHfvcToCHpfS1bYIRK1GuZ7Z0J1TTm5tvTw8DlM0+3nz4OAxe7Rwt
         cwUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294688; x=1794899488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=aVZph5jnpz05+IInawFNEBG4LWaGyR6KawbNhlPio048THbmdlYy905j4OFPaX2CCj
         TUycftg6CzZQDxK7jZ7CjGl14d09h98g8UJxxBZ6lnP7g+pTrHx9V1Z+dDmU3/7PamWR
         6GWkClYFkHadDsV02afWsVL5zo6p8KbSPQ8vhwj7MNxvc2wDvZwmcCK9MLd1JLI/IPrk
         CgySYic2c1reZ/EjbRjPpjarqZitNvLUlTFzYU0NJms8wsUrOr5BdiS3VhMtbtebkDTH
         Dkhw4xDoARR+pWLPEeJhdn59fqCKzxGps/S9SS/2HAo6UJfiGQ71mi7wNQ07QvtkYiCe
         0mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294688; x=1794899488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=XX2/1E/qvSvwRmy0KAxb4jJqkjvtqm7PjjXENAZwpZwX2TKabLpth/f32tMJVF4Glm
         3TeYjuTugKWRhR3bw4CQs9BbQhsXD3mrr9JGivirZ/ls8jpihmmJ6nXGcRAcIEip8onf
         puwdycDWVSTFYyIDYhyxw3oVS32WQt56UtxKy/ifAAJ7hGT2swuw112yVpXRkNrUXCUR
         rAl3qrGjlBrtb7Z9+lXPv6hBNPSBGflob32znKvLJuzuvC2HrM6mB3iNf5YG/LtbWXgw
         n/iArJgizxgY8s7NYn94J7epK8ibqjjF2GE02JKAMi+QSjoxKzRCr+Z8rzqDm4uoUvzi
         35EQ==
X-Forwarded-Encrypted: i=1; AL+hErHNLU+KDz8GeQwAqg4GsiLKTlvOL4uZ7HvIdKxL0RERHVnYEaMBA3re6AlzzQrnK2DC6JIg17d0DF0i@vger.kernel.org
X-Gm-Message-State: APuU4Z/OZAdyA1wdnopo5wvsGp1/iwcZFM83IbTQ62F/i3mmFxBweB2m
	mDMUxJvwlGXSBOc9H9Sx7onIGIJQkhE8Bbq29LUJk5fRYE/y01SPP0I1HqLqW/P+9uHbQKExDQN
	+fS2R/bOhso22Sh4tvU5O1H3an6ZQJpk=
X-Gm-Gg: AYBFou0tBWMXbFmrXGviV3w0UtXXCPbGQ3h2rEDm0b1d73W9U2+AWdUV6AZy6NKt5sT
	V5I8b3et4LlKs7woiy7KJruEYNjBhLMXoGKL191vyVUEpUX97pbaLdEFwknZFrJkrufLlbg41df
	rGv+ilekSRsJxfjIg97mmu/iS1lPb/UwzcoTU8BAlD3x8Lt5XW5uaE6I1b8JZZnxwf0867iANJF
	8r2OWCx/f2JSuHNtaXLMyDOeB4skOa7UuNo5/+wefTvXbNdb3gFMBFn1lZrxcRnlhNIg65MZAng
	0I5I6EtN6S4+k9nSFZv/Bl2TZfDQLzWoJbU9TA9DB/zaNk3ZvtadvKboKe7aHUG9QTY8ra93w9X
	3gFnQV+WCMj+Gqq5dz4CohCHYNIVD6hCS17uL
X-Received: by 2002:a05:690e:480b:b0:679:c916:46ed with SMTP id
 956f58d0204a3-67c56867600mr864381d50.65.1794294688510; Mon, 09 Nov 2026
 23:11:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:11:17 +0100
X-Gm-Features: AclHuK_6GpTQ67xpDENQByDg8QRKTv0ORuAztrJZSqgIK4qf--6_2HTmK0qNm1Q
Message-ID: <CAFBinCDi3m0gMTQBCd-yrCfAKkT0QeuXq0wE_i+CfCtS2oX+yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
