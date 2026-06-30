Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC61331EC4
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833063; cv=none; b=vFOrarxyDYsRTabi6jji199Jy6pjMjcWbsr3X3u8fDd+Wvvp2rPzHHwmSloJRjCob/fIMn/ThUbXwtjBHAU+mv4fofYQQ8o5XSN7Ml6HQ/piwzVZ5JLVfpJZtyv3oBiMPeUsTbGZaev5IveSE3pMlJrQ378O9LPhwEmsfilqn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833063; c=relaxed/simple;
	bh=ilwmPRsLFmPgkqbep4PVet62o0txIgMEH0pTIIfUWFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II+1pMZdY7z3wdienO/6eNLPM+NBhZgwq6DsOatJrU71i0ILTbyZufLkZszWrtz1qNkmoZQpTtTtTeutPUn5naxmo3G61xGApj/kyrmge82xR3ppCsTGUJ90+T3RnQdPDk+ZHpXE4jfjRTGvg0Nh+ukyPrSST4+p8sFLMCYY1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ld4sIBts; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ld4sIBts"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1192920a34.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782833060; x=1783437860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xv8vYlFh+PBuicn2boO4XNNshtTQUIiWhs4Wjc5dQk8=;
        b=ld4sIBtsp58JIYgeGDjBTnOaDFLR1gNjsWaii2wL3eh7x15PsNcHCO4zvaLE6euAWk
         rpZkOMGHdr5XXZmckcJkx5wUL6QRLJbG59OFA5dLwhEIqRcIE2GdK4frv4gVrTUb7GaR
         VI2Lk62jmzmkpXwJ1SaSCIn+XvZVhdyJPCCQq/DgyWRBFw2FwSKpaOz1VExXtJynWxi8
         xlcCXMKRqQ0ixUCHUXoMwKhUyCkfp/NZKQAN+ypyQgzsebril3+5y4zDXb2VEvbIBvD8
         1WzKn/+USYj2p57npPdCvmBTVb4geoSTdq7m8cHPiwoYfUEwudd/FqQJvNI0qeVar+eJ
         2MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833060; x=1783437860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv8vYlFh+PBuicn2boO4XNNshtTQUIiWhs4Wjc5dQk8=;
        b=UiO/mlt5BHU00IRAIEY3kCiIaUE1575fm0mAV/sY2lu4R8XgXuD+sKVHI0Pv7fMrwt
         X5zWnJNJU/DCFoBuMUnyFcAXxWCt6/8SO4P3kAnqcaeFBrLIoEhjOtTAnUaL2eyOTymU
         QW0HcgYGtwZrBnavWu1RBtfA4NyQfUdX3u33UvL3TZpqAy+Hq8/Qr8RjM5qmIbuFp26D
         525gxdd8h3RvcrQ5fiXB/nSK5Q3NFzBFJfb1awsISj8ADGrzBikwKb5pxHO/CPfkZBZV
         7xIEuZ0Xlb4DWgRHeCyiTCWAvp/sx5ETDTkWEEa/WpLY6SmFT8fDAiH5Rf0fjLZUzzmV
         7qSw==
X-Forwarded-Encrypted: i=1; AFNElJ944Elj2s6lBRp4OCFMByOHXgGeAp+PiU6W1ZcSC71S7ShWx+NoWquifeBnIjqWj4oXhhklUW1Ye8ha@vger.kernel.org
X-Gm-Message-State: AOJu0YzkSE3GCe8Ey064Eq/ssD/hhco/Qvdl70vhUmCUHaSjt87SWN1C
	5Mu2PYH5vZKdCAMzWdd9WlDx7f4NpzL7S5fAA2ndoMwedcmY9mi/ASwYHv5fH1C8xZE=
X-Gm-Gg: AfdE7ckfb5ZBgvlKXmlfPVPdXptB7oDowF6XcMMJiehvxmgUriiel5nVUruF8dkMScp
	DNKH5+6t6TC5H93PAwktW4ut9EZJYoYTb/KtURj8nuJZjLEHbv1rF9aKwTc4/vhMGF1eP6sNO1d
	EO0iEjF4UDXsfaz8xalqE82r4Zh4iXgBESGz3F/pIYBqUXDCZh5AOIWDcqdQ58ZEkwoxyvlelY6
	5qfzdv8VXie2MxuYnIcIM7fRBpMbXEiCwm0fn67CEn9R0V4fjMygTmH6CbVcC/bNWbevg5mgEAX
	+KgzH2mS5d/2hg/Kq4OATSC4pvqIFEnWdrqVpnzZFXsEtc5lRUHqZeQw1woQSmEkfiuQ118QzkM
	EeqZ0nT+blrqh+Ll0Z5PR5ZfvX04T13YgEK+93eCTbEeAltZ9FfH5+bnd6byggUXHgtva2T80HO
	g2V9e2z5oq6S2dQiY96Z2DXpxzhPz/+/fSYn70Vwzqhj5bWVP/31z2Bh1k7X91zUc=
