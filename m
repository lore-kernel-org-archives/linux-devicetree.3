Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B583A63EF
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653643; cv=none; b=Tqw/ZO1vCyNAco57Xpv/X6jMbS2LsDtjOuxcf5KEEgf5ejU/E/8KhFDMGRM1MtJF+wBt5KRds6n/yuMLO8LMMy+ZN+57GgtulT4wSSOta0JJiX0QcFc3T9lTUBiUDRFV2Giuk7LPK/nLtDUGIix+qXNg3wJgzBjwWgTNv3ZvVuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653643; c=relaxed/simple;
	bh=VQh5nem3gKEdyS4EEAM8gufXvOd9+2NjEM3orr1IqEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ken0G2uKnUBDm5ip3i58h9crjpAFmMG/2Fiu0s3m43NouAhSTTMkBHFmkbwRyTJt3SMWtok3PtEwaz4n8NbdjuYcDmMQasiAVUFdrBdGYhcbzKd5XjCyIDT+kHg0hWF9tJkZqk3ppRyNxBx0qTJyGy9yPVzJOJnvJ9QyPQNBD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso3243446e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653639; x=1788258439;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NMhzQMeM3nliAFUhzIIevbSwUI95NmvlEJTJ9DerXJQ=;
        b=PzIapBF8dF/PcjuoXf0QgUhnzmBl2VtLP6hHYC6ksxT+OKbADKhcmMw6ks1eAjSdnB
         8yA9bLrXlBJXFHMaBOaz+bVKMd3TVycRO41cGoyOj4NUqoD12Steh0TFa/MOn9xK0D80
         Ftb2HWJ4SMy6WpoRYRngY8Hu9YIah2LOYGq6A6xxCi1QRLOGRvf4OGzuFcrl651u5T2/
         8XDmoM/It6Dh/oGZnSTkQChbA/vyKUzYfysRUs+AprNQoOM9E+4tGrqqxI1NNlm+fRnb
         N9yFP7ZAXxNRDaghBj8Xg5O6EJN/iAps8Y31rb+UvFsN30qUMX35aD8Qkwqbmpmo4Pz6
         xhIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFSpkIUsHZ1m23V1YTRnW1TOiRkzhGx4WPhjarKqokeP7kkrjXc2CcopmttU4D9wearUg4AWGopOAN@vger.kernel.org
X-Gm-Message-State: AFuF++nG+9e5FyTDMTtx8r0I1UaUEMN5YtD7xomdlach/JOSy+r8PSfD
	gvIDRLyOq6YoTfF50cTcNo4+zE/k/CSom3FQY8gWn5bAZC8to/PIIvDBd2N3vAWPBds=
X-Gm-Gg: AR+sD10kpV96wj9kSAzKtGZrKc5UXDHdAiqb1Dsh5mUZfLSHYtjPi4PdSJnvLurVE1k
	Rw+887WeEFeUYk4O2+F6AeadpAYVRliO5CNoFetGBXCpVmHoFtdssOzRKBVomNa0DoiXiHE8cX3
	87SsibKtz2PRmj9m7ZgCYTpH95FeTq+huVvTiy6nTMgSQu9Cn4txG4u3Jd82K5a/tAt8UYAaIIt
	lWvW6oK5U4cBDp+LXOStX1jHo9j7Vk0m0l3Bd8Gpv87YQ9n636ejDKonKgGMVcN0bKN9nqeesZc
	pUeyAJD0hMneUxj9ZgQKjFozC1+JaxIXrStuqpM10310fu1IM2zzUCgCo6WfuqY+dsJFLhijvbX
	oNu1n0cWXqqjL3AQnyR3OtMvdq9etFBxPoRRnPMyTeF/q7BEFZDzlctYnM+myEEAU0dkIOPI+4j
	1iLt6+EQCDtBAP3J8UsbSAZCpaIni3s8sgMIo6Kq1Dx3XjqZ4GPTR3MSn3RAgwIAwbvGnwedQlH
	+KSl/nAmiBAFsuHuuP9ZDACAQ==
X-Received: by 2002:a05:6122:8c8a:b0:5bd:9c71:11e with SMTP id 71dfb90a1353d-5c642dd3d89mr2275664e0c.4.1787653639551;
        Tue, 25 Aug 2026 03:27:19 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eb64b2sm5683382e0c.11.2026.08.25.03.27.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:27:19 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso2037104241.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqfHedtQfB2cojJdgCCN3cgBOyN4/WeTA0FxM2mQue6ZglK6bQZyRcjHaT4CQA6TivOABdR9i3hGgFP@vger.kernel.org
X-Received: by 2002:a67:e704:0:b0:781:1ac:8232 with SMTP id
 ada2fe7eead31-78101acbf3amr434101137.5.1787653638529; Tue, 25 Aug 2026
 03:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 12:27:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wj9vyn8DJ9WAPu7bezDHW09jHEm6VaLzU60Dxiy5n7b-T29KqpuXUcTTg
Message-ID: <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Use hyphens in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sat, 22 Aug 2026 at 09:58, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> DTS coding style encourages to use hyphens instead of underscores in
> node names. DTC W=2 warns about underscores. Improve existing code
> because apparently people copy it instead of following DTS coding style
> for new submissions.
>
> Semi-manual validation by checking if no new nodes appeared:
>
>   $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; fdtdump ${i} > ${i}.fdt ; fdtdump dts-new/${i#dts-old/} > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt dts-new/${i#dts-old/}.fdt ; done | grep -v ' {'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
> +++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi

> @@ -696,7 +696,7 @@ i2c3_pins: i2c3 {
>                 function = "i2c3";
>         };
>
> -       irq0_pins: irq0_pins {
> +       irq0_pins: irq0-pins {

This one shouldn't have used a "_pins" suffix in the first place.
I will sneak in that change while applying ;-)

>                 groups = "intc_ex_irq0_a";
>                 function = "intc_ex";
>         };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
