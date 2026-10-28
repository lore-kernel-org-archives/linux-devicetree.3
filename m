Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201332;
	b=N6sq0q4kDR7FJbfe5+yFQvJMGdBuMIkn2qlYNWfSp4/3429Drq7BNnicJKrxsTkEkzKm
	 ZE+YQt1z4foJrtCUXDSHbVTosqUCwYhwoaUuoDYEgKycwkKhuDV6Aa1ZoXEPNwt9NjSSD
	 02Sl3+/KlthqP3CpfMpQgpcEBA29Zs23HpzgBs3A1OHI2Q3cD8RIQz1UFsMbMfKWCmKdH
	 HhcER/slIqQeT49dvi76meCkpgtwgRi/9HUJOLdqAmgiIhoArTOkUWw11f5Wwebxehf8K
	 9TNQVwJwDgzR8DjuiXeljvf9F3rlaHUgK6Zzvd5u/sp9fzKb2fGDLCx9mvphkloL3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
	b=EQFHg63UkVmW7BeZyUMtdM3Kr6CKnK1A3Fku17MaDI2nUStj8EO3enpwX7wEvNQg9vg3
	 7hPsJ+AKraCowT/FU61FUyu6vTYhnqyVMlg0dmDgwGWKAdN7b5Ve1KM1suvK25GJeGm9j
	 GVRYji+ZeBtRqNKEI1JUTV5ABHDJFenXN6ZXzTrgbEyaufl66XG9XfCGvYKsD0k0QHNAV
	 2ToaY2jNM0EtsCyNh4VRAuop3Cr/bC0nr2Q7QPOmBSotX4ZREXjeMPGdi7recdUP/nmKK
	 SzeYODELxI0Gq9M9moyNwrMlquAxXq72Lf9TS0FqMv+36Kif3TWDHCDJ/AO3Jd1pztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDEE606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDEE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAkd41517128
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt+LWj4JTxLvmvfKCHSS+whi
	9VdAbkeinOtI411OZBc=; b=lS1rxH4gd8sa+mABPrYZM2XB4BKBJaRx5545SSpY
	9qvU8eTk8yRkisoa1vBwzUjS0DKYUC7ZbPmdW+U8oK/Jtwb20aV7bSGtI9NafViI
	hNoq4YalpC4qqgl8Va6coTYBmm0Z6hEPAG0ONkQOAuNzqsT/rcolJqvLb7ywJ0qV
	hYiReKE+glOqBl4W7Es6wpIKly6Y4Mh72klLHAKizGWjvBFrYTDBQyTln8Tbqst3
	7VVSVkKxy7afwQHsfICjmeMe38Lx2zI+js8MJhWWWCtuh/9oviygJRE0UyRXFBhk
	6lukfQp5woYMvlfh/6YmO6REeQensQ64ifs9mVYzoLJvFA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwa4ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc36b97a77so287329137.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201330; x=1793806130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=MYCADI2VqnH6blFMNO8Ahn2dr3fg59JUDBOe464BsrzKo+xwCsFR2y9OyBrq+Z+uAx
         dGL+UqvvSymPUJm6DulHh4mrycNLlUwPb0eNgnerQs21duxhQJwLBE2rZkQ/rTWbhTxh
         yEEHdbtzyuuMv/jzKCGXIY5ciHFJ2c3ovdzBzIwnqwwFwtZ6Wcc7Tbcnjcf7Ys2Dv/0K
         osYX6G8sft3auJuPXsbrtWpBJFCiv+XO9qfgoWoFYRulIRTBKa6oak76r1QfUhfKSZwg
         v5wzPkVgfY4T1Q6O4V5MI1LniM2Tz6wHlH4V1GjzYjsSxLw3Y0TR6cTvDMyjF6yw7sC0
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201330; x=1793806130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=0pOCgadtLDVzxqSNH3KnQTW5Qw7SACaNfW7uMluv39ygCT5cYIV5WJudo025BLiysJ
         ZBGMwNfLXwAiMS6snIBKB+62RaJUQTyVenz2QmEqvrYo0oOFcvQm+YfTnHgXVl9fb10D
         VIa+JzkjynWo2gLiybIVhwI4WNP2UhX+dEJNUD5gzC+2bf68PR2IHgyWM2Q12aX9nwEg
         EoIu5oW+NdYsUrQ3NORyJFrliQ5yo2KbhBvLtmCbIz+ieWcVCESAvwZHaEbr9RU9S3Ze
         BUcbIDAaDcLbf08emZE9y6fjL/pF/kUBAv62249dAEMKFmsB0nBejOTlGxYmNWawxM/h
         sZpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8Npdqp9MJ+Lx2RbO49hZF4TPJNM9qXx8WaWPSYrJl1DmYRLrFrClq9cY5SctmBaPFOk6k/LxIXbwg@vger.kernel.org
