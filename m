Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B438E126
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721273; cv=none; b=nCrtAEoBWbR0MwzfpLm7XTcke9CtpZvH09qZP6C7ORAbj/Dnq7hKRPUxxMykK2Vnux+mHsT4yVH6+RpOalXjMwflIvLQm+Z3PNaeXlBBQC5Cs7DyNm2tGB4Tc/CmBGZ0yty2scpSvQXEuZuuZIhwluFHiSipFRLM/0hlIqZCj98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721273; c=relaxed/simple;
	bh=uzDOTI5KVAzWKNu0eBTWVl0dvaIek3tznA94L1LoMqA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K1Hv1LdfaysKJ1bwnWHjS0UF9xTtfQFl4HhOpi4cHBwtbYQCY3bru5/8OGJdjTlOY9+auA1EGDhbY8O1W+GVRHkJyt5g0suVmcqS5UaSJWMqgEjYPQdvaC3XvQ/7rByeTZutOxzlwzFfJytnepQcUrqfMzpsk3KS18x+uaJZDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=P8TRtR9Y; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="P8TRtR9Y"
Message-ID: <374d55f4-d6fe-4819-adea-cdf87f067e92@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789721262;
	bh=uzDOTI5KVAzWKNu0eBTWVl0dvaIek3tznA94L1LoMqA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=P8TRtR9Yde9QOQE4ih8DvAskLhk5y4qGQiFjytQGZ7ceAoA0LRl59r+IfEoDkIzeJ
	 /JM5hvKWdPhmEKfyRB7Je/urGx+vfFG3CKwRLdIQJuzeHNOXuT1eRO/2uhV1NiquJt
	 CQwDyPsvSpJHnBbQzzDqivLooWhZOAeGiMoyG10M=
Date: Fri, 18 Sep 2026 10:46:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v12 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 lee@kernel.org, conor+dt@kernel.org
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
 <20260917081118.835FA1F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260917081118.835FA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mfd: Incorrect writeable registers in VIM4 regmap config
> --
> 
> commit fc44329d7ee6d12a0077930b2632df3554d1e38f
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> mfd: khadas-mcu: Add support for VIM4 MCU variant
> 
> This commit adds support for the VIM4 MCU variant by refactoring the
> probe function to use per-variant values. It introduces a dedicated 
> regmap configuration for the VIM4 MCU, with its own volatile and 
> writeable register checks.
> 
>> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
>> index 0e74efe14f367..4b37e74e2b04a 100644
>> --- a/drivers/mfd/khadas-mcu.c
>> +++ b/drivers/mfd/khadas-mcu.c
> 
> [ ... ]
> 
>> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case KHADAS_MCU_VERSION_0_REG:
>> +	case KHADAS_MCU_VERSION_1_REG:
>> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
>> +		return false;
>> +	default:
>> +		return true;
> 
> [Severity: Low]
> Does this function omit multiple known read-only registers defined for the MCU,
> such as KHADAS_MCU_MAC_0_REG and KHADAS_MCU_USID_0_REG?
> 

Those registers does not exist on VIM4 MCU variant. So it's free to
ignore in my opinion.

-- 
Best regards,
Ronald
