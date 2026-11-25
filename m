Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566801;
	b=iRPpgn6Y7aqRL2nFvwM5FSrNarZ3PJwV4IOj8BCMtQdCbL5eXkz5jZ6GaGQTgFRVGIf0
	 kN5E7XHPbP5Nl/jbcOq5RC+qGQIIfu+xPMHwMd65lAXthU9uo43q/k8ZcAJ6bhxqgtAWY
	 OwssO60SUfcxPsIUjvwaMQWsWBt4l3uhB5XFyUqKaDFczafKJm3pnqlPiXuv86BJSEETb
	 zPpBZ1kN82bYpgAM+7TKstR+e8qMEQya3C99yJNb93Z5av8PGcXxSbqEFrhBoGI6s5WGH
	 zxIH2Wu3wH9Qed5AiveZGH8sAoHOFaqOFxb/ab80+h+3p6oZUCbh5Bod/v10P6vSxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
	b=cnXSiPoMd6YsOIzGjlVI/WzXJ4jNU5th5F7pO2oxX5+R2lu0ZfCKSVfewzuw0hELEXvA
	 t5HxEZsDsj5cYm+GpNvQnvtjcieWmhHsy78dg86Rw9NJEZ4+oPkG/t3kbYLsEO2rCiRr8
	 Zgjj/RjPFGDbS+1MnjseMxIoUOiTJL2+uzP49U+Y8rJaBRMMU5gyB4QsquXIkrEcLw9N3
	 iyDZKAP/KKOowJMLTioQaXrDzXh00xj4ZfHPg3GE8yK4lfbxMQhH4+VB2k5jzl8wC7oIK
	 38B3Y+fzEZt4OCWDS26oEdaXj2BOAyaMS8w2QQFUfsZqA1wDwdPzsrBvgpasa3apPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="jAgkj/z+";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859A606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7859A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jAgkj/z+
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso11145089a12.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795566800; x=1796171600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=jAgkj/z+aNjrtmwqAk5XFZObJEzoEOjdEA1IYA/SEm8x2Qmjyo7A48oxA+WcRHXr79
         liLV0WMr2KbZ4+NnN66Cc3ua8LzrV3tjpa1O+5xMWVdSZd4AUAGyl8TjqR6n1UtEJP23
         IUibRbZNrIH3beKDQJz7l+KeZuR1PZ90x4rmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566800; x=1796171600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=KPvWypRVjF0+BwuydCfx2qtIYaIXoVwAnsgQgJlm+PIzESrqo5IJqJTUC+RSsbE8T9
         ZVmHXj3vapvHF0mSaRG7SoOvmFqi3Ji49ypdQvcOf93fm9yCyAhIJ7hEKs1LgiLh3eaI
         SfAAGqI8KyPLKRRyP8sozX4XXSWg+SjdLMKDCddHLDp2bOeo9U7mupMlAQPvSWmggSJU
         rkwH8I4Hq6DuRAzy0pAK4YvrnJSCsjfkIaw4McISA5jPuz6izmlVbf/A7w7YnJ+7Zdi+
         D/uZ4P9j2B4xYDLGHdqI6rCLQNBUvx56P8um0PPaFF+V7AbfBxXBK29HdtkvLFN4wR07
         6ylA==
X-Forwarded-Encrypted: i=1; AL+hErEa/spQL7hVuH3bCFY/nyIDVmZjhM75rvkOtCyfv0eUcNt4vZcbgHchj/W/f3AFRnLe22QVxv5nEoq0@vger.kernel.org
X-Gm-Message-State: APuU4Z8dsR3KGMpxMaAYEA730QEWuzihUY3SIZba+Fpw8XU4D+RT/o0/
	Podkep+GhIKSiHEQ+Dtaz0tres9/29t9jOlypgexxej4+RApsBxusT/syJeQ1aHIUmGo37z4KEs
	UUhL15NCg
X-Gm-Gg: AZFdTZeglUU19+41Wj+OwRV4AQtUBmLwVT59fWeEUKkxAy4O+f+YpiFxc427w3M3Esw
	NOKC2QSF3s0Iwa7uC0PBPMyIbus0uxPdgnn5ebBwucE6JIdR2HpXytDZ0vZwW5FtSKxSmJ1EvKk
	0AYpSJ++NRE5WXN+tmcjSe7MrTv0OwGdwwk+Offheu1s65aXTdTNWwvY663jZ3nY7imJWeA0bZG
	Z0Ve9TcYint94ChnvQ2kxEZ+LYUXmBxYr/4+/0+dYFYy2ZIm76Lid7bHDMN+wPOQ7C608MRQ4dL
	DU07fK7FTa7WgZWQeWvWTo/pjif1BeaC3wsXgqECFHF6MeY70V2lWjkcEOEVXpZbYqPkuPGZUJo
	sv2UjvgIhU8JiXgTscuXfDUvIb9EUND/NAplCT7OPG81bNouUVQgQ9FPnH/qsKsS4gObfWk+ELp
	5dqqcQm359EEbyDStp4jrAeANtzW4eJLyWEdV2wH/2+tG8jRsn1WTqkOHq7v/pkIZlm/fftCtNF
	D8RU2lqzscCg+29TWXp7U8bsOv5megnnHJUEb8ue9SatRLMb8NAmDkWSVHVMRl43sUi2OnPKdcT
	yOPv1Owllb3EkQz/40GHZttUpIuFLfZtSxAVLbWuuTHUfHlSMKQZM2yV7skgWwkzyVyu
X-Received: by 2002:a05:6402:1c08:b0:6ba:be00:b9b2 with SMTP id 4fb4d7f45d1cf-6babe00bc52mr3697034a12.10.1795566799764;
        Tue, 24 Nov 2026 16:33:19 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7599260a12.35.2026.11.24.16.33.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:33:18 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so66703785e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFsuK7xWpkQ0OHpkFw22mMD/Ybx6082hz0iG3MOKRaiedn2MzbwpQCoAyr/7ds0jQtejYD6JKVsWCqe@vger.kernel.org
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4bb861576bemr256892195e9.11.1795566796722; Tue, 24 Nov 2026
 16:33:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Nov 2026 16:33:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
X-Gm-Features: Aa3M54r4HJHXbXXsTl81DElUvLOJMM_DwqBh6af4oogcdFGi5xYSj3tXIA83QFQ
Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> From: Vamshi Gajjela <vamshigajjela@google.com>
>
> Document the device tree bindings for the SmartDV Technologies MIPI SPMI
> master controller integrated in Google Tensor SoCs starting with the G5
> generation (codename: laguna, canonically written as "lga").
>
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spm=
i.yaml
>
> diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml =
b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> new file mode 100644
> index 000000000000..60d1e1769cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
> +
> +maintainers:
> +  - Vamshi Gajjela <vamshigajjela@google.com>
> +
> +description:
> +  SmartDV Technologies MIPI System Power Management Interface (SPMI) mas=
ter
> +  controller integrated in Google Tensor SoCs starting with the G5 gener=
ation
> +  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.=
0.
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets

Could you remove the "-resets" from required? It looks like for at
least one of the IP blocks on LGA the reset isn't exposed to the main
Application Processor. I wouldn't expect this to be controversial, and
probalby Krzysztof wouldn't even mind you carrying his "Reviewed-by"
tag with that change (though he could reply and clarify if he doesn't
agree). ;-)

-Doug
