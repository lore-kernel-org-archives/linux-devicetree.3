Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13F4DBD71
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693701; cv=pass; b=n1Al982MbWk+5sh7aq8KbYpWrR0Ke/65u0e1hUzM+R/vWNA+ru+3gxvtCrHiq1BKY0EFJn2KRqC3E8oRfmH0OPIRYykf2xZzuVZtGHv/PMlcBzEqUG0EH5Mj+nLRxFisuA9QeEf3uhO0Sbxq2UPXCo+nlPIsAbw/RnuA7o1YPno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693701; c=relaxed/simple;
	bh=6mKKdTvK5cZhpi/RRSOEX613zOGTzbC3S1RaopRBLKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2kMfd7eUyEgzf+aNzbOgMRqpSdTsRW0RgGAADSps6j6wIX9DH4cL6O3F9Z+NZ/df62NB1RSAJtFkpWVChdAMQGlQHTSph2P9pJmPvfe4nWd/6MY5ooCoQ5GNKACAIfVlbynlWq3ctjA0TWqac5ZFGPDawsgyXhi3HHVoXKvwA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brbtuFEa; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brbtuFEa"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ff5472f263so3272715eec.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693698; cv=none;
        d=google.com; s=arc-20240605;
        b=g6zQ26FlPKQDxrmET2f3C9nIBHn6u52jI26tMN4vl2tt8qvAaZSXdPx7HRdbViINAw
         hn+AqAGxkokvr/JwY4jHD3frZ443ir0BICby4kKE20TCXhowniyCww/XLDWIcq+hcbOh
         EyKHb1wzt7KG9j3vSlzywtRLEl/lS1a4vFhybZvz47CdvYSvH7jG/ndwoIfdX5/EHKau
         WNm4SPrRTG5cdjK5uo2m3ZqM+TLsaudeYRgoUJJTYkJWi050/7rUaBl1tZwTLIjLOs7R
         tLExsCjpI0rXWskv9xTJqdhRP6Fy5YG7ur8cjuGeKyPd22d1ieg7xTQXbnzIpltQR3iX
         28nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        fh=34U/2xi6A6qwx6nuoVKcF8g9hT4/MpBqzwiVvwdjbIM=;
        b=J8Q1a6F9uKN6FkNGOM+lSO0wnlyXVY45Yk3YoiAgPd5hNsfqPtEv5y9etumeXhurhf
         9osV18R7UAc/DGL5Tqj1NIfbJ+WGHC/5Q4EYHAyQ9LJYx3VLNa5Q0ojkg0jERXfb8vU+
         cPa469XoeYblVywdisCX8jwHWLi8/Ua6yUVPy9ZJmkaXGeiHC2F4nvOygIXKFOMp1stv
         Ys2Q9rxjuguHidbBArJJTo1wn/cCs5WgH0sZUWYfhRsLHHqnBO072BLMXKhWyg2Ycx9/
         /CNk9S+PW1U8lFtxADMb0sy+zchz4JcDs8JLLZRTXTFm6MW0/hlgmszQ5RrfT1VFQEKg
         k1kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693698; x=1779298498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=brbtuFEazLvBam8XINvJDXjF4XU7Qkp7fQiYSxPQTepmB8WvWHIRTCVTi9pB7foIL6
         0/W0vSriBFjY2RkGafYIp3N8uXwzdwScxWHoxxZtSCBovdpx7Xs6FOZzh/qaY31Jdj4t
         YTTlWuFH78pT5gkN1IBaUJPpp6RW+DYyC8ZeQJH3a44yTQ/pe6jvRdvWuqzbIKYMG8lI
         dW5AKVf2w3DaVrMJWyNn2iCQS2VTQ9sx+a8YZfbdcW3HIpw/xpSzTfY/y9Abr41h77mW
         1GJBzvBbtWmE0LM1lNMS6ehhYxVqQdGvALg6fD25VRI6iRdjMP27lhMh7XgnHdknCdPQ
         xlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693698; x=1779298498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=BK//ELSchoFK3vpecQx5XwI+IFp6Scmml/X7jwwWbNtjZzXsLOzwKJ6HRita2Y3kDS
         tmpOgeWbjQFY+5MP2/uRjdA/nUgfyIqXnnTpmSXe8HXrwscjlQCNuS7ubsEIejJoR0jA
         QaBiPHOedYeKdncax50dAwCD0YGaGFPjf+SASU39o15vV++1SGusYpHS8HyJVkSFpN/i
         XL7BNuDaq2ZzbxAoocCrdfftJEYExSOzQZQyVyCOR2L+n26uWqBu791kfH9lYNw7QYwY
         BtUzpuIG4krN51WCjkV2WnCS8HLj1eZbVjE9SgVzNEtx65StEU38TS1j/UJ3CLK9Ip1D
         9DSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K4iMHbnwHBdyC4QKnwzRqrFWEjrw2MFsXx0SmHTdYV8/yQw9aV6GfHTKGtN/has/q70cT4dcMb0fs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9ANuiBTTGqGEk2Bfl3Z9GG/4MMxoa65COYUQuXcDfKBLQyO7
	bcPrrd5l9IKqPZesA4bpwfTuX78x04yiGvCP/FBn0725zxZ8YVPioVLPEuqzBD0WXTKK/ZwLv5r
	g/YsNVvWJsE1ua09rLLqnZjD+QTZ0vZI=
