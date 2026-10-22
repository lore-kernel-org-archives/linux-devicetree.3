Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657287;
	b=jLk/mzml1mIvP5SLHzpzdq7T2vspPUQiPJ4swCNxrJ5/d97d/W154P1XJxGAbH4ZXIvX
	 3lXR8lh5/DRYi62WUZpm3lT0Sys7AfOJe8TyBJ2135NgOlUJLHe6D3ZEqqv2a8Td1eBDX
	 1+/tQjS9kyZ8kvpfhIaUApTTEu/seSsCwx17HegfL1rFz7jXlK1creCDcRSct1viARoyo
	 fqwXu0awLxuHW/lggDymnFdGsi7VQFpjMcUbFqkPX+rXDWSEiPZnmG2i/JKHoP0YdtFUy
	 U0lnxAsoXWb6eJ7iZp78JCNh0HKV7ONIdfnjFpKdJW3V3GvunasQ3/ktgKJFH9zZqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
	b=ZRYDtDuuciGVpOYVwIg2HoaFUW2Jt6t8Ck3K47yPTIR0X47Ty/dG4Amjk6qEgk6OAJPs
	 orN5IA8iJjlSBHi9NsrGDZTIffIJQMtGEPGmfT1kdRE5FdkcJqIpQYWV+SxsxGkfAEaKQ
	 T7E/6X4ePjWXHUSyN97U5bxPfpe6iSaCN9CRiQk/ZDFE4vR1jyf0kMspOXigvp3wNCHMG
	 RDX7lg8CeY8o0k/gVLzfwcP6BMGr2G+xhN/CsanrbOApF+8Z1tpIvp7HSVJGElxmTs2jL
	 JiC9yZoNVHbC4FKJDdaoemL5G6q189btW6x6XSdrrCGuPJNPKhXzYmFZVp39KNeqhwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE749606A329
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE749606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70HUQ2516348
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=; b=Kn5z8E4eI7K/JXRs
	FKquDba+8ziR7L+sCHEgY4v+EkWgG+ebGXazLHfA8L3jGRW3/rH76cwVr+0ascoy
	pDePS7cQ2DRtll529OVK/4nKwgUE4BF6bUQlndogx6mKDKRudBG78QlB1KFwKZAa
	huwXVWvBXS0/fywhgFlBDIiG02fc3mdI3TkyG2HisuGw82qtn8/G/otIYNcHW2Ub
	mb9gLzxQP/Y0+hxS3/DTlRV37A9oYhRykTDYo78aZZmb8yh0Y4vDdMwz7NkvFzKe
	lXaPGCvUbsAQyfi0SuDOXmYMCzhxjoLzz7YetXgo3nEHmaVgYSziy/DCUrhSJOcy
	XfngUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9eqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:21:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43023185a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657285; x=1793262085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=UqdbrkDApGebTTgu5I33bJTgjWVVHZZjyeRFx2QrCixg6NWz9jW6GbTPS90SpKnO1t
         86wkVhhbSgt3gf/Jo7YLHoxX6LQ2b6oYrKM8MdiviE0G3j3ugH0arnZGO20A0M8S9U27
         1RBlvhExrpf7o/ac3zahjzYTxpXFYdOd8BjtICTvXagmJvclq7gDPzAcDH7dwWow/eBw
         iF8+7oLInVs2KA4WdyXyUaS+zyqwsSlbGY8b3v4hqJEaGFchb9v+6EF83ubbyvqFNSi0
         t0rUf93KzOm/fPjnlP3p/twYK0LYnxGbnOsrpG3SZ250mxtPCD7VDSMHCp3pYhSl+r4V
         IvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657285; x=1793262085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=ArosC47ehZg10U9petw+b9op/u/rh5MKXCOMrbyMQmbUWaV58xiah5l1IBg1YlpWck
         xc2yn4klyNxAM0tP4f6l1tRz8CCBv8HBqbNVclJKN9XC2Ok6A8tHt9sTMztfIPf8860m
         YjfmObJ6MiKytgHrDZiRA8PcYk2eMMU/YWRo+emorSdmYOzScu9q+elpqZImR3iDceNU
         2UE8xilewbu9qYd+0bcpLfpoLurK5Us7tR+jdhdaej34RCEwVKfwuasZGlqh3qFqTJl8
         QPK5xblp6Jc/hEJ66E8z8YswDNnusINLLaS1wgA5z8yGNi1Y/VB61OarDsaaDnvLYn1r
         6EQg==
