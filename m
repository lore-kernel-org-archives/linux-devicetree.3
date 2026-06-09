Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5F419303
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010905; cv=none; b=EOdSEgBUVkzladrttW8Jr8J1hw9lelyTLyDoemaLdFBbwh89p+D5dov60c6weTEn7xMTOWTWCuX7RvWiyyKMyuunmoR7l0N+kmYbyFA5BU8ADohMytq6EN65AKtASvPRohkt1wzZJak19I5lM2nK3QpijiDYAn1yQ2BMqmtqaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010905; c=relaxed/simple;
	bh=C8Z23G5fMKOxO2zCb/NuJRS28VYirRrmBHN0fhhaHfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPAVA8K4z60A7iHYCILuRxZxNUAR9/vzWneJyRriOqoVR8RfZ/N9BNOUvMEB/s/EjUTzMUzgy1n5OITh2rCh+7i4dkay1IDs8MbQAhtKv4uhp/0jIwjcfu4cmhUDQ+OO7UK81S6J+iFOi4PRVBvCQ7dVCncUes5qiARX6ojNj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+1q2anC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+1q2anC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf114b0cf9so48852735ad.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010904; x=1781615704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEDbW2E0jYhxmhbQRn8cH1fVwccIh6hf9EUZ/KlZ/NE=;
        b=G+1q2anCkxtIlfRoZ13Mr+J6nWfZ55dOIZBEeObvSApqL0Zdqc5dspaCNJcQoeHWLg
         1K1bPl2kRJ/6Fiy8D9Fa2BnkcoXMVao+RL5/b9EHU3hg/HK745UcDk6B/StIziZTkm7O
         ye9NRAyl34ZowYZmwyz2WWTq2HzE6LbCXsV5Ggf6SfkUyaEd3S1NOZGfwkUKfQ9uInju
         VzVP1j4wByJAabZ4NWl3/JHbMSEFyYx/xB2Ht0kKZY6rIQqyr3YJQ1fU3H0DiBkRyrxt
         ME8t8d/jrArCW1dWnDwalMVQS07ug0dBY+bemQlqBJtom65AWRDhNdmkoeUo/BG19llY
         W8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010904; x=1781615704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OEDbW2E0jYhxmhbQRn8cH1fVwccIh6hf9EUZ/KlZ/NE=;
        b=sYDZWm0nBhq313XYBxXIv8OVtxhYVKrBogb2E/IUNepOmV8uaLGknxLIlAX7M/PRlH
         WwE8cyn1HCB5W7SW3t0aA8KGYoUhUIz32VqwdP2MG1hNwQDLRfn6/U0u1rZEymVwvhgn
         AfAxq6Ghfn7M4ldsAUkyqZPBYShhwANsG7GBGtmbNwbeYQhzF96SVSlgyJkFNZQDzJ1J
         uO7axJQnilkeJKrc+lCzhxQOC3RQPeFIXvwdaFdDq+QBctTclyNyvryYeoXkicIU5inE
         275zAMqIbFSUJuZ3DkuBPeu5SZkTsut2/GByXD1a4wnALboDy7tZBjN4+kghLnfHKwPq
         4Yqg==
X-Forwarded-Encrypted: i=1; AFNElJ/QUq9m1Bae+XLjJvSFvO0Z6MkraJVjlYA6OcPJZSFobD2/c2v31XKNRW7C1fEPmrhFCZ3tQEg30CbK@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQDUud2hevBb4++A75ycFzzgtbkDEdFjh5ZSoAN31O2f9geaK
	zwSp75XA6UVwgLo3LvvhhNapfnGnk00uL7Ut6yA5ZuJcUg30wLXK+dEy532PJDT3
X-Gm-Gg: Acq92OF0kdTY75Ug+wjH4QHfx265EfDJ2uIdNMwjzSJOIexS11wxL6qgHPyo5UbCZob
	fX43YisKp/Rhnpni28POMaDTlBnLlDXOkYbyHFb8xGB9N45pttSvnmP6Is7+DBX8rNXkX86cU8K
	iEXR+UARVmBAKVPEkxi+UW7H9WshaB4AOKEOW9dzn028PEOCAvtNUWzKzDwzCtqPQ6wHx6nn2uA
	DCcNcmV9a+UkYCsdLuHrOr3Gzko9BBLT7Nl5QT5WrOXtutE/4ZDoil7gQEbRB+Hgsed7QYXMw0i
	dTPcIwbTE1c/AZMR49gor8jPhJbURSvWM82U1rXdWxZryM+h/CEeKjlDERfLH8+E4th9B8wJ9pI
	Ljv8FAJ4k1QSqZA9P8f6XrZ8nzBjW64ttrPGhtEp7nfgONDBI/6h2+MySTmOv7oXs1RSuCOsksf
	hsVpGp8flKOEBi/UMF1ZFDORXt/Z8mgbkwwCM678KNqgf2LaZlb7hsMMqY8A==
X-Received: by 2002:a17:903:27cd:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2c1e8233854mr149248775ad.13.1781010904032;
        Tue, 09 Jun 2026 06:15:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm264175375ad.18.2026.06.09.06.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:15:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v5 3/3] hwmon:(pmbus/xdp720) Fix driver issues xdp720/730
Message-ID: <e8dee0c9-7cc6-4687-ac0b-a81ac759ca41@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-4-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-4-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:31PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Fix driver issues:
> - Adds the missing regulator and property files in include
> - Declares XDP720_DEFAULT_RIMON as unsigned constant
> - Declares struct pmbus_driver_info xdp720_info as constant
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/xdp720.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> index 0f106c13e7ca..b273e53a01f3 100644
> --- a/drivers/hwmon/pmbus/xdp720.c
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -17,13 +17,15 @@
>  #include <linux/of_device.h>
>  #include <linux/bitops.h>
>  #include <linux/math64.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include "pmbus.h"
>  
>  /*
>   * The IMON resistor required to generate the system overcurrent protection.
>   * Arbitrary default Rimon value: 2k Ohm
>   */
> -#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_DEFAULT_RIMON 2000000000U /* 2k ohm */
>  #define XDP720_TELEMETRY_AVG 0xE9
>  #define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
>  
> @@ -38,7 +40,7 @@ struct xdp720_data {
>  	struct pmbus_driver_info info;
>  };
>  
> -static struct pmbus_driver_info xdp720_info = {
> +static const struct pmbus_driver_info xdp720_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = direct,
>  	.format[PSC_VOLTAGE_OUT] = direct,
