Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26669357CFE
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705510; cv=none; b=MMZe+eZoetsk4d3mWgnwq6HEf5h0NQfcHy/8aIVeuPOs0w1UmzFRMd+FtdwEJiegBp1Kmr2uz8HmC7u+Jq6KLLYSdFQLBZFMeAO/+/LSFR8UwCpebVUvAR7eFPQQnYi/zk7q13L2q8KHgr7cgnaS+usYWHu//SVdea1gdIsPTec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705510; c=relaxed/simple;
	bh=YSz8kgUpzc5nXAU4kAzKN2Q06f9VZ7HLu7NW7kG1/SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndC+s5rMyUGCZU0yWc15W3I5YcFDriS5m2PyQZLVK5ieGslHpa9d4UjKLMGhcKanSMLaRi3RD2QHeaqd6Xe4zAZrcT7bGYy10GAuiJDO0mDPozO6cIZQFCRlhStZzn+lw2EcS+VhlnWowrkcPMf/GpsnY/NncU+X9nguuKVTl2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsNHIcq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFYoLbAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsNHIcq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFYoLbAA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6WX4x1098010
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=; b=IsNHIcq+AVy807g4
	XXmfIHyW5BPrLDfl3RunYSkoLFhWFVmhUyUjDQMmN7oIU9RlCgo27AgeyyH5uQ7S
	08WfMHu+tyOkeqnugJ7DWyNG7nqsqgDIxtmF9GtIfEogAXCG7XZnV/KJ5Ig+pOWW
	iE+70dCBAAruiUWSyKhB6Sni0SaQNKLa+v5XlJdq/z7XjwyQCV0AUUeY9KMfJPIB
	gLSwp8S7/zVs7nmEUir1OFAKDGqikMwndVRsVzvtCXKCLYjbIH8t7XaawHc3NAex
	gbJdbg/zliCPv7dKXOQvsN9G5WMggLfMWIXN/Pyfhy1v2VRvtS8wcrsh03Fq7ahQ
	w2gM+A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxaw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828ab3b033so12449624a12.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705507; x=1780310307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=VFYoLbAAVOtLMENrV+0Xrqng7UvWw4p7DGHIiRmwu/4NvoNop9uCCYBOJGxzH6+VRs
         LclKQcPTFpfir1ErJw1R1+pyBWmPxkPLPUG7n8Jvg/lwRA+n/5lcFwGKqPURaQYPYbyn
         rCcfWkxXXwE7QXsvvkGtaDxhHOH+r4BpTtypcu1IpVArQu6ZYzJ1TrJReJ9krWwAGCpN
         Kq8AnzmrKwLMSVdmRajDLxvIXivV7EyzmekoeKU4txwnixsoXFPGAmU9WO/VdqBkt/9f
         33lwPHZ6nKoKR3N27zh8ykYhQBmiN0/DftBVQhkG6GVxeq0l0ocZAeonIVzAxp1iqdyp
         wCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705507; x=1780310307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=k4kWMd2D7JCBTCr++4BTzIayYRWnUSz+7tmCpzeLLaxhlcTz6crHCImgHu+uXASwY8
         DUbNq29PjPoUu0IYiYQUJffacWAd1BhdPIK7Medn6n1oGQsYGZJfIZQ7ndvVMcRKEcNU
         nCz9ssGAbbcGplhQMmTWrNGdgkuBhKJsCcw/kCEFbUSZND/TC8w5ENbdzuDpQDE00mKh
         xdLq6uWfUWPS9hTT4C5IWeLTqwtQ6Lu2ukLFCgDKZbKiSw3sAy6Ji/O+j3/osELRZnKt
         ESqwYbbsQroDNQ+ffGkPuKCITIgpbH0owR9sZjwxrGSxcdTMM17QHk+cSHIhGg1koJOc
         /H2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lDVvmBh/YWNBzCnfvN1KtC8eMmrQcvlO20Edz+BHaZVVrYbQL01V0IMjmSE0GJsEyREKlYqQP5QUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxSnupkmNZKl4Cj0LU2v6qKoCaHc8VsZcjatTNKGuDdRvVJZf5j
	xEfo97a15Lt461325er6V5MNXhoGqb6JGV4C+wpyQU+duwA6aEkt0x0o7Y7tdOiAZnMMD7JOWjt
	cGnknVkno398DtIroX8xZ5mA2cfn9MLgVC9S8i7sUcC2lYjcL8V6FXoZ0UFPclJLf
