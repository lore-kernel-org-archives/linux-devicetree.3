Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794764460;
	b=vy72918M1lqir7ktygz8BZcTa19F/ypCEH+fdI0M/7mRt8rCnQqgcu+JzIJF1QGMrE28
	 sIcchWhCqDMOhf1Hg/HDVAXzgJGLTJrcrp3VezPeq59obKnJ7QGHcZZFoC+cf7RSwMJ1o
	 oMQ8rMGiaCujS8rVAeimbpTDGm4hwKIof8Fqj4nTTaeuLZl0m6Qdp/V1OaggpOtogjEDV
	 JtWDZhhMYDAdp0Py9ZzQQXpV6aROx0ekWyP44rEBcYoILpl85AJyV0JdIXHq6OcQszZsK
	 gsVoROpPFxLjs9wfwIj3VBt4eygGyDBV+ByTihBbfSG6kAcnczYvKiubhX/8iin2nsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
	b=JypXJNWuMqLSPjBRuFs/TnHN703LbW6Hes5ZaL/Wat2WE2ZqeAdKA7L8mOPIASfUwiCQ
	 mNqFIhhwgNbiR2uq1X1hiq/D3cW8HqASwW6AHzBwC0xefrM+rxUNsHSUTmuOaHo7RuOuk
	 ehX1uG3gGAkXrYkuSaZ0XIHDcyaAJ7SlpPHmHddoCVZCij/uqYroMcoMyCqhk5/5XVy+G
	 dbrAVWoUOV1o22E42/psWnsFxoYjAUnmzjZAwTepRlqylUMGx0ODp65VHpBHiCHxEebnx
	 eRLIdMpj77+ZcCU17qvAKY6+a/ZnvmF30X+2zhswOTyqqqw7/YWvtXg9mzI1RUdQQGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A40606A327
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b3541bb1a2so12053537b3.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764458; cv=none;
        d=google.com; s=arc-20260327;
        b=laZAIc1jfmH50np/t49NZK9cOFkZfYAv4rpYlBiZn40UwDcyEmP01XVvR+1UU/7Zxt
         02GA+CIqFHPYCjUpF+NZIHCG/WpuWtWepklQtOQksFurbHXLvbPbaU87G/VfaIJxpx7g
         sESzjgj5ZyNjKepUfAu2pH9hyv1AepTCLdWzPkJH3zFCnI2RBuhqW0DZQ0i61MzyWySC
         /6MDx/gTjJJOgfhp4kC23Dqf4fzM0yg87AMRIfU2I9mIFT2+sYkG7GFWmY/Btn3VaC7g
         trTT7Y6y91AMgoTKWYg0JeCn4HTUOTCjyOe2GxUQ6pIrc6HTfpW2dAND4SvOLi+ikXZ4
         EMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        fh=CUoFca399OUBjseEI8wbp3uZ8INGlQb203wqDG8wuJ0=;
        b=UVs1S+vqhj3uMCdYdNgoTMrggBrvJtgLSVB0dZRDLsSyh3DDdKLE0UVFXEc/RTv2U9
         hHN4kG/8PDuFI9qpSsThJKK2MquKcguW4yKMR3n9AsN4oFXqps+JSv/KTAcfp9I0V+L6
         2bsMqeEEEbJVTIW5ZhDo5j7MHpMxWD/mcEzTxp+ITXChE+o2XzGSJQOzb5bV0q/Aflo/
         bzdy0txXUXtI9nLhim9l+SZ5L+ImGNd/C/m3h+PLSqetOF3MuklCte7gIuTFJILZQQ9m
         rzG+jWxvJGoUOSFBTVkQBA+F1FvxTSNSbjD+TFWXEaYVDqbttBHfx9vqS7CKcvSVPwDC
         nGjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794764458; x=1795369258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=Jje7TXn5xdDDB+w6rdao9ux0C1IgQ67VAgpVxPFtfOdvlz7lkhl7mP2+tFy0/NbOJU
         Fjc/89LRHU9zMs1/ZAr5Y43zWNnOy3GmRjvXAk4xYDkiKLg3vXg4231YplRheFAdw+hY
         QYFIbQGhfEnoiwW5aE0hz4b3Blj2PUkqt2LZmKn3n+YLKc+X+2JtdTxdAb2vS/n9ONDK
         UQWqgEzMDf3ofcO0sJob905H723CZGmcpuXmrqmA42izlGUuMPWpBOx0Miuax1k0R5vG
         ORTTaUHfDYT3tC8bHYVpXG0y0DQDfEwU3uXCGUHJe0BQsG2g9FHEu9jrpt613ujyvYug
         l5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764458; x=1795369258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=h8Wc2uckNwOR70AEc42XBhytJDKSkwdrtUjmXdUjduc2zovBjnrYvZsINEhUGCNLYC
         k5B2oKvmSkAC6KfZbxYyLSeRsCfnyAWNAnEdULFvUxjX9A3VXyR5YvNW9suUAynQlzS9
         S7jv92gU+GSd0JYLsfXKQpmnckDEPJixwqG8glu2qJtNWocTOGDcoY9xvyweAIHVVdMo
         3Itusf97vV968gf8Oe7nawSM4j7w9DymwBVVwStIePgUeLp9iDNayYXu+RK9SMHxswsp
         1RpARC+ucfb1rQ9cJnRchr8yuwi2/O42VA/jgQUXzoJ0TwQKMMN955M4l2H/NDtsT4K7
         4cOw==
