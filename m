Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E123CCFB4
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596652; cv=none; b=i+xPmeH03tIX/e0Pdd+EfqDSfYMsXdZlMnJ031g9vGgtJyzHq2BQH8sUffNhL4q6zz3S2U1dwB0O6igrF2inj/2Wkc6keOETI2DmGGL2ELUqcFWyFy9O5cMK+uFjxRZhqQhTWj3nzSNDzrS9bGminCt8/s8fF4IpElRkgqLPOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596652; c=relaxed/simple;
	bh=kYUmXfqxqZZvuj8FdGIxSnRn6xI48ouPfigccOD9jHg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IgGbQZzo8FEwyGL7t6zn1uPMY08l2bhnUKvBt/5a8ktomV4EkCD52w7h1Cb43orgNzMkTlAyzIOZP28OjPCWNSoFe2CcjFPpknvOnsYwBN0FwNVVq5IQnmfKmj2T8gpkxOOcdebf8LyDmyDHVM3RuJJssm9VyhVddeOv9oFGUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORMw/Lem; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORMw/Lem"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso19542675e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774596640; x=1775201440; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3VXDdiy9vBdjztOvHiTr0RhuJTpmTmI6WtsO3KRPJA=;
        b=ORMw/LemGNLy2VUNPJWg6H6wXdikfyxdKtt+SuQvhW42zMbE7xHLFFzsqUf0ZJ8AgR
         ALvBNvSID5c1ODyh4HTHqPeLH4Hb4ElF6XUaBnZ6EAVA/YyJG56+82fkZMgcYHI6Js4k
         ahAoGKgU30KxSXv6hgnbNB6hRWd4iZmQA+xygxbAl4gceL5guToi4qp10eWjfToFV+iw
         3xBh1uchqOdsjVIW34dVQz0jzVpujh/GDIxVNmztWytcwXR5SayctZCkGVm8KzCtOAlQ
         lm1ZzIG8v66rx8XM3sbkgE88DSPiX1l5zGK4LkwD46psX0Dwu3OiEh6ElDeaP5KRQS0B
         x0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774596640; x=1775201440;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3VXDdiy9vBdjztOvHiTr0RhuJTpmTmI6WtsO3KRPJA=;
        b=mDt9NRhiSAq2MKIGquCU/kNzJBaWIu02O1vR+5kcNoMrtGk4ReavsiyKvFvTYSLtwh
         mm+lb5ZOnCWtXvrwxRRexqYp8AZBkvOFdEc0Bl1zzKniaPVgPwx9rw3B1R3wcQisir3b
         VuN5tmJmy2m9TMcgj5GsW21KuDIEyxLkuyl5PKZjD9gp81wwLF4PQmlSuToKZs/k2wYE
         Vq9G9VJ4Qd6+YyEbpF8+1eiQo+goLp2dzAQcMRw1lefmX6LMFe2k1J1ALqfxzMyKnR+O
         K0T3Jzx761hdTEA2A5ORteCRJbdnvW7f+NoIzN9Ml4WTNKktavG8Ig7kSbAjgEVCr9jA
         VOCA==
X-Forwarded-Encrypted: i=1; AJvYcCX1SPIrMCTn/PKOAe89Lrktf3XTg4ZGJYw3+YfpU00gx6bEcZ0sr6TvXaGnDUHLO1slB9BBboxwDC4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8u+dok9uy0/41LYsaxiEym4soEinlbgoRhHGwgWf3hdC6yy/
	TQ04+AJvrqNqRs8VCLwdhKegL0vjX54OvRSLLoOLeaTb23qJBTkdUGRY
X-Gm-Gg: ATEYQzy0qnMS+xM1uTB9O/Z3QeqXQjvQIWBuxXH96ysWbxmvsC9fyIUExkgiHJyzxG7
	cadKxyrKUxVZ5z/xHh2tqs80y1yaBCpEU/JCcPAH1HJ7w/qFy4i2Ka9O1FODljVYhnedWzYDgY/
	LXpIzalyixPuCt9foTFhSeuYB/vx76F2QYk/tjxNRLk3K8OKfR/ykkk6hZlW9Gt1298I7A30I5d
	qt49S3jPZqzosKTWdDMwnO3WTeBOgXJ09/FcUOQkcm33ViGJkxE4oD0KJ6M766h+hAda/2CtJGD
	brGzx03570e6SVU6UHBV4cZqUbebwFISqnx7V4qfSRQ65y0lgJTgP9LXkdlqtPcBM090UR49Rih
	O0C7jxdo4VPTx1Cny1i6eDG4DFtKpmEL3fmLXk5OyFy/5kfZ2Nsyvh8wtCCgDMBYIw3H9693PQJ
	iB5UJd79/Q/vSmD6PXgoqXtgXszVYFPCHGkS4hIf52vhgsKOtdLCaT9bj0H2mjwujd4bmYDeVs5
	81xA90owpmZjXRMr9NF79kx1aeuC3NQ7HhyzUDk/W+tMvY2zIcFI3H93w==
X-Received: by 2002:a05:600c:a00b:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-48727d8ffc5mr22061385e9.10.1774596639495;
        Fri, 27 Mar 2026 00:30:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270ea4bdsm18156725e9.6.2026.03.27.00.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 00:30:37 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: sound: Convert pcm3060 to DT schema
To: Padmashree S S <padmashreess2006@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326183747.528754-1-padmashreess2006@gmail.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <cb31510b-6aed-99f6-590d-798256f10044@gmail.com>
Date: Fri, 27 Mar 2026 08:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260326183747.528754-1-padmashreess2006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Good day Padmashree,


i received your patch, and support your interest to keep the driver 
documentation

up-to-date! I would kindly ask you to give me some time to get

up to speed with the context of the documentation change.

You may expect to hear back from me next week.

At the same time, i don't want to block any progress.

If you receive enough approvals from the other members of the community,

please feel free to proceed without my feedback.


Best regards,

Kirill Marinushkin

On 3/26/26 7:37 PM, Padmashree S S wrote:
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
>
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>   .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
>   2 files changed, 45 insertions(+), 23 deletions(-)
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
> index 000000000000..ceb6f044b196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCM3060 audio CODEC
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
> +    description: |
> +      The I2C address of the device
> +      or SPI chip select number.
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
