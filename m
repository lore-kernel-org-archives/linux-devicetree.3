Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117C313E0D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578634; cv=none; b=mws34jpV1AFhOpnEv3Vgk3zdOk9qmeNEiQMBdZUduJPmgzRG6TYqU9FEjqip8jURu5bcRtB1wJMUxu0Q7UmKxGclLnnQ4MWQ5PvWwga7/MQJkV550IqYGltJrJK9Uxdj1z6Nr91nKZX+L76oWfJSjZ6guqMep337nXYRVq4df3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578634; c=relaxed/simple;
	bh=i8Tw9+Y0LbLQQkfb0VjBjO33Jh4ZfQKD94u7NvLdVx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oevcj/T2+GCqSxKeGnctH99Gpjqh6isDeqKSg5te69V4qd4QWVVHnlSDRx/UmCBc6+Y3qV3DZLu4OUvoEubMSRnr4WE+U/jur3CUixkoZXtUj2j4gUYrHMg5R6zaf2PB3LnguNZXqurMUQJ6DeQWNwFpJOb3OEQYxI7/rabfJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I/zvzBTb; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I/zvzBTb"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35601so712952b3a.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789578627; x=1790183427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=I/zvzBTb7sbhurrPW5561okUsTghPC9kVPuSE7tPT0eu/vA7FoUUPFVFb3NSHth3vp
         Vqlu7DBQxnLIsmiq/Tm5NeVoIF138k+sKKhUgZp1AZvX4+CfV29HcUPleGItk0+dCW9k
         pTp5Fgik1hPe/CvV50nLG+ll/TqX7Z4OKEqX1IfXHsinfbRQHsHSYdBplHTSjqAo6xQy
         fcpayIXMEVymGFpSKYmLNDygvJZA65k83+SsrDSmeJGGOMt+XuXpD7EG39ucajZUE0lg
         BY2MoICXzutJrTsYbvQAfXTpH7zOtJstOarPH/m3f7BYB/Pqcr86m9ssIrqAwBjjDFos
         EMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578627; x=1790183427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=go7jZCcmcoMzzsEbbA7d+zjsN5ysHPnZs9gVcICZNrwR3tGcoYF24AEC2NdGjPmVSa
         EFIgeacv7ZcbB+9fZx10ni661ujSaYUIT4jCulvGQgAVvVw46Xqmoja4u9pcwDKcZRQw
         5HcVXlMMkU1qA6Q5ST2MVlN1eohYzdn1jXTBpbHKhur3e1+U7dBEaEiCG1qLTeJ7FLZt
         9yy8c+SFWvv2cDWgDcHzZkNtyaGTY5FkV71rCEoAzx7vQH5HhBomdYXWIUPDI3M9qzyV
         TeOkuXfTfRJNvL/6+QprG2+8tjQQl6LmChCWt2WdKPVtux+ppb6ZVgVjJIzgPbEMRPXq
         RMOw==
X-Gm-Message-State: AFuF++kPjP48MGJnEa/NSnlZ0ahsl/+s1VioeEuHFoLYVZQJcV7fX6wH
	t6f7xOmpqHSLuTrTqBhlpnWZ3oMlrW+hBZw/luCtskE5UcHpbTex5Dmn7/5nsYd6tKU=
X-Gm-Gg: AYBFou3BI/fQ5LbCV2d6rqjhQYLZjHhFzi08MxthmBPWEpFXGaOnzvgDBFMCDC7uKaW
	dIoRRET8mzChCeLpGroH5xq4pTYtC/qUM2vgIdU6Iayy+gJMl2PratsghMc+daey3gq8zSV/I9q
	IzQ9clsP2GhR6qRXaMwl8kaVxCu21hCR8I37wuJA/GfnZnhQoJCnWzgtfWWMc65+80ul9CFBY3m
	fLqNUqZvX5l0osYv1GYWEchDc0nnhEEMcA4mMyEO1OQJAT6mMO9tKxlFb3REz9K9s951gMSfvyJ
	WNS8rjUzL5pqpWBRp42Qx0jHgmtbptGOamrC2+hxhcgcW8ZoRc1pwqYTulCiQZ7iqtsGcXHRPxc
	3vMbl1X0A4uHYXO3g+e93A71oPSc2KtQOdIzAxt/ozdWxBRhMMq9WZtmNU5p0w7Im8KDPNwv7Bo
	lmaKbyv9tYEOgKZwOEayvzaS1RR/nX5xCvj6KwNO69UA4F/M593/wE/y80s52xR8Lf2nnB9oTm5
	33XVBI9walQ+j1+Y9wy
X-Received: by 2002:a05:6a00:181b:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-872391ab57emr6854570b3a.19.1789578626409;
        Wed, 16 Sep 2026 10:10:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm1607393b3a.51.2026.09.16.10.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:10:25 -0700 (PDT)
Message-ID: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Date: Wed, 16 Sep 2026 12:10:23 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

If the FSBL wants to reserve some RAM, it should modify the devicetree at
runtime to add that reservation. Adding the reservation here creates an
unnecessary ABI surface between the FSBL and all consumers of the devicetree.

Regards,
Samuel

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> index 78a257839f6f..693c9fd7b771 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -22,6 +22,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@9fe00000 {
> +			reg = <0x9fe00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> 
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> 
> Best regards,
> --  
> Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

