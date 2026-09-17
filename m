Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C913CD8BF
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678612; cv=none; b=ZuUczPNYEZgAfqon6qYWI1/0Dfy2xlBbB3ZLVF/gos73fvipSzXeG4l9DgBFEVdx6PIdB3U7tp9Jk2m19b2Z0T+ospedo71wUV4nfp/auyglHvMQlDi7/eVwNzslGaSrZE5kOCGpUZUQovDhwTq6/DM2C4C2H87Pde27y8RMjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678612; c=relaxed/simple;
	bh=D/cpHqVPtGZUVLRI7v02mDnLvMkXVMv5jnRoM2p9ZVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRFLWJYKP6iHgbb8DaIu7Ojc1wq+a6avKAvhF4oQ3MvYc7sXUEoSbLuk+3pln1lTmunrLMRhUdHqbhGGV7fFj5dCB+yRCA1kC6GD+jj6N2mWzOGzvOh0nPX4jk18h3R9zifT95kfHtXMSaQhwLr1R9JBiQptw/rvkSpwe/Ody34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQi7fywl; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQi7fywl"
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47cf5b09bf1so38619fac.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678609; x=1790283409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqcPQwYq5exU7gKmkOcg/sQ85WVoAlRW8Nng5r6wY2Q=;
        b=oQi7fywl/2Cd0r1oL/uyfhGGVRZOBgcTD8Ez0ctjlU4RK/2B2RRWswqg/+8R06JfwA
         cWgu19tjytopH6CiX8zhe1eZNUrHCfBpoLxbwDzokO39hewIaql6drkM90Tu68fxEjgq
         hedRRRfA9f2fF4C0IrYg7CvuPNsZgNk/BdTXMNlfWyb7ePLVFQQh3L44EyhkKSqxxzAF
         sPoFTwQzohXvmA4jPsbz7BesRZneeYiCTc4FRatj1CwxpD77N/451VDimmmM6/VjAbDs
         OYBwk0Z7qaTZ9rm09BLAVZfcMOQu+i60eZIvcNa7ktQkUFyD4A1AAIWg6TTslpZOmqb7
         ZgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678609; x=1790283409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqcPQwYq5exU7gKmkOcg/sQ85WVoAlRW8Nng5r6wY2Q=;
        b=iUx5cGBTIztBYw1Kj9rR+NmcE9x47bk97NmjV43Mqh3EcOlRHLqOmuHBrfBDnssDNN
         /xZuqk+JwCv2dAwkt4g2/OS7i2SeZ/JPdznyjoQ4V1+OGETXPXkNfllhqRbvETZ1kNeH
         oaQ6pynL8XtKfBmaW1AqMJfRS5xpGOPT2zL+l+kLofk7+pXiRDB6cty8/XJrchVZoJXq
         z3fumq2jsEa7twHsmvLLcVeJZcCDWwbdCNcvFg6wB4TYBsffyDWbMV4A7m6NxIC0HDsY
         AOBooM95UYVbz//OXQLEMeYabtHZA5zbrbyPJ3pnzlglwz2fHVOsG8Tq1rnYVta9kE/h
         0O1g==
X-Forwarded-Encrypted: i=1; AKwUvBzdFJtDxCbwRsjhNDiDUBgix0fxLe970Zbg1M2s7vsXASqfyU9GR6ha/dZaC/spaocMGyuFAvowVyhb@vger.kernel.org
X-Gm-Message-State: AFuF++msEaH+Er/iLyRq2W6cEYfDio4ccIxNBAwAVbwoN7GEwe9y1bd8
	aYsxobYVK1URYfCFlUyUy7K34gm9B7Hq5lFADIcSPZJkD/rYcpbjd8n7
