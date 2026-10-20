Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458091;
	b=ZyttI+vUl6bXj1jx2rTiY/d3/XrFmUpcERv7CrZEMBYlcgr95PQM6pp2vb0USnkT6L5t
	 PZYMQH1qWtELtgSrVrjG81eYLJmBB5DdecRY8J5Q3PaZpoPxdJ389KC+nITzET3kk6Vjt
	 zGbPz/0jXB2rb0vz82cLZKQbg2YHnxdMmSZuDc3a54iGtp9WZow4GlkH2DOeLV2KZdywG
	 +MRzoK9LOWv5UyvtWiueBWo5/9qKBiTDixO7voqVRgxIEJlQAaR7gDMQhL0UG8phdpP7C
	 7GzpgKx10J7fC5BwLWqNQ0C/McaEQHRR/kSIDhhzrinLu/eLEhDqpqZot/ltXEmtFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KbUzaN7i+ABYfLCgoI6H+WcWKnnggG4SJix4W7UMo8k=;
	b=ZN+55k+JBi6ltfFzDFWIMR2MEY3PJ5yd8FWd+CJqGinRVZCnO0eIO5/mS5Rqc8x/RYHj
	 hq1SKx1ODARIe2gjkPmHOI1iXDRa96CvpCR511aiIhgoEydoN/tq8TedykHE6I3/0cWIP
	 gkF+Nxr+ZeP7ILaucoX5kygsN7pgqFBmRLZ+wf3HpPZl61JrzU8G7XRuNuq3tQiwEc2iO
	 jemS+xhh2YLhmW0vwQsYzkSu4g46/Oh4OyFcZFkDxhWNepoPBzYffWNEcCBmEhuKhdFfl
	 KKt6277p+fVBIGLunP8mL3DTUkpkrpqWUWnH3nW7VKMW6pkqqgITa9dkiaoFZAwhXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSyJsIfO;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C85606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C85606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSyJsIfO
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1796049a12.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458086; x=1793062886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbUzaN7i+ABYfLCgoI6H+WcWKnnggG4SJix4W7UMo8k=;
        b=VSyJsIfO3pSe89RNvWwrrSLCK55i9HH4oDZjx3AxOmDCaDTLG+rG1NRWR9puCZMJXV
         iYtQYaGBBn6989y1bpMea2WVDt0NZT7UjaUDJ8zzVgV1T0o4zUIKICT8mEDjy7hijd1E
         N9uwq5J1EBRiwG5JxDkp37+R1/YH7enqPykYWVsawdhpufu2ptHIW1RoIsdvLjtcKjbe
         6JGQzAfRiBOCXp3FUKgR8Edb0iMDlMG2e9f8HdlSSR/Oc9nfNlD+HHgESdz/5iEtuQaG
         T56HosWDv0o+4dv1H//tKMjBS/CK1QOFEgad1xbX9umnz81JKeuQ9d67BJll5TAz7z8s
         Qy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458086; x=1793062886;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KbUzaN7i+ABYfLCgoI6H+WcWKnnggG4SJix4W7UMo8k=;
        b=p2GIT2uTGlvp2a4eDWoDJ6H74CbLkAFsJJ0GmW/ngp/nx/wIaXE7zrX7i7D7D0wvCe
         sI+/QMV9mx84a7r2tyWdGFzVxHZt/61MEq5yiBRP6ekfguU/sFHrMJrWQVeOQQS9oqgQ
         ZoiqD/2GCkXyCk2YnJD0S2GP84Qyh3V8dVCHIRq7WKhh4T6hYlwVRPxqvXXt/6mB1ji4
         4ksLMht5slDOsFyS9popPwt1evN01mzhopLBUnkhLjd2IzQHF2ndxBlKgk0J7yLhNp9/
         uQUWflXQ4nkX34B36kFMh5CvC/Tkx7al+nO8wl5NM1KrfrnoCr74/9n/r94GHCrqOm28
         l19Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+ADBD7kYxFwqxl2f118wCYuf5+Iuj1OyTP3jH8h/zbWjtqZQAZ3OLS4Rb4nMoJeGJYjgVHQ/JekIu@vger.kernel.org
