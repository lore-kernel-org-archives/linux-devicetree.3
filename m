Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D373876AD
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802138; cv=pass; b=Rj3Q+df9iCeyPiehZLyPtc3LPAsQAYMxKodRXV0uCn5Xpm3jj/4SvqSMeZ9lIGHrX4xp1DiboWxTCcDfJexKG9AThdeEY53Vt9cCwWvMR2ezV0U3Qrg1mjZLmH1iBkFGKtHsWZsqXjistf7qYZPR75SqUiuwWGb+ZzyETSwEGVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802138; c=relaxed/simple;
	bh=AwmOeeu/JmzLDdakR0wt2q4m4lXBk3xF7fPnNLSdra0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoinvijyO4N3quV0+EhxhDtH1Hl62sSlkeBZgVz7Ip/7MO/Tb29Uka+A9QkgG7dckFOK7+Lt7i6yfrElt2B/IMMMSt96Cwy7b9jlU/gxICfhF82BY9lkWxhfSnMsJjAI+Fwy0/Am6cXnl5EKJNQCwS3shQeowsZLQRO8CHNKIXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXDPCQ4V; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXDPCQ4V"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fe655187so47217855e9.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774802135; cv=none;
        d=google.com; s=arc-20240605;
        b=PUqScZRnNWytPG0pZ40WtRxDUtjewD4RWl//JGdGgqgv4rQhyelqJp472eJ8OS8tH4
         svnVf1oWrOKVBnxXsFHKD/TwzWNtQkDXm0+Xu4D4OgtLbLCWkPKfxjABtOuuNd84CWtQ
         e22Gy2O5O0sr48hFLPpapVzhffr0Cbh3TPz4lCO7zBIZ1LrdDc4ex7WrOXRJb339pEzJ
         fz0kd740lMbcL+XsCdv5oqf1JSw2VoLPis8u+R/ggQb21BoG2/4eALJv9VJZlRNlFlLv
         6k55/FmvoGE52xY1/1t0jTKDszult6txzv5UoUZ1CStxrDC5ADzNxW+yL6Zrri9wueXd
         IkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        fh=L93lKZtk/2N6NxW9BJDC7kf7uCbWWXMk+OyuW7x4N60=;
        b=S0TiHwxhQPPkpmNnC/vgiQIwA/hdzq+LD41fNTg5UuFtgmOxKBXg162rquHq+T2F10
         Fszmbj+3j1hr2+sD1nlu2gnRfu8H2qqY8p3y9XovMsJLUwy5fEm2fZjwBEmo9FW93TCf
         mnJeXDdNjVSUIeSx7iM8kT4iuCYW2YTYi8wCjzeHkyvudd1Xvq4u5cTzjp3RTvh/Mm42
         qEAdKXqHk8sT4BFmSaoa38gfwKJdzq1D8/ceayMsHxZfmrl/F66EnePhwBk8+wzWMh0u
         wSBGhTgiVKQ+UNh57l3n5N9rMKU2MONqgfsENdcUSAhWEuq7+iQLnoHYBVTt2eV92/Yx
         UybA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774802135; x=1775406935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        b=GXDPCQ4VeAxTmcjBmtigfBmt2kmR1VRXQGT7HGZL55iblM0JwMqeYN096xNz1WlgDm
         sLBZ4GqEGeNhRNQQeZnpqmuiDreI3kcV8/RdSDrvuKFftFDeGVen6dxYc2hDTh7q+dxD
         f0a2YHA1FzNbw+81vh1ViM/uw/E/nLih82sKEBcCKK4qCCVJF2KqX+l6FP6oqlRf62EE
         Pdrr6XxnxC/vd7NF91VcsWDEbodoWiw8T0cxvNux2LLASCt37AhNyX8i/aEkMgy2FGMo
         xCvGyMdZ1l6Lqx8VBH9E9591OUI9RSWY3ylgCYpw9YwSodjY6qN/6aUNoHn9/qS36Xpw
         ZWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802135; x=1775406935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da25ravMGgwQwjA1hIuy9pgwIwzh3H66SkKFoW/X5Zk=;
        b=AmFoPqohQouzvZ3neocPD9QqgICo9rpEW7gjOVLdUKsP7XljVolOGRzaOoVzRFFjZY
         seDURbVk0GhfjCrWgR1VpDOu7gFA50eLudhuzN54euFTKJboMn42X8z12Ok2u0rcDKTD
         mptBvQK7Tx/bpLk50NTICdY6i+9Tjb8dAsrvO0sYYL/3AquLOQ7NRXQoBobd1HVnN1mf
         1OstIuInTxB2VE3M/4aIIj8l/FN145hPRhY7i1+pKV0cASgQmHiHSDowIS8Xqyk7/xf0
         kn1A0+wRWa1tJCqnmD2A1u0BVJyRiIqD/Kc1Oc21aCWxQEinVT4GOGydc+I+9HpHJK3W
         Jvrw==
