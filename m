Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364624169D
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638700; cv=none; b=HzfYcWlkMISlPaNVHwzmkNhD3Xb9O06MotHcWSYk3/Of0eSjJznG+ORDEvWSsN7fS3oGuBD4mYY6LoB4Yp3u77kHnL8fluTxAT0g3AipE/AOfCkPzIDB83aZ3EBFB7XW+ACdrNPLTVsj0TUQf0yM/qAuu2E7FJyfoFqzUwX6Hfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638700; c=relaxed/simple;
	bh=695EvRGtNPvpl9lY6nEHN9U1QvZ4cE0rHKZAcM8iMK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ZymoyD+nlAUIKGD0GJyob3eMaLaD5POlAxPEC0+akj+5sZB/TWxLQ4Y4bB79oC/DA9okuzOPFR/dxdmTuxQDSPphZomWCtSwH6Op1rdNI++3+54UOMnz+DRaq6UgzObGfHja7/504YmVoZ1SuvILvqiavWc5HDb0QxXoAYmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1x6Kwzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKH5/Mnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1x6Kwzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKH5/Mnx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383PCHj2411828
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 08:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=; b=O1x6Kwzvdbg2uw+E
	eILejdyVH8cqvM1QAiK+GMVTPTMJgESQ7kRxVRHDpvuB5G6XP0vXeNEVDxsokE8K
	RomxlH+xxn2A4Aic0mZqvOQNwquLOH3htT95lgMbWlhFM18LZ1EmEedK0F+Qx4Tr
	yHxkLlZ2q4YsaPbYXlSUJYbhgO8LE1WPOykoKwISdvh384oAOkyz4nJhT3efaQYH
	xD1xsEBHAoqyAdG1hNtRqely/oXDlWyRzJn9+fFZAjc/DI5qyVAmRAWC52bJNp8J
	fCniJp5gmIwO+ycHF/qILuPcdHgFbS/0SlHpuf06vO/IrxQRNh7d/Sf+3aZHUnV4
	IJ2Vng==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaxj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 08:58:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89e9d327913so23756336d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638697; x=1776243497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=;
        b=FKH5/MnxNVwiFgoZBZoEiT5+FFwOzFBdN0051rGKmLWs+0nOiEcQFozdayhjwSyZuz
         VF8PqsCmGFiW1udz6TqI4R3TyVxBdLbvqoB1W7UJ/YvkShGoeo5IDAoB2LpoFDZgm4m0
         cNh6KgCS9fyWgPE4Sz469DOtXR6hQHXLSfG3YG5fI6hK75SxTQ8CTcyBrGCiuIatEzh8
         r7z7yw73Iys1gfU05025Jdysk6rkMiPoMPgVAD/GRg5xzs2hIUY4wlLyLxw96HRh2CfO
         D5HPAak1HcZtoefE/z1EchRVLK1xcPe6su8ZNfc9Y/ksN0HcYZ3PfOj2AkfH7fltLWbO
         y9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638697; x=1776243497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qL7PDtfGlQZiLJDrztVf44XQnSa5r5vuSGqc/zpJnTQ=;
        b=L1MJCfxZJfuJWRSGFxed9h/JMjrdGTHGMpfZcZT7OE9CpMawaAJ3OpxGb6hWYIp573
         YycMFIVKJSpjzUT+ut2s4UXHoRNcVw/WmDj6iYAx1Ye+Rvdh0srwyvAyZLToH0za7cRH
         ME7M7Q6ydtcTX31yoM6ZGbUZplR7vii04SwofHy5nhtbVvI2kScUkhvBnCLdQdlmke2r
         nttaIu7XL/DgnoKqoJ65UWlBi2BcDDcYGtRx9rH86mTdJ2KXhPGSPLfs2KVlRXdJtm5g
         D8eneaoKBb5cavAs6G2ZonkCKKM8RbsSqVdI6WBameqLhUZqUXAA63VQ9Xksk34xGGIg
         oudw==
