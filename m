Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBD3F327F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807718; cv=none; b=ZyviTlodoiFvgSHUWUeRavRuPNxS3DgNKEUHFmnv1xDiaRJxGyTcj+Bw100RvAz3kpfV28KskyEJuVkEVx0R7zLxSS04O/fXORVSGDxhOjgcQQXamUvzc3ZW04HCeXudO74+pNSeVscZZsbGqNrMsuRu5bqUv4RisTBnm/WFZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807718; c=relaxed/simple;
	bh=LS2H8An6BD6yHicfe6t23knXw1qMewVBK12mLMJ6z2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtvHBaRL7s0oEKP2VewEeyjvGQZEvt3a6v0Rzq9tbWUiqM9NGNOMHI0L2kK0lEiDEEo0a7kkL9rZjECw9vUjNTGplddVV0eMID2HvDy5+4o1pNBms+6QMuK/wZORrMcYwc0WQOAJ9w82CVe3K3ZxnHzqPN5AUm+TJXYyMbL73B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbZ1q9nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VV1h6fjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbZ1q9nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VV1h6fjF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PhT2088501
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=; b=IbZ1q9nuM/uTauEk
	r7fMu0btngo/AKavyz3ACWH8s6lpHplhRlzRmqOqbXf6ddkoQHCLLOIucyLxUCU6
	6NZT54czZXKtaifAD2QlmPFmzTDbzPnqIRIe0UB2xxWtQLDvfNAAMsMwYKRZTajK
	Qks7gRYtYZatVUYwxuMqlDj2IwLM3keaGyjH+xPyzzJTBmBCQNNG8gvGpjZjtOI4
	+VVsPFNEOcjxUS013SeWd20jLwmGzGv0QENLRTBIymZzRo2Qg4bLRpmlKKqV0/Nm
	4invtMb+Hyb4tkJ/18xKxhTMRdCpJg35qnDnLj5ZMyoZw4VGfmb8r7BKJHQhUyRe
	CzRimg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1ux1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:21:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso5890216d6.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807715; x=1792412515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=;
        b=VV1h6fjFqgjLvtu8ZxUz8wQZ8RZi41kck3xUmjUo1HNLCT7UYzJdoZVXBWTrzN4L7e
         LQpeiaEp9l/ldVzJwBYXrgGgrTa6WXcnq23Cr9cwp33NQZXOwrLfVgmKa/kn3AAv2nX0
         TFa/DuwmMbPnFuB0rWEsyAlPO6kzuz6BCCkZGsEFjSPXTjFF3TQnWq7yje45btLZQ47j
         XMXHzf4uOSueSUIWtJOKzyoaU2OrM0CmplieWWogCLLAG/uiU8cimttLt7+SI1sM8YEK
         3InaeoobUQBEDxfLHwA3+OsrhIH0IrmCxNZEOT5niXXJ3st0jRm5qCKQ7HohQAQh4sjm
         dSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807715; x=1792412515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hECoQTtFgcbzntzMlESUYXkqjFtu05/x0Nrt7fkTe8E=;
        b=T8HunUyue14yz0YaaVUjNTQuKOgcY7oTKoZuCiq3qMr9jtDcA1iLmWREAd+ZGzkVM9
         mmKDLXEQSdf9nvl2e8kB8t1JEdYMrZ9YqzTh64iNaDBDoOF42UqVVAGA7rMshONLJjWO
         MqwrUZCrq0Lq9jD4G1jmctkTsDve9aQu8CwDU6a3rVXCErPPs3q67NKwC8lUQqNlubxc
         PDHn6ijQRmKrMwClGmKYCyRj7NiGc324Vuuzhh5Bfgbx2rJXZNGWMSI41aOxlMz2IFWE
         SMqTDxjCWpYm+EgK2OVMoCYwolTl7l5C0ooNM2ZtCEJZU6ec1mOtBZXPPFJRiamcmCDT
         hALg==
