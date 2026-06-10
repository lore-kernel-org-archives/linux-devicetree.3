Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA93FCB03
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094272; cv=none; b=YgrWDxin8mXdcmzgB0jENbyE5gBEktmaSCWEqgOpSiQuraOG5AqILk4fNpRlm+2kk09ESxqkcYIJzBgbXNg9Ir1bsOTcxsCFDk9qOPpM2pZDjKTkgIqzm0+dyAd5HE0FqJCvf753Gbn5sHSRXaqTg04ln4naJ4X6+ygL2xtoXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094272; c=relaxed/simple;
	bh=+58dkkhzFmFWzk9Gmvjn9HJUpCHLBYAvtBUgkR2/5SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIHfDDgfood8rUD63jrF3XVYqGY7ellnztzPQ3Nub/znXOMbCQ7i295Nyy6GaF/zxPBG/xtJwitSUFNPTp+5cx0k25pKd/L7emQkvv92iVqXtZq+T3Z6gpftzi5IRsJDpTLacYQKJfqJWtntbphTWsa/cpQEbij3iB+6RtH9Cps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+fp6481; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/H3wYMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+fp6481";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/H3wYMe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC0S81606461
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=; b=o+fp6481pY9Yq97z
	ndnZ9yRSQWJw6vgv/jFZq8G/xStfsajlao1nmP4FsdoAGFUbLw1qR52MM4IcO4Wp
	YlMOfsaopMCdDqyRDmGg9MMQpSsQte7TeAT8GAEHBslBasWGkN2nALGyjsDdGYkS
	FmqcpQ+wT+8wlN2ZkUpRUi2oQixGiy+8T+p6381tZZA6tyAFai/mBaBTaRNifcHy
	9ARB5c3KPs40JiUwfl9kr00SxgFs+64NmBoBTUmZRKHGCaIR2mW5MvmCfXjaPIXn
	uxkYR0Dz07zQcBoS+8ZEk16f27dOYM1k8Ep3l+SkBP0tjPcGzVlK1XGp1oeHJFEg
	5hOM4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9qyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:24:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178a632a12so18272691cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781094270; x=1781699070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=;
        b=G/H3wYMe1WuFRwcY/knPbvNCzCGoUomTNoHnOA104jdo1RHgusWuj0yo0HkMu6ey5h
         ydggDWcx/z1KVYG40Pqw4iLqJJOKb4vlZlbFCpO2lXA3aW9NkNV9V+lOjg2hHoVLBiG0
         2NlMZszxviGaqqnAc/GXdqOPfb0BMXTn1w2nvvVidMq6Dmy/3G7xrZpE43n0UomPey6K
         PKeCBF/yXkwtK7FkVLH8cOzZT2aDYVcOV8JHdFkCvELUxde/jNxJqw9HRdaZ1NE4hOZP
         PN2I7jDhxORn38Masgc/N9iVAJ1CUSBn0JjvTlkR7mySJhSZG+FNL6Ki5TrPWKLghVrA
         rTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094270; x=1781699070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=;
        b=kvGcuLSLpKcPFMsop8wiW/ml7CJ5tTD3ifNDMvR3KYjTl/+rGlB2I30XgBUoOJM/vm
         wTni3eq7SbNRDcW149SA4dsF2D5YvLu4t3q5Bc+OgV8l4/0QAdk1B5Xm7kvu7KnxYE49
         VQ8cVG5y3S5AnkRvDqXYqcpd5H2jhLBmBGNUwm+YAc+cHNSXL2jHA8v7pHJt7J49Icq+
         e3AOOCva4yKpMwfrP4VrRSB4C8OXhDv+ivuikwzmiBVPTnZIYKtFZZ6MyNwI7hnzMta6
         Gcn9BNuHCi/evsM4ats/ukRkpkpLuj4Z/4pf8GMrJFoiKBbyQDg8YvTM7OSnqJP5dAz/
         lSRw==
