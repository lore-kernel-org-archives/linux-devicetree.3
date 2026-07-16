Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF88388369
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177265; cv=none; b=bZ3IQ2/902ciRwP7Pc6hQk5As7aGdBQVbsiANywbT+ytHBNKs8z4tjsIJXXaE12buQS6L6Dl1l+USc3PjYL7kh3VzD09mSNBpLi2G7iLpl9c3ky8tU5HGTy3rtRUZbDHB2jQSrrjrU4XSJTRth5GT+7C7w6LiAprYoU0Rm193vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177265; c=relaxed/simple;
	bh=QFBqivRSK+b5b8lZbMDWE3tGj8nAPLHHfK8uo0AM2ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0+V+9iEeG3+lzmmk/uBkTZddTM74gifoGwfH+SRW6uuK3lNgH8UCErNL0wh7wRtXHGjyzvL8YvQZ34JeYVMNskyOUCdnTVOcdSp4stP6/1Ujmc+8V2VEy6UIv/S8jRDCUjDOVmDg5uZCOXjRYto8IfgA0jMsEJ8eCDdFnOZNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3PIFbZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8xe39gx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3PIFbZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8xe39gx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wLpb1444472
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=; b=N3PIFbZ/3CUCcwxl
	16MI+DEbGh0CUVyBKXpVPhXje0AmXZsbyURZrdMZMvvPXLOa0oKQTHQ6sOj4yPX9
	QK89Fh6lCjN0tHEhbEbfhIEPsWd91NGwDcOO1BaWyWhaBkZ0KJ+RZAU43W9ctM5x
	tj6YIbtPz5JCI3CXXmPglPYgK8UQvmLukdW8AvtTFHyzJ0owR2C2P3TOrk4QWbUc
	9jw2Chi5E4YehjMoiDcHy4zWpFRSwi7XmCsB9sz7sUEn+1aWBGyMntCzCOVZfae4
	egGvzB2Qc0QRMt2giRDLXrO642d5xa4hYu8ogBWzKhBcWpXljCdCI1bxyvag5CCn
	QUKTqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehva1bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:47:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2466454a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784177262; x=1784782062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=;
        b=I8xe39gxSTaDNfwmm7ut5hW1/oWD60feJDBg4x3Z8qSLqDKAF/xs96KgPaBDYn03EK
         RfjBAVXlByEZvBhsns7+E4BXizUIv7qwUDv8FGqUmqp4VKeKR68a5mdPjwZm8mxP932/
         Vkj3WPh10+XpYN1j1zSefQlaR1X9d/Sjxo4BQyOwpqvcfqYgvbqJmLDbUV7rtrw1c/09
         SaztZ0ZNSXtr61/8nOItH6/Vj0Upg0h4SmyOSeQUXVdDRd+XO/76X46HYG9c6mNbb4tL
         85pcfeQ5A9i1Zdbpughnq1OgS8r3T64MAH4HKQVgiVT5lUdTvYLYkRWJbXQ0VnfqJP9p
         ugmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177262; x=1784782062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=;
        b=Zlc4NVhl7cUMJ0NiZYhh/FPyy+fdqDNS9LOjv5jUH+csM4p4B6xGitIT373FNMFYcj
         4/2vgROfPORtmO7s44X3fHzAqHus0fI5lF1V3/Ni/QSoxENUXm2fXWdalGY0R7B9di4W
         3o4oO3iewpNqRH0xTAXEv/0oidzED7Zog+R3G8eEyKZM95qjiy/RMzr/+K/tutyeG3Vl
         PREEE79NHseI4CaLmb9unZV8ALiFI7Fndb5KFAF7tZfuTFPFP1Xtxi5pEdVe/kqFIY+i
         u08KQHlWyUuXtvTu4IhIIf88/E5l0LEE2BLgCXBc+X9RwOf4iX9TBkGvpyauL1B3737p
         kRrg==
X-Forwarded-Encrypted: i=1; AHgh+RrBgS+S1k1aVagtz9Tw4strrUAJeuzH4SePdVJlJ89cLONHQfntogglgHd10ykf6gugi8hFQqTOM9Tl@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpsHpZb24Neg4lqNNBT712sBUZAmh2r7KRy+5kF9p+1JjadL7
	k6HZPOKfD5y7gic0Z5rM3WHdO9uVmu5xmYxlE74NJzWXdlc2vitNaEKLTs2irr3GSTd0nofOXFM
	s4UtqOQ+BT643MRjqkl7LhxQ/MMUuGUH34cpkPrY4I7Zh1xi71Otxy69W3wz5CbUf
