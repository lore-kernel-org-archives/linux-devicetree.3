Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567777;
	b=mr57tS/lKVFsUM5X1VCg1T8SX4BEEQkYH1/fpcMjqF9i7JL3HScqfoxCjFRJWgdnYJ4c
	 TzILjYL7Du5Wu0rFDAm7Is1ktevrNZMJgJrAi/1biY+FULEcLfZpcN3c5KC+rus1MQTEh
	 f9YrOoHx75Y4PpyqXYfD1t96BVQ9ZKQSUEeSeRjExxiiSL/22fm/oz4sVmUAeTD+XpJuP
	 jXEtyMYjTEW7wS1otPdhI1qHJEGIQrDkFoRgyja+upzCvlQTLzM1po+15/wShWrfNfQOf
	 jV8X6JbJS7/gD+mtUyz7dGP9h8JDRdgOar3eZF8NsNNKXIHzIBVSCFKc6M+tKdEcrMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
	b=wny2t7RIcG9mo4aZPeZYlk6cTkMVROdql2S6a1uzdL77qD/89A1SzUulMn4zRmtJ7IVG
	 QYeWcEB7NUtUhM4bV807SdZ7tpvQ/TbXz3BjYtrvZ4TFCCncLfICp8O5KEP3n7t0sk99q
	 nwQICM3rXQgIGhnfcq4r1ZZxRVM1thTl4bqRtXE2FIyMKbxsCSfnMCfaXHYFQlF/lVcco
	 7FF35zFpzYyO3Zwg1uZbbCjNkJkmjxFPnSvJBnEOaz5/OATIN0Mwz9HT31A4OPbNXpdP2
	 ZtPOpRlyHg060xeQbHRzhrsyWoJN0zPhcadGvzFSmGSxkcuSOKR30wrJh7dJEeq6sMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063A606A8A4
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8063A606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1549119a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567775; cv=none;
        d=google.com; s=arc-20260327;
        b=V9q4S0MDr77950ec40Q47Skwj+zB5WEjoGBtfYPbn5iqsUDqzbgmIPdmnbvPx78ars
         bHuBz/HWU1FoRuv2/9YTPbacORCJXCfRPgJo4jHSg5ZdUydjejdBSxv3mWZrVc+YFQcM
         28I0STQPlGpaM2vOydTxT8NQ+ea2/7+cgiRAxzQpZNwnzu4vbsdoh76thkgt6ODm5RQ3
         yeUEFGRLBrayDDevzjVFKppGgGaIkEOAllZRNDD4gCQpbPomZ7DrqMOjXAtKH3iupLAu
         9Qha8f85r0ZCe+d728nB/5MXteFB543R5/eH510UIx3s/o3U/m5A6adKvzeSOvKAgAsN
         5FwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        fh=GnEsuyCqGE7eh8HLJ685SKKggZboK2ySUzmkqXAnbJ8=;
        b=mjXLUgP7H5IJPguAN3fVAqvzBPo0HlX2J5BaHemLLvcA67lQsCFhHw/0mrZlHe8Kv0
         IeRBFnDZeZOkL8V0hlYbvMR0vcOuHJ/r116/qg+yk36xwDd6lNTrsTAmaDTfajbrz9Ht
         OhghRCzH7M6xFROuSyXGVO2WVUgIg33moKxwInspc9rh+Zw0WlEc+ydw0PjcGA1SaxOL
         MxX8VlI7WDLPzMwUU+xABNQe/iYtDe5oPwr6a8t+GmuIRPE2X+GWOq/u12lwgtasWEc1
         jRoAoq/lfkoDTEPSY/OxsGE3R7qrqzQuxmYL9RnwT8vMLGfJslVBaRB8ltJ1BOVYXUux
         abdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567775; x=1795172575; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=JwUO2hvV/ppxAEDkH/xdfzNFsOCy2nUrg0ZFHAtKdpe5gps/G6RPPA9pKq4aXnNwly
         oZhmwpq0Z3TSi2r4/g1eyDRmUf3WQvjKa86mjB0TvIGOiRuPPhYk5/+RymLXdtEiTIS8
         JvVaSLafA6RqJmAQEKd0fDEeXldwwMvY1Em98dMSnjvSFnsUBfkDluLri3+1fuvzDjjL
         XW4z+VHppZGjccnha4auuROdpE2ZV91UQ64JVsjuUS1y4ELJ/ZKX5hkWFlllr0XG+/JY
         eEA1IcCu69ZJOzG7zBmGhpMqzl/UXCVWflfmtyvaRXbDhmk0hR2dQnoMjqg0uBKiJOV+
         SJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567775; x=1795172575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=nUOmgD4jOmIbqO5bh91WyS0L6Y16ys2FZu+4lTnXeA+faU7za1RFQnd0Q5LdoNIoK3
         r7t613bSVu8ouUIgpajbAlD5Bi4jKUo6oPAr7t2bAFUi2v7q6qLj2z68mLpkX/rWtzp8
         9RQySiJJWXEjO65tpBb5KHlWcYeKxRzhVBUmY66WY01xv8JJFyfQ3eZTwuQzc80E/bAX
         HM07WIUPzNjkKl8XiNWmCpT65uIGrTbABRfOWPgf5delxsdi2HT8IeNm9j1l2f9wFh87
         NTS1TMQ58xi40umTPE4O0cGJOgExuw3gaH8HMEc7IyI89Lbx42ckeEbDbLOMkYYedxLq
         3cWA==