X-Gm-Message-State: AFq9FYJwn094YIC29d0gFqgsSdmz9S/Q4WRwPT7Rfl5cD8brT2Yv4EkK
	RgsmAUbzuuQ9nycCGHeZdYY6jm6ossG1+X0HGba8KAZ8DE+nqPThWs8J
X-Gm-Gg: AYBFou242uP6gAFfABRMF4l5pmmdCZgUTIf0hxk0uTUiC79nxv3TmG7FLeb7mu3w77E
	zAHtNHG2Y+WyNHDOPflpU2FeEB79RPTC8F6FI4D3Jp8JvwIp+W8rhMU1p28SIRCmuFZ9tfzmfps
	nUDbSCkhh2CR72N9LrB95PHNFBhDz7KB7BhsBUhd6ack2VDfaUrnnf+udVwkDX/WjI1UICRJmhr
	FrvloTjLQWP2HcQSM3HZKreMx8DcVqUPTKzB3e4tYzJV9SUj2OyEWVUY8oVKJPeXe00ihLcjSHM
	G+RFHWFgJJtIueR/v3jGlxyPLV2A/AYA1ojBDWMHiKJWTefPrSVf9aalCNK8uu7+L0vl95iwjhq
	HjXQOX9alw+Npk3nkjDiUIDxXljppLubgrHiBfiVQNqMiMkGNU+XAajEVr4Q6mQE4i9B7fwEAo+
	U/xxquyHLKM20WeemCwnWtIJXBAbTiIScNBvaERK1v/RNIMkSXC13+mGJU43XJvTKRkObMJ+Bwm
	Pb0qkZt6KmH9maDpJUwGR1tX69oIYhZeD9OaumIMHWOVcAIuiUdPlxTybo=
X-Received: by 2002:a05:6300:6ccf:20b0:3e2:325f:577b with SMTP id adf61e73a8af0-3e2325f58e4mr4058830637.60.1792458085904;
        Mon, 19 Oct 2026 18:01:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497f630sm4368568a12.8.2026.10.19.18.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:01:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fdbb1c1-5572-42ab-9579-58e90111564d@roeck-us.net>
Date: Mon, 19 Oct 2026 18:01:23 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum
 heartbeat intervals
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-3-f.fainelli@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261016221617.2223004-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 15:16, Florian Fainelli wrote:
> Some GPIO-controlled watchdogs require a minimum interval between input
> transitions. Add an optional hw-min-interval-ms property to describe this
> constraint, allowing the watchdog core to defer early keepalives.
> 
> Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
> no hardware register imposing this limit, and its heartbeat interval is
> stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
> hardware timeout and requires at least 1.6 seconds between transitions.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../devicetree/bindings/watchdog/linux,wdt-gpio.yaml  | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> index 499f1b7e03f9..1adbfe5e5461 100644
> --- a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> @@ -36,7 +36,12 @@ properties:
>       description: Maximum time to reset watchdog circuit (milliseconds).
>       $ref: /schemas/types.yaml#/definitions/uint32
>       minimum: 2
> -    maximum: 65535
> +
> +  hw-min-interval-ms:
> +    description:
> +      Minimum time between watchdog resets in milliseconds. If omitted, the
> +      watchdog can be reset at any time. Must be less than hw_margin_ms.
> +    minimum: 1
>   
>     always-running:
>       type: boolean
> @@ -64,5 +69,7 @@ examples:
>           compatible = "linux,wdt-gpio";
>           gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
>           hw_algo = "toggle";
> -        hw_margin_ms = <1600>;
> +        hw_margin_ms = <100000>;
> +        hw-min-interval-ms = <1600>;
> +        always-running;
>       };