X-Forwarded-Encrypted: i=1; AJvYcCVO81HseMXp99GJHBWMeUCvbZIA8pDUCG/thgE1Ohh8TSSfDuOP42eevqNwqzBGKj71720uJf+Z5LoN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VUDOBJCMgyGaJgcEMAxYxul/VygAJ7iMpvj+hWheO4mCeP6U
	T3P+GlYPItbdAV+rzgh8QdMstN2vYDp5AyXxi9tDVZNDh8xko5YwVTqQGgabzP9SysUDJbl/g/I
	jgPh4LidFsjlaVWyyKWUC1XlHE3BLK/EBLfFhEG11gRVKi2izNCbuhlEJxIO00728
X-Gm-Gg: AeBDievttMT8FVotZKpfQkJXOJ8cRSssPJzjaIL0IintAvg37M15jl3KiS3i+qYAtz+
	3A2o1u+abRrW4wn49wk4MhM3JvFcqVbeliME5rR2P4Ml/TZpzkLOmIIy4JT71c8sRj7kwLEhijt
	iqwM7b7SkcflsvOo9PEbpyPvjkAzC2hVjsGsRoQUIw+yDA7xMsmb/EzGoEJbtYgO/00mR2NyYyl
	zoCgT1HF8O1C4iyQdaCBiRYwyD72xkRKCmc6WLRXTjj9VeH+kD3Z85CjVRNfIG8ED75YiYWb2BT
	yn6CaCxmDyavfdoBINV8w4BPS9TGfGfXsxfdzm4Mu4m1JZY7rtG5hNJx4WhoiIO2AVfstKpUypt
	iz+R9iD+XDUXhdLb8Urw3NuzsyQ0LXMwyL+wpoZwjBUZi3N4n3wckdjy88oObCVkGaxCvPJTEOh
	95qfI=
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92898421cf.2.1775638697508;
        Wed, 08 Apr 2026 01:58:17 -0700 (PDT)
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92898201cf.2.1775638697114;
        Wed, 08 Apr 2026 01:58:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm612375166b.10.2026.04.08.01.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:58:16 -0700 (PDT)
Message-ID: <cb21fcd3-b924-4cb4-971a-9e56319fc18c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:58:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 3/7] drm/msm/adreno: rename llc_mmio to
 cx_misc_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
 <20260407-adreno-810-v3-3-30cb7f196ed4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-adreno-810-v3-3-30cb7f196ed4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX/2OsCI+5IeIo
 jVoTuRL+qFXiVUTh7qOXoub+2DIfdf0I0fJGaojVX9Mf7gQouJdjFG8vlyYCfrQVG54thNPy+w0
 BYfueNg3ujCGFGcHpmuMRkW0FuvyogVL9FCssnfhzf5JppdgHbcgrN73Df6mQhWmMIzBg1M+Wlo
 LrmUe4qW9qgh4jvYTbm/kvV2aAKtJv6KRmk1j2RWAWKgu1gufxylpPCDFVJ4SlBo4rX7WnXYvC4
 C6JB3gmUCEUOwZ3/CD79yxY+6jQWEtFNfrZy2VtjTj8A59j7fCQ7oa8mmgquOzHKzvUMrMfFmtY
 7qv7fV0UPrf9E7DQen02VboQGzCKKW2G5EVmcKAwWgGGmUmqDgVVOxaTZP/9JtqeHY4TMQLBZNW
 cy/tkkaPd93RYIuQ2allFL212HFD51ncb526s9ZG7oSwFNDEtbmuUG5VQRmCGhNmQT6aZ3cMRY/
 /wYt4lmYDULHQqOdAHA==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d618aa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -ZRQscffKnx_DxcoyTEuksRTdOgE4EzT
X-Proofpoint-GUID: -ZRQscffKnx_DxcoyTEuksRTdOgE4EzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080080

On 4/8/26 3:45 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx_misc for use in a follow up
> change that decouples this from LLCC.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Seems you lost my tag

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
