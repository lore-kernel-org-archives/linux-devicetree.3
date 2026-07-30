Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30938AC97
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384657; cv=none; b=ERFSeOsgrrdMqCRySEcT9p/wJhtiSFOBvNVXomaZjLSKWq8faMOLQXWlRkQQdIW7Zpp++X0tGqwtpbzfioyyfGVMORPGdUIq0BtQm7pSbMa0XfJqZt33x9GGktq5nMFD7tK3qDrcTlRWQZ/o6ukkUMo6+ZnFo+RtACSmxTJnjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384657; c=relaxed/simple;
	bh=o9LJiNvtIGBMr1fnVKFdWsEPNoJTtbW9SBfZdsvYUA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGzU1kHFxuo3WhhXk1/ITuIT69Om68ULrtlANBrceu3hDPS/bN5EelVmkCFwRT/wcbV8VFVyVkzOP2hFxH+ODN2kdl6lGLm9E4rN695N2711ULcd+FkfFaGEFM6B/lY8MXsvHbxi+9iOvN4zlJyHAGkH+m8g8+o3ASSo4U5lK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa+XaCWn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa+XaCWn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848593533cbso1083574b3a.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384655; x=1785989455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIvCK7aTACMGHSTTgsCMHaoyEBoVoGt7XWGYwDfL/nQ=;
        b=aa+XaCWnvZgvJmAR4L8ZN0rfvjvYT1NkRuXi4Q9vmjIhqooe6sc+IwySbaTdXMBDvL
         R/PHTLIfFSJivD+EmTBIlqj53Kv1zi304xbMHuctpWooLtvoZKMqJcyLjX2B+pO5UGUH
         pAX2bb88JyoxMF4NGVc3XUxN9zt0wyAqarWosp1h8B+ETcaUUt5VbcydBTqhXnvMAjMm
         wzg4Rb82xpbIZsI856dIEHJ2ZEv9+vVJrP9R9BhM7kSz96ODcdf045MGKm5Fq6G6qF83
         HolGeFz2IusLTv6UelJfAPkCRezWFP41Ul9Fyxmot/Ootd+hX11CzyCbgSJfGSypJTmc
         rikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384655; x=1785989455;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZIvCK7aTACMGHSTTgsCMHaoyEBoVoGt7XWGYwDfL/nQ=;
        b=TGpSt9+W/trwj4NJ0ZCYUoGp/s8gzh/MkUVluR+JOFzL/FEkJrNVmX5m5JPG3sgW51
         TC1vaAjVNeCnb7ms0xE3u+fnvg/mPHzyBgT3VII0v3t9MrMl0BA4fotpQXIi4wkePJU8
         aITij40c8iLwPh7tyu2bKucGO35Y5Es3ucz2ZuzQnSe9N2Ga+WA+Rl0ogZjInFEGRgwR
         FALtYu5Hmjo2U51L8vPOj8CycJH9bJj5VF8H6mV+YwcT+IgI/lL5m0SsNA8qKjQ6xxLA
         j10wQBtpQ69KXcHi/MT+BbRVqPMt3l6QOoWYLjXAy/vo64VQqH1tFD3VpbZjF3uaHXHx
         sVIw==
X-Forwarded-Encrypted: i=1; AHgh+RpTUDwGGok0a+LtUt4M83X1HyKUruWQsciq5mCgGlFJMqw8XpNdb0c8wBac3tKmwwMokB5aF/K3CPPF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ykwy4fPf7o6KH1F80Xibjpkd7jjWeugausN0NNJ+V8Qsabz8
	72/VfaUpP/wDQoHo572a6PldrdekHBGIsgfRC+ZEaJahev8TJ1uVF17s
X-Gm-Gg: AR+sD13kuLrFVBPvDFX9lI+3GMDLQzvi01ERCmLPHiUjwPLy57UMvAD/Lwh1lXtbPhz
	znweYA7Y3jwj4DNMXLNcoyUhLRnBPlI/QCDvz2925CimEToxDtCGFBwqyUtPsWD0fs6EeAgA1Xy
	sp6TDrDnyMBXFn6sMqEkA3xpXvNAhBTmnuMJTTsQ9vLqAyFW2Smc8Wesg3vk9lsYj0RRzyLrm73
	E6xv95JTNl1o2qtYo9Ot6uOF/UHaN+xq+l3u4hMGHp3oSHmckRDyHobySe5/m2Irva/bbCL96Pz
	a+YqMcvKkvdQ40LeUakgyamAKAiNqF69lJUaVNhAtDL/XHUdPIs5zOd8BR5FJeZXIU6RVgq6hun
	EDzEqQKbFMHDN4LjVwuWTK4zAtqAxH/agAjB+lWyS2o3dhMG3yZn2uB595+GUpdzmbOQVXT31Jf
	b8VYttPe3l31bTK5xd2ffggprJBYfnMFgDXKlevHOyByA24FUngukSdCkTpy+82HUn/VCNNb3oF
	h4SsshHfibt77BZvPxSCh1ODCUqwpB/3pglKvM=
X-Received: by 2002:a05:6a00:1791:b0:848:827b:70f8 with SMTP id d2e1a72fcca58-84ebc408bc0mr1070919b3a.67.1785384654972;
        Wed, 29 Jul 2026 21:10:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba3520ccsm1673604a12.19.2026.07.29.21.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:10:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <44db442e-95c8-47f0-92b6-81279710ff33@roeck-us.net>
Date: Wed, 29 Jul 2026 21:10:52 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
To: vjardin@free.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 14:51, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The MPS MPQ8646 PMBus step-down converter uses the same
> mps,vout-fb-divider-ratio-permille property with the same constraints
> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> to the existing schema.
> 

The driver is a separate driver, making this a bit unusual.
I'll leave it up to the devicetree maintainers to decide if
this should be a new bindings file or not.

Guenter

> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>   Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index 90970a0433e9..d7a32fb3b7af 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -18,6 +18,7 @@ properties:
>         - mps,mpm3695
>         - mps,mpm3695-25
>         - mps,mpm82504
> +      - mps,mpq8646
>         - mps,mpq8785
>   
>     reg:
> @@ -52,7 +53,9 @@ allOf:
>     - if:
>         properties:
>           compatible:
> -          const: mps,mpq8785
> +          enum:
> +            - mps,mpq8646
> +            - mps,mpq8785
>       then:
>         properties:
>           mps,vout-fb-divider-ratio-permille:
> 

