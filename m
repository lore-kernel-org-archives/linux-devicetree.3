Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551FB1A6834
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774794715; cv=none; b=p2kvAiLCgPlCz7yLDHegfIz0b4G8zJ9utNtm+whgw4kvQoqBj9/GffzTlmZ5nsOf6NCro+jGf9bwTPWF1aZbD3AZ6rzWz51a/c8c+2Z/yqMyXlXNWcNqVp1tHKLsF0jmVuzVCObM1lJ3cYzLZF7Z+TJ0Q3pCrtaCbMnIAtipoLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774794715; c=relaxed/simple;
	bh=8Mk60eVl+dB5jKyjdUQ03s5Lx40a3eGPQVHoD7Ugcvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPpyabIWe7GNEOEWqwAMPTaKqoOXioKjxMjZXCKD9znKaUXXsh6KcbWwHR2z18sMekKdRVIc50cdC0iEWem87t5VFq2JfuEBHBwRNy2b0x43D4O+PCzR5Q3C5w+unBxLltiUEsUyTgpdfot3BeEw32k8X+LjWsgA0E77Il+BZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUVhYOFc; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUVhYOFc"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cf45deb45so2812204e0c.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774794712; x=1775399512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdYDhOE8OZqYxhSczZPWR/m9/1jZD7ZOGeIOm//D/jo=;
        b=rUVhYOFc94N8TXweiccYzIRuw54E9kz8JKCEFmbsOl6Tce/P8k1Wmf5Ad8009bNjWQ
         j94Q/N60U+XEzKDkH3vCFnWasO66AvHkQ7pG3nO/my2GCJbDPviyq9KmaAj5MBDaAOe5
         I+s7FB7gydVvPbW+5S3IWlHwS+DBixx/tn4YM/LA2jvrtzyXzZ2sidX9dx1m0qMBmEH/
         YksRVg+yVAxelZSRDecKz93eT1rZIACh6mN9p+xBA0SA/r0/IX7B2D7h223Bzq6czhje
         nRhl+ledZY2ZeUgO8cwct0jSU2tk1xka1VlWuRvFEe3PjSjGWSqPpD1zggmBjIWecsZ+
         CvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774794712; x=1775399512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdYDhOE8OZqYxhSczZPWR/m9/1jZD7ZOGeIOm//D/jo=;
        b=G3ruay7f5RgadlF22FztaOBfRhFLzjswhsHybqWv5YEtLr2n2ardz1ShjeyNedy/Xf
         5+CuyrXsZEuL04KsvgQ64PNTjabLQXgKf/thXFI3zQ+T9aWYk+4s8azIIFv2P8sl5+eE
         XkE8fX1k/xfxY40YIjiX5TZgxF+ZFVfeyiy2+xIQzAfAus13dDi6Zjqh8VJZpYj4EMUF
         d7/nKdA9sJxqfebqa2/uvHYRETo9snWZFWFMWhxb2pqgujZPJuITQ6FDxn6WIyC9G5cG
         WPe6O1KfWIs3BVygZt36eXh6UjdlU5aBb9+SudAAMUPVnnbuZdu8nOmdI9ND4LTrMeKS
         OtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDDisbh6CxqdvuKX25UAif1YV7zBD04WUGrlPFupRvTvoG84Xkonzl4hwNdG4JYMD498LQ59J49PQf@vger.kernel.org
X-Gm-Message-State: AOJu0YzwSBSsI0OI1Q5hKizh9uNA8SWLIyEsLYrt+kO9hYYrUvFKYp45
	Ht5W94zaWAVP+ueNGE8aND/fQx35llve9aCJ37DsOtOJpT/ZUqI7XIMM
X-Gm-Gg: ATEYQzxKR/5Wi+AJvitcnz+5mmpDXqIFarxg84cBaei36KbHagSLI4C8RjQFcoMzRRf
	5w4W9TszXohs+bjwdLmNrZgLVP/yWOUk4aYP6q7TivZDEMn7Skj0h10ovAhGPo7V8Ro77f6QBAH
	zaIt91zMDMCg2XVxVFeLs3V+p22LBsgkux5DKF+Jdd9Nt2wlOKtGTWunaPFHmcBP10UvamWVZpl
	Ia96iqmW+N6R8nccfZbPo1FggpPejAHMYdVzVDUlwWXEzwm3HH9D70TblNJzlfPx4PGUviskOZI
	eTViAOcruF0kBGG5Nxw8sLS5W67iuAuNdUsnxHwbMAyozbFC0USIQ8JDDWTKQiIdNrfuT3OECc6
	RIs2AJqpAVe3Asfs/jzW2c+r6L7UcSug2/AnKd8TaD0IYBSmWTD0QnSYXJUkCvgza3bJBBxvLpu
	zhV5G4X+vazoj+DQ6sogLP1To4ISpoX34=
X-Received: by 2002:a05:6122:6e0f:b0:56b:7ec9:f54 with SMTP id 71dfb90a1353d-56d4a60af4fmr3772261e0c.9.1774794712267;
        Sun, 29 Mar 2026 07:31:52 -0700 (PDT)
Received: from localhost ([2804:30c:979:9b00:9cc3:5a7a:e884:2060])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d589fcfcfsm5510916e0c.10.2026.03.29.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 07:31:51 -0700 (PDT)
Date: Sun, 29 Mar 2026 11:32:33 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: charles-antoine.couret@mind.be
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2 v2] devicetree: spi: add spi-mosi-idle-low property
 support
Message-ID: <ack4AWGeblO5hvkM@debian-BULLSEYE-live-builder-AMD64>
References: <20260329125832.2985115-1-charles-antoine.couret@mind.be>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329125832.2985115-1-charles-antoine.couret@mind.be>

On 03/29, charles-antoine.couret@mind.be wrote:
> From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> 
> This flag means that device requires the MOSI line to be low
> when it's in idle state.

Same question asked on the other patch [1] applies here.

By the way, for SPI bindings, the patch subject uses a different prefix order.
See submitting-patches.rst [2].

[1]: https://lore.kernel.org/linux-spi/ack2dPiLpO0uE2VE@debian-BULLSEYE-live-builder-AMD64/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/submitting-patches.rst?h=v7.0-rc5#n18

> 
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  Documentation/devicetree/bindings/spi/spi-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 3b8e990e30c4..5f5b143cb27b 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -132,6 +132,11 @@ patternProperties:
>          description:
>            The device requires inverse clock polarity (CPOL) mode.
>  
> +      spi-mosi-idle-low:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The device requires the MOSI line to be low when it's in idle state.
> +
>      required:
>        - compatible
>        - reg
> -- 
> 2.53.0
> 
> 
