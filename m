Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579583;
	b=AOkTetdO58/ldE8f/qI6AfvgxEfqzoOEST7TLtzpWsyTbIOi3H8c0y5MnAkEjTnvL0XJ
	 NSuN/uBqhGshcs6PbS3rghOQcKUwV6Rh490OUbIbWq6Dghc0gFWNvW+vxffGO7dGcU0dJ
	 p/jCZOONK+N2HIWRmBejnRFR4pSYaPR72WmgR/R0/O1V/Bjs07VQeKjDSo/GwqCBB8hOM
	 Yw+fCFhSmVFhQz6Q6XzLrzXYYkSkYfB3ssnE0b1RKowECA51Hf0NwXgt1f0A4KTK5kuy4
	 z/d2bh5YtNe5CeK7xal1YiaSDhCuwrRFQarPEePf4qz7WPqWWRVBEQ7u8l6pkZZHIwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
	b=zUWzcZLl5N+D633LQdExUcHDoxsBR1dBRChLt4y8TrcY+jONUkEJMaT3pPhwsYNPL4Sk
	 Mo2uXCd+pLB8VLEeiAVGzMwPz04/XcNE9coxRSTUM2p2a8IhqiHRWrFZTfu1ov1P3vaOR
	 TVNwzAgQt87N3Xdlf04C9W0JcGtbaetAsjYSce1duiNOa/GVlHVAuajCSm79dyvfw9x+7
	 TEuyh9iXpT0Tm+X2W/2v0l7KXr06dB16JjxMyCSTh4qS6xMkJIMSibrjR//uMxZKT4npv
	 /xiKVP82DTS6vRtwKKf51j1UInrsoeQ5DHouCpFpdxeFSryu6dBi7GSMfxWTC4xsiUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1A606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D1A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso2687898a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579581; cv=none;
        d=google.com; s=arc-20260327;
        b=ont1JNDfg81uzUAPLfnv6/zr04AOpyiqlKzAM+kIMyqvx+pdHUPY90fier6KmOU7A3
         9BvQnOJuIuF3sZT+vDZpXi0F+bJhauNt6acp/WaKKFxFUad5udt2T+rvoErC9FuhT7ux
         SwksZmvMm5miFRzzZ9bn4XSzJQGwnf5gK1t2BwBRGMkMGIMpS954xRY2vq842yTWPEHv
         EeGZmhnYF1f6vygaKxCx6WVPJZAf5XdACMp1j1Uktx7DKae7z0oX2bO3gUeCFdYL/64w
         EySgNjPamwYPB2jxeWp34+dtIFz/d2GlwlWceoFKs9AlKdHhtVjsGRyCSHouAg8u2HYS
         rdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        fh=3WZ8I2hwpalzzIqhKmNbyP4BWLr9Scln1JXdSVD+hU4=;
        b=fDmCyIBYZTDO0K5bgEKGjC4yaWzOK9XBXmDt0dwqsps0FT1NRQS5NMqmMeCautBeIX
         3bMpVv07Eb2a0EWP0I/ovTCaUrRtEzTSdvaf0eZy9RYqeLBTefPB+J4v4jEAajqVVYNZ
         3hgEhy20Wf5iHkVoBrZys18heDJIh0WUY1rFqAiQfCe6ivASwmjBUfU/l4xZiRvd44YJ
         /DgNLG4SIm85phCFoGC0N4Yf5sy+vbQDj14akGUGjl3/QGXheZdeRJwi/zZrdXTpiMKs
         10juaed2WUgy4coQQNwOYoBaoxvM/A+bXSuB4kZEIzAQYSgAS15jXv5o7wRGdIiQm5hE
         BudQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794579581; x=1795184381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=CuGpuG2KrPPwcJdQD8Mt4QLipSoESTVXmGWzGuhZt8UmoCgk+cMoOBoU5i9VRwNi4w
         rh2Zg3s0Qlf8jDtUgOWkJovpMlnNGIKgGnRxk15hcW02DhYIdQd7kHVNzO4nP2kmBYuY
         JO5na0F2kV6uQXP1SDKHOaTGx8kevs75jbmgy7joxXBX0QNEok1leCrTJA8Nu7gZ255a
         7CBFWO2oXC4Q8ggcij+pFbu5AYxoSXoDL73541MhIxQko8FsqYlhTe4A3Ma59QcjXblC
         qu0eJh3jxnWjLKplHD9g2cxma+qPJBK817xqdFV81tftlroFD3zKtakJjJNPfITIznsI
         Gx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579581; x=1795184381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=egNxbk04+xH+zmv0k1UjMIA8zk2TU0w2tnfuC9TIZy8Q2MWvV1pf6Jw3pOFr4+KeXS
         WEhZSNRC5VDI4GaCkNRXsbq0FGtW9+JYgVJ4LPTYpbXB61d4dMnyEldC4LC8Mypzfnyl
         8c078Ajqzy0yDOHG7an4NDCNrN8oHGYRDsAAJHbsRLT9NkiHrqgKU2oKb2ikb431Epyb
         xKBsekSiVblyhAfTTeoYBvs24oQHrypQwmurgTxbBvJxlYasXylRwORFHwMa9cFsh0Kj
         nYKUFKqWXdWcVvdH02GwsGjz9SlgR5D7YvrR+IMH/4q19HQzyZgJapHZnFVWluSYjCcc
         GPfA==
