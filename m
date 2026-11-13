Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574910;
	b=CX4yjXlSEfhz/cp34UTfLFeAAPhNIcYbOFX0SHrWP/s368T/M4XUUTRxmo5Fg+MheLbt
	 veIA+1mm7QFFnR6kxhCH8evg8VcK1dD4HcO2AFKsn0wKTj51sMyrUHHXIl/CiVdo0C7ex
	 pL2MazC/f2l5FOmY55XWLi6r3hgkOF35WrKpmhkf0uiHXuYohwLSn6MAK6IDdyeE6mw/q
	 fAdMZ+yS1BAYIIUyJ7agSgehxxQya2wyg5AYjzHCEna74+folUBycobE5VmziULTuLMme
	 3/mS9/u0sBvLiv3JnOyIQRVg1+biAA5NJisfbU8kIfA/UMi4qPA6eEWzNNFVh3s7NsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
	b=RLQYetExXRQfFlb/ckQtlqvNWESOBmGjrFDF8uLK7T/OTlt4NnMDv3j85AKXXI+vHkiP
	 /eit0KuJwidm7eKJIIhDK+oJBW1289gxxh52HmWH1GWRSOVM7EIcerF7USHsekvOwkzuO
	 fZVmwk/FwJAtWtiU6cjb8Qe19jwMmiJniuPQrjrSYuOKKBNsji/ZX+2G2O0ayYW3ESznt
	 qrs7UHWW8mUDQvj3pNWR95nRHolBfdlM1IjQ6p4B/6TPdHh6u/x2V7xPV1K1G2+xYx8RF
	 WP/39Wgjz1DaW0SjVsxPfbELCECUwJ/QFEpsiX05BacWzvR6lc/ije6+z5fGsK9Vx+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733F606A335
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D733F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1912014a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574908; cv=none;
        d=google.com; s=arc-20260327;
        b=QAke2cSDFg8cPXFkmboSc/Ks9Mlm19DQH/0xvwbw1qzRmw+0XKQAFGbI+FDUaOpYJZ
         3F/zx5WzpwXzXKfktNn/LXQPyrrgk2Mb0Q66YvSXI2FLXXnCvFQWxdc61BQGvxByccyR
         FDuihPko5h/lKuxPtkkUPVu7rO0fcmDRBG/KkYOWt2u5zQNRV+KDg1vHV0KWgRhAzQC5
         8t9R47se1A8GKiwAZfcVOt9rnnABOguVQe0qXBXmlstGWIcsYkj9my63r3FAewiL4e8G
         p73vOe1ntZFFXtrFv72UFKAvcC7jzmplxmbyMqmiJJWpQLMctitjY9tPo2kEV0+OqIfq
         gJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        fh=f/hn7rD3hm2Rf7n2E9umHSjroGgOHaL8fhqokZseqUs=;
        b=fC2GzKEsuoPUHQEJ7xQ7xqRAFCVcCA4bKbZyYRJ6XKJgyr0uzIIbfg0O3IWSxwOvgP
         +zMkmNkW3ZerjCj2UOvYPitb6QDGqlL8F2ImR9LKhvDo3yvXj+M+n9XOwnj5gF+eLIIw
         7feRbJuTBzzrYA1w4SqDAW1SoWGdn+Dcz04VmmNs1BNQKDJfqxCvYrZJVtmclTWRMezA
         kmCIW60TqUih2GY/YZ11yKr3MDQvp6pPuQs/61NJfS7imwbZqcQFeT4ZrOUI+aD3Y6lX
         94jUX+1PNIe3euC3C+jY80S5Yp0H4OA4ibj+DZmcyprYiRIRukJk/kvajfA+WLpxpVkU
         4W7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574908; x=1795179708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=Yg2aVHZMqVneHiwckm8fshswVKEjDDg3fGYweaRCKQ1LB9kEeHc6ZUBTWrZ5zrajdJ
         J3NPx7N1IBwiFn3kf/z+OWrivkdXO3HXB3dfv5rj+U4TIcjbk6cYVuzy+P2MV5ekJJwu
         8mbKTjvtDFhdMaPe73boK5BYZG2vc1ztHGioC7fHt9PF4VWSHzLLJGHNtTIXK4kQHSE8
         G/Q1J5GPEhayhXwyaqWCVR6Br9Mr5QQ4Iym9DA2hCmJbB2UfCfdQ/gNlywTUKQJ3Dmw2
         1GFDfHlzu1UeX+VxcENlq/ApQPoKOzw4Nqa86TH8RiHalCLTxsl1w6jY7JREjRcZ6tCg
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574908; x=1795179708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=GcB4Lg6jTTBSTKPUZ1DJiVBXDxOMf+3LB1cPen+db32Ag7qkHlAqwQSoMM2nUqLMZO
         9JZFP+dAeXgptz6Y0piUGwqvhxeUZ4p2rMJ/dbYZeaNwJdtsW+OPI9G55t0Uftg6aJEL
         LhO2uJEDe4kH/1lA1DaWv5a4304xYy7Eh1GuWMVGqqq2skVIrlw5c9aPp7BLsY+6C54W
         GEC+Q6jULSDukO8PvuKIlvaHm4MnPhBJMVLTewEVsttXoC9iZQCFhviXkDMRzTvzvq/U
         pZEXry1pyyGfSvSR2+CgRnCaH3Az3raxsGErcb5LitIqQ9DHooU17mLZYjBXj1figxRQ
         E/Jg==
