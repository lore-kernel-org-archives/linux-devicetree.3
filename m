Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429932ED58
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586940; cv=none; b=LrjvsUrl9aIwmcLf7qsz1/CBf+qYnp3NO8SNKt4VBDDcqnyHsLe5Fjan8SO5ntiA2f0XDgGfgWIcIf0L6WXr2wGzBK9nPSdDs7j/Nj0FHf5Kesbob0AoevmVuelj4sZbXpSvQ6sUj27RdJOKiY1CwyRfIVA/Ooye1dC4yKl0qCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586940; c=relaxed/simple;
	bh=MHJGXcxA6ApQp3i+FMoqVdeIvWaEkLC2LUn0bLLaJRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXuEsN69DZF5ixzC3rBNXFDIbVxTlBUSY5VsHRHW55rVF14OBnLYN5FpjQGpyypySVoja3YyTMIG0K+swcmbF7hM9a2QwfNrTplGDJ2pelpq+oXXIAgPlf6tFqE3wg+57Bu+WzL/ggbtppyrtd/j2tHVXzzeoffdSTtScRoOoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEhcCZO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YG+zRQKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEhcCZO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YG+zRQKC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Ctdw02328170
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 18:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=; b=UEhcCZO+HwrUUwAX
	8AjnUVwwvm7F9s3RJuZ5nBARKFRZbAUUWcf/xdTj7UTzdDqiyB0S5b3Nvmbvfr2y
	FwH5fjOZ0w9qHZ20iErDhRx31kNRaCybb/IHRq5Kgr5woy6JY/TSslXWh0+ps/g2
	EeRJoCigCfFsKeO8wWqNx98JIb3D2PdcobjSO90UQE9f4l2dEGrT+YC5BfDd1slS
	5cAAhPZt6zYPTZIxFRJEPSm52nX25CHHMn37Gmk/dPhlGqTAdtsDaNXcVr+oHzmf
	8/Je5fi+Jw4Bc65+XAFR8wWEHtFW7tJG4709n4zOhxSdrjjLAW2Ze98puue3EXqi
	QSHPhw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4v3rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 18:35:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c83bd48afso3036126b3a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775586938; x=1776191738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=;
        b=YG+zRQKCSVci3HOn6Kl0C0vR/UZDgqZTjRuer5WXP2HC1vT27pZy3+VZqGgXwmk0/V
         KhP4f3nbdRpEeJ1K5CgtWp53dkXhH/awneF34lma9Ktj8Q56+JjSIMiNMxHlIOJ+qUAf
         lc2udjvHvSjQ9oaGrECsiOI7PXOzGbgh88JyHJtRI13PJ3ueHFDhAsJ9PvSWBFbf1T0Z
         5IOOXo+SZCf6IffhmMgE8G4kCg3IXE/OxDLargVGsE94/BYIxD6C8s5MJCqtMvtQPcz1
         hAMYIto6osd7NQGxHZD0Z2NFAH331O0ILVLLp5Hf82GS+IxvVdfEvgR4apiVyyvq1bvu
         0XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775586938; x=1776191738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=;
        b=aCSzs9PT0fK/Lbv83NVieK0U/OHVniZu6KJpYA6pJ5nxxm4nOhbVKcDMxKFo7bXyvg
         UkI8cnmEqS7e3Rp/ghc6TjUMmyAhhtDlMIP8U9Dg3g4uFTQVf1INHd/HsztLuCht+F7U
         +5EWnOxAypq3ppuwRZa/qCa2BDrYUoZk9PBP0J+c2vtZ1PrTEHwh80+wW/oKud9DCiF0
         l/VtbhaDiYSCR6AxW+LIeBOX3FzF8p+VpStBlp1KlJwegu14IWbU6x/xJMFikexkQzBs
         6CbDmXfMFO5nbdvw9ZaqeR8teN+lG8/FZpSZjNJPUBbM14fRp6lPmRFEwBrLcMgDMXJ3
         wa1w==
