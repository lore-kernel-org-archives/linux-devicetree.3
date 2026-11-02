Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632901;
	b=0VBP1f/OT98JO/NimG5T8VtbjeO49bp1IdJVyVXcr/cxHkmSIszatDsnWpgt8C0xU8GN
	 d7ea8VwliDRkyJHUPtTsYEIoZSCqjhtvWZYXTnj1V7qSEDNJD0VuX7DA7sPmXjEMvuCFK
	 qmuWaSo2K6SP/ELpGe5k3KKttk8b5t86bML9M6Lol00Oq8+aHzXHV2TJd9HpjH9cQVIL4
	 2NjDAZixkr+xt2pIEvlMtu46o4OjmvkTGgK6keu16wjxTlMtzBH9yXmMzL5HWmdQPNAWL
	 hQZsVHhHxeGg2P+lbyCDw3P9gXjSUjeC2O8RO7V2HCGd4dBvL3tmFKOM8yCt2iwEzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
	b=hkAA1kD5oeWUQ1FSXAZ4hYmt0xQlDzftxDu/JDJB96UrQrej5TnGuIIc9aMz3i+CdLuU
	 wvplxEDj8o5SYUudloew49syRJsjny5YSE+YBLEKe6JWDdL7yTy6bGSm7EOq57HW6X1gm
	 /c7oTCHCAyomLtSombkm8ggPQiG9Oh28HlBc7gi76Ib+KjTHXX5iCaRFlVUtE5XKJPnky
	 IKkkiZzYJyVXj/XuKDbCpNBoR7EcOTUEWl/2cI70ZJjL5ySunxLMGIjOP0L6bj+m2jg8S
	 5wtJGW+xvUdvjpmL0CDFcZx+JFOq0EFje/kBmftU1s2vWxfecueP2iFA1C25XjWIInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67660C310A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D67660C310A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acd3105debso1858701fa.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793632899; x=1794237699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=uEVFVyOGIk0RY/9ot+HcRUWU+sMnWpraEVUWLacZqldj9h3U0yqpgZ8kfQ7KPPueqf
         aCOCbp1q9sXfE2ihFbP+tNydspojLemsi9rcrLRaqR9a4jKZTMsB7E1/nhUoQDghuXlv
         wJJv+wMQk+3a079G6WDqsoCPRPPQTf+bn7k+Xfj5LMRGo3yk3EPjJabwILude8er/7DA
         jJslthkiqcG4HH9l7AsQlttGor2TcJby6XW0y42sIYkkewlrLryHR3S7EFAQwNJ8iNBX
         /NuaRtuPTXDHQNJDiLUL2q5ilk0ruaESjpUoXU2c+1rzsm8Hz7dxao7XUsl7f6knc9GH
         gJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632899; x=1794237699;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=wB4TvHPsfpKmbVgZXCsvgS2n1Jjgd9uxQ0jCFs4g1tFEMEhiCpsKT4APiIRvQEZfOk
         FrhXc2pH/ZZoJUkp8PlJROLxWWGD4VSr9HO95vY7J/u43Gi9bC/Rv1oUAiOiVjNIWc2R
         EfwKBF8SkM/aSNyapbgx6Y6OmjsH3r7vEVd9UYqhAa3aSyCok4UTeJJWX1ZkYWejVCfq
         KDu/pOzGv4uRWPJNjhA8FViS6uX3PkBzehubkPisagg7yJ1QeWJbZl4rKL20OLTUUQJd
         IVaqSm92PZGdQ+11YqnNPYvJfuKjNjKAg7qPo2ZBJBoi46MT3YPP6V7InshHrhtcLXqc
         m8Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxVHgZB6we+A+rRByG+XGCyB4Xjoq3YRKeelIiLoqjjUczXL4gv/ABq0+20NndmP8bEoLe55YtKQ/kX@vger.kernel.org
X-Gm-Message-State: APuU4Z8qd+5LSxzMJyfIZl/mm5LN4kMsrlUV3zrnf+Nag9c/bWQlpFSf
	6iJ7ZjVP9Df63uDnzV9E994Fv80SCGIBY+s5XiqzA38EMsdJas6NYuVxyp3Skg/WamI=
X-Gm-Gg: AYBFou1J5ApYJ3LRR10xwfLB6DZY3MCX0iQ9rpV6yk507BjJB329EOco1P7PQWC0BtV
	OxJh9lTUZ1WGZJms+wG7uWguoEgIHEIqMMmw3DKpskkTji72tC59anUJxZi3r7WOeXRNeYulQoL
	g64NTa6NOcxYEp4x39xf3lwPU561bn4immGjMgqmHhdpwGUHZsRbXc/560vYv3Cu51WY1BLFTDX
	OBy6TcjmC3Y/6okrU7jfGqsPv+ZmU637Xd2qlpq7I3x5QsNjD6RLuPxx8rdk3gtG0HnMLaHkILq
	DBO/I0DQDFysqQqBq3tONbFrtkCtfh5BZnmU7ZCcIvRR53vd07NK33Cqrg946r8rIMVlP36M2kC
	d11o9ONWgaTRldXG2HjPKvIKkxqZgsGNuJjYAbR5qujQxj3zoelkwdPrKIJIYxyEuzD5lBf61bA
	cqSTgs2Scfug53nv0wGkfebVrtIvRj/NfAAnXVHgFsvZw0ZKk3Hz3PCgjUHFVDrrAc6MWUHkuWc
	dyeoVUm5Pjj8LxZ41zA72icIwelQao+yGPF1tzQSUjrl3KBDNSM/E2obZ8tM1SRihlrym22N/d2
	wN0sUA8eLdjcRLLqY2qsSU1pVXqeOhUu7smZmv+dRVn4+Yu7zReebWJHEj7L3jP1wdS4vmgpnzu
	ltz7pyA==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr3190968e87.4.1793632898656;
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm1724070e87.30.2026.11.02.07.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Message-ID: <7523d9ae-85ff-4e4e-ba52-dbe04c943534@linaro.org>
Date: Mon, 2 Nov 2026 17:21:37 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
 <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 14:22, Bryan O'Donoghue wrote:
> On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
>> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
>> of hardware version 2.2.0, add their resources.
>>
>> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
>> otherwise VFE receives the frame start event, but no data is written.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>>    1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index cf4687a20dba..9eeb7e4a7315 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>>    	},
>>    };
>>    
>> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
>> +	/* TPG0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg0" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG1 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg1" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG2 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg2" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +};
>> +
>>    static const struct camss_subdev_resources csid_res_sm8650[] = {
>>    	/* CSID0 */
>>    	{
>> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>>    	.version = CAMSS_8650,
>>    	.pd_name = "top",
>>    	.csiphy_res = csiphy_res_sm8650,
>> +	.tpg_res = tpg_res_sm8650,
>>    	.csid_res = csid_res_sm8650,
>>    	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>>    	.vfe_res = vfe_res_sm8650,
>>    	.icc_res = icc_res_sm8650,
>>    	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>>    	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
>> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>>    	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>>    	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>>    };
> 
> What happens if we apply patches 1-5 but not patch #6 i.e. if we have an
> old DTB ?

It's expected that nothing terrible will happen in runtime, and TPG registration
is skipped, since patch 2 from the series is on the list of the applied changes.

-- 
Best wishes,
Vladimir
