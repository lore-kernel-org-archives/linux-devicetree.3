Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567827;
	b=jG+B+uKiSAeh6Q0nXpNN0r8Gi7e/gF5wMRmWBUCGyZaeI0A9FmAgiqaEplbLHhHLDDfl
	 NBbnY9Ff14i1B94r1NsJRqry11yfDW7UMBVbYic4OANmt/pkRSlm8ukwRmxYei7xUjA8k
	 ErgPVBswhRkpynl/ua43Ghk/xrAIQEhZk78vmLY6ePImsCONP90znydoPA2fHbDzvS3Bq
	 nSGU469DRxvZp9PfpY9Nmj0qlZykJf1r5ltKqUwlRopnI4RjIjuO2Kb9DKpts6ppeuA/e
	 tkvka92Q4rCr8jbzdN1p46+bscP4/ZSIRokP44AfP1H6RBzYT+CFL2sYS+Qiv7sirlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
	b=nJzYUVWkqEs6h+Epmn7H9H/8q9iEPnKe8Swp72n56jbD+5wrWYLzy2YN1DjGspkVkQI3
	 rN3yhiF7h4stAuYvH9cy86cOX6TfIzQQnJqfKRD0frwy1jBS9bUl4Zzu//VEGtYk7jCuw
	 NPVm512d+UdGXPsixNUMnbRgpFJdFcE51EcRamd1Via9o+FEO7jGd6dERfcS4nRKU+RSN
	 0RRF6dQx5J3E38vShlHioWCX03tl5M9+0jqrlA4Ieo1a+tHAagRm6UA69Mv8SIqt9P23t
	 0INAXOHrymaFWZiHGqARUIuU4otJtQE3HsyU80zir/M8qiRCeDyghcFW5hP1ShTxm5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E891606A89D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E891606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1247334a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567825; cv=none;
        d=google.com; s=arc-20260327;
        b=A7jdqXZ3YVYgmFOCsDfhg0nKSh5isMeQ2trDNciELiy12F/BEjyGxFDfL+gFSndjz9
         0yZmXalf/2fNiT5Gs9EAZDOg9TfGH+ecntPBFeHiFTanSZp75TXxhECZfmk5H9xZ+ZXx
         /AxgexI5+XF5osaGv3mX6TkHMnL1K0+XzKbzxMEv4GgytwBzxczEgNRjzz7hmAex+Slp
         apegx7OKXDUP34Mau6ZOP5FGRquTpyNxl+/XooXAKqLLDXLQABWTwvgMZBXmSHurI79G
         sv5r5GUggEWw91TlYXECYGtaFcn5fUe8fiv8MIQ50HzeOhnXM8p3oqCMPYtIgfyyo1W+
         qwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        fh=DxOwaChT0/usNc1KCvQtYE2LETx8l0v8EUNEUEtqQ0g=;
        b=ns790AlrQVzTQOLRquu6KHQeVGzkCJUz9mlBSvCjRVzkobxWoS4iSWBuq0y6ZmSY4L
         xqaVv0Jmxaeq2kYby5W1hJJ1ndFTbFoYz5HzcvRb0RIzsz1N7SD6/0AGzbtRALAn5gn/
         hoxSgLdZnXSElpwMb/Gb1TTR9chW+zGsjH6VPuvN08l8WHIgDAqVfcOhNFrLji3TdFJv
         bVGTjDfvb01U0hku119fk96j+xI7wYFmfvlqdOVZWhXqcOmceCqhE/IcUUKvStlcgF/T
         ksgudl5gZmzvsBLqEp7pLYDHoKuIsIMppp1sbLIs1xoDxdhbkV0B5tjlg/jZGztCjs2K
         Be0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567825; x=1795172625; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=uO1PZR9z6dSSdZdruiUCP+ylb+AYRNL3Bg9MtPyNPpe8quBN5+x0kSfhdc6XsXvP2l
         1EWqQ7J0agbDYHQH0axqwgMEmrDrhg1Oc3m0uRsq4mARWFpqfAlD8wPuiR+2zD/3uQAc
         qgBCiukndMVmJs/IVJpM4hd8qCyxWsLVVoqfyR4MHzajp1b/LSldKdhNuz5xTQf6BwtW
         G7ZtYItfHSpGNE6iBtAws9xro9RsQwnAsuAKn7ImZtuJ2ZhVdKtgkjXPgc1xO9XBrdh1
         DQ+AxJpHhiSmL+tPFg8JVylQURvnnB2fa73o0q3biC5HUIGOevOCFFQGY0cLG1WYTKPB
         RWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567825; x=1795172625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=kCG4/yHO3M6lh9aBKCZkhSZCRZEU8cgvY03f2PRYI7SAvw3pCfn9rkkE/0Dh/0TnTa
         CvYn98GALcMVhUYxz5VN06oU9B94lodU7d1VgDJ7bOSfxhewJXh86aFSxg6UuDms52FG
         zW6wWRbBB7BC86gaI0YPoza4kZy9M/ADsO0/zf9KQe+PMFW2g+rsIfnhgDD8iPL989Xz
         bRnRWc8lxE4Fgo2h/S6i1pI54DlG5+38CuYpeRw9ZB1YKHxvoYhwiWAkbJ7b7rgqHVpO
         iLfRT2BQffRgFXaTTyNSlYddyznXJrOao4MsoTXTbaCaZZHTKerXSOCRs9Q/Gqy0JYbd
         N9Dw==
