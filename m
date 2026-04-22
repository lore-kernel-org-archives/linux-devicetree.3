Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9323B27CF
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851676; cv=none; b=kt0yfJhyzNApZ1zQ0aw6xfBbrkAa10vBi3+sb38ojczhqBX4zd7pu3Q0R8Z2OPpa4nJYLEIniLEjmN8Yw1DIPB+wJmerfTZj4y+ilEOjLQ4qf1KYU0XX6/gZf2mkWaLGfIbKFC7jznnV2QkioZQsx13MQlo9Bw21ATjCeH6RTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851676; c=relaxed/simple;
	bh=MKNmegGVJLDRN9jVOMYyxHdMwkw2Zd18rVfSLiRXSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHIOq8HJ8nGOAawZcwOHpsSWBwiYFpkb9QlT6qEwrfvW3MC2gx5AnAxjAnEH6Go1ZDW6Au76b0EVL3aG+AvtqfJP5tzCKyHxvch0mWy5vEZcyf/2Ln4BjHbtPEOa9P4DUoEoyFaus6vy+owniT382ERqGjxTKn/Mdeg18F4QO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7uikPmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFrQ2m1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7uikPmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFrQ2m1G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5FkjZ4051189
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=; b=o7uikPmyEGyVDQSB
	1OAkiocjRjIPfDGJVgyArKPCkFWbMOCodpxTlvVh0CiURKxhnsE8x9ZMlxjGuC13
	WJ/E3hIw4lVz0xQ7zLlboIEVCh5qrW+CfOS58veOiwdi8MrPeQwINIvLcrv4c+fd
	441LlHG2gkdzqfxWvpQB8SlbW767wypvTsu9M8nL2j0ewVCVOxCFl3r9WE9aBogh
	UhBjSv17DPTsKCarDYsGsGfOyJ69KTZbZeT2hj35V/lffvxwoUeeFip1JcXyomsy
	xUuar4YdYh2h3jdJhTIu0u/+56MucGzKducMly72a4qxDDe8SGhTyzrzjAgNiR6B
	xZt4dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfjwb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:54:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acb4b340f4so14783936d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776851674; x=1777456474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=;
        b=NFrQ2m1GdcCYPo/fjtQ2iQAte9SC8ipIlAkQkV03PR2nA5X8cDp3WXgZEZ84tY05J1
         YRqD2QPFrBTjdtHlrbz1QQMGm+DK8aLBInX5+WbYAY1HNAfJyQQ0yStBTcQVUMc7M+GL
         Opp2OCdanoyI+CvLsc3E+xr6VULp/oxbQ0J6djJxR2akON3uJvfipLeu43COtBH1JFpe
         koiA1YxL0CTWlKSknAQToAoqDROJHp5PgTyG+W+Vx8Vh2oO+3mTG8/MBnHUaY48otHiZ
         Q9eJ396zTb5uHzbi1uwfVs373Y/U6p+xPd/0BJ/p1jiPxpUaVeXgqSg/FYEmpPLYnhzs
         0GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851674; x=1777456474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=;
        b=QaafN8fmkzfoD89bbkRwKttudfvqlAILoBOrlLAdkjl/+6+Bedz9gstfXYE6o9OCYI
         fVi20yTQ9SUvAC3ZJyKU8EbW4W9tFBK4uFtKMEavlZ4J1EIzNMPDmctY4ZNGJhNafyD9
         EB6gGlyD9dey0twFzXq0I/mG6JWWNSm7VvV3JuicCDBe1hTr3QNhkT6ISv1lpSJP/04L
         5sUmG6qkg0gEE5Gj06O2l+ZDgmC3ejXATSUZZGD6rp+c0pEKNRIBSOvxjMt9+Hy04vL1
         ZJa3RLhnH2df7fF7Eu17E+j6ZcFxjJUCkpxrusV9GD2G74X4wDeYaaWuov6lplTEbAVS
         ISrA==
X-Forwarded-Encrypted: i=1; AFNElJ9idSVVLq6jOjz77lBOrEQVUeUxqwxI9gupWscXBUwXeDxWCdPBrCMoqiqb3BtqgIAY+sA7Qsqy0cd6@vger.kernel.org
X-Gm-Message-State: AOJu0YxzprgIamKJJq3l/UK6ctLyTOXB/oNS0XyTv2l5wzI/2Nu9hdJx
	tZQSJEO1Wb3k9erYVuSHdBpv5uYiylBgRbaNbQdqdIjG311aHqK0w7bCTLcstXG0QWoC9Ks+2/D
	c1g+NFm9J/rv9g9Wu9wMcg9aCjHLzRRUUZWxz7JAFJqohKiTsm7X72sTVTU7Ag72M
