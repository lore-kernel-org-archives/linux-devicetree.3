Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08739A049
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428508; cv=none; b=p5MLAOSIu18Vz6dCiKHqKf2xCltxNUeok/83LpWJE3u0LUeqKeN59ZG2zCIKs5u9ChW7YP9XrlIMkcbXtpgXkC6SUND6dLWKWX2fjA8bLSH+TJJluyzT3rVirsMqKzVpCtFbgdi7L/Q6yB48KoSf8s9hRdnL+v23/9A5CpIS3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428508; c=relaxed/simple;
	bh=Ui/B+EjELq89M7DdOa1qJ2iByB45eUm71MnYOkLiSuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBXQ6XSuPhurW1a5SQtr5LckPM4FruYZeLiMoHKKYdBihMPxmkwXfrs1484ArWHd+m1yiYwgkgazwk8fmPT2KpX30/K0m6TPMX29vHySB1zmXOIKxWURn1S+o7pFlX2biWTq589K4bGPU2v9guoxQ2qZDDz1kZWxVkbXwAYuPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad019bbd4so6231816d50.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428506; x=1775033306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ui/B+EjELq89M7DdOa1qJ2iByB45eUm71MnYOkLiSuk=;
        b=bud5sXfVQQDKVA6gJrNUl7c4v02TEBC0ffSGIbivucaCRlfmQPQEfKrWkg0i1qLFjJ
         HQ4fy34Dyr7olBKWLWfVYX4Wn1dylerX4js2WelGcyczcN6mZEPlQpls4gn1nWbW7y+0
         6L4Bxz519byoyeP9e44MwV/+fAHbXMroReI6j+kbeiZPq1vsoD9HRoxuebLgierxG2hD
         5pbhM9vgngq/aFxQudQ+YQufWM/rzHUFa3RWWCwOdq0On1PkOYlfqp+/fyd6cmCdlCWc
         xSiIbhTKmoIdlGvLKc6HDxvSBdkoJA8b4L1PFWpZYnS+z5+CSzWHklIq+ikktL/+tTvX
         KPJw==
X-Forwarded-Encrypted: i=1; AJvYcCUt3gpnpyE4tOrCWkUrTD0uVbVcOM/6mIw3fUutC2qLri1ugHd48U3i88vEA+PphaAvvz0hFBPxvUd9@vger.kernel.org
X-Gm-Message-State: AOJu0YxqsQcZne2UhpMRqRKe2t5E4cy7cVw5ASMPgBXOZ5fS+3P2GhO6
	8GDmPEP57nWqMlgP2+x7Mk5TONrH9kuSPVQoT1ql1OasAmPdMi3/Yq6pyY5QAgO9
X-Gm-Gg: ATEYQzzrbYA5U+aOfn1nkq8b+ze/n55n06G1xNAeJInvL5YsisAmqTrld7X3IdqO+W7
	nYqgR1xkXonCf7cQ7vd+OP2TzZ6rLRBfHcAp1o2LWHmWFg2LvWfw+CgmyAPi5Uz56Au2WNIwG3h
	flrGwdm8i6KHb1kxeqdGuTve85mg/nqIvvHl0HLyPdulw6xWJHgEkpjzv4ObJDi2wQHl5QvpX6+
	9/xVHLjP6R56h3eqKhj6JH+E9E4QOf+oC5nF6sm8Iuv6L7O7fHmP7BZkNUvcUiqw9Oj5t1bzgwt
	giIR/e9wnJ7xqcn3Wf0GgyfOL5WJgXJqGd9AHUr16GSC7mjbHDv3xgI5balYBY5JKEpWieNnWd9
	OdPOS5zZRYZ+TcefVKNxg1081QzbY0tqSuPIi56pqtc4wF+rWF63VUkUBcohiwK3Z96ztiTmoUM
	Pj/s+96OXKkOBeiWOCH0qkCvpvcMK/x53g+I1Je6es1Qn/OA1B13ZfMMRY03cPpTvFsec1vtqMF
	42BovtGcEYAb9n3Xj1qloMkOkuWitIz0GCR89AkEGC3zQ03coFKFbes
X-Received: by 2002:a05:690c:39b:b0:79a:702b:4ecc with SMTP id 00721157ae682-79acf6f60f2mr25936947b3.55.1774428505936;
        Wed, 25 Mar 2026 01:48:25 -0700 (PDT)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com. [74.125.224.45])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f4190sm85026437b3.15.2026.03.25.01.48.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:48:25 -0700 (PDT)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad019bbd4so6231787d50.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaGiglvPLtlmfnB/APdbq+kwWewSq+ie1ICmwPTz0cjAw4afO1uLO4pAyhpQxrcMl54XEbVr/fp+55@vger.kernel.org
X-Received: by 2002:a53:ab0f:0:b0:64e:a737:e1ab with SMTP id
 956f58d0204a3-64ee616314dmr1908327d50.37.1774428504983; Wed, 25 Mar 2026
 01:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325063254.18062-1-email@sirat.me> <20260325063254.18062-2-email@sirat.me>
 <20260325-gentle-earthworm-of-progress-1f9f46@quoll>
In-Reply-To: <20260325-gentle-earthworm-of-progress-1f9f46@quoll>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 14:48:13 +0600
X-Gmail-Original-Message-ID: <CANn+LW+Y6j0xk2x02-BUL9qNq2gf-PXspi4wP_KGd7Abz3hOYw@mail.gmail.com>
X-Gm-Features: AQROBzCPEuZJqZcCIIPP-FKaXO5te60icvGpBgjyHBWGoldVR2MwA1H_0wSNnhM
Message-ID: <CANn+LW+Y6j0xk2x02-BUL9qNq2gf-PXspi4wP_KGd7Abz3hOYw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Mar 25, 2026 at 12:32:22PM +0600, Siratul Islam wrote:
> > Add device tree binding documentation for the STMicroelectronics
> > VL53L1X Time-of-Flight ranging sensor connected via I2C.
> >
> > Make vdd-supply required. The device requires power to operate
> > and the property should have been required from the start.
>
> That's ABI break and device for many years was working fine, so this
> should not be changed.
>
Jonathan and David asked that vdd-supply be made required. I feel like
there is a conflict here that I am not able to resolve myself.

What I think about it is the binding does not correctly describe the
hardware and we should consider this a bug and fix it.
The driver worked because of a fallback mechanism (dummy/fake
regulator) and not because power was optional.

But I am willing to follow whatever consensus is agreed upon.

Thanks,
Sirat
