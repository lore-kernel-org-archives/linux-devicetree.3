Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169A48034A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994041; cv=none; b=kg+utR2WidWfJfuZVkEoAWWEAXBn/pAwL1U8KOyAEquVbEBlNBZ36jitiuk4+WvECvcDJH3RNWbOdF6gauAj/rto2b3XQfXKkHsxW48hNkBhJFVsQZ5OzZXC/lbGU+FQrdmDxLneP+Eje30t1Q2jpghhG/3Nj6LGFpZXwu0j6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994041; c=relaxed/simple;
	bh=2C6XjzLVn/DUO72k9GZ0t941Cgc1T77zwAvITnwzrcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBeCtwZ8mlLvCYrSNtRPfKlySjYz3uksrTE+im0GX0sJi8qPtajineC2luer0ZqqydF1LwoPOrJiBE7N4SDML1oge33UhSSXBr/puK9y/TsqZStJs/DxodPbkMLqNLWD7AklfjjuyyRtKjmDF0VGv3odl+HTmGsuCpA39EP9aTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbkrEazX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2MkOmRA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbkrEazX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2MkOmRA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KJGB4115130
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=; b=FbkrEazXrEhwMupj
	aecSN4M9Luu5jFSOr7JPSRxil85+HbZJHPqiTRLjkUVN3wXZsUphN3TTO3AVUKZg
	nrof+KMfOzAwu1kr0MJUoJpBPjsJj8V10BvShu8aKQcv8fpfuswb3WzTZ1FMu8HL
	Xi+tJ4xXEfYcLZX1uPmgN2jMw9naZRXo4YVdhtMowhAGgTg/0mvDRbyTBA8kukMK
	Us5XUqHqwElwQ8Ey1Oz5xgA2yTojqPFoqKCuip7Mec6SMKLB4wPIiDTFOZAdaLsv
	9P99+mFAtwkEeyfinyPjQl2T/g0/M+L0V61d2Xo78nw/2cCSedCrFo1pkIWXnvGo
	utOMVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940m3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:07:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so8689161cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994037; x=1783598837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=;
        b=e2MkOmRAeEaQ9E+2ibN7Hz71vzm9YQylSqU+e2EjbX77Rlz0fLxTOrF4CdRjBWbU7j
         T1JiqAkRHe6F6mb6/9Zx4UsbmU2vQdAmaEwM8B/Kgmu3RAOy4y1Rh8ZPgsXzLnM3sMba
         F0dbxwYYoheFLzEehxB/GsP+2kh5t9khUiPHpOfPh3iZCjESk5SeMvLsjZNzuGiRmYAP
         NqvdX6g5lhetV2oDrSmAUJotN/76uLAB4Y1hSo2LWLx/pQSvuvQjJvcyjQn9OxcTJHFZ
         cfEev2QcLiku2R4IEE6+NxSLGo0B+j2rZbo2zRuuJCzmLwSLShGVCqlxt9PnAJvFrbgn
         Jdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994037; x=1783598837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOJwoCkAIusdGzHbjudQLH0WhneMpUY4FHhSIYQ8xfc=;
        b=IAeNtb/Xlu18eIfTbDyx0DL+U7rNK/WS/edxnMYillPyqMdFp0sufbKfdc+Lbw+Enr
         p2rUxZUtolRDHzBtf10hBVD5MnkpJJwhYCN+b2rM/O1gtbLv6VooqsJi4md5Afftqrlp
         2Fv4QrbmgAJ1OsYgNOLuTYi0yDkuKYtwVxkEDUOqxatAjlQWYE4FJjiRgoi2dVlKqZRq
         u29rWhcAvmIPshStsFWM8pa80DEtd7AIZj1szLGQCRyt2HWyjto9v2nQAHkeU+VFazi2
         +NmymHPQx5ZBByxMVP/kSzpJWNWXGvt56WFKcP75VIeJQa41tCFbyY/AEqW8u7V7Qs5v
         6UMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SrzfxEuVHXYSasUKAwojIUV7V8D1x+iJyUNVK9Lco+Q+0xPvymEwyV/UcJIyDadIV0saZRFRVYHhK@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7xJVYcHTgYr8/22/VzNynS04VYtWCeR5JEPw7U75gEl4CUi+
	bkTLQo2OfW16WMVbZKrIPQNV6F48buLiUqOkYpa4IAwhz08Bkh6SO4oKxnwfTMlQCij9vPWRWU+
	uLFD/si73f4F2D7fNBkiag0Tl2qwQFJjjuUPlCsiReOVttxp8eChqWGzPbZv9UAxN
