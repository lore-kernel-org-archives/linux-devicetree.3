Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5844F7997
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778221; cv=none; b=o0tP0YSxxgzsX2lhLLpDvIacyU+w5IE66I2c2/vBkRiq4qpPa0hYthFvMXgL8lwo9Lk5eIpVTqSN0Mv2gMV3xJqblltq4cNiY9dE4DEAepEXr1jzwnYNX7kSSFAjGLOpIdZQcW3LKdbX+LMaNEmRPmGs2MkK2lKgiFVBjZsVq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778221; c=relaxed/simple;
	bh=iqtSTD6OUVhHsuOVFBZRomoc1pV+EhDwDeQhI7v2B60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fij0Bq9sCRvEJ0iz3wvAW3t0a90C1NWUd4P28hK/C0qDl14NvDCQvHIsclKfwPTwNcSxB80ew0mjgisEYqIlmAmu3ns2MzEmacKLjmaEYIOcRiUahYlEQzIjCB5P2WP2tAgkWE8dt3S42TEnQUlG+mofQOH1FV89RNrr6cGxGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/E9aISu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0E64zNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/E9aISu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0E64zNG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0EE74179032
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=; b=H/E9aISuRD3tFJVR
	qXrqYGHMnZllbufIOsN6kXaaMCcijMS1AzFmhsqdGj4IQO56mGauhv1F+RmxtXsR
	6Dlaxaxqlv/ZO3MKu4FAqCC6a7DXXU5KC2UHy7EmxDEb1tnCPD/33gWsaFOABArq
	RVM0IhjZwXPLbrwRvz/d/3pLZp9lnpGlb7tw+8G2tpsuMu+/O0JvvwymeUKSET3h
	S4CEUYbGLCN7fWtTq4BbuMShzVpWz96zqPQdUdu75yuQpgSh/Z7RaZyNNlO4QP5C
	t+SCOr+Mucb53mApRhMb5WTMqMiDBH7ZFjDEumy/yGBbSeH7ua+Zkl7f7ZvrMDvh
	4YxS9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3kups-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:23:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so69295125ad.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790778191; x=1791382991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=;
        b=A0E64zNGrNi5m6BXAdocLS7dGAbeZTO3f49Qhj85c8PaWsgLvagEMIXh7fJs5CfPFn
         xlqrcRA8er2BMsrecIVjaZLBXlECsk6BPzKagrVYRnXiInMqUom4ceokyaTf39kxtz9W
         KrW7GmpKtC9pxU6BKSZLt3tRTXe83BGtHcJRfoOiNV8XIe4ah9kbtnplSh4gsJ5+xVjb
         Tj7qv3eS1TU6kjsOOO6uoTHBoKBBagCU8lsdP1iHKKkt4NI5nYcQ4ujOawuoFB3uqsZZ
         sBqPaB7hQGUPfgsPVe28AE6VQ3G7eZC42lJJha3hLkO962Dd6obDCQqHak1WV8m4PG13
         Bh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778191; x=1791382991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=;
        b=mCzuRrfnHP8i8K+0iSh0fJFkU3PA9zAgHAjlbtyugDH6wqtgKLMeUfupTeFcWFuzag
         2gp9HU62OFovaRkn+42ivAwaUYhsvnw+qqhtBt6dBp8dClqaYi0XagSKHRJBZzwb61Ra
         pXLK/fhKaBdjwhJsjLgZ5QCIh0wPiE6nY5f4/Iwes6U+eulRMhQkukfEZXsLRJHWAOPK
         ykT1WeIPb/tpUdc1+81kTFjHBv/xFB3PUC4sylWQzjKwwxmWIEoAi3yJvk7D67tuA4D9
         3WkKik76fEi4mxb25UpdVOsMOEzCdmCTP50sVqliER8GyvN07YikoNTAijRZuU61k6cz
         Gzmw==
X-Forwarded-Encrypted: i=1; AKwUvBxKHGJsB9iVK9gtz42ZiIs3MsUNo7Iuk5FwLYSJkvfS6hFTupZcV6P5tGz4DbWls6PdTt9eY3tLSBsJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKL7+W4bO739kVzophDqTw4SXy/crDcnizoqUAqq3g+zEttz7gs
	yEf/gOk4MkGPJLnsx0f3o4k/8IXNl1y/hsDWttcJrurcW1jnOtCL0PYxoWAtiU3F/oh4uoZz3RH
	H1YAjmCuvBY79cMM8bFaaaoiMVlF9nPDs3EImHULsxFCqB/0uOFpvoPWgS9vGq5E6
