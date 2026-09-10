Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D4049C4DC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048263; cv=none; b=ZU1wIZmYcwbcEkNnYtwPgXMxx/cPFsWGPSoWOElXn+36J+cb0R4tY8fZd4vr8xGaSxeOoWx31W2ZpM1lAMZ6tUcS1npcLsiJ62tT1YB5r+3CYCb+c8/T8AJsLCbyh27hcfRXqKk+y9XKTb2XGw+qbL4r8Fh/8/BEvDgQNUTvp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048263; c=relaxed/simple;
	bh=lrHkqTeo7uD619vM07k5lHCSbLgFJ5tG9eHMHhzaDQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDMh2FplN5v8iBVf/0bOm75EOBUTD84FS3+dhQONdy/DUfKwlvSwMWMClow76u35E0OSx7XBAdHRgaUdCTFffmKDSpUxnzeUR9i4qucrKGppTLfV1DMcKqtTtOU1JQlp6UJANgGbIAu5vW73+ytj5Nn90V8XBNPWUGdwcJcqqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZtfKN/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ou2g2flJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZtfKN/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ou2g2flJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7akW3893069
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=; b=JZtfKN/VAeG1gUUt
	xrr9OspZ8ehqwBjMCh5BD/mSbIGdf1ZQ8CB+94ewwhW/R28W4Iu1fSVPmT6IOof0
	iR2k8hknngnSXx3MwgxeW0dHJPPndrf8iYvICtMGk3Y6gWClLHsN3+pA6Hz/iQek
	HQVv1icAvn5eCPJBlq7jsYqqrblStHJBQ1UvUlgqRlfrScUHxxDSsRDxIqsuJiZG
	ki708fbxIXFZFqqJOOSTnHtPuZNLNebp3kM8XT2QSXEUHDlHwAjIPdPCIMnWD/N6
	eK+MjIHlowF0SSVCtLcBbi9sDnrW+Jnay2JMA5rEmrXjtds2U9ioQxuBHfjXTke7
	H64OKQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8s4ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-853d0d87123so3506003b3a.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789048259; x=1789653059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=Ou2g2flJ0gma5b1NtDrqmxEP8FBBvOVYGTq99xLEGg8h1Nog4pmDPdDB6w2Ex9JZLl
         hO1tFDQT//n8ypS9fnhrtr5CAY9ZJzAtKxnw+kwTCPcihCR7a4ugSrtFOKzRMpcaZo1m
         qWShAiHwuU3yOjU1TpnPD1VILU+z5FFpqmkfEd2yXfEkdDvxNl8/XOZtCwgVlx9GTc7Q
         1C9nJlXIGyB1GPLHF5xjRaRUq+pkwrE9C8ANm4rlV6mnBcpD7Ov8GnSKVQTUtqBx6bEk
         /hxvm2Eu3ZVUmrojyHCRnOTJMNwym3avdFy2liYPsjMQj7OGG9uIljHArkSnqlB5LIM0
         2l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048259; x=1789653059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=YBPgI5WnmWYsLR5vSs5gT7puJ7AS7HstXatyaYSqz6pAh6hqDkPre4ieOhEFVgjswv
         8EXv9wT3IuLmMhloiNtwJE8gmLAm2curljCLR8Rkt+K2ezl6476LanqjPG4P+2I83AD7
         gbGfeqOAON+f6LfvHGZF7cVbXwh1xBYjG5r7bLIFmDGvbPDHGFnlO74x2omlt1Nyu8wd
         Jg1uy+bZuAK9q9XZa2gatcDc4h2juarmGG//bH+UJx1DnyBfjQn2p7/539KTa0gOnlXz
         Vm+sFC4Nxhm1ZhNreIFAWWKJZtQCYhJ87VV3jfTEXJ5hy2e+XT0TJr6bwNAegiR5AfOO
         zLQw==