X-Gm-Gg: Acq92OGqEqe02Zz4SARSmN9wVJGoIAX3Y2Lblir2xl0ugKUsZ2DMsJiF6744uPPs4Qp
	AHI7nI1E/Y08snTjeI7LwLGbVdwwJ5/o1kY62UGrahO8v5zSbpOr3SGVP03b8yGebUfvxRoF3J4
	d9mkbtO+BsvUk0Ts2EOJKg2l9uLaezDCEnqUtdHt/Mnfag5JDO+TSE3yi4uzwUAFtgdvgM0YpaT
	R/nnj9UMxgwOTBvxFk0TdSLt1YbZkU1hYdzhivF0fc3XPKDd5Q2ZTssOmL1wfaDkA9hlEAnYffC
	ZyoQ7QYF8YmzrjF0rSDtQEP05jo5jImvRI4qXnZA2mxHbiuTYIEYm65osZnd5J258xuDaAoRaLT
	g3wNuDxx4Fvib/GqNLv4G4m/lL6uWmT7uiWg25xp3UWNDeYMz/HCDeyUFzss=
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349724637.47.1779705506604;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349682637.47.1779705506118;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164affc22sm9242136b3a.21.2026.05.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:38:25 -0700 (PDT)
Message-ID: <d4473a79-0629-4a62-bb59-a7b7a917594b@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:08:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOCBTYWx0ZWRfX/OGbLbwatQYk
 XGZSEMyrpyUt4NrK3G8MfsS6BSPzVVcBY9fL9yYWXdt5c4I5iHnzrDHRa8npZBcg11cnhFRCRcf
 XLX04R7aW89Otu3Lj5qDSbgZ3F9omLS+vKWiUWpHOFWZCDHTLV5fmju9S2QpuZC6amaWbwlvoZC
 vcs1dCEAQh3CfRLIEbDZX/f+NFFMgmZ6SqAQqSkHicVMtc32eK9voO1bosERivG8++JdIUNgjql
 O8xDyhYLRv9t1Mx3nBje4I+PixOs/G8vRsRj+svsQmY9J2C0qh0XGz1v9iwdgVwQ4c5V3/dv6hO
 IRsaqX1VirZhl9btpEgpEAxHMktBFZa0QYmPOAp2KmEsf82yM/4abTaTL8Q5GrVBQBGadioggKG
 +JU00XgwUCeuEO10t9xU70Fy5r4BLxwKTvXmyYt4kFNNNSdUXyNoJT2OSYlcVo0bLE2EgXH1bZb
 UFKSHv7awrWRuN+0kRw==
X-Proofpoint-ORIG-GUID: Q-ZWwHF-6RcsngvkR3rh2n5PW2Gl8Zah
X-Proofpoint-GUID: Q-ZWwHF-6RcsngvkR3rh2n5PW2Gl8Zah
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1426a3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=plRfSYbjXIbEfgUgcesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250108



On 5/25/2026 3:26 PM, Erikas Bitovtas wrote:
> 
> 
> On 5/25/26 8:51 AM, Taniya Das wrote:
>>
>>
>> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>>       .halt_reg = 0x4c02c,
>>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>> please use .halt_check = BRANCH_HALT
>>>>
>>> If I do that, the clock fails to power on on boot.
>>> [   20.324488] ------------[ cut here ]------------
>>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
>>
>>
>> I am hoping the Venus driver has enabled the GDSC before requesting the
>> clock enable.
>>
> It does. From 3/9:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			pm_runtime_put_sync(pd_dev);
> +			goto err;
> +		}
> +	}
> 
>  static void core_put_v1(struct venus_core *core)
> @@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
> int on)
>  {
>  	int ret = 0;
> 
> -	if (on == POWER_ON)
> +	if (on == POWER_ON) {
> +		ret = vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
>  		ret = core_clks_enable(core);
> -	else
> +		if (ret)
> +			goto fail_pmdomains;
> +
> +		if (!core->res->vcodec_pmdomains)
> +			return 0;
> +
> +		ret = vcodec_clks_enable(core, core->vcodec_clks);
> +		if (ret)
> +			goto fail_core_clks;
> +


Please check this sequence is taken care or not

Power-up/Boot-up
1. Enable GDSC
2. Enable clocks
3. Request GDSC to HW control via 'dev_pm_genpd_set_hwmode', true

Power-Down
4. Request GDSC to SW control via 'dev_pm_genpd_set_hwmode', false
5. Disable clocks
6. Disable GDSC

-- 
Thanks,
Taniya Das