X-Gm-Gg: AfdE7ckyoFx7B8C2/fRR7PAY1oJ2uJKuQ6OhR2qJgq0LjP7QH6VXdmMudD6w3Wj1qEN
	AWDqcE4ppn7lDiL3HAA/uSe7W1oj7eJCHmjbVMeg2l4OL7KNyMo7M6RUUQmAwgg6SZharFd1lBD
	XMhOUu042xJlKL8OG9me+OPmGSfF42BuV9U5+ebnhpCD78waQqbYqlByxarkuKwByRpc8gIJAdw
	zErG3biOH7kekXhimJLfqLDOkQyeCyb9FyyQCMXmS7rDCT8s81WLZP7ZtIQCnKayv1boC+ll9lU
	0A+4IcNwof9iDgl2K6c6aCQJ5GhSn+v+TNR0umAfuKiWCdZZMpborV8XgnOkxYdITFfKlGtc83i
	pGm5jnl8j/SC+Xpd5H+lVGhMhF1vbq8s5Gm4=
X-Received: by 2002:a05:622a:148e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c26b25b69mr45760061cf.9.1782994036917;
        Thu, 02 Jul 2026 05:07:16 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c26b25b69mr45759471cf.9.1782994036193;
        Thu, 02 Jul 2026 05:07:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290794sm118186566b.38.2026.07.02.05.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:07:15 -0700 (PDT)
Message-ID: <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:07:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
 <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX3NhYtDO37o4v
 p3Bvj058iMMn7IK8V7DKS3gs/BwhtQD7f9Iy0QaOKlr2rjL2gEKq6IFTGZDJwV38vtvvRDF+rxH
 ged5bIrIorGAwi41/XjgdPRmvU857fxVIrku0pZaVFnm8sJHTCQPDoGuO3jV/Uc1xPGIeN1GDR2
 jaVKA5Y/rmfJ5Y/YDzOpc5smHjFUYCHL51Fw4mpY4rl5i8iTVbLC29VcBXjFw6MM46Oa9mQ2dPK
 ugTRW5C2+uuVBqisehFgH+rn1t5131AXAASDVvayFbkFla8sDa75eQ1sVNHPquX89v+F6QpzXUv
 604YOzPK34r5zLPr4+OIRmKHgDgWU8ECXg4lXbBj0XWkNpKabMLA0FLHrkhAKVwVhz+kt6lFMar
 fPJBCYsNUJnT7yllCmNnfm/LD89jZSEUB7+Ms7MNUYC2gVqHDnEvBzU5wRwcheYZIMiwCNYOV+2
 65LkI8GdDjHNwmzVvcw==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a465475 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3DGyyXRA4hY-B3Y99UoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hYB1qxQXKsr5jCWG8BE8ymeeRn5WOp6C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX++DjGgYagZs7
 TkLkwJydsYV1w0MPnyxIWIj9pV6vJfJwmw0kI6j6i2/dYYMbUI73b7gm7bKi39CAUIK9UK54sSD
 Szkei5PnrbItbd4Jeu1L4IbCGD0MNiA=
X-Proofpoint-GUID: hYB1qxQXKsr5jCWG8BE8ymeeRn5WOp6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020125

On 7/2/26 9:33 AM, Rakesh Kota wrote:
> On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
>> On 7/1/26 12:28 PM, Rakesh Kota wrote:
>>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
>>> constraints in qrb2210 DTS files to use microvolt instead of
>>> microamp.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>>>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
>>> @@ -37,7 +37,7 @@ pm4125_resin: resin {
>>>  		};
>>>  
>>>  		pm4125_vbus: usb-vbus-regulator@1100 {
>>> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
>>> +			compatible = "qcom,pm4125-vbus-reg";
>>>  			reg = <0x1100>;
>>>  			status = "disabled";
>>>  		};
>>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
>>> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>>> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
>>>  };
>>>  
>>>  &pm4125_vbus {
>>> -	regulator-min-microamp = <500000>;
>>> -	regulator-max-microamp = <500000>;
>>> +	regulator-min-microvolt = <4250000>;
>>> +	regulator-max-microvolt = <5000000>;
>>
>> Perhaps that's a stupid question, but is there any good reason to
>> not just keep it at 5V if enabled?
>>
> We could hardcode 5V, but keeping the range allows clients to select a
> lower voltage if needed. The driver supports voltage selection per use
> case, so hardcoding 5V would restrict that flexibility.

I'm trying to understand if this would ever happen in practice

Konrad