X-Forwarded-Encrypted: i=1; AJvYcCUZXal4RbqRstd6k4xFodvANl1kcjq5qyNQyFUyGocH6mvkS7qjZ8IytMbnvxZ/lLNPw7UgRSyndHP/@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVIlhbmWpJLqkE01RrwL6otjPPE4wpa2QWIP9xwqUL+KV1XiF
	3MpE0PUrQU0op3PfKo5X2Q7VWhHNPcZUumGu49EjnqwIWoILm1W6SwPVbA8IZVIkHUtzIRo/04Z
	emMrd2qYAtVkRfJR4i/oJrUPvJngcU58zMtK0YGH1BdN436mojqo86j1+Bs088s0F
X-Gm-Gg: AeBDiesYYlT026oTl/36mgnO8gO6eLkFM6JM5ZDoqbIhAVkZSidguifUD0vSa7qrT7E
	aLJazY5uzS4pijTjk8abtWMipv3DVNszm7L07VIDBsgXFTl65sIeqD0aeU+zPlcCg9UpCVTZj9E
	cGu1IEU2po+82eu9D8gI2jlkXK1KQJ0+Ic79qi+2u7HiPECuU2ZpKVJZ9d5ljWNhrvMGmJy6sFz
	OpihiPlCvrQ3kVo5S+0t2N9FO1vYbzgQYR+3dw6Rq+PwtAAmu2XYWDwhfDmB96PUAfxR1uikGSV
	WY7X8RyKMe4ydScPsG2NtzESDBVCE6yJR6NuNR/jJAeZOKLPvrelVOuDoOs9fOubyl9L1na8Y7u
	u3cVladET2rtp5RSPGvwkhs8kBqOyUtnujEYY2VLk36rGFgzmqA==
X-Received: by 2002:a05:6a00:4fd6:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-82d0dba9c80mr19478626b3a.42.1775586937447;
        Tue, 07 Apr 2026 11:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-82d0dba9c80mr19478584b3a.42.1775586936950;
        Tue, 07 Apr 2026 11:35:36 -0700 (PDT)
Received: from [192.168.1.58] ([49.205.241.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm18775152b3a.18.2026.04.07.11.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:35:36 -0700 (PDT)
Message-ID: <6f3a593e-9537-490e-bea4-72ee20c5372b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:05:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE2OCBTYWx0ZWRfX1Orwk8clDwb8
 xK+iWxsajJlNBsoc1h6kcjockk2TokAL343YE3o9uEG723VuBY5X5/hB5nORMrerDKLHa1UUHTk
 shzcQzkepgp7S3xHSEpKCnrTSBGKtegGAXzEawEd+zWmx3i6Ye7znnbywBk/iec2l08wGl/PYrE
 kAo3APocnQlXIFEF15cXyi+ELCvBSiRTKyNndzYCrwTgz3wRYZ+EPEF8xVTnCB6ZnEWvy9aEdpi
 eozy3gvOo4b540be5cUmaE4kDpNifr2UisRC2+powQl2PwK7yz+5kCSetmQYx8wutcwuq/Bk8x4
 hnpDMMWqF/TlBKyPFDw4QsLJuROzmJpuM1JWCcll2jMXk3Q8D2eFkKmVjFAYg9F2avHevmwW78H
 4xaaB6U3+vSSP9cEQQPdJePboMCP2/TELVdc2ZbxmdN9hcrZ0AKN98ak0FjAFIHgGlCeb4ZlGw1
 7I3se2ZwGuxFC1Ad3fg==
X-Proofpoint-ORIG-GUID: kx1dQiA4dVjNT_LPZcb3nKClflFIVan9
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d54e7a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Rz+oJFlrletnL8nt2WZDKg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9nldhgvQxnsrbX0ZkhUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: kx1dQiA4dVjNT_LPZcb3nKClflFIVan9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070168



On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Add nodes for the BAM DAM and QCE crypto engine.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

