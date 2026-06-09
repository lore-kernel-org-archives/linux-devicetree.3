Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E503C584A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984036; cv=none; b=D6zLWtHvydeGe4XJQHpJNI2g7yuzj5hL12JOjQmCfmW9F88ugbhnlUGMZoob6ckQjciMpD+vYzFI1yGRrHN1FcW9HQ7RdlM3t2oc8w7oVacAaNN0rqMRf468nEMN0yydZCUYIaTP+es3oUd9cNLDVq0tlvGiq+aMSYBg2KGWt1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984036; c=relaxed/simple;
	bh=so1zBd3nO45nJIzTPGgrERW8Lcd2s/vTZUV+2uG8ilI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1cA3jA4XAfQO1H6L4JfmL6jw905bKq7Z6nOQ5p0JD0kNzmT30CKWNNLDarEGJxHodHX8ztaN7Da7zzwsPlNLMUnTf56QtBPIdG1nHoU7s00HrvFOOGAk84uofS78C2N5xKVeaud/5OJVBd66jAZ5QdG1bMhSRQBs2evPLfCFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5VhKDm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOisqx0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5VhKDm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOisqx0z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wlc4945024
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=; b=B5VhKDm87MQusmw9
	aryygQpzC5UfGLdTFQP3AXlVg1nPZ70WRUQuR/xLLxw5/XXUVeWyj9YdVVgN2c3S
	hkAhV1TYrYpyqJ94WIr3k+xcOl0Pa56Ta1CYXrQM5477hX25T54VhOyrcMSKs6+p
	IdaJY9wOKB2meZVgwCUFoRuBFDqrpFJzeGll+wA+Lq1vUbFvzHFTeXRj5UEcm45e
	8fIyEUNf/cg2XfOnNUGP5XRBJ6jd+zMlX1/vJsg9nuUHMgzPsdS5VhTLK+OYGrp9
	NlrEZn97usI6cdIctjyAjeS+i+Ki3YgU2imXk1PWbVgOAoDvalbVwma/KpsIOOUp
	JhrBqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx4410x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:47:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so35962145ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984034; x=1781588834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=MOisqx0zbgzYFbfiwn8kiCqQZFkFR6vgc1+sbmFgVZwdGuynQ6AAAhlDDYJ0zSHWj5
         EPZSCsMqmpk3PQIwonjfY9R8c11xWfwsvQa3rDTBBnYu44oaIFPp/x+JX8lZYYh1wWs8
         VoXqbJJOh8aZiNpepk/dSv5Xy1Gb+MNumPrFBlbIMOwX2XjwIRNxZVa176zsT7wOwznV
         4r0twWf9d4UgQYE7Fr5TxxaYARWSvg1HH9QpW8yHuvx6kw7aHluRK6C+my18OyVZTFED
         ZPbQAKuhsuuXcce5TaJ8D0poW3cHTV70TZ9Qe/DxWckOh8jZ7UUUQmN949UB09I98wg5
         2Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984034; x=1781588834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=KD7GMKlkGApWoQgVk70c2tgbkaP1xmUUjxliwgDhD2RSNRL1EVHvihZDD/TVcKYMYc
         bPx0wNaVsRmRz7zrSKs31YQJFjH1DGs5vrUiG1HW/YoB76Pus7P6Q7DlzjDyHYEeNAoC
         gUHLjsxjoPMB8FR8j47sDh/3yeB2j7MdhlJGMbe5UQ6qhvgE5+XxTtXhSbeHFQIRrvMc
         vHNDEwLlxbp5FezcB6OZgySc76RSWUo+FGUNGV6kRy7k7elP1ctjJ/BOUNcRz4fzDhTz
         Cu7/naJTc04LnIVWvIxTG9gIrMzTeHRcvTTBP3/aoI7wQsdvp3+d12TfAR6Rx/nFaH4z
         irCA==
X-Forwarded-Encrypted: i=1; AFNElJ8DxI8CUsxknn37WstUM9uDWZWfjlS4qRLO6U8kfx0PAInDCG+0M8wI8oUoxphHUQlUeSBWTcYhylgs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaisf4x2muH7D6SAI9xzuHuWn0sfTSlAXhOn4/E6meoEQfgnpd
	4ZJuidbyh0Qk8Ezz5dF5ov3DAgruLcIi8oRGAjK/NvSuub/QvVytdE+3EZ4osNUMgI+jDJgcJBo
	DrPYI1T45x5zA4caUJJqK4AYqKeKh6qrmcvn4pASXaqNWMQP7j/oBL1PvXU0cMjIb
X-Gm-Gg: Acq92OFO54ZJ8/gK6oQrIitibq/rajqg617GRcXmF1BRJhzUcRkqFfKgt4VrODFWFGG
	pxwVNNLZzOqW7fpsM5AjfAEaMFg5hhKq4k9Mv0sGzL386Ood2ewtVrDCJHUqZ+jRf2gZRsAaCZg
	etvbceSnl4on9vv50nN9f+dZaROrCtgKLAmamx1/Ng0R8kLE/sC5LDU0I+nmauC97ALzzLNT7v/
	qZdcTZgPzQ0oeoA4JL9YfzW1M/6zdGPeUO/s0G4sVWx2keeZZJdd5n3cwF4v+AptOORbfJc2D93
	LLOaZHJWBK9AayrZ3Fvq3It4DQMdHoZQNaDA1vLMK9UKmtsY6Z8UnPnAcH7ZpgxXY91uPucNSW2
	cQjx+0AnfC/pt7hb29lzIq1R9UjYIw4byT2KS/JXK+Fwro5E0sd/9ccH1fFVmnuvS
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076615ad.3.1780984033347;
        Mon, 08 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076015ad.3.1780984032810;
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm192056405ad.69.2026.06.08.22.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <44671f38-88d0-55f1-0a54-3997f37c5a60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:17:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Content-Language: en-US
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
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27a8e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2OYgVc-5B2WHko4x-TYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aSlTc5CApu-XNzeMQm76GQH1RkFGZWNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MSBTYWx0ZWRfX8Vjw74ZGA4Gn
 Vjr+63VCYU3rxKJxFmr3+nYbkscxKsSLv5CX8myZBTaQ2sRzzz6glubH/+VyoMbsgybKNIAwp6I
 mieXvmoeQ/aq3fysUJoC5tWy3xDCsFw7kJUDkT9iCnTeJ5FVbOoS3af/AY6dMVbJfVWHZSBTmeQ
 PP2g8fM7kdU6zgRX3wIxOjHYgNVqOB2+yPbpYnFycX8iPNZGeYZmhGSsrURD89Cw7CmFSwia5Kd
 lk0Z7O50QLhdGQE+9/xYkaceRj0IrumKE0PLkYj9PT8zCkn++aizqibjlRdfTJqaVq5kl56/0nT
 6T1p2fG7ankxDy8+ks52R0u/22KV/4MR05+RV4+FeO922eDFi1UXD2axUwROB7zRNjx57ThlQxw
 L7kXlFbLFwQKCusOvEiME7IkYYVukg==
X-Proofpoint-GUID: aSlTc5CApu-XNzeMQm76GQH1RkFGZWNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090051


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 6150380795b8..f6044bfaef87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> -				opp-720000000 {
> -					opp-hz = /bits/ 64 <720000000>;
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-1014000000 {
> -					opp-hz = /bits/ 64 <1014000000>;
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-1098000000 {
> -					opp-hz = /bits/ 64 <1098000000>;
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_svs_l1>;
>  				};
>  
> -				opp-1332000000 {
> -					opp-hz = /bits/ 64 <1332000000>;
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

