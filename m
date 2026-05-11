Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FB240242C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514046; cv=pass; b=jexXjekajzfTvQ+cOku6piVS2fGsiSJFwxq43p0ki3hMaYy0OGFzQxj1ShYF3QWtPUFcePN6QRrI/GJzZHQzBuUCTp19F2jHOJhTLeleHb86AffmcCUaqF0Sww4pW1drLM6MZJnQVMxSbUPTbyAPN+YORA08AarL35PRO8RMSNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514046; c=relaxed/simple;
	bh=pYW7RgYPb/aitZu0xIOw+1rg+iW8B1yMUnmb+fIb5/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB0zrJ7fL7QpsQv5BWT5GifnuXcslC9Ck1zKY5xebr7E0S6Go/ddTBXY8pV7IRI7VpKmSH/h/sXbEMPYcZEJZbRTLRH1e+Xp24ZskVXnoufVxffNWcrmTFjCNwKVQz5lc1YvJTfu9rrLNQgTZFHoDbbRFsXz/28uVT2rsLlPDZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1ukhUyj; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1ukhUyj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7d983f79so39156391fa.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514043; cv=none;
        d=google.com; s=arc-20240605;
        b=lp3y92s9qpwdkFdcE7//0staq669ajtMwak6pXaP/iH05AgFMZLnOFI8jIVHTpwY13
         xBD6jGXd+c+WxkvE/RmUrJtagQ8YcSQobS1aMlFdikpekc9SVldP1Tc+RBf8/OmnYV4T
         zu9D88jeW0JoNORJ30K/j9HpdiYgOn3AIc3wDYCqtvF1Ab86rD5/PGTWVL3dopnPJ7RN
         /eQaBZaieoA20VrEqyjt3BWkQ61a2vLEBWhGaHfHxQxK2biOAtXOPr431XAqnY56z65i
         sVrbua9UawE4pk2YeIF/p9MfVBqdzhwUS0YY/J5ouzm+lM3qetE3EI4lxFUZjv7lsENf
         92Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        fh=BUfias5P/CI7Vl3nb3j5anW3OZU3Vvwn1MOMPxt0+Bs=;
        b=Wa4IIkD22J1CL1sED10FCal+/GLH8tQBG1vJdOqPjXcV5z05tySZbBq974TP0XOLnS
         BioUUbHUuHDBcmOz6v1cOBdWLG/ng/nflqKTbX1R7uH1o1vsE8L+visxGV7aC7aHz/Hw
         1BnvVo/rpGFSW9iHGyuAM3vYAYTXZ2FN/bjpPdf0+NrfCo6vtMGWrHng0kY/zncdP8We
         Kktc6oWsh4jzvx/8ePi9a9M/fixdxRqU5Rg29OrfER+KGQ4prMTk+XUPhqo98ZUxWFVF
         a7c3fgqFpaNez1DFIg+3CROYwO0s09aN0om2FyLwTcveTWXAO6+tWMqVT6FjpWZ+JBcj
         dFAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514043; x=1779118843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=a1ukhUyjKTE726gtgTOMCKf7F2deXxfK6tsxGlpzHMG8+Y9nwqBOPk22P+dBdjBAqZ
         VQY/tcZmrT/V96CPMoa6RpKNHns/Gs7dHkzATxu4uT9GTXIqe8FAik6fmzjlpcDOnaM1
         anGAfKQZLGP8sIcksyFQ4005gQq2kh4cAZUmRA73VVejE7wXfJLvL2vbnGN1Zkj+UNWC
         PRGZLgJT640sCFtr+VBw/p4EF/kHT1tQ4fIzWhq3bv8xZx7t8sY/DAR2wwRCOvxZ4+T/
         XCXbXe6upsLV2UPk+94n5aaQvJk5IeuGF7N/3CMVAML1xO7qbdbVvICvIsrfGmm3iqsy
         eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514043; x=1779118843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=aB4a6JPOV1Va3XqKgqFOzgsaOl4oyIAEcyMAjwwdQXiao3DCu7jX9BgiX+anmm42Fa
         SrMJCHy/G4nOsVpRIriq4wq/nw7v6WhWYY0YsNtEiYfRBJnIpJhlnrz1icxJRL2msvP4
         eAoJdW3INc7jV1h2HWZGFK+v0pZxNbI6MuuHKzJWVy7xkhVfIjstvItlGgWmcedngoBT
         BocmrpScfmuWF9jIOSgLpAJA9uJtZwW2+CdQHhURJMEJqR2YjxfrQbVvTiwhIPM/3KV6
         8jzQZLjW9q/Ryhx+5TPPjhiD06ImFlcD2SoK1pmpJYVjYGR1LXasprLZ68fJJgx0/BtJ
         4ZmA==
X-Forwarded-Encrypted: i=1; AFNElJ8HqYIU0+CwaOcoedfHsHfOOVDH8zuWzgDidldQRgpoZqvArO/LKVSrI/QYKQdGWL+QZHdLpk5gSlLM@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDoixzPjmtRD57WAl995aqZ0wb3HIDsVihnujEZZb7/zK89Vt
	fF4ra7BL91JCwbH4OYKhzWXdApY4w8RGKZn0ItvHgN3nJHE1hzAi649pt2UH2JnxqQvC5lhqVTq
	a0RwxzWRBLRJgo7JCZk/PlD29MkYJ9AZmalofWPvjlw==
X-Gm-Gg: Acq92OF2eg6o21b1EzLHxbilvJ8o8VnMNSziePyti3uKuLMl0PrSfOuU7M6S9sxajWZ
	0X80B6Z5AmaGDCqw8L7tH/0kIqWTmhslvrWV9x3ZJf4Mlwxf1Rj2lYTFWU/0dRgvTSyal/vbip+
	nEPllqlrAYE9l75Hp3eF27duAWnAqslJdq6EdSvDtt3nZcfRPw2DUmw/BUMWk5XQBevpFSJrU1p
	qC+3gdhZNoOFWpmhAg4MZ6hSUdM9/6kjymKRfcBXCQc2m+bVf+3L990u1GflHWmaeu99ZYj0FSW
	Q3SxikTT
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr7544636e87.4.1778514042559; Mon, 11 May 2026
 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:49 +0200
X-Gm-Features: AVHnY4LAe4jSY9ZIU0Jqqg3bAkBng0JF_5D_OZzU-aQcORXNKnNE7TuCtsiJ2MY
Message-ID: <CAPDyKFrDzA-dYF58_N05JCTqdgvPUMvXF+FKeyCFivLyhw5_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car
 M3Le support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 64fac0d11329a..4d66966ce2900 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -52,6 +52,7 @@ properties:
>                - renesas,sdhi-r8a77980  # R-Car V3H
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779md  # R-Car M3Le
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
>            - enum:
> --
> 2.53.0
>
