Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666235CB6D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449516; cv=none; b=n+CN1RzVs+37ApV1LaH2838m849MQt8oiyjOv2iYLDBuRBiCPz9lngip4JHyeSpNEn2Bem9MOtLWKsHMRsTk3sH5pDMt2fIbtxLshiz/5SKt5bZRN5BNOYK6CkUL5COJCfZUCWCradWZfNki9RJIjR6zrVCwVWzqRoR9PJ+8Fpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449516; c=relaxed/simple;
	bh=5uzNDy7TqOIsnMifKUBCd6yHdFj8TpZZ1Usplw3pKow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mI7qsJBu3Jo6V/dp0qxQh3rC9imdgtT5rayW+y+jUel17urV/Lx3TBjNo3B49LehvC0oI8WoO5+v41mLWRaRvjwAT1qlEKqgZtVV6cNn/HPvgEa31CpQmNuBpY2o/latlUoWhkh1ZqnnytVBY36DoWpdep/xJlVX2FTWcKVhQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNDK1sS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KW6pejZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNDK1sS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KW6pejZI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DA5WO1704802
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=; b=NNDK1sS8EU7+fuHi
	Z47VrSMumg08C0vbtN2CdVFrp1d5hbQcCjYgAT3KzH4X89uHJYCuJwOfurfObbC6
	UZHTPnqIQbItDcYvVQP8Kd1mLu3Jjzsc6IfdY76HiWM1UHSVnoWF5wsYGH6j/s0w
	kxlb+xCdRd5RBX5COlqB7uROKlQ6U1APCVFvQb9EEIJJcT6jsmbahD258WmuGrkg
	2qro2av21vsT4AVmhMluz2LLKp6zqL3g11cALp7xqUVLLuW5tJckKspauTG1UDQo
	B7b5UW9CbdbyXSvMvIAmLoVZAJP9eu2R4yIX5Nr/SHORTrBtr3CLKmXT6jI4YIFB
	kmDxow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18p7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:31:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso57920195ad.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449513; x=1789054313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=KW6pejZIG9L2AqYOMBNOWo2+CEKKlXLie7X1ZZMVzvvt4v8IR6FtT/b37Cp/SEsyNT
         0DEa72jMUaaH4mLsbSVy1McZomgIPQwCck/GM/DfyPcpMy/xv5YvryWxDNuikrYyVYW9
         dRgfnIUoxkIXNxP9Z/nFXGSC/gNbnUAybtFKAbIzfhNP8/kOqEe9gh9rBPkDUh25HBDZ
         dTsT2gUT5tH1B8HWvUNMbelSJHjwkd629FiPch+uriyiwiQgTdbez+6ZuRmDKYLaYd2h
         YYIZ83zoTiuq8sFpEYd1HcF8RsjHaQarVe6yRZpyapJsWzSczBNrEKCYcfjpaVqjVe4X
         eAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449513; x=1789054313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=WwfX2+z/BmrnlTRx7XTe+NpYmhkK2pbvY0qRjJLc1hUpK/qzSJ2toctCQDIpplOpoJ
         vQM/PXrHVZ3a4tn6MrKTCK+x7vvvgA1BUqqOR54dxg/w89t/3HArhY03M1isbT8U3fYd
         aUABbn2jUkkcvqaDHu43upcyvrFGgecw/4zDslj2HutOo2awMl9PtV626g/U+rwDKDk4
         EZqv7Or/F/m+z41c14wMojtrVbgrYIDELNMqiwQl7BofIE2ELCs9a65U7LQNkgm6EoMJ
         6rxreaOYCFozAy7O8tngL8HydPoPaD8I51MBsbGd2cfhCfRDhnrzDWUDTS+CFeXzchRc
         3G+g==
X-Forwarded-Encrypted: i=1; AKwUvBy8XXoofaaGMTVTulgMBs8r/zgg8ZZbgpYw8XKtOkqYleTgM7et2iqbzUByPXhapUbOlRwEcuNrxdbP@vger.kernel.org
X-Gm-Message-State: AFuF++lz5rDOnKdE8zVv8t5Snawp2VAo+SrAXjNLdJKP3QS+AF6ib5VT
	T7tw28DqlZ+qBXfXv5hDj6Hq7/xinS9RcTjg4es/SvFwvwp9pE28D/HXsAlI0zlh8t7o/CX1WBh
	f4j6IKAZV6xmeOJS+p4xNasNcuL2FsAtV0yN8YLcKKIG/YqZwAIBFgdfiqjJ+uhss
