Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA553D646D
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836802; cv=none; b=TvD2SSCAGh4K3DNu2s7Xu9p+CysRZAswPPG/y0/gLnaDIcnTJOre23sMtvUoo74LcYQy5GDTKeG3zdbNnplKC637PU7OwD2qCPwXgFHnMtEMb9jilf41y0+PuZEEF001k6Uv8kAsMVmtInPSyyGbpkOjJS88Zf2AyzfeZ16ChYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836802; c=relaxed/simple;
	bh=RCnxFa+yI5Y9Xy4053kfK+km7U3a/gFtswsMRuExpyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrooFQLIfGRx7kVIbxh2bLHTTeSj8q1k9Lj7e1lFmhY4NnG/Mr4wTsq6OSRWjWujjl5jJ8vUskX+rSBVxXVKm65w/JHe8rOjM7ZqvGZiNmkCUju1VFZntOc45avh7sQzDgjBXqR1Rwz/gHrf+t5DgXkGyrhtBx+111/0NgBNqbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZAND3AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbaMssZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZAND3AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbaMssZj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4o9Hw1847946
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=; b=NZAND3AWTQ096osm
	qGmaAQmSJq/9kjCw3HDKjc5laOZsbeOdIbvrAo+YMxpO85bqSJ2/bzXHw0DpxtRa
	ukXqut+TATrwgwKxMzjVE8Fx8MFI4NhBZVksV/iHPBYeGsl4FGn2MctWNWXGUv6/
	5YrOKYy6B7jdXKw4C05Hw+zWQ+xwtRi+9sNQuFjF98pM/RCyGLfq03HGT2Q+kXPp
	ro4HSFfWkHVW9o8sb471XMHrOpkOp8shez+QNInD1j4Jh2EnLxCoJB0MibODp3Rj
	3Y0YqCjMXrXUSf8fcFt7+KoHV5qPV4EW1HU4hV8+A+RetMwsBbdD8BDRgaUMW6Wt
	/3Ytyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2j2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:19:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb0b93e90so18895691cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836799; x=1779441599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=;
        b=RbaMssZjURwH1w45i4k5u0LrTVWXbpC7ZknW1vQXh+g+kfmW8l5Bb12DOHD/ANSf7b
         m0DScaJmQg/1DwVIKUJT+9kS0IgblwyE7zAHoIQICOEnNuoxuXCNAwfqiz+dqTAKk2Am
         tiQ9urboFU9Y7Y/0ULzDQPWgHLQVhmyQ3iZqxdZ8SI0SAFMAaxUmvKc7cBF5dbm3yq/k
         6Yf8mE//FrfCNifSoX+Yz3PXb5o36PHnpShYD+2R+x2lBW30KIskEX3ucc0iGbaV+DhR
         +gSFfPlljfRc3rcv4o1gEpTNR6htzQ01FnyWME47GetgK3afa4+xu2wQtwZfLA0ySjz+
         Nv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836799; x=1779441599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=;
        b=Pl1THqSbiwquYI5D5KS832S+IEiHzp6ozV0mCYa6ajwMGhCYahKCig6JHvzcP7iQnE
         kBvHud1+yBMGYZN9GcQ1T5MLIgnYVCARW3jSmujyVxn2xFdd2nfNBU/Gf0pHf3Ippk0u
         ZsoH/xGyye4q4u5BpIbctcsxdyq+kGc1ukLPZJJNAnyZrUDJEsoDR46hnbokhHCer/ix
         wp9nvp1I3KtGr2y24st+4aY8WYNFyVsNSia7WwODgcXcXGTQeggI3wANXTu8TIxDSkGr
         O+FH+hSUcvhndnCfTwZpcolZHL3dxH4zcGhkzM0Ek+odFy+sXAr6PgxwYHJegZQyQapk
         0TCg==
