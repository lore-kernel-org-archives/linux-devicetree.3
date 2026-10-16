Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAA30F7FB
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113379; cv=none; b=fO9hBvC0U6drsIREUsCpJnDfj3/vbgbSA0jEWQgUpHUCtjNlZSzc0T7T2PmU7QS0q786BxdlYalOX95hdNIaTD2Y3Vzv2IYfvtCknI8s/Zo01bEVmM4s+BEeuyX7mIZiWCgWuW9dezuNwyQNuELVFsVJ/2DlxbZmfQUbouflwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113379; c=relaxed/simple;
	bh=2c1wK9gYzYlKbLjVTNj0wetDDWNe8rPYMH3tP678Zpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRi4GQmgJZg4fjGUe5MGD3D64u/vzY0fc04/86GT5QTNYMxHIG3eGa6xMFXwOcqqeel+3ZKLwL2tffTB22BZik0dEcTiL7eqeMFFVWuRXQm2GZLgp/10I+HUCVMF7MXNmpNFX3bJFGzU2TLUGPStaLjfMuybs2BKnVzSmK9N/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPhifNud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoUskICH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPhifNud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoUskICH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKRhni3462800
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=; b=UPhifNud0sRVad0+
	n7VFeMMEZ3bBUjvNNtIXjWc1AL1penavjpVnltPXweHuyetFctH0FJyR+bpP3kst
	DFNhnwym3yVW/7iEOOCcOd7JAJ2qIkIm2T9yJ6e6JJj67OVJAqqoNQ6eCytUjUwb
	+bQtwNJUwzcOHzMx0pBeL7jo8vfYodTm5wbjhSLxHKJjjkuoIYfcpBdaguwBLzfC
	6GN0AraXbuhHmmuQvMwtGl8QkloII1R9NJ9rvOeVzon8yJUdGu937b5+pAuAxZ6P
	qCodwqd6LnLAZZqIpAXfyhX9GfgKFu0nlgVsC3TSWNust2QK+QFiueiLoGa4Rz04
	mJ7dHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6ajmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:16:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e98129bc34so4087255ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792113376; x=1792718176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=;
        b=LoUskICHYbluHwbmkYBYiK7rRhenCyRfXoSrkB2+IzTvGULY5m4cyNbw5Tj0KyMI3y
         LXIIkecMacdMhTG/TEbA5WvfZIBD/8ZSuVWpe2Ta/+tkDAGpRZLNVhrraZXIj1G+oNlB
         73SFDD0qGdPvKEws1T4rL7nQmGZeLwY0OgUsD++F3K17PLzUUugmI0HftcHdMr9k3iY0
         OYfRyzHQWY8VvC39RN7c82vMu7OEi5rULOAUyeYswZPwq36pt4EfT/AD/gRI44znllgF
         kJXRXQCYYKukbtr0t5/UOO9hSfxzXbfHF5/uzMJ5nfmrcRIA+9jYBNOVT126UMuxW1xJ
         UdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113376; x=1792718176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=;
        b=1LkpfcX77KPcyYhsApm8wlnCpixHetbNF49Q3NPzrDytVCKuLFGc8QBaKvn9w/4at8
         B3Yo6YcNDfr+fozATl6zutTrc7d+qgSbsUf7QgyTXtUcpdtAjZLFaGreSSrvTFluRx9e
         SjgadvLDulx5CHn+HjaUr/Z0Q20Hc7REC1hMeayxsV5wmIotdi2jLsp32MM1Q5NObY2N
         By1UsgVStTw3luzT+SK6aD2RqnkMvizPjlG5POkZyxcqF8PbF9ceekq3ZCvo07gqMRko
         UP4oSJMYLQP7DVrc+b56aj1z7xpbonzuSDFCS6kIkY9NCJ8LKnDB2mX0EcLXnWXPY9LK
         DMAg==
X-Forwarded-Encrypted: i=1; AKwUvBxB3Tmya9eExb/bIX1XRh+ACIlURkIRdBY6s7pn0vCWFvYb6a4QU2nzfSzg6tmpvmvEdbggxoiPsBnP@vger.kernel.org
X-Gm-Message-State: AFq9FYKZSZvabgFXN859WUKMRUTIYYt9sXd+NOpcIWf+/c8pnqfgdC8j
	C8ZeLVKElQ2H460WpTcbBOaUXIDkhygCY8YoAVyH6giVkmEVhRrNKWHfi3VL4lCX++2YSFWp2jk
	G6LAk3qPyi77uAFBDeCrVmRA4ibIW5lOOHxu0Qg5Hse/0hn8PP1JW/jn/l6zdxg5z
