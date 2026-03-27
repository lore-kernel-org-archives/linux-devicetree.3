Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F013DCDA4
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605216; cv=none; b=qauMUq5ATyBvvR8AwbJoPcUIIsI8sS+QF/kgUTe4fZvnU31KIqRTfgCN6UebrUUHMWdSTcvbJeYXIEgZMwCsb7IjWI3Yvy0jeTy6oahV60XWTEWoLbKFfvKiH/4ytIEJJeYwECueyUiuNTJZG+zybhFzyDuwb6t14/TTPQkLIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605216; c=relaxed/simple;
	bh=w9yGN9eOdO/zZzCn0k+SkHWxKOFhuqlmn8DxCGQDCSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2QYCiO8M+ajUArMwECDp81L/u1tNL2TA+5pQk5OtHGk1wxJu8H/nlimjLV5Fg3IP6nMGjoJzSEEDr2xXUXtfcM+oQ8ILI+NdfPfDrHRelurgGOWHRV5eqHuMchqBGklb7GmE1w1YSxlhgiHct4wvVdydbfdb+oh85V2PuzrtQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbpdgKcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2bhHUbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbpdgKcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2bhHUbZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wLio3718198
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=; b=bbpdgKcBPdpNuwSV
	qtGd6seI0rhngb1lywnccB0bJsPkm8RwrI2WuOm/oSqq0wZWfN7LOshp0HAVphac
	orgsKZT/m4lu8qG0NcFpI/f9RogXk0ZeFTs6x/3h7btUWQv/mDcddCCgOevd+9Lk
	WortiBgc70EgLSVwpdzLxHOdlliv/O4mPdNchyhCOyIQ90Elp0bLIzgZ/F6CnaAJ
	pTVFHl4NCPcF0AWBoQMqox+Y8iBVLX56g7d/Vdb9jSuM6lXwlIl2sBNyvaawKYvx
	3y5uiZ5HUqqDLw2+wojwjzx1t5P8jScbPjwhCBrOhc1WqPot/dJPHCGab4YqvnYP
	QPY2Jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6j7kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:53:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899fcb63705so5395456d6.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605211; x=1775210011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=;
        b=j2bhHUbZVNA9U0IsTG/K1/BaVneRtPChKWIxe8eMeX+FgAonUUuRJUg0obN0moaEkg
         AarmdS2NZ9jtL3KLEXDwXAH6RM3U/sfP3t6QhON4Nl0nq3lAMAWpVIpn/O2GzhgPXRLl
         TlQlAniURW0iyZxnfeF9dK7I9Ss5w8/kUr4mXqkrcVKoJRuuwZ6v1NzqT1hBc4nJ0kf/
         oBN7R+KfTWaTVX9n/hYMQpCV4gI9Fhh7sAaFp36QBdI2Rms/EGPyyr2sPLAcpRjdaFP6
         /ujbn6l+UsyahqHkJQY1acPidI7d/SB3CvZBXG3SVoXuZdbhiL+yY2Xb3HzrWax5dTfw
         jIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605211; x=1775210011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=;
        b=qgkisPNLDPhB2GfPMFze8efz9R/QICaTA8zSxmomNjnJUmoU3ZTPZDwvj/5wDjKC+Y
         fGTYSOwkgER3Jbs6EzU2nElwE6f7NEYt4t4A9VqoOxqoyrSWU4P6/I+UOZjAh7tdMFrs
         DtZoDfjwexwlX7rmFYCH3YVFoTsRrAOz/lfEUpss531cipaGtJk0QSikvk94xs4QMNiR
         Ho/rE3bS2M3aQV+5YAV2oMgykeRED0kH6r7unlo6wcWvBKckuP+AX/0T/S8R3P8HdB31
         V+CwYMCDpQv/rZOjO+GRwZ5OCCHyRZmfSv0O18tR+PHKB13XsWir81y6Z4cfMw2spdbe
         OQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6EcQ1J3N6ERufc0OpZuROmDrDDcks37aD78WQeMoxbglmpBMhpPt28iUOVrarPD8WJzHLqaO7COz7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqz/PB0LahD1t7P5klg3s3EIrkh8wHOTM6k/mCsX9HN2GkHpvz
	ImXSf074F4eqclZSAou1TuHDORMvpu8Vn+A3VE2pIN3TsxHh2B8WOhlf8rCRhWZUfz7Vo7FTMpg
	UJxfCfbv1RvwyJPxSXBY03kHdz3peT+kjUs2PIX34MPykrrZ/gHDV9wzFD29mFTheGW79pXbB
