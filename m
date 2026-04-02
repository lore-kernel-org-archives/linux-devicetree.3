Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D2381B01
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113356; cv=none; b=GKqP/MGkp4bJ5tlG+gC4Mcnwl53WnUxXygh57OpUP3O3Bxef9OuzF+tl4AQNel3sqNS8jmhv0NG9k+fnNOqPWH1oEgQ07FhGdaWVrZLT8W++rQeeG1333W0yn2K28dFfPjPOMGO6Wqy3gqygZ26A/TXZCE+WQ6vm4SpmHZpqCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113356; c=relaxed/simple;
	bh=4rAm94zlKv4kDb9SubQDA9pMcstbhof+gbe9hGaK9J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhlwGbVkTAE7xJfpBIlQcuuq7wUDD/Ex+uA3M1m8q07F5cS2Ow2FRF1sEKqxPJ0JtwqhhtXkbCtAIsxC2FZUiZuxZ3HZc/gIQHjEN+1Lo1Cw4tSQ2o1h/ZKY/2rtpcz5iozW1gS+W86PEQo2BFrSF687AP0yKFXGXdDovCsV0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XU1maPiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUGtgp3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XU1maPiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUGtgp3z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QgsS1551206
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 07:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=; b=XU1maPiJpQnGKAo5
	BuCccYOSeWC61DcWtoFQJQ1OaVibb/42p+cq0oZsz0bMaV4d6vv5x6uKKDFpfoBe
	1oSS0qGg9U++NWGvg1wbLJl67H5plS8XIUImy6SzlU70GR7Zca1bpEJm9ovzjdAb
	U2UH3X5kwxQKuOYnLz3S0B9GNFq59vLYqgqVXgPogNvKCn5J8k3KYm/RDWAsf2We
	7670AdV+aMHH706ighwkAjR8oLuxF+7auLvdxZqVgVrqAYLCyEvfGmLUE0tWqC/e
	KywjHIzVkUEd9KNQqiHI3VPC6N+KczstLekxh9w3fiqhj1/j8r8IdP3P9e3Z7crn
	YDhSSw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerj4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 07:02:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d96923dd2so540133a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775113354; x=1775718154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=;
        b=eUGtgp3zVxzESmlwLqgMwKg28QLsH5QZ5CQ8e3/Y9J0RQp2tlacsoGsDITq5gjH4Ss
         9naSJBO2czJCT2VRlpSX3Kz3BFm7Xubrb8MV+HhbDOA0bRFhnZ6s4PmJGRwynk8SJ5uO
         duF+JjFGtGw2ND0R4Eo0+N/zG1XNfoNOkq/1z2LKS7kw+ICKL/7B9sKeNHwxf9v5JOrt
         zhPpKhbNWj7tBGDQBviVxuxa5XFIrQCgcroMz5SvUyN91kTVMfaq/BFf5xtLrJbliGBv
         k0OP2Wv6kAskN5y/b5NwzMabi8zE4+rDTmCdHfCTxQv1FfWK4L2r1pCdaxK607z7gHvw
         yQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113354; x=1775718154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTSfHPPS0BXnwzEi2mFmREKzWbgzZnCEHY3P+XzFonA=;
        b=cm/Mp5w8jiugsJG3N7Y6Q6cEu3hXU1caXqID4pu4NlOXxidPTKQWUpJYofeeL8yRKV
         ZbfF96WOfWoY8sGbR1WheoIbfH5zRnNLXMbKXqA2BIEgOJap68fdsqj5M//1RnHy2vxF
         dMlwOkOSCS8rN3OXQWpLgYf/j+b24O++AdmzpRfETsyrbErt6ayDg1HMsdEgDX4m8/7H
         9FH4lNo0SD0TDSUslJxxElPGztsBDDMH9b6tucwmURIiRfxGSvm6w2ZhnJbi605fUrF/
         GZwWaoKoayJZmWalYrYzMcd0qHnvl/Ax0pMEBj7Iz6LQjLNceUrxEqD5YFkkQADpG0XD
         AOCw==
