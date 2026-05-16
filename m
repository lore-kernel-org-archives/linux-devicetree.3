Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3023E7BB3;
	Sat, 16 May 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948834; cv=none; b=PNOF7evQUSfYwNhIzp0SrIpgVuerR8tqXFRP4n9NwuF7pJzjWKKmaeLdh4uyOr4NbDWY5RlejeLDbDy3DbifkUwBEggcocH8E/tLknyv1bZlfZr9Qp3irYLLZgpx2hhBOUjJ5pr+u/hCd5PqhEHFd9eLUuMYGtyHTygRoFmvH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948834; c=relaxed/simple;
	bh=3zzX8u1bKLqGKt7An3vvd25ZGKsKrmXEQ5rzKQbJWR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOpXHohYqUlbvrAHVMpuNGa+MnSQETBCL8GsQlBj+z24Y+P7I014JtHgS6v5i9zE/YMixBo5e+VZ3v4xvX3Mx/lkb7jQQoGcoY3mjX+VdT8bkOfJ7GsT+QBROSrj9bpf8MF/hz0O09d2IM96uN0jUYgjCCoWuXY/KlsyTG4y+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F989C19425;
	Sat, 16 May 2026 16:27:10 +0000 (UTC)
Message-ID: <5dfea4a0-3f10-44e4-8be4-cf011db09016@tuxon.dev>
Date: Sat, 16 May 2026 19:27:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] nvmem: lan9662-otp: add support for LAN969x
To: Robert Marko <robert.marko@sartura.hr>, srini@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, horatiu.vultur@microchip.com,
 daniel.machon@microchip.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr
References: <20260515115954.701155-1-robimarko@gmail.com>
 <20260515115954.701155-2-robimarko@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260515115954.701155-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Robert,

>   static int lan9662_otp_probe(struct platform_device *pdev)
> @@ -196,6 +194,7 @@ static int lan9662_otp_probe(struct platform_device *pdev)
>   
>   	otp_config.priv = otp;
>   	otp_config.dev = dev;
> +	otp_config.size = (uintptr_t) device_get_match_data(dev);
>   
>   	nvmem = devm_nvmem_register(dev, &otp_config);
>   
> @@ -203,7 +202,14 @@ static int lan9662_otp_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id lan9662_otp_match[] = {
> -	{ .compatible = "microchip,lan9662-otpc", },
> +	{
> +		.compatible = "microchip,lan9662-otpc",
> +		.data = (const void *) SZ_8K,
> +	},
> +	{
> +		.compatible = "microchip,lan9691-otpc",
> +		.data = (const void *) SZ_16K,
> +	},

Some checks from checkpatch:

[Checkpatch]      CHECK: No space is necessary after a cast
#51: FILE: drivers/nvmem/lan9662-otpc.c:197:
+       otp_config.size = (uintptr_t) device_get_match_data(dev);

CHECK: No space is necessary after a cast
#62: FILE: drivers/nvmem/lan9662-otpc.c:207:
+               .data = (const void *) SZ_8K,

CHECK: No space is necessary after a cast
#66: FILE: drivers/nvmem/lan9662-otpc.c:211:
+               .data = (const void *) SZ_16K,

total: 0 errors, 0 warnings, 3 checks, 44 lines checked
