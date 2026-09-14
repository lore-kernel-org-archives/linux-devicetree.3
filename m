Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E644F576
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388630; cv=none; b=lfO5GyJI3jkc/0SxJKNyJTWleQPsoCcUTqXCPZtpFCtFAAHZCUJNEHJ/qz7P/iBl9/mCmw79HEpumzA0J/5Cmfiyt+yeB1UQ9TQBitJo+FmcoOs2RLNuy+zWDOcDUkl3SFV0rNWJMYLEK9EpbRkGCYPG9ljsdMLBQDrYohQISps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388630; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+CeYx3XVnRrkzxxDXXT71ZnoAr7dGKXCQHj5gVBsh8H0/X0XCTeGpWktArSUY4DsjDCFcn7rrYzQkP9QNcDV3CfusfIxGyJQD+avCOsFHGrK8DorDqCOKUcvW/y4Q9y7SlUUiM93MYu8+E2Yj5rMZwAVMEefYC2g4yDMaax6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7+c01c8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRebTJgg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7+c01c8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRebTJgg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6La3291510
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=a7+c01c8q7bTPKCI
	G5Gt1FaLm7zW3aMHTDxF9VwuY3dGCOr8rSWw8UazEJczKKbJBvc8zHCypnqNOkpY
	gVUV9pJ7kFBATEpjedi10gGKVHMaXriQENOAoJHWFFg2BK6JAegUHgyT8ZPJmaw3
	164Rrr4/eAEi7BiP07eWud9pqQcPxGvKk3aG4EGyPYQeltlDOgG88Gdh+BVIBUbm
	UzYZREvi0+XCe8D8vvmL19TzO0UVoT2YqRGEeP4sw0O+Ptb/O8wUVSdoGToXXocZ
	1O5K2PS7rzD3Ba+krb5Ehd0VqVhczVKWph2VONihnKQBwXbyH8EohO121/CMaHww
	lbjzfg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8jk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74ab6065f97so56158137.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388627; x=1789993427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=gRebTJggtjbqIyOzNDEZKYWhag38JqPtHMGN2kFeDM8j8QHHQAOYPSKtbOjd7p1sGe
         nKlFrdy+DnKtuQ9sK3C/KK4P9p3S8Ym/LqyNUKt2A/tXZ8+O4uqZMJE+DsRupmTuMBHo
         ZurLVk2Llb8OVhbObVaZYO8LrFp4JIx1monBY6DN1qXdQnVAypFl+ak6C1hXC04ay/iV
         gwTv8/wUW1lMRZUYad5GTB5YSf4ehygyYyaQ2HOkmbB/LRPfX5vYIWBBlv/oTAse4LMT
         3y8ccOBKDuniQt0TlQpffG/5T8Hqd8oREfHapKukY1IyKoqXZISpUFbL7Cdm37wpjQ93
         5OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388627; x=1789993427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=BWURL47elAXRgj4lquC9DdjbLZkDpzQjBlZMfqxnQBdF63wR+GKQ0UqH2CeLaYCnsj
         sF8xNkH1ypaUzwVTH202ajCjr1hP7X7h/piaELn8HLfdSCrpMtn5dsD6tVMZR/IPDx5s
         EZE3iUZKBHWsCU2TMcPUXOCmtcRxaaFnXh5ieq81B+wNCqcuvncv9IsviopXxIGJrTMF
         YJEqo/7RqY036XzfChhLbp4CAHrNEe39BAv/YvV78jS324xMfxV7LCboMgk+FM3bI6df
         w3uoqhrZHnERlxE76lMTUHsEswOgY2ZXxRc6yr54EX5E/6OiLlR88wlFkX45ruOwYeMf
         Qnjg==
X-Forwarded-Encrypted: i=1; AKwUvBytoEEgBQLmqz1JrUUHmvrTXLT79d8U9H/OqkdRPg8gCYr0A0d+IH1B5sPmG9vqjTtJOq3Uqt2GKTu+@vger.kernel.org
X-Gm-Message-State: AFuF++mSU9OzGSpQrSMH0yxqDH+kQflcqLvS3P7B2fd443NQionOHs2O
	cP9a+1uYeb08Uhgy1j1U3fLDRV+RJW9p6tcS0m2SBM1yfYtaxQGBeC3YqRL0O/nzWagGqV0vps5
	yX+Y8gJpOsPuWdduvPbP8pzV9/ovIEtrz3WJg0dnmmSRfSu6DXnmbLQVyKNFs41b6
X-Gm-Gg: AYBFou06FVqcPOlqfJYUROtWoX1Ec+0m3BT1tIVUxpkRGfxP2n/sM4I6ay7UCxgbBgB
	fsb9o2C4E1vqiOxkR2VBl/vPr5pxjYKZxUtOgBp6REYqGw8Mkn02hjMv4AJ4PvcxaoyfLFGvTur
	nQTzk+HcxtsTMDaoYqLWm9LU/hAe5nxzMml2bJsq2p51rBeOfY9oymFR5lK9yoC3kFwioh0hHyr
	MTbcAeB3uz4fhOehwnmyh2XM/o+xZTvGja2B7BV3UrTHV6uidNXb6HJ30AtY1s3MIbIK+rYilKr
	c/tufhTyVQWQaPSabmlorzifIe4rC09NLxQc2pKIcwIJlRl1NI/JWsuYjCNiaNbuExu2EXLScI3
	LghpFlN4U+HUaGFOXo0WK/A==
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219122137.2.1789388627411;
        Mon, 14 Sep 2026 05:23:47 -0700 (PDT)
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219117137.2.1789388626970;
        Mon, 14 Sep 2026 05:23:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5e6sm2399386e87.54.2026.09.14.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:46 -0700 (PDT)
Message-ID: <8589d677-5c60-40df-9b2d-6c6e6855cb28@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7e754 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FJkifGgObarjBM3ek1TWlydpWrh6GI0u
X-Proofpoint-ORIG-GUID: FJkifGgObarjBM3ek1TWlydpWrh6GI0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXzdgfwhzcWyvo
 7RDdX5XIP6zYijvV38Vr88K7TlTCJLjnkELI9w6+QGz8Cp5pOMBa+INW2ma9dDsR/Mnwhyvy/h8
 8qEwvpc5Okx/8WIUuZ39qsnyDTbH+L4eKFHR2iAt3i8gd/UsF9pVKtvlKSV5xfRrFPkqMBF+Ofq
 SH0zN33jJmmBXJVhvlhVm97I43O33XyNhrw/eUVGQ1K8OXGyCvwVnV7FOKYBGz/PsWIxyZUNlPu
 z8JCDizDQc+607hVz3fBYlZpnjzoeaZwuf3dNzWriXZkqvdN+0DgP8+z/lnlbZI2bTqf5a/Oolh
 0ASc/OcM6EPJz+ugMfWJYSArolJMnkxwt9mZ095rqc1S01Bfemk9o/giHjUOC2NzB/bIOiVum1j
 2Z28OEay/6Sez6unIcrI9LP6Xks6Q4/hrJjeHBcwMOGDdXsU5xayfq+vf1vVrdN5C6f+oCuB7ip
 bVkLb9FVPXU8z8DiCAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX3jevunO7GkIC
 bJz16QDR5O0iPnDShNmDbGBIIOMcxuBTNC45ESrtW5H3hMkKr8yaH3qioUkV2ROALSwTc8F8qUr
 /81h3v8ZH0aW5wwT6AMz79oci0IK8vE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