X-Gm-Gg: AeBDiesmU71/Uoa7w9cPojjoXQESYMayG/OTXXbRBPXcl0+nz62/fU1jEFxKY3G+kSR
	LjzdeqVhygF2Erj7eAMZ8CwgXaHAD6pEk8Y6CoOuOwb+TSj4kgawVV+jF7xJMYKjPMBbp3cBgLG
	zYNoPQuSJpZweiW6nB59vZWEN5uQKyJ4uNE2w/CoNcDwmb+tTOvP4oB/n8v7kp/p0nyeQdJ0Yuc
	tyVEa0qOHPgeiQELP1yyPOX37bvQ7DoW0tnEHXpbKHhFyv3iW4CLNzTeptxPtGa/euMyoH/E86V
	ngZF12vZWEgdDPcIWJgrNSELwpZRKrm40ow/nXwLooZs4quyDd9e38uN+sw81CSouRMsQcSO+LP
	Wr02gwOgSsdzcpXNb5jOX/InM02QapR50StTC6pvmgJSFTL9AJ8xEgFCyd8qujpATylUYq+1YfN
	RvW2YAmJ5tt1s8og==
X-Received: by 2002:a05:6214:21e8:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8b027e819a5mr233907996d6.0.1776851673984;
        Wed, 22 Apr 2026 02:54:33 -0700 (PDT)
X-Received: by 2002:a05:6214:21e8:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8b027e819a5mr233907706d6.0.1776851673452;
        Wed, 22 Apr 2026 02:54:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c414sm519877666b.44.2026.04.22.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:54:32 -0700 (PDT)
Message-ID: <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:54:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
 <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
 <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MyBTYWx0ZWRfX3xBYwY+/hcVj
 kzYqP4dFeII/E5ueGKYkq8h46i52rwx18Fmz8vGomf8bfx0BADW1d7UzRFmCbN1BbFgWgS8E2A3
 Mlzr3EwMa2iIGiCs4oOxggpsjG+vWvCd4IjnYXGrOeVMPrLWGguoIjFJ0ykUnHZ0oKCLAdffAW0
 uYTtdk/d7S7k2GBQIywdGoj4Tm+BMe24dXROxdNpw/3Fkh+GiBHNEfTLWTCFVI73KTy/cUIAjie
 S3oDbSlLUxfq9hkqkCJ69FVoYztVPYOvHldyKJXWISYBnbcGVVS75DTRzGRKIw3BtEyePjE97DW
 Nqbo5oWJf0ewTz7Jbx4mV1sE6B0vXCwcsUnk4tHq4T52yMr35rTvfdJsC6NFTZJr+Fm+vPj4VgA
 ZtP6yqAZHroOjPSiW4xQwjZ6eBKS05zTPCVJP/nFU/voF/MFFka69TDKBYMyHRlVoJ/qmcxk0pD
 QCdXzAOFJB7pHrDv2tA==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e89adb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TPV1Kb3VoT3DjyXF_ZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: LVH9RKyi_HJe7x7ph-yBpDz6ekshij8s
X-Proofpoint-ORIG-GUID: LVH9RKyi_HJe7x7ph-yBpDz6ekshij8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220093

On 4/20/26 4:18 PM, Mahadevan P wrote:
> 
> 
> On 4/19/2026 6:48 PM, Dmitry Baryshkov wrote:
>> On Sun, 19 Apr 2026 at 13:16, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
>>>
>>> The existing DP PHY PLL and AUX configuration for the Glymur platform
>>> does not fully follow the Hardware Programming Guide requirements for
>>> DP over Type-C, which results in DP link bring-up failures.
>>>
>>> Update the DP PHY programming sequence and PLL-related register
>>> settings to align with the latest HPG recommendations. With this
>>> change, DP link training completes successfully on Glymur-based
>>> platforms.
>>>
>>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---

[...]

>>> +       writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>>> +
>>> +       writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
>>
>> Are you saying that we don't need to write 0x4c here in case of the
>> reverse mode? Was that changed and why?
> Yes for glymur it is changed
> DP2_PHY_DP_PHY_PD_CTL
> Normal Orientation: 0x7D for 4lane; 0x75 for 1Lane or 2Lanne
> Flip Orientation: 0x7D for 4Lane; 0x6D for 1Lane or 2Lane


Dmitry asked about the other register - DP_PHY_MODE.

I checked the reg description, and at least for Glymur, BIT(5)
(the difference between 0x4c and 0x5c) says "take bit 4 into
consideration, otherwise let the HW decide". I wonder if we need
to set it at all, for any target.

Konrad
