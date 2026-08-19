Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C71848CD47
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158118; cv=none; b=taKUPh34+2WTQETKecNUbPKYKPrVZ4mcWhfkokp9S222uBs+3gShaOvjiNz0z4GLFWGQt1Yw0BG5S3FgYqakfj+iRXllgN31Lbik2bSs9ZbLtcN8LrgahYmFz2gfnYdxob0Xldr/lpYU0RmW0AbOF+sluTnI7KedTT7Oe7t9Bmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158118; c=relaxed/simple;
	bh=K75iUPw1fuEkFxQ39hGr1Au+Fh5fQCRjYMdXKscWq7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHh5E+ahtnnDolQWWO7mWU8HCziJ9sycTPDOuxhmBkcaFTThKnB0+2dWv+JwrY+D1fVe+TQVTvuMMwwiZH1BrsSrB9CmW519BlJVPBvZ0CWesPbE4683Vov8OVMyEufbK0raIAHOP8Xer+SRY9c0zqWPuzFGBDyvR3oIur3wyRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNaO6Vdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWhtr34c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNaO6Vdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWhtr34c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbSi3566918
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=; b=FNaO6VdxXOO2aEJJ
	/NP805PMBlB3e9ETJcQP4u5suwVt75jsd1eOE3IQAfy0AW5uBCKJnY8J78JpznHx
	tQCXhjCCfXnXBzPrru6bpbhCbLpLVU5VNKsXsPjqaJ5Q5sjd++IOlDasxifxXUyB
	N86G8/CYOwsWjO29CFjuonW9SAKvKRaDiMr4w0Gy2t8t3AVx5tq5CCQEhs7oDj4P
	+xu7eE5fEpvHhlJ4pppg+4Oe0byiZ3MDq+x3b7PHQOPxneDxWh3W2ihQg0F3Peff
	CZRg2Y0l1qS6Q1WlhUxlKcVGRXD51W5Z25hB0X9yJ2r0F1fN6i3JxBKcxSg41oq2
	87YJuA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa12nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso42986137.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158115; x=1787762915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=iWhtr34cTUPmNOqsHbGaYviYTX/K8RcXGSdhx+aqZdWPUXSFDcpGDuHlipK2GcoPvK
         Yz5mCdYkGYvej0+Zddpc4UrpjY0y3Ihb6XuIsz31eE896J4RZHGv3np4ifE+noMqUb5K
         k0v7QYRHblcGksUhuxm3klN8C7L7BTmtMO/AFp09xcaMLoD2+JRThSq0kDkJliQWGGJk
         CSENLvc2gdF6qKtXUubJgK/PiBlLDIkRuYf5ODsitZQJTGXUwqbMyqMrCkbuVtHuwQhc
         oRmE7HUl69xJpNwTIu1pTlyC3rEpz2guUGIdqMkbvgKsKq9LfnaxS7OYYnGrcXL3A8K+
         O5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158115; x=1787762915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=g5NK3iup/gcxhMljP3tFmLtTBfMm8LXQVwf2tZH4LMTGqBy/sImO8hhtvf+c8LXDA9
         0Yjkztpo7TMtsTPc8ull17e5t3Oa+KaFLMFfcNYnznAJQG+k9XT62j0pBraLmD//nkV/
         yyXEotOnCAA8SB+furrvFdp4E4X7qRTF+OJs0ktURQVQo42Mt1L0145X3j3HGrXPMkpT
         CJHfxP0W73iA5s58IBS9pBmxyXk9A2ql6XiQZl1Y3/RmMxQ3vEnPzE6l5kSfrjYxqi9v
         0dRpV06kY5W2YetH8+oE5bqeBlfweltU/i8kTaPZaOsOxRlvYsWSIUJU8Z0bksB3yhLa
         YaaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoookDioO80eaNSYYtGX6wXr7B5IX2XbSa7EujG+HWNeNSJaNkkN1mUwHihltkE7XSC6gQpUA0GKf0j@vger.kernel.org
X-Gm-Message-State: AOJu0YwTChVMi96LOLQ2rgJL0Gq/FSpiPWbFX5A53bJQEgbTSrBAidwl
	BzZPDMn6cVjTO3hcVZUhWvWk54F7vTVu3BKf5fVxkUr1M7FspFpYB9JSJtMDrwuiVX2jkB8c9k/
	LccjUQWqXVv0qDOSMC5UXzKVckDfSYS2XnMyTiE2b24nOVQlh+egQCyQekvzix5xF
X-Gm-Gg: AR+sD124rTBQnXmM2DV/nOnprfNQozUgRm0j7x7dXplB2U5faHSrKdDfhaQO+2DepPE
	3rXQwDc0t0vINMtJ59dJfKsVYo16lbS/g4s5GNJQTJUepvCaM5a1UMU6J9hq9Zvvajmm2CWrKJA
	2yRw+iGC2s+GPGiuQzn6K7p7M73j2m48AqwYCR1bMaMJphmGOCt/YndjUrdRccGgsfTE5kLY8Wm
	hrp4D2oqCJYO6vPenmnLu4kThXzteYnhHaD4xiyQ/xp2KfhJD1xSq4qAW9SLlZALmVLjJrjYvrv
	JdV0WFR5kwcT2Q1GCIO/6icUTgiaMdwRgCTEchs2PQ9Ucu4DK4SDHS0eNf6ObVQyLIBFB/bvni0
	BLr4pLL3Px/FSMZ1bLjgTXmNW
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591251137.0.1787158115594;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591229137.0.1787158115180;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:33 -0700 (PDT)
Message-ID: <66b60bc1-6fe1-45fc-a659-8bb68d70fc46@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85de64 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 6TblhoysGIBJvJ0mJp3qOVhj8_HU4vES
X-Proofpoint-ORIG-GUID: 6TblhoysGIBJvJ0mJp3qOVhj8_HU4vES
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX/b12pF0YUUPO
 sQJ1xPscMg2Kbq+NYUmiUvOd9bbtsbMtvA4thXiQBrCcA5RnQrrRbNyqnEr8qD00LVENu4mAjnh
 WeTl7JJYjZ2qh+PloID+zLCjqmFSRvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXwnlWWrJwZnyg
 3Iz12OaD8bL1vLsWt2UUnvWQp+A9bE+qVJhmIOtxrY69eF9BEyl1mydhCID30qRX/rtMt4BtKf3
 aIYnVIp62uZ9iW+yp0NDV27pOWS3w6yPexKx9aDCQ4QGawhSmUlPbd26BDA90yqpbJk6g3Rmb/R
 lNvTS1MDoAICMdvmi6951x6ws9FVShTeFDXcK1O6CbZHs+iKr9FtD1wMFx7YqWcKH4jiW8UdTke
 pkttFmPlhsHQ3Vn/b5ZFW53M76PzCRg+EU/y7UXjzOAZbpJbXeaI/3UrANDvdq3m82re4K7Syl9
 6UHXlLai6SX7Pk/cWyPb8KefRzjRIjgb3FbcM7qKfHktdI5o1I8LnatAm0dP77Y5y1vaEyqJLbG
 16c1NLgba3Us/3EQSWCSajqoRidKJ6kslZYByJCvlAAhCd+0j5pTClXminXsIHKJD1IcDN/LUew
 626A05wVz7oPFqMprkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