X-Forwarded-Encrypted: i=1; AL+hErGV3lss/5JAAY2MbPVIX1BO+DV2yT4T2nC+nV+RcsNks/yOgx4YF9fGtRFf0yD9CnQyrw68BQVT2naf@vger.kernel.org
X-Gm-Message-State: APuU4Z+QzeN7N7FLClNB/H6728vqIxRocBri2/C98YsPTypAtARIZ4gc
	oSP9Ui42mVpvTLPvMpm1B3V0EcVQoGYfw3fWWtX7gu/d5Ihcd3RuW/Crs2Y0EvNm17lXjPpvz9y
	Cq2SDFui5QSsHTQ38cjh4Xi69quI0FKM=
X-Gm-Gg: AYBFou1p7w0W4IHJRrFNRzyRlVIIYfx2Cr1zlPsBa9WelY8U+vQsEZXAPWhm9Dh5ei9
	hrgjuYKS6U38RHc5GjapfOgPkJWtWMPnyaLZgFp79DhBKfKUHt0INWvg8TmIffDatrbwNaOjdq0
	qBNmU04ZbBIZTCGtEUGWEKoscXfG6bllbuembAN2AXj3y8Me2lYmg7KU1qV1stLRy8+JGpdIZDt
	uUNyAQkaCtQBVUnh2iEbT5bkTEi1lTX6Fz4cSr4gtqRf+mt6MSXoJ2/Oay/2oJ17KsYtD9LyOnz
	8v1QxuKcA9y6t5bKz43vgCVBKWzFNrf2Nppw+OvMrtte2nzyg+PblI2Sg2ktmjc6WFb71WKtR7I
	QQZCiPdlwp6IcxRKKdRJCRIU4R2FY3P+VkB5kaoyHN3vkdspb9a33yDxG7fgf3+VF4dVahQ==
X-Received: by 2002:a05:690c:d87:b0:8b3:4911:2dbd with SMTP id
 00721157ae682-8b4aa2f3717mr45349387b3.54.1794764457708; Sun, 15 Nov 2026
 09:40:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-2-tanure@linux.com>
In-Reply-To: <20261113121852.334604-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:40:46 +0100
X-Gm-Features: AclHuK_keCn1frC4iKcAHTa13eQ5wSmPdFzN8zUCJ22f34lvfbzGE6mvQz0vUGQ
Message-ID: <CAFBinCBc6=XPXCuxNLug2mRrvrA0EebNgxgxeNOKgVB7d58o1g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The compatible property only checks that the first entry is an Amlogic
> name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
> the list. It cannot express which fallbacks each SoC takes, so a SoC
> built on a different Synopsys core cannot be added without loosening
> the check for every other one.
>
> List the combinations the device trees use: Meson6 falls back to
> "snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
> reports a 3.70a core too, so it joins that list; its dtsi gets the
> missing entry in a separate patch. The example used a two-entry form no
> device tree has, so give it the Meson GXBB combination.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
