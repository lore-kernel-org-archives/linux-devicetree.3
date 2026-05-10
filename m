Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FA3FF1
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778377049; cv=pass; b=KxZup9mf5u8RxgjkjNc7zcHDQ2hiHJBEyu3ljezg4B2ZqgQbjvfwb6FVy9nCC5TixCCYUs6/AsfUVYDAWF6T93IeQTZXw17iWpBOWcbMV1PAomvW854i1O7uLr/8k+IzlnG+wtqWtK7w5bc78vNC73Y9PD9Fcc//xZrhtLeiZ+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778377049; c=relaxed/simple;
	bh=+dm3X3AxAH1CzBT9u3abmQDU7H/A0h7PeHVEJ7QCLcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okNj2z6C8KJLJx3+K6EHCmTK05BnYcktd1i/u8WXDYs5hDFETmm9GRXk0dFzuZ7sJb49HfAWSw/9kVHLZkRgnWYXrE1bHixcOu0RYl69OR8PwZJq4sQCeggI9jp1J+/qFYerO1pC3Fji4s9BxHG5/VKdrFiodY/nUxBjP6eJ/A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2I8Et+e; arc=pass smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2I8Et+e"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5a887ebb416so3078591e87.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 18:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778377046; cv=none;
        d=google.com; s=arc-20240605;
        b=C7L9ET9Kk5MjJVWPkM7GiUm0b1N1tkpWZ19SUi6xh8Y2BQch9KZwUr6Nyf5nlZwafc
         +uCNq29vIbiSWJEdnA7dyGe0wPbk0sC422bIew1Ia6m0H4OMT4rHVKDGkJ2y+TUSl5gc
         IHVG/bwlpSThYsAm9nmp1EkXSHyelGOzzoUsKUI5oA8G7wgH2JsTiurgCFiaOEJD+JJK
         OxXyiOyWbPT5wpbRnqFopDieWgvI5ttSn6KKbgsJivqlRti336yRppRmwL4FKYuJFY49
         gInW+SbPx3ibip8P80pm9hfYIcRd9f/A7cbCw/dMiHqKoiJYUrewgAI/q4BSPGaaMiRp
         L41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dm3X3AxAH1CzBT9u3abmQDU7H/A0h7PeHVEJ7QCLcc=;
        fh=QA80a6XUYIo7/d8kd5g4aSBkkzvjTE5UD+CdRpS3zSU=;
        b=Vl90sD7dOn1ZTGuU1Zpyurp8tEgIW+BGHHet2L0BfYwU4bAnRt2tQohg/o+//SZ7v5
         p+O592cio6SQUc/nEKPoMh4pWyaxjScFmqNIALaVVJsqCJZ8k8Ja3FFWNV1o2k7Km4EY
         3oSaaquNzICSFAtq6jyaSLmesDN9QcOXypvW+nExAXNJ/eqBH1AC/ZblJ/UhuZDDtWR9
         p/ygwAQKUIUwDzVYiXgxFbxHRZN5UBk+oDVRWF+DXaN20CREVc3h7uXPX44EUFaulcp4
         kxZI0SkeBFIGxtTebvRqQYMhq5khIT0ucqNHC4aRo/jBD5nm8Bq86QwXl6xHlJfzh8sq
         gDng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778377046; x=1778981846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dm3X3AxAH1CzBT9u3abmQDU7H/A0h7PeHVEJ7QCLcc=;
        b=N2I8Et+eVZW5Ar2PLI0f3pweur6sqzQslIevxzmVuQqc0vuBTMRw2RqfovL2MJTFoe
         NL5wywEcrJ9xuuUjTmeGyRHntVljIqVWvU2u0uLy0dCsKEGSC9lBDZSla2/BnMWAs6Oj
         Ues0w0tyrVLwkttINlzyqNCKx36gS0pd3U2nbnlGf376jhsFC74JnZK+3/8cC+PpDi7P
         QY3eIYXy1ZD/jmvWNjyEye1BUS+Ezvw4XP/WumZLheozjDreytG8CVud5ujs0UMQI+Ma
         BGsO5fQG899Uus0anca4D2C3aX5x7DgVNG9Nxl0dPKY1DYlu1XtJXL7elQjaAfV1iyT/
         Emgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778377046; x=1778981846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dm3X3AxAH1CzBT9u3abmQDU7H/A0h7PeHVEJ7QCLcc=;
        b=YG0FQBedxN6xEXI93WXQK2P1Gw6CgQbMxm91f0e+s/ZWR/Vou9b/lgXRb255gvqIMs
         OCEEXb/XBHVe8CETY8ovB2BB0O3No6jiinF37O2Pc8UpF6shhwArKJqfLjE63b6Gc64I
         RS/THMJ9Gl7qpd0dz9yQb3sd3okUGoLtkk7mEez8VKwEYki+dBrrzcvb6U0gX66UmXNo
         CB8wVtwhng3VDbxOyxn4tv9+nzzOZzUkHFgJMOKS4u0lhlBI1f2TCQotDcD8cb1F/Z+Q
         JNmXpgEBi13RsGpxZYQDN5J54lVJVWIjig9+aBCSZi30H0q/3WWnKahUtpZUazU2BP37
         PKTw==
