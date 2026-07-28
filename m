Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98E21ABB1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241861; cv=none; b=RqHtQAgjIcz1YoIE1ZhxxxiSEFVnY3OpS/D7dUKzsGMAs9AF+kymRs3U2XqVN8dzns8irXYS68bweGUdphQOb83Z1ZR9NgP0d008H7CpauNaz4+qITwT52sAcfJMi7rZcPQSUrjFdx2SET98ihrAyta+Ch/EQexNQeKaBvh2q2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241861; c=relaxed/simple;
	bh=IFMpim1/GOtL/ZDM0eWxSQ+WF7g/Ufj/Iy6HnaPwGFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYtvitby2ArGXZXEA+AqvVUVscnBFRgRyWKMCT0m1d7P2cDTi0fTgIP3ERdTeHEsTP4fZ8tLXsqfjXkdjpJFIh9lH9Ghoz3G0JAmjuJAkhn9gaJLq5FLcPyle32IsmoLABRjlikCJ1LMZ33qy32w+TT50j65d/CkrinldRsp+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxXg8Owb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrV6kiTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxXg8Owb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrV6kiTX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHmtL2767208
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=; b=FxXg8OwbnZhsPBig
	cTh0qNzz9HYP5189u3frH7m561oEgpTxKOAbOvIVZPT/fbyCU5AhkDLfMJsB45M+
	ZFYDpSvkeXiFvs80ap0+szJKS4RG3ctEVep6AJjNbALHEx3KnGwTuT52oVfVHkHD
	geLKJQH090U6fkaTy5RgviXQUoifSyM5NfJBOqEULxEjsppMtR/kmMDQLzgPfkK/
	6q7EnbypEYF8pgULeDBqTByhGfo95GjQvkPbc4cY56kyFDn5jXY4BoKtjGDx7/NL
	bShlzIldWTeBIls6uTNE9R9p8qS2YwC2LWZ/CZtjC556+ifgSuW9x+j3p94Aai9Q
	kKplog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7jr47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:30:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so48920455ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241857; x=1785846657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=;
        b=LrV6kiTXBteavZL9RYY5D6RnXgFuKUx0tGKXkMQD82BBqJho5omxD9R42Djqx8eTC3
         0XBMhMGEYaULgMq3aOD8vfe/VPIzONzXnPQ7ZOzM9/Zrg30X8m5X2afuYUnxXnh52M1o
         RispYKX8nIr1dguXm+78eu+u27icWVbCe148ZNeF2HLeQgDi9MuwGt9yTiZ7/2UA7mXn
         uDwKwawB4pxq3rOXw/wlEVr91MMEVmN+iKf9m8QPLZ3/iNCkDAT3oWjlqOtGPCeAgWN8
         I7MkiKCifqTt0XFvNXyytpooCIJy4extOHgAwjX3nBP/LogckcJj/DGde6nCTjM/0IqZ
         X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241857; x=1785846657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=;
        b=i+ScfzLFcr99HKBnguHsWAOkCfOK7ex54SkNRfI5TvyVQ2LhMO/gL8LfVxRl2pbxek
         CP1wRGnRnwuhH3HWpQOUsGhUFQvqI8/lhormxeOWPbc6xfU2EYzRf3ypj9xyUOeJ7hjd
         IBuKWi2CU3HjpAp4mEwCKIiv7rtaNBzT24dOIq7ayhqRwTsrsZMn4SVlydhfgtP4E5oC
         i1VGiYyPGnDKhrzuUl5vRtM/pCvUxscrhgYTz1poK3YyzV23bklEpa1BkTZY+C3Yntd7
         Xg2HpekBCblj4EBkly4dtLiD5cAlUCDOv6hJbw1deHQPofXUYdpFKx/rsSGqQzYQisco
         vszw==
X-Forwarded-Encrypted: i=1; AHgh+RqtG5hd8+OcugPmD5TuY5tt2IbLFCHtyDOTmw4hfH5ovp8tPumViGej+ZNJyltbpBQWSFkj4N3958mb@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvIqG9VOdotVXKdPDrbuhE2nQx30H9fXdmhQCTE30LEoglmYJ
	yS7qwAybvaTEff8S3RbqX8tm/FUKj/u6vr8B3MC9clZs7cpq9xge4cx2BDMBg4Pd4y4Cm6pFWhL
	tIqiMUTfedwPSDhpbnb7hL/zHlSWH2Cmb/sQEw7+DLG+IIAnO2atmthiFRPMzPYbW
