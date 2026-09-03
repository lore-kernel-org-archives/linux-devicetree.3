Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E574D90AC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448899; cv=none; b=N5T55V1HL3CUISpiCyKB++0Fqcfpm8LmhHHIHSb5b5nprwSapSZ0PPmhkqcdkF+TySNSuq+wjO1DMLHCqqmkjH/OdFi6KuhtUgJVuLeQlOnkq+p2Q96GYOXsFNxvSrLNQXuEHc9nm9hu5rUuIXkw7LycSTS7fQ+cbS7ZseWivMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448899; c=relaxed/simple;
	bh=AJRmnZv8TBL24Tq4Nk/MVvTyAGNJB3SKUgQnbs7iPxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVLJ2KWoTYzmvG/L/R14mVwVSFU6zUJ/keIx5V9gi6wPJ028b3Ol6Z8VDiE6YbOzkBU84zNFS8Z7oMP5wHXEpA2aZJOkV1YkTuMAKYnS0LyWZ+yDLilp7AB10Xk2kmlhhI/Ar7JVIWRIkJOLkCrqfJPpPSX+xyMlDPFAwDORQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuImJggM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtyFAJ3c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuImJggM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtyFAJ3c"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAPR2035512
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=; b=VuImJggMuzKB4UNo
	4VSWxjGM0gt7Rnn7mxvFDlGUG9Vjfux/uR55j/BDqogQzf7KWKHUgkGkxQDFV7ii
	EDGnXWpSAsTTwy0gK7N/X39QdokV72HJAawjGkkt2eV9NmN8NbhltQEZQRFImDlJ
	KdI1CHq4SFfk+9wveFkZq79j5+DHMcPjouWifhq7uTXOu+CR+beoL6JXTuSJC0Mz
	16kzkMiBVK4GB6XgkCQqBc5vSixcfRPPe+CrXIBYpa3rmNjt8Nu8UDklfqF+wd5b
	1PB7Nedvp2Ca5bqpSlHTbW/EcdagcwxyZVGTBykfaGXCvT1uv2BOzjVRvhRsVesW
	EvgsEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1t0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:21:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so67936855ad.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448897; x=1789053697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=MtyFAJ3c5qoL3dhBc97U4WaJ4JzalsWo7/4yvsA2pYUw7/Q0uBF6M+KSk2J8NrLQWr
         9wEDprd74XIy3POE/oVbNAe+E3pDsdI7s1QuP0gpOKJwpplsGqLoU6h8eYmjDI+89yzI
         /6QnBLP5WPpl3zeK0KTi5gt20xxyVhhNdeIGu8DC5y1iBfeXbL2cU/ajkPf/MVB7GGuz
         LShyEuVyjCBV9xTuTxNia/pY+bIB1EkU4d5oALqxs6RfbSteCgKVGZvCAHfrL4lnR6zu
         ZTliT493+7glpbg/kjAuLjdwkdU2sUnxjV9/VLfK7dz439LJbvYPEaiqnC05YIp5Ia6V
         plZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448897; x=1789053697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=LhLl4L5uXv6HaRBH8dzehOxKaEsvNU6Qx3V3/MIzz4HdDLdi78XwQi0iHGtaWvEbuV
         iTBdBNwZM/KXG9UUb+vZ6Uz6xbhXYcseI/G/ww4fSlDpUmVMuuhXERiTOTV5eDXD6Jpl
         qb2U2E+2LYSow4Y2phhsjH6ROorgxoet4CGoFtqnlF8F7BkrHEmoq+mxLzvmvO5ZSfct
         WFnLp7mIIA81ECd93V5e8nJHS78RtENyvLZWWheD3YOQuYR3cJSRbU9+m9gsvNPBik0P
         h6FmtvlaCcgapBJC1oyOpV9lXqOFJWaOEKYMl/feDP6WIBvEW8MLdB+5Awa9U0HkW3vB
         PnMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYBlIpS270qqkFxVsXgGol7aiXCkkhtKSDTD6jmFQhI/TlVWUy7MT4yhiNj1aqlUhXfyKqRMG1OLQD@vger.kernel.org
X-Gm-Message-State: AFuF++kjdiy5tBC0NaeDMF2QmzHEG04VheoaFZydWgwrhOQ6jU38Oc+6
	70E5y39FHwTOyw5vFQJbprd/5q3s9pQWjfOr/chcg911DXyGG+/Lzj8ycGM/TZ3Dz29Hn8KrxuI
	ea0PIjsH2LTWzNR9V1JD8YbOAgEOAiE7BZFpc68lwwgWS6CLEAPEaDak81+zUdRNU
