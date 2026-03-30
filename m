Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E913A7855
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859565; cv=none; b=snIfKlsqg0NRdkzC5NaRPQFXR8JnjnErwfZ4vGw9gvtLOORYJ61kCzsKiDN4WsPPtcaRcNHQDlYIlWIXfO7yqejhAUiLE+v4HBlQbmJdzIJZdzqNA8SZ/tui29dJZDT62SELF3AP29JXlCR/74ykkuW9EQDHk/d0oBMS5CPNni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859565; c=relaxed/simple;
	bh=75FEs0ybZkc7CPZSVzblsuu4jpTIyJxwvM3fwOTN0rg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9yEVglbWhFq8ZZgGW+BSRoFS1qhCCPbq4Z6ZDn+CL/NuWYVH7UEhU7sDjMkkaEIuL0lPD045syAojzZ5QVfGa9cTiqleyiorydOSiYDNDh5eEmpi6jPugKQe6xRq59BHtRNVeQAJ9EGFnJLGsnoKmoMM683yYM2WxT+QAx8Sn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En8X2SOW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En8X2SOW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4E7C2BC9E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859564;
	bh=75FEs0ybZkc7CPZSVzblsuu4jpTIyJxwvM3fwOTN0rg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=En8X2SOW9T7nefppn/9ZHKdFbN3b/AHrW5zHUvCQTAYSW5EdsA8DuWbXTWvEGh7yr
	 uspw5j/i4Aj6lpd+E7pOLmQImCctlP+GXjPukCDl40E3wKxBvztJtsHYkZXttHIXML
	 GoAKwdPLjF1jk/6XN1W24WXPApTTmU6SEemZwwcALyWxR9Vm6Vpk4kwPgKavGnw89Q
	 V5BX83KRK+Mn/vJp3zz32Q8q0E2wd/eEXB/4I7vhTmtcnQ3rjQrITM61pNSZvDshVW
	 RFzGMKarUMrqOrW87bMogpOg4wpfe3OPFx8WQk+nIpk6yo4P55XN4ODu6jhJBQSQmR
	 aJv3HiE2S5ylw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38c688bdc71so27140631fa.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkfCznNc6+uISL250njPJPvJKGnp0aZ8MOF8LYi9B6ZgBKA1+6qGRXg+cpP8A1pZqQdJLBMW9McpiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGECkqqCPijDVahUuzWv28wzpbxFazjpyw5emfnW39EE2U56W1
	B0L3hT6Gi2CJ45/47VswSrq+ZGvNSGeMmOLanACpQU8VCN2MmTfBwKs7VKplZpD5fEU7RmB97mh
	Wn7HbxC7G1/fPEYG65XPtsC1c49YZfnrQVB0YU7EunA==
X-Received: by 2002:a05:651c:502:b0:38c:4b3a:337e with SMTP id
 38308e7fff4ca-38c731277d5mr34532821fa.11.1774859563585; Mon, 30 Mar 2026
 01:32:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:32:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:32:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260326-mfd-arizona-irq-v4-1-50c47ed0a18e@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org> <20260326-mfd-arizona-irq-v4-1-50c47ed0a18e@kernel.org>
Date: Mon, 30 Mar 2026 01:32:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf4pW9iF2DvCD6AXj6+p9r5Lt1RFs-Ncfb1_Dnaew6ftQ@mail.gmail.com>
X-Gm-Features: AQROBzDIZUI2nf1NyRuAAq4jwxwnEPPBZL2x8h6eRzw_2rEgUS5PZL-0f_UvDww
Message-ID: <CAMRc=Mf4pW9iF2DvCD6AXj6+p9r5Lt1RFs-Ncfb1_Dnaew6ftQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 11:51:11 +0100, Linus Walleij <linusw@kernel.org> said:
> The Wolfson Microelectronics Arizona sometimes needs to poll the
> GPIO line corresponding to the IRQ to counter bugs in the hardware
> that appear on edge-triggered IRQs.
>
> For this situation, provide the optional irq-gpios property.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> index 7902f3c5d289..359e40b3dacb 100644
> --- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> @@ -194,6 +194,16 @@ properties:
>    reset-gpios:
>      maxItems: 1
>
> +  irq-gpios:
> +    maxItems: 1
> +    description:
> +      A functional IRQ should be provided in the interrupts
> +      property. This property enables edge triggered IRQ emulation
> +      for hosts that don't support the codecs level triggered IRQ
> +      output. The GPIO line corresponding to the IRQ will be polled
> +      until all IRQs have been handled, ensuring an edge is generated
> +      for the next IRQ.
> +
>    wlf,reset:
>      description:
>        GPIO specifier for the GPIO controlling RESET
>
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
