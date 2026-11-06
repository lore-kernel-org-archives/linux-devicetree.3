Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962310;
	b=ef0dMeU1It3U9NfN6B46ZKvsYg6M8iFBv7EkBLpGbQHvqfI8LR0M3v6CKA7sNELH3lm4
	 C3/TI8gXr5QxRi75cujMqLrcvN+B/Fj0Qkp2i03bbhvOKZtlWAoRBUlXOr3j6UCo+lDQr
	 imbnQZJ3CLp0CW7jBxaj9Oviq4ZGfeCDnCHIzOmklQTIJ+oyPMcz4RM+TrHS1N5LX9bJz
	 3a7SZTg5UCAnjm+oIgdDppYb3Ci4mrnrbRkxdW9U/hotXEof8XnUrgJ/OchwTr3NwNZ9+
	 WIokQu8cikEbvOpPVZ00090LOQKawKyZJ/u8A7ONlxbdn7Vzrqwu0il01bQvmsSJtoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
	b=gMzKjk2Z7qP0DC7wBIznSja+mFh0UiADwB0bH4Quhhzd2RAWLpX3e13bHqxZyvb2ALoO
	 wWCyZmUktFD+uCMYsYoN9ZGaoenRvKmvuPT4PnYt5yiKhgZm9fpAwskXeBTQD/40aJ40Z
	 2w7fY91sS2aJYnDjwnr6RcpDgPfEmr1zC28ziSE21XVauaRJcJPXX2K9YsdFWcubezYM6
	 JehsljlQ1W81GwTRCwR1UJ6qV01ZbVUlGFMCq0KAT2/xACNbAqI9/rtv66iMZzOYk4xwG
	 +2ACubIyeqJUObiW4PgwzgenA3EkO1Y/rXT8QNFToGjQLilSqegSxaZqm2+fFpPj5HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A0606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8A0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso3833445e9.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962308; cv=none;
        d=google.com; s=arc-20260327;
        b=geK/1x3QUt3UcUYiAXVcbRaIJ8P/c9TmyJnmWWOCWAiHrcrz6KtVBZ/XVw70P/dulb
         3GgFw8hAI496DTpddX/WeMKLGtIUrC7Yjl8Rlns/mjb//9MzXmFRdFOBVhLWYcDozp23
         saLtTMlwMl8KJO4s82WMBYxKCl1I99qV0vUohamMZN46Lsq3FqYNEjLh+sij5ZQKkcJa
         exmVIQIiicHJOSIClV6g0b3Qdcvx4VkzRMU1JsoVXbu4KzP35mxzWnnQeXjciiabOeeF
         l/vySCaUbj7+CuwG7oQx3sG89cAacjfTWOYVZknhSVpoUnQc6QbXqhajpD4hgPOQg7dQ
         QQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        fh=GDCIeCNDosEHQZSXJV2YnTZtD8D2yuGVFtZSnvy97B4=;
        b=TxbYhJQnB3wK692fOHQScdnE2a6KCUEMszrsHJ1EWQALPCfJtr91OfdeD0QIG9JcHU
         euKmV8cKAreNe6zUKkiIvAyUoP/AanQBLjsa3BHpN3vssaL0EDnL6LNY3CLPyf5sB+EK
         pBVItpNVSM+l0bceHOh4Ah2n9JA1dfNxY2hfTcverMKnHElvmN9dSkqPW88q7dbIk224
         +Cdn1Xm0yEFzoW4lDHDU265EGez4x6tWRAyooFpf4FNOlce8Pybtp+itRj82PWXDLRui
         IhqXkK1uDPgjZodtoPbCwRV9NU8JLkyhKwMv8ILTFznxNxMcWgtjTD/+WyIJPiLrqieU
         WWTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962308; x=1794567108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=NJCrz4N2jhgRr6RUniKh7Aoz452iMWE20KsKuojzX34ruoxn3t3gclq/ivC9Hl+fkr
         Lf9e64JQBT0tdJwr3MM+yRSdgfMAvUeDnEISoHczEtjBe2focESdMfk6xo+8esrH2fS2
         +KvZG4fNk3Opof4DTZ16HIdPPEme7lKjikMSz7fhg5S0OpCvTDCPaPfCvykDBLotm9Dq
         XW6Y9ovX7U4pvygphjLTKoskUbYgdrhHyr8T9PYOP5RwkSzOp7dSuAqWgZ0r25jaHaPO
         9QxT3YR8DEo6376PsXCoVPNAg4lmmXghV464GjrFmQ65tL8Zx1RZrBjo52IZ5UuxV/LR
         p/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962308; x=1794567108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=woqsVQCvlz8h3D8WsTHHmNIo2lo+pnPj983njCxLySLB/6y9iOG+jM1BY0tKLUD8k7
         g5wWu4jVveQTOfu97n3unlOdvSxH9EllGm7a29y0LyCj+9XJNePQgVOx32kXxO6HkiHx
         gXGsAdYtZrY68YuZEo/T4EgPr6H9tTPbJhjUeVUziAAqHQwxT69RmwAzbBHIRb6v/GFB
         Hw/KZgL8njRm2Ac+HO++x/vTc4BBO0es5pzRguQaYpNTXiJ0IH8ccYR4TMLFDwPiKtBf
         iMKbgaxLORSyoo+pCTg8kJmeQ+0e/qzQQgH7XraTlTO4o3fj+yNuMFOW9Fteqk26FMK/
         oc9w==
