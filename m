Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1E344D92
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668969; cv=pass; b=LVU6VUqKZVHKmwn7tVki82bFfN3v4Y7SuVv76+HWwnxGc/bTlYPkcT7+zjeexcCNku3NjBGfcVFNih9rIiUHWWr/GfToQP/IA46dCn5v0f1QaWv1aztWhRkEwKiTbUYKCLcOHoI6MSUeOFXNL/uI7rNOx+PbOz48Z7ZCx9xBFOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668969; c=relaxed/simple;
	bh=A0Y4JQ56hYy7CT2yG5PWBV4nnyzxHO6PK5CJvpXuWtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djQh9jM5vYRTj1BcibczjvT4BOgoFZIuvbc8hJnVOdnJLAzf+C/PWdb7rBd5YW4q4ZGhQoF/YIotwEe4jyqlguqcthySjIHHKX3UqS8gEb8W+/mBF03ieI1k5dutjc6Sv8wD1l9zCP5IU5wl0RRaoxQrIeex+X806dg4lV/P/B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Qll2pCjS; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Qll2pCjS"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-676804a3a22so491918d50.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791668967; cv=none;
        d=google.com; s=arc-20260327;
        b=HiXw3F82GNc1Y0keIR7PXqBlp6fC7wHpOg2lVADcl3T/eU9llA2OQIPIMXW5nCglcO
         wqOGPM4jufxbrFyzDc6qt2Jnlsjrvydnx61ZiuP2kaPyxJhsQlwW+lykAQyBbWfrn+gI
         138xWupd1d5aF49vwOaJyLmfeUZxXa9cI/V8JA9rhFsvKNd9IIgnjUdnm6bSnUP7C6wb
         OClUpzBE7YMWYM2ZGSpsGDaRRalirMws86f8y8BnXvT3EI+A0MEGb9rfkDZahg6PhTkL
         qCQPYmXjGEN14OxWyj1bVUk4ktHNUu0KVrScotsMvwU5gxo9gKAdmB7YzdfOB8z5ejld
         Cetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        fh=FuPfJAw+vLSGqRHn2F+/n2lEJnWSlng+eHWphKd2pEc=;
        b=CNZkOHJD63Bo7TCDgvUT/tXvL+ayW/Weojz2llyI7X2bRvpqYvSinIGjrYOWpvMNoT
         yeGPQ83vdsPaVk97OczGbHp3z1OZXVOZpqHaWWHEnI327/vKPJM0O95ck4Y66rA9Le2/
         N9idgJ6ZQnA4EerlTUrMW/Sgyc1I16P630Vi6fNQAnL0uOefdFgBXwY/TJcqklqE9BO+
         k0HHv8227+4tEJFCD9JaVm0WPEWhqFlF34IDqV0ZHdAE+LKt7Bx9w2/sJHnjCT1PlRGi
         IjjhBAvMrJWskLSqNeiIeCzZRCBcZevmfGpX2gGzr/aRXycIGg906lq+WbheJCOTm2bV
         UxBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791668967; x=1792273767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=Qll2pCjSkh/nhoBfKEy2eQoAyHUjplbXiYsxv/cqITFnBsPdYmDAZq8EGiLDakDD44
         iiOmzeQaURIebYliJzKH8csF/MtC0KUrRtXy7e1Vn1fxR3Ko6dhWO9eBiL266/zmYJ1h
         5naHAERwhOuedj2Y6QfpG6ldjG7Zf0ZT3bm8otC2ik+6tBEFvn0sMyOgkYo/I+7YugDF
         HQgQfjY/ZNuG1TxUaJr6JBtGcSzoWf+fGG2TSpp4cznNnW+my/mLOvIiQyLnU5E+bOmx
         AKHXANyOiv92u+M3rIKgQ1az73M4GPFiuaPpVfvUQoWGDfyBWPcM6nQr5W4j0+4b5TP2
         cGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668967; x=1792273767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=f1lfHj62AUde4ToMXZWwO+Vv+68URVb7Eo3iopxsvsNzRko3BUKXY9ZWkmN2nZB8d5
         lQDoVP4x88eng+lS/DOOS0pY7FzYewaV+xViQEjeiCQI+kRI8rLughJyu8iIpQt5RXpU
         Mseic/3WOkU8Gbz1psrf8ddMMX030ooAwR0ppP8cHECf4vImTIK5B4z3UpBZc3LlzOxi
         tNsuQYJlizmF4okX/dVdNO4vX3BRtlUYDT+JyXcbTLwCIT2Nu8pUUnnTweoZyGApusSX
         7GidfIhNpuxsQVZikB9ZdrN5UTFoEk9O1kJ43lf2BxlTd3RZU8rc66y9JnA+i1buOA9k
         m47Q==