X-Gm-Gg: AR+sD109Ocp0RX57b4gcZuViVAHvLpgoAdOerwo2Pw1St5b/aKfcogR0iZPViqHFEzA
	37EaMPk2+efgRqv8pwXuW6Lac+nyaATH9pUTuSTvA4n3Lrmq+8tFL6na1LBp/i0CPwETzvZ877l
	QwMUiybLekXx2UWZ6dN75ptQFMCwoYNO0LuZnBXS12teaK/OtvPEN5ThTGYLsqLFslmk+U9Az2b
	mgziM1Z9gvrfiW07HQR6MNsj2x6g9gZzFVfJwjSou2guwoK+f1G2ct8tesT6OIyQUdMVIuuT3qn
	f8B4bkQRwK/zdqMB0T5/Wl4t7FhivrMo54jHmeiszEGYShuWbI+F6rZb3LJXN31ByGNueuPorC/
	T/A1/EOPX5HCykrQl2mK04T8xQwomKREK
X-Received: by 2002:a17:903:41c2:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2d015cd593bmr25108115ad.15.1785241857224;
        Tue, 28 Jul 2026 05:30:57 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2d015cd593bmr25107355ad.15.1785241856688;
        Tue, 28 Jul 2026 05:30:56 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4b01sm51849615ad.71.2026.07.28.05.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:30:56 -0700 (PDT)
Message-ID: <70af67cd-1467-4770-8a87-584920b128c4@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:00:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-3-mchunara@oss.qualcomm.com>
 <20260723195417.GA2688724-robh@kernel.org>
 <c99f89c1-fcae-41df-8426-9bdb3e8e9b5e@oss.qualcomm.com>
 <e58778e3-86ae-483b-b52d-d3a0b0d5c59c@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <e58778e3-86ae-483b-b52d-d3a0b0d5c59c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMCBTYWx0ZWRfX7qc2VHcYXYfD
 7rOMLcwFHrETuWc0PG6qHwTHgTZyjbW0XidkFIkpmDYtlyG/OdX5aZO7MR2DX65d2roEHHih8yP
 Y33oGhM2TKhjyXUcBMg06paRjs7tC1UIATgUs0TVVmRjUtn+IAGoOjDRdA027aXn532QHU8N2Tv
 2bRX34F5ZtmyNLolKG23RbNNzPoa/utSTIpqX7ARb7+PSS2UeP93PMnPxI+h/jVfTz/DWoeOhdm
 lYdkJMIMGKl/qtgjgdxY9pBHuTTUH4GUWz7PuadTs537hXvlghH4rohC2rD/yrTCdzPHlL0ZAD/
 P+MQ3XPMjSGB0Z8BQfimjj+mKaTFuKJq9YDHlXzFnB5IrRiSgRXu3hd5URSbgHwmSy24QSQ3dbb
 VqO/6ORZPy+gYhgHU5lJUbxFCxJxCiJyuqlPqkYWYij0F6FsQ6dsR/1IQtoNWY9iRVsHp4C+pDT
 RTs8MBJc8pN+KRsar+g==
X-Proofpoint-ORIG-GUID: fBrUeQamC7rvBjGP5YFF8Igfw7JCebsY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMCBTYWx0ZWRfXxJ67j/OXp2ql
 p0TQDzLst23xRKx1pIezSAviNvPIDb1outqMdVvSMsDq1vneLAycK90/FKh3uP46uQ3eIjDBgU4
 FUZq6LYirqkmlzrKkFh92uMNINPNpHo=
X-Proofpoint-GUID: fBrUeQamC7rvBjGP5YFF8Igfw7JCebsY
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68a102 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6dYgsILb6vMNMVK7bHUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280110



On 7/28/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On 28/07/2026 14:02, Monish Chunara wrote:
>>
>>
>> On 7/24/2026 1:24 AM, Rob Herring wrote:
>>> On Wed, Jul 22, 2026 at 07:53:40PM +0530, Monish Chunara wrote:
>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>
>>>> Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
>>>> with existing MSM SDHCI v5.
>>>>
>>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>
>>> Missing krzk's ack.
>>>
>>> Rob
>>
>> I wasn't sure whether to carry over the Acked-by tag since the commit 
>> message changed, so I left it out and queried on the previous series.
>>
>> I'll make sure to retain it appropriately in future patches.
> 
> And where is it explained? Please quote me the cover letter explaining this.
> 
> You did not read neither kernel docs nor internal guideline.
> 
> And please explain me the logic behind your thinking - you received
> comment from the reviewer and tag, you implemented the comment of
> reviewer and this means that reviewer did not ack it?
> 
> How does this logic exactly work?
> 
> Best regards,
> Krzysztof

This was still under discussion on v3 and hence avoided to allow
further review scope.

Should have been part of cover letter. I'll post a v5 with A-By
propagated, in that case.

Regards,
Monish
