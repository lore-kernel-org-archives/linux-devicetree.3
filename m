Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E22F7F0F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523769; cv=none; b=lU+UuaNsIbCb14hPml3Z6yloq53O+XzbDr+CyfjUP0iTmresChUvkjdA5TuCfb6d/6c3QSecOQ2qFu+V2OOIYCiloOVgSHZREZ2zC+Lxfp7zUe5ldMvkebnq0dlak+iRDrhBbs893/D6qh4NgsopWR7o/5+Ixxf2t13uiMggaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523769; c=relaxed/simple;
	bh=d2A3H56c96ogqtKRqXPGR2WiKdZUuGpqLGk0A19DUtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6FQ5K+MlgvkIhlmH04c7OZCuryamRE7XMko6ECjmoVpmCHBB9OHEDdcgezUmEg5gI/v0IP0Ct3pg1Htx5uqD0X+AxuSA/tnL661wwNdS9rFNUyY9Q+Rl4HM2dUYB3cyGMZWwjTpjKgwLxOLcmabIdeKf2jHkgfsZhnAmC04LwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBluL/h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJTW8ZiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBluL/h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJTW8ZiZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApNPA136469
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=; b=JBluL/h5Dzur9H74
	OAV3nxcc3wgep6MY2a7T4L6amzfzUo53eY727Q4xZWbljJnBnbGtuYgIfA+kfqq6
	z46QrRn3Pi3A5TffwnVXCNrXiHkA/XGjfCrt4+fR/u6QHpXhSas70ebw/SV8nW0S
	SnBIcX0InfPecNTX9Yng9r7EQi/pLMrQ8yaeDayj/OCO187IAGFw+uUXstaemn48
	NJQwIdn+G+NZRPrsYGc9lATBL0Tn1IXs6M/9yjR/cvbKYLGrarQ8Bm06HFjG2Rbn
	iJrkweRIEu4Jw3cAUtTppQ+SjFYDu74OAIMOnEwhLJ2QYvl3kuoeoVDneYG0sT+I
	YWs3bg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx0f8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:42:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd9683350so13276906d6.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781523767; x=1782128567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=;
        b=IJTW8ZiZ7speyW1R7e2ZReOeZkl4xRbGHat7qGMYTSJtEru0g1Xt2qbqfEu74VoSzY
         3SWyFjeS7iOXQvxGuEEH/L1QoZP0p7yhgBbwFmqtQBSt08HKrh9bUKRucDb5x/ZiUobE
         okE0tTgAOEkk8Xo9jzk3JnBGv1671vDc1fyGsfb+l5z21etPS6fBfd1ICVF7aT5d1JEc
         k67GSuAoafB4a3GAA1vtN19X/5onHxPwt+RVPyTyMfM5WD4ldKhG8O4fM+Lr2YMjCTrC
         19VCo3Q5qZhiECtkTVr6SDWWnMJ4PRLcx7w9zc9yrrNurfK/IlhZ0qJ1/cqxrh1JYXv6
         e0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781523767; x=1782128567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=;
        b=mwI5cwc03RSYPJaoFJPF1tdjuevEvgpVCRhS3daVDba+f0CSiZli2EuVYRwNReYimx
         5ye1QzULMBUwdKhJVW1ODXExtnGxaqDMIsEvdkZdTcC6yghhPIW/6vl4RMjr0NvIeC+A
         IokTJ3EPfJeEc9vbT+Hs7+ZBVRmwJHPpdI7zBb7wuG6boEWoCdkXIpaPZ3I9FNZHeTan
         OjGBFk0wO8n0Ju7yjdE35tYA+ZvLSeOWo7v+Rr8lR0bnGDOgtc6m7+aPlkVDRbU9IOhT
         y2gOablT3h4NRsEh1JScNdnPF8ARNAYwWhclgi/Dp7mHPnl/LRGqBjjhS6Uc88P+isiX
         rVIw==
X-Forwarded-Encrypted: i=1; AFNElJ8V+3ke5McLE7NIKmgnF1XtnbYLwpc88nBWrK6MXQAn3v4Edj+vZrbZi6WE3bwSkIaWOgsYbS3ZT+Om@vger.kernel.org
X-Gm-Message-State: AOJu0YytrgYNcU71OIrAujmrL9bZHVU8+4OYdag0U1tdFPFH2hooxMQ9
	1KFWdUWLBbj1fTj3NYVjU8WISTjlM7XJCbJINxj36KEZFypPuSWCu1L2R4DjmfH6+dvOl2f4cWY
	tjsjP+ebqYW2OSNLS3omnHJ8bQ/d8u1148sqTP/Z48ej2SnjRxeNGH3DdbxUVuZ0e8hzo4gxI
