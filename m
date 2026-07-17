Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8333BB9FE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297692; cv=none; b=GkfrB7VA+eHZeK0MaibxQ8Nu90P8RzCwYtRrRaLu4fbDwZPwmclzY9xpWcYnpaagvaxMHon0ndX8laaVzBPx6Y/TE9t8+tdEhFx5qdobks6F85TZ1B6gVIJTU0RFkGuBG01wMx3EPh8vw7p79GSjg9ZhKFZydSGTmZcC0r4VjeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297692; c=relaxed/simple;
	bh=KAm/AYUIYfZT7X1FNvOPdVe24HfSOIRqxExkrJ//yOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ8xx++5z8WnGYvhSf6IqsB0WkXyFwUjeDeNLtYrnlu0ejYdYCTXau91CtlZA/CndH8WOOxsQJ9OLOPgMgPMaz/1KDim5UC3w+r4G3AdOQd+tphXeOzQbExRu3YQMH42HXGXUSHEPUOkYOMDMTtdSPHo1n9A9UVkDI2cWV2wXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=NpJSyA7Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="NpJSyA7Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so23015915e9.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784297688; x=1784902488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP+3qWAITWJuNIeEV6DkJLDIFtTz+ldyffR4pVfrlVQ=;
        b=NpJSyA7Yj/SoqQjkXyHSSK2/7ELaAjwsRxVAkMOi2+idYsFjROeqEIMtGf/fmybdQB
         d+6Ll9UxDTx90pCs3qRjNImsVA6C6FW1M28W5rCo+YxqDrhKnbJkBtp1FEI9wnse4o/n
         7zyKUxNptQxoSsCNwOdqUxyqmaFrXJ6ABYD8GO8O5isVjME+KWZW1eugWT/9v8HWenBC
         ehZ4GWQq/n9DwfyQixjyq7vSV/EW/zXKQVvgNNNvkn6TttebX5AvjPkrJ43pPH69YiqK
         nSjXsgY7pvHuQcgt5Ii44JxuFuDHZHN/1B0yryjYKTQ2iN1v1rDiDgqcOnG0LouLo3db
         N36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297688; x=1784902488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP+3qWAITWJuNIeEV6DkJLDIFtTz+ldyffR4pVfrlVQ=;
        b=ibfZARmghjPLh8Fci4KSJqGqCdWhYN3DopXmxwjNrvTYHj3OU4Jijdp0War01/+8Ix
         h2D6E0E4uuZZGyQ0JIziNrrHM6l2WPdoiM0GdrLTNPxf23IxLcTswxZEaLW+5dDqu8Nm
         M9YcZdnfGxrQc+8DQilP0QWG7L/+ztuCTKTsVVQwlhn/Fs/n0JPuZ5iq+Cj1/MQIhYN3
         rQzMTJ/KyKhmzp7u0ULDiC+3EazQdZJntqtpRIlsBU/GkMfhbyeWP3ueHiALwp0ozlSz
         iJQQj+xYzx7giEB9xwhO0qZyYc4VT4XWjAWzeNekT5a7L8aTx6dhBf7HvekvUatPxk05
         LtIQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro10fNQzaVIejof2fSWmmH7FVorR+/T4kggEYx3rE7iPm9lmQ65RB7Je/qfTz+7lOTncmn94ISG9mYx@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGx6n3mSY13zAgI3d9BqvxwyRLjtmKZ4Xkz0wkfXTxhK7En0W
	X0od1xiXoYWca/vpYTbg9Lhs9Sj5nVaVjoe/cpLtBkRzdYhnJHmEDn0Jk98f0A06kKHgDrByXgC
	TeYkA
X-Gm-Gg: AfdE7cns+J4B8ZB6rxhstPK2jGTZwaYZUxhcF4bKU3D1IqvAjZak5X7Xu/Iy2jvuS3T
	Zx5zxqiSvk0WZQKKiQvpHQGGgRrsGih8S3E8FrU6NPqrJTBY0EnNQSqgZAw478J54+lnd0WEAl9
	muPDniNcdIqdgcnsg25LCSOMkQq5iGrmF4p5bQAvXI3N7O0qrrzQe+xJC70lRtDRt6uGXp5VBBl
	xlYdQFOtp/qjL30dAIn3mC1+g7uf5/3WTj5HpXa064Ps0ijoZWTJMojToaWWnIxQ29jlQ3Z6238
	WWM+CplhO1AY+VYivceF13lzx1KGqzbc903efoL58iTzdMJe0o9hhKptRf5MIlBaLAIfCGwNzf0
	KpaMWUNAzSXfhSy3vW2UBKrL5YhlFglMUw4nzdxRtHA+qtgXnewZyEwRHa3Slm8Y5eM9WhGRUBx
	3opBNHIhBc0A458YpqszvJ2QlfarFI9xjB71BySE0iMZll/ds1crB01QYDSSs=
X-Received: by 2002:a05:600c:1c04:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4954a3cff64mr35247915e9.1.1784297688498;
        Fri, 17 Jul 2026 07:14:48 -0700 (PDT)
Received: from ?IPV6:2001:861:2128:c8c0:8e8c:fdab:4545:5849? ([2001:861:2128:c8c0:8e8c:fdab:4545:5849])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834fd05sm65413795e9.0.2026.07.17.07.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 07:14:47 -0700 (PDT)
Message-ID: <c3977e59-951b-4d91-a775-6c96cb84e37c@arturia.com>
Date: Fri, 17 Jul 2026 16:14:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
 <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
 <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
 <94ce2136-3adc-40f5-946f-b56778f6343c@kernel.org>
 <38adfbda-2cdb-49bb-84d4-aae0a6258f68@sirena.org.uk>
Content-Language: en-US
From: Victor Krawiec <victor.krawiec@arturia.com>
In-Reply-To: <38adfbda-2cdb-49bb-84d4-aae0a6258f68@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/26 14:44, Mark Brown wrote:
> On Fri, Jul 17, 2026 at 02:31:51PM +0200, Krzysztof Kozlowski wrote:
> 
>> So you are adding constants for one device but used in the bindings and
>> driver for other? Are they valid there?
> 
> It's one of these devices that's got a bunch of clones from various
> manufacturers with minor differences and share a driver.

I checked the datasheets and all devices share the same 2 modes which
are Auto-PFM and Forced PWM mode.

Since devices are all clones and share the same modes the binding part
can be generic. I plan to rename the header and its macros to use
FAN53555 name and add this property to the binding:

regulator-initial-mode:
    enum:
      [ 1, 2 ]
    description:
      Defined in
      include/dt-bindings/regulator/fcs,fan53555-regulator.h

However the implementation I made in the driver is currently
restricted to SYR82X. I could make it generic but I don't have access
to the other devices to test it.

Best regards
Victor
