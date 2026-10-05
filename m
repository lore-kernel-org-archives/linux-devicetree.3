Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EC4503E4
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193021; cv=none; b=q7RceaZRM5UtM9brGGkPhXfFFWVY0QZVpSnJI3fwJtBrF5F/FfXltxiYf4YgCQwwMwdEQ491BLaz3UDlM8w1zlrgFNJ7a1xh3SuRRwreh3FKTyb3PpvrAZJ0cHBg85d524P4j/1mXXv9X2EVuox316fCauFYklmNEUjRqqwII1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193021; c=relaxed/simple;
	bh=oNudNf9KGgKm6/8USlLHbXpH2Kr7BGPq6A+ZyfzohhA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CLETBAqZREziY8uC+P/lZKyAKOCPPViLDWic9xiW04FZ2xaWU5Z9nhczbQPvv9Svd/cE1l91pIR/T3hE8Vgv4uaKj0f59LH37g73ZNbHFXQG4m8ieBI2bN4fzlN93vOXhthOzf8ayZJAlrcN0b65xjDxpvEvLRTCl9jscOva2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TiBJc0D8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TiBJc0D8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1207718f8f.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791192997; x=1791797797; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=TiBJc0D8+P0GUQK1oTX2XjFtS4UUxChMNEjX9Nsxx2KNEcpBecAeGNjsrnp4JgSlof
         4vqu1YA6tsVd0RvyIVTfSYEX9gXofr6HpiKnw6B8kmZw970uqCyb0j1htSj8VaTVwAjI
         ZekqJyw14kfhlynPZI0QEQGb60J8F3e9mTeTugSSMXIZ18PIhb9A3mmMPe0251LaVsJb
         3GxfC/leL4LgJTeMxker1HwI+62jzYnP9TIr1j6NbFT2PdzuCMnvxPP/n35JSwac8p84
         2wcP4kGnEk34tL2Ug9zOi1QgaJ8M1flvJGyDY/EODaKjZ4WaNJHffZb1cKxmDDGMElMl
         Bpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192997; x=1791797797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=yR7GoXnvcXe4IzoYvxqbmVilsgA2MG+RJIqRohuOqbjvkIp8FSXwZcB6urD+KxtP4O
         pbI5iB9rMcA0RlB10ilCGRIgSEHBWBmr4HKIau3K3w06457/AXFGfsBd/EcUfkp93OlP
         CkdX42uDp2x1fEme1cgcRd57GIH7t7255fUaExeLQu44YtXFJGhfBdjB/cRDOCIc90+m
         NAJNn5lYohsvnWCiGVtpGiQbIXpfVdPpkswTa8y5IU7IINzUqm8QMSt8q0Ok5h5hPm/l
         mARtnlWF5nn2yfxLdgJuNmnQaukeDt6IiqPKze06HfCM752eqYLTRzJiaNBH7tSiwOoI
         VwFA==
X-Forwarded-Encrypted: i=1; AKwUvBywo40VcsnVcnQpGTzTb93BSCgwPgpLYxaoYpS9S1/anJgk5e9nNN8nYsVAAv+M0WU4451tHuZo8Rp/@vger.kernel.org
X-Gm-Message-State: AFq9FYKSVZLtUhtG+ZNgrWVrgR4+BCZTuyMluPhs/kwybcCuE7m6TdNc
	Dv530RVXWpsjWGr8z0QNfZRuRDgdLwAqjBqw7eDxN3ZLrfN3YRDEdgSmx1L6IiFZLuU=
X-Gm-Gg: AYBFou34TETTVSRgZJIk1l9oC5yStFK+uMJkv6uiXfJeUAdM5XKLbflS4ExlE3BqFV6
	FJIKmJvW91EsWNa15P8V2sS08JF+hPB2tKHO9aIt1lY1+te87kgPMgt633dRl5laQSlt+hB01Zm
	TLdCfukdf/oEjIWnQGmYY9NFjLTdj/wGbus69ti6//ZrubJ77SjfKif8rBWbUIn2qCBFUXwzlVe
	pizT6oy4K+hJAGAOEwDtzjnLiNc1l1XbHRMLzAL5tpYxXH1BCClOXqdlqlrB5ViDBVYwEeSz03n
	NUZWdx6scx1ggI3nIvOS404PkKjQAQo/Vda7OvyJ1kyT4+Abvz7E/VMoKqNyR0Tun3kgidRKlq1
	utgMRgUpsyYtkWHMeV4YFAb5AfXM8aCgDixQmHwE0pX3xcbiLhLuoZvie0BGRxCWoNoQ7rA9v5A
	aj8ktfwGDMBPmYaHwgcdwpNe+cQqmpScae5qd+lU0eT1I4mg6gMAAEcVuXksLRs0OuRmLF
X-Received: by 2002:a05:6000:2212:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48c47ffa3f3mr10798541f8f.44.1791192997141;
        Mon, 05 Oct 2026 02:36:37 -0700 (PDT)
Received: from localhost ([41.66.99.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ad2f9sm2391478f8f.38.2026.10.05.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:36:34 +0200
Message-Id: <DLWSX9ZHDC8K.1KXUAR8VSMNND@fairphone.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b:
 Tighten compatible matching
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com> <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>

On Fri Oct 2, 2026 at 4:49 PM CEST, Luca Weiss wrote:
> The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
> and nothing else.

Fixes: 54bd1390e984 ("dt-bindings: display: panel: Add Himax HX83112B")

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 =
+--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8311=
2b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.ya=
ml
> index e58bb3d45331..34e97003d293 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -18,8 +18,7 @@ allOf:
> =20
>  properties:
>    compatible:
> -    contains:
> -      const: djn,98-03057-6598b-i
> +    const: djn,98-03057-6598b-i
> =20
>    reg:
>      maxItems: 1


