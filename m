Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC13E315E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915725; cv=pass; b=Rp2oRcUm23I8odLeDdosMoUoKsZ9MFjvTCRwpKPYCgQsnwb2wFWhr3P012NajQoZscMDCqYfM3iRSyXRfPTOy8Rd4rW+Ovqkwdwkd+2Sg0vpuAYyXISJ1bE6M28bEscOI80YyrjGBgnrqy0QJGpOF/ql2fjr+kM+CLAwLf/LXvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915725; c=relaxed/simple;
	bh=AswoXktvAEUZ20MhH+7Es3c6Uxz+yoTQifNNp5Zbtqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKV1038JdYD5JyVWPPEfvuSYYaCLyP00j6DH5TTFKjB6uYjk7DFAdzL4o5jmuhkvnVWm7TXcECwUBpyMMrpc/yX221/c0lEbYibLnmICSVY443mCPuC7/XwY3jgHS/r6RU2V/7lC9o4TLOvUsu5D5/zSb35ScYEKEpDL/mc2l3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVBM1ocm; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVBM1ocm"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so541074e87.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785915722; cv=none;
        d=google.com; s=arc-20260327;
        b=HqW6stXcLQ07pVz5U5vstyzMw9GAqDx6GuKlMMHyQjuoe2PT4TlD2MixCzEgkHw0tG
         nYDQF3oi5o7ZtvPkWjlAFRrUBuh9wwneh7ICeBkMc/6sRxRnK/UBaSgrAlEYddGTc+7z
         gOr+vZ42k8vW3Hfo9hR07QNlnqEmiUN4VbEVGc38qEwP0REj3uVbXPMl5IIkIAjj5xOY
         4H/xyaKDQ9kD1CES7jtrYmdb4aY1lIlIbu4wPBa+LULhjTWlhAYjB9oWiIOAiNvmtP3r
         oxDxtQN4+8GjT2T06DuZVRoYqDX7cy3WENxY00x/JZjxs98ieKQ/Wfyj+YRhmPsNcPkk
         HMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGMmfuIwdnIVm/Rp/G4jSIrqN3Z/dLwwZ2hEaeu7tYk=;
        fh=r3j22Yn3xvpAZ0zRVnViUbWShZsATJYEkJzxgFmhwZ8=;
        b=MZ+P38oBnstML6gj2414BEgHuwZCneLWr43QKYQQdTBs/gxUeCpxLoLpK6n5QPp6tP
         eeokEY2ap8zk0H8C9NikZOhv51/oGeiQoLy8YfIu9uvC4SxTtLOIW7aUYZRkCgiDckiF
         Wo28vv7nH75w7JCdVM1p1gvCjqg6P6pAOCFP0hzfZd6ALAlpOWJ3+qyDrb7g+cKDj489
         wg2/OP7tv1DAYQ54Dm9HJ2yWfHi3Ueyun7Ad5SEqO/mvtoqucvqgtqF6U9baOj37mYk2
         m3/rJXomGZshDAB7Nh5HS53ymab81NbFSboQTQdXTk+mzRn+2E/nePAyWTXhFF6m3e+t
         1rZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785915722; x=1786520522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGMmfuIwdnIVm/Rp/G4jSIrqN3Z/dLwwZ2hEaeu7tYk=;
        b=jVBM1ocmK4rMsJgs2Res7nw3bcjwpalVLOzwifWKLqIJr06wnl8it3I0tJtRavb/TU
         AfvgTDcRR49CM19vVtpcr+3Oa2+53SDM3Fl5YOdcD3dJ7ta4LZBDy6indCnUYSVSNh4q
         GaR8IPakAMaoZ4zocKeWjLLEtUkIwAvIgee8WTvpWKx/eruyurBGvOc+zzch7+PK5sAh
         hGCdTO72jwQmimd6F3rtssqdJR0FphodLza/KabkFRGMVR4D8eGLZI8pSj4vLw/pHvbP
         xMtMP354MBFFJoVexzWnYsi3W5GQ6nySwxLSRRfZV7Ilr9LIsmThKz3HqpEAcbMycAwl
         wfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785915722; x=1786520522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGMmfuIwdnIVm/Rp/G4jSIrqN3Z/dLwwZ2hEaeu7tYk=;
        b=cIBwZwLe1G+1IE5J5teNat5AppckZowB8T12jQ9JsXiRYQj643eHDHNn++NMQw6SNK
         YA/6+N/qmEPXHQCeQbZy7zjlfcmD+e/XSVMpTXbY6stgdx8MJe+0nWhrdAqtbUOeEyT7
         LK2E5hyL5M6v4P3d9+qF0oo6DMyVxWADialNWIYOXxa5uhSW67OHIZGyY9IBmL9QFLh8
         H+/GMRnKYBkbP58FVMELbvQKyw7b0fKrEUGXmn8vVif4IMJj3+gcYSJeMkXXr6upk09J
         otH2T5QXigHlqXKrxOWZcqpYW3YAYJ4HDKKYUC1XSbxB1xVSBxFAKr4d1s8WFpiHI97h
         gBQA==
