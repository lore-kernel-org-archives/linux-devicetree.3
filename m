Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC9415F25
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438404; cv=none; b=SBiwFac/ldssAGCJp7+52kBZEUXSGdqaXO8YI7RZsV4y48F9TUlwD0fqBG3c99MhPhkQCoVdPO5zCnsL4/ZB7bNkmyiOHvX3FEfv5NYVt6pbcJ+4polss35NfGqH3f7rbOBy0VKtfbkmrBt1TOiAw+T1sCO55NkqgHq8vuDo1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438404; c=relaxed/simple;
	bh=AlpHueBt0nZVt2Y7hVkWqy5+bwLUYtg+CHiJAgfM+mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoM1hxi75jRGaiwJHngyZ7NRkU/nc14UNwS0RaoZV09Q7Hz9pigCu83YukkA3/DDR+g/ZxIgMOGzlx0JZSaWNTTbC9H7eDSMpLCS1acTBdc/D9D3mQgJl+SXrMgKYWJTzhED1QaGTyvZQSWnYNYu1+68EBem09lD9VTIqSXn0mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2BVe03n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY7gJk2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2BVe03n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY7gJk2h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B77G3u2253766
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=; b=F2BVe03n5ioKA2IH
	+Yf3xy5KymoZ/+9/3BsXGZr+lL1yWAPoEcv2nHxey1DItm5zRs+vCQ6S2yy8sNxq
	5xLS7hoNCU6Pf+r35e6NH+SKGyXI5b1SUSwW70vZ+hcE4pjAklBMveZkqnC1BxAQ
	ZCzYr4u2KlZhlLg6AxpDjbWxqGAPA/5HMHrXzew03TaI9e7Tjj/w7qW8/SqAzk3J
	C4uqOSD9NqF+RTfkRq6iz1lDYBfnoW13/yhk1wOTilrFfAhEF7PkuADk3RKTDRI+
	uj6YeQTlkEF8pcNNET6luloRjZcZzCZot0nYO9pQJU8SLonVdxnkV8/oH6XOHmSH
	5UDFhw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7baxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so768899a91.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438401; x=1787043201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=;
        b=BY7gJk2hUMGrvNcmKRz8+5iQMaWRBeOoPjC/BcMnLVRo2zu2jSthNAgTy13gWmBJPy
         jETzsZM+9ALwq+QckooUUPC55E3QsnFPAueGLVsaWp1hOysncY9eiCYKP6GSXOfXU8kP
         Mlo6rJsJrTcnYPmrFUHXtImd88L9dRUnXs2oYEblTVdBb2fGpAYqGjfpgJjw3Q5DNee9
         XVjxQjCC2EjX+vWweTPdgnwVd/F2XBIwQNtQx1dSyOHVfDvWBB27Kp4+Lgnw+WpKnIAM
         WXjAdK1YJV63M3TSEUQBMGNlmzeueotOeIVaKzWZ9zNfKH/yKCBMYMP3At2bT/TcmHON
         Ej5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438401; x=1787043201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8FaFxPD6abqtYobI5S6+75PJDnGpTU9ePdvdvXeAHw=;
        b=MGCZGYKBVCYuJQINMVcVhGOvets4q7IkkEf77MalP8XS5RV4tNcceIUR5CqhUGq7uz
         5QKqs71qhHqwwpAnw/L3pl+J16PsI6bU1o4IMG4VICeUvIyycvirDvP87+yGnif4Tmi2
         z3e+GLqDmoF6CUQcqLhb7L2ypMzxRGfWFrycsWwCIfsOm6IGIC3sfBpjENz1fEEThHJB
         2ob2pV4Pbp2hUGJfXLKq+9SliR2dLnfjiE4Ggn7xbvzZjUgpdbdTLSnhWYUE3I+8URsj
         Dz9YVc17+vkOZW37ZI51pipKtotQIOLVc5a5Jy3sOP68uapNQG+jcKOa0u1mrQw2eoTZ
         sNBw==
X-Forwarded-Encrypted: i=1; AHgh+RpgoLIxhHXO4h53DnPV6fwpcRPxFEJHUjdsKwkt78SJPIKZMyB+/28pNTMmBs3o8wL11038LIn8RZA7@vger.kernel.org
X-Gm-Message-State: AOJu0YznXs8YoR1Aq7P36aWydRC04WY4iuk4kHwM4y7YmcytD9foJiTB
	Klpd/TD3p7aSq6lqqB1kw2PfkgYiWPskH79FxeeDwqz9lES+5WjXwBDt91X2R1JT6P5dqYdtdL9
	qwe1Vfb+Nvuszv1HHKgTQUX4D9RSPACXCO4WRQU4IzlllKhS/ahZS5MLKXsD2UXaonYjiA5bCZM
	Q=
