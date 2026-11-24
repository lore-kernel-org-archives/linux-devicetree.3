Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553232;
	b=YR5/fyUcvdfLFUZPcZ2TnhPJVJkWXZpR+Nr+4KfDhpUWubeJYlPwXgd+IarPyd8p+H+a
	 2uQXgNj8xjctRd5j2DD46J7rgSmtQKa+thbcaJbs4ywDWy4GRG3ahDxMF5QhTvvxnCBh8
	 fJKFLLbpnxqFh1xDIgQq/Li5s2d8jsplWj9B8msVSxreErC1R4KSz9i24brCcByjyaC3D
	 AxKxaj2ueiTlRDNgKxR2OSJNaJquQ44romThI/Qj1G4MxX+xEqL1xukJrbvNucR5j+j9L
	 IRffwcu85oJJVIAq8/0dxa/H0Hv/h+hVtW2Q4uzXMfRlrPZ9Cr96auMbvWAXMD5b+IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
	b=eJF44UKoaN3i889L/eZeccLj7mTMt1BqtLbxGqqXzHoPziD6Jy95H/5CLXa7PLu+rHIN
	 JyimWB22+ooDziUPJIhqyBwWXnjFt6kiZ2LCcP2LSBQ08LqCyz/eWyQ/ze4kepC5QfToV
	 ZGD8NkrSaJy4DFon0kJc4Cu5ZiLJkidKmLIRGP6qeMyDl+pvyAZH6s8SpxeHYq5BFimsd
	 SXl5FubrJ9bt0zqYA04ezTApgZaxeUn7q40WmTP4u0clIOve679FUTtsq1uBoBUSaqCkI
	 24GofHGodMCbnmQn9fe6U02QfXfAw7geW9gRUt96l+749mBubw/JwSRxCx1Nt2m2lPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E34606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E34606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4ea3c5afaso34128567b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553231; cv=none;
        d=google.com; s=arc-20260327;
        b=r6oWtXgmcS4JfAIINNsxCQunGkkjWoVH8SMEVKfgzJiZN80TqCAonU0TQz2btC98aG
         wbJQbfF1PwufxLIqT4DkkZIUtVTnN1d685LBuBFVk+AuI++tj6OWD75hJodf7herl31h
         o0DEVZ4VJjKbjcOXA+9iHVx8OJWGUGqYQBuHFEyjZS16Xh+m2Kcg49gGOoaxZQEe6BlE
         0NT/NBV6msM47nKj2j0dHuEA7mkinKGIfQUdFjTdTsxsYxlM4j7X/8/z6xQ6BX13q96r
         DJQmxdd69ZsyD/uuYdDFGP3N1sfjLcyI+5izLRFHkJgpW8VyFKKzOGJBpa+bvqrCoW7X
         WzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        fh=dJkC0FJVtwFCI9VWm6OUnEPELVTkvyrNyUhrEVu0wJ0=;
        b=Nb9VH2vugb9AIlDogUD/ZJlaBF/ntUdLkSjEttVgNmTwZ2oj1dfTNQFLKHIXmw9zDO
         oN0xD20645ge/BMms71NCrXnMgDFZ3jIlzSTqoTnGEBlT6tlBQPmhMgQ/txWvDpiQAHM
         ExNz9cvb+8X9fsCMc/okZSI7zZ5f15t4mVLhFBzDvpCX0YExr76Fwraqw0VOrv4HhKhS
         fVEVOwdg3gnul1vZHdQSFYUtenDX7f4IGZZ1XzlFSnn3laOsQCFEIOfxGPtklPxRontf
         kHxqwfWQK8wYP0YM0H4U3UIFe2K/qiaMCi8wJ3hWYOV8j6PBRVI9ZQidBfl3v8lcE9+Q
         XKvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553231; x=1796158031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=Q4iX0BR8BJUhYWYquTncu3TaeCKrkudjb0ok+EmQyinm9YTQBUaKrl3kzdKa1BcyFM
         n5559g9SvmGhifoEikw4w+YFfXVjU0X59B0WlTE05El4jdxf2eHwwlFTmeH+mowecYjm
         VreCo6Q2SO3LoF5mP+jakPMSsIgYx/OTH5q3vs6Ee1nIyM3lhrCBxdgpl6cTw/eq1B1t
         yVVJEdp1qpQ5aacLGwpMjQZkGVZupGWwgX0pq2sKtwUxo/hOp9aBNqCdIIeJAFVjdnLE
         +frrvo1dePM2eQRnE+2dahRXJD9EUlfygtQagmRUKifdWLrLTu7/FhIMCRLDi0L6R3cf
         TjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553231; x=1796158031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=OoQjPFb9uVehQ4ijjpLXFX+g13mdbcZJEp20EoZWkHb05xreXhS+aJFTnUggv8SkLl
         Kz/V3prKyJCn4pk/COfI2vt9o9TC+d4RNW0VpegdV8CjWHMkd19vWPQ5KMKNcyaOjxGx
         7UwwIB6KMikYTWksrU3j6wiKvYv4DqK76cUfldzIttkJhnN1JNCJaGCPNTEHXOqZzjin
         MSxwSGyyRwzNJH+doNj2eyQ9Sc0nOh91laMuUPFcuQ1cdBvJSHWD2RSgnVxV+45xzjYO
         w5mFCz3KNr0Hxc8Z0YctpC6L1hWTaJwmcHy1P2fSdMi9rL3Q4OYih811wKMPtInMmx6c
         OyGw==
