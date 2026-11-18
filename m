Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999082;
	b=OFxTjmqF3pRzYaQRI4QHOcQr48KS+Y9kIG0Z6T1YS11jVsH52LRIjaWyQ+yY89FGFuXq
	 Wn3UHJIIdCxFDzEQBG0O+UzNIoLgDD4DTTa/eeS8wTTEG3SxI1RvVSY7M0tebsbsp3MEm
	 e9DARTwNqqnp//bgYsWlCwLL4rwJIdWl9iHFRvCX8SGEdDkog1f1552m+NcaityIfGDdw
	 oOulPVfS8RCbhgfubdQM/OHX/JNUcxKdhUieRkWYAEkaOfJjAtv+laXkBTjBQy7AvQrKK
	 LuotpYSGbUmI2EOGWeatfRABm7ilcSEM9BZO5BKHHlWTnI2MRc2XOljThemDsCrkkQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
	b=vV2EMfiF9OJO575PCNYPukWdIuiVdsvg8ljX5i+Sn9EFbQHI+fbHAewuu4zp+PbY5iC4
	 1LgayDOtMuoFco7QPjidJvYPfHeO+6J39VxMNyJyljn/Jxt+SQjrVDKRXIcGnjkw9c66y
	 S+YCXoFAR+zVwU4YEtOkeM4Os50QNuBDetwRvN1Ie+3pgiBQnvLh5dfr7F1F0fUYQz1pc
	 SXUvrwMa4OTSYPAvHzDbcadNI+Am2hnr4lFo27foet2CazRWg9haxbBNQ0No8d64gi04n
	 Gc+Yj48P3xZt/coXt/gtvMOX78XiZiz0+VpLdXx3euniUZl8994MgPUQmBAp0SW9TiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93833606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93833606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso2270184a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999080; cv=none;
        d=google.com; s=arc-20260327;
        b=jaUN2ytbdyLl8bcblLnEcUO7GkpCQkzyY9O8a+H4459zLFlcem7BvYGNgIbi3lu+tL
         7z97niwj0TwezmJhCJpRLWViZ2z9/4lsv2qRQjO0iq+A+XmG1vJrwkqVxFsyCa65xc8u
         cD6/3FpUF4vBHvB8DbxM2h/AisEtYjKe2ewaxvs1c1Gt8fau4b5BI7j6/iThhBH3ZSgx
         eKQ0DRs07lsvQdfREVRVhG54G5ZA+i1eAAFqtuckkrKQgQoNEscKYUYIRYioC4GVbcNL
         gTbqfpwTUhz3n9N9ohhj8LJk/FPCNZpnDjGK8h0KEmc8nwtaNQH7hWk//hKJl7teQMtC
         keEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        fh=ToFdQ0B7oHShvkiMRzBVS75INe7qAtl2MDqrDrXr98s=;
        b=mDPkQkmYCnm4QbzghDNJZWLii1r32Ur1UvHFrg130nRDodX80mYOtdWCUJb1H8pqFP
         Ia4DGg6iKj6l5dl4tTZKAT4CgRu1GGX1OxBg12zKPeVZs3yG9nIkHvXaB0UJe2gFesYo
         QQMHks5CCulXbAV55lW9yF3Lb1qPooP6xGARcJ2VtXmlBla+7YEi7bu1bSOfnEYX9ujw
         IBsgfwH/tQxKdQtj8xdqfElBg2tCxcnRgfBHxiT1A44BZo1/69VNHyLsufodTJzIoRwJ
         enFpMujuYsR3Tg7754xKI7V7KpzopGBJW/AqWVJ1ytJq/1O3P9xVQGGO+miipY3GJpPT
         tVpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794999080; x=1795603880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=uzGy7acL7JuuRoYHzLCV05CAVl256ema53eZwWGcIfsJ4ScGO3EcF4VCAxcAkoruNC
         wU6VGwNFXzYXBni75pukdRy1iA4xaO096szSWrf2aN6iDVGhs59LzMJwxxYbPhru7CJu
         9fzolDtFEd+ybxINOVJ/7oI48WxDFqdb8pw3SPTKyU0zBdypMFGcuGEo7kojCBQ0+OWV
         z4lftMdE3Tinu0jTJWiy8vAgPZEr1elRKk4fKNxpPDTdNow67v/0gQR/jezZDRDQSc18
         PEeioPSLmy14kn0e16zukPCiTWmvXsqU3wfSZHBU36kOatBY6iBDfcEgUVdwwHSQ7Ucw
         N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999080; x=1795603880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=gAdxsxxNpaQUMu7LZQJ/9to23BaoIge9BoQpuuAO2Jr7lIJLyipPECgmuTPmJJqcTD
         w7IblD1LCxnmnckDpznfzOH823ziSd+fS7Ft8SDO3PIGUrFBwAzvGRzaj1YkgvOuupz6
         W0o+Fjov6GicN9P9OWei2FYWeMCiQdCgwZTr4vPgXTGT0FUBIFnvhd9J5l1tKl9t9aNS
         ezH7xP856JPEq9uGKCNjJC465RDSEkjJVa+GBEjPsm2ksO18EyWptwfU7ZLb1eic4eFg
         FjZKnNJ7mupFTrIfaP+7d+K72Jh8NVYQFxImOcGgI670ZPLU9WA61c72RYxFJ32eyEgn
         RVRA==
