Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925323ED3A6
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013832; cv=none; b=A//CHjcHNMrpJIThK+x3Fv/NNTk72I+KJhCmy0ACFX5vYoJjsOm4lZN+Ox9F2RxxQC3dAj0yk52fdN/jfdh2eh0LbvPdxGdBTjIbKvLX4f6bnEzPDYAZXHMc7pfvzI4zM2ndnm7Doq+t4lHUeAONhYTOXL13TCCYsRybk6nORK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013832; c=relaxed/simple;
	bh=XL9p2IkZ32KmxlLmmFtMsvWL1B7KGM8TtwKZk1gBw1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8iP2lsPEqikaUMI9Oj5q8JUtLje6T4lrBLBLWcxMj2p4Z9TRg25s6vtOHVeWdj9wOJutGYh+0xf1GYW9hEc9QqF+fMN1AVIlNbvBReQDIP1f4d3uL22o1ue4YdYWedjseP4O/D5hb+PiW8ynQ/QNviijO7bPE6Zb1jwNZy0a7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEDhWo+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4bCv1rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEDhWo+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4bCv1rm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SOQG3718211
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=; b=cEDhWo+JVA/BiPDd
	0aYQ8pgBl5dH3x19afFnTUbnXj/H/bV71Ulf0RbluGHez3rhx1aRaxB+o88n5Ebv
	6+NalHur5tcanxhyQ5u/Paq6i85xRi9GY3SleFfnaneQUum+xR2QA2/0YmH4bEHc
	KVJ23vz5lp0JuNRZyOOwkiL7+2YTXmW5axgi3l4cYHwbEw12cGujWKwoum4wW4eZ
	8+uvR1p6npAElmD+I/D81worxOjRJCkElqkUn6+hs9OL36q5UqMf174NOaYLKujk
	/CS9DS08+Jrvb0I+478mptONxMaEdYNfboudOnbngceZXZ95LiV2Jx2f1SXgIlUR
	qXcrNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvhtae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:23:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso7081116a12.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013830; x=1784618630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=;
        b=a4bCv1rmBHQjaAlJuVlVrHimYtxQwGGwVmT531k+Tbkm95F1xveZna2Ky5Kc4UU6mi
         csu45/ILmj5gtiwjz5+7Bw9tPQwr2QPDeMnQ5rVHaPQu04iucKaMe6rPLh7ziuhf40IC
         /Pl0YY1CP6FtQkfJzFdngXWZ7oKOdCT2kg0jzhhggGb67ICMoCoST7S4CMxRYPYJYrA6
         d577WBVuzIimSuOkh5anXDpVXfyHDYs/HrQvRxO+eh5yhL8FV3D71+Hj+/IHsuj21FtT
         MTFMKJHuldeRDP2O76wwdYVoIqH3WhyM2Wh4MCTiRcMgEfpqH3/N4o3ibOhppl6oyWA3
         Of0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013830; x=1784618630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=;
        b=YUWoFkYjM1u2KmhFmJtM56TTN3LLOcFr5Rc7cWjn9EiJhOQjKYoWa4CRoK7TAq47tR
         AEdtstMi9WLnbsqxnnWNQOchU7wr2is8izl82wud2xIe7Io4x0QVnw+uvjSmCKgLQyKg
         GrgMplG75LPN8SY6+l36bHoXhoKi7nOYflOeCbStAkbD8uPrrmnGl0NP62pdtP2o0JsE
         vMXWHeNAPRHcFZSaO5V6AHY147zyPdaibrRLKhyUXr2WD4q5BlSUBZgQSftYvNLqh+oT
         R8v5zDveag5dnAfAh6Cv7lTc00zxrV4b/NT1ZWrHw6FcRmoyPny2aY67mS//XVI7yx+M
         KssA==
X-Gm-Message-State: AOJu0YxaOYVysAl9dpgzmJ4DMp0m1xZAiNmbdNq7sT0bw84x8FgLrSKK
	L7PMdWeyk/sPRGTr+YEPbRavCdum5LfCITo9G1KhQjy6s1odyZyqrSKGgwaBHboO5ZUzMaEZZCl
	X72QpedLSXPfbvnUBxm3hPlZMX2BJJgnJDT12sBUDSmwSkdSug0y4yGfWrP9VjFnp