X-Gm-Gg: AYBFou0k+5g7Gz54E11SWIRdNCvZAMBI0/jTODcwe7B8/qtH5k8INvhuKcPpebyhWl7
	EqBNCzPONV3dl4iMIdn9LAJOYEfMcxleQDwHbVxKyXGt2JSGzAyapIfCbVuv2mea/PB0pZFrJkn
	M9cDP+o3o8Oxt9Eo5NH+UsDK5znc4Gb9CW64ryJ64D4BRcZVNqkwn6O9mFg3CxXUGLifJFYCaH8
	1RD+EBYipuyBkUrXkTSzfQ/9MR7YdpxdGGJOJ/n0d8TteL35zBaXiXLZ8UrLlIA9Spp0cwlxQTn
	J60I7/rW54R2vE6oRUJ5/8YM5ehFY9UEC96MeesyTOzOg7GiZb1WpLoboxC+LHhn55rPL3tymkF
	QQgP09/fqJ5TJV7zENSAtJnbJ5m4B5XQGPnEHXezIiI/nzjv5rt+9DwT8mJjoa+lR
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7514285ad.12.1788449512694;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7513075ad.12.1788449512195;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d7c2sm11955965ad.29.2026.09.03.08.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:31:51 -0700 (PDT)
Message-ID: <d3d418e6-ab18-4a2a-9018-4eb961f9731c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:31:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
 <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xJt36735EMLyP99Usk26UBS9IzPwYtmw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXxhX5ZCArlhme
 BHnlpsxTuqaaacOUMSguFv7dFokYghC+5CBIybYua/1e/EyttMCig5/iCp1yqVAF7VLxEGor0vq
 a1ZfNOCi6VhjLiYkKv2Pw208lFq2QUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX92MjV6VVl8zk
 LLejcInen1Ai9mpsskGlaR0nex5XrgqaAvTYrbEmNxlFG5o9CyCMg69N2DPYgr0pkItn7kpidbO
 oahZuP6rM1YqxvPYvTlLpJOZzwIiKbgnc7BSBPF+an512hBqWdyvVCyy/gXFAsid+jCoEgxMiaC
 Q5BCtEXY6VuxMC21klSBkN33jcH0/UA8KLLFvSZDA+X/lPgN1x9x8GS42jcr8rmdZeaB1xAi/y3
 MlGwNePOp4pZc4XjqST793MbFNPfUEHD4sRRIvwtjAbAXEMq+egglghzDv4UGs2XxOp75QZMxAy
 W0Nw1uwPGCTMAdpdUryQ4tuC7ImJ0g5ej9Ua9eiLUn/2etafNdiFLOf2d76qKaP+VBN0mXV+xw7
 /j4vlN0vAnrWeadhS955RJc5aZSN0PwTpvq7QWlJkVYZm7Uf2tOihnOKn7AcIr52ICOY9NbQgcM
 wkgdETZ3SpkqUYIkDGA==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9992e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bLGlZ6Hhwxh5CS4LpkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xJt36735EMLyP99Usk26UBS9IzPwYtmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030135



On 9/3/2026 9:08 PM, Abel Vesa wrote:
> On 26-08-14 05:48:18, Luo Jie wrote:
>> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
>> provides the raw reference clock to the SoC-integrated Ethernet PHY
>> (EPHY), which supports up to 2.5G link speed. The output frequency is
>> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
>> CMN_PLL_PON_CONFIG register:
>>
>> - 0: 125 MHz   - for 1G/100M/10M link speed
>> - 1: 312.5 MHz - for 2.5G link speed
>>
>> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
>> for clock-tree consistency. This is functionally identical: the
>> output rate is purely register-bit-selected and never depends on the
>> parent rate.
> 
> So it is not a slice of the cmn_pll_div2 then. What is the actual source
> of it then, in HW?

Thanks for pointing this out. The wording is confusing. The EPHY-RAW
clock is sourced from the CMN PLL /2 path in hardware, but its output
rate is selected by the PLL/MUX logic controlled by
CMN_PLL_GEPHY_312P5M_125M_SEL.

I will drop the “never depends on the parent rate” wording to avoid
implying that it is not sourced from cmn_pll_div2.
