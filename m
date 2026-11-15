Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781266;
	b=sE6Xd6AAKppmEagitZvfAEO2Mwt7FZzqnz3TECI/PK/LH+rJCFQ3GFjeSB7WJ5slaOmr
	 UqvpXSMRAkHOTymsV9D+FnrBrFad41FHyrXQPVewXo8whepqsjwFuYB4l3BMsNGyL+BUs
	 t44lRibEWb5+5BtQODcHk2cWnku0D08FhdIFXnQ0TwZRo3umxxtrgbJqsc8QBm4ZgCgt4
	 QkbviPQFRDKrRZlYt3IXd9oUDY48sU4jv1GJ3E94gbUcIrWogC7Iuh7lVanNhTd/mL7Xl
	 t9DIVsfCWautzL4ANlz+O+hzLHLOeSTcZo5UBCRs2RfUlvTHU4cf1k7hbgccobN61YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
	b=tcq+QlwI84asxGkJGjx46uv32orvc2mP7A7gOdyc0q+nlfF3C6d4k8tRGKgNIrnxRakm
	 Ynt5pmr9nyE231Re59MYnH+c18HQs399a21L9NXOG70crNJpr2ZmDi5uo5QLGVeRLfLiN
	 GklSy0Dx9SXP5T/1w4MlpcjM0cMvyxIYR9wG3iLxnE+8dg1SeerT/ENHS9zD7LIsShD2J
	 tmwKGjyhJyEoIvLFiH8IQThR/xKg3/vjmwI2o0ILxxhfzh/ZmlWUM2XrPRM2dKsXhlD+R
	 fjm0Qi3kKlHlEdqXVooMjbbS9pc7JnJX3g1EZOiZ7x1zjnD9IBc6CGiwwYp/R8xZpUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRWuzLs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C87606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C87606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRWuzLs
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2673376d50.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794781264; cv=none;
        d=google.com; s=arc-20260327;
        b=XFBGuPfe/qQpkBdoThskS2/7dOwMPJTuyWnmaguzKpoBUa0Kr5mXtTmaMZDANI+KUA
         iYfgNWVfuINb8L2fJBiqW6O/I70oV1eBwEne/W0rQXQmNwvNFeKOqaaAC9TXaOsYOYoO
         TtFDz+dLLMFWs1l6j32cFF1siJ2a2OnvIzg324rLVGDE5hBZzOs2RRKiwKaIDX6gJcCw
         sqrUhgopyVuVToVueuM1ifIrIacnteX6YkpUK7USCj7gpcoNf6xdGAHkwXb+UT+Vvz1G
         RoinxPh5gvYadsVJ2lK7ypWhZ7g2r32QJqJtQuVEvmU57l2M9HcDWD3xuVtkbfdy/ExU
         Bg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        fh=esf0dMLPNrlJsebhpqPgi1YAZ3QGiUvYT8MCbDWWRik=;
        b=J5I4TeDXfzwWYihzj1RS6pPaMw8wSGc1XA7WWWgqjhJ3L1lizIMQ+zR8eAHggm5yuq
         VhD1RFzWwq1FzUvdmKSPSKCbzmePvxoEO9ECyHI0RiMIZlmmtKrMtq+Z91kd/Zp0F7vh
         NvLGQcJnsCrWMhV5dzxBe2D2l3uGj0OcpURpMgffUcRpVm0OQWTmFOfVCu6V7blibpWU
         vhklt5j+KIFw8fpEUwGk4GnrnCYNf4aVB/GKwIP4PO6k7oJlFx0mSrc/E+ojm02XRXXR
         FlD1spUVEA2Bs1nHXmRwaOQvxEp/XSppbSvS2jJS7rXF6I79tNc2eVS4RTrp/nh/ofqE
         Bz3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794781264; x=1795386064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=ohRWuzLskucdZexyQNJ+heplSWXTaJEIIm7suUD2DWYYOw3bnEfYiwHRYTQCmL/v3E
         xwwWqRiJ+eBb7u6IhQcghQVUllcYPsaVimvlgY2YtViPXRF14a83f8Bjd/3xDRDYBNhN
         TVIZ8Hr0BlNeaTbuAdwZpKqiPpAAhqBi1bLs/CvCjludvcbtIj9zZ1VdNoUt8W0SJJA3
         GBkVqjX6DJAHOT7fGd9fRQcmI+yShx/YpUiWjyImkVDlCzoW0hSM/eaJVZIrdq6T5ScQ
         wMrz5zB4WQX2HfdLQlBr9kqUa12qUbNMbA/VVh59+oT6rDVABxNJxxVOaQZXOMOmQ1h0
         HrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781264; x=1795386064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=WBQixkeseYnOhYXF+sSno0DadBzrccsYBOGlT6+jH5MU6v0DqnEyc9yx4181Gac2mF
         rKAYG0W+ot9FChgY10kYt5ddz2KD8Qp7ZjJ5/UZHP+Sm/TqqSYLLXOJ79qwnA9zcom6q
         lGFLV4uxZ5k534onVEQyXfp9Fooc3KpJyOSwzaO5ZabMumztWQfz3MOwld41xXF/maW1
         pFheNNKpCJ/AC065AkA80UBaPTbigEg6Y4HLseTylaspdFIig+zYxhUFPtt2e+c3Evjl
         B4mkkSQgs5qM/1khIKoWArAWJHK69VUhr1aRgeQjLL3tq/S/5ovpswSQvAPLs78TQDdM
         EwYA==