X-Forwarded-Encrypted: i=1; AL+hErGsUfQwH5c9+6nHi7+pOTMTYGbctCHof/cEf9DqIlOowuhj9+At8WgXJiIc1H47Bm2BLgkx+sZPUCCS@vger.kernel.org
X-Gm-Message-State: APuU4Z9VsCF8/xhvC34TlahYCDsWRxW3lNYIuEt8GCRRGI2eXYWCGUZr
	I/KmIBPoOiOO04UR9dJFBWKZ5obpchBw8xcHdjE+xiIPgKTNwmumKAFkFxZJ83yGpnKAB6HD61y
	b13FZ60xyEZZG7D14DdYfLc9vVTTJlw0QEIHpqJy5rg==
X-Gm-Gg: AYBFou2kw0axBohKMOLNbxtkqlUhQFs2Dv6l12rw1uMIh9izeSwpB99NuiBDLDQKD+N
	tHJsO5ZSOTuQo89DavdU5MbVr3nB/+4MgiV3xSL/C8oLvgVZbkW6ym2VGH0nj6qvwGg5czXyh6z
	bphgOOIemzt5nblViG2Pp5RBr7oS9YGrTzI4oCTfIv7o7jsPG+7nqPWzbPX6IOYknfKwQQzctw7
	3e/b7cd2/d38+Hbdx7ah86GXNwwrpVJK0OicPqNjKSKimI2eBfETOiY71EwLZAfXVcI4FYO1gkh
	Z52jPhe8EKdjgzjkl7yCZ7LJcuOu9EgrROIiYFywOm1fSZiAjVklZ6ZeAzfz0Fwjce5k8CfcfaM
	Idqud49gW1Z9Z11MkDRNeN0sp3FrwzaPMIRAgv7zMyg6n7qeuuvcRoJeDapK720Yt6w+QHTM=
X-Received: by 2002:a05:6402:a513:20b0:6b7:a647:d6ec with SMTP id
 4fb4d7f45d1cf-6b887f0d11amr1156171a12.5.1794999079857; Wed, 18 Nov 2026
 02:51:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Nov 2026 10:51:07 +0000
X-Gm-Features: AclHuK-Y9_U7OVUZSj7mMfHViEYJaBBmRFeKE5RJI3gsS9G5CebJQE_OwkvnRns
Message-ID: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Note8
To: =?UTF-8?B?VHLhuqduIFRydW5nIE5ow6Ju?= <nhan.094.vn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tr=E1=BA=A7n,

On Wed, 18 Nov 2026 at 08:43, Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gma=
il.com> wrote:
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gmail.com>
> ---

[..]

> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x3c800000>,
> +                     <0x0 0xc0000000 0x40000000>,
> +                     <0x8 0x80000000 0x80000000>,
> +                     <0x9 0x00000000 0x80000000>;
> +       };

Does the Samsung bootloader not pass a correctly populated memory node
for the device? Or is this required because UniLoader doesn't pass
along the memory node it received from the previous stage bootloader?

Peter.
