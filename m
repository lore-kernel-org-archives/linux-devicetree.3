Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AA3D9035
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718795; cv=none; b=kYAldbUGfRpNUwWzShBfYVtszxd6f4xJoiEubkWOp6oT3hS0JJhZgxgF7Ww3HBvVNKkx3s9AjBKfZd+O0/+Aokf9PCFuYB0SDYLluzNKfxiu7LcG0cd196SWAIv+nxALM/9TB39HiWxrwjlLPEaHJXe78p6/egdbigGCvNDYNWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718795; c=relaxed/simple;
	bh=MkM9uVwsLGoyllB7BgF2sIXL2LM3Mcmuh38APOIYjp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzyEjADtQTj3Q7/0w8jWwR1vMoAd1Xu/qqekDZCKmHgR+ww6ZG660IT52abYRaVoutclocrlqrZLLPKbH65bVl1+rbS/V6XHKVmeWass8QTxV5vCW7D+7vrhC8sfAnmQyiMoCdvz73I57mmv4wnIhR2Jd2VMBUq+Ede8U3WrQXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7X307JV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KG6dzPEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7X307JV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KG6dzPEq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rMCr2151694
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yEe/FsX9bdBWzSFLe6+4+hwpucE4LB5KH6eBAurizg=; b=P7X307JV7EABQrTU
	A2rG3K+Gm2wUXh2wtRuDejiCPQlAIhopSsTZ1NzONuIxcfwONFADx35RpYRijGQ2
	VOnnzwjPsGw/KyUPCC7iWPUs8U+R5wuWbfTC1v7iCgFx/pwIU+IUFAr6EZqeY1OS
	zs0Mbi7Mrgv43jSc07zGt5iRFbE0zzzzBv2xSyyXjbgr9w0A8wc1E/Dt/+gqgHdw
	sTiZnINIpMY8xo+ti1WBWW1YwQqsmCSB3E9t3Th+iXjtUoDO3ZJf6XE55bs+T9bC
	d5eGZ+a4+7R6lL933eyklJQbMN5eXiC66+KQ36MPB7cKANYoYiKyvupwrtTFpYR8
	MTrZsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuwbp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:39:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9b71388fbso23908335ad.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718790; x=1783323590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yEe/FsX9bdBWzSFLe6+4+hwpucE4LB5KH6eBAurizg=;
        b=KG6dzPEq09CvjfpoZuVxQ6Ybj7Q2pyQKoqfrHtMToowuDCJR7Pt7lfL6sUBQIwuUnf
         jHOY1yavq57JadJM9P6thTSbU7VP7+PZF/EhVyV5UoWGHHOMEiwh85DcNosV7HdhVUyO
         hO66ceAYDiVNovXfcxUWq2LRIhK+axBDAdwyYzPNltCZTOLVSeRVeEK9qxcw1FEE8B4d
         +mgqQzgA3SJE0u6uUqquFox0AOGD9EJwQzNUfTo62fbMqlddbHKhGFu1hv/H7xhfZ3Ue
         czHmijMDyFJQcU4nTC2DhIyeMziVvGccWir6SWz3kle0AwWf02X81D4qYI7dZ4nl0nY6
         Ugow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718790; x=1783323590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yEe/FsX9bdBWzSFLe6+4+hwpucE4LB5KH6eBAurizg=;
        b=JJA4ghuBlpaoAJMwuHz9mnnM4YEKrg1jr54fbeKL6X9JHcmUYW7pOIVZaWS7KRm4cb
         XB9J0iOT6XiD4e4Mk2YswaFzitlgphLLL6Lfk7y8e+F29lNON2KLRGvcONCqK+2lkFLB
         mvDxB/9ov06MA7eXc1rVP1D4QSX7Bl16skd1qpCC3buPc7OhF7pT93Tks0T91WOV5Nhl
         9S5Q0sN1kWUlUJCrcN10FZA4wnZyHgB43AiehIch8SZD1qXhsht8nx6hsM5ojkvTSxzC
         CVhSvsYex+K5KtMxeSXF6YH4QYo/0C9fMhPOpTDqzHohxg+Smxl3D08EmJ3c5ZCRj3Nc
         M7tA==
