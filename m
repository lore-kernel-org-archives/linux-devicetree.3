Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0D2371045
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112326; cv=none; b=o3dAaKYDzy6eB+zLM1Z/4PgKvI/rT/Alsf0oZ+qwF22plsLA3ndyxTJP0caGjKDNyAdN8k9hQQXJkSqZ9QAYdYhW9skATKU9fiM3r8L42d31PtZ7bbZPbgZ31YCmE5UtVTyGxSAiXK40llMnxrZOaDcpJsF1CtETolPlM8+6JY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112326; c=relaxed/simple;
	bh=FXhGhOfVmiifdinaXiHti/cDAtje9UjLdnb0z0rownw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K15H/mnQp41S5aoUKJK9vRFnYuUjkdJw9DjfkD49D30oX2XbnUsuVG2EFcGeb9b/Belo+hs5/sLUQSUJ31FPLCs1ZYDQU343rC/bkbmJctIdR4JfNc2FkcpXoDWhLF6jqBcxsltRkyhr8MaUsHqshe1n5UReZPo8U1OfjbCfkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcos2jyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g10XehZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcos2jyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g10XehZf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICUSXu421525
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=; b=Zcos2jyuQgUkjOle
	EY3dTgsDMJNrQrNrgTvJ3MlLq5lTRgvxO5QZbxZHmXtH0srRs6cSAEjvE5sGEYnR
	+cepdzwWfybZI3ffxBoXqly/IZA6SEkM81HqIwKYuQDAlwCsrDclVrsv/qdyy24p
	pbbg9W5ZUIMH9mITfuSJovmP4pJc82cFoxXIUGSaxPHYHcFyOSqmBy78SKInICrH
	4SjsTFn0d2ECxvCMMnO5g2L5/o+5fs3K0WJM4ifxV6Gc2Rre1YhAPS2PEn5cmIlp
	uvpcs50hYs4uNSabCNCLB/JT62Q9xT7TXu4BfI1n4SkIUO9rsoQVKPM98IhuyVoZ
	jyTA7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcnkgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:52:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5d7f4b63so6248261cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112324; x=1779717124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=g10XehZfCNW2jypL1KNwtjEzQv/CVXpusEYGFrtS2Le5iMIfgWGt9qp1j4j06BJDe0
         W/pzixhJ/G6emM2zVjJit6W0EsaZzPChMenCeRLPpFxks0RJayC/8r+IrYIDoPUpYaE3
         yA2l4cesYYxRW6zZdiJmFRIY+HFtHHSJDttTwGs1/mgGO15w1qO0QQ/qDhJnh+8WK9tH
         zz6acmboj8kgyfdjB0wXtkkloDyTJSlnUF6nZ1UVwloYvxLBh0cJ6SLsr0INRO6EsteO
         /6MJQAn9jccj5y82UzX7btQpeDTdgeRW3ZjhyPt58qWEfcG9TiYQDALuKp4M4a2rkdqp
         ofDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112324; x=1779717124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=QXHtokfHr4lTrcLcLHThqinna2Uwctdt5r0mOhL9ts/gHICOrMECL1kOIXWbv6kDrV
         EgD1pOLd8a19Z9IEMooJbhtumx4q96pf6rXqx6nu6jvYzsAEuHMLRDBUE3NKhd4ow/DE
         ecUojBc+dFLmrRsWsxq3lts2/hcwbIHIndFmQOPdYVvlqp/D9s9u1I0DRs0RoyYHwsrO
         AZOTeCh6/yyqNGBzNoq8h9ZQuGkqKJQ7eQUgBPBNU+5bqG3L0xgFSvlFYEPBMJJzTvJI
         muDAtIQ1DP4+l5ITSgPKkDWMvEWxEfZDDyIN4O3+uVqrPwlF7GWthLAvVcqQ7GOnalj4
         wf+A==
X-Forwarded-Encrypted: i=1; AFNElJ8rke2kJLbmn7Le+m6H6trE37RnLfrkvzLccHajOTnmHUWNvbH441Bq5Q6f9fl0O8TI8bKa4sZ/WbkD@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvEesQy3Ynicvx9T+SFuaX2VDeqUrUMWDPHWhnelt82EIRUKU
	5HC9AkAQHMK962m1japm41n3qogq1vFxW2IoEjVCG106B+xz2jqXrH+ubyXzVubP9jpPUnc7iKj
	FbqUZZAJJAhdMdp/KZLc7AGXP8fMiipiqw/dtLRROwPGH0ZH1/327iPD9E57kLNvB
X-Gm-Gg: Acq92OGROwa67oLGMJ2Eej09nnXkQsNpE3chHT4ClZbyrAAcA9KAfhszS/zTaVfJj13
	gvFUOKiBbNPvlhZcG0R4Q4Soh5YLpqDrhkMLRAFHg9xaZJ5mgDCE//Lm0X3gWWHJ3BwMgVb46lW
	LVavUOHvIVE0oBJZuUF8l+jqTLVIugG63jT8RYXJ6by9ZN06bVwIQL6wYfPOIHRvFQ15+m9IrCt
	P+5nimw46wxjbbtLGIo8Tkz4rtewUHD2VuEqgJ5tL6DUAfoei0hShHQ4D7tALi8Q+0cIupkAobk
	N+PTbEgjKJnmDHFnEmZP3I9VF5UCvgWVxojTG4g69IfiDg3gg08HryhROyhEmVxTjCHSAqlQD9w
	ycW2kh51AgJShh0zbzMSP61MYTlLf/tPEA/ZvdKndh/Q9tQpsW2tkIH8uOWtoNfvt9FafyjzpW8
	DB+68=
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167894131cf.5.1779112324225;
        Mon, 18 May 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167893831cf.5.1779112323677;
        Mon, 18 May 2026 06:52:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec7c4sm584341966b.40.2026.05.18.06.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:52:02 -0700 (PDT)
Message-ID: <72203cb2-b010-4468-be71-8be4af570acb@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:51:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: nord: negcc: add support for the USB2
 PHY reset
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
 <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zyOwGJlgNrnSsdfqeGPw8M5UOKx9_UFX
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0b1985 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YZby4nD4H5Fmm8mScNEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zyOwGJlgNrnSsdfqeGPw8M5UOKx9_UFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfX0fd6w9yBULIC
 FL+1DjOHOmotcgJiJ+TBtOhv1zCyqC7cU27z0N8h3u7d0WSKYv1yGXWDpzgauIdHl21fffgtB/d
 JvaNsq7XDucUqhOP9OXkW/LRAbfSXHN/lk+lH40gPUm8roH/KHjFYGmflk0oFXnduSE7JNrUpl1
 Ijn91G6gikkonrGwfahOq0WyWLdg90ju8V1CyUmJjxO0lLlNpKepc+mgNXbMtntHGl2vwTb5D7g
 EWFGcH2OdcWWSI1nFo8NzHgH1ZC5FUlt6ZteZzNXCAkvtwHatG333O2YIw9AAhQ6849IKaLupL1
 Zdbp9YtVlCB8FxMlqM+1FNrO4KGhc9VNwRpnF49dtTummmQz3ccd8DnsYDf9/q0MeikoRcROdAD
 TevtMiGZL1azIgSpH5gilOu0SjIC1v39lac8Xt1t/zXDcWLLN2hICLBWw0nV/oHr9FyxKerijy+
 AqtqwSlOlTagF70kaHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180136

On 5/18/26 12:34 PM, Bartosz Golaszewski wrote:
> Expose the USB2 PHY reset in order to enable adding the USB nodes in DTS
> for Nord.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