X-Forwarded-Encrypted: i=1; AL+hErGnCnABtEYYKe9fW5xJjY5Cm/J1jAr6SqeKkWoxY2iDpczAacenFgkiClioueIzdo6eZQrNCKyCPosE@vger.kernel.org
X-Gm-Message-State: APuU4Z++dLE246umIkXEQVC7353EYdyxhNDN07aC98khD9Ya82pA2ouZ
	sM3davnBCO5xfp+zaBVVYeSVFnR+Zhvh/EcOlklfpth5xzD+WJ33ZF9PPyrDFlHQ/cj2tIyjusg
	p45jWtc4oa3r45o6cKxl6z80DtDKg1Hw=
X-Gm-Gg: AZFdTZc2SwZsmAGGBnnttVYMgomeABcPLOXsJPVEGE0oQ+ZutOi2iwLFd+TA1LsUWuU
	6uIYnyqmyzeKyOySYB3grTcZzSs6Y5G1QGASITKNjXsoG4mduym6P/PuS392N7S1AN9ZD5QCXju
	hz2Eucujo9pgAbwHKCrfP3MiKUsOAHSjYVBHakqqHu7tlOMknSsvaJgxn52zzf0/oyJTqsYgmrL
	dTTzzGT8c4eD8tDgq2UO//4HnVEsOvFdpjI26XVB10e1gU6hTObnV3erLXwZek57HRvCwKCXLlL
	0xoz2PBcYYv78JQNfmMTyq/nVP5mB34EbGRtjap4DiW1H5D7Pbmrc1wqq+ALGBLq5/c/9KX7gkm
	fIwTlfXDrPQ0m43op5NNtgriW+gg4lI+oB1psj/7A2CrugLQ0e0lfyPYf5dfiF6t2kKX2BfS10C
	xG1lcmls+M2VElIRo=
X-Received: by 2002:a05:690e:4086:b0:67d:a3f0:7dac with SMTP id
 956f58d0204a3-67da3f0917amr1936855d50.14.1794781264626; Sun, 15 Nov 2026
 14:21:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:20:53 +0100
X-Gm-Features: AclHuK-51aJAWSj3WTQV4S_5nCaT5gjYIQp2CQlsLrogi8Dpichyl4UfpyRzP20
Message-ID: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Describe the system clock of each PWM controller as a third clock,
> and add the clock-names property expected by the updated binding:
> "channel-a", "channel-b" and "bus".
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 12 +++++++++---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi   | 20 +++++++++++++++-----
note: a single patch per SoC is easier for me to review but we don't
have a strict rule.