X-Forwarded-Encrypted: i=1; AL+hErFcMiuOpFQVtTuDNL7vh/C6b0O4QiPvhrpo4BxAKVdpNHLn1qKX/AeDrwOR+84CS+cbD+vy0QPLXSZ/@vger.kernel.org
X-Gm-Message-State: APuU4Z9j4SSeHwFcDxItM0FMhATv3y3uiu7Vo3e5F1+q6q9lD4IXvbIE
	8rh3btBXMqO8NiKUQhrnTRIHSMwe3+iGj6ZvixWvT1k/GNfVfppJO1ajnqOu5xwiFH7qv49Da0S
	GVOb6qUB0g/9WbfWnLGVdD3c+xKMXR3YZ7tuI4X4AF+HHgIOBGnghqCU=
X-Gm-Gg: AYBFou0EW2HvsunpRLO0DnK7oriCh3irzQDN4flmrI9nZJM+uj3+VZzAeFhPht0ALzE
	48xR4a2hshwmQCtFu2WmO4h2M9cs2ZeNCBjSXXBkeCeDZHhCuiQpuGQn0nkwFWn62QPyvxP8Hvc
	1QDs6Rf+0IWGutNFX8zEkObFxbmFKZniQ4q1o8BkAevNveZTs0pRoq2cgCt3NL71cs1vO2cpGpg
	h5APemqAtSwffN2pZXlKJ3ZedU4hzyNbz/yVxMZ8Ha4oViSHKV3NL9FR1C9TvTOnn+IVlLoS41l
	i7gAXSA6Ue9DmH/ioacwJ6lg3JB99rg4egqnMqvSSKcmF1BTQttGW84+Nh9DqhgeN1NDDrY64TK
	jUCzjxTSdCRVMb220aVYXHTnlGt/U4GoFSPdsMm+UPp8paFaodSBGmLQYYhlKEsElYwNa4g==
X-Received: by 2002:a05:6402:13d1:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6b7c0c7fbb1mr1715682a12.36.1794567774860; Fri, 13 Nov 2026
 03:02:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:02:43 +0000
X-Gm-Features: AclHuK-cUPGFMqYQ4aV0p1o7MZtl5WXavbyl1lomUd6smnM_F6LSvDHUWLAhm10
Message-ID: <CADrjBPq0nD1ENZySUVZvG8gWGpYrf1464MMau9VswjfosHU6Wg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
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
> Add device tree clock binding definitions for CMU_HSI
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
> index 53fc8040e173..21928235d131 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -28,6 +28,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos8855-cmu-hsi
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> @@ -52,6 +53,26 @@ properties:
>        Phandle to system registers interface.
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_HSI NOC clock (from CMU_TOP)
> +            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: ufs_embd
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 5d8b38a744b5..67cd97d8fab8 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -214,4 +214,12 @@
>  #define CLK_GOUT_WDT0_PERIS                8
>  #define CLK_GOUT_WDT1_PERIS                9
>
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_NOC_USER              1
> +#define CLK_MOUT_HSI_UFS_EMBD_USER         2
> +#define CLK_GOUT_CMU_HSI                   3
> +#define CLK_GOUT_SYSREG_HSI                4
> +#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
> +#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
