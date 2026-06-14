Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAB29A32D
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781471810; cv=none; b=SAvWpFpLAUeRMXDpvaAoa1UVsWXqt9JVUyzZdKUesDXFAX2Wr2aqm1MVcDHnpywVCKnBhn5EjkdI8z6kRwugMLLHCjNhTwUgDoCJlNwDGWjgI8M5l+0WegC9a9Ih8ll4ymwMotw1bchTDRz4qE8EyJXj+crF9Mzu/UobVO6Gr+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781471810; c=relaxed/simple;
	bh=OnQN8rk07OguiwIShipBYJB87jroy5ghHMUG8Q/P79w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWjMMl+0KNw1W3+hxVNAd+9KVnlXkw/qQiuMcL51syk0oUgFuolit6iaQ+56iNvNtfNHnzqIqFRbRvdcNkIFrRV1dtODwaRuKJsR9hk7edbWfcbTwoAHGOUqu6s38X+fMyW6eY9fL91t/cmwnRmRJhZpahw/dDK/RMCYSuS0fiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2Nd5EsN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACPIYfcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2Nd5EsN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACPIYfcX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFAho2753720
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2kynjv38blCZw5JxOBaBRl0
	OMUucc4OfZpGXP4Wdi8=; b=V2Nd5EsNyFNAA9E6e5XYoiRBaGQ23Hk+/aPbuSJ3
	y092w4rVrEeA+M7RhjmzFcECfD/xaoiie1JGf+kXzhLP7IRJumPkmDgvaj8Mn1kQ
	WLaMlMXJoFBRduLanrJDoql1k/Jvz5VrAojEPyQKvDwfYfUXKZyv+9y+HZTeHhAy
	CEJEK4thWwZm/V3UB6ZhXsfLxNTEiNIKHWWzhCx8pvAZfElwrQ10p18iizA/U9po
	eMGBAAAOQ+L0+j79w+MH6czDHE2wttfbPZiNtYuXjCSDpcyB2alatUNuqD7J37wJ
	pJJpIxb9pogM1yqzgZyt+4UjQTXtIz5lEc0/H8JVIZuSJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6vkd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:16:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159c4b210aso431444385a.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781471807; x=1782076607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2kynjv38blCZw5JxOBaBRl0OMUucc4OfZpGXP4Wdi8=;
        b=ACPIYfcX29iel9ORubVSgMwmNoJaGGlbpYuq1iX+NJVNh1pvX1sbCLwBvYpn7msLRP
         JUfvsh2eN1DkEJtNBlvM+d4czK+j3oT3/sqcPsEBX/x+dHNPDnTxu6C/PeC+51sEU4wd
         l8x9R2oYJxNANx5gYWkkr+5vKqhYg1pQ35q/vcrR1U3lzAMcQP0CcUL7q+O9+frYHfUs
         tZNwDOr+ownaotI0dA2W3AnU97Uyrg2iYdUDV0mFbv5BpxXpWUP6fm96BF+FOSsdqLvI
         bNxPm3O4PjDS2q8fHPiblM+fOCOvePOb35EwcQJ/ossDqSHwvbE36wrzyslFyXfK5Q+x
         SDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781471807; x=1782076607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2kynjv38blCZw5JxOBaBRl0OMUucc4OfZpGXP4Wdi8=;
        b=cyFVb8f1+0l7cbIFcSWmnVWlrViovQghqp22ffpLQ7WXeoidA3c5RO4eH4XcViaCqu
         PEZRXAYRAZmO/hYYsccw6hfb74BwZJ2b/Z/F3MA36m6F0sfT8B47fwfX/yulSTenFQcI
         lytMfN6Y8VklRdPvSi8ehiqMeHCnIVojXV9/nct64uaEN3yXDnm+0IOMR3x6HKvQyMsK
         mpCFVWj1MmE0bmxITRZwg2Gr2DEpozr6N1cyEIjjkIY4T+txVcIqrK8xzpfdvDfPjr8k
         gJrNk/ukHa5onk1SgCEVNhWYZsK3uKUA5816z+oLGPkE64kAUM631KQG/c1/ViTdvdAS
         t/uA==
X-Forwarded-Encrypted: i=1; AFNElJ+Sqlx1DAC3L7Mvjk8cr6KkbZlEgKPPV6eP+r+iDxnHuGrpx9wSAcqsCE7AXv+hr821SJymGmeQhN78@vger.kernel.org
X-Gm-Message-State: AOJu0Yylbp9TrZOZtBdI8TVsYIJAlycqZ8n6DChwwEertqUvxtcy/12g
	xCzFLD13acSP/fSlBBKjsRs48i4Zsk94BaZkueYGRY/2Eb4+k1aL5mtwbvIf+UYiM+vmOid2J3C
	DP0yyR+DGGQ6FR2GX4AtazR99BAdGJ3FKzBmGCrHQJkmDzlV554mZapojNVGHs09A
