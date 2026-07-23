Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1492D7DF1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794618; cv=none; b=grI9WMK4QiY+JHgBliZDws+RSC06riR1HbUqnCTuT+3exVNDqa0seXsqQm9qFgHCYyGrVFMDfxsIlNWJjTKXOC6TizB+GtA9AY7PSJ+fq+YxMjagEwxSnb6fOnmA01CzWvUvL0zlZSCJAzYazlVONTgWUnLRSMaPljbqoO7c1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794618; c=relaxed/simple;
	bh=zw0qrkMDPESOmIlELUVZ1exwSgAdG5jLeAJM0jyIjI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SI8o6JJhQRA60oKNfxD/zzD5ZJuaFH0M1GOGwueG0WEYnL4zr2Oxqxr0c2NNeIXyPPQdS8RbPRGRBbHvltKHv1rIXlPPmKzFd80d1SCrI9CbGPJv2nLWVJTqhYAyS1khF95MznvujapmVpUm6UbEQaIUIN8Nn1xZBAjS9FhQSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntSapto5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSQBDd6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntSapto5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSQBDd6p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bg483156301
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=; b=ntSapto5HtuOo1tx
	+4Wyu1GfIka9eD9b3tS9e0LIb25cjH3/7S91iitGNy7DLR4Fx9d9AJZDs8hNXIOg
	EtfpPBI2RM1JebCar91HEqL/a9Ur8/t1iGqxLHTOyepqlyg1uRvvSndniBdV7KCV
	/jweb56WfARKrsHjqD5JVMJFiGsjKSoKVWpDBorAP31jEZnlovTzqChQwhfV4mIP
	d3PFRt5Ey2bmrNp4TxjcJ5ijkN4a8BlUiVxhLnK3UDXpqqAqhxBV96NVHJzN+tFN
	hZYO5XF43oGcsTKApztW7F/sfHa1btPj6rqW3/DlLKITozTEt8jVERledLw17x5F
	3yU4Eg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275k320-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so182048a12.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784794616; x=1785399416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=cSQBDd6pQ4lvTu4+E/SrcEUHspOuVDWgZEBWKxxoWQy/WXdJqAqg746KR+ZgZYgVyx
         ot1irJ1Vw/chvkUmgebabmk9+rxkLJq6h9fUOrSNUp12/cIZ3p9eLZVOSFEq6G8OWD/K
         07OxJPguSF93x5IJk0x8IknzesKLiKX3TmlYb9lH7/zUS2at1te52sYnJGOqagnQIyhf
         cgQLwRP+biOEWmqTX0h0lqUuOlxqT1NFjCSpGEcBnnGN6FXGmIq1AgJvHbHk62sasNQN
         2/ggouIGkcQIcYTQK4ErTaNYW2E3nZjqivW3HWKyRITeIblBcPX9Oaqb/2rd2iJfY4CX
         QS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784794616; x=1785399416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=k++Wd5tmLEocRXD3EdHkyPvtpcmTbGUfeBaZfML0K3/rayYlCljW9c1RcjS3vvlGbm
         PacYSSb83dhzJXRlGPXWQT/2F/Czi1vY4TMSG8qPcHX8tTfTnA74baMs+7gSBMC4IJOR
         71Ua/X5+qjHsJgvbRllECTTbDV9WT65b23y3SR60RfYv1+eHFMlffuF6doD5BsIvDHvZ
         J0QwM9GnPmuqRTUJ+Nf2GdQ9WGB7QFC+2gaMUdJoTnQ4dq2MaK2CVvnD1X9r05Lg7pTn
         hJb2e54HTpn6emTQNdrR8mqksMLmdJGp7wkLm351nPnCMEH/u0wBRe0Cx6mGMT+ivEUF
         vw3A==
X-Forwarded-Encrypted: i=1; AHgh+Rrqqsdbky4RWFo7efUynTKN60L8FKuEVFXE6TMQVfMPkS0CA3cNY2r/7y8yWoBeXsBK6lrRZTeMNc9v@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDEoimjWCsoVlWQSLKZMraydJp3RIX6uGAXMJk3Xh0zhYwyX+
	ea8pg6+lNzB4o87T2irVd4Xp82/GazNgybuFtiQ0i9Ux3lde7PQ3HJYVscl5I7IdryZiglGOlEP
	lhiCH83sFWOv//4tn3p3lgA/S1VIhQJpgOAfyH4eFuhmQ4hJoc9yicjZc7FY4mFwt