X-Gm-Gg: AR+sD10mex/aPR/vyLkqmaCjvKmGCfBKavflcjFh2nUkOzUlPfTUtUiUFgZ/VoDu0HG
	lDfqyxosAA9bfON0XewxRsCU5qGoL8rt5dNb3UiRCp7BTSOgabxmf1w9Q6AjuJCi59UJoBr1OTY
	pqARLMIP+phKIBNFllUaBhMqcgrapT3iooYZE2OwCR3jM6VmWhSknCWPeJmoygpPsI6Y3+H/4x7
	BYxTOotNqzynb2HkRGCA0oUcfNz58f7Ch0ALabVxD/PxOvHY8AeskpwCpbEiWS/Rjgf6dj6oXqH
	igwaDsRA6z34wAc/i+9CN53zr0WgSwMhQp8mLMN7fBQRXLMZO+9NQRpPbuAH+PgNAROsRnmrzG1
	IGyWvI3gQPxAWlKl0ymVI6thi
X-Received: by 2002:a17:90b:4c84:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-392ed50d590mr575259a91.1.1786438401273;
        Tue, 11 Aug 2026 01:53:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c84:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-392ed50d590mr575236a91.1.1786438400824;
        Tue, 11 Aug 2026 01:53:20 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392e5650731sm560412a91.1.2026.08.11.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:53:20 -0700 (PDT)
Message-ID: <366132c2-273f-4b8e-948d-4956e5241881@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:53:14 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] dt-bindings: interconnect: qcom-bwmon: Add
 Maili cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7ae302 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=x1iS9OEPbFcJzOgkp3wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NyxSbq90DqqVy2p4zSX12p8AfpVuigNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfXzV9+6RqLm8HZ
 Y+q7QvEw3MPMQgio6FCmL8KV2uIDYN7TBzg2fEUqnNP9JShtkZruZV9IEVTB94qNYqCuCv1bX3b
 94IOfdTvLgIzXtOVNpbnA0IAPWySI4x+MZJBH5ct0HDBxjp1oWtcrGVSsQAvxUuwUNm23Wa3VOC
 J9Fb7csgReiUJGvKWEec0tyyV9i6P5WvIG5f/JIIq9xtlPt0JOCVYzepIbKPS+qflNdByZNm0+1
 fFWkGn3VluyFBB/tUHIUJCx52LNesqgQVtMhhrPWIx0Aql1CRMF8JX8W2ZQ+dWT9GHjeIdRx7T1
 +OmZzAEDwp1gtNeF4ICO6eR6vUifK8m8aSRdUii1+prBMYhPJia3vJuggWWxjzSxTzyNxn9aq2V
 BeEG8kQFWhZxabER0qxSLpejKoz8uLki2iWJUT1jvKgEDDDlXU2Xmty/pwQgL/46dTI8fekZRR5
 2WMl+WYtThKSDsDf/0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfX3fRUrkljEhSt
 4/QbEZaeLfZ9/xMPnQAmmbvzSvbxu6PP9qbOJIc/quAsIHZD06h5U9Uz2g5MRsbdEI/usU/UmGp
 mzQEtYEOsr2G8z5rG4TRjTqZJyonwkE=
X-Proofpoint-GUID: NyxSbq90DqqVy2p4zSX12p8AfpVuigNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110073



On 8/11/2026 4:46 PM, Yijie Yang wrote:
> Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
> monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
> consistent with the existing pattern used by other recent SoCs such as
> sm8750 and kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop Assisted-by tag; no functional change.
> - Link to v1: https://patch.msgid.link/20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 82b1d94d3010..7989db1aa774 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-cpu-bwmon
>                 - qcom,hawi-cpu-bwmon
>                 - qcom,kaanapali-cpu-bwmon
> +              - qcom,maili-cpu-bwmon
>                 - qcom,qcm2290-cpu-bwmon
>                 - qcom,qcs615-cpu-bwmon
>                 - qcom,qcs8300-cpu-bwmon
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-bwmon-ecb43fda63c9
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>

Sorry for missing the previous Reviewed-by and Acked-by tags. I'll send 
a v3 update to include them.

-- 
Best Regards,
Yijie