X-Forwarded-Encrypted: i=1; AKwUvBzMd4ryx6cH91y8NROXPzDM5gV40xkS/n+7NYEWuXAwoUwCMPt8JDRfzwjeH5vNybxOzfAhF+XTH60k@vger.kernel.org
X-Gm-Message-State: AFq9FYLU9sAKtCYGNy04mIUdnMOowQXQffy3Z4wch3IEdN+aEeztszmz
	x3JEmdhfW3fLXjNNjgazAJRrLZzPjQNkEDCEnmXWPtcZFBfm37gfcIcLBX4JIz1c800GsAVnn6r
	fOUIBxngmv3R5G7kgqV9fQC13qmy+rMRkKEFFWcMS4k14fqnAXiEdCkDiYPEsaR9v
X-Gm-Gg: AYBFou1zZGo83Rrf6SMo2/3ZDnl7denvqE5bt1WO9BaTVTeZLlpKTxBVnWYz89QcvHP
	jMbrzeMk1O1bhZ+6PGlRm5ihGgpOLZUMxQwFX1tDGgoPyYFGwVWiH8pI7JA1GTXl5BMuczuXSXn
	LQ63sHKn2U0va3p3KkvoTFDEzsfyDGxPpyQ8NLB0l9fyvT7hlqp+ieGgqO3fVCUpV5q3z6Nt9fN
	h7/FW18Fw+b2kwUCJlg3HjdS7lEsCv7dspleqX7yywdKm93Ns+ZHvNAcm29laEsIb75fvQyTSGq
	XrNlcORAOMxz89caDNRvqnQMWqCH0ygZKLDOW7ybsItwJae4X3RkSJtVQvuty/b1huVk50PLD5Z
	TKBBw+gFaJERxtt4CTZ+Msg==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910049985a.5.1792657284985;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910047785a.5.1792657284557;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5743bfsm78940566b.44.2026.10.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:21:23 -0700 (PDT)
Message-ID: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:21:21 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c786 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kYKLuziri_h7pMepM0gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xyNl58QTY8Ggf6bxs4ZyN5opsZ74Eqln
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX3zXKkHy+KSfw
 18FRoqDaDp13Ria5i+JB2D8K98M8YaQsygIIOHk4dXB7LQfTHZCa1M9gIZR+SFAmBF12uVkkD5v
 naeV39YNRP1Qo/42WxnSzLQWB7hEZ44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX84MmytFyAH3Z
 P5e/7OVxd/+WmBoR7r5xykodclPciDGD8a38mb92X++h+2j5x+wF8WIndF8MtTKYY4ZjOPfo5fq
 xsHMJKcZJ4vsSirLUWiePp+VND5DE3D1pVugUS/g41RlVl8yj4PJ/T4W99JXJd6Feulfq+PnqLK
 4OZMcsC/wno2Y7/5cFLbqdlUhQlrG4liFHlPfrKzZMC9xbmPbMNRngX39LEa3LERhbVJa9voOh8
 /UlWl2NHY1FqlfRIexi6LA9yKU1aaCJaWqvq5B9kqsjMeM3+0FaByPzsI/7VhsqJx42iqTmXIPh
 dmnecDq3OirXJzf03HBQAzKMWhsELUJkEtHLKx2yxr4Lg/U8LFxNQiMMVs3YYNvQsnfpdEBmK4/
 LD5hAx/zwYaO0cYBEeWwZADqChX+nulg5giMRKyC165QliHMbzyuLxfBqUvefEKLrOY3u59GG6Z
 XGbC8QvKYOaSXxZ0sEA==
X-Proofpoint-GUID: xyNl58QTY8Ggf6bxs4ZyN5opsZ74Eqln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220033

On 10/21/26 7:28 PM, Krishna Kurapati wrote:
> Both USB controllers on Talos are DMA coherent. Add property indicating
> the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:

- kodiak
- lemans
- monaco
- qdu1000
- sc7180
- sc8180x
- sc8280xp
- sdm670
- sdm845
- sdx75
- sm6350
- sm8150
- sm8250
- sm8350
- sm8450
- talos (fixed by this patch)
- qcom-sdx55
- qcom-sdx65

should we mark all of these coherent?

Konrad