X-Gm-Gg: AYBFou21lzuK/jmwOemlE95TNMNQxk3mUUyMwi3kQhoz6ZbaUHFWuGH27Ychb8n0Q2v
	7ZaYhLoA3rG3cgHLmhu4Qd0ObITBqHekthpVqmgt+wmnIegn9l0JU00NNiukBxNi3PGen0UfwXQ
	VdCg/6rKIjRiO7Nfe2SQkvVKTaiKBPm7qcagW0tviK3HN/8bButMTMNJVTY4ychMK0poOEbdeDR
	+8RjGDgr/WEdCWjgj6/3zcr0BNUvRnh8nyuyonKAgvVoKMcLBVSIXulYX1QVEUtfhNt42VBw6pQ
	c83MjEwOE70QJw2NNw9iSmA+vditPZ3yz3riu0rBXTMtPYIl05IfCJh1ff1qdRs2lo7qgsu6rTv
	cLDdsODTfd5++vR3qs6XWAYKP+64/AL780oMjDc7BswU1jfl7Sei668C7TW97bl6QTekLgwxsY3
	SeqAtmSgAgHO3mAEsK8ulg8VQ8HFDnKKJwA2I6cyrK5CuNy8W2/lEUBnJNcHXXaF+G+wzZbD+Bb
	2Z3vhvO98XLl14=
X-Received: by 2002:a05:6820:16a6:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6ca9a22b45bmr268813eaf.1.1789678609442;
        Thu, 17 Sep 2026 13:56:49 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ac360590sm873135fac.17.2026.09.17.13.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:56:48 -0700 (PDT)
Message-ID: <b573c7fc-61e1-4112-8ff6-078aa72e755e@gmail.com>
Date: Thu, 17 Sep 2026 15:56:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mfd@lists.linux.dev
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
 <20260916042448.A40941F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260916042448.A40941F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 11:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] iio: mt6397-auxadc: hardware state leak on error paths
> --
>
> commit e17dd59587f106380c3ede8aa27c118b33350f88
> Author: Ryan Brue <ryanbrue.dev@gmail.com>
>
> mfd: mt6397-core: Add mt6397 AUXADC support
>
> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
>
>> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
>> index 9ec9519965887..5d5f816492aaa 100644
>> --- a/drivers/mfd/mt6397-core.c
>> +++ b/drivers/mfd/mt6397-core.c
>> @@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
>>   
>>   static const struct mfd_cell mt6397_devs[] = {
>>   	{
>> +		.name = "mt6397-auxadc",
>> +		.of_compatible = "mediatek,mt6397-auxadc",
> [Severity: Medium]
> Enabling this device exposes a hardware state leak on error paths in the
> mt6397-auxadc driver.
>
> In mt6397_auxadc_isense_enable(), if the second regmap write fails, does the
> function return without unwinding the first write, leaving
> MT6397_CHR_CON16_ADCIN_VSEN_EN incorrectly enabled?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_enable() {
>      ...
> 	ret = regmap_update_bits(map, MT6397_CHR_CON16,
> 				 MT6397_CHR_CON16_ADCIN_SEL,
> 				 MT6397_CHR_CON16_ADCIN_VSEN_EN);
> 	if (ret)
> 		return ret;
>
> 	return regmap_set_bits(map, MT6397_AUXADC_CON14,
> 			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> }
>
> Similarly, during teardown in mt6397_auxadc_isense_disable(), the use of the
> ?: operator short-circuits the sequence.
>
> If the first regmap_clear_bits() fails, will it abandon the cleanup and skip
> disabling MT6397_CHR_CON16_ADCIN_SEL?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_disable() {
>      ...
> 	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
> 				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
>
> 	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
> 					MT6397_CHR_CON16_ADCIN_SEL);
> }
>
> A similar issue appears in mt6397_auxadc_battemp_bias().
>
> Does this function lack a rollback path if the second or third regmap
> operation fails, permanently leaking previously modified register states?
>
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_battemp_bias() {
>      ...
> 	if (on) {
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_ON);
> 		if (ret)
> 			return ret;
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_B);
> 		if (ret)
> 			return ret;
> 		return regmap_set_bits(map, MT6397_CHR_CON7,
> 				       MT6397_CHR_CON7_BATON_TDET_EN);
> 	}
>      ...
> }
Good find, exiting early could leave the select bits set on CON14, or 
the battery detect bias current or input buffer on in CON0/CON7. Will be 
fixed in v2.
