Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCCC348465
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532774; cv=none; b=vFLurhf2wZU/oJDulgksEmmEGdzbr8FninJ9pGuZRNwE3McQHeC+J0qjYrERJP1mPQL/0Xipk5HNdbCSGSAi6p8/VEbEg1XxmyZPGBKfNwLQdOjN/ZNpnMxHGNwnancPqhXllwQwO2Ayf6JDnzpBjxsq5TtuM5Z0A4QAE6vuoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532774; c=relaxed/simple;
	bh=334syfjaJkoAeyzsz1IUG5zqRPqMRQ/P32fFz+5LeU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsV2c/a5kZuetDoagWM08pTYzpsNgxSKJP05vmO9URajoHMKJszgO6aJpk2ykjkbrB6xWAvDQEE/rFClCephizS6fJli2bxTr+f5DwI/60A3YfvFiTaUQ1a73DY4OVNHg3bIBCNxdS6PJssH9u2LhetEMBSzjIEFowNW9alsnK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N53i06Bw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N53i06Bw"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso389760a91.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532773; x=1790137573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJWhUN+rb3FeHB7oqdusxLkDrd5idpWaFetoXpAmflM=;
        b=N53i06Bw1ur4F8Uc+14AD4CXzJFvxgrczjsBhUDBfscazLrmsd7OSthpEKL4UnneAn
         6FQ7wDiuPJSqB8KOjK8wbu+Nu8qxUlGUvGpypcwK20HLkY7HhkHmz+S7/bU6ZLRVbfsc
         Tr6CB9xesIN70zqiZ9VGmNyh3KJhovJkoJxZtKYdTywL93xoPji4/acXUHivJX3mo1ps
         z9t7WJsVqpOorHp3qijAE9gG+jfewy3jUG6AyUXWbMzRNR+H1KO4UfkRWWY8j05oP8yP
         R5xqQW6JCL6ra94xmB4VOFYkgh5X1Gf+ZAedO1rpLlcnE+SLCWSB6TAoo0ZSSEvEWtkE
         ggmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532773; x=1790137573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJWhUN+rb3FeHB7oqdusxLkDrd5idpWaFetoXpAmflM=;
        b=mTBMbfMYl4YYPb80IjRrslF9AhyMO0B0ogadICe8R8WUckkVxfu9hNAKnfOyEk+gj0
         enTGg/6yzs5pn2FVGW3lDIbzbcQxugYUzqfVRp5DHfYSqLPso33Kx/FS75fpy2K8w27I
         zrgctTFPYcwBosTr7UuboMTAU3jhre5E7tfaR5teh5sA6ysuP5xZoaZlLi+nH1NYWoRO
         CKu0ZsT6mazgbKEg0EMFwcKaqVGow62dfVhN+y0kRKd/QvaV8I1z9Y1buAm5V5GKACIh
         tM3HN38zAEP3OZyHfN/Y3rgjfLwHDRymUIVuVXxooum31iul+Qd9WHyJ1ffZdrSBozsb
         PXdw==
X-Forwarded-Encrypted: i=1; AKwUvBx6PF3Q6E9q8JpGeQIhe6Ni2WCY6AiCuxyIH7KI/Do1NRnyUIROFFWfMQ+iqBG4nc4NxZZb4BFmfT+L@vger.kernel.org
X-Gm-Message-State: AFuF++nzrQIfnEQZQcWyYSsgAkXvRzeuEW1FnxO2xV+mlaa1SIqBuW0I
	3EuHc3cLXs0KNZXLHtNaVSfyyt7g/4zY2VNsHe6NeX7wI5HmxSF5URgY
