Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266EF3955EE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692077; cv=none; b=rWa88HsANdFMetlw/om2utdTp2hSRmQ1dPa3YFjEvDC7WCNnpPXApENeqsUszJgXDO20qG65ST7FXEawIGDSrJV2JDd3vzF9+6Lv1s4GwaeTdVaIDpCo+jsc3FF3GQd0GV1qk+ZmxZZW8yNcQjy76y+XjgyiemM+7ytRaszu2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692077; c=relaxed/simple;
	bh=uMFJq4ZfbSMiOOut+gyzl37CUpNR1s0UWSEpTtKaan8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaM5qDq/L1g8k9R5UCyJmBUbeNAYH5hxjFVk5CBqZpBvwAhSMj2zTvkILxW8/PSe259H2dDq2GDYX8QQgGUV+2cMGo/HrTElEsScqQweOxOHBvO4Zj/QWDEXYvva2V17woBFudJQ6JNFU90R09slSzGsVgck4OxZmAus7DvKb7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H61fpqMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV6qjScm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H61fpqMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV6qjScm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ub033274624
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=; b=H61fpqMUPAiacihk
	vSK8hneo9JCINKDxRQR13E6o7nSCgLfOPp8pFM7jZZhSXTh0MlpDK38UCopXquqm
	zprb8sDK5BLrQTzMaxtod3nOMPiWNaly6LJR55UDUVx9C1R5ti4eIl5ocl/ltple
	vq38JCkQOKpk178ObKfw6H5hztyV+ji6UtPXlL1K7PJwNrjQDQquqWuzxRlAxpzm
	5O+Mcd2NOW3uyQXNAppSmjmDMFf9IISwfyM8M2LhWmRpHTSbrqhQaAAN/Na6ZE5p
	nOr8lesxFfcVxyvtpJpO9Wqt1O4QPJxTj4CmyWxir+HcWrliBc7GS2kpZw5TVwQA
	5tY95w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtmym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:27:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8db6d4f1906so2534746d6.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692074; x=1782296874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=;
        b=FV6qjScmmHLVZaKBmqcS1Dmo7Oy3DUrGo8Y8sDkYwNG1yElVDSqYmU4R3MgkH82e7f
         2wbuNObXDOuOLAzH1FTIsiq3G71OXTHNwIlgHJqGlNAWbnkT4XxNAxYZE9l7Qxml4mDt
         ZIJfoHvqEstuuDuVre4vn/a/r08scaWgcm9F0BH1LAw9DAMqRGw7h+0RXfYefc400tWk
         0Hv2F/ANmIc9d9OyVuWp6WHLPQ+zInjq+DOrZY5ADBc5l1G1J3AGEoFG7SAVjENJ6hTl
         PCT8jbGcpeLscLbIJDfvd3850MH+yJhF9f1zHKERrv24sy4nOE/D4e+JX73gzYsQ9/b4
         LwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692074; x=1782296874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=;
        b=YMW7J36b+5FbbuZIz0JBFGN0avWmTNrG84MZwLiWZUPai25QreT9w7g8eHjyvLtg3+
         KvgPfNKSjY+XM2luAKhj6W5Og6HMTLq9FyGhgzL5VCrxsvGEy7UdP7gWW4qdzE6n1Fbw
         UQ8riTy9WpkdT6Zb7SRcQaFUinW5KHorPVv2JSmAv3+vVHIH8YVzxQP39kHHibFAC7si
         XBZnSg3Ao1M/zQtxRkGBebF2XYMvgEdljKINMwVD2c4BtPzoDbuQWNVrxcdi1kRQ/QBw
         T31gFGMZgj4DOpm8QLz+c+Pl7rUOeTk1p4w7KuTF7YiIcckdzo55YiKINCQAw1XUZgEG
         +ZnA==
X-Forwarded-Encrypted: i=1; AFNElJ+jinkHcWqSk+xGPz3VqvgJI0XMLvLAN1NTJYbMGyIP6gBGDSAKTTV/iynNd5c3U4XG857RIZqGIP2w@vger.kernel.org
X-Gm-Message-State: AOJu0YwFHNjolNbWncNyVDf+0T6VnxxQtM283WhhYCY2eECy4Tu0QZD0
	Q49lz1GX15IbHb45df1ezgedIp3S1djEyblsf6ooXexNBsIjgOOB20wzjwXGtdsmtIM9Gxi99Iv
	Fx7lEkjdAe36UhMBV2z4aNmOIeQkZ8mbaz3pqF1pmmcb7bX3Im/uWb77Sod85ujN+