X-Forwarded-Encrypted: i=1; AJvYcCUdTCk2HNKwerXfi9MEJSvnS5Ld2RAEnSeVRzgr/KNt4kvupwIe31sQtwvnxqlr0rmac9ETL0oflWRf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16R1ooYtz1PxRIL5krmMTxw7pn8XDlEqedf/HlmYp6J5qR5Rq
	STuiVN04rlg1XyIlPcMMA8q6rKS3HcIoYZHasqY10TZiA7fLjE7+KDKAKOjtYiz6hmkte8euaGM
	KoKKMNwlmtjRzlBxf8BBF4DmiV9cGbWxNv7RT4ijWXxNtTJ0l9iGF8Ig=
X-Gm-Gg: ATEYQzwlFOfAl7Cu8W8o8ZT9P5XCTCx+ayRaWqo3zF5hmhoEia/zzmcjA61GD5I33XS
	j5VCs3AGhTz2Mmkj1ObH9cHV+PPRpHtMeGckIx8SNZgxwlJrShpXBl4NcGL8hB/HnGB7ySwQrWw
	K8polnmcCME4oy2Gcnn3wfoEqz55YXiI4KDCFRwx0yXovVzppgrsGfFJvvHjENAAoCG5zczGmwR
	z91YvXQ5fy+jpG4BiyfVDz/NsOo/0RKvub9gC2EVQW4gxhbXErEFPYm9EeNvtu+bt9zm/F5cNt2
	RtYU/g==
X-Received: by 2002:a5d:5f88:0:b0:43b:4e13:221f with SMTP id
 ffacd0b85a97d-43b9ea1a17bmr16668541f8f.47.1774802134854; Sun, 29 Mar 2026
 09:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
 <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
In-Reply-To: <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 17:35:23 +0100
X-Gm-Features: AQROBzAZeWhG-rpsGT3BQJVTZRDKnaJwNUJNEuupBI14XsML2XrnShH92O6Pt-c
Message-ID: <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Thanks for the review.

On Sun, 29 Mar 2026 at 17:03, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> > Add the BLSP2 SPI4 controller node together with its default and sleep
> > pinctrl states.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
> >                       status = "disabled";
> >               };
> >
> > +             blsp2_spi4: spi@75b9000 {
>
> This should be coming after i2c@75b9000 (which needs to be renamed to
> i2c4, btw)

I will move the node in the next revision.
I will also add a separate commit to rename i2c@75b9000 from
blsp2_i2c5 to blsp2_i2c4. I assume the pinctrls also need to be
renamed to i2c4?
Also, do you know of any other nodes which need to be renamed while I am there?


> > +                     compatible = "qcom,spi-qup-v2.2.1";
> > +                     reg = <0x075b9000 0x600>,
> > +                             <0x07584000 0x2b000>;
>
> This wasn't tested against the bindings.

Oops - I will solve this in the next revision.


Cheers!

Chris
