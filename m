Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E32393DC0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905919; cv=pass; b=OgBsJWLgCI11oqBT7Yml4cjR71/YAFwpxiD4P4yil2mfW6L4yPiBfOhN0CJBxUw2yyBy88islZBr27MnaKTsH+EdDr5Q7QMH4BekwWnTjMxvbk10iq2mXHiaM3TBJ+yG3td37fzos7IHCeiTJPFezqtwFu+bRHaLGxweePB3TZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905919; c=relaxed/simple;
	bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG11I56Ua1Excq8UJwDU0Ufi63F7FHxEWmernkw8zy1MOIsm86AeTQmE6tyqNdobU4cEdGSJMstoWr4Gw7fSu8Qq/h1LE8+mumkyKgl9/3bQwsZ3tR+TO25JDBg0MmPDUF37upG2Kc8wnxNs1bmeFobk5VMVwJjoh2mps0Jyik8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=AwoOFgvl; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AwoOFgvl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ab46931cf1so43444965ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905918; cv=none;
        d=google.com; s=arc-20240605;
        b=Z3uxTGZt+B58OM7xWrydzEEBWJFgFZVAbo61JL2N5R2kcZMw+sEaIulq2Wi8tlhhF2
         5h3oEuYId36aehFD/C1P2HjD6ikMdDkYS9nqs2rKiBl/7dk2VHmddG7PfF5fIr83fX13
         eViBtmAKItipr0tbyzfPH613M4XJxaCAwuO6SFtd+2uWosdlUmfM5f8tdF/tEp7XRM6G
         8SB/4aVB2pyvoznQkpstRH6ikbUopuyygP9nGqPTlDN63ugWmgi00M+poVpgneNISDY9
         1erS9Ijd0/RCAVrUj4AK4BltG3VJanWXPWo3vG+u7kjCt1NSaW8ZGOGfb/FjW5XOKDw2
         7lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        fh=/VQ4kgOKzAeub15tW48K1+W+hlIguy4MJ/ltxmTs9O0=;
        b=dP6XoRD1UPZhj7P+ouUJSV19dkR450nnrmFEqYGTcQ5PuCdbFy7Nk0TfQMf2ljaoRs
         Uej/LkRzYspIkyupLEdoOcSBuMA4zZR9xnu8xY2xB+zuOxqYbC2AKOMKMgGKoqvE10vX
         Zvt6SaD9j5EeDyuGck613/EuYN1oXYV5Na3WUbl43FgUS9KPHYpwHM910VSNjfG0ANoK
         5SMpedaZTwMFayjoQenvGOlDu2a21H/84v0h4MjjDyron7KoZ88+BL1L1pMVXhtWrKDo
         2Rr9XTfSWDElSjD2N6vSt5UKv8RDbzNLe5nABNMwqFNkny4FHDAUQrXNsjaPdvjeNvU4
         NoXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774905918; x=1775510718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=AwoOFgvliq5PJfLraXn62NHs9HXqegPLZkUlYRmIQrolU5rpG/d/SV+jTeymr7nf9n
         UDQI8dfYhp7dv3c/8ACdJf+6V+ttr8Vpd+hiTyuIJab0gW2IMTvZhu1XmfUMTsxYaUaa
         CRpTWrlbrq9dYm1mx70bITjnsvDh4XKKDFV/BAWcmnYhGiCFtktTm3rL2wE9s3f/a3VZ
         ItH0tqeT5ZxRZYvW3SLspccNNvC6nJLQNnWfT+Ybom5IIe777l+UGVf29FypW9yKMGcL
         w0+14XCHgb45tMFvVzQci1WeeR1fEp7gednYxMRqLzb8gcZRdYM2GoOUj/FPrXxbWrl0
         duxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905918; x=1775510718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=gD9a3HTCSnqtOtn3H/rphoc7pJsWaqupS2iC+L2kixHdmQapyULnTbDcEj3nbTyI1U
         sEqAnwpeBo2Q8SIF316Pkg83tClpeFZBfthZM+/jYlJS0HX2dkzDtr2VXOMdRAVKhLyp
         EE5ojjTStEWmdFTAvSX9skocMy/1zgDYyxkKBn28QFj9m1d7jye6dXytj7nNrTlc8Fgl
         pZBGwie/QtehTwP3t0GSzXHYLpnEdYxcsOoNQFlBo1v3bDgXogryIwuJ7AFniy5iTwUo
         rYWnZhj5hZxpha6MOJUHZAugkWuHRIQ+40Ln6WXSGcbCsEpI7WvI21Q+pFijeKGv8uSK
         3Quw==
X-Forwarded-Encrypted: i=1; AJvYcCV5kxhHw66pN7EgaYFNurtiq1n3gwq4u+DjmzyaCL+w8E4l7wv9h0POD5wtIN5iwpoYDRnxL1hiOOkk@vger.kernel.org
X-Gm-Message-State: AOJu0YxWzkYAgttSxAugBsgHh9BJ2KxjsJBfJZMj6+lW2qP3bG6fw/r1
	3PJF49CEYk8uHlLimeO62GAtUxcyi5DkONOAm8/FMGiA5Dv+PLjfXf05euWXPjei3cy1AwBWHzK
	T+cNtwkw7jKWjgkxftQ0Bdv1ewL0Oleg=
X-Gm-Gg: ATEYQzwhdhZehqhhqQXrTDKoLDaqXa6HcLn8Hi50317sGepRwvy1oUAvCfCEwg/NDUv
	D/m6gxWkvUap4HbN9CUt1Q9f6Ss0tSNqPq+6dlNJUPRaixI0EJNjHSHW3US2CmrF+HqRwEpUeFz
	2uwl1+6BKznbgEgV2n93vkTfIVszvR0HULL8aZ+Zc3o7CU3tNFgch2CJeA+ZvbXXwan95q3Xhp+
	uTJxrW2u/3WRlMFLwik7msT5Xo7cZ2EvPzQntkarbEBFimpHbKOFxR4FoF388JMXdyaoP68pqU7
	yZNZlc3qETbYIbuH2Qnf98MXcrBcaEvg7ycLBrwc
X-Received: by 2002:a17:903:ac8:b0:2b2:5070:79 with SMTP id
 d9443c01a7336-2b25ef3a597mr9046465ad.18.1774905917931; Mon, 30 Mar 2026
 14:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:25:06 +0200
X-Gm-Features: AQROBzD-B_vEYsIVR0iEnkiRzA98GHw_jcG_pPIvLF9KA5m8ziV-gAP2mWQJyxA
Message-ID: <CAFBinCCOXSKqv23UVKK8W9JxhBGfajyW8_rvkaak62LiRBvUSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:53=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> Correct the interrupt number assigned to the Realtek PHY in the p230
>
> following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
> fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
> interrupt improvements [1].
>
> [1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumensting=
l@googlemail.com/
>
> Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on=
 some platforms")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Thank you! I don't have a matching device to verify this myself.
However, it's in line with commit 3106507e1004d ("ARM64: dts:
meson-gxm: fix q200 interrupt number") as IRQ 29 is GPIOZ_15 on GXBB
(but no longer on GXL/GXM). So this gets my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
