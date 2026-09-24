Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA942E8DC
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234910; cv=none; b=SO0lR5kyDQzykT3EEBIFWDLos+Zeq/rTQgNCTDiFROcGtbCHhz5VC70nmt/LOmoQXw444QT1DgRfL8egkaYp26IQopjVpUgnNAVgQUUpaA0RHjlN21bi5tq8m1n/kcKZKjb9+yI915Nmb1K/b/m+n0H1z5rFvzVvg4xcoVajZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234910; c=relaxed/simple;
	bh=biulYIRJvwcStkX87PxbCl0EBUs0lCGN/+7mcJHOmJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aC8am/chrQzhfW8xDrHLCDvYMjQ183Cxyv4DxFeDpwMfvz0D2KPHcRCOcac4tND6TvGYhYt4CxuuYKmaP6VghlSyHvVJRWPAXMiSmCIknowmFyHUr6qq0ZAxUA0tS8etvGtCFI8QY+bs4svfTI5CfC5HSfB6zGdVLJMNS66OFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB0bm5dA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV0LXHJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB0bm5dA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV0LXHJo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eHp01531962
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=; b=hB0bm5dAeECuZt6c
	ZdnpMkZL7F7Wq34QtC7roBAWc07Tp5TasUDQn+u4hx6tybr8Ie8XIwkmQFQXN3NX
	2ys1410nLKVva/cbYVhhW3KEFyz9U+T0uIIXatLIfLTXVrt8kp24Dk1NU3v0sMZ9
	6WVxJhgVRx/cEOXd7w2GWG7A5PPDxSRKdajIfDMIw4Gs2mSj/KiC/V4IiKGE6XwE
	sdmn3i4mYLr4L60obHU/Dop7VryqGFRsbTGki7trD3qBHTaN7myXi1Z8ohMQPceu
	ZOmH6HlQBOjUsp/5uPUYBQJDgHxHIE4jIKltGgIyefiB2edBhgGoSye1bp/JNvUw
	SPJADg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgs8j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:28:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so20239185a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790234906; x=1790839706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=;
        b=FV0LXHJotuoU2n+NZHEbAWqnSsoFwCO5bpQzbp1LQWCKAcrpNM6vRF+cmQXoyRXLPP
         bpTsTIkOCu0Ov+MVwZY7C/LCeJsqtgVq6ioMtU3J0SJ4bZ/lssU5Vm6jn2Jt2rfDpeTo
         7HlgjTx+Fu/fNqyDWvWjBkr3HfuQz7teJhNCsxdM9wHx5T/VrHvUnyo7DerECbzONz6D
         VK9WhHe5Z1Qk9Y2lvOko4uFnIm1HC0Q19hW62Ms8SpwQxNpOtRVV3VQSbKAgdW51DJMt
         lB5E1sXWyDYeK/sWT7trP88W2pR/SiTJ/Vgn+IAK9pCz+aa8qaZjAIhv62Ocdsn0TJVT
         mq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234906; x=1790839706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=;
        b=sjLX7D27diiPremSsDDIW5vM+3JuLqNEQDyvVZgcbX/trOrIfdqv2BoWHLKE+3PpM7
         mFpFVVJlRMGcm1W6Ic6n8IrvA6ijK7tENhd0lrGwRgd8OiQYf/cHwFaABxuwh37kbuh6
         sE7w/ZS6OcxTJ/zg/jiPb7rK5easHLWkLnl218VSqjksQ9ZQ/Qx2fU16TqbStyTPcjrK
         TKV2FHTw4MOGb4LpvQEV9l1ThVUKRqn+EPZP9C7z3WIm+LMneiI90mbbmloBh1jRxZOm
         nIZf22WKJBtt1mnlWJ5hTLk40Wrbvu1V1jvN9TiUznUDIQo2J5pIl+avTysNH7TNJIqH
         axvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxD5zRaknfTOUs6JRniF4762IJhmlzyTHLdlLi0kgXsXjy8ESRxJtZ75S0TSllsA/blDFS2DmpI1A3@vger.kernel.org
