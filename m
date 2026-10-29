Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263628;
	b=SeB/bBaoa1locDwkKTVWwLAa0sM9pGHWVpbvG096TGWDCF61y9CmFxAy6T/tP8w5jIdu
	 I2lzLq8OyE2eRlGvqLhXYEX+I50qfnFISjrSi/PzUmz0/aVdu8OMonyagYuL4YO/Q4frq
	 F3M2jPm9ZOedILHy0fMWlSE4ByZDzqmPRLbXy+T72A0r6hWwcyirC/F3sug7p7sb2CCBd
	 K2r2qA1/mcWHeSfbrFCG0GCoEDUTz1Q0CTjhj3RyRQ/JkGGRLA2956wT6YPpa5H5g/ld6
	 Bs5HTrWMaCC/5l1XApeb33aruBZVwA/2vtdSYtugKRephgKzVIMtcovUHeIXBbQqJig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
	b=DkKGMDvRtUOjodYR502VrHFBk+frlVy1YHlXgDDqLrJ2UWaXO9I0HDy0F8rmOpKE/Js6
	 SkNQmIHfCX35iLNbHm1ezd3zmUQB++Zarp8m6j17hDguBxmxH3/lcMAK7N1VgH89tWWr9
	 v4aPe0brAZ/wxq3J60SeOpway8Sr1I2ZWyhZ10v92rFu4L9UnwqNNs4yVpD5vVAAdmw1F
	 mYD1vXkwzC4zDU7ibCO7o0yNMr36QkrarI08VB32+yRFSSrdDfjaLWJbKney89ngyzQ/o
	 VHZ4zGpyaxJawnh+Hrw7pve+cjAtmB6Wk2dS3urNvKAL3hycu09AqADWTDS0qMoCWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URe/yDo+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F2606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URe/yDo+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HeLS1793442
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=; b=EN3iYYGWjgvabrIc
	QO51CZcIcn1x3YZfiQzdD5Jqoeg8nrAlCCi6Znrjz3SPE4tOXrsuGx0pmgQJNCGt
	q4DVo+o2oR9R/xNUZANQSDtUIdD3yGVdXnzzP5uYM00mmKKQIMF6XNZkb0T8Sz11
	pH9uLaVfSmoTNLL+DMhNMCUOtYCikudcgqqMvba0tQYrIoj52wxUOOJtXW1VTBcC
	KtVVXpDHSMhEej5G7wFzqWJ7XbudUGD4mvib2ooPhYE4o7EQkPy9DdL5iwD/v/cZ
	HKSA+hRZ53J1FqOt8FIm1deEmgFKaa99QScc+T4BDB4VOtEQefOcQXB2KbwT7vNp
	lDO3sg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnm5aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso5495771cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263626; x=1793868426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=URe/yDo+/DX8iHp5fD5XH34cPlGO8cQ/P+tpGMdZisFYTMd2uBxI0XxQCNsPYWq/j1
         UVUZd8fnkU29VnPq+GM67SXhkNdG9rNjglgH5gsv9SNv+7Uxzs4LMhZOkLfV1cj2XYJW
         kGNAKYaJllVNIAXnm6NTE9QDeW3hmVvsOP3ERuasDKT93Gbk43DsP/c9MjghWwBTJNZH
         5GZnjTIabWJNB5iXK08T8sKmykeyL5+oXLAGFbVwX7Hdx0ahJ1J6520skQs9diMIP5mW
         afmxGdnXft4YVm8pHxKgBiiQT3Gk+GG0go/PQxnwcR3jxaCuTup856HzHJuOYLy3/fHM
         /l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263626; x=1793868426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=KHHISEsKZPqKOWqe1lgsQvVko9+EpaLUQnWTv7UlR3qmR/3mlrBGKuqiGSNvhc577C
         tT5fQfT2vWQrAUx1AeXlr8nEp+zq8dvvh2btXht1SAR6SAt6Ku7ocrSIlUgE4lddbX5Q
         QxgN+hJQG8Qk81a0vrkxcmHaEc3zd21JiiC5Hfl2iFjg9S5DaEM9/Les9uZycmDrmLBn
         5qBJOAwwU+KqIpdVyIQqfwkgflyiEf6C24PIKSIwL7t7TSPce+ldR6j2OPkZKYKSnZ4i
         qi8BJrQYrFeK2Qa/rJDF5RB03EcSVWXnX0TLvrCPCXqvPSMxN1NPBl1dpuxuJDLtN+lR
         e69Q==