X-Forwarded-Encrypted: i=1; AKwUvBzKu4AcwR2dqllie/1pim32RyZOXXtykxJrExLhIERN22CCRTAGHM1ACUfEZvMR4BJ3RaxQ/DEwSNwY@vger.kernel.org
X-Gm-Message-State: AFq9FYKztyX4UpJ4KzDgVDxgbuYPAp6t828iinR4bApHSExFpAyW191a
	aomJXQSc2a+sYpqfWMXVVZhhfzpoO8D9qX9UzZFWzISwf4SGCNMqj4VaRWvG+vQipgnii06nIX8
	begw9CJVjAfx4X3pZtRpHU4IfZf65NfS10rhAY9GlI/jemFDZWmmTJnlBiQMHu4jOU5gpEL/O
X-Gm-Gg: AYBFou2NmlmMJgQOpf31QE9GW0DCF0+pGUv0GYLnFYr33VKyuzZEx0GyvidO1Bkr0Ss
	fBfs5QMMzBRmzyTGoexIJCBcSyJYwxXa5STKA+DiVF/ktyvKb3WV6e5uH3kRNH55UIq84OMCdVZ
	Rqk4+HY+AcmQp8VMbWOrR/GzQam5MT9zhBWK3O/PLcF440DBq4kK9ray6u3+3geyf+VN07Tn4Yx
	LjVZ5u+E8AD9X3V/mwOuG+5Mcgo35R6+gjLhzIjoQl/NNDZrt7nu3QMwoaSaX9lcRv9Cdyr7Bqx
	Ebpxn7zFfbwDyMEdXw8ocIR9j68gODupeuO8M5bp9qq2QSejxJO3Qmtku7Z+s58nGqezD9yt1BY
	aGUqkS+Yjz/Mth3OoX0SL7g==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr1762718785a.6.1791807715520;
        Mon, 12 Oct 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr1762712285a.6.1791807714903;
        Mon, 12 Oct 2026 05:21:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8511sm457033166b.59.2026.10.12.05.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 05:21:54 -0700 (PDT)
Message-ID: <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:21:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
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
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accd0e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pu-9y4Hw9t6J8xIMaM0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX0JWW1LbT4cto
 kMUGzDWdmawGaojV85vry/uDYO7WW7l0iOzFLKZAw5eUhtU9/eYOImg42/7Al++sfFj9G5D3C16
 xgvPS1E+8m/ncGodv38s2YsGW1WQryshsIjjlriGNumN1RkyQqRM4bR3AQxN+L6AD9MO4BzjaDy
 zqQ/ZdZ1LYyCSXT0b4wuX6SfSHelaH55hxjkpyD6o8Rgqcnc7ZsAK2ENM8D3vK6rw8AJzvGdXaC
 Wq9pmevb+dntO5qjOYQ3+TZOYJ5ul9GaEaPEc2rn1mBRBYAHo7ZR4kHYPJidE+GRG660xycnOXL
 wUe/fyM0lnjmiBJUYJ2HR4+H2CK3QegjsvO1RPppuL8WUy3ykFL1scm6vKuBI6wEsKQZKPDJLBZ
 RhSDT7Bh52AOOCH3ZnIh6GANaGEJIuS4i03Qy+JomdOb0C2gCofWVCsLA+/b4jEgBjm8nLKljS0
 CA+tpB98IUmc1V8pv5w==
X-Proofpoint-ORIG-GUID: cKM2Cktt-Abrq6SZPllXqmfxOvRyArHU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXwjOSlfFxbJcN
 FXIF4S2XCDD4/pU2D/xFv8A/t1AlQMIFr3c8cmkJiVhBMt37m14xFhTnhwZ13AZP98P/n+LK27k
 Y2+AFQWSTPyLKxcyc+Rnc4fB5TqP3Wg=
X-Proofpoint-GUID: cKM2Cktt-Abrq6SZPllXqmfxOvRyArHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On 10/8/26 11:06 PM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.
> 
> The Nord primary GPU is the same as A750 but has a different chip id,
> so it needs its own catalog entry. Add a new catalog entry for this
> GPU and an adreno_is_a753() helper. HW clock gating is not working at
> the moment, so it is kept disabled for now.

Do we know the reason? It seems that no other platform has this issue

Konrad
