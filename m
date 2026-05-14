Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B0371CEA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762228; cv=none; b=nOFFJODQ04iZLWmoDftXQLjKRAL5WCyyhZtmoOKm1rGrRe/xgQuz27cSOWt5mfS7k3tauO6O15mEdvabXbupFdnthD8ravq3cK9x7o9I3hAKVfZGZoc5V1R4B/Vmb2NQN2Og0nopiVMVBFF+dRWc9mPl14yHaIlZ4PM5erfqJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762228; c=relaxed/simple;
	bh=u1axG9TUbf6ZyYlZk8WsNItpw5u5vFUCI5cvB4d7S7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9wPhylPWK02pSN5WfpIsB63aJIfuFIvWEjJBN0FT5k2x4PXVTO5QjEI2+wrQFoO8UYGyvN/gYJD1LHDJX8U1M2hnWhlU7yzC1PpCHXCq5QUREEvT+vNxrF916mylzcGOCUSvefH/Wcw9lsw2NhNlhR3fOGefIb8HnsPE7waqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6BClnKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hywr2G3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6BClnKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hywr2G3V"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWtp889438
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=; b=o6BClnKN8yNiDEuw
	15R/KC3bxZmX/hC1mXf1z8Dh5s6PM4cmyZrMI4iFZdld2n/t/5ip0XnoJe7IK0GX
	/Ped4LO/MlD30gfNsw3sartjimlpcsF4riH0Ci+x5i609eZ2gLU/7gzp6XqdrY12
	OhZcHgp99BhB8V3uf5PZJUXiUzlKJrJocWX6yVIIXBOatCb49LMnlNL76iv/n+WR
	V8URCkO75sWKLzekMwaXkX/zuA62A5SJm+AWg+JvagfgMIfH7xFoyVQ1X2UOw0NT
	gVZ+lm8GbvFZ9q/n31hEYFfyMkV371Op1xqqTgnwDHV7Kt5VMeMAk2fo4zTYT4NH
	zJf+Qw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjktvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:37:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313443ffa2so545891137.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762224; x=1779367024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=hywr2G3VkG2ELzuTSa47q7jklWjPPkV3IZL9JYJRVzeqyKQJwUHLelk9Or0NKAWxpQ
         KUOHAkDnbUNBFj503HEj44LAcJKo+5t/991fSY5aEWI7ETyF71UzcBTqSRRXYFUBPiZO
         5uNxsDAXxJhTY+Q7bByoaKbeFy+I5Wfrwl9p7c0oPlIOemwTZxLXoH6jUQv5kvN+cne5
         uUJAtmJEVb4e9EZaFxkrhaL2/bXPlGAHMbEfeLVBTlTOfwlzN7XNfkcwC+Q1Ur5tvizQ
         wV+rc0U5YLLrs9Vgs4Y3+fGYeAspKkmm5lUroy6HpNfrDt1rUK3yF275tXLLCg3OHiPA
         domA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762224; x=1779367024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=lpJ4kIIRf1yayYiDfhNoGOSqDSxqlb+WhNoNw8aHVLlzowpUMVLmrQThgzL03wNYpO
         XCVeV+2n434Qo/aPe/qVV+PQmhyDhlAcLKdZ6I3j7hPfRDKVdiHc5VbP5J8GQip6v+XT
         2cQBVc1ezqF05cOMe9nmpO6tsot6W7QDKy5OFxnQ9NAm/vluGJt4hJ2zcNgvdbvLMpfU
         yxVusouBFcD+g5fi66WLHCKe9dttyLrbU4i/e3Q/Lr7WSouKyVH3Vggyfza9kbBQk8gf
         DN4DQrQTrdxb+E6Vbg/ul7VejGQ8kWJS0b5uOx5za8jNkaPZ3kMdkkYM/j7JB6A/MfRg
         qcrg==
X-Forwarded-Encrypted: i=1; AFNElJ/x4Cdj+ne6HlGwWIgWnCplh4Q8393Jj9PO5tnv4cVM8uK8EmKA0lKUgKcv2A8VGf1f/5hh65szx/ZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlluBDCVysDHx8E188EHg/S/mM9LDzp0WQSNykUxCUCX942vM
	RxsN23y0yz2QaeLlKEQfrWLwUCE7w/P9sQ9L5QNQ4TaxjCqacgLvaEjc4spZ2w8YTva+Y1BUWzV
	Z67NyM7SbHbxQvS8BqWN4h/zjh2I0iDKf+c+z8H2oRFEvkkBA/8Sp7BsdDMhWxqs2
X-Gm-Gg: Acq92OF6kPXeZrA5Oe9muzb0jc6TCwOeDV1dz8enXFzmdF27K3T+wVkbWU+iq36jZbB
	2PcnqEnFu8f4iMLvCshlGvbpBMd54NvAs9keIavBeW/E/HOUQr4ccpYkYDLDfN+wQATd/bTQgel
	zxTqFV+85mqCK3HpkTnpkczANJIv6kvLacl2b8s/sBocZbRe9fHQrt/ZuPg42bRz/8z+/UIqNgB
	ea8uI0fFkt/QVm32R2J/XHuUe+appd8N0RcflXQ5IqdgyCYLfUvIT5/c+Gv//bTntKkZHw+y4kV
	6/ZHtDReER44QS1FZhwJvlxYG+xsTNWQ9nncNwxhFjYHv6niJGPbHUY3R5SCG+1uTOTOH+woUj+
	/QxiAhwJChJpX/sxH2L/JrvjsMw5W0uP1WRfQyBjFUijCKQ8BCoTRJpnyY/xyuGnzi3TRUNsIrd
	Dp8S4=
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125957137.8.1778762224454;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125947137.8.1778762224031;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:03 -0700 (PDT)
Message-ID: <6efb980a-1d88-4d22-9ed3-1cb420317b71@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:36:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w4ExloYm8mKIvPRUP6tnCzJOe25Vtfo8
X-Proofpoint-ORIG-GUID: w4ExloYm8mKIvPRUP6tnCzJOe25Vtfo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfXx71flbmOiS75
 EGwwq0gwBWL+X4TCiE6vsd8yjTayatrKDVUXDBYRLdfIuOAbKEj7KinseWdRBL4sfypPAg9AMaH
 XjcO0cQMZETarq5XJEoAG9b3rG/gMsOwdK2qlHfnh37etg0wguhS46GyOhRN74CpAkX0umn+8bK
 XkBNiprT4bTknFqCM8yTB8kLIRBJp9NsB6Ndk8Y9iZDYiuF+REZv79N+olPT2jwrjdrmRdhbxj3
 ikyoWlGrIXoc/X8s8Rza1Wf53LkR38vl54PnhJ/NdWscnRpvbcYa6fSZFH9blth1C1mp4sU0gju
 R5y3gD9E9un0prFOgMKLiIkjE8tVzFpueq9rDQRxnfAPy6uEYgt2oc379S31aNMNAIdjpQxBDQ9
 nEew8WUn4kZibrPrfa619DmIky4f1nf1PkZWY1YVFXqzABEUzXTwUp8imKXEIV79HhlS5NxVnAv
 qPhca3T5R9+NgX6AwTw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05c1f1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
