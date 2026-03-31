Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B43E0252
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945837; cv=none; b=raOiNj2L8BYl2c133TSfra8DBYwK6i9TAYVNBZ4QorsNyhSEtms87JxUMYh+AhTF/9vfzGMcSLebUjlOoS6alOdO4aENl97p6WZ3dBiGo0Fhiulw5tbLSS7diawn5QbUFUUsrP9bGkpuunVyUt1QiKf99RQPu1m/F7FfdA6OvnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945837; c=relaxed/simple;
	bh=zhSw1H3hTV272BHay1QKVTvp6fECnqDFpv0i+7GGyts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r1CbxZaMvffFuqxsQjwAMIJV91VkGw+H6zp6Ic8rWGDsNvKSvf7P+f/1kBt+EvOMKNSNqOMUGQsCaaxy/givkk/5IqW19rigAskOOMnw5CYlC6Tne4c7F2j/ajhcZTOSxBOsJvwZIJ/XMbcp6q22YxvQu53HQTbfBQOkp4uandU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU/Ph715; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kf8o2ibl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU/Ph715";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf8o2ibl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xubQ2164264
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=; b=KU/Ph715SWzVFZYf
	SayWknkRotlWp2XUt5gZ7bqGtfwZzpWJ87LrjfX2hKpkIm2WTrtfp4fXc4iTdxgl
	2ZpSyLbg5wtPhexmV7xw/P93lkss1uoGPneq7R1y+5RcWqKbPer7saVxJTpdXcAr
	jawbtA9JSbFd9SvQHq05wcWXWrNJajBQUBvKgmsNiQbTqORLBMHxMfCHi/JXUsNF
	Wx3kAmSydj+snCkhVZObDYhCwMLyGW4vVlbdnc5Gv0a90iEVtV4fL/IFRe94Br5m
	Dmwx1WiuglRsQG4bfNk8Xqm7XpStz2+DtNn8oHXwtS1HFIhtO5LfHQtkBx3aEn3r
	Jja+ig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0cyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:30:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f548d0872so9332586d6.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945834; x=1775550634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=;
        b=Kf8o2ibl5m7GlKYQL9b2MBb8fU9lt3BYJPPiOq3F9ATXMuv89g54dFmXETrS/7e6Yk
         iUAU6dNSEy2G0je7ddhtR1WOZufZpIFCrQYpyeoIt7U4CZTsl3AmytraYTzeAHWykLZm
         Zeyee/Pcn7Eng/Jfg4tsAxBppI5+NWpiHYjSSOSobLVd7A1QA5snsI2Ourx077ZrDdUd
         adoAsr/jzDHvn4pkywWNyxU/cl+8sSzOG3I8gm8dciVB8unoWUVrqOn8rOTmv16D5Tzr
         F3/6LB78ADW0dBqe/KBKF2DBVOj2OWXTho739p4gOyTWWNOG9MbiJ4tb3ex9lv5lbD/E
         LUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945834; x=1775550634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=;
        b=Mke3zILIjL4XbGPD4sYKh1k604MR7yTzkwrEZCs/Jnty5uZie/oDYTL0WUaR07EPvP
         yx2Rndin6z8+p9rKtLjqPZd58nxpgsaeS5e/aHwZILQSV467rfewO4KVtFMuB6kpQ/re
         L+zbKdTMAULYzU8bFQYh62TyL2abhHKRgk6jmulLPnoTUQe2+MEzAQQRCU7Z1XKZ6pRU
         ac74PADZIrx7U6MZivbK1Fxf9ZGrmhDTi6QDOExKrGddf7ApPpPWsZRFB2fcNT0GH68L
         9spdSYF3Ex+OAZzrpD0YwcFNxrZ1oZJFM1REjVCmLrLUrGdgv3AVycp0+RkrhKtjfNn5
         PZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVzhSmfHjeWiH6HYOAyzq488g0OnXsvMZZyy46SMzg5ifOJos/vJXpPnv43BFbUCoXhsDWvz/lOzD0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VhyUa4THhwGCDamSAmdSqXE/H4knFiywG5S1CR5Jg1BZuSz1
	3honDCSvysj9fumpJ1E0ahNGb1YAsP7E6oHro+FrE5nl8Qqt5ztEv9imDxHE4P1A03lopjc3WtZ
	+nLoD++kiEbWatkFwHsLV3KCCDMh9JCe/p28z6t9VCNh7tX5glkBgzIwbR0klqusW
X-Gm-Gg: ATEYQzxi3Q0fUf9gWnrwPrIlGCsaRGI6rbpIefXhyh2aAHVJKXar5AnC+A9Fnekh94z
	tBNeR4C+kLF7DFzMD48bdiCuqhHCf6OfRdEsQ/nfCTziu/QG+ZM5MnwrzPcNTe4cKrZwpWhvZW/
	ieBZD5z2BGV2dWaY7AZqeT0kp60HAj1f8slSuYcorAWPS9Obwsyemh99hmr1TmXAx9d1IQfx1VV
	CIF2wf/ZuIibqZAjF9fnwsp2ILyy4kMQd+D8GF5x1K/HqIIN2/m72u0MOO9SXNzSuB1+CjSHaV0
	+nt8nDFr0mSQg8sO7rjgEb/WAnnDpfNu2Xz9Bx6Etfa6boS6oX4Fzn6f+5GpmbR/52wFb+FUNQu
	1ltEbF217dESWv9g304838MYG8kvqzZ891xDuZviaQTzKQpF0zI2ITxZ5SQroTX3qohN/T5+rcA
	l+OjY=
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr131302276d6.1.1774945834298;
        Tue, 31 Mar 2026 01:30:34 -0700 (PDT)
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr131302016d6.1.1774945833919;
        Tue, 31 Mar 2026 01:30:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm375575766b.58.2026.03.31.01.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:30:32 -0700 (PDT)
Message-ID: <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:30:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330165237.101045-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb862b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aS_UQZgCiH0XZnXXTdUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: nNsZw7Y8_o5zf5V4hqV7p6WYEgQ31rPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfXx06S9FQuya8t
 0SjG8nqKZULjQ2VVceLn8Ia5g4/D/phvsCJVEnfAyUx1lLyfGCS0lpx3rz+uWDeUnh1fdNsfSDr
 L/T49H5UNOuHS1P+V0rBsOdwhKcyzH5nkuHxQHT8fcUd6scN+M4e5CWnZLDdRwdpjsflBC6ksAK
 64CUF92tMwQhO1dfpM+4uyB5bfDtzyJ8MwTHvqIR6nmLaRnkDTVXri7uQmB8bFDNoRILx5r0NAm
 /TF+vgN3huHCjdmd24uMucHrJUddgPOfXzbZDS6t1tryVp2eSsuQh1sEGLgBY3lEcig714slVSO
 EY//AWLofmrlkghvmgIb8mdJL6zEwSzO/OyFOtZrN4cp55xWNhb5GXf2Sid4lfiDC8KtoJrCEZM
 sciPPT23IjLAObDIr9gm21bFdmW48OxNAVH54zmGP3ZfHr81tUEdLZKMpZRWT8mgrcxYo4Lut88
 vZIYPOGtqxShc/P+Qcw==
X-Proofpoint-ORIG-GUID: nNsZw7Y8_o5zf5V4hqV7p6WYEgQ31rPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079

On 3/30/26 6:52 PM, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this tolerates linking to any CPU in a given cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]
> +	if (cpu_id < 0) {
> +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> +		return -EINVAL;
> +	}

nit: try to use 'return dev_err_probe(dev, ret, "....") in the future

Konrad
