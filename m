Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626F28D8D1
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606029; cv=none; b=OnXwBNPziwubPriTmsGeTqI859o6SylTXBqOEYe7vp1LgW6fyif2U0tXFUuvZN6wpD7Di8e2xWNX926CPdV3C0DP9D9IXoUOhbqzjx1Ym0UeKtGD7PCdjAejNFlDHbQzN1ltkudZtYfIDJot6R0iaoJJUFdd4c0lLVHNp5wxy74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606029; c=relaxed/simple;
	bh=EHduvhWTuKBhol6WDPp3oQwkuOYIEkKQ4fotbabd/Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCLKYkCXPVc0CUgKm30onOOgaK7UCoqFt36keV7spb5Bpp+FzkhpvkTq3RYtGNqU0AtXFsXQRzHOJR0PVDbE3LOELdp8LtuVUH3oxfYY8joXz22U52Jo1tR3r5yNvE2g5Er/CTJ9sVqJvrqlVexpw0GxNx116sa608iPe98NWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVEWCBrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9rcMW+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVEWCBrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9rcMW+u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wvAi2846339
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=; b=HVEWCBrA9neD1kAo
	pmsX4g0W0tPjBp74Z1oMN/b9owhufzKvFw15dgkNNXQ6GDo4NeKoO+Nk4ZhbqiR1
	Lq2R4SyX5BV+Q2SRWCouUQj3zFy8L8qjQ2bOjVavL9F3wTDh0kTGck7rsfy2Mj8p
	BMtbeIT+awTBxjqAv3YArkrVq5Nu9uBlzoBw0Q15nTGZ20nWYEF8YcSg4Kbtn5+s
	yH/I47362A+pedSZux2OEsDz5jrWzgffyalQgF2bJY8O47W0Ramsjd8SfMvWh6Uh
	oczZBCP7R0YGu1cEdTO0Kp3HKKA8DdGd/Q6dYqVkAtb3PQmo58Mg6iCawThLfQgv
	lxSqnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmj1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:07:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd541c0edso7918426d6.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606027; x=1775210827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=;
        b=N9rcMW+uQwG7+ks0XuV5Fe6yXgXv19+vuCYc699PAmYCLC5N7v7F8w1vNw0eFgpNdX
         b6RunbfLN4PIa2Y/B03N3h/Ixd/oT9leNVhxvaiPTEcXmPI0/8qivGnk+uyHtVqWr58z
         4ageqxCFcogWICq9NOiH14JEten1fFQhScoZJ/+A96LRgGffLlXXJFi9AkG9pXKiOtET
         YqROAvlmBfkLEGh/ZPrj5U225e/ZhDE19KXbZ+Yoms2CmxnRxyi+Ej3LZ82hIyb1ouRg
         Ite4uJot2tApoMw7eVqAIbkkv/bk+A0Gj35OSqY3Tu5CLeO5AN5Ybe5We4Ke2ovsxrcs
         ssag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606027; x=1775210827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=;
        b=pHnNThc/snpne2cH6dPFh34MEQ3Rh9kZXteDicWeoWnRLpsXsFEq9+X8EGz5aJJ82Z
         XWmSWsmRcBixzzm/FC1z+EmSiz8kQS81IjNoTsxUplIXkk24wI5bMbxOfO38QHkfN++C
         hxjvaWh8r0swkKWkg8pIf+Qc2WZ0Szagxwt39J9XwTfMy3NnjsmYlamWKnvvehglBzy8
         e5PiwVcBWyOhZAO/hbj2GXxMjfEXOEFumeU8T3NX3hcSFYZmauo/kn7STapJFJax6fh+
         +QjoHBVTcI72ReLvir8x9AlwsShxWhiAM7OcD0nx4QNskkbMqmzcCpv+HkU8OtxX2ye/
         DAHw==
