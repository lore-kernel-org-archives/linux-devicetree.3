Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684340F8E9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923677; cv=none; b=kmG1kcujZPoQXeP7mievBLMYOSE56qKnobD3L69pljOIqK/Mg9+kSsVKx60MmsHzpAqSIPCvDoQHznvqNQmcN2MdZrFytdz4Z4k8Q6Z+nyqLpEXSFt3VkD1JqyHJFjY4zEypelcUKMEDbWgmvIxRkO3ghRcmFxI22ptblAcw5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923677; c=relaxed/simple;
	bh=w9eYthRmToyVxZHEBUSOSGKXlrScyZ8dVcO5adDWwHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAJAxZWluDnU7MJTZAPRKaee8Iu/rBjCTUTHzDhd/5JsVemK95NDrvtX6Lkd1Cs/gmkLhQMh0OQ4kJdp9XFbWEkn9RPzmWBML0sTEKClqc23HccDwuuWRnXS7YO81XZmOvAysabyVTqYnW51pNsIerUnC0YTQw6UQwBB8oURhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSw+Xay2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzeShA1p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSw+Xay2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzeShA1p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dHjR2468138
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=; b=aSw+Xay2CPUd7el+
	dTcROs9DOZ2B1M0TLjCLjYK3a9u1N8imEmAVD7ZojGmhIkVWOmD+NOsHVcBsD8uV
	bxeedZgshr1qw5xMnPG9iomtAGOjanMvjngWd1y+EEXQ6FyX9fJCskERERjBUm7f
	MkOuZ/q3y/jWuJdUmHoLyf4RGkUNIMhTJ01yLu1KWhh5Z1SZ5IJ4LnwbtEDO/dtM
	nzTSddRE9GYbvBge2x0yPrHyvfbCEA5xHNyXA4ECYlsGM0SY9Z3LqQYUBVr3ZNoH
	UayD/fyQqMS1JF/suBoSepD4fMSEJncGzolJn5SMXqt8p67dWEyxC5JL3AA0L2LV
	2H8zHw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56kyyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:54:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso1142441b3a.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923674; x=1786528474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=;
        b=KzeShA1piaFrlBSV2XirGUH9Q595Ul50dEzRvTQM76OUs9wh5f4zei+TMMOWz1uaR2
         xINGOwymBbdIiFFMdFo4JtBbwWzvnJ34nHdIzSbl+HbECTJjwnKt/3WTooaHvIqa3ut4
         AYC1U68wppy6QDC0/Qm9sVFUeLb32YPZs+CkbbQxrj7ZopXTuxcAuSlaEzo6gpQ8pWZg
         PuUq7waayKAFRz+VfjUqU6IhUKMteeVpuwFJnGIBJz620r0mgUbuevOfKqQymdjQEmTO
         Ap4QocvnzBRqPbwOQl4fv/UJW0ycWNW0nWpI+MHoqAtk618fRypnejcsXNsHrsvygV7R
         n/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923674; x=1786528474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=;
        b=qRzD4cCmlAvnznaF1O9C+Hr0lAs4+GY6xQ7r7lGvh29pWjmCYKvQzC+0Hwwj+z3Fes
         19bYbRbTwJjTApOlZfSqOlE+NwXzIt4DnhrZTpPjZWwekGsZ0oulePvK+QwaYaUEFrGW
         kvBSch6I0y13D/JhCPzCPwoI30GVxpkRKVWnnEgp3hGu+mPb1vptU4mCIYO14Yo1SYLm
         YSVNgWgrTW5lANqttG1U/cnoXlEcqnCUNoCs2/zmBIJralYn0u2fUXgnl2bp00vAizEc
         3Yy0bWUWnNiJi3oeVRZHqhzmTW8oKS+OvmRrFJRpiow5agFVueGgg6E7elo/856oEn3T
         h6iQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJ+mcC9MP7QVxkogDAmkbGnHpOxPbNCJxRu8/6IpCExIph9WDhakMDDyrMEjnnVf1ApVs/I4Rrb7X5@vger.kernel.org
X-Gm-Message-State: AOJu0Yymer1bwJHbMTwfhXw6/dOERrrknl7F9rujk9cT4tV+aVpbCUWs
	pRpIlLcQ7TA1yjGNhC4cjpunTk+uL/+HqoDz4dsGpvUjGsWwuewukJW4Bq5jyY3DL3QAkkPpuAS
	MLYfKq30ufhz7oinI7vcW+11V9uPjMyHFrHGakMxTrjIcRUMLwRy1Beo/rRvxyhrJ
