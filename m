Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D03F54A5
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160098; cv=none; b=ZPMifrhRNGDVBoXe19gLUeJb1iHOJLrt/NYtxkwBOoyh1jE86s1u9i362Iqr522FkfxYXu8PbG8II5gOeUJpXjtGiDbPn52voFzbtC2tQr3bIl8XIr+NtwQ372Gk22hBP3tbQGyatYCebON+oatSeKsYwg2C9KzOJP46C66v0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160098; c=relaxed/simple;
	bh=lrnPnFEbAQ71qKyoRi/oTl/odGj3BbrIpPuyNquAcUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1rl6o9ltbChwFVYN4lNlGNyQaWLG2gz18EttLwazuN5Ek7a/z/NC/yLzH9ukPp3SzO8c2F2kZDfSENKUhJcTYJomEOLyz4mrjE03WPkDVVuox1NJlDWRKOKP+JXI6b2OCDfQBQUlT1kGH++FKtqJ44cmyAe32WxnyAhh1D0w4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0A2tmoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRl/Yiqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0A2tmoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRl/Yiqr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479pAnf026511
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=; b=X0A2tmoZwkN6rwYc
	Cv5/zWMrESzFiRugCw/fCcoeN138BxC9BkM6etNrh6mT52XFjFh54C6mv7oZdZ4o
	UE3SYwnHZ7zlFsQSMZlE523RtoTObiSlrtq4Ksj9ViuQ6X9uTZf5XP5iFeUCmBhH
	AzWYffXFH+9Ht+GFIx176H04CFHjCqrbhtDXmxLgJSEUTsMOIeqmI/bAo1oeXPEn
	QkgLTCF0Ky5J77Gtw+xxHPpwy0w30OdZouQOOul8G3Duo8kTmD6Ld/BWz7oWSYuv
	tSdy1wZxZlWZ9khBuiFRHoqq6ZtNUJHev/7t3eOB0Paa4Cr2nEiwnrQjD/ezr2nh
	LQkiaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t227u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:21:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-835444b6ce1so636612b3a.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160095; x=1778764895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=YRl/Yiqrcc4kIp4Nbupxgq9lI+G1/EhqH/GQGuPQqZXTr4Fit5tKzygPR+tLs5agFv
         3QddUx8eWfNVhSvYcK+g4Sg4Hg3VwXksGNtvQawrv9z/2J/1LCgy3vmLCkc5bq8Ojcgn
         BOE2ck4JoOvjFqkf8xEBSdZ6KGTMm+jCcbM7gquBG9MBH6b3PikO1gicr6PzN08xgqZP
         XdE1rfGvwMv14tvfMJyzzlnV+HzS2Tt/BG5lHwHit/123d5VuRjqRzsXIKiUpK5AlQrO
         XMOH7M9aDdyzGzDOaSvxYyozJojJ2eVFrML7FxdU2Td+4ig6zyMzo/xQcBFYVs4PSrb6
         O/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160095; x=1778764895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=FNE5gFaCMm8xqfyZHmKVM/wTKbdFTt95DO2T0e8e+grrofukPsqpZAP6gPAFsnE/0y
         VAlkyL3lbdroTtWlbz6N6AKlZ1mr8bsLv5rJ5lgL/fdh0DS3+A0Jc0pPytNTnjpHR44h
         3joBVaOK1ssmM7b1NpDssaQPZaH169mb+fVJyWupSUoWVfQnF6f4fGvfhv3WVuSploiD
         Tn3nrJ5LMsrTD8CRKntncxTNB3y4c38NZAyS2pgS0IExajv+KTJlHDSIJn7QVCtzTwp5
         wLpI5HdJT5KcczGdy9xnRp8aq8da1p24l0XjruQjgYPfkmTUZl59CR4nZ2U1n4ixqmJ5
         4moQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LX3tWyvmRbjP1fFjpffvH4P+YnqyNzvEfbk9VkY8pWwE2uI1/2OzXdkCIgQkzQAqA8NsburjHI3kO@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXBgfUOmMKVyJf/OrtXurZ+lJTDSwNWaxslQfa31Qb9rPZYY3
	9MGQySRAzfd1DZIZHWRNIK/JPhXh6YUggSOTuEXptOTV6MyO7QANGP++F8wlXVAXKKEJ7c17JMO
	c27eZgotvUphgG0z+n5Fmg3eGOq9LIu1yUVynAc3zk3s7E930+CPBPkjCkpT3xxF6
X-Gm-Gg: AeBDietYLI/36J5d8VAgpQZoUP6UqRtnKiDQmj27vB4VgpOafZwKDszG993Wr4EYwlL
	udQbUJLHz91c+P27oP60V7wCxTQ+k0p7PlnPZWephQggKDxI3C/P2AsE4D/TQMsQ8r6X/LFKDBJ
	Mk0n10ysK2kC3Ouw1RKaupNJvRO4vGwcJQ0UKH6Y04g+j7QADj5uixLp8kmwGrW7JuRXbybf+kI
	W5Y0f6BhfpmlzClXwpd6Ei2QPXDxFOp0wnu6FwSrIMCRENIlDRD4g6iorszJMBukz3M1xMlEump
	68Fu8+xZaPUitsMVItqwfIkzjroe7ufHUXhjuMNCgeaC+JcUmS0q3HZ7DwrBS4N1bfw8HEFZ9qO
	cW4iE+3KQiIF0c38NvQsm2gROABl73xpBD/TBp+gbHP0uuRN6QpsVEXX0aA0kgaHgGmI=
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738880b3a.22.1778160094557;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738853b3a.22.1778160094005;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm11894566b3a.49.2026.05.07.06.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:21:32 -0700 (PDT)
Message-ID: <40c9039f-1f23-4d7d-b6e5-3f1434875f26@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:51:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc91df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hIPIbg4ErQybsv8KxtcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: a3jeiiUs5UmDWLYbD9j2W_942EMhtyo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMyBTYWx0ZWRfX+PAUkSp5RwRs
 9gsXX1bTME6hHmW/32svRBSpa559z2d36SUTMlBYb7rX8l25Aw8tJ1MInO6lHrB34TyJDtr/UGH
 qnDXdUKPFXs7xCPhKiFEY8ixm29owbN+uLICkqHH+9KPQw8PTfQCvD9KnM2CRjmBnNJuBL3HA/r
 TSOWRQXLwz/AgkvR6phwfUUqF3IQveFI7mzBDScpAqxdaMXBKxDTy8kjfatWQkgKUc1cbCL7Mvm
 t/pBQ6d0F5+autEY0dCtSOrX9+J9ICpuwwl014S2ggnQwoTQNJEFg+ZvasAvxHm559gpH/aeq7U
 hzv1eeVU1pzNdtkt2ns90t8/ML8cCh+qljpTZZ7y2LSWvZVOojPde3w8Be0oZp711gLkmldya1K
 jpRK7xSlw9jrEPqYaqAKyFA0ZlCf+5CeCv7kBj9WkpjYJcjpChRRZea/EES1VjNYMQklNt7BjhP
 Typ8XA8N1fsSw039GSg==
X-Proofpoint-GUID: a3jeiiUs5UmDWLYbD9j2W_942EMhtyo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070133


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
> 
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>   drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>   4 files changed, 9 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