X-Forwarded-Encrypted: i=1; AJvYcCXWM/JRD3RPYO19W7t6xseSX7KwUS/ozHxCtSU7pxCn6czLZcQA0X9qgJ4K1Me5i86ldvJDWvBm0AsB@vger.kernel.org
X-Gm-Message-State: AOJu0YzW++IRi+D9fhf9Qjr5jmv9qlIrgY+DMKUSY+fk23h2U3gmd/D6
	UoHzH08g4dJWoC7peD7TxM1xUhmHv+peZxD3KDVd61s5z8cSaBp2xLTbSKTiIJe11hw3QHxd1/0
	AlRu7g2u1IQVS0jnMdPvdQf/J85T+6NOoiWhxakZf5mNk+r4XDqRNMJBTF455N5Pm
X-Gm-Gg: AeBDieuPusgZeCy7gEXcYgo92GSlp4/H/CKRIySvWhT6xLB9PNf3BEa+G2NYPoqloww
	Lngl2WjJVjuVAUzM+WhlfWO0ZeZaySX7yzSP1pQZLTCSf/FbfmijRFi0MTBFvR83inP96Sje4P0
	Ku73r92YvAlWXWt/aLctF10goSQ9aVwmj/PvWIH5P5MbJfzuii27EEjy55xgBF43u0+DmMCe87E
	UpSvsSvyS37Mv4q+vxi2in9DvKEtW4B/Jaqm44+WLWfZQhgP9DsQRWtKsph5TAENCzs9pHNlc4V
	9irJSRBl6mQkyGoZfDjaZEHlnYrIDtRktA/n7xS8dwC7sYwQHE7POH5ESCTCDWYxGTLaVlCROaM
	clpLAGHPatpa3NwTHj4D/fvY8nNIhO/KvLouwFniocGCPodBWvw==
X-Received: by 2002:a17:90b:57c6:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35dc6fae436mr5587920a91.19.1775113353840;
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
X-Received: by 2002:a17:90b:57c6:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35dc6fae436mr5587895a91.19.1775113353382;
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba330dd0sm3580166a91.0.2026.04.02.00.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 00:02:33 -0700 (PDT)
Message-ID: <720ba567-6763-45d3-9ad2-6acc4c1a6e73@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:32:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0YcUVjUPCJfQZBanSIBGO3vaScXSknMr
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce148a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ImS790WZ534UxHvqx5kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0YcUVjUPCJfQZBanSIBGO3vaScXSknMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MSBTYWx0ZWRfX32eeQXDaiId5
 /fC0/LMwWCykcBbrjOvb8abKE9WJNl3pI52666NWxMMYtyrDKBeHHYc8O77QSxNc8O6aBhyvSWE
 HeSejH5hQXY04dcKbJDxkLST1bgWJfiEaoYxA3Zz0cP+7Fq2zJINHDuJG1k7dNr3EnxtWgyqBzT
 qUHdeWh1OD2QfpYLaDaAR0Ofq0wfH1vevhE84oQXiBMsbdlVrcVXihL2185bDf4JXnsSyNqsoKQ
 ULWZGK/ibfzbAxEbziVq4eHGGYAJQ6nRZBZwlkLHOlOjiPrJzACZjQk1vK55+ZPzFRCBgpZGjc4
 9ydTwRbZ1j9m3Upjbbcv6nu6WJweqQVSemsNEwPCGz83SKpP3/qXRws0CChWxgYqRVxE6H5UL7s
 /C1wpK6FFU4RPgkEwP/2q5DhENQDh3s05p+touV1Renxm5J4lclwa2wQ4uTrz9QgLn5xL/cA7u6
 tu+mdC++NOsQHYc3jeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020061



On 4/1/2026 2:45 PM, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 19849703be4a..f5ae2a63765d 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -102,11 +102,21 @@ static struct rpmhpd cx_ao_w_mx_parent = {
>  	.res_name = "cx.lvl",
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