X-Gm-Gg: ATEYQzwS6dK8+hUyDXuZgMH3Q7M0fQa6Wd4wQ0xT6R8raJAXi51F2s2Mrw8EwcjI12s
	kWhlKHqkcEONqHLbJrOrn1dNqhOUoqsm477ENqRO3kxqVwTfJ01UJtn46hAWjM77iU9b0cvGU9j
	lRFKJNGHpN5U1tHro6mgxc8kooH4Z6MobZ40SkkrMyusvisq6an9RmMriQXBtDg5aoE+f6e0I0c
	R9Vn/JfbZzYE3Zc2NS1Do9mD9r8XVcFrLy0rNixJSrWyuKFYo/e94vo3wrq/qSmFKFEzxrLRGka
	BdkzWCh2n4eefSMM8WqANSEctOTRh4aMA3JXKQz77cmfxskblBaNKqjtlZUMG79ACSNq1qfBcqR
	t+EBjK6rabWjvN1P+TjnvCk/+QWBBhz2b7Z0/aIZiu2k/LFmxuDq/Almh+9kEQaJZP+WiyURURt
	hS6nk=
X-Received: by 2002:a05:6214:5191:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89ce8e664e1mr15408926d6.6.1774605210943;
        Fri, 27 Mar 2026 02:53:30 -0700 (PDT)
X-Received: by 2002:a05:6214:5191:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89ce8e664e1mr15408846d6.6.1774605210547;
        Fri, 27 Mar 2026 02:53:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267436sm212160766b.26.2026.03.27.02.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:53:29 -0700 (PDT)
Message-ID: <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:53:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6539b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PpLJpvi--JZafMB94bwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fsdoH7Y6yTAzIGANn1OuQbrkR5VX2nWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfXyKsZUotYclsI
 aGNWM+5aLq2xUVvB8S5IheXXk3VnoLhbiN7HxF/fYTRIRoN4btEGic4mie1q1bxk9orgzDDvWWF
 TdCvysCLb47g+k2yPYFRZ8Qw8dMwkkcB0SxCmwKd4vptaz/eYFqkRww5xl/dW9huxTI7TO58IDM
 A8JmVuXQLhf4d/2c1RZEni0CEt6V59XaWwKGQFLNWoSpVr84KJUucyPuLJaxDw288bE0HqE23CU
 e3mDQ81sYRfwRSsUApL/UKQ5PKMBP98hCfyRYGWmfshv6Oey3CGfVI7Eo34cxOc6d+G3pNxj8HL
 hejL2jK31YvLR3xEhTrgAQQWGZ3tMmypujT6Zxo6vZ4jzk7irqUFhKyXOzumoXAA3Y7q3B8IcNn
 MZ9AJDcnnMtfyZAq2ChjwNig+tPe3j+TcB2LZWpffDxVFkbl+UxicRZkDAgYpOBtNQGI8up5yXJ
 gAyU72xPsbMjORZuSjQ==
X-Proofpoint-ORIG-GUID: fsdoH7Y6yTAzIGANn1OuQbrkR5VX2nWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072

On 3/27/26 4:20 AM, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali QRD board.

This is really more of an "add firmware path"

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index da0e8f9091c3..6a7eb7f4050a 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {
> +	firmware-name = "qcom/kaanapali/soccp.mbn",
> +			"qcom/kaanapali/soccp_dtb.mbn";

Given that this contains battmgr now, can MTP and QRD use the same
firmware?

Konrad