X-Gm-Message-State: AFq9FYKVqsFcfrxWLj4z5x1jS5Uouy+GL8vaAembYVCcupvvzHwpjvjs
	uznHYAhcZJY7KLeBOkJal8rJOSB3L8f1RK+SQtqL7M1/wRy1qVPG1bvZslXXdhWji7ZpT2us1yY
	1/gpdciVFr7m4omE0NL5KGTf2mzPw4xo6VXu9BJtNOkfWpMSxYXtVT2KgeFq3/P1E
X-Gm-Gg: AYBFou0OYaSLiKLhWYpdoY4xADBY1oo+fjNWfi9Oa8KxAt4F7RKvVC7kvF5I3I1FPWs
	hDELUebF1tKCIWkicgJawIt6WMgXsFSJhIkcBYqszCBttFrKkkBTaOOt7XVo+p1LWLlsnk4DK2a
	srBkykPgzWrE+U10S3QkRGHXjAmuCoWtkFVZ9WYbYDpRVGxfp0eAL8bVNGi5+HWjv7bg18LBBLw
	yrERSL1OFf1Uigxw0t9+hTVaCTAm1p9a3A5ASIhSdV1vAMbS+uOZZjbxLOQiuSmtnTOAisu2UGR
	37Qjze15uX/Ak++TfW6steJKdZesEV8xzvehvOIFJAs2vlOtQ58accJ6MrRlLHLenroa0di2sUU
	XK1s4p0jVdixGVaBvzRBRN2kEEeljc/5wLm0CNL2hO29W57g2D2yc1DjlNLpguHIezg==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443066137.12.1793201329912;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443045137.12.1793201329366;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm27880107f8f.55.2026.10.28.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI
 controller nodes
Message-ID: <qnxjvwd7phkvxe2gft53i5utnddjfkjyljvisx5wfd2epqh774@4jxv7jqlubs3>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Proofpoint-GUID: fheJFI7STEPtYctcJAKSfmwjleHmYJLM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1TamnQer/HUq
 EufvuCuRn49Aj564f8IuftaU9i40voEkPoHvEL3wVlJN5f6TeXSFRAFD++N9hWf9+qYV3rudToM
 ipOY1Jf64K5c00Hol9/xGbkxnsCwI+c=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae214b3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ew9RC34E4BSkZ0FC_vUA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fheJFI7STEPtYctcJAKSfmwjleHmYJLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX6J3EhMK9yiDh
 it9L7Z4PCTzj/hN1C1zPNPeb3ZV9gTbejLcCRX8wr8TtV683O5FPMBUd4+fd4LilxqQOuNp4ivN
 ci2V+BRzsSO20ZHj4/XnLsuQxXwrweJ8pTG1xuO0rtYPA9YG9V4RBh7Qtwk5d0twUJQTOfR2MCU
 Yt27j+pIr+s1YeQ68tU2Cl2gp5EJTcN9AObmhrHIxLIs2KE4RQsCPlZgGVO/HzZcAFRYxuIIpkN
 3tVA1ORDMPjN621L6jFgkixmPUD7HM/vsiXMaGx5f0+myaWF2KCp59YZNBWCewgYBNqwWhyXVhL
 7ROxeDaUcQY0QlW/DMkKwzfPTcBbTmr3jWOAs1FzpZ/Lna0OFC2odaiUDOjqPqfhzxMIfKNe546
 9M5nR25gLscDvpcXgZD5z2lWVpYtWmikJ2BtJaL2sPOGMKluuBZL/ojAETD+VRL2icvhLdRs3y0
 +3gOZmllUOwmYjn43zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:47, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
> 
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio109
> cci_i2c_scl0 = gpio110
> 
> cci_i2c_sda1 = gpio111
> cci_i2c_scl1 = gpio112
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 = gpio113
> cci_i2c_scl3 = gpio114
> 
> cci_i2c_sda4 = gpio107
> cci_i2c_scl4 = gpio160
> 
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 = gpio108
> cci_i2c_scl5 = gpio149
> 
> cci_i2c_sda6 = gpio115
> cci_i2c_scl6 = gpio116
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