X-Forwarded-Encrypted: i=1; AKwUvBzviy4OtRg+A8R3TwExBfwv8+RdT/lOw251GhwxxUbRutVsNmZMbmr1fRFhvWtYvEDHHyXOTLHHIeLy@vger.kernel.org
X-Gm-Message-State: AFuF++nA3TX8zje5swuKErscPQpa48RJ5tauUUCWY63gxQLooEiKugCF
	lYeTMTJHha+cxgk8EDHyRRQpMyodZFKhz3oxz6lN/OkdED65QgMGzuJyS/IM5L1wiTogvZUO27F
	L/TU7YvKvgT7w/NiE/e/nTx7xZMjaR7Ig5ofwNI1CvkGieA0IPS3WOOjIbpomo4xW
X-Gm-Gg: AYBFou1mB+oazyLEyq0tU89XeblQCf5xe+rQNLI2nJl7iKc2Y88KpTZA5HmpSq215wN
	hNjIcZB4JBx8t6h+fBt5hi1ob8MbR0amRombV3A2hgiXFU9xtGmM3WpQ01zWmtlKvvormZBYI51
	H4nfzRQ3R3SoEGk6N/ba5i+DvGXD+TfheAKiUEZxuRHGVGwiMS9lF9wU2JPsuD8hMbJH99hdgLF
	h2J28k+lEsKqw7ezWnveFwatYRu9cC/Sw6pokd4a4c0N56K0kGhaWKHL1jzzthGxkvLK64eR8Yk
	XI33ppHbd3TezSaBJXnBu1Un4qQenE45NOCfjNn3Oq5KK0TbaqkciZVe6my/8FiI8xGO3WXAWDk
	6lE2l8rS0wITwCQcf0mqRNGA4vUk=
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547212b3a.9.1789048259398;
        Thu, 10 Sep 2026 06:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547100b3a.9.1789048258767;
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Received: from [192.168.1.83] ([117.64.75.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-869a5b727f6sm1015221b3a.28.2026.09.10.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Message-ID: <c1bfe656-a190-47ed-ae8e-be01b81221e0@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 21:50:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BY9g2TwxPOc9QUtxhp-9SAlYMWqdk64u
X-Proofpoint-ORIG-GUID: BY9g2TwxPOc9QUtxhp-9SAlYMWqdk64u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfX49Cn1IL+1C3S
 ZWsLurHliBL4yXlhkbXQECu738veAkDZia1T4HwSrtjeHPfS0EgUn/WkEermsFtnNH8fipKPEgF
 9taRUzdUeo5p/uWgO4J7id2om6/j3yTz0T136U3HWj1PdePou4KlaN242RDiR+J+nOKLCsXjWX+
 2HE2sB+1cL0FzpTUhnsHEhxUZ9hrLMNqYquLnURLvz4hvBqwURpxky2+yrP+tfi2v0hzeYG/t4S
 4ZurjL3ggthxPVGceh6Tt5CXIHeEaloGaGngZRYXpZRHN5s5FCosuwyvAwPDjnF1YRXBO/HVT2O
 4TZcRsSCkpnFAEIcHGejbvZ3G8PNx29/2tH0R7OOuvlmRmLZPe+sZ5tvJ8r9sNzhJXcudAOqk8b
 Q+9Wbw//G88ywbLmTzP3wgX9ecmEuYLlyHXYU7unx9RpytMuvwkiTb/3s9cobdKKdAkNX2OjUTb
 M3ZuPM5mYDb9LPxcjNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfX9ciHeLS9avqW
 Qc+YMoleA+SoEMEml/aVGPIJ3BUg8MzkV/BA4c91WxaT6wVTvvFad5A7Co3koJzv+FVkv7jeDx8
 zBVHcp75RTa1o5M8kz1nXlQJ5uJgI1Y=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2b5c4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=KiVCl6X23253Cl38wZou3w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100166



On 9/10/2026 9:00 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>