X-Gm-Gg: Acq92OHt9hCVgr+aaURvfBViSLIg9M/a0AAvVQDbzzd7ReLHZwHTnrUjR9dNg0BQ8d8
	WCLlcCJUfMeRac16eZJg1EGopq5Qm33z0UnWV3T5ZlpwZRvnR6zdEmJeYwjmNnV8rC18tqmoM3Z
	w9bqswhKGMRB8Hwol67BgwhMx+EZ031ZYJ4dAdigLXgY9OHGUa47MFPk0T6Haosi3Vndnb7t81A
	XsR+5UmZYRJGSRLiK5SNKTNzZOH4rDrc/wPo0bukBZztpeYvM9WOcG5wYiBFYgFuvvfoChKHhou
	jr3M/9tUukagTvNJMr+uCWXyyMcj2sQ4uOWItLn67yNe567fQqP4WHizgd/8Vnx4LpAod040gVH
	HhXkURfs+Fvr5LTSsx9/jDSSdtTbePce7U/+ceydesY8Tkg==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1230197585a.7.1781523766787;
        Mon, 15 Jun 2026 04:42:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1230195585a.7.1781523766398;
        Mon, 15 Jun 2026 04:42:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9013575sm459444566b.59.2026.06.15.04.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:42:45 -0700 (PDT)
Message-ID: <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:42:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Tfhi__Bq-oQ6e-V4zU386Ssa7FtMYiZ-
X-Proofpoint-GUID: Tfhi__Bq-oQ6e-V4zU386Ssa7FtMYiZ-
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2fe537 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yIUj8aQuGlWjW2UBUNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyMyBTYWx0ZWRfX8V0LxrNziQ6/
 qv/wB16xHJvFC2okOc+Q4484LcXKDTiTKCUiv3uZCsQKGWYhetS76GNB/fCwKiCPNVp4s7knd5q
 tkeKol8taK83kAmVi5hQwrbG3CFlYSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyMyBTYWx0ZWRfX1QAjJ7S1h2Jr
 xwB6j/pOuTO90cTIDphWgHqlfTvTgT23AksPCZPU9LacKcz8+Gtsc6r3PiLoEailcFHHq9ZKoR0
 3sCugGrvhEbZbwcTiN89HRRArccajYMEq94FM/sd6RjA5OB90cETw6rH+mq8UwDGYAqYiQiSSgt
 93NdPju/qNvF+2VUQ0IfDxIRZ/XXRe7ohtX1F40d0Ni3acH9iC6vs7KcAWpZZTK/XUPOPr//xWF
 7m2sy1L0WWvZl5Z+6rkhWHoRxMRGR6wMGreNgIDKsUPQY9elq1TaLR2YBmnyrhVHvDGW8aRjqxA
 aba9UrOFmLs9Y36yuSGhYvq/AaeLDPwjFEYVz1OTew1VuWGM4sTkO80eWU519vDqoZY8mhFBZ4c
 NAkM8gPVXb3Vix185/31JXnfT6wQq8D4PvFzO1rrQBaoH3FPOedoZxff0uRRhtTLHHCVVqvBkuA
 6jNZwFV6faRsAM1zurg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150123

On 6/15/26 6:25 AM, Pengyu Luo wrote:
> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>> driver to fallback to FIFO mode by default. However, these platforms
>>> also support GSI mode, which is highly preferred for certain
>>> peripherals like SPI touchscreens to improve performance.
>>>
>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>> the controller into GSI mode during initialization.
>>
>> Ideally, this should be decided by the SPI controller based on the
>> requirements. Another option would be to prefer GSI for all transfers if
>> it is available, ignoring the FIFO even if it is not disabled.
>>
> 
> I have read reviews. Can we check if the compatible
> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> presented, then we enable GSI mode.


This hunk is very odd:

/*
 * in case of failure to get gpi dma channel, we can still do the
 * FIFO mode, so fallthrough
 */
dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");

In my understanding, GSI DMA mode is always preferable. +Mukesh, do
you have any insights?

Konrad