X-Forwarded-Encrypted: i=1; AKwUvBwz+ywCxdoW1rC1RwTyC6OVx6jvELhue39SLo4qzT4QFkRKJ7r+bLZBehmODyQlSgMTeDNe0amPUwYv@vger.kernel.org
X-Gm-Message-State: AFq9FYKTLoeeZt6415Db6s2Wo8mx+IO9O6IxJy4F79RZCO3MHoXyJnFa
	e9jQXGciyruO8O9xvzoVXDMxThtiCBERsYzEY/7qqtwuJLSW91TkzOO78v+Tt36d+rHK091An0Q
	8Q4fyI4S5V1oZIHEvqFDitY3DH8hrWCAmuunCUEddveHfHtlj+cLXf485d2jF9lDw
X-Gm-Gg: AYBFou1qmKlFtxsEXvQ5eL9D3LNZ6r4TSY75pnhojoxFond7czke7AceiciQ0nJFhgR
	Ao2QqNkNcIOw1UZHebe2jao7gbBnpqwgg+dSegQC2dsfyAJ6UGcgzPJF8k7PBDcdPWtnzwWqfrm
	0B208Qb//Y2rsytuir/1+WA67kRsXstMPdCww82TQ1I0SYyKVbb7PiStZmHvNGhISMpncToPXyH
	jNnWVYCdfPPSUep8HpWhDMCONxPyLsDN1mvzTzF1uH7OpJ0ppBjJmswQUKg+8GMkBX0hVAAVITi
	ZldTVfa+2AmMuholiK9trtaJ3pHveq4BoGm9gN4m7kAkjV+2vb+/qHK4BEGG+CZJr4gSuj5I69x
	fF/krvhEqnMsbbDsZnsFdo4A+TEYhGalctoKkol0rKyEZM56qQQuMHAAva0B6q7L2wFJzu/s=
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059741cf.0.1793263625699;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059531cf.0.1793263625147;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm710387266b.9.2026.10.29.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:04 -0700 (PDT)
Message-ID: <f7596b4d-20ea-430d-948d-69d42bdca671@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yk0pGH2q8N7R8qocmlRG3_KiObnwOg94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX/EXg6yuE7TK/
 +0D6idV1Fq4uKvUONiTmLAAc1QFBWwTMRA5kcB9MFzjrGNiwq7G4EfOdlzxf04rEhjnidOzbi3M
 A+rRwHKJEuVh1Y026B2B1T3KAWV3qo3tDx0Li5VDJYcwplOuZ4sE10DcEmC4AeRX2408JRQQFgo
 Q3DgA2BbqONH27b0QOnmhBjsF5zdzzRE7HP+5IEK+f3pRsLwu4vEXV3ctVCQi2gY5cosej2uPwM
 vX6JiFVwYWNHGn0oZYn2BHUF5IYFhB89juVXrCgmHcdR+chbDqbnYinfKHZsjSsdOtAF1XmY89X
 3p3aOuBxBvf7/3URv4fNLOLpWxag881pRFOVRVGlfQTZ9lqQQfn9ErZe20gJQqfUEfYrNrH8QJY
 W+B3MqDjVgo+q8BKKWz/YXdSpYF3kEeuvlFtk4XQrDln1UFM3T1GakMQZ9pLYoSLbrBp+dEYppz
 KoMwgXJM4TYceoE+otA==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae3080b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Yk0pGH2q8N7R8qocmlRG3_KiObnwOg94
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXwU3k4xlcmkyG
 qfcGAdnn0eZk4t1BuhGhCRQYvtR0sN0fvBwtt6aBaPmjeyMr2eTt21KoPets4xvcTN7TLLnS6s7
 NCduA9JwQ+wsz7JncKr5KalZ56mXmOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