X-Forwarded-Encrypted: i=1; AFNElJ/Wr0aI0zB4it0kZZyK/5L8RsUhMpv6/2vjxNtB2FrxqGBawuFQ8LG623pW9EGEOa5VlDwvdsTUcIfe@vger.kernel.org
X-Gm-Message-State: AOJu0YyGncMOBBn8EuRzy7QaqoYyWKSqvcbSI4KnAozM4j2Ygun7jOuD
	vl3w6P3jnQGmCktcmsAXNZOgq3Qi5kRLguUT8qj48uxXmIRG0unB0xoxHCWL2uNouSx4KKBSoBo
	pmkEjcfCy409RjnaZbDuxrLAK75dBC6ADObna/ChvfWnPoXbwfnZPAnRarqXiEVBd
X-Gm-Gg: Acq92OH/KwvPvvzNTJPxr1WbWof9MucurClKVTs8Zl+xD4WqrlHywug8biscnkcFqPP
	TEnx/SEYKr5s/Pd9PMQM8HPxow9BhVOdTTp7megPRl6RyIvUAa8zBc4bgddKT4d/jsHnW++Jfly
	1oZc0cwWPNK5SsnMgv8BgQI9sROi8nPIqHKjxYYNVGDCJwPRHM49rC7JgXL4RtatGciZas1d6tS
	lEaAHA+NvISXPOR2twPNvKuYiqnnC9fVXbZO3aWzNTDCSv9NakD8URFxx6RhoucfV4knWAlHXbQ
	NRysy3a9Sft+9vjx68yvl7oy+bF3pI5Xl2wMVnGPGFeafBhtDYCwFpSvw7YKwwfrg5rRK3tTVHr
	ToXiKqZr9K2f4s8mCNfPRN5W1vAmAB9UHRMyf0gXLJ4cGNFIUpBNZDe30eEUWuXdWB35QrnyLvB
	j09jE=
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr30234461cf.6.1778836798664;
        Fri, 15 May 2026 02:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr30234191cf.6.1778836798206;
        Fri, 15 May 2026 02:19:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e800sm1842166a12.6.2026.05.15.02.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:19:56 -0700 (PDT)
Message-ID: <c898b619-676e-4385-a69f-cd1e6dc2f9bf@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:19:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-2-c78b95f53b91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-shikra-cpufreq-scaling-v1-2-c78b95f53b91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06e53f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4ielwApaMtWjWprE9YYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfX1Afxwd4B0jq+
 1NRvONGF2S6otNGATsO+lPxWzxN2B2XvmLwJR+M8VUbm8yide+8L2Ohrpe45AzPXxYHP3OfFKuh
 VLwnk2vSXMxzhxnRIdVo7CxOW2ZvZDbYnC+JFiTtkymLvQR67bKUiJu6CdH8N9IBDabvx+H3FUB
 Oymmx1cSi9lKhMoC5q/Yo142QYHrauy51tM6+3A+TnFEWAXZY0j19R/IY4YPdr9KuJjuq+7j4Ot
 O+VpLEQAWIAhHFGT3XRfxcJJ/RBOeWIAQbqTx9oqPoxR0Ouz17TiUnnVVjMEgujgQWV8lKvCtR5
 JYWptR/CKR5rrYnYXmL0WCvzfSNCUoy1M2nre9MNY7KFblmrghlnaa1PPL1HUlKZI1rCdzCRaOF
 yvdIpvAy1x6XpKkkhyu5STzON8qxMf+R8gcWZFhpWVpYlQ2U+TeNQJOKBCB/BoYE4CduD55IUX3
 pwyft2whbUEBTqahRHA==
X-Proofpoint-ORIG-GUID: 7z11Gho-kXRZ3nw3DP9Xxw4ZPORpKuA0
X-Proofpoint-GUID: 7z11Gho-kXRZ3nw3DP9Xxw4ZPORpKuA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150093

On 5/1/26 9:15 AM, Imran Shaik wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
> add epss_lite_soc_data that reuses EPSS configuration with the appropriate
> LUT entries limit.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
