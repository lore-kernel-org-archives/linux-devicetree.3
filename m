Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675C3A453D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878622; cv=none; b=rw9Gi5k62ujCoa2IJ1Cl84zjKE/d8xXz5ovORrM3zuZKlkvx79Tv3OD4yIqlnpx6OIvjrkhuXb8fgcVYB6ptF8sm2sgIyi4OZTJUtYZWn3NQt5UBrOEmRBCvkfDfDXudBo/nAmFUhVbptIzhI9B2IO1OJ9sCfpn1iA8BXLQUx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878622; c=relaxed/simple;
	bh=wJTaK/3MgbHLlTZwRsdexgzu5R+wd740pBhkmxsfW80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoKa/OpblSXJBo+A7YLkzPGWQQuWAGWN9Rl3Axd3Lh6pqvWS9/Oph9/F0REUi2wuZigHPLjXJL2YWtpjo8U0vmLADc4Qi4/KpyboE88wDs9GrzZcZC7Okwii4njkpxEGvFWUm/NUTElFxLwzsYLcm9ExwnRpPNykOIli+VcYHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeAdDotn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDRQSo2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeAdDotn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDRQSo2k"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7es43539604
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=; b=OeAdDotni+bpRsev
	+u/L+FkJAzyvZHwYMmcmELVFs7GWLn2Wvg45yNrQODKBfjl0wS32rrS50YB0ox21
	vVB6Mq5oJIOi+4K3wYJuTPkxbFV452xroWARsSYoLTw4AORVixwPYAJbPmUzepNq
	jGhaAJGe5XK3CGBQhubEe8r3pViA6KqvYxzp4lJoatsyL5Yl4uAwCL1k5qLvsG/o
	45BH4kXAkLaT8jBZ7a98cPhdb8CotIQDT9M80Mbz0KWVDoiuBlCq1OFys0FFPgpW
	En16TntWK9bp2BJVqv/ufNGVwvipGUxgpvlqazWYJa/jRooYyK4BMuAq+fPL5FqD
	z80qCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59ru8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:50:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so8583371cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774878617; x=1775483417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=;
        b=XDRQSo2kYyFR1nYRVLAhs5gy4OEU0C9cBR8g5WxkoXwaOeOCwS/tyX0Kuel+DTRMyU
         baXq39lmU+2FwkQPxfj7qoLJEH6QAhi5CMCq8POq66oX9DgGlfFZ0U/SGZDOT8plVoTv
         YrlI3zrQuGAC0/88Uk39LB1ZdU2VO1t2vQKDbiRM2VE22HFIHflTF5F28KZhk+iCEATv
         iRj+MdcP/YxMzLCG5MvDzeCTPEIr9BfdASwE+DSUYswdAjpnayd7yVk/jfJ8HjxJN2dg
         sAzB4Zj1PDuaBUh/tDDWeCiohfrvpzBVD1H1QJ22IlrPnhdhK6Kt86WoWCQ0PkjzrrSJ
         6gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878617; x=1775483417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=;
        b=LY1oLNl0mjRFUf7SnROJrRlBtEkMsBZLyavYXsO3elbBxOGq9Tr2Wc3Ju76NbeZv1N
         PZn+BUZ6ufgeP8/AgYhc2/JLLEep5lsPwlkwkknAkkrlF/IDKTnwJn5mw322wBACrlPE
         rwr8qJN2PK++Gu7L8tbXTZBrImd9yBaIuiXEFFxZg1iiDUb7Cl8uGEY6rbQ90MiQl4bR
         mxGJA532W7UZ0Sb3fnXKyk0I/Lv2VZGiEBn0FCBi0N5VBTHMtieeqevLyGD0+L0va8Yp
         EW0Cz1m5xHQSaphiV+/F2prwfwE+NNBooGSXNwLj+DWHGLlBvg89RgBC0SmPGSWS73gs
         nS6g==
X-Forwarded-Encrypted: i=1; AJvYcCWr7Y0RDkRm4KaP8y2HGCdbKoxDRgSeJE+7gtQPn/jixdhXm/hHHyzoqginObTmm6xXPvlDMk2kBp1P@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvOighA68ru2KCgFYyqjaXm2ENrNQN2raqbQyEHVKTaceLefu
	ksWN7E/Akq3073X6ow9YLG5gJOWYWT5onej0fhT4NmbRUMtTKXSABtLQPDkOvllUyJboOoZz0BI
	re9lxMHjcDg+t7bbXXrVt1uArfr9TkTRBfucFbqrKFOdwVzmcEGj3rzL/hWg+bHHI