X-Received: by 2002:a05:6830:488a:b0:7e6:f482:df36 with SMTP id 46e09a7af769-7e9fbfb81bbmr567069a34.15.1782833060338;
        Tue, 30 Jun 2026 08:24:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e190:78b2:dd4e:ba94? ([2600:8803:e7e4:500:e190:78b2:dd4e:ba94])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm2689450a34.16.2026.06.30.08.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:24:19 -0700 (PDT)
Message-ID: <a64fd56f-6e4b-4e19-9804-ce7a96f14973@baylibre.com>
Date: Tue, 30 Jun 2026 10:24:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: ti,ads1298: add ADS1299 EEG
 ADC variants
To: Md Shofiqul Islam <shofiqtest@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mike.looijmans@topic.nl,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630140311.1473031-1-shofiqtest@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260630140311.1473031-1-shofiqtest@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 9:03 AM, Md Shofiqul Islam wrote:
> The ADS1299, ADS1299-4, and ADS1299-6 share the same SPI interface
> and register map as the ADS1298 ECG ADC family but are designed for
> EEG and biopotential measurement.  Key differences from ADS1298:
> - PGA gain up to 24x (vs 12x for ADS1298)
> - Internal reference is always 2.4V (no 4V option)
> 
> Add compatible strings and update the vref-supply description to
> document the ADS1299 reference voltage behaviour.
> 
> Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
> ---
>  .../bindings/iio/adc/ti,ads1298.yaml          | 31 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> index 71f9f9b745cb..82c5181126df 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> @@ -4,11 +4,16 @@
>  $id: http://devicetree.org/schemas/iio/adc/ti,ads1298.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Texas Instruments' ads1298 medical ADC chips
> +title: Texas Instruments ADS1298/ADS1299 biopotential ADC chips
>  
>  description: |
> -  Datasheet at: https://www.ti.com/product/ADS1298
> -  Bindings for this chip aren't complete.
> +  ADS1298/ADS1298R: 8-channel, 24-bit ECG ADC.
> +  Datasheet: https://www.ti.com/product/ADS1298
> +
> +  ADS1299/ADS1299-4/ADS1299-6: 8/4/6-channel, 24-bit EEG/biopotential ADC.
> +  Identical SPI interface and register map to the ADS1298 family, but with
> +  a higher maximum PGA gain (24x vs 12x) and fixed 2.4V internal reference.
> +  Datasheet: https://www.ti.com/product/ADS1299
>  
>  maintainers:
>    - Mike Looijmans <mike.looijmans@topic.nl>
> @@ -17,6 +22,9 @@ properties:
>    compatible:
>      enum:
>        - ti,ads1298
> +      - ti,ads1299
> +      - ti,ads1299-4
> +      - ti,ads1299-6
>  
>    reg:
>      maxItems: 1
> @@ -33,8 +41,10 @@ properties:
>  
>    vref-supply:
>      description:
> -      Optional reference voltage. If omitted, internal reference is used,
> -      which is 2.4V when analog supply is below 4.4V, 4V otherwise.
> +      Optional reference voltage. If omitted, internal reference is used.
> +      For ADS1298, the internal reference is 2.4V when analog supply is
> +      below 4.4V, 4V otherwise. For ADS1299, the internal reference is
> +      always 2.4V.

Not sure the dt-bindings care about the internal reference. It should
just be a driver implementation detail.

So I would just trim this down to:

	Optional reference voltage. If omitted, internal reference is used.

>  
>    clocks:
>      description: Optional 2.048 MHz external source clock on CLK pin
> @@ -75,5 +85,16 @@ examples:
>            spi-max-frequency = <20000000>;
>            spi-cpha;
>          };
> +
> +        adc@2 {
> +          reg = <2>;
> +          compatible = "ti,ads1299";
> +          label = "ads1299-1-eeg";
> +          avdd-supply = <&reg_iso_5v_a>;
> +          interrupt-parent = <&gpio0>;
> +          interrupts = <79 IRQ_TYPE_EDGE_FALLING>;
> +          spi-max-frequency = <20000000>;
> +          spi-cpha;
> +        };

Since the chips are nearly identical, not sure a 2nd example is
particularly useful.

>      };
>  ...

