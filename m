Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D34A99D9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441049; cv=none; b=UYdol2rCxs/HSlU04oiqsFOB6W8IvubYnZwu9QkMDsou2PlvvYg7ezyYBYzHqmYUMOyOrY26/Jhg3L0svvWe1hhp2OhskHrZpX4JJuWwkAFzfwSz+0lL+SdjLC3R2lR5W47WRilVo5GYyv3ADDvsQmhv0rc5fZRTplvKGE6dG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441049; c=relaxed/simple;
	bh=OUocHxNHaoVUmZukJnp6L5cZUWHYtQ8kCIucV6TV0dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSUXsqFKjO7aAaCkbJNvFXvAha0hkjYDj6ygOh9AB/EdfzeC5cUlctdeUHtmSiH5Y0mLaiVdgyBR5+3ok5pCX3jONYsz9CGXQIDv9RHbCL3SCpWZSvORmnKAlfrOhmBVvQNqvNkIyTODsJnoLb+9OCzDO0ciaR10UdXN4EmIQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKptOiMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Frbutl1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKptOiMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Frbutl1X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcuO4158140
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cn7sN8g06PhLcqch4IQw8gv6
	uTx2KKsaOGyxpQeDq28=; b=RKptOiMUoW8m6un7H8mN1o8vuFe58rpoeMHd2MB+
	FpSzPfgYfRk8yln61tLY05aKdlhqqlg/yIvwhNmUX+/aTZQ48+j9nwEnd99Fm/Gw
	Yl2h21GuM/Oh16enKrF20x73FapEdqdvGAcWaD9IZ/eXi13uFCmpVxlXqgGgBIxK
	ficdduSqECy/4PHfW/BAWAED3Z63CExjKMEiSsnYee0mwj4u5plLoDErK2L6vBEq
	F9HtvbyOJJUQfUPOrL75jjVZwqeM0g3MrZg0RD4epFoULebGqCUbCd41OlloA26/
	vOIiPdV9vB9BO4GAFIxmksxZzD+ZWojePPztkbA5XfuQoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds10a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:10:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso334541885a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441039; x=1789045839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=Frbutl1X9lV00ToVuNj3CqVOKjJ2A+TixGO7y9vaOM24BuZER/RdWpBFP6pZ1x0/M6
         DGHlLgUjP+LsTkUnKz9gNRj8M6NdVgGtxYbXUKLn4JuFuypiyQBJkoxGjqwkJlWuD9Rg
         kATPgQLuKMXA6ANY98AvucA25oGjB8BkebQDUICPpp3cPpEPTkqebgEhZtgt8xGP+Yr1
         LSvMQklzbQW5N5rhtnkYcPHUMVfPyiCjuQSRUgnEf4tBC6YTaLXcqoPeYWI3e98oTL1g
         33sgqqOVbXu+NrocjA5AiGZ+1b+QE86+zGesFxtkMV+ENrOWXDqZvYVuG0gjHZO827Es
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441039; x=1789045839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=dVMs165CwY6dB7uIqflXkehwHOtoZO8P6lshBoO3H3wJbMmqj7dk7zcp866wROMAXM
         1wv+Rreh6tKPDSHmKC8Toa2Pwm8LkMkHsAHLNXc5QKj48p/wGPUs8aMdRExtgAb2wbzf
         r0DEGMyMi1l7PW0ogYuBzWSMVEiTKwmmKe+mCcErGOn40sm6we2VFHxk1C6M4P7R2au1
         +2FS5lVxrq6+fCfWN8lr+swX31+PXh14SWM/ZzfCGJuJ3XwjeP5y0OMkUZk1PG/PLGyB
         7DGOrW68lAdeDW8IbI4WDghxjvlXYSkLU3/1t6H4SUVqEOT9IZdu20AVBjRDw3YMbQT9
         Z65g==
