Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04867374192
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346523; cv=none; b=ZqVxCRXJfbeHB2iQ+3Z9CsbYcBsgGnCOHk+d76T68lmRNiiBZbUuZ+dJZ7Qy8/GtmfWVn2BPzBRxNfTgXgT92DNyzySVNOvfGGivGZ/0UnQ3ki2oBXoHny/sqFusUslAjj5vDc3ouyK7THNfaSNfmImEsDk/gWAgMw9/aL9YOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346523; c=relaxed/simple;
	bh=Oe/MLWXP8dChzX5k64XMZnBbFfYNd+emFyTl3KNJkIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNFAFs0a8pPVwhu1uTH19gBh4iJA8OQKZxsxgzGD6v3zRxOCDYMLQYXVHAVXEY94A4Xrgy8KRDHhBkORmq1jSGqOSus+oPBUAX2OvZcrh8ayZGN2I5PRWt39wbTExu1dI2iuMN6v6/ZtkvVmBokFlhcR5PkfiKG1KP5k5I29mbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwCJ7qny; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwCJ7qny"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc97653887so13140965ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783346521; x=1783951321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8W5+jx7bPjLG+4tJL2jHIRG3oW7oM+42HpDCfJqGjPw=;
        b=RwCJ7qnyMny8Vxzcwf+qYHt8vY8Pq8QK+74PZZ8HVBNr181u+ID0pb5BzUkoIZ9TRh
         XUII5n2CbmE/2wSkC42EYhHdAziVCN49WoZX0qLqFDhzkVuUOJfF2+Gtlhjo+arygzkM
         IlZ1OnXHG9YdVJRsiHyQKOYJlkFADszaouYjhorbeUbQ3xHHuG5XISDgDCPDUKx6jQWc
         Ncytk8Vj7VkQSEm0J3cSUxK3c8a288swVcDs7bTTMdmrUySm4NlbenA4RMmoalovC/92
         bHixk0Ga15FiYPZa50PZ7g5NrPZTNCMUZeDhwHrGL6250nbxwIwdUVb3bh5dmHuQ3IPF
         H6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346521; x=1783951321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8W5+jx7bPjLG+4tJL2jHIRG3oW7oM+42HpDCfJqGjPw=;
        b=j/9eltCNgrwEX/MVZoT2c+rHSZCr84s7GVPt9Ljwj0tIjTZwNKDD6CMHDftdygxnpf
         MQyJXDrAWfz57mM/+Z2ZT9ZwfnQqS1KJjjx2yxxiunlvZHR5S9aFxkvheiVXMG519gtL
         fP9fQl+kf5xEC4WzgiqAQyYmjqkTDtwSexJQeooDmbJt+5WwCxzT1sGUGEICsPNHQnuh
         PZBn6E5rc7D5C5D/NQqmbFDVhzCRgOIZ3zjtTQYlS9MrLUoFfe+uhVK/i0tGF7q6BF+v
         YZQAOONX/gfGQutXjD5vOvDM9+cyY64SuPehBngKFsEuWMysLfN2tKdpbaVmwsQon1XW
         j5ig==
X-Forwarded-Encrypted: i=1; AHgh+RrlhyzR2ZqcgzSfqvoYHMrTZN4jgYckQWE8wxWq4mfBrHwhvyq+42yfNbhfUjbbt7+dRMZrz7/IDsKP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sPv1/RzUgb0qddxrSTX3bNy3aBYGkPfb9X/kexA0yaOGpKUU
	rBehP4Vw2cfr2Gn2scvnN6+ZZPMijosMUNm5HSfSn8IisNlSvkJp7wnP
X-Gm-Gg: AfdE7cle5Rk1XcVbC2tSE/jIqvPYN6Uq/kBAHJyI6XmjIh9c9dFxFioP0sRMTP572oP
	fRo3csR1PzM8i9GAczaLIjpwMono22X0MLMLWgY20TT3814FQbzgPrEgHnuDDARFxEk5WgiQfth
	I2vEvwBwTUcNt+KPCaInpNPjM8+ybhobyc/1k4y3W8ksDQBGgQhAgmDfBEMkd9NFa07DzltSYdM
	1NKErCMSS1Y0xDRhUnrXHAQx3oDA7t/76IYoJbEJI7Buk4duv0uhtLozbGTyGHM9/u/zokvdz3E
	UxYipBDt90SJoxkvTQWKZDTTgqhRPO/0F7BPeUObXrDXCyq5FSD25sc1VBgXJQPKbZoFjec4Yot
	quEyxAXa+7SX1JSl6TmD/NCUOxM4PxtxWyARPgE7QApSGQi6+QESbtQsZ/I4OHFspLNrfpxl+M6
	7TsARrJRG/zMgGkSoFnqpRgTgABg==
X-Received: by 2002:a17:902:e5c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ccbf043d9cmr5925765ad.35.1783346520520;
        Mon, 06 Jul 2026 07:02:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7894b20sm51246705ad.78.2026.07.06.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:01:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 07:01:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Message-ID: <a502e1e2-f2c3-4851-b0d5-934b18e92f84@roeck-us.net>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>

On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
> was not included before. Also edited examples entry to be more complete.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

I still do not see the point of these properties. The driver can extract
the power good information from its registers, and it can set the enable
value from there as well. It does not need either.
In practice the power good output is likely to be connected to an LED or
to the enable pin of another power controller. Neither would need
devicetree properties.

Again, please provide a use case. The mere presence of these pins (which
exist on pretty much all PMBus chips) does not warrant devicetree
properties for them.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 1625dd59417f1b3ca689a9c86ca266da913d1217..f3ba6351aa5d657590d92a538910fd6b787e7a3a 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -39,6 +39,11 @@ properties:
>      description:
>        Optional 2.5V to 5.5V LDO input supply.
>  
> +  enable-gpios:
> +    description:
> +      GPIO connected to the EN (enable) pin.
> +    maxItems: 1
> +
>    pwr-good-gpios:
>      description:
>        GPIO connected to the power-good status output pin.
> @@ -53,6 +58,8 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> @@ -61,6 +68,10 @@ examples:
>              compatible = "adi,max20830";
>              reg = <0x30>;
>              vddh-supply = <&vddh>;
> +            avdd-supply = <&avdd>;
> +            ldoin-supply = <&ldoin>;
> +            enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +            pwr-good-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
>          };
>      };
>  ...
