Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882B3C76AD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968067; cv=none; b=L47PKVqK0EXNDs23JL5nQreVJaILAsYmfvHXt8P94Qj0Y3S1s/LXXFHxu1M71vNSGR8UaY2TEkgSfOii35rWmDDCp51gtR3zCATABvz6/VRmHfnpiYn5QLt6uusaXyCXDOcGvJTKxJh8ofFJ38mMI4AeiVUsQzGljZrtJdZgEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968067; c=relaxed/simple;
	bh=5SxJ0kztCTJTT8C0fDB15TkIPl0ysLuwbhFeFyfsBmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOzf3fq2H2CUarImvp7NDsCS5iLMRFHwlpM1iF0ld9IdYy3oMArZiKg1Y3CCEE16PZdkQil7cqd3HyX8nwsJmltZI1OkMCMs601FFpWhJx5tGiomBgBc6NOasXfrErD5nVNYm36WhfWnl4Yzhc7O80hL9l8vfvxE5ZbriSrd+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0a+x88Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VepioWuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0a+x88Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VepioWuI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9de9s1533532
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=; b=b0a+x88ZPlyvILLS
	wFJN4nZcNgJzO1ST9v40H5+jEHsMLNdebbtbPsUN7Ek1XXdCuuEAQrWLgsd95KsX
	6pYCAEo0wu4JYU4mFLLwOh077ITqlGvtq1ROxAA27VW+D2YYNbuktZQn+lyerUwK
	CrCaV1D2+sGWcYx/TxOeTgjIkTIlsIBDG33tQkFxKS8LjiOYXYx+V+L5YBFHdNMo
	Ew9T2erte0SO2GUSj0d8ZXOqHGaCnSWdSQTBmwDOAYSqG6B0YkDJxzP7IXFvg9jt
	M9IimyrQNCJEk8rJFnxgjjARGsLlJdD6b/4truxQBWX25lEbzaHIC1ggMA+vH/vM
	vuy0fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1gvt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:01:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7674812ca4bso51239137.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786968064; x=1787572864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=;
        b=VepioWuIgjeg0IprKmLKSM4l7bgqipMf2pH1wLnexXS3kHy4B+tkGklaVmKRVW6xt8
         YOR7HbwP2UcKlIH1KOc0L6XLsYz0ken+hqUtRGVndZZKl89QUivIMa3hJsqFmuMmu/mi
         59bZnk2s9yw0n8rznMwjphNhpgY1TgSnoyqiGGjA3eyp11qMI/59XYC7R3o8qlQLJGZm
         xsVlKb7C/Mzb/1HxAxN+cYUnd46NH0uqDIeHkmmB8dZ3TAOc7hGK58x0UCt6+phCJXpX
         vfgAUcI7ui60s3keXXItebxGKahsq76y16U1GkQGn8PMmweMQJH+tsmuPSHwUtkZ0mre
         9f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968064; x=1787572864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=;
        b=Ze+5pm38aZ8GNff6vL9CWAP2SU3KkNNdjcCKMyLsUnjlefg/YGR1X1aliiH/x8vLDe
         E3m8R1M6tXksAxtPOV2FaScukApX1ZAKzoLm6MPdVRsnoRiMLYWhQawV2PHEaikDBNQ0
         3nkY8lDNr9ycDEQdrGt3+1+Bdcf5wKtSNEQxpaMk8E0X67CLfLJoXwwZVXOcy6T6jmE6
         l853jI91Uf4qmG4ROcqsJZR/5GteEKBoE2O26hoTVdC1q02gb6efG7f+wVrI+Jwj8WuY
         gZqaK2AN9hdaTypIGjSVPHAr7adMtl/FeCblSz2gsm+F3ooL29SGnHYPYr3KnXZzucfS
         ZVXw==
X-Forwarded-Encrypted: i=1; AHgh+RrYj+pdQjMaK5aowp/lG6mdtfUsEQFfUr1wWZHQMibrVxt4iLFLrxd6oOnIfk8jml+a/YwKDMCMI0yn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4I+q5lSlMvWP+Z6JSY4LNh7zl3HoA/T6LPuOsog9MuJVvVK2E
	txZt0z7ne5q7xjNeOlnUInw1LcZj7AXIe8ittr3gJFwZWYPQJfo08L1762YSRuBfovPUd1F22LH
	CHZb5LtS1vvVqh84XV4BpjXf3kh+BC7NwxySs0mNN2o9Y29LljjaELUCwutRKJUaWM/Ew0i/P
X-Gm-Gg: AR+sD12U2Hf4xhNV88f1KPvciol2MjPgFJwM3J/Tdia/MMrWGy2SrkGlemKcr3x/ATY
	/LGSbdU75d4Q9wbWoRuMqZRjftqsSyzSkcRMmXDKQ/qMLXZsYiHFNaC4B1EpMs/W6x5hqnnQE3u
	3slh3MwQ2TIywQkQgFmmpRbj9MQ7Rl+42iKxNP/B1JQ3E3HqpMqy00q/LbMvGs8NWKhpV4NqB4S
	3WrKslZmtqJZ+HmNGZDmyeI1MGlqnb4LBoZlUkwngrfMKcDf1scFcv2KnDpl0GCAEtvmtDUf7lm
	rVtE8GjWcWOAOdr/c4CzttYGsn9+D5H3Tuigx0417XpLt3M8wOraNl1MNKeNNuhTcaLUUpkXADp
	B/9lwM9z7eO5uJmP52kTe+LWG
X-Received: by 2002:a05:6102:3354:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-76f2afe54edmr1670687137.1.1786968064457;
        Mon, 17 Aug 2026 05:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3354:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-76f2afe54edmr1670628137.1.1786968063786;
        Mon, 17 Aug 2026 05:01:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm12587866b.58.2026.08.17.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:01:03 -0700 (PDT)
Message-ID: <072b5f27-0f6e-438d-9097-40a5685cc4d4@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:01:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82f801 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ewh24VgtdEXv2PqOJiSkIMEOY0diXzi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX3WrEm5KMic5J
 IcfihQoIMjHz7sn/Nmlcd+FSUnYU8TI2smlgdDyQEKFdRtk92SSR70aB2Xp3GdnikBrQfGYb59Z
 amu3eDOWJqJrfk2PsH3XPYkN5PnfNIjhnNF4LCka7PVhjtwrWhpAWz0Re6yGSJagrnJ88Dm4bFU
 t+P/JqKOfsPhyItrOqVYn8pHdl7n9LhTgxYxxKTl0qIf7mRNTrwAhZcRwodsXeSTLPBvnGMrRFh
 bhq+/tgojdYY03n271wk0GpASkwq05gC0nOPcwYq20Y9+DlhmQrRydnkqlWFfhx6ffMaiwKwWqz
 yy/SlLooq6rcTTmm77R7F2uSxY2ZmsJt3Q9K7e0RB+71aWnB3CuCEG2GICZqf7wSAuE88dvzIa+
 GKSeBZq09Kpq4OGC1xsukPY8aZ4WbBCxm2Cw1VqeTJ0c6OwhqwQG84K3eIPldkfchtP85Ut4Nts
 15/HtM0TRT8yuUsaOJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX+SqHlfE6SbX6
 Sncqsq9ghuGVZ6xLIRTz6HHR69he7H7q1lxTU7JUjW08F0x3Q0QBS8+Z11MO2rHfMROJ+sgjacZ
 0koO+MYVlBpQjlsy6guZv1zWlNm/hn8=
X-Proofpoint-ORIG-GUID: ewh24VgtdEXv2PqOJiSkIMEOY0diXzi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170090

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-qrd platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
