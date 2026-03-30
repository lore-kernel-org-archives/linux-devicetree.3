Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84818BBAE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849760; cv=none; b=gCXk0gm1Fw5V0fkDfeUan2HpCJS+i9rHKpXtfc4JycpXvu0JCdr2uHeVd2gUjWttIdO9EvU7OdpI/KtDuiHNZ9G38KH7ZbNITzWOxPyfVHTa8Ce5ag5q8+Dnj4AUAt7jBzQldLTr5GuMUl1mJgKxoM+0FE7P8h/nWYCV+AEmvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849760; c=relaxed/simple;
	bh=JJib5epLYRuHjuMYrMXAq2Xdaf1Jvt5BuxzmyXeLSNY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qXnOIaYldUMkavPKBo4owNGbqZsW1Zk97N5QZ7DIv9OjLn2mB8XzmyrRSgoqozEPhO6vza+9WC6h0ipu3UnmYHd3Io0YSdsEMXgAp0KGRNbFS65GZi2mh4P8oSsYOVp8RSdaoIGq7uka2LxwQ2UVbX1KqYnrQ6PYDf7bkey+Elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rajCxUAN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rajCxUAN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so35504105e9.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774849757; x=1775454557; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fetVgXx6p5dzBWcp057ayPs90uOGBSYCCwrgacNo9LI=;
        b=rajCxUANsKeOuyf3QqU+UqiPuicCC6MsP6RB7l+SonZU3lIGiPVHXpq6AguCcDVTVF
         WpLQPFGfz8Cpr5qhnn3NtkWh7aR59wKr6uxfjCxk9ugXi1Ulssh/eBShAi7mgn0QaIEX
         v0+sANzUeB2HvWAUbDVjyV/UPkV3CoiRG66qs32vV2L3mmWW8uSNbQOmLLZcgJ6j90st
         K5Xf2nftC9kc33Lh0QfQvBLJBXMKIXQwc7EDz2DDCU9Tly62Hqv7UZZ4xMuQB+mcwyCO
         TIMApIRJojls/at7DtzWNn2RVifle/uUanHK42ifbLZq5gQCovB9UWhBNUos+xVbYGoi
         B9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774849757; x=1775454557;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fetVgXx6p5dzBWcp057ayPs90uOGBSYCCwrgacNo9LI=;
        b=ahF+XU6bPuK4UAckI4JQW7YiwJYNEUsrlh1jDGsmgZp6WrUPKqMytO4nrkNBJKP/1C
         7QRuy0k6oIXJFGG1L1qKPOKP1thOdUeFlGozD1USoUevn8kQc8ahTerNlokyE0bYDC6J
         6fTBA9yy5CkfwPD8B/AKcI81sQJNKU9qfyV5pr9y+B/f4LESYq5wSz8b6Rp2FBp1Yyhb
         SlfsyIAGNso7YSuAdCHL1DEslAmNfDyuH3OGfpPptj9kIZw2DRKHWgNgac+URiQKWMRx
         ed9bLay8faAtk/Um2OfAmG8IC0n2l8y/ATcroiXik5Yw7EOGB0QEaLE3iQRgSUjqmGfU
         kx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdpSk+hpSuhR1NRKO+xJH2KL/hY9DCioDG/xK1PZzu2auXx+ocRBO5AsUE6SrI6JuaOI+nQK1QgOm7@vger.kernel.org
X-Gm-Message-State: AOJu0YwasmFzOLKj5WG7jafO8Vs/KgadiZvYIa9f3NqGI5KW6TYDJZXj
	ScBkYmD/6p+JD+RHeyBqRpHN9EmfKE2IVsCv9zTwdwiiD0JwYL2Rl3+w