X-Gm-Gg: AR+sD121Wl6tIh27/yZrRnI4P/FX93BkOJ3/Ms0VkaL8EUSRrXOnl/W7AYBtyoYAL6X
	K/YwpF159Fg+O2pxHOLA7VKnigTrHoZpgt/4hI9ybsTuSytf8krovAl8wx+AsRuAloWf7fCl2/T
	VpFrazKH/0JdOHRb88fjecuSmGOIgpqyydQ8epjgE3E9pcyhG1i34kLXEcYiYKGZK4SuHl4BsMC
	q8aA8XI3QFGMRehHLydahKCWXRL+vkvlcjJmjRc2QI6oRRgAp0eq7Ak+UxP7qSBrqfgXQLHyIhc
	pXXUjEdGCgZnHSYs5zQpV3cpMOXDZMXzMyHr53sH/LTkWpYD9wfvLo830dnsJ2UjLZLNHHDM2vw
	/o6B4nCN0Q0BnaXpQVech0kCexpYXaK4Ja1NK6kYTormswmQAP4OAyaOdi/wEm/xqK0vti+4uj0
	o/hMfalABtUVi1
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr5504578b3a.23.1785923674369;
        Wed, 05 Aug 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr5504520b3a.23.1785923673869;
        Wed, 05 Aug 2026 02:54:33 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e507ac9sm609173b3a.42.2026.08.05.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:54:32 -0700 (PDT)
Message-ID: <a23ca81d-e796-433c-a1c7-ab081db05dd7@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:24:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <20260728175434.D70901F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728175434.D70901F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zj--TlomPuF_XaZfKfmjFcb-MDK9CX9c
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a73085a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K9zW7NHO5qA8wGy8OVMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfXxda7Ehq0a2ay
 Qdp+kCEaC+5fWFY+4pB21whknsyaDAtQYvLfMaLY0F3YDYs+SgkNJyzzgMA2i0tXUV1b2cTTMJj
 C4lcMVKgDirQCPv3FRBQT4uKnCXrCR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfX/q2vTPdDTFo3
 4bmm8tQWkO28+Jt7QZnzu0f8Wfc1agOomg0/KABaG2cebNWvqrI8cMZxcgLqmS+hLGDbGcjucS5
 /awjGJ0ntEr8LshRoKPJRKFvaxisNqUsdqKbxuYMtuIwz1GEHBuPuO3zmYrU2dttAmeJlD6hB7u
 jYEz61kHbDJmPIfferWrssJn0/5Y3jWh2I1GdFl44fH6YhulZ3Vyvoe4X8R8x5q5oP2Zx5y18Hj
 6AjbEvLZwurvgjnvGgiAMdF/cetuc/30pC6Qmn9bb2zusOnOYHWe2LWpxm7907twGrcwjo27lGV
 lRk7gpZLuaneTNZ37NIiloMi/0Ay0w0WWU9PX/eMEqbCGxDlmDDB+WQ+bTIw9EAOoVTQr+ABhf2
 QgplAkkWTF3YdDE1oMmSQgX6jiOMpazAmafH+tCK2VNv6pgJHjg8Yxo7Pit8HqEzx+m7Ly8voBN
 hA2nHNgoCpf7AT5crnw==
X-Proofpoint-GUID: zj--TlomPuF_XaZfKfmjFcb-MDK9CX9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050078



On 7/28/2026 11:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The custom `qcom,tsens` property encodes a driver-specific software algorithm into Devicetree and redefines standard phandle specifier semantics to avoid standard sensor enumeration.
> --
> 
> --- Patch [1]: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens ---
> commit d7c232898faf92bef60389e6c46fc016182bd22a
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens
> 
> This commit adds the qcom,tsens property to the Hamoa-based boards embedded
> controller binding. It pairs tsens provider phandles with a count of leading
> sensor IDs, whose readings are averaged to compute the SoC junction
> temperature.
> 
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> [ ... ]
>> @@ -32,11 +32,40 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>> +  # a devicetree concept the EC cares about. What the driver actually needs
>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>> +  # phandle with a count instead of enumerating every sensor cell.
>> +  qcom,tsens:
>> +    description:
>> +      List of tsens providers and, for each, the number of leading sensor
>> +      IDs on that provider whose readings are averaged to compute the SoC
>> +      junction temperature reported to the EC for fan control. Only
>> +      applicable for Hamoa based devices.
> 
> [Severity: Medium]
> Does this property encode a driver-specific software algorithm into the
> device tree? Device tree is strictly designed to describe hardware topology,
> not software policies like averaging sensor readings.
> 
> By bypassing standard properties like thermal-sensors and redefining the
> phandle specifier semantics to represent a count rather than enumerating the
> specific hardware sensor IDs, does this create an incorrectly designed ABI?
> It might be better to rely on standard hardware enumeration and leave the
> averaging policy to the software drivers.
> [ ... ]
>

Ack, I'll drop qcom,tsens and switch to standard thermal-sensors, moving
the averaging logic into the driver where it belongs.

-- 
Best Regards,
Anvesh