X-Forwarded-Encrypted: i=1; AKwUvBzgF4RPgXEJlLvjZiea9wEIOWiJnlit3PKasPz/thZGUPSChD9tn9k1KKjs0thKEwgSG1yiHx0Xw6PE@vger.kernel.org
X-Gm-Message-State: AFuF++m2CMvGBFIjli0qK3AIsVOQx+yA1PZv8hpP4FZsOTT6m/m6hmzp
	tLfb5KEd3SC0FqT8ZWcTbQN7kfjq1LGVerxeei6QuMJW+560jLNwx9Os9yg5TrTsRYsG1Z2aK/j
	Fi/iNvYZNlv4Y7UO49GFvZZZAxES2e/3ta6qA0l7u5XnMjuUjshavZxjzo483fVz6
X-Gm-Gg: AYBFou01aJLrm3CV+QrK5ddxKXr9745O6e07n3F1Vo8GvMq747s6o3EHWXbXV+6BjgJ
	0sfU/+5Rp/uKZYKQsf98pMYA/6gBuha4qAB8wowDuZMO+SNjDXIveIZe2lLjWOkWzwHrRo8Htnj
	bK3vD+R68XnoHGqbFKCBtDt2g19gKDaWPQ3Sh8m5Dv+D1m8uhPF3mJEbFLGzWT5J4kqWy8fm7oY
	JrL859Bj3gWCB4X0rFZTlJ2xoKrWBtsk3BnayLU2I27ammNRZyx5n7OO6xMeeXN2IkPoxbIkzLF
	RPPpojgfn55nc5erTCniZnmOTT8E9VaJi9eAVIxdP4WQv3zPyZgN9mJASUcpMsqxZJCd5j0c8Oo
	X0CO3UpN0omDufA==
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596206285a.14.1788441038762;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596195985a.14.1788441038097;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm76285335e9.4.2026.09.03.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:10:37 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:10:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Message-ID: <44uo7pmwu3iztzgwqwzygyisipoqt2bczsawojzdn7hszk6tl6@c4ybkv2zvcgy>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfXxdeX3GRn/hK1
 m61qwt/pCL54luR/9zn8Z5ZUYD/fOGmEkuDtLHxqdOC7NQ8SLIlR7PGVAbiF60CPz62S8yaS5G9
 8CZAr9vWhLM4xGXATdsNSg2Yz7bBp7U=
X-Proofpoint-ORIG-GUID: SHvx4YRi_V3HQzuR6bxQtMN5DWBF5-T8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX9tpubuJOId89
 PUhD4Z32veuhCls51rtmhENlrpN5iB1fyv+l+yZde26T5aeeelma8oB4zLf9EVFUmdIXNFzdhcI
 KLSuCwjI3YARuMud76fYZJwIGZhDohgQVGBpdJHvzPrSexapeVhAgHpG52DiMnprWsHWRaElzzr
 UcU6+iEmviLX4qA1ebtW8MvOjo/0qP0t/g97jAhx8HnD6Dm53+o2eoLgf0WmVcVILYqSUHNSCRv
 CkpjjPEnyaetKoradZLPcyGMes45D44QBevDwaRrNWUEfC+Oly7d0hpSepQWg1td/omefIx0UFE
 masCxpFAwAnxq9qs6UVEkwtraYfMTySscapVIea9vhB9pUKS9/YUSudBRdzpBr/C7r5z7lty0Ix
 PCHDj4a+GSuy4Ac/2BYK7WUAxjMlqlWebLV6ns7Lj30AI1/OKogbwEDDzUAqOnuyCBbrtiIic2/
 3stU66jsuA9A2NNowNg==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9971cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=T-px378Lc1Y-79xuwAIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SHvx4YRi_V3HQzuR6bxQtMN5DWBF5-T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030114

On 26-08-14 05:48:13, Luo Jie wrote:
> Add a flags field to struct clk_regmap_div and OR it into the
> CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
> divider_ro_determine_rate(), divider_get_val(), and
> divider_recalc_rate(), so that qcom drivers can opt into
> CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.
> 
> This is additive and backward compatible: existing clk_regmap_div
> users don't initialize .flags, so it defaults to 0, and
> CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