X-Gm-Gg: AYBFou0QtmZwndvdi5CpZL+2ZIJK6MUDpDjtQ9f1gR3jQb2Qm1BRxbTHaQ2uhtbzPFG
	5CfW77D5C5GCMP1kaGoMeXuQlicWLDt0fct+I5bIdwEAr3/NAeBGvf6alAyD6p6IMcODzteR2bB
	D5DNlP/+lE9EQg/epgELlpIwHtgpaZ6sJyTE6g+ZkyG32SXy2STSaO6nhfoatsqgHdHhhxv6kZN
	CWTINQHTqi74uzXB6znqZ3h8jevgEGWH7RICmfZOPnM8d76SMy2Jt5pXlOMvBLq7VQTeIj7yqUi
	+ESlgCZhid4pqUdcN0zoo7TnlnSyEVFkqfFFKKQW2Q0LiAFwYmywaVf27jxS0T/Igg4YIIef8Hs
	wVear0oMlFbC3uBVowe4IV4ngWM0yw73WErzW3Fj9P1IfRmXy/zgk/ULH78EwjCgJ
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5531105ad.6.1788448895656;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5530325ad.6.1788448895091;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d8dcsm11883625ad.26.2026.09.03.08.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:21:33 -0700 (PDT)
Message-ID: <75246b2d-4787-4748-831c-d66e3b42faa6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:21:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
 <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TB4K9kE0HFmeTrs9DoA9nmqyVqzSUBeS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX1JUaNLgeJ6Q4
 cVcVfu94A5i86VVqvVzZ2RnXfqg8l3VCfaJ8G+H2CojiGZcn6bOoRighWIr1zh2RpguFexRPL0J
 +nVt0s04U/HEVVAjolOTFYcpA4qYek8uC4fzR1Ehr+3QEZ8gf5CWWkOnwfvN4PgzWuDEmbMhENr
 wBbcEKHsfGkG+c8cjrtZhgV143XxYos4jMwHU1yuN+Iwk1LqCwNHaZZURWgmHEbyCqccxjXd1aD
 q7kNEnRVL8AQBAWh5BI+iAYwElB+t9Qa/uPuJRRA70jjkdSMAxtrSgh7LlmYPn8qnhbY3oizUZj
 ZZh1nD1oaXuQV2dHTKl0Cgqd2WYy5tuQHVk2XeSUbOBTEHbjb0vlM8bYulakohXF7xEvcHgMbZL
 +dI3ij8Q4giG39LAmXTz8GaEDJbd0Ia2vuEu4lq0P2DOv0aNwlJV0MePKjTVjo6+EpCJKPZQBM8
 5GfGA5xNGIS/Cf0Di9Q==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a999081 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=eyD6XQoqffRT7lHHdTUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX0l/DrBxfaw6u
 PPqRL3G7HQxV72C6TVQd1BZbmGcCwGR4+9mB8UVfBwwAxnwUK1WXe7h+ixtG6Aq9HtncvX9fIgq
 BAiHN80cfm/nivEXQwe8TR/fTqe1s9I=
X-Proofpoint-ORIG-GUID: TB4K9kE0HFmeTrs9DoA9nmqyVqzSUBeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030133



On 9/3/2026 7:57 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> The PON (Passive Optical Network) reference clock's parent is
>> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
>> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> [...]
> 
>> +static const struct clk_ops clk_pon_clk_ops = {
>> +	.enable = clk_pon_clk_enable,
> 
> clk_enable_regmap
>> +	.disable = clk_pon_clk_disable,
> 
> clk_disable_regmap
> 
>> +	.is_enabled = clk_pon_clk_is_enabled,
> 
> clk_is_enabled_regmap
> 
>> +	.recalc_rate = clk_pon_clk_recalc_rate,
>> +	.determine_rate = clk_pon_clk_determine_rate,
>> +	.set_rate = clk_pon_clk_set_rate,
> 
> These seem genuinely new
> 
> Konrad

Thanks. I’ll fix this by converting the PON clock to struct clk_regmap,
setting enable_reg and enable_mask, and using clk_enable_regmap,
clk_disable_regmap, and clk_is_enabled_regmap for the corresponding
operations. I’ll retain the custom recalc_rate, determine_rate, and
set_rate implementations as suggested.


