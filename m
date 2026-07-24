Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D623DA7EC
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883306; cv=pass; b=eyekgti7ViPr/Xcj5xpsDGtK91tsO+/g5akNHLz1efXD/g2CMW8Bo9RhQyoS8O+Tw2a9IkMREaq25VSdB+fbi7s1I0IeOifTGWLuxKcYxtM2E46JWnsKsCyAgTxlo/z434wzuty5/9T8VuBtIvdpzLDG3VTSy8Nlzprc1GpTrw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883306; c=relaxed/simple;
	bh=P6k149/WUSi07bS0uI3VgozTod2P6O9oGPzdpL4VeNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0egK9/KeI8MWmxsmwSpkOPBRLfWGu7PwOL4f8iH9FPN6H11cOANQiv/NExPL7wlWdOVwokw+F1eJP2x4EfPIh7ny+QOuXmeCuHhpCUZC3oQqtUcGJvBC68R3HunUuzj/667oGnQLdUSMRJ7hQnqPNgbBQFLgo+3pWg809zf4Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CARDu4dq; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CARDu4dq"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso1695381fa.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883302; cv=none;
        d=google.com; s=arc-20260327;
        b=JsujhD1ouShnKbetg9MESzwhAydxGk5j0o+bCuyyJhV8UKfH4PX0BON1cl90ddXgKo
         PMLG5jWjClacIr88nYE2xfh6BQc5gDAnCt7gsWTOL2QPz7hbJYA1Hr8gCHTMibifuNLp
         N9saWnjHdyWoamS0iKPrKeff14m43YTAXRze6PUcdVAKw6it6xVr65hH08We2xCVySp4
         f+IEuhndhKjWbI5o2ZjX6jU4o4lLT2moFuayHCb6PCSO+FggYdaiCB+sv6+K/j3w773b
         KrQRaozBTO3XLimOz364A462VSAKUTJPruuJNC3zgxnpVmT7tkUtG9MYuQ701t0WTiTh
         ib1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        fh=tvhO1ngpgV92u39U4qeAJ6puYHBDRmvcHh7x98TRii8=;
        b=ElW2LKmFe/y4SlbReFuDDEX0n8OWdbVG8fqoFTV42kfhlBRbAVxyG3e6aG/ScknTI7
         l+roLV+S+wn0T5mkJHngxgAeyI53tpC+jLiiQRxhS2qmq/y8KJOTYktypVch9fLG98mw
         U3KuNEzcKpYOnNs+2Ifhjb05WkW7d03nh6wabi7zqqU/yCeZOapLLi6BuAPhEhUjfU1I
         IgJ4OyKdIR3D1itufTucntwcJC4YRj3aZOlMvFDkTpDU+kheC/bWdQDuYFV8lAy4Od5+
         qzj57SwaFRX5Ei6v1hzI9kLwVpA6Vp8jAfNh2WSe2rhrp1RaNHy3PyuILSwpND0M4KSr
         Se/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883302; x=1785488102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        b=CARDu4dqh/u9DOVeZUuHAphR/Qt7+RE2vuTa+AA3RC2LWsrfY4C1kDI2cFfxdIappT
         hXG1lQffiUnNyxCdwmTWjv4AFF2kalTYkIWSobBWWCJtE4TLrBG34Nu7pavbdIxCym4z
         QexLtg8rA+sgpg4ZGHMaq6Yg8ZFnCWh8wXGVUSK5ePNqUMsMrY+Qll7Z9qbSuTOrjl5f
         AWdM3M8tqe+vjVtrCvWEpawEwCKs8a5DElcdAh2GvoxeabfJD9yOcuBRUc5ZjjKRG+th
         2/Gas0E3Zb9swZbb9D8rHpuQbD2PmLTfM1hAj++2bPYH+SdFyrNd7EFWlt0dIAYwJF65
         esig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883302; x=1785488102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        b=fWCP3Zv7uhrDGRkUqAd5IefuhtAN0uxnr0540Sijy31zkEmwhRfYjb4lYWSMbcEFfU
         sV9wUwt/06DW9PDU5x7sgUp2RUt6dt8I6tFfR1+6ZYXnBE6ipq2QeH9ZhcU554Rw2nHA
         olxVBQOJwjvPIjrzQJYtZcex0DmjZ67utyXd3cZgtvFdvQmZxhYnA8i3j95MQ+UyztWE
         p/3G7IybfuewcFhFQMhE7DXfyQnxkwa6X3XpqO4sltl91hg86NK/t0TNgYXkIuyO6Hpi
         6/mAx1ij0zGTWYVvjy81Y8kW2KvjYEDzzxZuQ9C81vp+BDYM9ZYadkaisqpSFALZElB/
         gTxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+3pVyU9HCxgaKISXcVTl8UfvdGsAQ5ZmhnuY7mIOtrBLPHcmMvBfC3hwzaadDQtyD5+cogR3b0f+N@vger.kernel.org
X-Gm-Message-State: AOJu0YwuI0cSd7Ox+xdNXcnghqxQfest9dKWSMm+ljvYVS3cXfUXIAbK
	gDBK8HDDAzdOc4Jr94aMISIHrwby5RSR4oJ9M9vXdMJbWqQS5lxT0HyoX4MswIV1JDcwOwCEYyW
	hzPoAZ+IzmcbMUdWcA4Um/An22kQZNS1aNbNQ
X-Gm-Gg: AR+sD12nRa7DCy6YBcmIwfciXbI6qxqTnhRh6WY3auwLFi2pTm8du27AKAULOXieOSQ
	U6n2Ry+SIKrw2a1phWe7w8FXNtnpNFaRRNbkxLPbf3yAB1nDqH42qU/0NQ6d3AEw+fVv5inpMXh
	VMo13/PGHiSzi94XQ9sz8i0gd7co6qFlkfIe1OVRwNbFjA/HQ3WkpruzvtFTSdKh03InEf+81XX
	IJsBTYqGnNKnZl0rCW8/dxjiXqxIDbFlWMlDHUfPr4yTuwDTZzb0P/2AJPwg3I=
X-Received: by 2002:ac2:48af:0:b0:5b0:1b0a:2370 with SMTP id
 2adb3069b0e04-5b2b2f5b400mr800803e87.2.1784883302128; Fri, 24 Jul 2026
 01:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com> <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
In-Reply-To: <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 24 Jul 2026 16:56:49 +0800
X-Gm-Features: AUfX_myGJyR17GFm4lH9fHgfV6_QVr-OCcsB4jX5TsUhw01m7QG3sqAtjNzOTlw
Message-ID: <CAF7HswOR3bTB0QpSe0R1HH8efFaQHqDj_8s_L=-Bxd2wgGH32Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,
On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> Apologies for the delay in getting to this series.
No worries at all about the delay.
>
> On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> > Summary:
> > Add linux device tree entry related to Meta(Facebook) ventura2.
> > specific devices connected to BMC(AST2600) SoC.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> >
> ...
> > Kyle Hsieh (2):
> >       dt-bindings: arm: aspeed: add Meta ventura2 board
> >       ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
>
> The two changes don't apply cleanly against bmc/linux.git
> aspeed/arm/dt. Can you please rebase them so that they do?
Understood. I will rebase the series.
I have also fixed the 'mixed-indent-chars' formatting issues flagged
by `dt-check-style` and addressed the DT schema binding warnings.
I will include all of these updates and send out next version shortly.
>
> Andrew

Thanks,
Kyle