X-Forwarded-Encrypted: i=1; AHgh+RpF9SdMj+FBc/OlKb0+RKOqZr+m886EHcXm4u+Fnhc3f0MucXD5FMeB2PLfU1zzLfGpwvucaYFT/CbM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5G/gjtnsqVK7HWiE5AFNgh2/8K+TdolQJ3DSgCb7R+27xPzdr
	3Bx9zCjm+REzcSPnpLf+chIgwOKXDiAtwq/tLcznTHOuspKzTpm7rvQCkbEvlto4ZJiy+oihagQ
	cMo88LNrd+YUto79z1/PsBi0vnJuzcyU=
X-Gm-Gg: AR+sD1218P6TWHyXI0g9n0+akiReKfPmvdC8hnL3dtgocN1pMEHLQkp7+Sa2YDUnC8f
	0P8zd5hEEjAvUgCyBGwtx1jhkgGRVvHcz9ioqCUZLnnMsFEHKxyRn/GVfKmxHnOYAAqjviXCox7
	S7sB69r0HNoMShxhfoLThF+Cf2Qktf+s5klqY5gFStGZkT55n5yUpprZyAH+KARevbZ8X3Fco0x
	g1Xkf7c8bA56w3HPjbobUB4lf0tZREIMUfFmPIBmyyCM0Nmb6e73ZGe/a4GihFGLfagoFgIdwe3
	kuSEwGUq2x3g7XPuY4+JrNP0SiRUclDdqjkiRee472GAIg==
X-Received: by 2002:a05:6512:6683:20b0:5b0:1359:3dd4 with SMTP id
 2adb3069b0e04-5b2f4b88af4mr447689e87.5.1785915721814; Wed, 05 Aug 2026
 00:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
 <4841976e-ca36-45c0-a853-75c647bf8a79@kernel.org> <a225f41f-b13d-427a-b0ca-734267a8cc3f@kernel.org>
In-Reply-To: <a225f41f-b13d-427a-b0ca-734267a8cc3f@kernel.org>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 5 Aug 2026 15:44:49 +0800
X-Gm-Features: AUfX_mxwdY-FKRMg8LEDhx1tXYC8rPUI9XX82Z14K8p3oblYz1SQiIPB91b8PwA
Message-ID: <CAF7HswN1JicdLv4DLBV_baELq2heSedsGKvwWb7KvTUm7NkcFQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] iio: adc: Add support for Texas Instruments ADS112C04
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 2:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/08/2026 08:43, Krzysztof Kozlowski wrote:
> > On 05/08/2026 07:38, Kyle Hsieh wrote:
> >> This patch series introduces support for the Texas Instruments ADS112C=
04
> >> Analog-to-Digital Converters.
> >>
> >> The ADS112C04 (16-bit) is precision, low-power, delta-sigma ADCs with
> >> an I2C interface. They feature a flexible input multiplexer supporting
> >> single-ended and differential measurements, a programmable gain amplif=
ier,
> >> and an internal voltage reference.
> >>
> >> Note: While this chip shares similarities with the ADS112C14 (currentl=
y
> >> being upstreamed by David Lechner), the register maps and feature sets
> >> are sufficiently different to warrant a separate driver. However, the
> >> DT bindings and channel parsing logic have been aligned with the
> >> ADS112C14 conventions.
> >>
> >> This initial submission provides a minimal feature set (single-shot
> >> conversions and basic DRDY interrupt) covering current use cases.
> >>
> >> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> >> ---
> >> Changes in v3:
> >> - dt-bindings: iio: adc: ti,ads112c04:
> >>   - Resolved dt_binding_check errors by removing redundant $ref for
> >>     standard unit suffixes and fixing YAML array syntax.
> > Yet you still decided NOT TO TEST it before sending.
>
> Although after further looking this could be using properties added in
> iio tree, thus bot's report about failure.
>
> Well, if that is the case, that's unfortunate because if previous
> versions were not tested by you, this one cannot be tested by the bot,
> thus I look at this one as also untested.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

Thank you for the review and for following up in your second email.
I would like to clarify that I did indeed test v3 locally with `make
dt_binding_check`
before submitting, and it passed without any warnings on my end.

As you accurately pointed out in your follow-up, the CI bot failure
appears to be
a cross-tree dependency issue.  I apologize for not explicitly noting
this IIO tree
dependency in the cover letter to prevent the bot's confusion.

I have also just updated my local `dtschema` tool directly from the
devicetree-org
GitHub master branch, and running `make dt_binding_check` on my tree still
completes silently with zero errors.

Best regards,
Kyle Hsieh