X-Forwarded-Encrypted: i=1; AHgh+RodBS0ZNSgJ4JyRpYU5phVek7hYnGz2RjnFbVy7Xm39ouRLvupY1XAsD8jGwzbOPJPQ4YBg7YrRpxl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxPm+sPcUA98+smBIsoiD/rANKK2DfDQVkoMtX+5g6q5RkPGV+P
	qPugLL1MrRRV395i8jhnz7VWLYlC99FBMD+LPc/g1w/g1KxQsT74F3EwqCNuiZ+fsaZREgqFjS3
	9h/tICZ3jW+SoMUh/opudJOBgUSYuy3k2c5/nCUS+kb1IhFqGBsquq1sJ+8GZhLhU
X-Gm-Gg: AfdE7cnyZ86zjlHwIPt/NrzGnMGB2o7Fe1tSc3iSqOrYyohuHeIPNX+tw3M3eZgFBZ3
	ZZWqxMsTh48GAENxIBJ86Y1mZEgLEzfB25sw8e2JMQEFeOhs2zTCtNGJ10DuXxvrLWKsCzyeBE4
	9cWNI5DrgqrbBgb1kyhWKWFXoMzAxJOn0upFTwUEdZFdNxVy2xdb0c9MRsHYjs5KRILy3vDltxU
	tJkFRQnHvkAbJvLt2qBLHPM2BdIvX4MAtDGU6r5sEAbGajmua3VX69aQSLPTK78RjvtfrmKTegd
	1NGKWwlQT70PICKji38uQvFrFeNoXUo18SDxXjcSjhK9wDewogtdzbXRXHn/Tq/SzG0Pojll8i3
	1D9QvxC4z7rGWYTVwAM1SJJmuBHLJBcaG3PGSAhp4kPs=
X-Received: by 2002:a17:903:384f:b0:2c1:e426:70f4 with SMTP id d9443c01a7336-2c7fc76f62emr152444825ad.23.1782718790055;
        Mon, 29 Jun 2026 00:39:50 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2c1:e426:70f4 with SMTP id d9443c01a7336-2c7fc76f62emr152444555ad.23.1782718789582;
        Mon, 29 Jun 2026 00:39:49 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9ea00b342sm21726305ad.3.2026.06.29.00.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:39:48 -0700 (PDT)
Message-ID: <617408ee-baa5-45c7-88a3-9be78cc557e6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:09:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXzdLYXlKmPorW
 nb0FWVd8bkvAwuqDfke8MnCEx9yoPJsjpo56fYp2pKDf2PtmY7vA6ggMz4JAEe0BOCJB7Eowf+x
 K83JmAmxDaPIdZwdWaiBDyajSet8aqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX7JnAYRDpD5cc
 Za0PSKTkHScxYaYg2WfMdtaaymHxV2AjPJw4aKi4hmsBREJWD1gbAW+GwgQpCO3HJZd3bAf2z2g
 Rhv+88zJqM6s4KQfUHjNV+CCRf583pvZFLcldB9xZOoFNM5NTl00//DD7xocrwFQQYZcoKWZ2Vo
 u37sejQZiYdxfuxTlCC8kIbZzOLqPyFh7bU4PRZe1ic6BbqaJnkHaf/imiCLdM3B4eYtUP7l70j
 NE3TfZzMdDdQJnkEQ4CD995VH3ENk5595EB+CHdHA8I5DlsDJw3lgIt4LH7ajDDoeVu5up7HVhb
 PgG+z0OXFuvO8Tk8y1clH9fKev8x3z7nKo0BlA8e2pztAjW6lNPxUtitP48crr29LbCbS2iRgyJ
 28nvlGWnIGS0gMWCsUe4nhgYvVcDZWmK9g22XTksAdZuV+597krgGHsJCTr9BuT9iTjDF0lCkBX
 PCT9737tiXykRkIy04Q==
X-Proofpoint-GUID: DNleH4-ZzcCCvfCwvRAinmXp56xqPGk4
X-Proofpoint-ORIG-GUID: DNleH4-ZzcCCvfCwvRAinmXp56xqPGk4
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a422147 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Z0ZxW08zNbm2n-bVQSUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061

On 08-06-2026 09:46, Neeraj Soni wrote:
> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
> So add the qcom,ice property to reference it.
> 
> To avoid double-modeling, when qcom,ice is present, disallow an embedded
> ICE register region in the SDHCI node. Older SoCs without ICE remain
> valid as no additional requirement is imposed.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Below 2 series are clubbed and sent together as new series.
-
https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
-
https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Kindly refer below series now,
https://lore.kernel.org/linux-arm-msm/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/

-- 
Regards
Kuldeep

