Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243D3E832C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992335; cv=none; b=Ydd4fnPrPJdE9kljOOHJtVZ2WYwcafbdf5CrO7F9jZmwglQ+e26MqUTudB3ckRecIPJ2MyQlw9QDEAIc1svnce1zzx5T4knquNR9yRGLXP2pZA+VmlNUyYT5Isz7OgX2yYXz3Q+C5WdTKn+66S+Tfj9LV7DOjtzANY36kNHnDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992335; c=relaxed/simple;
	bh=iXWrNYwtewU2xC6tlZgN5pj/x2AA/eSoRrx9wnDLO64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOt8uwnlyRkvRkeDfIUhkM/F/8gmuEpx8IxSlAcTfpLmdjP697gYkexf0AJiApkrdTyqbjAXcQyamLlAn4W8HSD5gM56Z91SBwkHQ2QE06txsmsO7hldq4Vwmb42kX/x6M1tNwlPsRagaVoVcIqA33pEit4nHHA3woc6poqSuME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfjrIVWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb1oiHmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfjrIVWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jb1oiHmK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Tju006887
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=; b=hfjrIVWNvvFu/dyF
	YgGS0wXIsycLqAA77Z9hRFVllzKDuZ0FPJkDhUWIgHuMOD1Yfk/fMzSaTz9Lt2Ao
	tuEw1OmRP/zHhNwWYga3pRxB66x/9PaTuL1by88qCscJBNUCgKpvTf1qcMAwiTDh
	kjw44qn5TzeTUmCvPNG7bokg6EnG0VNAcgQOHNJpv1jxn2m51RQWJp6VLgKmUsc4
	YM0QR+dsNSR5s8pXPN8rqul5fCYi02r5QwK9fFu2r7fSqwU1/WZ3nAfyrjTGwbHi
	sKEf4zssoC1GZ35UlCxeR6wa+Ngo3TfWKrv3HGU2Dnxw9GNTgTX7CD9cT8vPcuqg
	f2gZ/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr03g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:05:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a4ca0a4aso166859085a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992332; x=1781597132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=;
        b=Jb1oiHmKDksSTsaqT8BQahUimSGX1+4b3fVZ6eHAw3znm68O+jUFYp79eeBs4ML4IC
         gbwDPzjOaeZ33uEv03yghOv/4a9aH57djWf7PCOoTQo6sbZZREPFoHYOkjndKa8fkuow
         BCu2G8c5S+tN7zt8RhqnI3Lxvx+CcXypOBsdWHm03sOjahHauKgQ+OfOAxXaj2xFJvJG
         Zc8twIAMk0SWSVS9O4wHrfHYZE8OjjmDt3Nz9fgY3QyO4N6LbPvNTc9EdxB4CcDmOlMm
         8p7jNO0nx4zi1J4CuuAaM9TTkhZOfD5bBdfTQP2U1DYoLQPaaYPlOLKu8Qmr3StpNlOn
         hEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992332; x=1781597132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=;
        b=tLtqMpkYgr7yhTIn6F6sIuP1YbxjV+UksrANHYeAsB9f2o1bHSKFdPUN/iblqhf8tY
         a2g5nFsuIS7L0xKQkbnQzTzGjCivO2H7YUUpMGv0jLZxpDxYZN/fw5eoiKB3IzcIT11E
         8ftQ/nvtXOt0hWcLS6H6RJysxW2sekw25obEJBvSUpIGRRtVykkiCyAncIEXsZCG7SGq
         5bZfLucwpI+euh9AFoYELesufKZ5CC1iuwlncSHAe3gGvH4JW3LHXtYf0erCoUGE4XLu
         l05XMUHLQvDui7QGPeFBMgmDNIdmok9UZLHXpgyao3NBBtmgI5hQflMtheZXK/fK5ONc
         YJLg==
X-Forwarded-Encrypted: i=1; AFNElJ+qhDa84DKv7G3204PQONjBunemzd0TGNK9/VyDL3WT4t7xVDXg9StuZeN5NvbD+AvB6PPUsFdHXC4R@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0cTXKO4SPaS5XLc5Y13Vy/cUaMK9rjWusqquetNa7KPB4oimz
	771iSPKs6MbrFFeukh1SgA4rk5GuSPld8qE4ZLqh+6RvB8jajmQDijX+QyshAD1JtrlhHsTi0vI
	o5VhUNSe1sEqj0xRLFk42xckpx/62oh5AxhwQULl6L+JgsWP/zbrmXZohy/ytde5m
X-Gm-Gg: Acq92OFEVONR87L0dLHe41pBj52hRUsn+s2Xn+FRS8hnFdprITlpp2paqZ+Pzolf6LK
	dy1yRVl5zvWBgASc/ARG0CKIvDGULiCwoMmd20HVEXDcNjLn92pfb8RaC0WbrgEKTCWlodA889H
	Ootw8U1uXQDLcsuWf1CcK3dArluTbXwQ/vEFyunNVlOML0yk40bY8IRuu1JsKlFxpr3OwDe02bV
	cUK/vrgbLfwx2ivaNVUpuoE4ot4JdIwbayWderUHGU8iIu8gY8SoALJXxSKpFAs+m0uvU69Q4zn
	hppEHlOnZgeiwJL2jm+blxPyi1TlBpLV8foIAlmqxSn3ZnpWQzcNpj54s1AiuGIvsD10yOgP6Fo
	5PsRczxV2QcjRfYcFSyN9rIPWC0WGF7PNKfcgk1HCR1N12xUYo5EibSVQ
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1730748285a.8.1780992332074;
        Tue, 09 Jun 2026 01:05:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1730743785a.8.1780992331605;
        Tue, 09 Jun 2026 01:05:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf3e39647c4sm606892766b.63.2026.06.09.01.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:05:29 -0700 (PDT)
Message-ID: <791b0c02-e1ec-45a6-8b24-07a628b2671f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:05:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/adreno: Add support for A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
 <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX+VhLsF/EbnLC
 L30+GNYaRBxXILwgdsx1xjx/gptphhb0F2VbTU2u40wAGrV/pl3++flxDzA76l1Hd3TlCS3UVpA
 aWATwFYzhyNI62Rb4/riGVWIxkDIkOkvE0B1jaJEgcMmuwKFyEvbcZkwWhlDJ/c583T633g7G99
 SyWPlIwlXoSI4e1ru2vozt7Wuizr6LzDIZfQbaLBchBWLMbasvFirMQsZpNE1zSJBhEI+Ln2zdV
 QqPvKdCayVjhlI1gI15sWuoh4PTMvqgs/THVv9TjvMLofETa82H70YQ7sbOlIubPsX8wq7foRFa
 mBo3XnegSG4HNKpbt4XM04hfJqk5ASzfvtzv/IwWQqV3IMpZygW+gSNKOh9gsMYqkmiW17E5TUL
 ID9AUHMvpqTl0iaxN5yg0RrNjz1arNVwwsWsm8oYpF5/D0qEHCb6nILHIe1qmhag1EF0M8mspA6
 quvueM8lY8x8LhUllRg==
X-Proofpoint-ORIG-GUID: _Rjr9KEpQ3LavI0HjzzLGQFHkiHjYZov
X-Proofpoint-GUID: _Rjr9KEpQ3LavI0HjzzLGQFHkiHjYZov
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27c94d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dsl4z-DLeecaUYzO57AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090075

On 6/9/26 1:36 AM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Just add the new chipid to enable support for A704 GPU in Shikra.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