X-Forwarded-Encrypted: i=1; AL+hErFKTxraGMHr1SzdM6L2XnmnpiifzljHC+sj6u94Tiz5vUlpC69SgHmjPGd448MVdAVyAvBSn3s8JJy2@vger.kernel.org
X-Gm-Message-State: APuU4Z9GdGRimTctNelH2i/VD7XJOPOeHii2WdMBc/+QpS+e3aRiUbQQ
	2/23zypzAE1ZRuuWWmAUTzG8+vIcB9jRd78dxZo32GYo6K9V6YRytoF4PvnJXrgWAL2fTVlnFNu
	LUYGAGD0FXgYCQNdStyG38yb7dTLsgojK/P/EMGyO/B3tYJ+c3ITY/mw=
X-Gm-Gg: AYBFou3hBWRLsOw5Q+TepDXBq79XcAl6Lvns9ycaVXhUxZeOpjC+wz6rQkyGgDaOU3g
	57PgWp+RLuCeEhZVjTB/8/e6h+ymgyxX8+imDLfhTsBYl/DRX+tncxhXvpCS8r4ahILFvArwpK2
	w9dR4CI71fC/fQmV5u66rVTHYirzH4l91dAmEvRomfvcxgOPzgdXaexWcjMrB4REixsKcSCEgZF
	569kBdC9AFQ8fLSJO12FGujenSWk6ZaeBiFXDEenY63rQ91uxGbQu/qv8x6jm9bGNMACxhSaynl
	AksnPi60aJtoJZ6/0jRXo+NgUC9DPtnaWAyzKduo6mgc7snOLDMgIUi8PnjFNaY5mtKX/UZpe8x
	7JltI/DUTr7EkFgEYJ/viyUJ1WzuY7DCvNTUc6zmBkqFW574Ui68jKIzQifd9Uy3IT5KhZQ==
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b7c0953c22mr1651047a12.14.1794574908159; Fri, 13 Nov 2026
 05:01:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-15-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-15-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:35 +0000
X-Gm-Features: AclHuK9jDSyMiIFILSiBUttwKXmQ1n1NCQzZgnrbYNenJcyQXOWeJVgUA5tGPQ0
Message-ID: <CADrjBPrA1WZO_7bjV4jbOGB6MRZMG6=8UTTAtf-v_ZRq06MxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_usb block, while at this
> add sysreg_usb which contains bits for DRCG and MEMCLK
> which are used by clk driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 3dd7a4c4c609..dcf1e58c6367 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_usb: clock-controller@13000000 {
> +                       compatible = "samsung,exynos8855-cmu-usb";
> +                       reg = <0x13000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_USB_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "usb20drd";
> +                       samsung,sysreg = <&sysreg_usb>;
> +               };
> +
> +               sysreg_usb: syscon@13020000 {
> +                       compatible = "samsung,exynos8855-usb-sysreg",
> +                                     "syscon";
> +                       reg = <0x13020000 0x10000>;
> +                       clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
> +               };
> +
>                 cmu_top: clock-controller@13900000 {
>                         compatible = "samsung,exynos8855-cmu-top";
>                         reg = <0x13900000 0x10000>;
> --
> 2.34.1
>