X-Gm-Gg: ATEYQzxxCPKSOIQzF1C7Uxe0Ba9bZX17u99Jsz0nzioYhMU9EUtT+Kc/b+l/U0TbZ6w
	swXQWilImHqS1FTQJSO1jEoiarBqTwoyvPanYKsmRZxPA9D3CKyZSErx9l8bjDtmWVkVJLA8Ifi
	9JY1vJt/P/FRX1VujqvYKTRAKPfLPLbF2PLGgFQeaLRxrhj5PEX362K2IepFlKwAv1LZC2rKTMb
	h62zVJNyvlrTso6P8OGvAiI+KqTN27FJ1CQI586LXLLbKZNnsCz4JAx2HRFSrQvg/MBIS4wsJJh
	ziKbj8/rBx1z83qa+0qPtBammp3M80T1zjiw+8tNQ/MC8zQqb3HZfooPjNYFX85arALZcPTlJl6
	XD+phRjsDMWA4w5OvdfM+s8Cb94mmZmVXqIMw3t4kAbCtMEL953S5GnI9FJggjQ7EdDtE7qripw
	skuAU=
X-Received: by 2002:a05:622a:5a09:b0:50b:5286:f757 with SMTP id d75a77b69052e-50ba3949cddmr124616701cf.4.1774878617012;
        Mon, 30 Mar 2026 06:50:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5a09:b0:50b:5286:f757 with SMTP id d75a77b69052e-50ba3949cddmr124616411cf.4.1774878616485;
        Mon, 30 Mar 2026 06:50:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae520c2sm296630666b.21.2026.03.30.06.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:50:15 -0700 (PDT)
Message-ID: <1fcecede-16f0-4ce1-b76c-32f569cb5e41@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:50:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-4-mailingradian@gmail.com>
 <a3rrkgvkc4zxcq5oqvws23lyjy6dinlmfgp34wzguvdxdxig5f@25atyxc7zabm>
 <91af3fa3-85ba-44b8-8725-032f77c846de@oss.qualcomm.com>
 <lnumerwlyvmbdkwum64js46tbnvpxjrdrouhq3vybuwto4st3g@7xzr52e3samd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lnumerwlyvmbdkwum64js46tbnvpxjrdrouhq3vybuwto4st3g@7xzr52e3samd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bRJL-XFFtio1a64S6-3yM1yjx6HpdVCs
X-Proofpoint-GUID: bRJL-XFFtio1a64S6-3yM1yjx6HpdVCs
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca7f9a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=wnmJ5AHhSq1Bmg3ccEgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfX7bq3qHfU/oak
 1RbyYEsCh3E6bD3B9ShPGVnu2rpSLtYFC6aJ2IZspDE3oIBK5j9Ij7OZ0fzimbBugaEAWS9D/Ex
 z7XrN+qi91uXtN87mDVkf/7Tb3efr4M8jhyHin/WxMYxzAKN8STWwaaPFDdkD0QDTpBH64cKCeS
 gfiBDD3ejF3ZMTcAL5M1Tpbse9FKFPTQ6vnWm/1hkQwWBDxoO3hLICnKCwKhBVLOWS2Yyn5UVd7
 mo3cqj4Gvm09Bzhaoe9+Ed1YNsVSNjr316G9Zb/doWjSfj6Sn0A4hepNFbQvwI/6QDXfrLO1vyE
 04x1ssVaJ6cu5GQLITiVn9Fp1sP3a1LSTGc5Tm1FV2eG+S1AZ7iX7mI0xzhEUAVx0x7MFssGpog
 MH0HxTWjcidB7HpN4XS89j+vL+EOOYZY8k1R+2JPGGE215kHYzr/wmZy/KCMD6HWBHTx1uEynMb
 Ry/hsvfePhIZMYTI/zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300107

On 3/30/26 12:59 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 12:32:29PM +0200, Konrad Dybcio wrote:
>> On 3/29/26 12:44 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 27, 2026 at 09:40:40PM -0400, Richard Acayan wrote:
>>>> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
>>>> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
>>>> the first 6 CPUs are in the little cluster and the next 2 are in the big
>>>> cluster. Define the clusters in the match data and define the different
>>>> cluster configuration for SDM670.
>>>>
>>>> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
>>>> the cluster.
>>>>
>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>> ---
>>>>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
>>>>  1 file changed, 56 insertions(+), 13 deletions(-)
>>>>
>>>> +static const struct lmh_soc_data sdm670_lmh_data = {
>>>> +	.enable_algos = true,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct lmh_soc_data sdm845_lmh_data = {
>>>> +	.enable_algos = true,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>
>>> These tables made me wonder, can we determine this information from the
>>> DT? For example, by reading the qcom,freq-domain property. But...
>>>
>>>> +
>>>> +static const struct lmh_soc_data sm8150_lmh_data = {
>>>> +	.enable_algos = false,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>
>>> ... this might be problematic, unless this entry is broken. On SM8150 we
>>> have three freq domains, but up to now we were programming two clustern
>>> nodes. Of course it is possible to define that node_id is 0 for freq
>>> domain 0 and 1 for domains 1 and 2.
>>
>> The third cluster situation on 8150 is not super good - we e.g. only have
>> a single LMH irq that's shared between the big and prime cores. That
>> was fixed with later SoCs (which is why it's not wired up in the DT today)
> 
> Thanks!
> 
> Anyway, from your point of view, would it be better to define mappings
> in the driver (like it's done with this patch) or parse the DT?

Well, we can spend a lot of time trying to be smart about it and handle
the odd edge case, or add a simple comparison!

Konrad
