Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59D5378D9E
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798476; cv=none; b=VLGaCkdarn6xqVMJNQ/aodf+dn5v65dnS2rkoccyuYzj0YwUfCIVzbWQ1pKfuw+XZfubSMRQCeT4wWy1OlsoQxVUKl+i1CZriQ+MPq2/1fYUrUKvAr/CB6tuutrGQ3/E1F6F6hcpB9a1SY+JkgTzSItHqloucn/wELQwDQRGyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798476; c=relaxed/simple;
	bh=3wtd1IIeCkBJ/XmcMqk04Aty7K0zW5MZcZUzKuiYVt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Goci8D8GBOiTaqFv1uDIdIoXtjbzxl9Ep+Ah9pdhTrJTHSir+kf+Tlu8UubXLuiUY00aqhfKMx6n8OrveBI2dTQCa7MbKfPfQhp6b74ACG1S6wZHhr4Ot2NGg9WtvKGKUaX1t+YrXK+CgyeUCyParl5b0sS0+e3IrOW+did4TFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgNdxzI3; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgNdxzI3"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c17d152c01so2549334eec.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774798474; x=1775403274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4jQhTO1UJPiph8NqA2wQY7EhFFaT1IhjZIj6QBNFBo=;
        b=HgNdxzI3ZeFA0kKwIJoKaLxq9D671m7oQ81dH6FqWbBSBSa5BCHoN7iFOqNOsQDqVM
         KZSXZIm3bPn0SPowY2T3M2BlDUe6xvW4DHNFaXSuFuQwA2ztIeNbIOq+05Ng/F/+ST7p
         n0PeK93Stdc3R4qneg2MML7D/p1zoFlI8BF4R1pEfYm2wdkDVBGTyb0ciFVGgOdjcM3f
         5T65ky4d6I2ZYHMpt3kPskG48Ez4fFMHDPyIw0p5WJAfhYUs0AkYvruGQD1ReBlYgCGs
         PaoQJtOfX2IKghZvN4NHcOl1zjzP5eM+XW1EhYjtwUjipZiN0044A0TPjVLSIlHU1TDn
         EGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774798474; x=1775403274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4jQhTO1UJPiph8NqA2wQY7EhFFaT1IhjZIj6QBNFBo=;
        b=m9Z5FVelY+xV3dnb7Y1MZTueukNi2HkWD9DOO9XGdmejlqDeLyfti9w9DVmh7IJ8M1
         +sWDU5IbUHwwFKOBQgVq5VeJN0As7RCkd9kFaWs74kiB4qhdNZbvtft91nDpaw8egqsi
         5cp8xE1S1aNAAxMOjjM1LyXXxPlowu9V+eStTebb9LHL6SvyQEwZnaEl0WPiy2F17RZA
         j482g1swO3HsJm+gNahD124bVTaDacgeZrDthAmO2ByuIbYxzapecCLhlbq0VgJuyc8D
         Wsy03BJdpAkgZwQW9hx11egwO2RZH74dpjtEIYAaF5c6URvx5fz4f/nnOq0+ND5hmaob
         n6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKfKdWnu05ZWkaFLwnByHHoSGHLlcM9hhaV4ce+4YBfBReYNwvNaEXr9msMzzGe5Z8HPKrcVRpA2LQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ5bFaoA4W7cxfW7dJBzAPFLdwuFi62v5r6ZryLMdS/o78rhvo
	BaRe+DgG3TEOMQR8Sa+0jflaAIsmuXs0CmshONGbv6qJl7w1zDTFZeSL
X-Gm-Gg: ATEYQzyAXnTKkq3MvRX/AAc/luvuRHBwmAGTpOEhNj25TyLSvFta5D29RYU/QUYr6H9
	3dyXFEloWDdlTjRXjMC7BjH8thsRdc/eVFi8jkgOEThhPo43G2nb+RL7HYNKW1iku24J0tUEAow
	BQ/7boBWB+ohNy5IayDBA9we/txVcNNDXVhO3bHRRst+93XlN9Vg2G3xDDiglo7kLGRNxWtp989
	cFp9klE3oyPMxEcgAtRugJ7cnk+Tp6w3YD1bXtRSdNeJcoh3FaVLsjYPvI4Fa8QWb5+G1WYyp+1
	qclk8CGXG05tCx2E1atwKsyl5v3qdUxN1Off46n5vrr0IY4mBlnOryhzgv0DNUGlDehUDTqF0R0
	Cnre4TAYunSpuFqK2MUOnMtRo/yeJfB5Cx88LenIXNi3CHsdHqNM4vTfA9FmunQywarK6HAUueX
	Ut8HmvxLr50ggevrHOuTZcWAhRnh5FgSTY3uLOqNlb6Jaml4DU/ima4IQcJKfzNWULuqZT0g5v
X-Received: by 2002:a05:7300:8605:b0:2ba:6978:2b4 with SMTP id 5a478bee46e88-2c185e45bc3mr5584844eec.20.1774798473900;
        Sun, 29 Mar 2026 08:34:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c74825a0sm4702738eec.27.2026.03.29.08.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 08:34:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8291919d-c5ea-42ab-b2e5-2dfa16c23698@roeck-us.net>
Date: Sun, 29 Mar 2026 08:34:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260329090601.532477-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329090601.532477-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksij,

On 3/29/26 02:05, Oleksij Rempel wrote:
> changes v7:
> - drop gpiolib irq fix and make pinctrl more robust against NULL point
>    dereference.
> 
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>    linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>    the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>    fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>    temperature, VBATP) to an external ADC.
> 
> Initial pinctrl implementation by David Jander, reworked into this MFD
> architecture.
> 

I Acked the hwmon driver, but Sashiko is still not happy with several of the other
patches in the series:

https://sashiko.dev/#/patchset/20260329090601.532477-1-o.rempel%40pengutronix.de

If the remaining issues are false positives, please let Roman and/or me know.

Thanks,
Guenter