X-Gm-Gg: Acq92OE67GmzyHYWsKkTTXFlXQRAeTdMOEAkU2L/5A87qcUvWZEr4zoLE7WxQsgrxa1
	Q0JBRXiJ3x7i2Z2Ge4avrlWmOZziRQicaVTcGNHKe3Akfo2d6A1Pbb2VcUzyn3uuxAL3OQ/5ANJ
	hhTXg2o8/gUwUfkiNBJmS68doqnlCcY7jeCk1mfgOfAnAyoV4wODA+IUUcQMgnmeympHYffgby4
	1v25PYKlG72TeXTn19KiRVLh+soWHp9OdPa+Lf65MjPhAEpVa7uyXj2uiJl9r3AeDZi7eEa29gh
	4ovPYreXms6r7euQju0=
X-Received: by 2002:a05:7301:198c:b0:2da:d4b4:c85a with SMTP id
 5a478bee46e88-3011747e13bmr2818209eec.11.1778693697976; Wed, 13 May 2026
 10:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-2-clamor95@gmail.com>
In-Reply-To: <20260511135703.62470-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 13 May 2026 20:34:45 +0300
X-Gm-Features: AVHnY4Jn_9cXsf7GdBN5Zma5dh7sHSjSA1xGhyeTeuyfFq_71h-4QZdAyPVKUFI
Message-ID: <CAPVz0n2GkucfHqvgusF=K_KakqaJmZSLP=8VYMyVT5HAVDD_XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document
 nvidia,external-control property
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
7 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Document the nvidia,external-control property required, for example, for
> USB lines in HSIC mode connected to a modem, where the modem requires
> precise control over the USB bus to properly enumerate all its stages and
> intermediate devices.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 691d6cf02c27..a13c1ef49a57 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -75,6 +75,13 @@ properties:
>      type: boolean
>      deprecated: true
>
> +  nvidia,external-control:
> +    description:
> +      Indicates that the controller is configured externally and that th=
e host
> +      should not attempt to touch it. Usually used by a modem which requ=
ires
> +      precise bus configuration.
> +    type: boolean
> +

Would schema maintainers mind if I create separate schema like
chipidea,usb2-imx.yaml is handled? At the moment ci-hdrc-usb2 holds a
mixed properties of several SoC and can cause unwanted/unsupported
node combinations.

>    ulpi:
>      type: object
>      additionalProperties: false
> --
> 2.51.0
>
