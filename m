Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986963CF036
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039381; cv=none; b=YvOetYAtvyHZJ99Hc9mSHRixeKlNnLagNwSV1phHbUKW/PEPBiA+mP3DyWH387oCvAN7T/1j2K+Jq+ZYw1ItdCqZBOwnrCPIRYg4vLCZOzp/ZskrN6EhS88Pgrv9Oh/5r31Vj5wRkAwJjxhsEqk6toLJdCZKLguR+OPrG66Rsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039381; c=relaxed/simple;
	bh=vTqmhAsBP8GdKTww0YperDlWarnFiUtNXzMs0RzqbD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oY6yblLrYo46c51mOA/RlRX3FJmPUG+sEvuFZOSB5rt5Tcm8/J1Ova8LPOCP03Tt/GwtXdMa2+pUmZy7b9umC+x5dkRz1LZbHtkdakWaKtbCApB/aePkCywCK+yYxafjMVJ2ps/tbiB7qSJcJE/GwMkLFYdsEhhAvEDprZJ0w8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEJtIjtq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1jD+98R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEJtIjtq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1jD+98R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319AE9Z3174301
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=; b=kEJtIjtqVco+hFML
	/MusHuGQjDKQSc7u6luYLlPT92LcAHcy/8YHNA6b37q4c2xrhni34ket9uQi+bQ8
	Lx62UyeH2uo80OXzv7N4CXX7HBxWbTnWE/jKXYDLNTD5TW6dWmDVXFQtbNQzcKoG
	wqQ1RB5qLBl7ROp26nqNvE2AU8zjAtQEOD3+YlbmXGHWTCs5KqZIRF239+ytaHLy
	sIHtIjqNwAMqpY3ZZCot9YynOyXvdAPKWUUFkEXSsPnXcG+/4ZYTB63LtCbNbQal
	X8HAcwDD9YND/RVGhpxa0eN9Q8E5ATb0pdjDxpt/svHUcSzAY58MW+SQHrPDcrpv
	WzNo/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbgbk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:29:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so12917386d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039379; x=1775644179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=;
        b=S1jD+98RJsOXrW6ZwFWkdsb0gQB5UetFai8FMg23ssqaHTsQoJ77ysSz95jab4dS1j
         Ie2xxR1AKm+js18ZUjLSFEFYU1SojrpoNjofg5ijCHMt7S953V3nHuWvFY8oN9Qj/Rgv
         RJOHc42KgilgAeT8pd+gW4DNtqQmqJgC1Sm8FpVdlhCcdy2sKkiGyA5L0tA+XjbLB9oa
         cGFgZtLjI4c23sHsfOsUSost/Rcgk6I2jGESnW5t77L7IdWglkzw2NvooqlZlYw1UKSz
         iEmsTVfV9VIvnIi5TC7U/H9CewfYM7ilYcEm9jopWYUaRsYQPsB4AqK3b6Zj70kbqV/s
         85vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039379; x=1775644179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=;
        b=Aoi+cqkYMyNv0Iu1Ao4VcWED7wLe9IBL5D8eoYt6DbshGTe6H7XGC2rRSHjz0RBaPJ
         z7lVQBSWLr1D9cN7IwY+9sSgVSF9/GkNXkE2sv686IrY79uZvAEiSci2t81oP98RBhzq
         vXFtyn1fb2Ij1XjfeWRK468slNJJ+A2o9NMYBRSMrA+4GMbyOdrh5lgzKoAm6ZHTHW5D
         MMv6t/VUANyEtxeg06Rndgzsks40rmjkRn9hZ1oAtSyv7pHTNx9Mr8T7CPWgpMAs+Mbx
         Hv2AOHem7mEjUhYJJGWH0GvJ4Jk3r1KO33csDjVHcaHGyXLXgKncPvk4v/M6lBe7yLnf
         IcMw==