X-Forwarded-Encrypted: i=1; AL+hErH8j+fU4Kyf/ycKp5HXXVbshQRfI7SfRA0RkHf4i7sHYKCuysbp/AqumcNnnZNs2dZV9K0S4tPAk2DG@vger.kernel.org
X-Gm-Message-State: APuU4Z+H6Ftk2mzn9XMMDa6Yt86lRzWL7bEaESQ0wL9dGIq3q2YdU4hh
	rwydloVaNsmZKhtLNi2FwycCBQO/nTE7cXfhBY5m8wBCUIKGQF5QUCR9a3a+r7siPjb3fUW33+e
	cvcseujsdXeH+kcNQtFuYflPvE1Xwdpk=
X-Gm-Gg: AZFdTZcG3fHbH6CRVki0a26xEvPSiN3sAIcDKy3ecgHRi+AiBkvojw2dPE6RW+nLPk9
	YGdUm/tl9chRnjSi2mGdjqoALlzOikS/TP/TKz1cPfzXe2gny6eZpnWfXe/M3xIpVI8VWAS8Qhz
	uRIHQcc3b6/rueDcVMoCcGMdecc7ldgVzkrvgl6pbNBKVX0BX1qUawKJ48JbDJqT9LwpqSCCQkj
	7ZvlUMH6aZpkP5zsGthH+n4x3ptq8A9YJpDA9CiyGsh2ON4HkstdywBjsOyWPaQ2sY6B7+Hp/Y5
	ykmQrn4/ir7pWcCt0dc3IbKFG8BK6lJGgUEV21rhdm4tSGVFF/cR0o/51qOFc4Blvg/+CZb/xUw
	xJEEbiUKWhdNIm8PLayjQvGAiisayG1xlrVCvmtOEvCfrs6E/F5Rkl92SO/Lnk1/N8hQUEA==
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr61098007b3.42.1795553231171; Tue, 24 Nov 2026
 12:47:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-5-tanure@linux.com>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:47:00 +0100
X-Gm-Features: Aa3M54piMjiC5eZa2JiYOkn7APdjKphVw0p4pBUTRqSLCMVNRfh1PWCBswFg3JY
Message-ID: <CAFBinCDVe5njTaO9xN-snXRQGKHDpsber4hi9P+Fq5SD2jMUEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII. Its address pins
> strap it to 1; it also answers on 0, the RTL8211F broadcast address,
> so the vendor tree lists 0.
>
> Enable the controller and the management bus multiplexer, hand the
> controller the ethernet pins and point it at the PHY. RGMII needs a
> delay on each of its two clocks. The board traces add none, so the PHY
> adds both, which is what rgmii-id asks of it.
>
> The PHY interrupt is on GPIOH_6, so link changes are reported, not
> polled. The reset is an RC network on the board, not a SoC pin: no
> reset line.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
