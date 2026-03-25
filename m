Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DA3E025C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451689; cv=none; b=mLIMdiOyGKpuxau6LdLJQKO63fpe3nnXhkDP2wl1XZ5ZrIZWSdUUMZohUEJlIgRfFgcnRPHU9B2lFBl9i7rKX+nmGevGhGC/LGb1xKno6lQy0FdAwKJzQdvLOuNctdYJA5OUPrIJweivyjm2W6gqgNOWFfw9TnwlvPpEDlEdwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451689; c=relaxed/simple;
	bh=rcShfDxb0SWVUoYsT+a4OUOe9fGgAM8/hMD9dz9s7Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOSG6eEvAg1IWxtoMhH51xi8uW5MRHtGT2YrUVfvj7Vy7z3d+r6B55taCxL3TC+0GV9jrdWzW6U2AOhYFVKyeGuTGocMySk7T0oog5Wdi4INZhFTgIMeoeTobW7SOBiQsacQq+vukWy/zE+zkY6jxQeTHjbI2Py7RjW4ha57l+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBZWJdn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh/QOdHt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBZWJdn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh/QOdHt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGJhg3091219
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=; b=iBZWJdn96S7kNo0K
	kQu6HMNiVVJBhY1PYontI5d4cBONCTnOG4CqdX18E2iP9s7y87dXZgdZeOLCdpzA
	6qkHUiaqgoQj6lh8awR4BMrnR6KxWAMTlfx0UV+F2wrMw7wOgw+8ARweBoG/3lYb
	1HNb+ImxHYJJQayhygppfqeDTrH/4oFZDMVhEZ764ymVQKLbyzVtVRIafzo6F0DV
	54N1RwPZ1XF26jEJr8k6q5bCKTfQIDlSdkeXZcoznRVPGew3vy/haW7hTygGsqfq
	FgWJ4zqbfUK+li7wsSNCwgZSmQ0xH/oDi7ILHlJ0OdwjfyJRGjXRcJXVdwWh8xiE
	zXQisQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmps4e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:14:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a82f78a20so22641479b3a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451686; x=1775056486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=;
        b=Dh/QOdHt9BynPzYzScu6vWgau/yAqOdwiSwt7XTmXN70xXpVE690jB3PRaMJ3CMWnj
         sm3sEKD2jnSTp6y7LLL3dda4dp/wUMyF05/5c+jb7iCUDA18Xabb4CqjWw+cTyOM6myD
         xa76iR/jBjsWkRmLBTxUV4ZJcOoL+Rwh9L3bl1rxwOV6QqGxj+V8mo3VBRSkDgb7vE7G
         Z1LACovobXaCp4XnW3mhBhamb00JAus1b38H4HEwxXtfqfenIGG3cCL52RX7wK47KuJy
         IumFOyDzaRrRcLAPWVAWkK71o6QnIEjweYOHMRobMX+v9z/gcLTGzrcNtAmvvgqXFfAf
         yJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451686; x=1775056486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=;
        b=ZScPEljgtm1uZ9sM70xILs+/Bo9fDNI8MwFQeoyFZoPPtKMf/iTYc5AUEM5eDpDFEM
         A1UAUaaV/lmcDdZ+Z4eyid//eCq2PJHkSwh8deAWycHwslPa2xW190IINJ54m0GuI8dH
         L4IdU19B94zn4Ba7xSukRDGYGw4CSaSrdAFOypd5+PsS6WOxABWkzkCZw5XW0s55APsH
         Tvgxq/ZQFPpQJPHBLDqgMkVyG/z8wM3for9MfZdeC6YWJHc5I8rdMn32UueoCx+J8keJ
         Qv7xkoTBwbl8mtYgzEMDG546Ja0bHianBukUJLZ8mLpjhRGwkmPtzCcGBF8kVu73DAi2
         2zFA==
