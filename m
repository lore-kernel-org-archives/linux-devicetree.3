Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723783;
	b=u5IPpPXbTDDS6u841jC5qQdR4tSUdPcMvIjyMt9z6eCIsbLpi4vcfsCUX9YGbPWAj434
	 GtRYflrg5B+IHy1vILG3nY0fEJaprLdHevr5IdEsNHdgLYYCnDK2OxJ/YxVYMFoVLmZY4
	 lPcAVtxNSwzfzLnxD0c4wz9r6Cn5xh5sKk9ouTMewTuq0XItbTYJW1N2DIhddzmDVbkj3
	 31+F6+T04kcKbarUZ/qJCEwZa31TofwSlV6ocTeWgcB9QojGpK6rdR61SDUOpXbwaQDdy
	 1UumDywAG/NLaRdoEAFtjLh3oHcA74r7mMoSnOfoIdOXM1Tgf//opVB1AYgNFMqnFnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723783;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
	b=GzSfmAX95fL8ewhfbLkHV/r4AuHfntN5NNDZjaXNeCEyFlGRDZuDSc0ZItU6z+fNkMA3
	 vAk9FoI3ePwd/ersd8Do2qEs9tMC7Hwpxa3qXLoJnA+BYH4r74PQXss4ukcE9NXvWWO33
	 93eifab4kPggMMXOgj4Nei7io2poZ1cSVuYi9ZvSbTL/f2n21w19Bl2Xj1tnoFopx6IYF
	 zP/bB08rseMBxHQin0SHxT5Nj7lScaJr4caxv+iNQDU85ouG6+zxIDz1LUA+izujW7TS8
	 GeaO/ORekh3UMhVw/lqLZGG+vvnvTvn/mJEZkLoQReZmovnrvNqTkn4f7sl8G797oMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BA606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5364042eecfso70489581cf.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723782; x=1794328582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
        b=bAL/AI4y5QXMhzXJTjsclPH2aVMjk4A3VMmj+BKSlbAzLzabPHhjb9+eM89fWvs6ov
         KwyRqwhAeLXgjqxq6HO2ps4Jk+aiVrOtIUuxiKjmPep/58EELAgxQlNRXH6lSVuGLapf
         6wiq6aXgV3Qwq8WLl6MUvl2HmUHKihlRbRdWLE9YXohu+yH5JsDdBFF+5TiVvW/+/Nik
         DkyjsHRvoSWrqJna95oDXpEFk514R4i4DDzpG8pV/g4CAZIIsuiXgrGYWvTyQrnTj+m9
         tleB+v9jxNW5NOdPgLh15L9Km5gn6vEtvTA43QVOegRFOYqiv0pXWiFyW1bftMfzU0zQ
         ONgw==
X-Forwarded-Encrypted: i=1; AKwUvByTcXIW7JnqdCtAPPfwMFGy7AGjt22RtUzVgQb5oEAxyDzjUEh61aWZP9DAsnC0x63b7ticMQHE7vwQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/FfqSdn0IdlfghhDxGvL2KuwV7GdBvpOR7zdFSzIoT1lgHvxra
	W6obu1aFfYfUYg7P8kCNUWcQrOb35sIyHmJRXBkJTZDk/IGeQARsLTd0fSXUmdVIFic=
X-Gm-Gg: AYBFou3k4tBCKNMr5baKpCIzP7JLZbC4QFqMWkHARJgaUxZz2Sp2tH7UE/03EYLZD+7
	uCVDynJe5P2EBnKxQUX4OYpptSlaBG081BvQZenxUTubMdPnTJyZTuviII1sODXcRbzgyKGoG3Q
	d8UGhwuwhyDN9vn+NJRif4a7mzFklTUal+WhBoAj7bM1sSbIB75CrY1hoxGLICXdMszLpXxzsgv
	qQUEhndzexv+3p3CqpL9lLTzCy7zTdrEuI2hvOZf7Q40fubBvnlyteu0aiWmRKCyqzJ5GkCrwaH
	+K+IMQ6O0URQKdMCAn5/9bk5kaJfDVwmWOmxy3BO9IT1ggYZPZ7FTE3rWNdz4VupDizLRtNk8Su
	nbgge+qMvGmmLucGOh8wUaqPrdDSFAzCy8KWLcAUb5fCEBmy/gKe5sS7VTAgExeLD6M+/vK7xll
	3nxkz9D4yzoqd2PaSKPvCltbm5fWookIKw+kR0i/nPVteW03bC2m7+08hETgmI/qvBrNx5bDR4k
	sX0qfHAmPK6Fi6OH1v5nLyu+1mgQb23muCQF5tbHRqca0GAP3s/Bu69WIrukKYOFUMeIxL2bQcQ
	9aHugeVB4iJ0E/gRF/ga+u5L4wEH20zyacR1nHYGfDyixuiv1miQWg6f10B7PXRQI7K+5na6oW0
	9dkD4SApSjl9yYKUs1of4CfdqsUFoSURTnDqKNquUnw2amyYbeUIwvpfo
X-Received: by 2002:ac8:5ad5:0:b0:537:83ea:2fc6 with SMTP id d75a77b69052e-542b781d950mr225407841cf.58.1793723781637;
        Tue, 03 Nov 2026 08:36:21 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f252ffsm121473036d6.14.2026.11.03.08.36.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:36:21 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e7ad9f78dso550392085a.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:36:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxrpt7l7e8ng0tf8/8hwxsXgynE4aM8QMvhqo6052haHgdFf1vNQL5uXswZk0iAGhMqmNU5neqO8JHD@vger.kernel.org
X-Received: by 2002:a05:690e:4810:b0:67b:9051:e32a with SMTP id
 956f58d0204a3-67ba50e0ademr6918680d50.93.1793723407281; Tue, 03 Nov 2026
 08:30:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
In-Reply-To: <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
X-Gm-Features: AclHuK9mStYKxlMFWLlexMhXND4q5zYuU5C_HQS0PBE7THFUZlCXo6CxCqTl6Rk
Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> Is 0 possible with the hardware? If so, i would accept it.
Yes, 0 is the delay line switched off. v5 accepts it, and the T7 joins
the existing G12A list in the binding instead of carrying its own.

>
>    Andrew
