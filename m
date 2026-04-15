Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AA33F383
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246566; cv=none; b=K0QKIfdc/kCxB0m/VqGHTE4IVHaYQTmTTCvAgTrKJ6Jgu5//nGpnPnkxzf0ZnX7KzKEs8q7CLqoK77mVMqo3+4KW4F0ZDbMtuNEw7DbqBoPajZoAQmLEryRSu/8bJLcxMTR0BlUJB+4zR129LkTyBB78YNFvOSRn6z98+UZ0ERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246566; c=relaxed/simple;
	bh=VjI90jTJy7c24pG9mgRV72x07WaVDTTHNH8S60OnBmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdGE1CW/ZpOhijxN9DyCcNGITUokJMMVIrEUcL9DKUBQu1i+RG+KRKpkplwNlWJcMCSkMQHqI6f6VZBtznSjCGCfpaTjo69bbuCW2vv7veoW9KykllSDb5MHUFZi1CGeFtZxUKKoPQfIy/CLpra7P9MKsX+Bz1lkFYITqDJL8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCenT5RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4c7U1Qo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCenT5RS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4c7U1Qo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8WPZh3937167
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=; b=aCenT5RSm5G1gWWo
	0CuexFXnlNyy7IALcMQ7AACcCOb1bz2z5HEvXu3q419Ez3l+RJOLQdaKlSeHoZNT
	Y7Y1nuQg4oqSGatmzZD1b4F8/DmD5vcsQWiPJeunsNECPWEiZXwY/UAW+4BoKfrk
	dsoupuKyIbvpqLzGvKxhbFUkoF+j6aQiCpJxFlnSyEpzt/dWYKxcnkh5getc18H4
	fwEpyIdWpCxWgcLbhj7TmyBCIjSIZWvUzqMfYfX+uK555ffiovV97GuC7/8TaxCh
	RgBDORtn42hZVM+OWgKkOah2TAqJdJj1YD1A9pJ/OKnWFT0lzH3pzwihR44VIM5M
	nmoTSA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf38mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca5b32b89so12180946d6.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246559; x=1776851359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=;
        b=P4c7U1QolsO//ma1athwmhe6WsaGUzR1BHUubZS1rikp61YTfHjnRjyx6WqwUtGIBb
         AvRQeFkvgwkRu6s8P5YhV7oZfkuHbswn2YoXD1v4eRh9D8ng/e1lHmC9eKKSYY5tb4m/
         bfmOLMzemeTElT9SW20Q5gDvKdv0DFFvTcHAiUkZ+gu82ULCWivZjBO+6CQSOE+LA9pa
         kK+w/ZW9BURQZkKdYwpydpxVyrUA4JxnNu7bin+H/Sfe8l78fLCMJT8hOZd4jke3kd9Q
         YWGBTofW+gqnrVTZxJcAHVDXrPnnEXTc23Qhrr4W7At7utJMY8PScEtPae2ar/zUmQpQ
         qqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246559; x=1776851359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=;
        b=q72VRhHpZui7Ht8cRtwaQ2WrrvV4VgGjgSaXtK8rFCyYzGN31WxlQmSiUHuvbBMaIw
         2Y8vCO4SnhT8QwsZyTe4Q1bwXpo3BCq6WgC6ASgpr5Di36Brt3faB/ggZXIxdupnYeFs
         X2HshAMS94IXp3PGsDCyAHsJzCDOsAH+ou8eEt//YNmjaPeM54bebmA8nqf/kGd8Nsge
         wZbdOpNC7EBuOTBSHww1UWdh8cbGjPML6Ka0H3pxzznUR26ssv6BwyU7Hl/duIomZkoB
         BtveIMDuzsmSRV9ERZ2zEWc2zUGPk1JkWi589pITtJ3jjRtwqkw+FWPitC5i/3wvag2d
         VnWw==
X-Forwarded-Encrypted: i=1; AFNElJ9Xu6wRSRVxrwP0kQkY3G5L9JOp5ASN5FTVP3sdRHyC9UzdpCgVebRo/GV6ZTFM0ud6YJc155G0qepz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kuEvqoLi8tVLj3k4BJjiQJCILLZIXAKniw+4tM9NxpD34hm8
	cXhRoJ9h1DWwojlvM1x/y3r5CElE4K3uIBp9f1iykEmT1N2Vk0jlMHQH6aQQDKJB9lTBdLqR+1Z
	D8Wu2niV6nw41+zU3BE9ZyY0VA2WNjis7bhv3Nu9pTj5ywgDjEW6Qtf5rzeJ389KI
X-Gm-Gg: AeBDiesYRyL8lwHtf3+VgZ29JZY0c6ZBuCRFMPwhmUF5SQyKSGF1rlfnJoS6tb7eCwL
	qsF2UHzQtubiXKySADzcYEB619IDQcRew3kQsxhNaYYGkD+ySCag8mI8coEBKv0WIviBZkqO4jc
	XtQ7FKMQ6g362ltwCzY+oImjONkl2A6kxxFw0/GU/RUh9Ir2qS4dkCVrCLH4dwVQUnXN0pOz2e8
	vJvweDZ8+VMYC3XqjuUd6r3b1BDQVkYdv2GuqhraFO81A4jsgEscZvFEayox5z94S3WNFZvlVx9
	h7xNXiwSRCabTXbjaslvsr5OwfZ6go/DlFNeVlZu4B2KlbcMK4DknqT71JweqiqFh4gp/3kyd9I
	0yJLTWJ9/KYoKlOMiGqibTTp1q29GtoP32jxLkpig/JZ3gADhUbuksx/Zq9mQGxjzPAzNyavLcr
	p9UeufCC/en5JyLQ==
X-Received: by 2002:a05:622a:24c:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50e1a5dbbd6mr15378581cf.1.1776246559017;
        Wed, 15 Apr 2026 02:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:24c:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50e1a5dbbd6mr15378361cf.1.1776246558476;
        Wed, 15 Apr 2026 02:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d79258sm283300a12.4.2026.04.15.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:49:17 -0700 (PDT)
Message-ID: <dbe4a4d8-4a3a-4e69-843c-ea0b55a4ef1b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:49:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-5-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-5-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HMw-FQWlzDtINbW5RnSIPstSD8S6y6wd
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df5f20 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WZ9FainDxlOnS1l-YVMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: HMw-FQWlzDtINbW5RnSIPstSD8S6y6wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfXze2JL8yJBS7w
 4ivZv/rzEMJNcSS+8i95Oy7MEV959hRu+lk892xiAAlgF4llCUDfX+RgkeHLorlswUn4u4lYmT/
 EN1H672wYkkZVb2t7CedYCNqtnFa8N5Cy2Mjr8DnXcy60347NelIv1MfWLFCRGfhTYgLlZa6uzG
 +ktpMisud4abypmXEzxe1smF0Si8oRrxqeCM1ipvTuSINFOVG3gbKiEkkRcCavygQOTrr5oYSxe
 Wk4eSOzQew1sa6Y/9uUjisMhgGZJc4Iow1gVDqUQwyqPI8QF4cwHS1RJlWglEia2ubFi9mg0hGI
 +N7FNBfrOJG0eBNjPEfhkIXhTXEKKd8ox87C753f2aJ9dhhcRmnzw6R+/yWqRMF7VcUqCTFa3TV
 OO4FKSDEwBicWI1R2Oa3wYz2O1lWJGM98mAnn/AxI1IiCrfo/NQSh1BK6kWbAoWIZkUzFfQVm5Z
 el+DKrU9TjkGMrmyz7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150089

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
> on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
> node to allow the system to access it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