X-Forwarded-Encrypted: i=1; AFNElJ/FJMSeGeQMieFlTQP5sdvPY58oXTSpqYTEvpyUI/Wn7p3oJjRfw9ULXTp0VfiPrv1Bda0sgiCbt/eh@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc/NuvQ+6d3KH8xzJZWGpM2LynGQUZ95dRZR44UOeO4IDEVot
	5W7XwFtjsIZtS+48YSos8Zojyb7/PZn2/B10N9twJJjCoM7t00wWIIpLaEgK5CxY+piQIdAcxLu
	81uDE8wA6J1d03eTWfPPup2BU1HA+S78V2Mu19Arvjt/mkZ8IhxAV7T2q/CCncvEh
X-Gm-Gg: Acq92OEHfnH3OVldqLYKubhbKu+mG0NfCMaVBhq63udPmWrmp4dFuzeH/8ZtVUAEx/x
	yoXBtv+6zz0KKGEmVDjJeoK1n4iDXoLoFNBf6KlTlcyEx/od8oK36yO4tlChwDhEM17XnSDB4Cp
	TswtkA8T7se486/Zyiw8rELymV+vzi5dcsZ4/7xghF56yrAkGGX2OCI4hokj71UjT9awGdkoTOI
	APy7ULa81b4My0a7cZ9KtoAjiA2dYlAacQkb5+i5pwTDHpzDU53UJihBD6UmzFldPCq8HGFi7QU
	V6xowkpx/sE66ij87eqNO2RK8nYgL3jk77ps9yYMkUHOxhhWWLg6VtELKO3/OdBAnlGAZipFiiI
	sJxS0viyioB3x9CHDRR1SCKtPgbaRxW2O5x+p3Q2rsCrWSicJLLc5fRag
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr66925371cf.2.1781094269953;
        Wed, 10 Jun 2026 05:24:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr66924761cf.2.1781094269455;
        Wed, 10 Jun 2026 05:24:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm9858893a12.0.2026.06.10.05.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:24:28 -0700 (PDT)
Message-ID: <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:24:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29577e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G7F_0OPF8zoUQoNe8PQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Xg7_e7pF8zNhawaO33XaOYRSTtUm4oRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOCBTYWx0ZWRfX/Q2Ip2R9XZNT
 Sstz+eVkMsYlMEPSZ+2beY2swL+EgCyXliwjcCiFGwBMZUrEE9WfqPR8NgCMoffafilYRmotypc
 2j6MMf0sS2swY8nlG6q0ax828Tq5qSrhLa6DUzez35QvNmcunThW82qSdo78oCdpW4VtdWAIRRL
 EEgxVHU8GIocx4VeSOqJLYWcvWbS7YKNKo/Nt1fVwYMnJ/ustv2p4pzd0QhsLRTSH9pM5WDcP3X
 D5GI7l/SykuWnPzu4sqFQ/2Zzc3x1rneE6CwjnVQhuzXA5jMKvG3+Uhpi+P/mH02bPDwjBRksA3
 lqP+pHnfS2nucfgUAHN+/beGvx1siX0yR7s2BlmgG8c9+wgVAaiTAxDx+1Z2gSCgTN3xs/zppFe
 6ii00M8VqwLXOtN0k824IUSz6oebm7YcAMVCH/rWvX/KeJVU5HFn71sRrUNkStjbP4BNIIBw1eE
 rN3N4AOTRS+aa7YXlQw==
X-Proofpoint-GUID: Xg7_e7pF8zNhawaO33XaOYRSTtUm4oRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100118

On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> MMCX voltage levels.
> 
> Add MMCX domain to the Iris device node.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;

So the computer tells me low_svs would be enough for PLL0 to generate 720MHz

Is there some transient dependency that bumps this to svs?

Your changelog mentions you altered this in v6, but I don't see any related
discussion

Konrad