X-Forwarded-Encrypted: i=1; AJvYcCVUx4dN2UoNuY3lExuX4BWHS8HjYGkodGoO6V1YIZx5XAxzx82MsqSI+TXoe3wNeNIXOJ2rFucLEcZm@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcsGsAIChTn5pMxc88jWsY3TTy7U8LZpd/s1a6PJwfrITWA9A
	Yr6DxVN13Dkynt2KPmXmawbyFzRrv+n7zt4bjBHd02hsB0QffH2r/dLUixwn9ZeDPL6V1ryBprY
	kMU8by57u09NAOAQp7yB4blbF596yBDS99N0LRYhW1kToTSpd9eDbXG65LnSR3mcd
X-Gm-Gg: ATEYQzwUmiSaspx/r2yY3AGk4hGPVZkAmla08UfiL3aOGvboCd9LFxG7CJApH/JtE1V
	n4H8y/rBF5jRpCmu5j6tnubGH1oxnF8LV/oysw7dS2ZuZcODDV78/rDIZS/MMVUszC1vMnZhn55
	l8GgdmKzhL2YgkWgztpFgerdSkVbHHf+0nfaqIAZJEiYrLbh0ECh9XPHz47Vy6AC8NMzE5t5Jvl
	cq/Y0eMfxlyCcM4RA0on66+HPGKC5szhQZZzMAHx8yxQsbNCd9bklWSJ4xzBHbxe6SOLqgAiHw2
	LvklDJlojjKx3X3/ASewo4Rbvr4BDFGXpZ8aaiu/DCbdcpk3e2MuncS+Ivan9QPweSOylXdpc9O
	V6LtZWtSS+9Q9qVTnL8g/3VBHPpsXJjBmsJBpXKOuiYq3aKsNk4Bzamq/qZ1neT1cJyJxgWTwnG
	JNELM=
X-Received: by 2002:ad4:5f0e:0:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a437212308mr35873226d6.1.1775039378917;
        Wed, 01 Apr 2026 03:29:38 -0700 (PDT)
X-Received: by 2002:ad4:5f0e:0:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a437212308mr35872786d6.1.1775039378350;
        Wed, 01 Apr 2026 03:29:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm514146666b.31.2026.04.01.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:29:37 -0700 (PDT)
Message-ID: <184e73fd-f849-460e-8c9b-e112dba138c2@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:29:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU
 nodes
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
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-6-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-6-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfX31G2AOJCLVJw
 5ft+52ZfQIenPEZPqdbJqSwQa2u+f4bTG3CZxmyg6wK4WdU83cclXz5JFfbZnGpC2eAcL8gk4WJ
 +XksvXmrRUOsYED55+9jnhT5vGe1PE40ge3lfvsdlFRqe/N0k5qOjIjV+eh8EFXPgj2z7TxR+Hh
 Jjol/qlTPvimPOrHYk0/Tpp2JhDw0rD6QLTBnIKq5qfd7/zFIiXASg8FUXd+zqGkPECbX01rONh
 hjiHIiF0CNMleVQeUNs9kHIkZPVKrllurIiTuOb5IwErVbnhzp9Hh6IkcgzZEgvvZqs0yzoas/+
 JiaW+jS+IMqnUdnEBQ3YlJsYliBjhEppgq2Zpk61oKR2yVRD7uE3z1W1G3GJtpt0vHymVsARBQe
 enO6h6vOXRlmaErJGHWo6GnWrBeBYVKZ/U7RSK2tGTzc/yRjWK7HbZsYPRk4xlRCLY1JMKdCZXT
 Nh7Moem+q4NS0fyjFRw==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69ccf393 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mgqdMpuNiQTOyL4mY6MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Bd4LMMnrAvYfBGQq8CO7yzxA25VJMIBd
X-Proofpoint-ORIG-GUID: Bd4LMMnrAvYfBGQq8CO7yzxA25VJMIBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010095

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
