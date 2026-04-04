Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643FE345CDD
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775310208; cv=none; b=Sb6eL+vDDO5+/JrBqH8Ko5vQuoWZScR4reKgq+4tmpMoCROl9aAacLVBsNewXwJ6SDdg5BKHuVzL7062e3e2cpUNpub+7V8eu00Xth/0gMKdl3UV5aZg1/IRVXW+kXhsGfx88kHb5hJ2MOKf/bEcLRAO5CpS7pjieNAzP1cZdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775310208; c=relaxed/simple;
	bh=SdGycWIOB3BG5dloq4/UyFlmu8kZqSDXiej0RBe+/0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+Vj1VFR/hS8nlClZHM5JRMkhIvHblmeanbrzB+0liUl/l0GV+aCFm2EPLQ6gzqaUUjs0WSxzZMn1zCxkWt6SvafmHJukIeFogDIdki5bata/1xe18kB7S0s0G0hsZtv/xtPNKc1PIo8qcGDPup9e+E9kkdKFGe639DMcneQAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=B9LA0cOY; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="B9LA0cOY"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-46fc5b8a06bso771978b6e.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775310205; x=1775915005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMIoVmSCmnePN2nBeuOGxTIYxwpaueT16pR92e6ZJEg=;
        b=B9LA0cOYXqxY996In7WHWvbr6Wb9eyBWeumqyVq0DWXJAbWQys2+D8Fi7sF0H7ZXMo
         1TcHNgNyiEokugMKENXs34qJ5v4K4XvmBlkLuXfUIZ1Et53X1WKAMJpSpnMC/qKUGC4S
         kiXSKm0EGX++BKJTLSsBA2oeKtXMZh60CkzMpfKPRFhxkBUlGTqvHlBiWU7irElOCQ2l
         MVUOxhYB3Ihe9iO1EVy5cB91Lnxu0ruHUG0HfGj5azykto0/i0Opd2XyrjKsqdCasvuN
         4TP5tu9SbgiG5ouWlB/lMlbeciSOt321cwnDkstITRfRDGQrvJrPY4rYwkcnY6yO57m/
         qdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775310205; x=1775915005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMIoVmSCmnePN2nBeuOGxTIYxwpaueT16pR92e6ZJEg=;
        b=YCKOMkx44o0KOxaZvuL2YGbYQAXVB4obtfiCOjNAJFOQllueGA6uUy+drjwn8JyQDg
         3UDoxyw1KpQIgPD5bIgF3RFcWeJE5TfG8k84yollr05hnfweDx/a7WpRhj9DZjeprOEr
         A+pQW+won/zOhdTiC7RGwd64UsvbPUlbZko2hcQBxutQ76uJcxKOY72Tjuf6xSaJ5rJM
         jIrVJcJPzj0bXHLWligb8R/olrhJIT5h0e9u38Qzqn1BpqU8FA29F1Cx0JLTnwOmcjLK
         1Z7YfxqPL+7WOsBJDv4KzrfHmBH9S6Cg5hHvxOWONHyprJaueRH0CLSDZIV6E7fruO2U
         casQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZU9fxZJ32YV/PsOFEjyGR+Q1RPDA3PbuWPaMA+qH5iSq7mEsHztcFAvCCj8jQ+IYLcy2xGt8WJ7u3@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRC4/uSFCvKhBfJqruCMEbetmrEwwSlEXIbFJAA8mtBwmOsgP
	OhB3B1kDFjTC0cQBYPjqmXLc/QKRyM9KVpiIkkA+YeBXCSHAiDF+xofGwdOwTOWfsRo=
X-Gm-Gg: AeBDiev3QA1f+NGgJR/wBBgPsa+5WW9O/sfYdalUz/RwCzJNVCKvtG9/HC5fKyv7ORW
	SCKmKDs1cBqrEDpjt8At66nekCNAjxKmg34rEIJjj/QiYDsw4qM5/inE1avwmdfYKpGLLwUpLJA
	njVWZJeWgIWkTIg/PuBuQ0rrJEZ5ps/R59QL/Y2dVF3vrlojR6Vi9Erz2+ugPGaIPyQ/vFf/thy
	QHs/2a+MDOcS/2GAsGNxdYp87PN+A7zm7nJcuQHkyct7a/gV28FyPtsz3f5GkG+mrT3dfr4gLLT
	WuxS4LUdu5PIfbkTrIqb80U9mlPWB71aU9mtQ9Pcim0u+mQ/bZ2SZncBsy3gko1l90/1e/d7PvU
	e3QFcYjgM3M6iuYPNkilX0BwWsxtJEnq6Av8YOGwkKA52PwOFrDJ6myOaiBKBVWwg5R58TbqmsA
	eh7+ri/RX4BPUUHqM3TcJKpMZfWDOEVIEpgRVqX7VEOYWsATTxPgZlDVL80ubw5TZ8qRNs8pYfm
	Q==
X-Received: by 2002:a05:6808:1a21:b0:467:8b7:4a46 with SMTP id 5614622812f47-46f01343bc3mr3240466b6e.9.1775310205076;
        Sat, 04 Apr 2026 06:43:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e14e:bcc6:3f95:26eb? ([2600:8803:e7e4:500:e14e:bcc6:3f95:26eb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46ff2f94b71sm1991698b6e.5.2026.04.04.06.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 06:43:24 -0700 (PDT)
Message-ID: <dd0dbadb-604b-4f12-8674-268b7db096fd@baylibre.com>
Date: Sat, 4 Apr 2026 08:43:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for Microchip
 MCP48FEB02 to MCP47FEB02
To: Ariana Lazar <ariana.lazar@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-mcp47feb02-fix2-v1-0-da60c773550e@microchip.com>
 <20260403-mcp47feb02-fix2-v1-1-da60c773550e@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260403-mcp47feb02-fix2-v1-1-da60c773550e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 5:50 AM, Ariana Lazar wrote:
> This is the device tree schema for iio driver for Microchip
> MCP48FxBy1/2/4/8 series of buffered voltage output Digital-to-Analog
> Converters with nonvolatile or volatile memory on top of MCP47FEB02.
> The families support up to 8 output channels and have 8-bit, 10-bit or
> 12-bit resolution.
> 

...

>  examples:
>    - |
> @@ -280,7 +398,7 @@ examples:
>  
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        dac@0 {
> +        dac@60 {
>            compatible = "microchip,mcp47feb02";
>            reg = <0>;

Need to change reg to 0x60 also.

>            vdd-supply = <&vdac_vdd>;
> @@ -299,4 +417,29 @@ examples:
>            };
>        };
>      };