X-Forwarded-Encrypted: i=1; AJvYcCUIRI2BdXJZ03NdjctGwzn6XibG/WRfqIMfohd6RtzxaNBJgRrL1N1NK/6amMwGKteSy5B//9rBub19@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcXMizy5aL+YHmeePBXGSkzKpEmKhCLFnPFoO2ecldlYniZi6
	Rp04wfMK3JXRFdwCpytCc8YFsezxnPNo+wFmp2kqLRLTWw7MWZP5XfXzyK0od4ATLhJd6wX/MF0
	M46quJf8s1woQt9QG6CMp5Y2Tzs3rh3Agc/NCc7U793axgxaLSKPZVnvVL/vOsCuK
X-Gm-Gg: ATEYQzyIUjlelFStLDmwk1Vn3nah05j3FMnWyRJqGzRQxH7TE8ELoYUVQVizQexCJ39
	ln6y+x0zRGVUeDEFaA4/bOmO9PYysV0LEHyeNpy1huyGyOU4ddHbx3eG4xDb6DPyDtml6J3tpsU
	ebTkZL0vzSSwsUh8c6lUHCD3reB0pqqFQT4+o/wrGBq/bOyc6TOozGTxvIAxY27piwXC5IsOppQ
	7xW9EvbHhwXnoEYx9mnQddvszeKzmhjn7xoFqgGsoPvYcQNeEjclZRmigmThomAsU6Sl3c5xV/x
	lQ5jk6PZnT7il8v0KWfWccpkG5oBgP0KbSc9a4Ye3jnjzcruKyTlIwWgiEpyH//lwnqSjt2Afiu
	5uYvJuUGNNA1as9HJ0qT3D8t/v2hTIjGOYWNuYDSRDW0UvkGjchheFg==
X-Received: by 2002:a05:6a00:4147:b0:829:803e:678b with SMTP id d2e1a72fcca58-82c6e1039c5mr3966024b3a.54.1774451686470;
        Wed, 25 Mar 2026 08:14:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4147:b0:829:803e:678b with SMTP id d2e1a72fcca58-82c6e1039c5mr3965989b3a.54.1774451685929;
        Wed, 25 Mar 2026 08:14:45 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e619esm68019b3a.9.2026.03.25.08.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:14:45 -0700 (PDT)
Message-ID: <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:44:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfXwRYRgO7OhBDK
 IS1dqF3BySR4xucWVw73IBvzQXLLSDft6WHMg+Q+QdhVEwYWfAoklLn4PKitjH4BH2eb71dt9LR
 lGCmBGv48a0eMc4UMe3iQq9/kxIJeuruaynJISMJR+4JUlYVh1vLrsQQ4AyqIV17+s+PTEM8ezQ
 CIssWyClQtofY2xPkF/Slmh12TB75FzDfCy0hDRQPuHEzK/oL59wkKN0CpwIOH30trr0LBOq7RW
 OrH4WnRRhb1zOzT1j/xzGJHUZG6EwHKHm+nTwbGeg017qN69HBrWVmmCl4FRcQJb5I1e/irliae
 4NIZRZ0T6FOjCbOYFa7ca0RjLPJwUThiBXLNCLgvkr0UMTi9T/+GAUqum/PacLpVPBjhdYd91GH
 6lOKwrVQR0JIXPYeM1MF/edF+4SM6IlmnEPNIOkv18o+AMffOu+Hdw20+BaRqx58z29FScBTl+o
 Q4/neJBEklH3zj1I3+Q==
X-Proofpoint-GUID: SAH0_8VV53UqwxrMkBnaBtYpuY_jFZDP
X-Proofpoint-ORIG-GUID: SAH0_8VV53UqwxrMkBnaBtYpuY_jFZDP
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3fbe7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dE1MpONsbtOZy1RxgbwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109


On 3/13/2026 6:49 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Hi Bryan,

Please pull this fix patch, let me know if you need me to resend this 
separately.

Regards,
Vikash