X-Forwarded-Encrypted: i=1; AJvYcCV6uMpboS4LiwGTqN4FtjADSvvcNOANaTBM6lFQ44gJq+zYCEhL7ByocYQtNPsiCELh0y/sHw/Qa0VX@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2zcQtC/QZhS72+qdmCCy3Q5jjVuJP/2S0Rk/37ldTvb9b8zC
	7aQ+ca+uMNzCc6uqUXvHSPycY17+GEQL68E/az0UQf9a/q/EQ1HM0wABYZoUAjObTRwSYZr48GH
	1mhdzFGKQXtO98iWj0wrSd/X4Z2CbxPyCuQa/A7K74R0NA/PWKF0KZTymyJMOT+hf
X-Gm-Gg: ATEYQzybibWkwQaV+Q9A3+UjKSquIJm2yrlEgnxPQ9sDVfEOWbkJ+S0VGbpS761tcGC
	CYwEt/G23cXno5wWO0SBJnjgl6uTglwIfLAANj73T8rvX/SF7pBxx7xOJxe6s7xgDVQDcINwW1u
	YCvmWnJXDFYG8jph9ay1Ig+mWwj3XVbNHdi0zOm2WCOxPLn0qFCXaLd7LbBUpPI3gm2KzBVoIRl
	Sg4hmbDhXccZJXYXr++tFgfKZtloEijaVMOqbPk0TFtrYP4xtfPdLIQipr/Y4dqfxsTYvBfMEDN
	+n2rKhMJFQNYderWBKkzGFYCs9cHapW9RZdPhkcbDKgva2IdrWTjMR3cFedvSGv6lo2SBWJQGtz
	o8SdZ97vQXv1VCnQIxsTRXxQzYoH5JoytSO5xY7sTXAr5dMucbzUIM2iyTChJpH4kWjHlUum0ON
	QUC08=
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr17277856d6.4.1774606026690;
        Fri, 27 Mar 2026 03:07:06 -0700 (PDT)
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr17277516d6.4.1774606026260;
        Fri, 27 Mar 2026 03:07:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2288sm225074866b.40.2026.03.27.03.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:07:05 -0700 (PDT)
Message-ID: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:07:02 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX2TA7MPUqA+4g
 k3c4HmARVFwSgLLbCrOhHpCx9ILbFyk+mmsptVp57i/qj7n+CoSqJxk6FzxqadHtvuKEEALr8/F
 FuRuMRztHViYHjKu3ms1vL77txxrgVe4O0qbvwd2QFFKkVZqDEySwZuVUEeWDT+7MTYSuJkd7cU
 WCf1ZbdGig/+6TnXXvY8d+LqCyOfIod9pJpSzczky1+kGDG72qLZx/+l5CeYN6XTjWh/soteK3V
 n7s/B7nNJfCoB0FB1Rq4m314xkM9CnFTcnN/zFgtRm5fHFQASM/DDU5iKRFhutDfT9j01ypuFTu
 kRB39tTE1OEVFme7sQEHvgmxvqnTrx1vRoS7d6gSe+2uLgAKBJY7X6NTmpUayN/9fK/AnO2Hkq9
 rVVweIYLC7s4zwz7Ioo3oBvq1rUqOLo8g7ftKyEpnFN6N1ycbgRuUPA9K98CX4qAfmdnNk1U0eh
 Votk78lfRbZ+oYxPvBw==
X-Proofpoint-GUID: RVUUPtscEbv-WE2oFl3y3qoryxNnqUqq
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c656cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=0SmWYRu_8F9rFwqJbSoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: RVUUPtscEbv-WE2oFl3y3qoryxNnqUqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
> capture those modes as:
> 
> - PHY_QCOM_CSI2_MODE_DPHY
> - PHY_QCOM_CSI2_MODE_CPHY
> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY

Does the _PHY_ DT node need to be aware about this upfront?

If we have some sideband signal (e.g. the sensor driver specifically
requesting C-PHY mode), we can simply throw all this complexity into
phy_mode + phy_configure_opts, all at runtime

Further, the combo/split mode may possibly be selected through
aggregation of requests.

The question remains whether the sensor should have a direct connection to
the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
or whether it's going to be translated by the camss node (which would be
the one holding a PHY reference) - there's probably surface for adding such
negotiation logic in both places


Note this is a question and I'm not aware of all the possible combinations

Konrad
