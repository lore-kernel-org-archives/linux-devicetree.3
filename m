Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482849;
	b=ySxL96+bc8lH2xTCLIa5KMxwTF+fl4GK07BhH+7ZXQqSuy7g6hACZY2NlRF2Xkk3ZBwl
	 hxTTiehEzbIMeBb/zJiBKtZWR1crP4TU8TyTMSQLrPua0VtWjhxqROsyUZKD273JFsrEF
	 EoN5ifU/eQSjd9qRY1EFbhjlu1HafFXj8jGU8O5ysZk33IHgKwPZiCzfizJEGug3ildwi
	 t/JInvXRQiuYbiublh16zT8s6YKKBV/Avgk5fkyi7O1GzRDQz6CUWtv5lH/LNf6ykSuhM
	 mSVkkCmRBXH7dUmGfPWIJz+DAWsvl0BDe/sbZGFyLJISXeggRCBzjZblrp8sgiA1Kpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
	b=LQsRVEVIlfgLGJw8fcNQlWNS3mb1sd/bHLjrnJu+5ZnWLZPHb1Pk30jndSi9+mOthnSt
	 NFID6ZA324/kQF4WhS+lg7KG2ex82THoYD/D4/EEFxAJuMimi6DY9w125TmbjWutPhQbX
	 +f37HARh/9y2scbij/L0x78nXBq1SHe1SsmfI3fXpgs1bKqglqi4IspQ0WdWgp33colDv
	 ZPnVH0xTwGEmf91kHQnRJ4IB9GXrCTqn9Xz12Aa77Ng5owMwgHW/nj77wmiICbLjnizUV
	 g/zDNBL0sGTebAeY1OsxzsnZ8NwnzE/3gIBswBivO0EGwCzrbppy/KypzTaRGVWJz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PY//PgIC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7686606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7686606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY//PgIC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIlO4031740
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=; b=g5Mspk6N/4GC7ZKW
	EtBg6svNTggQVEvZuGHEDBNb2OznT9IEy7/HD8dNI6gLC+4xYKc3fMq9ojwf5Ntf
	i1xJD2kJ9kwJo/vNfkViHVA84C1hLqXRE8BVhWB+LeAf1aT1BMtbHn3hPTcEoSO8
	hp350xhm+p3oCyryD18OSJZ762+UIpvawKNY3p+X33JyIR8siRl2ww0kycF8dUp/
	u4taSY6xmTSy7D+NIbSuDOHqd+ezT7Ofo7TPEAmQYWDcj9uJnzK19icBZ7ykgYT5
	8Tmfgf1SOhF6eoC5WzM3D34/8bD3NcmCut2gopS9evRFKmMoAG5o2MTg2owDYTPV
	mmIAOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9esh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:54:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so96041585a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482847; x=1793087647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=PY//PgICNWuYzyjJlEJVbKWFkaGrpiiP52kHMlXFgSOFuL5mRmtdn7VHL5lb14hN5z
         8KOwzWcQGIrDuH9dm/8GJrKpCUTPyPq1NV0nj5X3JmWksBMD3rf0Oh92Ncerywhuvtgo
         RRp5rHXVMRmNOx1r6UVTLfft6sOBtzOOvNNkM9ivfJQNFIaSVi/Abh8hJkYhpMU/nyYE
         uV+MuEMQtVsc9Nh6aODBaAJYh2Gb3HDfwirWF8lpEiwLA3mAzbKHkpVGI/8pmlGMbcR2
         HX/+QTucgdZ9WuF/LhMp4nOrjAtW2DKNImKY7uxx3OAckKr7+TTUHGrUwxbFuv/Zq+K/
         Z5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482847; x=1793087647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=sssFJHDcb4+XbYlY+x+nSeD2yctwhRKxLosZRBYm58i+6qrMdtm5+2zkAWl2Qe2+NY
         OddTEElcfhKoJzl/0iFD6Vg8ohF8PqJAnNSsD4a5erqD9G19qhomzmo7zcatZ8inhO6G
         pVbDH+a/evpH6NUpqjOjcL1E8T2GLVO6qa/INSTB8xCoWOTob5YBz9vLSoD+00dOFgZy
         IfX0dIiTIFgqJeFpr/yXhh3tfXnneVj+m+lz3gA8XwqM9DHLRD9B4aFGggyBGeguwSBQ
         TU2FL73xvNVbg5kKB/Nij7ZEyYUAYy/pC+H4ImxjVqmMUHNP4cN/1mtrOwGiYRrVbaP8
         l98w==
