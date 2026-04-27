Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7E3A0EB3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279693; cv=none; b=STAqy+H1+BV89YcUkqXhk0+ZMfsRUdGYdj6pVDMSO3x+YA10rYrCj+5yT5JHco2gK5qgOHr6VSaq9XRFvvxN62NhdQjeLJxUxG+mD5i2ckQQR4t589lEI7pR+GVpyxGS8K4PGJMBD9zjq5Hvr7pcLlss6yfYHF6EF8Cxt9NsxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279693; c=relaxed/simple;
	bh=D3vD2kVlYGXS1I5T4J9SraaRD97GJBtR1DS4oNt52qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Emf/SKpLt/x48jycDTbVnR/kjQD8W5lZEH3yaPTiY2ZKiLhnSA1J6V2Tw4XmrUjBIeQ0D1rUi+6IvMlm9Twc9bf9dMvsgVnDiDyFg40B2MtYV6P0oJMwWbZuCVw80R7PaGgkngOBjN0JoWcCSoRIFOfM7WwvHzUYziDJr2bWACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olxaidGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th27HDD0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olxaidGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th27HDD0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCfM4054521
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/p8UniljFrVfKElakgGeiO2AnZtZXK9CfVIOCmzz4=; b=olxaidGiIzavpjiD
	dMFTZZe0WqHE5PiGpP5459XPD1OaqHVZJGwHbeMMWetVBum2Z98k5ABvLPhXi9FG
	o7edD4Lzq997AvdTaOH/THoL9NWSCqk/t1tzYNuNkdIE81CG3sUIjoCGbwg4aRHa
	zcf9I47J+D9UhWEpNdbLmQ/4EHLcaLzJk6AaJ2bsJ15JRBGHQZE0QlUugRTSlsp/
	b95FA36/dMCSbdoPaDl2cY6VK3nOdOJ5dY/9hKExcewAr+VtdD+rG5OqjygGLYDu
	XOqsXsq6VSmKDq60Zc+b5ZrGG+G5RELKj4XMxKdPTba2v4vy2AkgIvrr+BDhk5F5
	D2bOxA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxd8uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:48:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso12673795a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777279690; x=1777884490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ui/p8UniljFrVfKElakgGeiO2AnZtZXK9CfVIOCmzz4=;
        b=Th27HDD0dRXr3tBld32vUxLwHVu5NN9hocXfvWagm9jIDxpzwu6D4VXhkW/Lzokkp0
         ebET3h+MzAcutf8ieuKdDcOTiLCTR4roSY1BdETsX60vtjNx7twKDjnfuG1HnAzyKtF0
         Ard7TeOQL8ewmOEoDysSuRlRD7iF2bgZbYCP/Sn+tY8vjJqLqE68CRsHo8PHK/mSESAW
         y0T/72pBFGijmViGpnwVGxae3ZqadKeA7/ThJncYCXDRhwPgVT55aA/1cryxsmXsvM+W
         ZgwLW9mVKG/GRj/njqw1lOXKVs46DFnY3+mGa0rneoDhDt3OA0OnEwgSyGkY/83yoUZl
         gO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279690; x=1777884490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui/p8UniljFrVfKElakgGeiO2AnZtZXK9CfVIOCmzz4=;
        b=ci+BA/P6SmFE1/yx9ChJRBbpvpSOR34rTN+O3r70x6n1DA9CRFtdsbW0N2b3UFbSC7
         pROkvJtJFbsdjBGyOo0Q5dVgekoffSTrzR4+fFYMvtlvrr/2Xxt4qBlBQ2zdiToo2qzG
         bsDt/ycZRzi4vSZq85YHyTTLWRimonPh1hAvuYj+tt5YduB/NvOOPgsAG8kCDhHkiWND
         l2QH7hO2l/97NfIkRzLosAEud+QXmeW0dNFJjMe0ogF4hS2BQ1sgdcN6LDgRebVBsmcE
         llc1/x6O1rKJQp98UUO3BEkI6KXiWBnfQA9t0LjH67B0+Sr49B61bHg+Jn7ARGFJnBwY
         JVMA==