X-Gm-Gg: ATEYQzyqWGrax8fdO8vSzXNcYRxDy73oJ6zuXEZvb/DNahhhfm3NQP9IdaFv1Un6yTi
	VY92OUyjv+swnC5+/QR3AskYfviQq2J0hoPCVdBMSEhkqRxXz4OjhPLP42P3fhf/wvNVLJ9W4kd
	iTjrRrsIqthrHAT4xEEsk6F7TWCIkkw74lvjPeqUe4mK/j2l0bogg23otOIXMtCO7mLrONzugN/
	6AsJJFN9krOu5VX8keN7pUYjcE5WoMjr2PTzVB5p5+U6YAoKQbxRD/kbcKOy8hvcSjyKk/gKZnw
	D+VCrq33QZ5bOCYuBUYmIl7CgKxKGdNrtulElQ04XP9gt4W4XfJpPaD7h5FpFq0islWFkEFYGog
	ZxS5ULHvF1T/cM9NloIqaUPTSxyacFMGqoRnGCuTunxof5qZ64X2YRBufVC871Ky1LGSW/U2eFS
	Ow3/+lUQ3az0M4FeevFIqZyM/Z742cikeqVnkuYTadVb5xEHhKDWZr2mOUk/3+vYweXTAet5AGn
	8KAGFhBKkcGUQai/0jTw/U5bD6RwoehOjasNg9/kFwjcplnEGeNF7LLEw==
X-Received: by 2002:a05:600c:8b03:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48727ef16aemr221406975e9.6.1774849757233;
        Sun, 29 Mar 2026 22:49:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm70514355e9.11.2026.03.29.22.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:49:16 -0700 (PDT)
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
Date: Mon, 30 Mar 2026 07:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260327121919.603768-1-padmashreess2006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Padmashree,


overall, your proposed changes look good to me, thank you for taking care of

the DT schema for the pcm3060 driver!

I left a few minor comments below, but i am open for a discussion, if 
you think

they are not relevant


On 3/27/26 1:19 PM, Padmashree S S wrote:
> Convert pcm3060 to DT Schema
>
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>   .../devicetree/bindings/sound/pcm3060.yaml    | 42 +++++++++++++++++++
>   2 files changed, 42 insertions(+), 23 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
> deleted file mode 100644
> index 97de66932d44..000000000000
> --- a/Documentation/devicetree/bindings/sound/pcm3060.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -PCM3060 audio CODEC
> -
> -This driver supports both I2C and SPI.
> -
> -Required properties:
> -
> -- compatible: "ti,pcm3060"
> -
> -- reg : the I2C address of the device for I2C, the chip select
> -        number for SPI.
> -
> -Optional properties:
> -
> -- ti,out-single-ended: "true" if output is single-ended;
> -                       "false" or not specified if output is differential.
> -
> -Examples:
> -
> -	pcm3060: pcm3060@46 {
> -		 compatible = "ti,pcm3060";
> -		 reg = <0x46>;
> -		 ti,out-single-ended = "true";
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> new file mode 100644
> index 000000000000..2d920a70bced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCM3060 audio CODEC


Here, we seem to drop a short description, that this driver supports

I2C and SPI. It's maybe not a big deal, but maybe we could return these 
details,

as a `description` property? Let me know what you think


> +
> +maintainers:
> +  - Kirill Marinushkin <k.marinushkin@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: ti,pcm3060
> +
> +  reg:
> +    maxItems: 1


Here, i notice, that we remove the description of the `reg` property.

It was there originally, and in the 1st version of your patch, but not 
in v3.

The description here seems important to me - being a documentation, this

yaml could be more helpful, when it describes the meaning of the properties.

Do you think it would be possible to bring the description back?


> +
> +  ti,out-single-ended:
> +    type: boolean
> +    description: |
> +      If present, the output is single-ended.
> +      If absent, the output is differential.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      pcm3060: audio-codec@46 {
> +        compatible = "ti,pcm3060";
> +        reg = <0x46>;
> +        ti,out-single-ended;
> +      };
> +    };


Best regards,

Kirill