X-Forwarded-Encrypted: i=1; AL+hErGEOxpGkyu8qILPq5YHxzLdlaRjkxIi4vSvILRimozxcTurfnTSVjRzLCfOczNti6a8urDuzQql9zGR@vger.kernel.org
X-Gm-Message-State: APuU4Z9/RlSFxaDQi6S3xJjxBuENtIF+zLyHBddtehlTPrwjhFsds64Y
	h6CzeO3iXoWNmWqwwS0217iVmxaa3wTwf+Gmf/c1axgHehCuaQCXgZNoPQfDsgR6imk/qds2ztY
	z+EV4/uU/WGtao40Pc/fiGOlE7LWJXU/xaQ/uCWjJyw==
X-Gm-Gg: AYBFou0T1OmRzzQExQHqX/6AX7KfadwqpSy//wpIxDrHTCLdMzfahyWewVB72KRVPQi
	IyiVZoICbVV6WKoUpH/HWsKLJ0RSdCWEaXKK1Y4rfjmc46VExPSalpHqTVIMnCg4ibbfhdBlDt7
	kzjHUU8g8EHH/yVzSd8BKf5qLQRrxyDe20DThqFixBSdP8ZHpeMbdBCdLEvGEz35y0/U/rFnnsi
	DLLBg1N8Qy0KOdjZEs9j96VcMHNSyX/PwXRiASh3HxpqFRtiSLTTquM4u6i8x07Fk302rSQyfH0
	wh4AVLxNcyG+zTQzejvGHmEIWfXF6rsJBjBXQAziTqGOd3v97uCnc1DTGYxtyMDRWS9OS/HsGPR
	vyOrHHND6PrI+7XjABC9jYrfPJRTeha1Zwzrx3GSaYHb3umHjZlB8cs4NrDIM7w06vlcj8g==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr1814259a12.3.1794567825002; Fri, 13 Nov 2026
 03:03:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:03:32 +0000
X-Gm-Features: AclHuK-nQAzdHNmzELAlgOYeQ9PIbGnRzQK2xJ_UxA7DGsqbyIcTqa_Es6uaAxk
Message-ID: <CADrjBPpUSot+jCUBKb4S4A8C5HazvqQbB-+wDvjJtjB5XGCytw@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_USB
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 21928235d131..c68a64eb35c5 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> +      - samsung,exynos8855-cmu-usb
>
>    clocks:
>      minItems: 1
> @@ -143,6 +144,26 @@ allOf:
>        required:
>          - samsung,sysreg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-usb
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_USB NOC clock (from CMU_TOP)
> +            - description: CMU_USB USB20DRD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd
> +
>  required:
>    - compatible
>    - "#clock-cells"
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 67cd97d8fab8..f4261956ab4a 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -222,4 +222,12 @@
>  #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
>  #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
>
> +/* CMU_USB */
> +#define CLK_MOUT_USB_NOC_USER              1
> +#define CLK_MOUT_USB_USB20DRD              2
> +#define CLK_MOUT_USB_USB20DRD_USER         3
> +#define CLK_DOUT_USB_NOC_DIV3              4
> +#define CLK_GOUT_CMU_USB                   5
> +#define CLK_GOUT_SYSREG_USB                6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