X-Gm-Gg: AYBFou25+Gfl6mt6Q0+Grqp7YP9A0V3XQpqUnczcdHNLcWO+MF+h7yz0l/OCp815lKi
	jDTb2xJfQAZooyQO7NKBYeLQ4StBKn+pUHwmX3GcskloslNIbAT3Xk2AxjUp822cR4rTDm5IeP+
	cUycJ1E0S51hEMMJo1nCk7+uCrR7opBNVgTUavk+2CYgYbWMXQ/mRLGA8HgCcNrV+qqkLq+pKVK
	fxR/XzNv/wfZilWEB6bH5CzgeptXwWNSVUbmISmVtECdMSTYMZ/snKX6j8R6XMjvHaJm/iWSxH9
	K95JcX+rhRcCRwPFgmraCfn6BjIxP+utAKlgr41u4A4yAxU5LXQesKdfkZxi46wMjgLk8oESmdg
	GgDnwD/qwsYmBb2M64dMfc6Lc3ntPaQUOFvVMjMR5v2N6T7OW3t4l8V/gKB7wBBQ=
X-Received: by 2002:a17:903:32c3:b0:2df:964a:fd42 with SMTP id d9443c01a7336-2e2e4b5e112mr12495865ad.38.1790778190956;
        Wed, 30 Sep 2026 07:23:10 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2df:964a:fd42 with SMTP id d9443c01a7336-2e2e4b5e112mr12495585ad.38.1790778190243;
        Wed, 30 Sep 2026 07:23:10 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d2desm8727315ad.12.2026.09.30.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:23:09 -0700 (PDT)
Message-ID: <cc620871-e6cf-44a4-8026-ff42f35efc15@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:23:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
        neil.armstrong@linaro.org, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
 <20260929060743.537E11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929060743.537E11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pr7p_hJKGkmvIqx0E97zqJkcxqnDwza9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXwhoVKqxTv5KW
 lwmaYUjlpaU76EZW9r149RgvwgJgbmyGAiah9Vgjq/knK6PcelqqzMZK9bjEFeC9GzIqUolDmY7
 bgjGKJFH/ZhpQ2ouxyo8eGFXxMuI3aHxqDx+CCMx5o0rZsjQ4WshzP21670L22lLA60KJ56RNjV
 5HJ7uyVH/05wkkdnCbcADddgPvQ0I6Gt0+zk1sQLdrgoqC28KJKVPN2bU+OnEVbY7WEpcK3xqbT
 YY2bYRiSHmdbqPEPfw/JzLIjmIo2Xl39e05PgjWx0ob2jiaiMGM7vG/jC5kV8ssGtkeLvj7mFNq
 f29zT+PnBrnPYLQ7trNgdjj+bKHSUFB0wzohPgRilaYdnt7nWaosdEHPpaWwnnxTndVuAztbN8l
 CNu0EDsDpgKQDuYr5QcdnwbDFiUfwrCznrdSf+CY/irkvqCWLdoWpuLIhSlIyGz5C/1G07xv4QA
 NkPtNGLFuCGfKzJcgCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX1NrjjrvCbc6X
 wqYX6x+IaBDFJF2MbfU6BWcivaJYsqN9QrAiC3CXwt0DqFCwoqDGGS8G8hQZZ0ReaWjD+OD957i
 6jwvGOGRxKCmq85q8ZhuXSC/cFN4+Ys=
X-Proofpoint-GUID: Pr7p_hJKGkmvIqx0E97zqJkcxqnDwza9
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd1b50 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dezkyaf-IGWI9O4KkrQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057

On 9/29/2026 2:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: devicetree node names incorrectly use underscores
> --
> 
> commit 185a6cf958fbea99362a9e2c9f3989dad4362d3c
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
> 
> This commit adds TLMM pinctrl states for the camera master clock GPIOs on
> Kaanapali so camera sensor nodes can select the proper MCLK pin functions
> when enabled.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index c19945bc438eb..bbcd5a622f0b2 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> [ ... ]
>> +			cam_mclk2_default: cam-mclk2-default-state {
>> +				pins = "gpio91";
>> +				function = "cam_asc_mclk2";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
>> +
>> +			cam_mclk3_default: cam_mclk3-default-state {
> 
> [Severity: Low]
> Does this node name incorrectly use an underscore instead of a hyphen?
> 
> Devicetree node names conventionally use hyphens rather than underscores.
> The previous nodes like cam-mclk0-default-state use the correct hyphenated
> pattern.
> 
> Using an underscore here and in the subsequent cam_mclk4 through cam_mclk7
> nodes will trigger dtc style warnings (node_name_chars_strict) and fail
> standard devicetree style checks.
> 
>> +				pins = "gpio92";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> [ ... ]
> 
Yes. I change original names to align with Glymur style but makes this 
mistake. Will fix it in next revision.

Best Regards,
Hangxiang
