Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2659366047
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427323; cv=none; b=gSFT8fLv95yC73Yz6DJ5Q1fHpZfgGys7ngHVnBfAz3FzeMxSF/5oUFWh314U0gbpGbu44WMqwO+9nXiIaQsJ6UuR+vMENDcijI4//XbD54w+ktcO77p86+DsgXFDKLQhyWfj92ymJDMSo7LT8WbudkGeK5YzOIbU6wen586my98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427323; c=relaxed/simple;
	bh=LfZQUD/ALt1nH7+l/FbqkpmRqCmCdM1M2MXCBEQ3m9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idWRTDKyoSXsqtKhqtbEK7fuFu4DZA4GAfNGExW4pIkfYpXACYPjVliOcGaazB8k2WWpJj+Z87qr0OYCioFxhaxxRWRZq8bwgpKXXQC+5nFd/dYOOC58ZEiVAZLR/9thfOGTDCz97XkI0leCtvSdxu7lM1V0Jy9cVZfFENjWAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRUv942K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDWonWwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRUv942K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDWonWwO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P7NFjP3420387
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=; b=dRUv942KRH+OMTZc
	X4s2pNsswgPEP4+NkHk8s5kW7ZFCxmVOyJm8EJMpkAI5jMtB3kckr6/453/mYRq8
	M/08iqi787QcUtxrL6dqiktft4nQGha15LDL4AkYgwEJCjlm0JQpkMQqvCSehjXV
	rTNBnCqCO6kzByyTTQX60+VuK1oFy/xp+w/5gFu1ODeR9iSwFVDaV7Iths2dKxHD
	xceKmI6YN/Yyv+wEcG4EukP5U7h44HdtDjKRmtFRrm/meZp9YL1zEpDNV67y0sjX
	drm6ECao1DS+4rfNr5W2dlOkp6s1r3juPqUkfSqtQBGE7yLjfgOyuV7EMHwgUzrO
	aK4BEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4j92w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:28:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b079b4a8c3so87297805ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774427321; x=1775032121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=;
        b=WDWonWwOp+kld1drWcqmROS+gVJ0fcs2bTSt8oZdMNUE2C/PUwVPWfMpKfExD63drt
         TY91NdGztV5cAGeRRZn57ZXi+GoWKajb0dhiWx+Tnv4+7PM5KHhqT7EbsdnRaKxCqjj1
         W5czhJ9hM3aq8a/7xw0+TcKgkL0ozcit44Gw123Iiauc8WBzFfgRKG2blbOXabY43APE
         PGRHLYNYAvGqcKZQa+URgMgj/E1hIR/Uos1JS0jhvNUpK9CC/D0Cy6fODXE/pVb7i4kc
         ZLumEOoL1/BrE/mK03PpbC7Lg5E4+S8gKPCmPgNCJgItzT49C7xZ6OBwogq/uwsXpIpM
         E3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774427321; x=1775032121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=;
        b=jkyBNu4+8HA7CjZ8A89hXF5AbatESOTCcZvorHmtkCdGCiYCptGx4RKXN6HsZgfC8F
         yOH7iqUgv7nuk6gA//tO2amzW/f1c86UA26+VL3l7FpdeTFrmJr8PL5NKYMorBkIS6Qo
         dD+mqCepdDmN1SvG/jsV+kkagbMeCqqlcs/rOTDzeqRfj8moNeA30tjlr9hh/pF/GQvc
         +5qeYYJAGLd1Iw1ASNrIAh5VBuDGHiNfQ3k318vmeWISNYvPiY0YrQzM3hTGybITZJpJ
         RcJ1OKpgkf0hD5qJuEWCHmtKD/PlehAIj6RqE0tlFjGIs4N/1hgux1LuxBXsVuqRQFM7
         YqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPaHclMfy9bscYJa3Jhm1rfwSbStbERto8UtLGmj8M5jdufZXk3k0WMdW/XZPMg1ErEGnzdVjMNqVU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKv7KQ8RwpM7yDA24G+LEd0UNTJO2Rh57ii42DiY7E2KHCM7mo
	8qiwhIIerL0MsSNTXbFLDtcBEoxB6Iij9TY5PuxkNKncz5vjV+NDp70gDLgqAabqIBeQ66PnuQL
	ex6DNEe6dkG2CRAkVovCXBEe+zmx7rBUR/W91gQWWjyguDmq2HNO+yCy2b7xonOjfi8Uswpl6f5
	I=
X-Gm-Gg: ATEYQzx2v5zXAojzq6KCuQEku6sSHtSxVI41ozySDDV491aC8oavjhr+1bQ6QegvmH/
	8s6EW+s06gJ//piLT6SdtkT4Flf2BtbHrc/0rNWSmbvK1lCdqnitZMUIC55itaSFGeHigHcx3zS
	tFKWFHs96Pnb4FDmYCJTuPxU01ThwKkueiS/4Vxh4I368bUbICSj55Mdi8sJ94qUh3gtOn8OF2O
	9e9xQzB0FfGsAxTEqUSRejld0kwj8SnQ5b4XVXlp6yT5Dk4nbvXtcNsk05LRyYZ5VetppHtaZ7B
	OntS4743vSPV8nqEHXbGbJLqsxn5JlJpIqwQ5ERFqyNp7sOikNqffkDR70n33YHAThw4th+Kwjh
	KjdsF/6AK5aNN5jUi9EiQbj/z6Ogu4kuCkViVr8JQ02r+4sqhCc+kLSjoVrw8Gc9gHM6mMnSwyi
	SBi37cdwPtXKZPdFsyvwIqMau6CAyW7Kg21LBqRGTit+GuPTw=
X-Received: by 2002:a17:902:d488:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b0b0a7f83cmr29581565ad.32.1774427320821;
        Wed, 25 Mar 2026 01:28:40 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b0b0a7f83cmr29581405ad.32.1774427320384;
        Wed, 25 Mar 2026 01:28:40 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836ace98sm174408505ad.80.2026.03.25.01.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:28:39 -0700 (PDT)
Message-ID: <9dac8baf-9248-45d4-9342-8f1c0e40e327@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:58:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1OSBTYWx0ZWRfX2CccOSnhLnGo
 Hysd7FpXXz7szxhaWIKdGpPw9uGZMd29dqJ1GzNBabQf59wH+o+8HqtCAEXS8FuJZowX0Mq6dfm
 HIyz3PAusuagHzZNpbZPv0HkkARJbZoPjY8YloEVSs3etRszMI7VRyydmWkHbfgL2vh7b93D6GE
 IxMxHT9sOBCZk8YIWRoIpyLMRUt6kfPoPa9uBqATTASk7pxDHxKmXrd82WWZrpZtVxl7x6m56xz
 qHfdoIXCv1NFNdEs8oksY+BTg+wAcN3thebEmqwBNPzu5GUM7YnbbAnD6Xx/IJ0GY1FuzMVJ99k
 Bf+9w/fRbtgInk4aZp+FG8oVKcAtnngP0bVrSBiqC+xF1OA/8n2Yf4HhET1QKYrMfNEWHXt3YaD
 mC+jhA261UhCOSGCR+UsCjszPf/tw/Q4sLxgO4dPGaK4Xp8AwxqiH7ElFsabP9ttwKT7+UgTYWC
 50Ainh01eXw9aSwICbQ==
X-Proofpoint-ORIG-GUID: U9eI3sXh45xvcZ4P56dor8-68erWwYGY
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c39cb9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lAVPLi15b1ITBO9RJbUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: U9eI3sXh45xvcZ4P56dor8-68erWwYGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250059



On 3/24/2026 8:42 PM, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