X-Gm-Gg: AR+sD10hy374ykvHy/HFVY1mKx8o3z3ISQDAtO111jGIP5D9o2+7cjHI+kM4GGMpBXW
	yfqDDkdWY2RcVftV5CKjpYcmbtuLwDiKp6sciG4eSp2jOyZwIh5HNIYJ+WwT0DU1fEmwl9TiBJ8
	FGLZY2kwF3U8JQxal2pnts4X/IllXqsas/g9OuZNGTv7o09B4rn5/Qo/gsi53Zj5fXml1F6nQSf
	AbV+D1HP4B1GTLsqjHfzLBOjosNomxUinXfeCt4gmilgS5C0MbHlQ5oar59ayHXw4m/8NOzr6bX
	v7j4DziNPECuQ4S8FI7lxgrNkouAhVp7gD62V+w7oOcUlht2EPUbkI6qMblXVSJU6Ibh+wUopsy
	6GiyvCy1buTawG358PvJ3KcTfQbzgC3yI1a2s4Gg61xSWhFy3gJILg2wHzXlZIePL7w==
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882220637.22.1784794615522;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882171637.22.1784794615041;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0f58dfsm2314697a12.13.2026.07.23.01.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:16:54 -0700 (PDT)
Message-ID: <214c704d-4979-4dc6-ac91-db672e792c22@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:16:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61cdf8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=nMW6oa_Obw0FX87ioUUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX5tNmt+PEk76T
 oqwPO6IOHJn4jGHklkigtry6RW76bAyaTXfljPchVf2ZLWXU7EViMZk9J3Q0KDzHD6PEx1TCQRv
 w1G5EZ3gXsHJZczuE77Cr4hA1JLOTDQ=
X-Proofpoint-GUID: PcpIflOSiWP5fHW_BkNwdQuaF4YLLDS3
X-Proofpoint-ORIG-GUID: PcpIflOSiWP5fHW_BkNwdQuaF4YLLDS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX1IkSjWuEx5N4
 nDeVpCDfji87JC0Ai9AsaOzUSNcx7bav8TM0Wz9k+F/hcq1LZ27xJSW4iSgLvwoFTB+qdz26S+d
 dDnhnrhAasM4joTkmbdq6HhkjQWREYL+mw0pV/hX/5K7SqZ3p9aHRl6DyKw4BVDpRNy/tLRHUIU
 ptDBcfmVDiaFePNVLygVtHMyL276kjcWtQUx8AZwvO7Zk4PMpzaSAhIDKdJplq9wZT2K0am+yX7
 394zQJ99BDHcnAxNpUuJ63rLMQuV1cjCG6BTLW0N8A/lFjmB/U690oWGvKZAkklTzbT9MI1LMiM
 yfuQ4tO2Rz9dZk/kbxbW7j+JE8dwWrHmakdUv3HBpC19Tvu++sMfLj24MfAnGqIsnXJRhwZseiX
 rdvY8Cs+C2V8Br75I+lfm3y2k88DHM7VR0Xr7IkyK0/uxwj2huDGWtperMpjh2rB1rDGZypX5wG
 LTE00dHAfNgg3vMeSDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230082



On 7/23/2026 9:46 AM, Jie Gan wrote:
> This series adds the CoreSight debug and trace subsystem for the
> Qualcomm Shikra SoC.
> 
> The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
> Trace Control Unit). The CTCU on Shikra shares the same configuration as
> the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
> "qcom,sa8775p-ctcu" compatible.
> 
> The second patch adds the DT nodes describing the CoreSight topology on
> Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
> per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
> with the CTCU and the dummy source/sink endpoints that model external
> trace sources and the EUD sink.

I just found the version number is wrong for the series, it should be V4.

I have checked my b4 branch, confirmed the version number has been 
cleared by mistake. Will take care of it in the future.

Thanks,
Jie

> 
> ---
> Changes in V4:
> - fix the wrong subject for the dt-binding patch
> - Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/
> 
> Changes in v3:
> - add correct subsystem prefix in dt-binding subject.
> - Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com
> 
> Changes in v2:
> - remove MMIO for the ETM devices.
> - Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Leo Yan <leo.yan@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (2):
>        dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
>        arm64: dts: qcom: shikra: Add coresight nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
>   2 files changed, 1296 insertions(+)
> ---
> base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
> change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1
> 
> Best regards,

