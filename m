Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C669285041
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934545; cv=none; b=EKJFyDeTVQXtL4nMw4tRq46OcXB8QZdD+SuLJ0N/IrOTXZAj3MahgA73Z0brRAlqzL0TohpVsuYzkD3dc/bEDE0CO/wCo41ogSPHjjArvN2hPIT3K0k3eJx/epKiADz7meI5NmaYBcO4FEmkNEoaIVV75OE67uVxEz9OWX9kMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934545; c=relaxed/simple;
	bh=GaqiYCRODZ244NhliFDDI5/uKWNx6Zw+ryBpn5Lzn88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0kTBoU28X2Bsb/27pAqH4TguN/orHznZto7Np+v7Oy3FI2yXQzcaSq0fNyP4NwIA/s/sQ4S/Cl0UXpqeFOaEC5U0ED+JksC/1CGdGDfhNS6tn6QEA7U1vha/Y2o/rTkgbWQY1OtOwqEkxc2snPaJpMo8jV+V0jS18TyLEdnmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=FG7eOP6Y; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="FG7eOP6Y"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-68beff25252so720545eaf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775934541; x=1776539341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUa98CfZyPwdTLM0QyGm53BD0k9kVlpXi2OBQuDga70=;
        b=FG7eOP6YtzJWyu4I/c2M26nGEcJSjN8OtIInpCvWMYlXumiXBiR9S8OOM5KUhPbBUB
         KqVQqIl2CIehH7cHHxQNy1XTi2FYdHHZVO8koAzHjY/tlpfcriqpvYg//yv5tjU3NmGv
         z5UJ3Gx5Q/EQXoHvNzIuqKoTQ8c1uzbKD3lQ5rX2NjdHn4jNxUD9PhenwPetA/XepOg3
         4OO26b3CLiXMSG6xoHZX5LURY+aqywpceoSLfQ2n8Gc/qAvl+q+49+opwO0X5rPgrtXp
         fjOMHnD4q8vOmuSkJQsWdfo74qM05Gw4AvILD8Hej1x0Pnlenuq04IrddmC5PG4wUicw
         Lzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934541; x=1776539341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUa98CfZyPwdTLM0QyGm53BD0k9kVlpXi2OBQuDga70=;
        b=ADIJ/SG4uIh4tUlM9n2anj7lrk5oZKj3Gn+gikeTm7FbzBwuuIRfLg6aXTI/RMCpXF
         iPUSqQ32oSZWj6gRoIz2yAvdKtQndzeqIVuieSNh3Xy5byKxb/2125ny6VEj3s8jDYJQ
         uQ3TTs4CLhI8SbK+DQfAmNRiOYtS577U5DPZhEXV+CaKOXs2IWDYYeYCkDh53IjKWqZ7
         BUI+2ZId1K36qj04as1naHhOceVieeryZYsFYzrwe2EPo66SJjylAzRNGOLVVuRvnmWu
         FUyx84OgSbTl5FUUgzUu+zwoKRte0x30gJwsbn7kjr9VgTPQHjR1SVagLVt15Wowe18U
         5ySA==
X-Forwarded-Encrypted: i=1; AJvYcCVs9r/C3dlbCI4cZ0aaLxGJdvspT0iAsIMTgLJlYARh1u68qyc9tPGwwqFo+1nU63s079x+NNJJ27Z/@vger.kernel.org
X-Gm-Message-State: AOJu0YwMHnK6FqTcSAX5ye+ncFrnT0E4az+XscL9iPbVdeFrkPQTMswD
	qfrxt6GKbcCiZD1Q6IDEkDFLCng7TEQo+xqB9w1gjvgzIgQsQS6Lk9zw1q72c+/iwIs=
X-Gm-Gg: AeBDieuFXuy1UEKYInjXhEqidyeBJ2oj9R0sofd2lldkTVeULhp8ONaxYhB3FuGeTsM
	HS7VKTxmCzTLlEULiFxXIFmWcxqmrXPNDdqf+nJl7NFro2P8QmP3q06rO8G2LQG+vL0z3XsTQKI
	AVCeh6nNnBDmuCGaEJUijyNyR3tRkMYZY06+OQy2+eUbK8dAq0rTTyx9bMrEvgXY9qPc7MpBElw
	uILgy1AI347JYPBx+xWe+Sf50ajgQik/oxyANQeT8IFaeI384apN0PnwRDvkFX8v+nqBzYuVWZq
	AIEUi8halcMrtrQT8siSciIj+EYkzrfPBktyeio7yuev/laaVvzRb7FSqb0V3H/9xCcf0f4u5B8
	F2Rh2658qwYhLabDJYO/iZ66VHHHEZmPwAcx8SqKnpo+TuRFMfAD5t/T5LkAFtu0/5uL6Y4FUO0
	UWWWF6lTjfirTyC2ilqaD2V9Pwy/BgXYTVcp0TkcQ+AhHC9QNQ1OOWBksaAM7GyCUT+N6zf6Ggv
	w==
X-Received: by 2002:a05:6820:f001:b0:68d:dfd2:8db3 with SMTP id 006d021491bc7-68ddfd2906emr990879eaf.8.1775934541346;
        Sat, 11 Apr 2026 12:09:01 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d2e5:c81c:5b23:fe55? ([2600:8803:e7e4:500:d2e5:c81c:5b23:fe55])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bcb67e49bsm3509908eaf.14.2026.04.11.12.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 12:09:00 -0700 (PDT)
Message-ID: <cf4ac074-9098-45f5-9cd6-0eeea0b41179@baylibre.com>
Date: Sat, 11 Apr 2026 14:08:59 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: iio: adc: ad4130: Add new supported
 parts
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1774996100.git.Jonathan.Santos@analog.com>
 <7bf387e8ad20e2f2bb14534fb03608bbadfa47d2.1774996100.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7bf387e8ad20e2f2bb14534fb03608bbadfa47d2.1774996100.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/26 6:58 AM, Jonathan Santos wrote:
> Extend driver support for AD4129-4/8, AD4130-4, and AD4131-4/8 ADC
> variants.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
> Changes in v3:
> * None.
> 
> Changes in v2:
> * None.
> ---
>  .../devicetree/bindings/iio/adc/adi,ad4130.yaml   | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml
> index fcc00e5cfd54..f4cad68fa04d 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml
> @@ -5,19 +5,30 @@
>  $id: http://devicetree.org/schemas/iio/adc/adi,ad4130.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Analog Devices AD4130 ADC device driver
> +title: Analog Devices AD4130 family ADC device driver

I'm surprised that on one said anything about the word "driver"
in a devicetree binding. :-)