X-Gm-Gg: AYBFou2v1HKdhointtQDXVgVrF8iHFEqH3+JS43JOqwAqbVIe/h3FhfF7BeJJlXXhpV
	vfm1m5Xd9KzRA5T3Thfp7BXjL/PMfj054RIcK7sTuM0yCkI3sn7jpEd82/PT6TssHhTb81vRjS5
	VIqf7vPvliMg5QzYjrck/kBcT6L2R378hgP6oZgygcvH6O9TXvHECj3oY1kFNxdnb71roohN6gR
	HjVnUs/h1vVYmNbV5HOlr4C453EiO7pyaPPr270BDbNdzNz4dxyB+7k56ZBhujdlHVEjL7FZDjr
	KqyLS7RdClT9m3lOg43bmIxj9vI8i7SWRPRNBn5X7cESIjM/HErtX99WBctJqVjIucyFkYFxJEh
	V07XCM9ZVIMGZHtah3IYNOndysjpIC2955w/nMCJNtuDwcv7EjtUoiQj85j0naFwK
X-Received: by 2002:a17:903:251:b0:2e9:6468:1ffc with SMTP id d9443c01a7336-2e97754397dmr11749195ad.20.1792113376009;
        Thu, 15 Oct 2026 18:16:16 -0700 (PDT)
X-Received: by 2002:a17:903:251:b0:2e9:6468:1ffc with SMTP id d9443c01a7336-2e97754397dmr11748875ad.20.1792113375413;
        Thu, 15 Oct 2026 18:16:15 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8997edsm2651535ad.63.2026.10.15.18.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:16:14 -0700 (PDT)
Message-ID: <97246003-eb3f-481e-a659-2d5a0234c6a5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:16:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <37ddf1d4-4c53-4f74-ae15-f1f8025a79f7@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <37ddf1d4-4c53-4f74-ae15-f1f8025a79f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1_4Kw8u-NaSwGQvp4pg4FoXm9wsIIjxq
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad17ae1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xuU9YvB76CLXlpF1iJ4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1_4Kw8u-NaSwGQvp4pg4FoXm9wsIIjxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfXzemzxv2bCQBj
 hP0XZgOVB16Y8UbnAbFTd82zz9yoo6JY42uxGM8pS7rdv7JpYLEOFrRsY65KRNvjKoI819ydti/
 sTLp/pjITwVHFV8lwZsmkDCd4KyJiWVxTPTPhTxPH3/VL7b2asqBxemBaDKvjoA78Zk8q4sAEju
 PsPJr9hNNyE2WvwNVWVrk2ERVupkudoX+gIHO5N/MQXMBuicYbGf0jZrAyHDLaMgddwmuA3H70v
 SaaJ3oxcZwNhYjkuTzmKHgIEB2+XvWHu46WzpwxU6j0YX6A2Hhw3ieWEoiDxTigkUaJf7REqJL4
 GzcqNF0eQgvgnXuwbK4/TBuVrL9BItE/WDPGQ3uZlofUFB9/1cTyI8yA6TYDmZKEsv4DbiiZCF1
 X4CpUsDarcX4nlk9tM8ro4OlpJqG2sFyeE4cuBUoFNwJkqI9RTU36slczrQYRGtvBS3ilQNg0tW
 jQnGwYC+33elCGkRZOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX131thQqmNAqQ
 OQdCzl4qz7N1PEuyAMeYmytQoNNZGLD6KP7CZy03tX1T3tqc7648BdAgcfhBeWifJF7+s3znLHH
 X9nMFqJPBJj98CFoDElqSvlcjMSlIW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160004



On 10/15/2026 10:18 PM, Konrad Dybcio wrote:
> On 9/22/26 12:08 PM, Shawn Guo wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
>> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
>> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
>> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
>> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
>> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
>> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
>> sink.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
> 
> 
>> +	tpdm-nsp0-cdsp-llm {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_nsp0_cdsp_llm";
>> +
>> +		qcom,cmb-element-bits = <32>;
>> +
>> +		out-ports {
>> +			port {
>> +				nsp0_tpdm0_out: endpoint {
>> +					remote-endpoint = <&nsp0_tpda_in0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-nsp0-cdsp-llm-2 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_nsp0_cdsp_llm_2";
> 
> GPT points out you have a separator befoer the '2' here, but not in other places

skipped '1' here, we can rename the node to llm-1 to avoid misunderstanding.

Thanks,
Jie

> 
> Konrad