X-Gm-Gg: AfdE7ckaeuUZfBPM+LUqamFbIN34FCiTqbVokb2GmQaeU/YYhhjMrK1Y6qyHtwYC9Jo
	xcFKZ2muqA0N5F80J3nonznIwEudnIk7hP3/VOP44IZpOlD8c/WSCG+OH//fZoGxpdRRD75LmzA
	1ULTodOFxKkxxuPF85do0wbS74M379gWctEA3lMOAf5U/ODnPwgVH7oRmSXXfdngXq2cZ0vJYVu
	lxGySsdKMiI4Ac62yDQuGOGqK+TomGC353cICCWxvBwSAskiRhPZEn84gaQDx05nvpLuB/SyerV
	TB7J5I26ck/KLr82ULA37pG6K+l66/TJg4hVXKpz84m3edmYz3Tgf59Ca+hmmeVZRuvKYY3WbgL
	TUtqc/dry93GJ+tmFq39t4WcgEYs3jsRn6l5wFps04Ovm
X-Received: by 2002:a05:6a21:6b0f:b0:3bf:6c05:aa with SMTP id adf61e73a8af0-3c34d8935c4mr3214595637.57.1784013830199;
        Tue, 14 Jul 2026 00:23:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:3bf:6c05:aa with SMTP id adf61e73a8af0-3c34d8935c4mr3214561637.57.1784013829790;
        Tue, 14 Jul 2026 00:23:49 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm83688207eec.0.2026.07.14.00.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:23:49 -0700 (PDT)
Message-ID: <36f74f0a-3dec-4e3c-9f3e-2ae5a0c6970b@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:53:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <20260709135418.9421B1F000E9@smtp.kernel.org>
 <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX2QPY6Qk1nnQa
 ITNXcbsmFv0TtNRdI16IroCrlXq/jPaj2AoBguMLPpcVcD4Y2Sg0qRLoUS893+51nbFTt0ZBDfo
 ESsFqrYCrRGLbNHNAvUUKiT+a5HIQ6M0WDjoMeory3P7uCzeox3I1a3mI0aRESHHQXKLKzljlI4
 J3IAfX2qeMYnwNg0J7bOItw8HbmePgs8LjPD6+ROZie+BH5X6JVaa1qL5AG0UNJCH4xf785PtAo
 cr1bSvz0m2wpT6wKTBBNPuKAF5LAAV1I84b6rpwImTLvTtpctVEBlbFckwgLVH/zHCA0spu6OuQ
 PrncXc7+m0GkTTtCpy79PC30skT2h68GMjdbOXMZqNut7qENs19VO5uJ8cfk067WMHbttrAyT92
 5mKowiiOtcRKulrbOLIkC7ord+9OvbLaTHcJLmQlUKDspZAWmZeh9nTv/4XK+/QvWuJiFll8fLC
 2TzQ3gYNl4M0cqBtj8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfXzPjhEc6jh/iv
 rNJ4fGrRj1QaxF8F/Q+2Gzj+7DQ9CwpC8sHXsUpcTAMU9tJDiP7zUuaPxk4yNtAMllwEpFLwp1x
 8i36xxUZp2Rid5wHzt6ZfEjdQBHhp/I=
X-Proofpoint-GUID: WqjqW6FyKXevHovGdLEPKqKf-jVhr9uX
X-Proofpoint-ORIG-GUID: WqjqW6FyKXevHovGdLEPKqKf-jVhr9uX
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55e406 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=AIMNfybrAyUUqzaXpIoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140075



On 7/10/2026 9:42 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 01:54:18PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Unregistering context bank devices in `remove` while V4L2 FDs are open causes DMA API mismatch and IOMMU faults.
> 
> Please fix the runtime issues. It's not the first one being reported by
> Sashiko. Please go through the previous reviews. I think the nature of
> most of lifecycle issues is the same: corectly handling device removal
> vs userspace lifecycle.

The runtime issue here is nothing specific to the subnode approach we 
are adding in this series. I can look at it separately, or if you 
already have any proposal to address the same, please post for review.

> 
>> - [Medium] Hardcoded platform device ID causes name collision if multiple Iris instances exist.
> 
> Dreams... But using PLATFORM_DEVID_AUTO makes sense.
> 
>>
>> Pre-existing issues:
>> - [High] Missing cancellation of sys_error_handler delayed work leads to Use-After-Free.
>> - [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `devm_kzalloc`.
>> --
>>
> 

Regards,
Vikash