X-Gm-Gg: AYBFou2bzH0NFMqdsE5z/iqfj5NxJmcVzI8Fk4ldNC9ixqRtT3wsGq0/33bJTKOlwI5
	Zx8ll+E0h6h4sauF0yF/+gZ2eUJGi7izHn9fFAk9OCJDkp+z7DOODXcPIIJL+3fMU6t3UvsMIBl
	sRJtNzXXjYwG96yJCK4P3RjoVVSZYhv6QTE85F7iM8cljlHrg5rRHAQ8m3bzuEFpruKMjCYlm0x
	BK2iZpGBHUdqn9k0LCYuTE5avlfUgtrXJB2rm2KTAQ8WEWFdnZUzd2yDEZdq5VfpMK/Ndi9YXIV
	WtKifO9pzSgMx7jqtv4R/0RJENTYQbbfNvfFr/aFnvPGtkgv2B1+uvOPmO0JoA1Xk0bkRp168Vv
	aMM1YioVRdJZcFrDaMyShJvy3DJRKXlvHYakAjgKbAmsQKH80k9uj2mbzgEz2zHTqO7BJeKb95A
	hjVW2N8af8OLG8lqx9g3JivotfE+0m4CsncQO164gbfAXuVfF2QLJIJnnrLjogqUMltgmZYW37y
	UQniRD8IDm1GpzvOkSUN9YuHGWZIQQ5GDYUJKOO5T0Klynvct8=
X-Received: by 2002:a17:90b:3ccb:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e1e24f9f4mr2820333a91.5.1789532772806;
        Tue, 15 Sep 2026 21:26:12 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b69c756sm2159085a91.3.2026.09.15.21.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:26:12 -0700 (PDT)
Message-ID: <dfdddb60-d150-4d8a-9393-feb2f3e32805@gmail.com>
Date: Wed, 16 Sep 2026 12:26:10 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, cwweng@nuvoton.com
References: <20260914110739.203479-1-cwweng.linux@gmail.com>
 <20260914110739.203479-3-cwweng.linux@gmail.com>
 <20260914111742.85BF01F000FF@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260914111742.85BF01F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/9/14 下午 07:17 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The driver relies on the bootloader-configured CLKPSC (prescaler) register but does not cache its value, which will cause incorrect period calculations after a system suspend/resume cycle.
> --
> 
> commit b9ac3c051c5908fe946a0ef1c7b809030aa32933
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> pwm: Add Nuvoton MA35D1 PWM controller support
> 
> This commit adds a generic PWM framework driver for the Nuvoton MA35D1 PWM
> controller. The initial driver supports 6 channels in up-counting,
> auto-reload, independent output, and period loading modes.
> 
>> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/pwm/pwm-ma35d1.c
> [ ... ]
>> +static u32 nuvoton_pwm_get_prescale(struct nuvoton_pwm *nvtpwm,
>> +				    unsigned int ch)
>> +{
>> +	return nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_CLKPSC(ch)) &
>> +	       MA35D1_PWM_CLKPSC_MASK;
>> +}
> 
> [Severity: Medium]
> Does reading the hardware register directly here make the driver vulnerable
> to hardware state loss during system suspend?
> 
> If the controller loses power during suspend, the clock prescaler register
> might reset to its default value. When the system resumes and a consumer
> subsequently calls into the apply callback, this function will return the
> reset value instead of the bootloader-configured value. This could result
> in drastically altered PWM output frequencies.
> 
> Would it be safer to cache the prescaler value during probe?
> 
> [ ... ]
>> +static struct platform_driver nuvoton_pwm_driver = {
>> +	.probe = nuvoton_pwm_probe,
>> +	.driver = {
>> +		.name = "nuvoton-pwm",
>> +		.of_match_table = nuvoton_pwm_of_match,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should this driver include PM callbacks to handle saving and restoring the
> hardware state?
> 
> Currently, there are no suspend/resume hooks provided. If the platform
> powers down the PWM domain during system suspend, the controller state
> will be lost upon resume and might not be appropriately reconfigured before
> the next state application.
> 

Hi,

Thanks for the review.

On MA35D1, the EPWM register context is retained across system suspend.
This includes CLKPSC as well as the other EPWM configuration registers
used by the driver.

Therefore, after resume, nuvoton_pwm_get_prescale() still reads the
same CLKPSC value that was present before suspend. The firmware-provided
prescaler value is not lost, so caching CLKPSC during probe would be
redundant.

For the same reason, suspend/resume callbacks are not required to save
and restore the EPWM register state on MA35D1.

So I don't think either of these issues requires a driver change.

Best regards,
Chi-Wen