X-Forwarded-Encrypted: i=1; AKwUvBzwJ/Fjjn0LPklrIcdirW2mCXxONEhhutvbP0Wh0Q4WD8DDNFgF7FvZq/kp3Qzh7bmNUNTzJzE+HEzp@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ZG8v5vwbRhCfRwseCzprqyHltUnw3Jf62xYEVY7KJq3x4R3/
	95e7MuBzsR/HOvmHNDTi7RwDK/H+3HWTqa0C57PYmZlnKYGOZVSOeg/i9/dqoQ4lFoggPpQpZJ+
	9llEDICTaWaE2NEf581BVovbiB4yB/wULwjyEM49R+dU5C6qxjjJhEs7fjlPpxU36
X-Gm-Gg: AYBFou2+fuPI4WC/CjRKU0BCI1TjCXwlWbR5/NBfqecw8hB4qjLz6JYlTpgog68mhQx
	PDbCNhYyng/5cEBYv5n8mh+RdPLhu6dAF5XDp9+s63BHTv2veGkIomZYwxKHyUMXVUr2SNWaJmc
	yr5MeVWrs9NVFOyZS2qWrOmcbXuLOm7J0lWczu2U9Xn/cKBSfbts24D2rAKRA78/NsGx/+xcm9M
	ymjB0LbxZjqDvqGQMYrQn1SLa4+pC2IXE5SKRQhIqGrEFsyKioBBfcwlv/btCwW1gmcYJDbv7Tf
	6UBXcg2lBwunW0jJcRnAn6sA7ADR34J92+otuogOl0/DF+7AqUJ0V4QawKIji8KqgaNEbM1cFrj
	pysCei12+ckD+RISFvEi/Iw==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887617785a.4.1792482847108;
        Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887615985a.4.1792482846657;
        Tue, 20 Oct 2026 00:54:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e3284e3sm442950566b.3.2026.10.20.00.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:54:05 -0700 (PDT)
Message-ID: <0675d408-874c-4ee0-b587-da8e6ce8d0f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:54:02 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 63fpjDRUzEyJW-r_JJ-x1uzocsWj3Mko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX52oClQviyUXM
 ls4JnEOFDmPrX7V7aoJQYSEHWvJWBfWXF+ki3AQfKFz/rYUr2nV6VvzKfPM/8Y6ylELfT1+K/7V
 yJz9hyVZv7JW4AplpumEYQJAuOPE0jMiqp4yrr13bqAMnWjpJTH5eL8LBvdNXaUWKuHwxVjOkqv
 KvAsLMazARnfGXrqwWW8Ag6pW/2wccULm8g9bX1J7psmR/AOWwpMz2xR5HecTg3eU841U18EC1L
 /v3yEpv5ZUSnJy2It1A7NLUnvsRYVjEkE05EBrxOQhrrCTI7jVYLFjpvVBR6i6rrW7d5ZSyNH4A
 g8Wg5nzZUMo08Urky84d7Z0zYqBBNP7+B2fGFugOFajQ8lZHXSNVS+KsloWxKpsTpe8VgjIcxdS
 41kI9FVeGX0IGqH1KMktPhl+stLU3nqvRBSyjHHVi2v25uYujeUPZvjESinlAjmorFTuZISm7Fx
 mKkyPHbYBWswidvZYtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX3OHmjwzEKXPr
 l8PKSbv+s7p4Sbjy6kzXCC3sbf2OqMqJT78CwPlJvwJ2myWrXKP6VS2EN9vp7gWv+jJqO3HFMFG
 FhZUFCPEgNghbgfu1Kb8q5ybYZze3Gk=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71e1f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jr9c3DReKV2X8DuSQbUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 63fpjDRUzEyJW-r_JJ-x1uzocsWj3Mko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200031

On 10/9/26 3:50 PM, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  1 +
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index d7a42a8040a1..7ffe6b9019d8 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
>  	},
>  };
>  
> +static const struct llcc_slice_config ipq9650_data[] = {
> +	{
> +		.usecase_id = LLCC_PPE_RXFILL,
> +		.slice_id = 1,
> +		.max_cap = 128,
> +		.priority = 1,
> +		.bonus_ways = 0x007F,

Please use lowercase hex consistently

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
