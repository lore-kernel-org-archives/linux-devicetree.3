Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B773B27CC
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195355; cv=none; b=KOg9/GKSVs/TR/20IeR4jLa6BcXIIIZx70/Gf8FUM/KrE1iYJoFG69jl3Nhz2M2nptKXAoyiQNdQ+Dtdl8Ltc1dkX9wPqN79AiTg3BZGf6gKk3JYvAHawiCrhI1dgKBOagzOxYGcrhi9NkvYRLYuWTlW+wfJdoP7GOBos4asJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195355; c=relaxed/simple;
	bh=r+QwP6LsyTv96DBBOCSXo9UgKKhTI4kus8km4k1SIwQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j8cPO+jzYUd8eS/8rpWxcd9NUZSSRORYaVae1QMxbJt2mjQQLc/EZHYyXZRJTFhmD9UgYVedLm+Zzq1tgAiwfMh1sQs7xJIEXrZua8aSDnXSouRVRQg1WUQmkNud2PcuAlF9hRdMA8gYsIEaBmpjMAe1agpXcjZz+D3JqgTJAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LydqS1Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deh5DDAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LydqS1Yd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deh5DDAR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0i2W5839701
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=; b=LydqS1YdLlPIDn4n
	Mgku8rZe1uMfbqyGMNrB9ICzpImjPydxdrUBHDemlLaKZbvZOGFYVIDJfSLoit31
	zz4MiznybUPA1eo3BnMzg/UzZoPqBoq0+KE6DnXTipT7XjnUKGzsjht3R6Z4O4C6
	27IQUKodf/0ITkITCKASGR/FMOx2Yy/KkLbbx0dncgAQMbmiKXh3D7WJGWgEVJhh
	AUlsii1Funv3ID4VAaE3ian/7HD3cfnPIWREGRLcQCPR1SuqgGGjSAj30yc0brDw
	K4dpBKxihFyAgLtghOtFYvhEScB+HYJTVSWjn+E/ZSR4M/hCjvoBluN8VVmBFHtG
	N0vPsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhuv4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:15:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7c7fdca0cso5765915ad.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195353; x=1782800153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=;
        b=deh5DDARQlWsONG4Pd2HAUmZmMvUk0NT/mII/wov/cVkq6fo2oaULtLYeySTgUQChM
         T/lCsaDZxw4On5uw/+PT27kjAtZt4unYSX5ZHEURC8vDrRJtyYAcdOtgsT6W8hpfM12r
         Mlp6w1FF6q2XbkWoJ6XxQx6UBKKaNcF0jNmX8dikw0SVrGkK90izz2bs79Kdb1LuISed
         PXku6MDBkbI2BAD3ChwRUbuhu44xNPtikzj2tykkWB2c+cJ8dOdnf6WMBqgU98WT1ok0
         H2q97cqb6yKhX3PY0rxQXxpwUMQHi0Y1x3iTJE4+uCcc9lwQ6Qb1RQp56AtDLJHUbtbF
         fkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195353; x=1782800153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/BdfD2Hn5Z+F9PtziK6FSHnE/qmCQyxnK3dzd/CpHI=;
        b=dIrVtz4v1b1iRyG4Ad0Whe8T1yeNH63w9VtH4P2RkqMCIOfVOIhdk2AIhVrpdOCTSV
         9Mfxv+aAGsAsqTOVE8oZHDOUpxxt6P/fN6AkeyAwTGDQoF6dRWtnPkvifFga8XWBtrD9
         4vyyvl0segyDAErF4UYVtVNUPZe+hzG4mRb5iQTF7YCqAdbV1KqJqF8muhDytv/0NrK0
         8Mv9PLUQB/PBtvUGddiPpEsKNdWc1ZHaECYo8CzZCYV0nroB8VG613RsATm+CjWndGXN
         apn6kTFkA/nMpYGh4RfvVNStvOLxdlbFb8hkrzf2OfowuyP/Kbat/RbteBIs+QiKii7Q
         95vw==
X-Forwarded-Encrypted: i=1; AHgh+RqeaOgs4/BW5LrXHRsWOhQiFQZcq0IwvQ6FT/vbu/dDOCmTCgq+HYYP847vh6+1D0he6B4i/238WDRK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdfm65+9nsBVs+5nMG9bNJq4zh9TunB6wIdgn8SO8uTbVUc/fr
	Esud14ejzhHvvXLGr4SwjwYaPuf5qYf7vlYyXjaNhDUqbZmDkQQMkD3KtMtiaVQrlfK5yOjU1tL
	fo32l6ff8StlAsMBWx3mCl44Xps0EoZNXmdbYcp8odtrvJm/V1yjs7ThE8gJEMk+T