X-Gm-Gg: Acq92OEaqbW5DECtLLlkCTarqdx2aa6KFeTmDxRmkba1uVbiQx4bjfLtlDh5SJCvwiB
	rZ0jDBENeVoiZ6yP51Vvk+iaW53b9WE6qT7kUkn7EdMrfq4SfVKBZ5c5Q5znv5LFyagbixv7YFw
	MBrG8oBeo+9WlAGbCmhtYJ1OEGfhwR/YHZtgM5XtNVupSPwBacszsHeJgLJtO2s6V+p/GyzzFW6
	Dah079OZ2hzV0jtc9Gq8sVtq0/6d4Uyt+VtnRWmPwz63Wa7qC7492GTZlZjuHhjis+itMqwwXqY
	wzgSaHmQJOI63uIHG7m3vSLTUxruUaO2Wp5dVAoQH80/WJN+f9XfatPRRbiH9Thf+YbYr+vQiEO
	f+W76PIb3GT4V7fg4P7MK68D1mIdGW1YUu7ln8cya0sG2UobZCrrftHNxtNjUq4qO7kCQWscb1Z
	5xL84YI3E3S2bnjNuze1l1JOceErAFh9DdV8c=
X-Received: by 2002:a05:620a:4804:b0:918:4374:bbb with SMTP id af79cd13be357-91843740d1dmr917579285a.23.1781471806678;
        Sun, 14 Jun 2026 14:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:918:4374:bbb with SMTP id af79cd13be357-91843740d1dmr917577185a.23.1781471806269;
        Sun, 14 Jun 2026 14:16:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a734csm2217235e87.40.2026.06.14.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:16:45 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:16:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add Embedded Controller node
Message-ID: <otnrim6weraf47ncpo6ngb467wvvytx43o3q7jntdaslsl2rck@fbhbskgyxasx>
References: <20260614130621.68811-1-daniel@quora.org>
 <20260614130621.68811-2-daniel@quora.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614130621.68811-2-daniel@quora.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyNSBTYWx0ZWRfX2ntfpULn28sn
 GVnkq2Mp/YG7LyfWnMymjDXUxmSuF9ijA6tRFfa7WtKdRl2fD2tLck6acUjkBLk8g2eInmYn17N
 fJpY07i5D4WfTIcK3qjwiHtyZ7IhlIU=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f1a3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=QbvKFJkngEId-OerJWAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: a4WflhPe0JKcgFPjo-7z-6bK2kaZiHLq
X-Proofpoint-ORIG-GUID: a4WflhPe0JKcgFPjo-7z-6bK2kaZiHLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyNSBTYWx0ZWRfXzUr0GpYwUQvz
 tXAmjHPGqU5iyJWAG0FgI37z1aV4rwSw/VhIFp2tpO0dqbRG13vZtGggd0nsGFgkz1J9uLvcbcB
 7F52Ui+lxLe239FildK9DLqGm0QEcK+IzaqZG/li9kRFM968vUWnsSb7rZRhSHK4D/lpKkJLxAM
 IzRuJoKxfMtxGqblvwRbnrxm3g845xIdVgtzS1tq/m+yHFq03WsWUywAIojT7Vn8dMooLpMSu7s
 14S4hZ9Vl7N282yQThosvecF2o1rlMLLTPsOoSEusaEQuaMRL4GxrUwtYcId/+r05dtIAD0tbCM
 PkS0ioCnqL6fSJZrpZaYGeOPvij3euFfVd+jIf5ug242+OldMCCtWktKJdw1Je5JU86STEWlaXH
 ANaDeOjJCW8njpmfNctg2OV9LoEHQBKqlmu/Jj1bQFCcQBMvMRgueXgT/KnAH42WqSEczwzZtdg
 Uw3jriUM6XOJVxoBvYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140225

On Sun, Jun 14, 2026 at 09:06:18PM +0800, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend

This is going to become commit message in the Git history of the Linux
kernel. There is no 'patch 1'. Moreover, the patches will go through
different trees.
Please rewrite the commit message accordingly (just drop the 'introduced
by' reference).

> behaviour.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v4:
> - add reviews
> v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> v2:
> - corrected DT compatible node
> 
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
-- 
With best wishes
Dmitry
