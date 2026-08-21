Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB264A3414
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322083; cv=none; b=JxTNUIL2+vexHZjAk0BZN2RakUOiN8q6pBeLt05qvr+G5LOm0DZfiF46posIV/CSfoIRBt5PW/AK6+3SObm3Bos5piTsvCwZLkX0rLTbFIXcA8qI+cNDyI4Kg4mX/lKXY35/iA4BdWp4q9xyLLLLWMxEjbdjKZMy1p0PCP+wU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322083; c=relaxed/simple;
	bh=95x6UgUlxaPm1d5NvFDzpq+9kEJ6eR0ufqiyyvmCgUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc6RUMKOekxlvBXdu3/IDN2ln0OT/urvQDGw0ZoOflE0BPWhh1jd4r84jcGC+MUbi1uOPQLDq92vyUViC6DvtyqN7IQm59amOszVe0j1ihXmxDF0u5kZkQXCByDbqbyBlV3ZRm7t7mgrzU/a7zx+7iTsduGEuNzj4atN1RSJVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwXwGv8V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwXwGv8V"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9aea40d799so679098a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322081; x=1787926881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SXdfnuXNDne6hnaasWxjsMSIZ0AuRi/ByGqammioC48=;
        b=QwXwGv8VaecsvkG9Bkk/Vgdl8mq+eoXEN6wIjEaf+F7d5E49nhmpxSJrSwmj2yIR6b
         D9jWXuNsNVN7YuJ3SFMm+MXcdnAgZWcJ8TKaH9zZC8Q9hV7XmJtPOvS5EZAoT236cyQQ
         sSpOW6mQrq/heFVS+beEwJnidir+8uBogtRijQchFhEFfVkFkGkVGy/wxbMzwWkNlMGL
         ODR9t04B9zUD0NydHTek4xeJyRxOUSuIVrVtr/6w+4Ux2y9CMYMqDuTXkP3CJlqUxnMq
         chG9hlEmicsxLcpLLFj0DxQj9vYjMVnBh9SPfzR9fyCuDp5haW60Bgg+glnBnhqX0kHH
         9IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322081; x=1787926881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXdfnuXNDne6hnaasWxjsMSIZ0AuRi/ByGqammioC48=;
        b=eQ1IMrg57BNpRIApDznfbUyjKXYW0wdKOl7rnW+5pdPB7wPlyF/NmEkWvGVHf7t3AE
         0fUzbryiDLIrRgddRwHs//AahZ74pRcMg0+RmQKppIzL8Kg8Ca8OK1SxSEJ4ZRZ04CqI
         FGU33baRwYeiIqxm5Icdewns/qyeDTloUKYyfukPzAPybf8Vn0PMBLlHiTtRhveCgMKD
         0PHIWU+V79WK+DoxN75/upN18Rx2yo+qlMyf+z0F84SP6Dtg2yXCRF1lAJkq9NuDXTAd
         I1BAYrDoAaqeqkteSEG/YQkCPx2STxwy2tMTDme6VD2VzrHSO8PL8a9Hh9u23wDcb1ne
         y/+g==
X-Forwarded-Encrypted: i=1; AHgh+RoUQ1y+akMidwGhk7lv1IgIzWCU+tetGUD2IiTzw02H389qQdy99c69ukpi79qzhKvukYjVRd03aJi/@vger.kernel.org
X-Gm-Message-State: AFuF++mBGmrACCU/YMHpo5KvK+DPKFIg/i7ydKFRYu15hWAcdYnHkfbJ
	9U2vm58OShh2VNidqYqWsUdvPlqWU2Rc4hVDJ7nNn94V6+mmV8Zn4Sg0
X-Gm-Gg: AR+sD12yAzJltnfF61ZuOoodTQodT07odOj2vbVIju0BVKN0tRx6eNL/Er0NhtiZOsh
	7IsR3/Whbl38TTU3HLr130utQceSDZA+UMH6U76Y8GwwE6MTe7SbypdQOYS81Pig6Ys3Z72HQBH
	P0/ljR+S+gd8DGWN389/4Zw7FvElU2cVwRZydyMknEmPikkWIqsf7uKUDmQrLgw2kxk6fJYaFQi
	XuGqf4bv9hfQRueLex47fYjBJranYudq6fXV5crz+SN+Tft3C03foJglZqp5jbSAySjgHkLB6ww
	jaelgDw37Mup/7N7D32ysO8noXhUL3TNA8RADcxWuRbCzYRaFwsiesAiZG/SKTJDylFnZ26ievu
	JIvCRDsK4TgRbnoFPRS2KH01i6sWYetE6sTwOxqXZJ8YQyVUTe3buiDMoG6gn4T1n0E2ZnswWPl
	NrhBXCZNIdSfKuntWFxBCZdppTyjseshI=
X-Received: by 2002:a17:90b:5303:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-395c354cbffmr12802197a91.3.1787322081476;
        Fri, 21 Aug 2026 07:21:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d475sm30707004eec.18.2026.08.21.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:21:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:21:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x
 series
Message-ID: <0319921d-dbcc-4150-8c59-de3cd4f299c8@roeck-us.net>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-2-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821091924.18975-2-alessandro.zini@siemens.com>

On Fri, Aug 21, 2026 at 11:19:23AM +0200, Alessandro Zini wrote:
> Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
> series of digital temperature sensors.
> 
> Link: https://sensirion.com/resource/datasheet/sts4x
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 435c4baab4365..48ded1b746723 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -423,6 +423,8 @@ properties:
>            - sensirion,sht21
>            - sensirion,sht25
>            - sensirion,sht4x
> +            # Sensirion temperature sensor with I2C interface
> +          - sensirion,sts40
>              # Sensortek 3 axis accelerometer
>            - sensortek,stk8312
>              # Sensortek 3 axis accelerometer
