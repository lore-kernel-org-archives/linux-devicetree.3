Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350C10F2
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728995; cv=none; b=LLYt0RY4an1yiG/xQ1aBUhY7VebFf4ghcsHBTIMznDMoAMiqJXwH2Aj45FEpoucxU4HmRE4Ttz9nop/0v71eEtWZTuFDhs3SXDQqCHbpsSdhG5Bw4n7rSYDhWgvk3F3QPOBidPxZ7CM3fsIbsHpzqxXoe0kR2v90+ncpRKVl6IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728995; c=relaxed/simple;
	bh=TH2hvxG+a3DnkfzStjL9vGu1h7pAJ9JEfX/MRQWvLXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQoS8nwOB87wJkzRaEPHKbMQunFp9oyl7Mwv8TWZXqICI0xmrko6fBGHsELLMQeHTlKVrk+KUQ3mHbTNynouw/YRGKl17uze8n+CF2lz7GU3bMIakODhxciUcGA7FGw8sF8th8QEQTgsLhkdYSQNiuk6x3zb4NTQuHJ8WANfQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93cc1ab5f6cso156818985a.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 07:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728993; x=1792333793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzyYwwdi+Gw4Br7ibuX1uhAgZ649p+E+2HalXmhinyI=;
        b=2TVjVbz87TfPLJ2hX7+5Mg9y7EV85aWDBt+vYbK087BmMeggX0ewuPuihlPT28Kk9Y
         FVvmTgT9DmJO04uXSjAKet/vzXZjFtc4oYBFrla+dayCPjzXdT2GjRcOSeqPfHW4bLSE
         nvbZBTBFrKcS3HLb4KmHmUdFOuKvB8HZYLEnFTb6M0JDByUNVkEpUJs2WvRWYyUYyylL
         WU/mIobkmLbBhpQYGkz2jbhhDeGZsMPuMEPLYUokwFpw1Kn2wVwhPLTlzDmrpBnMrAo6
         S069anNkp1F/nLCM1d0xl/h2y9rAyUFt/xMkHlTKNwqncUVE7bS1Bsr5JSCDIPZeZbck
         irUw==
X-Forwarded-Encrypted: i=1; AKwUvBxiena6K9rlA8QE/ebAwT4ll7hZsXFnHrkQUWKs6MBemwnPtNtP4yxYv0ggFe1tRxcQv9/3lezlNQzf@vger.kernel.org
X-Gm-Message-State: AFq9FYKJAbsXqrPwOoiZQxM1A+BRKLu5m2mfqut3Qg8l+kRdT+FS5Djj
	2je4F1pN6+nBqTR1KDo9YHGbJO/W3dN4atLlKiCAv8FnkJ8m7UI1YcXwAkp/3cH6TkI=
X-Gm-Gg: AYBFou3kFRg6WVE5qLX0w/iLpDNI+WL9klhW7gj5HV58S1/cJovSubeNiLoxKAO6/6N
	QjYJonG6TmC+ROzI70j5jO50NT9GCKNkPl9GIo5Qt8q6CcWCv7j6TJKD1dV//ZdUj9FMgDEBbZ8
	MvajbhFuxshiyA2QsdqEpF3RYZDgIjkhkJ6F9RL/058BMzajvvSS4Br3McGKTta2aRkiNZHxjZJ
	ZwVB+E66Rl6OimmH6cC8hzJXMjOGpKo9slG4jd75YTPw5t4Oh8bwwpLbVh6oQK8LUVByTlwVB24
	Hv3e8NDsxnAV51LPQzbkLPUr90vfEDlIleGGrxHLeXJRc8hIb/PB6HF7lSxJmmsgCCMoqYVinog
	MW/HIhGRr8ZAarz9gHyAxhJJylVGTsXug+pYFqIUrDaFNLWCCp0OEpjp/773H2TTgXfh/eptkeE
	cmvJxAUuMI6X1P+jP3birpfu/4nsqqmfPycRLzcfK6wyduIC8yedeqZqFa1XyD/Tuag3M2gncaV
	sG87L3NMlMi6zmHsPJHy6KKi/owJdLNXhowqNELWFUbsHRDDeJJt1o5gSwYSFI=
X-Received: by 2002:a05:620a:468d:b0:93e:6865:7e3a with SMTP id af79cd13be357-93ebd290049mr1183424085a.55.1791728992710;
        Sun, 11 Oct 2026 07:29:52 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5507646fsm71580146d6.28.2026.10.11.07.29.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:29:52 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso24811336d6.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 07:29:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3wxEaxkt9BDr6++IUEA9zHFMk9Yt97MTHl75eEz4uuLzOmuc+6reEA0tNZZxZyno0i/kZTIQn2zXC@vger.kernel.org
X-Received: by 2002:a05:690c:309:b0:8b0:9e1c:3148 with SMTP id
 00721157ae682-8b09e1c33cfmr4413327b3.34.1791728503965; Sun, 11 Oct 2026
 07:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
 <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
In-Reply-To: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:21:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
X-Gm-Features: AclHuK90wt6EVCYdNEmq2Fhuw7FDmVki8iPk3nLcnG5vHPlk0pxu17yKPiCVT8U
Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:14=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +        # The TX delay is a quarter of the RGMII clock period per step=
,
> > +        # which is 2ns at 1Gbit/s.
> > +        tx-internal-delay-ps:
> > +          enum: [0, 2000, 4000, 6000]
> > +          default: 0
> Is 0 a valid value? Let's say we have:
>     phy-mode =3D "rgmii-id";
>     tx-internal-delay-ps =3D <0>
>     rx-internal-delay-ps =3D <0>;
> According to patch 8 this means: MAC is responsible for adding the
> delays - but it doesn't add any delays.
> I'm not sure if this patch (removing 0 from the enum) or patch 8 need upd=
ating.
Yes, you are right. I will remove 0 as a valid value in v4.

Thanks
Lucas
>
>
> Best regards,
> Martin
