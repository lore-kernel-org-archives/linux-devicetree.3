Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C7301472
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945048; cv=pass; b=iDaZW+gylKPv6tYVhsfQows7WPh5TI3LUbFS8MAXQz006Lw4E2o12osAa8hIETYCcydWrRRHklrvxjs5u5x07C5MUIdWZaBXFXWUJYIZM4HqfaCxwk7kyXFPi76lR9x3kx2aokmJ+gnf7vawPr1Q/7yjnPgvahRk602Q0x0I1Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945048; c=relaxed/simple;
	bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmkJVww8HivjhKa/CHZnUZnoB8czXGONJhx9sM07naEML4nzl5ZCR0974/oye/5UQvEj77Lswniv1KE1HvNn1N2zzJMQVPclOchKO7rcWzxf0dhFqWsUa6kAoYMv8GDSXaXJ4MnlDLuikcNH1EDAA2/0gxhXw7JiQhgMu5b6K/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIyPntya; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIyPntya"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d555293aso693079eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945046; cv=none;
        d=google.com; s=arc-20240605;
        b=URGq9c8Kvth0qPPBklmMyYtzNJSqJgjlYV7Z2u6vsbt9SGCwxNZ1NBaCgqCv+UNH3j
         SqySSI9B2VLXU5HZ1pGrH+D+gYE49XQ/zLv1DEmIga+IvynFU7kAhCYsv8a0HmK51BWH
         SxZjxOPnL3x/jR1j1LaUhHIXUSS5QYcDtdsslm7T9NzTvjYdMVatLDesfCLhC1LSaHsA
         NCNfY1x4zhFSl6HVRxGiStrwpkSKwRdzKe2eIgyATPv4WR5Us24cXM2OEsQsvAuw2sU8
         /nqoWUOEt3/DX7W6lEIn8ZJYuyzC2LK/XAQSYZQbIr8RCC6rOAD5B5x2h07iM73e6vIj
         6RZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        fh=tLrGCd65b1UOQkUQYjdSr0JMwazl5matEaaTrAaw9P0=;
        b=BVKWrNkKNdvsn4OMgoy80z8jf36mWZsywOjvmOsOWPjobEgpankGXO8TZaaYSIWTHY
         /YWeDpc9KbINi8fYYusBkUF+os6EvdsfAEh+bQhIeTHc0515loGh/kBrJQax5T5LC96+
         e2M4Ed/jBKZvVu5xurpUdn45yDAfO+qZbtfgPeKWObohumnBU5oTLZAWU+fC7JdFvl05
         QE4NdF7jAKthc9lJBXkI+liNnqLiSQ1fVwOqztLlDl3j9HYm2enlrTEp6yjOf4ppiAP5
         k44PB+XIysVWj2Msf678fvSi8OFVZ8g1oHebXLq4rqKiY42STaU6DqA2etA2alukvrVG
         e4vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945046; x=1780549846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        b=FIyPntyaQci7Gow3k5Tv9c+eiSQuvMqAIg8GauSmePGIb2DAXnmUuFcEBNNEbMKY7l
         z5IfrSIUcto7gnwcIRtowu4GcOZdDKVYTCu3Z8TiCfbVGGBS4ikhaknmg3LDgf41mCkD
         wMmKMcuvP0uX7NjK90oK2N0Z1AGDJRgSPGa0tVqwM7pOVpGcKGmSZMD7jbQtpLxd4iyK
         mpH8+HdDfH9pwkhFQWl/HZob7rD6I5NUQybbLojqgUOmMYMfNp4BIRUVQBZKD8XHDera
         yballBJqN+9CsqGtlZUeZWioS3jB9XMzBjtpeUofLYCM+sdyX/BhMpUIy4DiWf4zEh5X
         OOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945046; x=1780549846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        b=Il8uRgBJJJDo8VqFuWoVkqrIjaFOS1eGIJCNeTifjavi6CsF/IA7dsJuJyu5Es1rwQ
         M+FRd/3yifxYcFbP4e+XoK2OZmScS0v4Ia2kpEOdgm4188x4Z8iGNTkYUFPwPKntXgZ5
         +JAJvExxURx3yNKfiXAMWFLxPpnnpyt+xnZXItnAPHKg3YrUVf/s+wbnMI1bTa0fsnpr
         IqJhC2W/TFhW/ErKYOzDw6YoMBCdSTcoxaI2zn6nPvRWwXkfjtiq3Y5uIKVzgv77iI8U
         7u2kn9OUAIVNkvotRJtRkKPQOUrFmSZX0oWZqRTnqSGVHx38COzcYy2A/lDeLtk3hGRQ
         4Zdw==
X-Forwarded-Encrypted: i=1; AFNElJ/htX+IYCNLn3i8CIPwUuaX2ApMZy8rHrI5NskMPCwSEe8KNPlSxSYWq9+IDlWGMrYYrJt48vhsSRXL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+AHQEoeMRE1k2HjvgiYdJvdk8iveUTkC4YkNnfobR0O0jp6M4
	hFliFmeLr897LyL2vTishw/m0Op+6L1uHRuKmECRk4QCA7VuAk0vKFyPyE2w94mRS78hD4yUym2
	5YrzgvUHUdmPPTwVPFAiHiW6iT6kLoqo=
X-Gm-Gg: Acq92OFtwjKE1gzdueKxP3oAuLdJMELYQZV07L+T64JP7XNakCv3hobI0ETxutH1W9l
	kH08kh5Bws6oK5GsXKp/csOU0Xm1d6Nlhy9kDsHQcfvTS823mS6IBl136S/pTE98+zgSadgMfGs
	MT3yt/NGfA7Pqxo15jz9FFnSB2ggu1Js8/ZU2SMp8hmr9oPWoNImzo4e3nMN/oKFxpCRW4LGe4q
	EeqnQwxK0xzHaxn7fxeAZcpaF78gBs9E14OYD5mo2vjryGk+iKIXiNutZW8o7yqtA+t4Keerx4P
	BDc2tSXQMkumNUkM1U0=
X-Received: by 2002:a05:7301:fa8b:b0:2ea:3370:6e51 with SMTP id
 5a478bee46e88-30448ffc5a9mr11709293eec.4.1779945046369; Wed, 27 May 2026
 22:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518095907.36158-1-clamor95@gmail.com> <20260527144619.GA671544@google.com>
In-Reply-To: <20260527144619.GA671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 08:10:34 +0300
X-Gm-Features: AVHnY4Lq5d5JMdXBzoz6BtIZMrqkYtiGSsaMXY6hInghOFfRu3LWOak5AA72Ac8
Message-ID: <CAPVz0n285opk=xwzEs28aitTZt-m_OtrvHRx0RenJrmV9rbPqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] mfd: Add support for Asus Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
6 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 18 May 2026, Svyatoslav Ryhel wrote:
>
> > Add support for embedded controller used in Asus Transformers for
> > managing power and input functions.
>
> Once you have your Input Acks, I'll merge everything through MFD.
>

That is awesome news! I have a few minor adjustments to add including
input adjustments Dmitry might require.

> --
> Lee Jones
