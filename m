Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0553A874D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411418; cv=pass; b=Tpym4+xLm1xf0TCKDuPDRqjs174ixrRhpjsP623Zv/msXavQbPH1AoHGp8vjEMZ9IspO1floz6kCboRJwACl+4hSTUx0nss47iyNKZUkAkS359nBPG3w2ozTKQprt85EKBV50jox0tNODlS0gJ+01CTxVwx63PXDFdNfG0iOX/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411418; c=relaxed/simple;
	bh=D60AujOfPZ0xT2zKJkyrcq2Rg0wSz8afS1KCAGi/hDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk3kWUi7QNJThTZdxrEnQ9j7O3JXKt4F6yv7m0uVSGur9I+mgp+s+v5yFNyVhzVJ9qNyzzK5l08saWCTQlSbS/gh9we5kSuY7WIRU/078rGFp817SGSe+q40Xz7F9L6NDx30osaCkf2A+cWKJltPk8WLnnXcO5tUFFDcaqe1pFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oehiCSal; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oehiCSal"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67149cfbcb7so1481854d50.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789411413; cv=none;
        d=google.com; s=arc-20260327;
        b=oyhBC3Cn0/B9OsC49uWAdwXqzpGzi4R/1JBSb9IYY5COBdloWSTGv74wc9TWNRn5hQ
         UxfNkxx3jK/0Q9N4nbh1gKGCKU7amQYcCKMjMPpax34AP8yQeYT1ZZMl6IvLkAl2AQSl
         ENTWKGprhFtQMwI0kldgra0Smy6WfFMaWan9K2lKBRIwf7+cp5bUa28r9oz1HxZ0Of26
         KLyoRKt8fzQdUE2u/bbs7kFw6UpPyUPngIlwBqNRc6sqsoQYZL1lwDknHNm4hXY/7ZKN
         ykhiVCHoM1CjR2TbdlCV+d8J9U5wxn1oMHnsuu++D0mpKIuVrOD0fiHUSrxmDOmEu/XR
         NMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        fh=V62vkGaPIMeHSBRWZ8j/j0H+2Nh28+JW+q/yyAi0pP8=;
        b=mFLbOdhdxQxMb79eGZY6BUdhbRuEwy/kzhdJkDHXXupSr12lK50FDNKhW2M2SRlcbM
         2mSaHpjyLSy7G5KilNCfJyxr7zfZxA3Tu4LZYYjMF0l46sJEyOHhOZYAmLv70FV0BtvL
         vOAtD7jMH9RyKYKtSfEeY2vlvZsGEKg2mraH9dU4zV9abBDqmi/E4XaFhzNDlvX+VtoW
         A9svHN31hi/hefpKVzySLyznPxgvDFPXU7Gk6dPyFzR3D5DIvEfu80XJ+GP4jHQwgbiG
         JvVcmBDFuvTQKD6Z3b2cbZM39iw5k7cQv5pqeD4Mti7DpGrft/EKCMguXCRduZ2XbUJc
         XDgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789411413; x=1790016213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=oehiCSal6mkocd3l0eyyBhL6M49PFLZaKereHNIo5IKdRfOHE+M3YJIhgLtEKXbxE4
         m4YguuBA5Fjy6vxGvM9k2PVI2arPGhcAcUgIEslDJtyXnTt3VEqkcp2GyKBnxj5XjSoA
         OgprWDC8XQ7QSThSf+bV7qKJD5kV4KnCwHqm2OxnB8ryopEewVbE47kPodAssBGF9eD8
         X9xq44zO/4g+gewqab4YmfR9vjJB1JLxSvAPacrNyhpEFfGgfLWKyzsLy5epmVXyed7N
         UbMmwPWFdRr3c0XsPIST9/hhnsCiTqZYMvmqfLiuk81/7MEcsJupEhE4MbOmTFN+SV2k
         PNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411413; x=1790016213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=Zpcaao/YQgSjBn1J03YQbvVpJeoBVPvunk7KFuAgqt2X3aYPFmL4hMAdlxGtg1gu0/
         ms98BOdyy/pTqwXwlqFPRLMZNZcCer9lK8kiAAAzgaXFdwVmU96iFI+IRzeIB1XSB6/D
         8B42Qvm7RkYZG2E9ZPM9Gs4UCOrJAyTq+4ivLAqwgAOcwtyuBSQYM4YJTNfvAAQc7Sng
         beEXwLb9OHNC4ZFbpWnCDmBpvpft6I8n5yJ/b2Uruz91Dro8rfsncbz59dFcNaw/Ysui
         iZDg3ObVnBsJ7HTf9u0AsvuojdtS+YcUTBXvWxQBJGh2xpgKGYTdFhRF1kHwP9PSh2WS
         /iww==
X-Forwarded-Encrypted: i=1; AKwUvBzY5IbfRfG8whxZ5vdBIJJ9vrB2kQIVgvOtLp3MyIyDxwo2bwJ79Jrv/Zr0Ivzqr5t3YMcBZaSRUlUC@vger.kernel.org
X-Gm-Message-State: AFuF++nOorj95OpZBf0nrzywRYfwX6cBve0vOfAMKbyaJZ+h490zDvK7
	rBM9mkh/Dkn+LMiaj8WxXCRxqAmYaUQ4NXdFwoQhAdKt7hOHbF38oMMjzLAtSihxaKW6YX15dVl
	zLPw6ElAv0fCXbiTP14m8y3K3Kn4MiIoqolXiJcKIog==
X-Gm-Gg: AYBFou0zyr6EZZz23qVQaDMC+K/L2iYusRB8PXvQf35Khpp29xPnaR4DkwRFAXmCuh1
	bmIMgpT3v4F7b+Ah0/seLKNymcZKklnqL7nF+Ae2Lsg4zlPC0ByHRefOBWRFg0D5jYoOii9/vTA
	+d3thQ108qvVQtjcdqjR2mHCkt3XZDSM83VUO+aYO85NLFIokx+mJXAkiijJ9X4TsS5J89sGTWh
	fcb34BrYAxE+knH0pa3QQGF5EjoJpAxc3gBd0x6aRsCsu6OLMbvXDZt63PqVzQGCZLBiukcpaNL
	AdMsRikuv//qQCtRrf5+SjK4Lw5bcIVQylt8y6jZ+wGKfSk/O/g8UeIO9aGq82JaCVEQlawTB39
	mQCuYZct336zYfEhFazIuowwE
X-Received: by 2002:a05:690e:43cd:b0:671:2d01:48e3 with SMTP id
 956f58d0204a3-6714dff5dd3mr885822d50.29.1789411412494; Mon, 14 Sep 2026
 11:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 14 Sep 2026 13:43:18 -0500
X-Gm-Features: AcwNN1X6rEhWyvGZGxC5VaFgYQL-l7UNaKIM-imvsW05a09IZ7DLJYvbUNRH2HQ
Message-ID: <CAPLW+4=5KqfFxUQ5Td6PXfoKG-vdTkzYDF-sDAyODdXKSripzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:58=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