X-Forwarded-Encrypted: i=1; AKwUvByOat8gSWCAB2jXn+Jx+ep7Q8Y7sG2YMC+6zDmzlwwipkIvegIvEZTo+umNVIYdga+OCpJRNKKEKS+t@vger.kernel.org
X-Gm-Message-State: AFq9FYJLWgrnA/f5n4RkfNTAoMbU8zp3ifNJ2PA38aHNUaFl2y8eLgpZ
	3K/3MBs6/1SMqSa9lcXdoUeX5pceOJ7seld7LMEgkf6Z8EbbDislYlXBN1pdZFoyXZL4hr6dfic
	tGGmpfgB/mH1KrrFfNSHYH/THeZDYgL8=
X-Gm-Gg: AYBFou1r9JNxfSw90e75PZ3Un2murAi9H5eglsvZp+m5WXZ4977iqPj3YBvOnXMvM8C
	p3BJqdLuXLwfCNLOQt38bFxlziWTjPQDmmAy2j5yWYmjOI0BUTCj7tGxry9DvnFLe6DVX0xu6dL
	hsRDmmBQqehyrWsWg8oYTC3suKz7z4EZNRDSQs201ylgt+9RApcS7lnoORSFNmGo7BvYMotwYgA
	oCZKlAHdxnKFdDTcBWxkvNBC58zPdjLWibU6g5s2+1aVsn9quJxlCXBOct0FduIi40N9xLN1bcO
	OurDtf+xpaJOA85x3jjDzc2lNqNSf/Hy/oS8oVleFhWzRfmXPkK7cWTaaShkshR95YR6acLw6JR
	7+bLpsEp6w8Tv
X-Received: by 2002:a05:690e:5:b0:674:17ca:25dd with SMTP id
 956f58d0204a3-679362cb227mr1431918d50.78.1791668966625; Sat, 10 Oct 2026
 14:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-5-tanure@linux.com>
In-Reply-To: <20261010105900.247342-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Oct 2026 23:49:15 +0200
X-Gm-Features: AclHuK8jJjUAGUEE_RiHqUn3ZKgg7qAYmUp7tVzhoh46a9QNl3VNEK64s0Xinno
Message-ID: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

$subject caught my eye because I didn't understand why there's a "T7
way" for adding RGMII delays since we should be following a standard.
Patch 8/8 in this series documents the standard. Can you please find a
more suitable $subject for this patch?

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  {
>         u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_devi=
ce *pdev)
>         dwmac->dev =3D &pdev->dev;
>         dwmac->phy_mode =3D plat_dat->phy_interface;
>
> -       /* use 2ns as fallback since this value was previously hardcoded =
*/
> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns"=
,
> -                                &dwmac->tx_delay_ns))
> -               dwmac->tx_delay_ns =3D 2;
The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
the ethernet TX delay configuration").
That commit is part of v4.12. So boards using RGMII and a .dtb without
that property haven't been updated in more than 9 years.

[...]
> -       ret =3D meson8b_init_rgmii_delays(dwmac);
> +       if (dwmac->data->mac_applies_dt_delays)
> +               ret =3D meson_dwmac_init_dt_delays(dwmac, plat_dat);
> +       else
> +               ret =3D meson8b_init_rgmii_delays(dwmac);
From the discussion in v2 I couldn't understand the overall way forward.
I get that new compatible strings should not rely on old, incorrect
behavior. But what's the path forward for the other SoCs?

[...]
>  static const struct meson8b_dwmac_data meson_t7_dwmac_data =3D {
>         .set_phy_mode =3D meson_axg_set_phy_mode,
> -       .has_prg_eth1_rgmii_rx_delay =3D true,
>         .has_pipeline_clk =3D true,
> +       .mac_applies_dt_delays =3D true,
This should be a callback function pointer (apply_delays or similar,
to match set_phy_mode) unless there's a way to make older SoCs also
follow the "correct" RGMII delay specification.


Best regards,
Martin