X-Gm-Gg: AfdE7clsLFweMpCX+98lbrwFcTYU6GIvoB6iUIKcsXg3JaJCqiWigSjUbJaQSAzZWbT
	52tMtbV2fk/RotP+TwDDt/dwvmySEh1HTQtKpGzRVEcAW6QWx5lVtB2adl4MF5rS3lsq8yYURGz
	fZ8h9wfnwrWmQ0HDsc9soZOMCCUY9onxmKi3Up2M5WMP3knLC9tXA1TlD/h6HOvAyCmLDKKajfP
	ERxnNOAkY2bFGQQ5RPO5A7ZDzYRCyW9FkvkQbLZjMVTSNAyno9K9LUN7E/b1QVEXWuP2mP29DVt
	pmtiSCSiqROP8Io2lggT389XiTh7noOIJzQ8MGlYq5mybOVggKffyYlAASw4Z8Bvmtr43RZ8EBS
	IuPq89lYla2yAFyr1ANv0F0lkR032FWMJ
X-Received: by 2002:a05:6300:218b:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c110a74745mr21950049637.40.1784177261913;
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
X-Received: by 2002:a05:6300:218b:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c110a74745mr21950022637.40.1784177261458;
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd403a7f7sm6422098c88.0.2026.07.15.21.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
Message-ID: <5526ee46-d31c-4f01-ab9a-71bd831d0193@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:17:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
 <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
 <20260716041531.83FED1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260716041531.83FED1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58626e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hYeTZUUZs7jKy9qBROMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA0NSBTYWx0ZWRfX7WBMJlbi6SIS
 k5JUigITNRgEs8LDU3BSUlRq0bzK+QYuuu6V2rd68bc474dikhG0UhXNw/Uy55CM0u3TVq9LC6N
 gROz9v01XhFXcNDKoQG9Uw40vS+nLLXR4CZ8zl4qUa75wt/WbfedaByWBkpyp5qB6a3vSz9UQBi
 A0Blpt8x0d/oLsgEVG6X2nS7fOJvWPNlB9E06k9KFme8UcLFZqrdUtBovTXB7HKFoz9ME7/mN6v
 4y2m3abAyM80BPxlT39MpaFdPv/x6XRTRxO/InJEAfhAI93wXuMxxRkFATjwxo2It398EBpS3rS
 Zeu4Dz2swgmXywcTHYtlACkQ/EMxVSdj9jMwa88Fh5na8a2xBDgtgIdR/tII6GBEIS4W7J+3yii
 WKZY52gUcngVptKKTCJoyJEKdEKKGQ24yc33Wt4D0U3ZWFtLZa8BuWlYUbkQsBXoSe7XUw48kTT
 3GcMbZ4h9BWuem+rEkQ==
X-Proofpoint-GUID: j8WY8zB9LuQq1hqutWI506h74FUgr4km
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA0NSBTYWx0ZWRfXxYw1f2bl0ccC
 bhgduvPwV5HbJdWj6jqTBr1rQvz3adbDd5qfF48Qp6eXm7qTYnmyFhBtMYCwnaGntZmD4dlh2UC
 2ZGQ0PvHo7Vtpla/dup4tT3KWHdLRps=
X-Proofpoint-ORIG-GUID: j8WY8zB9LuQq1hqutWI506h74FUgr4km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160045



On 7/16/2026 9:45 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Spaces are used instead of tabs for macro value alignment.
> --
> 
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller ---
> commit 1f9a58072beaf3de6334360055c245542fde73e1
> Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
>     
> This commit adds device tree bindings for the video clock controller on
> the Qualcomm Maili SoC.
> 
>> diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
>> new file mode 100644
>> index 0000000000000..ae52686639db3
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,maili-videocc.h
> 
> [ ... ]
> 
>> +/* VIDEO_CC resets */
>> +#define VIDEO_CC_INTERFACE_BCR					0
>> +#define VIDEO_CC_MVS0_BCR					1
>> +#define VIDEO_CC_MVS0_CLK_ARES					2
>> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
>> +#define VIDEO_CC_MVS0_VPP0_BCR					4
>> +#define VIDEO_CC_MVS0C_BCR					5
>> +#define VIDEO_CC_MVS0C_CLK_ARES					6
>> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
> 
> [Severity: Low]
> Could we use tabs to align the value for VIDEO_CC_MVS0C_FREERUN_CLK_ARES
> instead of spaces?
> 

Will fix this in next series.

Thanks,
Jagadeesh

>> +#define VIDEO_CC_XO_CLK_ARES					8
>> +
>> +#endif
> 