X-Gm-Gg: Acq92OHWiHujkwden/zHuPhDRowoJBm8dDSp5OxQBBKm8eo4Afzy/BYkdf0emnvwGQ9
	TqatVGjHFzVVvVouUWGCxcdaLJAUog7LK/tJZhOgB96kUeKwqu2rWg+yx0GLD8WmTmiXA3Ptc95
	ZSQO4zS7NB+rFQ4YSf/MzH97nf8T4eWnx5E1YU1jKha9UpmAKJBPjkLduk9lj0S/i6MkJzfSKQA
	zjtgjXYBr3JQycmY4Iz4iwLgpypbZ1vQvOHyJ+MFBvx/JAtUnO12tXQgvDcjwGNWe5mqjHLS/MF
	S5u9CpUmzdY6+TU+cTu9Dk2LDHiJj3u/pMmyfgnkPNrjFJ88F7b0h6dWtwaJQWZQqLzJC/QB1QH
	IMVSz9HIHxy5t9UeK6KL/2tavexxqBudxU+0=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr244707685a.5.1781692074349;
        Wed, 17 Jun 2026 03:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr244705885a.5.1781692073900;
        Wed, 17 Jun 2026 03:27:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb844060csm762333866b.46.2026.06.17.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:27:53 -0700 (PDT)
Message-ID: <95ac1f08-b381-45bc-9834-18fd1e02dbb1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:27:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
 <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g25Fg-LmiTB-Gxk-RQdPUZoDZadGoOFh
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a3276ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1GqaFQT7NjLpQ7b0YJkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfXypFQWrQSZap/
 sCDYYYOpQvBpWujT27tMTQu6gdniNt4w2zPnW67qisGov4kaCTO5Z4ZVuNzEpaTINyxDIiOfkxO
 VokoyHkoPoKrRYUytS8fFqwoERYaej8=
X-Proofpoint-ORIG-GUID: g25Fg-LmiTB-Gxk-RQdPUZoDZadGoOFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfX1tqd119bH6SU
 EUzze7Y83VRABTLKMxJ7UetupZt6uFUBXVXAKUXt5OEFF785quK0zjeo0gDnbANXJpbixyoHAfu
 Lhwi2WI5PeK8rXCr6pJTvZbYR/SloFXj6zB4w6/CaR3f01sc4xLKBUkBluPbJ5rbPUhmpu2bDtj
 M5i2gvBV5FCelz3YtqbCpeLpyTihjlZfXgVoQ4r1kUvhrlV8+ac3fIOc1O158IFcchZDEYhW3Ty
 mrTtO9u5uU/FZOHhqPtr+pyEp8fiZ0Xt1l8AjiuFvNHhKtxiY01qFZjJw6VXnz6lCfhb4/02P3b
 Ax+74PMD9jKeVjFLRq2z7NQAf9H9d27g2IflZ7A5Ai1jSoPYHlibWuEdrJyoN87CUdtVKarlN+E
 ZU0n1M1zZRYI/L24ZKmQWSmJzqe+EkrXoex1o4P9CLUSiU/muA8E0xPpsir4fUQurp6xDHjnoq0
 CKd+qvfu/SfBdYlRahg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170098

On 6/11/26 7:24 PM, Mukesh Ojha wrote:
> On Thu, Jun 11, 2026 at 01:45:53PM +0200, Konrad Dybcio wrote:
>> On 5/22/26 9:49 PM, Mukesh Ojha wrote:
>>> On most Qualcomm SoCs where minidump is supported, a word in always-on
>>> SRAM is shared between the kernel and boot firmware. Before DDR is
>>> initialised on the warm reset following a crash, firmware reads this
>>> word to decide if minidump is enabled and collect a minidump and where
>>> to deliver it (USB upload to a host, or save to local storage).
>>>
>>> The SRAM region is described by a 'sram' phandle on the SCM DT node.
>>> If the property is absent the feature is silently disabled, keeping
>>> existing SoCs unaffected.
>>>
>>> Expose a 'minidump_dest' module parameter (default: usb) so the user can
>>> select the destination. Only the string names "usb" or "storage" are
>>> acceptable values.
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
>>> +		if (sysfs_streq(val, minidump_dest_map[i].name))
>>
>> I'm not sure about sysfs_streq() specifically, but otherwise this lgtm
> 
> It is used in quite a few places for the same purpose. Am I missing something?

Seems like some go left, some go right

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
