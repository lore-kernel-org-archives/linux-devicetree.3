Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5213EB811
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876666; cv=pass; b=l+SMsmwkOIGeujiSDmTNekORRB5UwNvSqeh9MIuN1SyvOY++dBU0P2VSH9S9IG/6kTt0r1ZfEQ1bfAc8w2cvqSiz2djt+fIOMkw3r3hsFhP2gi1qyfKKPsOGBq+/oyaOk77rwHr+ZV8FwWmu0e3iBJmoKSl/HyPRnxEUPMI3Evw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876666; c=relaxed/simple;
	bh=QZ3wSvSkL/0wVKdyMCF21HZibPbnmI4+jTlqZjkFSGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUh0zNaEwmMtDK1KvznxmQov1avMBKvs+b+/q0nnztx04BHOT5EwPAUNMcJfXbmYKCuTLdaInqbR0o/X3vDa4yXhxbdV4FqvQyU2t8QfCMNg3yWOAxvjis/a2j0M55uesDQ30RYyVD35bGQSokraa8NZJkxa1Uh+Y2MnmNigzIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seo+jOkl; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seo+jOkl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so15848758a12.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876654; cv=none;
        d=google.com; s=arc-20240605;
        b=NyEgHEUQefYZ4U6z6/m3r6AiuHd4m61vd4dw3I2g5cGT8gB86RmLHF0PV6fV6gOKay
         nbpjHzvdUOqbayQQGZTbRu+nruZAsXKfpEWw3JVES7ctEAfAHL80Nu5os5BWQTrk6RJL
         2kXLaMfh/aUaPjxFmi589PlKN++ht+t0jlYj0Cxo4IU4nfz3/McpCGMQiGaHAShjyp4r
         XN7mIeIzyHk/YeHWs+f3jpHm3sf5MRZXLR2R74CiRW9ObIbc6zRhxfrqU6k1BRHtAlFs
         IHE+vH/Btq/VwtKkcv8XZHZ/7mWyN8MgSzuapkSHbmvCtH6U7AV6hnDP0A9AhGVUeso7
         gF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        fh=jL0bwlTQs7pBFg/85b+tjY2UO124AkcMM4d1FI9KVXo=;
        b=hAQc8rR0y8GdWmURKMS3hdprxvR3RKUhUG6rHarsXTfp2EV1Lyie0fjcQE/P9urZre
         XKZ1td2WV/UXsbaIHlkMh2JAN1KcudjGLgAEekPUxvHdoTRuD9EavuiZSux+YCZ1jVdw
         Vma8tWsqcrhIHNe/myziW0RRfcDObW5N8itHL+H0bulgywnHY1FC8AA6VPL1vPSdMcfU
         Nb7ylUOuyl8ElvoV8ReEX7Cxb/TxGLQHyZyrnu8YogBZ5XjYTPgCXujnpCpGmCgk3aMV
         QKurp6OytA98kT69kco/VoGWzjGhTNTcIy1QT5pyXbeJrPqv4arDJGroFekFAPnyiSum
         2Crg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876654; x=1780481454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        b=seo+jOkl5Xu1W5khid8QBQvIOrmWT5XP3p4Gkx2bxy5BChjKGsdP5DY89Ekhrg6HqO
         15Mat1AScRE77HG1JGjy2IjIAIdNOvl6nQ7eevIzzrSlKbgN+/nb9E9a8UkiXL9z+ceR
         OGEq9+28Zfmu95y9+fbgtlDcLNgCWu2b81OKbrEU6l3kneQ86zzsNNusmmv3gEYX5n6w
         hD/LGhNGt+NlKRtqJ/k7K47y8nevlSzJ6mN2bJR3gA3mz6zXQT+T5jGJnuXsoeTPj5bG
         ek2Z3APj1y0uhDmw5dST6ui8UFTzK7tUAhAjsYYzHxpubvLpgLvPP7O2765JKktQ9aaA
         Se9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876654; x=1780481454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        b=PaWdm5vnXQtrrL7YRkhkG3lrMIvi6hn/Yf65mF7YOij41lFHqqV+MlRK0ehAIu5NQv
         xCWZjn7/rq7hcro6teyGmV9sKcpDqeCirnVKdr324Spw9c21u5I5cuIVxd2G1bUYRDk6
         XsE1ZOw5Np9BmZFR4sFhSqll8ZgWO+RyfGFE2+RfSaydmCAJnZyZ3vTU9jr7DSQmbhCR
         +s46UA+1aBtyl5RYMAqAfg9dBHIhqHP4IZsVa7V236e79yPnprMRb/soAs3kP9K6Q9WJ
         4OsI+XLLwRh909OCjREuttCF9jMQrjjwBnQhwG6ufq0aY76jgPwg+MQYJMqxUK+izYYM
         yKFg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tnau3QGMTKeqyEKV1XoNYspWOgjfcjepmeJX1HqmSwZAC8qANZRqMvUDqbFV0hY9vOL9i3e82Y6Vl@vger.kernel.org
