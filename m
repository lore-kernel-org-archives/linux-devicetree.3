Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E01409DF3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107375; cv=none; b=amKGNIA14cNCrHJuS0OrzrQlU67lm/uRrlHhp+h+5iNwOBaYzsLVVz6dhAB41F2bfbMv+lXsh8ywc6ZzHngNOoxb29uZcauHhZ/o/L5SvHQdvL+j3LisXQLhQbHbBpkqW8Mu8M0Io19WDNrw5pDIwdpuIj98wq6LnbQevz2s55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107375; c=relaxed/simple;
	bh=mxwIyObiYLew+RMD9ef6gvDp0rgNv4b1gNPBeecnPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHKTofroFdrdj5ngfOcz76+02mHNS8NDJYKbCleCgDaH+kBkQxoeQVUszlQchpFRGSnGNoW7jjhY/wvgj/WYPskAG/lqEGsVZywdgLb+HfTyyE+Ax7M9fm7ifWe5xDRScEwdEAl8XRRjYJ3nRRDrHnnoPpFh/YkRGqX43slXJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alJFwTo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/wM2dGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alJFwTo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/wM2dGf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBvvhZ1250850
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=; b=alJFwTo6NVa2ATAt
	/9Eft3cm/JnKwJ8f/SMJrf1CNfuibVm2lKneT78PVKgsDRKq7nv8c931Ro+EAABO
	aX61g/Y6s0GA7xbp8R+jVJmv0Q18qRHQc7nEuS/wHJV+f8t007FUImmpX4Rm54Si
	HX3svna9SZz7O39GLyA7Suz/YBk1wpQMqCPo0fRlZkMxXls9Las5anmk3DzsXEHo
	6Cd3UVbG4S4882yhlSZQ5u/QDFogiY4RMYhyhezzTgf3ifN4+heMOqqfSNBGQQxv
	EYMihVO+2HAvz+dQGfJxYb0e7cCplOHNpuTCooPS141VUXyFjlBbumknwAPNDPq2
	qaTbqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0g41p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:29:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso6233461cf.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779107371; x=1779712171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=;
        b=Y/wM2dGfcOp+luJgH725KgShVyQ64wQq30znD4yJBsmJw4puohMdWpuHseLNQNB0hc
         E6eDN4pfDWoWBUu4ZFTUe5qDxT+teO6iTGA0/hCxpZMhJ2w5XLN5WS8KjTL2opC7P5WA
         K14GH41xSqQ+aVn8UhVSXrhgwdmU+N6KjqEV65uNf6Ygh0z0n2QO5puktz8LSEzeYV3x
         ocfZhaq6VPR7f00pP8j9k0mX8RD5hebVn38EQvoJ6oxO9jcmMCA+FY6de10JXdPfdxys
         UVCuFAGgZ+dFzK5k6tQooi/2Llpb7amBym53rzBrbxPqzAzjQH9s4CSk+gDc8aZF+P3M
         hL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107371; x=1779712171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qMqCNm653oTP1Mjr92eilD58HXRrBj1IgwnDZQjmEA=;
        b=OBw34S2kbLRiiwQeISoHwgT4C42pSKy4o1/I6JtFblKaql9bk5fCdBdyufnmTAr3Ep
         IKnnYmy5dWgs/rAbQYJ+DmdJbJuxg/iwijyZx/rMd1ncYtNgbCFlmdJTMutDqZZWpI1p
         29bijv9en8ht2H1zY0cnNnf9tBFxHh33tlIQIrSbnBKmC+bYmFWbL52fs0fxJRT2AaKT
         WHIWpoOfXijvYaUg9+Sw/AUysSuDzuUKp/obl0+HgsgrO0HCgZ65RFJPpsxS/iZDA5Ce
         LH7YDqw3nj+l5RZEurnPb7qFedmq278/eEp9oLUc5smrfQPQZsi+gHmV45CUWkiyhddf
         Rm3w==
X-Forwarded-Encrypted: i=1; AFNElJ9z9n6fYAJQas9UA2KtNMs+X1FwEKGAWLZtArj0oRev4twHwOWYt0q70K8At51U3TjKgyflg7bcyzo2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy63PzCZ/j5gUkIbmw+7LPRyzONkOhJlqBO36Gqk4WQQNny/SD
	mEnsaPU6sKxO4REmmKkZqPfFLGvwEEXFqenKh2ljksRs9JjYwrAY1UJG6dC80l4nLQk3ogBat8D
	FoC0pIGLmO5/IgUJtNDAYovjzXDk33+BlCs0m42uQz72rtoRrC8ubVjFJ0KBEuOS/