X-Forwarded-Encrypted: i=1; AFNElJ823zk+WwO/ZYDyasfWNGT34JAZ5DwtZ9CO1ANhHCzE2+zbhWcEaAXkcwLugSjYlFM5b6/q1U0YLpnO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75UCk9XgMvk4Z6jXQxBLEk5SdJkp30Ww16fji8/gdosas5Mjw
	ntJgK3OFTwBlabcEXERkqgvnPvr0ffEWgZ8erEAfx7mqQYvQa9hztUX9NQhAbkXF+2fSDdmJ1Sk
	2znFBpDVtw8CAlED+L1Z2ydYB7mCiAwKdSNlDbPQ=
X-Gm-Gg: Acq92OGpG7dE/Ucqn1nBXMhIOcu/3M8bUxNqoyTIvOvcRcPaBuOlURLRL1VT6eN43BV
	XdNAwAevYNoTLh/ly8YWKwi1q09MHrFT80YnG2O6DXecfgWYEyn1BBIx9wU6X3pfp2ga0MxE7iL
	E6oYktMaF7lSs3GvwgxONc5LzgR2MYy17RiyOFCl8fkTNV3nPnr9YA2JG+kcH8PGVOi27eN0pdu
	kvpyFt6QYtRl+qIpzbH0Ld7mby6eJk2osaizFz18a2JfCkPxWuH0UM2FjqNbG0M7w+Nt9BTziFj
	gd1oKiPEFjWoOXsLdvApWswDAp0y+WIqvUL6rKHJsQ==
X-Received: by 2002:a05:6512:1587:b0:5a4:1672:59d0 with SMTP id
 2adb3069b0e04-5a887cdf1e9mr6037401e87.19.1778377046045; Sat, 09 May 2026
 18:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509022718.82957-1-dennylin0707@gmail.com>
 <20260509022718.82957-2-dennylin0707@gmail.com> <f6e2a4de-4c1d-46ef-b383-db62091fd0f4@baylibre.com>
In-Reply-To: <f6e2a4de-4c1d-46ef-b383-db62091fd0f4@baylibre.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Sat, 9 May 2026 18:37:14 -0700
X-Gm-Features: AVHnY4ICXEJPO9AIPLuyZ2gn1SDEAJLed5IGd-wpenxd8q9TNAgPUllmcOqkbtI
Message-ID: <CAGEkeHfeZWi99TMvkXHhMSrUS8PshuekqjszBXaS39VsLUZ4eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
To: David Lechner <dlechner@baylibre.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

> Why are we adding bindings without a driver to use them?

There is already a driver for these devices in
drivers/staging/iio/adc/ad7816.c, which includes OF match entries
for "adi,ad7816", "adi,ad7817", and "adi,ad7818".

This binding is intended to document the existing DT interface.

Thanks,
Hungyu

On Sat, May 9, 2026 at 3:13=E2=80=AFPM David Lechner <dlechner@baylibre.com=
> wrote:
>
> On 5/8/26 9:27 PM, Hungyu Lin wrote:
> > Add Device Tree binding documentation for the Analog Devices
> > AD7816, AD7817 and AD7818 SPI ADC devices.
> >
> Why are we adding bindings without a driver to use them?