X-Gm-Message-State: AOJu0YyJaAlSBYksco8HdmxHqnqyYg5qs4PPrxD8a7V7roQRf04jd2ee
	jBFJ5KkoItPPM5Z+iJ7OukNwqo/D4TORyEeUczii70ikP81PWmH3qs/8i6MTcBgRUcZ0LBh6PtN
	d0FEIo0iTwOjdRBAlR/J/dpwn88YO/ZE=
X-Gm-Gg: Acq92OGVQn/vuHAcReu7mGPf1sV5cxlUdWK1dsBb0+0ifRprSo+OZAUoZzIpqVBMiB7
	DFTVrr9ily7ud8K5zf/EW7Si+u4eWft7Qu/BtTTZRBkoPICWKoWSk8FdWxu6W28dM0YnnwBOFnd
	kkpew1bI9r78gDILrN/k4h9ocKAJ0RMRcRWfSZkh3uk527Lwq+hkLuXn74wEMEKV0Qmoqu1WBi8
	jDz569h2QBV20WiiQ+uZPNM9ErGLj0fl0NgqGC51GgeRGe9+D1LjGvv3U+YaceDKIb3+g9CcWgG
	uZa52BOpFmraSzUORUc2JRofIaftw6ZLMmHZ7V4Tw2xQuOALDWTVbWOjYZxu2pa7NB7taaiGdvO
	yOQ3/my9DC7kZy9BqAsXQLnNbvV+aLnIeU2TPK4sDPdJkIY3+rtSJG0EZ/kPxF0bYRLUqc2nwUX
	O/rjNx0RYxGVo=
X-Received: by 2002:a05:6402:e10:b0:680:ccda:55b9 with SMTP id
 4fb4d7f45d1cf-6889c47031cmr11491623a12.16.1779876654100; Wed, 27 May 2026
 03:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527100439.2507-1-always.starving0@gmail.com>
In-Reply-To: <20260527100439.2507-1-always.starving0@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 27 May 2026 11:10:42 +0100
X-Gm-Features: AVHnY4JlPoKqCIKLNNrN1rX1iqDaxTF9BRFdMP8ybmx0B9GH7QE8opWQ4tR49D4
Message-ID: <CALeDE9O74SBUR_ciurgvBC=uXyHELHab0du024CysWQUMKUEiw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Fix typo in gpio-line-names
To: Jinseok Kim <always.starving0@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 11:05, Jinseok Kim <always.starving0@gmail.com> wrote:
>
> Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

The bcm2711-rpi-cm4-io.dts looks to have the same typo so likely good
to fix them both at the same time. Should probably also add the
appropriate Fixes: tag,

> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> index 353bb50ce542..5469fa663526 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> @@ -110,7 +110,7 @@ &gpio {
>                           "GPIO26",
>                           "GPIO27",
>                           "RGMII_MDIO",
> -                         "RGMIO_MDC",
> +                         "RGMII_MDC",
>                           /* Used by BT module */
>                           "CTS0",               /* 30 */
>                           "RTS0",
> --
> 2.43.0
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