X-Forwarded-Encrypted: i=1; AKwUvBw7dzfanKnOwDMmi8COKqSw00bTAesxzwzoszIm5nkbbLthOaP0z6hIiPefC0GBeGgD7peb7G3NGO2m@vger.kernel.org
X-Gm-Message-State: APuU4Z+h5S5fzbZbqecej6bFkjYaJetEk88O/YQrZVRqsMVaVbk6QRq4
	aT4+6ypnddXN7IGQRr8cEJQ4DLLmT6m72Maa5HzuPKUGaGYrRiwqhyyzNStILlVdeBGu/lXDo7H
	H4R6eFQqBlC1M52tNX9CChJqQgpukNX0=
X-Gm-Gg: AYBFou311L4HrlXzZL9g9pL8CIUn+KIKZCDGKmmyQbmzM/XRAdl3JVmEXQyursKIXZt
	UtFgQ5k/JExYIksxIp3T8YyZiy/EdZdR3+7aEA1vdHpqNYWmWKI+5RyG4I2IsASoq2L7ycSjCEX
	WkcffMf8bo4AjLo7ispPKUtz8ZrkNiGrT71tQAtlZ8l0SkdyUmGbnzsiXDcuigTpabUmvARzxXE
	+elVNLw2IIxcNCGtyRN5j82TDIBZwBK5hPgBI0on1t79mwN+2KeoDrl80SczLdJDjXuuAAdjTcU
	SSijOZdQWPEKlv4FHZgcgXm2kC4tBhbU7opv8oVEHg7K+o6WzLLhneH89zCq/oBxGrGONwthJzz
	z7vGuv6nIAivTzeZvabb2CTMbCudQveUbIarIxfkO5VauYGkrY8Jys4pGu3C8GkCmOON4m/APvW
	dyO4PgXLMU1JUHXALktrJWW5pKL8ZewyBp4cJz/Efoy4qiU2DWC/3v2PSgYw==
X-Received: by 2002:a05:600c:8b23:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4b6dea6984emr35455975e9.9.1793962307992; Fri, 06 Nov 2026
 02:51:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:21 +0000
X-Gm-Features: AclHuK-lci7FM0aGPKnhIKbKDIhrZWyf9SZlLziUPBVQ7lIewQrF1BBqVXI7RG8
Message-ID: <CA+V-a8vAKqJJmMw+FGrCyDPEh2jpOuwVJbJX=FyVzKkq=B9eZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:18=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 0926ab891fa5..0b3106b45074 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.56.0
>
>