X-Forwarded-Encrypted: i=1; AL+hErFIe41rABz2NSeRMh9b21CJOx/ww0fdBIjVHehHx3Ry0Z/VPgdPTR2e9+gYyJZaJ7mDwoDEzUgyKQ+F@vger.kernel.org
X-Gm-Message-State: APuU4Z9afhRdK5emTlJGh6Z/EybArI72s4Eu19p671xSpRohh1IiVBky
	pz7iopbVu6cWgj+RwQxkOscyu4EL2Cl+uJSZV9WVI3D4+7c1A7lPpE3+g0JY9t+LW9PKTNlHqvH
	YFlzE/LF6uhhCCTd0XBYrWpR00EzRy7/X3zjgx9DesQ==
X-Gm-Gg: AYBFou03fJpF/IcuHnqKcZiLunAU9TaGNuUDQd58OW1YCEDldYsgEZdCxk80lsFE/10
	35DyQDKqVTsJKkfUKv1pz0F/OZ0RW/SYtGVjqB1iWVUf5Dh+Y+Oq+zKK2Vd6RL5UUXPcbICgZdo
	kt9L54oDPrmwlEiu8zw6JR+Y70EzAh95OqW0oasxilJig4+u4P4CXyW4weiQPE6g3duFZoT78Cu
	GO7UoLLO2jObIdYjEd2yAtZKn6ObvfRiqthHFqX2wrv4BxeXBYgTdfpE3b1x4cW23fHkFtBvoD/
	mxye5MAl0jJP74ylPextlOCwEuNXtAKLd7V75/riMK65igOfsIwOG12Ke/JDF031nfHN2AoM7b6
	WUSN683JuNyexNTCOyRH1CRdMu00wQsvSpqIehWVm7NGcTObvlHLzGCOFH1usrVbEb5pRhA==
X-Received: by 2002:a05:6402:a6cb:20b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6b7c0be4e2amr1723925a12.9.1794579581264; Fri, 13 Nov 2026
 06:19:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-1-selvarasu.g@samsung.com> <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 14:19:29 +0000
X-Gm-Features: AclHuK9BtJmzcgRQKlrlAtXVpG8_cOgWPWRM5bnocNCGOV2wnBohhrKZoowVukc
Message-ID: <CADrjBPruky8SZYpX=MgsMjiKGUJhOhVu9j3Z+9JgJbizmcxSjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform driver
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 12:14, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..069b265c9808 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>         { .compatible = "spacemit,k3-dwc3", },
>         { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>         { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +       { .compatible = "samsung,exynos8855-dwc3", },
>         { .compatible = "starfive,jhb100-dwc3", },
>         { /* sentinel */ }
>  };
> --
> 2.17.1
>