X-Gm-Message-State: AFuF++nAayuXDTLNTSaNxveuHkoqbSBL4yClwDIMEB33PeOmjVX8UNxx
	oy/rWMRlTQFqooqiYvyDb6dhdFgZm6nto21Bf3X1GUnY8fn9rjxZAb+x4pv23Z2I4M5XqMjeFkg
	vpRJS91Cy0euMZqFc//6pcc5Pw/ghrxX3tCSiZgdwwX+4NzuivU1xpjv3DkfJo20f
X-Gm-Gg: AYBFou3ynfKP/hkWHDG8MVds4UiPJfRlok6moyJ4D9WNBqLMDdmKMNpDXigUsqlsTBN
	zR0yy3fVrI6FQSg0lBRzQAJPN+7ipiLAAuOPJQgrLFOlAz7eKCzWMBfJBCY9G717uO1jakvOtnz
	JeWPI5Hq5o2DfCTD0YBCKuA9mktsba7tQ6f6q+gyqpLrRsDeAJixlEpPFwY3kCD/FbQjh0gdddV
	2qonJXxaAUigfXkV4+izManXwrZarLT85oy3Laz5tiUQvdA4733/fa3conCBq+qAmpRlURvHCGV
	fkpXanUFvVLC/DBOpKM9hlNdV71upXEfxWbOV1pcaMkc0X5v880M94NY1xe8qytDwpdZa1vwAD+
	/GXmOMr43oSjz+a8b50MN/A==
X-Received: by 2002:a05:620a:271c:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c362cb26bmr153253885a.2.1790234906272;
        Thu, 24 Sep 2026 00:28:26 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c362cb26bmr153250585a.2.1790234905743;
        Thu, 24 Sep 2026 00:28:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae645129sm242676866b.34.2026.09.24.00.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:28:24 -0700 (PDT)
Message-ID: <8157618a-7b8b-4c2e-871b-5bd3f5ec17c3@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 09:28:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
 <20260922-maili-socinfo-v1-1-a82bd7d4ca77@oss.qualcomm.com>
 <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4d11b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F74OYUcYB-Hb6iXyO28A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: s_9lLRT1Lsg7Z2dtsIGl_ZXTARJkFF-L
X-Proofpoint-GUID: s_9lLRT1Lsg7Z2dtsIGl_ZXTARJkFF-L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXwHUdL2A5IEjC
 hssuLNB7PofDi4SB2tG/V5qySBK1JVjjQmQQ8+aVcjTGRTvlltkQpf2O/LKrjxCOV/Km3c336nW
 GvsbXdeWx5Vee5rLUTfJUyfMzlaxJTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX4UxNOMtVmTof
 1EjK/vuvL6iOqcMznJ1NyB8E2Wy7gMJXgAvqjAvecNk6OD1FBrS/ck94485Z9oaaknVl8wtyR6n
 Ch4PpZyLzxAklFgjUzYssFyjHD7OLnO7kjS1gjL+Y4FEpTsN/E/s/pSp3qeXgR6JVFNn/aJvvry
 CncmY/NOnnmkOroCmIBlqe+LGI5FY09T53Dr5RqbfdMeSjEJAM9D5fEXAqptwnCIScoH7QRdpW2
 OR0sEWqkdxCcN//YUNWmmo41f6lplPyLzS9a4lwd8PX1iaQEaL1XMyx6pqwCIwBfQaNSHwtW7nf
 MOZrfi3a9yVHZDdSr9FMdzFyO/x0/LooXuDB+IwZuwBaeoQBG7TVY7kMILoGlH8yZ+IIhvQDV7R
 30w9q5mQsMpG8T/p+VF6IlxScTVWHt8Wk443DCD/VRHQU5YGUatIe3ogaCcE6myOUeVekOIAPB8
 V2Tg8s3d4PEmjz3Jtvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240031

On 9/23/26 9:06 AM, Krzysztof Kozlowski wrote:
> On 23/09/2026 01:06, Jingyi Wang wrote:
>> Add the ID for the Qualcomm SM8950 SoC which represents the Maili
>> platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/arm/qcom,ids.h | 1 +
> 
> 
> Standard question: where is DTS? Why is this sent separately from the
> rest of the patches targeting the same subsystem? Please organize entire
> work targeting maintainers in relevant patchsets.

I see no reason for the grumpiness here, this is perfectly okay in
my books

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