X-Gm-Gg: AfdE7ckhA6HpLRbdtDXjrgBkl2fADkUba5ub9Fy1bYS5S+jvIg/6coQN5/a4Jae4CXk
	z9HnuSibSeP/5QfQpf+5qEFSAAV9+lg3SMN6gRFOssTLF8u40/B5IF/ww44wfaTBm0fjqhZOId2
	m8bapSCQNntfcDshJJwZUmFtZCaKIouhwvgUypyuAWG/rMDcZqKqgKOd3dR6DISXVMfX0azErxm
	VilsELVq2m7TGv/jzNzzbZUQDUj2DaMAr0Thz8cqlyHD4ZXkQhkmvSEkPqV1ZcGYurz719n9xVI
	hNrDYNpUkyZBf90ed6CqVsSt1jcIEcUZGbykqhtAsBlci+ewTuQGLrTFOPfHfTuNFarmC+coGyq
	uKxsArWsm1hQvkFCw86xFXQYhSU29hcJ73DhPAbPcgUlfbGsvKnNDDxlAHBZbG7AoideXK590uQ
	sBPyAgJg==
X-Received: by 2002:a17:903:2306:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2c7c9aa7eadmr10846835ad.34.1782195352587;
        Mon, 22 Jun 2026 23:15:52 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2c7c9aa7eadmr10846405ad.34.1782195352091;
        Mon, 22 Jun 2026 23:15:52 -0700 (PDT)
Received: from [10.249.22.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad99sm113552035ad.80.2026.06.22.23.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:15:51 -0700 (PDT)
Message-ID: <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:15:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfXy5LvHJGBP+vS
 k7OvbqWkVZ3OBbwOTsLbUOcMUnyrlZREKx1TS05vNQGB/JP+ryLOKA3GqhTcE6zQ7lNQz15/0IH
 GsJZS/XWoN2/3FXdkYTbRv8aZOz6rz8=
X-Proofpoint-ORIG-GUID: DY_03Sbv4NFgfv7GMAD0RowMnzTlVz2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfX+CsyC1yaYQD7
 1ca62hvguMeN30ZePanfKQlXhnJoGJSsuV35240egWlgvYnWE5SHhnwUCTXFV5plEA+nKoy2yik
 Rybdz5aRM8F1ACGyb8wfM+a6/7URSGGD7rq4Q/wHnJSqEh7yiuK2QmkjkIr2uC/IsNqzodc4ZQu
 Cb/EvDoEpVxXI1QQg6slxNSVaDj2IgeMHspyLJLih6JojqY9haUbr8lSZWMIiEfawEEjVnvJIBi
 qf+IW6Q3izPXfeQxma/Z2EKkAr7D/sFkad1ju4hZ/2uiFYmZ7/Psv/yIW3Pwohv3TxQX6k7lp8l
 bNw/3r+/OFA9rCk3SZcuPC6GEH3yG7pfjrdI6M7ibbxDPvJQzWSme70Xp17aAMzknN91n+BJgVk
 9efDPSGI49szhI2hBJ7n14OspZTlN5ONFPTal3StEkzNkMUI2IeYvxl47yJiqaG9I77+8gTW21+
 xJRI1toDBHWClpaPohA==
X-Proofpoint-GUID: DY_03Sbv4NFgfv7GMAD0RowMnzTlVz2d
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3a2499 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NLMsfvOWJzgsEXNEpJYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230048



On 2026/6/4 14:48, Vikash Garodia wrote:
> Hi Bjorn,
> 
> On 5/29/2026 1:04 PM, Wangao Wang wrote:
>> This series enables the Iris video codec on purwa, allowing purwa to
>> use hardware‑accelerated video encoding and decoding.
>>
>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>> except that it requires one additional clock and uses a different OPP
>> table.
>>
>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>> and OPP table need to be redefined.
>>
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
>> Dependencies:
>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc- 
>> v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>>
> 
> <snip>
>>
>> ---
>> Wangao Wang (5):
>>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>>        media: iris: Add hardware power on/off ops for X1P42100
>>        media: iris: Add platform data for X1P42100
>>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>>        arm64: dts: qcom: purwa-iot-som: enable video
>>
> 
> Media patches in this series are now applied. Do you plan to apply the 
> DTS ones ?
> 
> Regards,
> Vikash
> 

Hi Bjorn, is everything going well? If you encounter any issues, please 
feel free to give us feedback. Thank you.

-- 
Best Regards,
Wangao