X-Gm-Gg: Acq92OEqwlKmRe/p+WwCgioRKnj1xyglUF3wC0P0/LlyQSmOiCZkbtnY0RqX9m78VdU
	rZIYQ+P7BSt9iyphGezaOCr//S25sRRgSM6habXFHf3oEJSa8u8DMnlRADgH+ImOq8DjgMsihBF
	j+jTDVvpw9AHAGrOUCy4Hx7sJK5b2+kIGvYRptu5t1TSGO/paLdUM6heoF/vrfZEmRdB/MVQEt8
	ifAJqtJQBbHfMiboOr3y9aaKfaBmoNurrfJxNmMro06gneseTbx0mF5MQ/N7r/FUnq91txfHi8Y
	GVyJ309uRqEnHyqVPRkcqRKGyspYBxNZpmCib5iCzJ6YRbvsTBtVqJ4lV3/TqpgST1kbGnG3dlN
	1smx8l9XhrZtXrJBP7Y5PV9Y8RLduVFp87etPhjb2xQLT8bRqeDGJipvv9fTo3AoRf3DobKlhVr
	kYVD0=
X-Received: by 2002:a05:622a:4a83:b0:50b:2875:5782 with SMTP id d75a77b69052e-5165a1fd8a2mr128534771cf.6.1779107371249;
        Mon, 18 May 2026 05:29:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:50b:2875:5782 with SMTP id d75a77b69052e-5165a1fd8a2mr128534561cf.6.1779107370774;
        Mon, 18 May 2026 05:29:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c41c1sm11469281fa.12.2026.05.18.05.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:29:29 -0700 (PDT)
Message-ID: <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
Date: Mon, 18 May 2026 14:29:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
 <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyMSBTYWx0ZWRfX4/Lm/jzzxr1P
 yJz2O88zF800EjhM44Q7b8sGL6l/lP6HX69qvEK632D9FBCFYWzHeHRaX68DQkYwR6ixj6MUn7b
 K6k8fNxMSnK2uBtHomzVSHuCoJ9tH+i/i4Vqdn3EDgP/zAqnlxL0luCnHXTLmll9v7Lyxcn+cBP
 5IFVoTBKhiul4ZBoAFRMAV5uuU3pn0TMdNsS7y8GW6FV4RipOAhEXW+sXy0n/1enICsDlhUp864
 XjOl27ZA3b0GqYdETw4TMqI4ny2DxRrtFb+mVrY93ODt36lHfdmZ3XNhKliDd2SsrFOFmhVot+4
 k5WLfj644BuvHoIrAju4Ixx+9AhbZNwJsPzHrYKzhzrH+5pftaybxz2xIVSkIeAFfqRoYIeaDDO
 18+y48JDdZcFOCPtsU8w5UorglADzTxLGQ9K1PmYBxKY+tIxJ2jvBJd8fFAxnRqMWTnG/zjp1LB
 piyb6NgnYZvgNUUC+ag==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b062c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pDKt1SVvtQUJ41h8LzoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Osq8QeKX20o6dIkE8HrjwjonvvzQ6NR0
X-Proofpoint-ORIG-GUID: Osq8QeKX20o6dIkE8HrjwjonvvzQ6NR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180121

On 5/18/26 2:25 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
>> configuration. Define a new phy_mode for them.
>>
>> Currently, USB4 and TBT3 are defined as submodes, because they're quite
>> distinct, most visibly in the electrical/analog aspects (slightly
>> different frequencies, timings, etc.). This results in a need to make
>> the PHY aware of the actual mode needed (at least in the Qualcomm
>> implementation, but I believe that'll be a general need).
>>
>> Newer versions of TBT are basically supersets of USB4 with higher
>> host-side requirements, so these are not defined. This can always be
>> changed as necessary.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
>>  include/linux/phy/phy.h     |  2 ++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
>> new file mode 100644
>> index 000000000000..5f48059814e1
>> --- /dev/null
>> +++ b/include/linux/phy/phy-tbt.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __PHY_TBT_H_
>> +#define __PHY_TBT_H_
>> +
>> +enum tbt_phy_submode {
>> +	PHY_SUBMODE_TBT3,
>> +	PHY_SUBMODE_USB4,
> 
> Do we need TBT2 as a separate submode?

I would like to avoid extending that unless there's a user for it

Konrad