X-Forwarded-Encrypted: i=1; AFNElJ/alyHkH+tSzpgsFuH8tRcgd1iwbdIhM1xvyEJspW5G/y1nLuEHHWTCgcMysfTYgPCYnsivn1CpcMCo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ISk3Jm60FS6nIUYO02BzHh8twFn4mBlgMkQaNza38Y/w4eeb
	cOn1mJxUgZMIV5FvyqrJSmUyHFbl/7A5n2VKUXcT7BgcXSNOTU3UNani6YSByEN8LV7UULiuJHX
	OOCqC5lpnqtzrxweKgpEMtRfFCjNftLygVgQPJco/fgdoV9u/ZghJv6UHj5GBHEATnCXQh1Yu
X-Gm-Gg: AeBDietIMQAPdUvg9Rahyw3HKRCPdhQQww61ZrVhKYp/okYEKZ+ZQ5BzgUEtfypmB73
	KPOx2Kxmda143d4cd7LQOJPl3gmdBAXiCFnbsMkv5mGS/ZBPJrQCe8uFaqhhd5bAFCzUzNlrLOM
	KikJOOFJrkTKDIBvKx2pbUOu3IGbyF7hlfQ8RYnmvG2iH3ClOaX5r6M5vyuC/Yo3AUb894m1DIE
	/KMStQPuh8ziOFo4P8zyODn9QpUNt9cR7LoAoDt93bM8rCVOa1riyIH9xBnNKZO558ERr+bnNNV
	q3BEJ9f8TJslwJj26Ihwr2OOPMPErhjKg5Dx7VF66sDGTLs7PZOUYXfLTthD7VOMjLGq7mGFA6l
	knqKD+9eeMmtQN8m4rwaRiApEv9mHvEnlrqiVMAM31NduumwtPG7uRcZcvidloj8=
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr41482671a91.7.1777279690297;
        Mon, 27 Apr 2026 01:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr41482639a91.7.1777279689802;
        Mon, 27 Apr 2026 01:48:09 -0700 (PDT)
Received: from [10.217.222.83] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm38732895a91.1.2026.04.27.01.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:48:09 -0700 (PDT)
Message-ID: <60f06bc0-16fd-4629-90d5-60021fb40d59@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:18:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
 <20260425-handsome-papaya-porcupine-d42df7@quoll>
 <19600dfe-00e7-49be-9879-95cf662e1604@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <19600dfe-00e7-49be-9879-95cf662e1604@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zmL0e4x2nWKLqROqeDq0gUbMrmIG8RAz
X-Proofpoint-ORIG-GUID: zmL0e4x2nWKLqROqeDq0gUbMrmIG8RAz
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef22cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=aNQcmT1Oi1EDLeyP3UsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5MiBTYWx0ZWRfX/yK1oPU5FZLb
 OD+5ByMN2pwDU1dTbqpVFpkIN1zXZkpglZeEYtTD69DabEbQ8X6Vt9ldjkqwJajbGJYKiu8WilG
 y2CIDLtNCgSJKUnOtAOp8vbnF8xythXCOub0NJVEUwQHwxNkCqbIO60KDfGXQINPPJoxJECfFuC
 lNzK5FXXeCxd1u4Nh9il0LLJIwGU4OAmN6ODZ1Y71BPClkIb2C03yvEPFkwVEG5jUXAmxXzEC40
 3t7JUoIgEVt7d+8r1xyn9QMZiqEofcca7MWh+FJZl4QHaB8L7f+AOKKUrOla7+4Yz0jlxOSoem/
 5cXdKvVJRpMgaLxijz+QeTMPGtNNhSmZRxXR+FHCTxxFfgY0MvFCaRyMwq31HHoFr/K5tsTCTNJ
 kyFjcvGMU8CIh+8kzZ1jPA4KXg6mLn5fC54Ghd5BUMtAot8rkt1tdx3fL3OONmxEWjcAiPxByft
 Qf3gXGW3ZwbEfUcj5ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270092

On 25-04-2026 15:54, Krzysztof Kozlowski wrote:
> On 25/04/2026 12:23, Krzysztof Kozlowski wrote:
>> On Fri, Apr 24, 2026 at 05:04:15PM +0530, Kuldeep Singh wrote:
>>> Kaanapali support newer BAM v2.0.0 version.
>>> Document the compatible string and update example along with it.
>>
>> And why v2.0.0 is not compatible with v1.7.0? Or what is not compatible?
>>
>>>
> 
> 
> Ah, and drop redundant "support for". Write concise subjects and binding
> cannot "support" something.
Sure, will reword and keep something simple like below.
"Document compatible string for bam v2.0.0 version found on kaanapali."

-- 
Regards
Kuldeep

