Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014A433E37C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481587; cv=none; b=dnLw8GBWvLsxRjaFXhoqCaBufyhF9OEc5XEoAdtkROkWt2NMMEYQWpiHELXLcU5+9OLLyxH4n0GkcJr1IBQGD1UWsjcGsVqxZ1wdyu8tdtpIJovFYwPXyRl4F0r4rqp1ZFHXBpZvXDoXx55sChipFoq3nEyTCTHpgczcmzQjocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481587; c=relaxed/simple;
	bh=DqPJsez3oDMKsZIBRVeZjgbhuCl9u3Ut9LncqS3hcgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ewzLnMPsGPbJalsaHhuLaBCghcbKR7x37qydY57BGc9Q4J5kX5r3/EKM3/JV7S2HiOVL95h649zEfA7+VDp0D8sy9lgNGxYWmVbuzs1yKnB8O5x5zB3p/yQdlFwLf79O0y3amyEw0NAlxguK/T46g6Dsg1fFaijNtGPFTRZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIy2U4l0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIy2U4l0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a73d5fc3so77281e87.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785481584; x=1786086384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DuK52cb3iUr/KtXlMS7D6VCrJzWBxUsmvWGSducPbHE=;
        b=qIy2U4l0838hp/fXQyVv0Od68dqQUKbW1rr/+HFl8yVSZggsHerHzSk2Z0Vmb6DxHa
         OhlG9GRGpdDOBhdRb0t6HrS7EZAE7TY4MT+U5lvFYyqWJtUqH/eJAa7wQxdnigh6fhhe
         dMKSi+8YUwCsC+kI0vxUxzeuQNWd9zEtAQaYz+CgkhhNhYby3VrA/TI7p4yA7t5e8K4L
         x7MW9/q2/ie3A6apv2YL3UcZTNei/KKSvAj4l3d4Fks02dB1zx3VMoJkrIeadIXS3Sdq
         ZB7XYkvm1j3WDPcHei0rw24GKvRzFDfG9xI0riPn096sAwfsnznT7JG7wOOHk9pOOW93
         ZqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481584; x=1786086384;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuK52cb3iUr/KtXlMS7D6VCrJzWBxUsmvWGSducPbHE=;
        b=MCVtUn7dtXoDB84bi69rU4HmD84f6YmG92/XJTpNxA/BMmJtOpvMQMdIbKpuv+Y0r7
         Sn8MfelfGcrIgF1BQIck29G38U2IwN8OObFduGaWS4NVPSoaPcieBFbFeirmko1thyO4
         7ynrywD4DfXf7QoS0XBVYZde0SX8twOCAlyRhk7PVMfltej/EEtz3vjEUSxPdd3bocci
         4WAIdHlTGmHHzYLatPKYEeEkyQrD6SJlPId4Dc0sUBxNOzTQGgrvtqOi4sHlkXV17FHq
         y/waiRg5RLHafkhniN7mIxlyI6N2gJlzKdn6r6YASFu9npi+S0glljJxBZaXk9oZb9Sd
         MW+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVVfgmSytPV6sFtrjG8vjn96qUyKmrmCPYCl+nEYfJswfl9Kh2tnjaBjpsUyjsTCBA/cryjVI9NU/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzA71p+Hi7+g8ZG1ADPdjWqNd5ZY/nYHKn1964EZ4wQ5Ttqk7MN
	bDD3ifZr2tMFDKZ+rwUi6+LUOlvP9kaa7bBIOMvc/iiNf7FNy6q3H9qMJacJtmr/hvM=
X-Gm-Gg: AR+sD13EUHBUmK2i4l1aFlKehftCSe8VlumMOVOTkOtN8wOpos4pPHiw5uu5RkJMQub
	4IWJVcsdcgTDl93vsCTcbHNILeKe/pywudI3EQdBNe53GbaTu0jrdtfosej3IRHASkbKAgvbzIB
	l8cBS9+V+aCivYl99TTh6kkKmmXLWOorpho+PTFaBMAv7jD53EBuINpQJi9OX/BdMsMOxy5vQSU
	yoKxfcqpqlc61STTYmp0u6qF/zlBao1OzRuO+9x8ZLA5aa3cWyZFCrNP3GOrCzGbsockQQ4yDaF
	+8BZPEOmKEDnqSqkNmDXq1CQR5o12vdu2tt+cgjuY3XgJox+tStVagl5MHE8lp6oOAZr1aFA/k8
	HkOOuDsssI/4pFjnEIK13+6/4J3k1ue6FHiSGjPEumCHNK+Ac9KctrUavF75lXJSbojjonx6ZE+
	/0gE38qNp0TLklA/Y0u/bM0plajmCZpYO27LK/9LRKvCLqGdaVhx40R9ctyUNX/Svzqc/ixhErm
	37IMQbbDcQLXfQbC7qUiDcDDEGE1rqiR9cNYbh2J5YkAVOYUPlYjA==
X-Received: by 2002:a05:6512:234e:b0:5ae:cf48:bd37 with SMTP id 2adb3069b0e04-5b2e1fc0847mr243683e87.1.1785481583928;
        Fri, 31 Jul 2026 00:06:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c091sm120554e87.79.2026.07.31.00.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:06:22 -0700 (PDT)
Message-ID: <fd168d45-fec8-468f-a9ae-39d17f020e41@linaro.org>
Date: Fri, 31 Jul 2026 10:06:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
 <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/26 09:44, Wenmeng Liu wrote:
> OG0VE1B is a monochrome sensor and cannot produce coloured test
> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
> Rename it to "Standard Test Bar" to match the OG0VA1B naming.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>   
>   static const char * const og0ve1b_test_pattern_menu[] = {
>   	"Disabled",
> -	"Vertical Colour Bars",
> +	"Standard Test Bar",
>   };
>   
>   static const char * const og0ve1b_supply_names[] = {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thank you for the change!

-- 
Best wishes,
Vladimir
