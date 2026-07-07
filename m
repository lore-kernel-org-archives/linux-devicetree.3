Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29924386426
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402817; cv=none; b=bYMatjl91pUaKjyJFQTcy5nDZ3aEfIsTsqJ4GHMImlrQeNVWkjyo3pVMODi0q1FYw8SdkRt/gTUfHLJmffnbHjadVNsFrSXYaYrEvsxy8BFtdCNJyAZHp3ehGNBj0Fh6dbk0eDOq1GS1v7Gwq4ArT5uvD3yp/8vLcO62cT1RZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402817; c=relaxed/simple;
	bh=n+m+WGrSXjSisXtKmhqmlHLjEHZOILl3o8Bjfpc/hiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKfoYCm4RHYPbRTyNDoGDluTpLw5Z51JvQUBSDfyNuLD9AotxSkV4DQEKnupzGvRzsbeW4HKAIq7FTD6ntGosyQyGIaUQb32BByQZYwirzB3a0LwBqlsZ5eh23pmh5Am6nXyRU3WUvEF1ZNZ/5b3Aa5iiuerfvPgwuI993Wr3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUWnDpcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzWnmxqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUWnDpcs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzWnmxqm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674955a2526304
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=; b=bUWnDpcswnxLNApa
	PUSIJ7I1FGtbNZhqlAs2QI+vROlMS5snVpQ52eKy/wtSvQOvIUic0pYpVtsjGmCj
	R0rGUSH6ngVvaijeQ931c3DYSA9kMdNdcLh0dLsML3HNoDj7C7kSI9GVVg5NwKDh
	GE90lNml0nzKvt27GjXxJpZiqMWJQNLsbbAowIRC4M36pe5Fz45XmPfPfEV2dMpd
	WmbYEuRMoojuaefDYaxwHgTjB3NtCnGV8Ng/RjBjvocPA9QrSQhIKV7JE5jDYLje
	H9OWqQaDOiQf6OCzG7ieLTRZ//hvdryWjpJ3WNZ4rBM/MRV9OgjqQ5mzDi1BFWUz
	aAtEtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98m6m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:40:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso2414130a91.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402815; x=1784007615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=;
        b=TzWnmxqmf0s7vZBas+VC78+aAC5asIcVzGPqPKvEPV58MqoxWXNBd/WXoIJjXcd//T
         dJm8QCNbd6CGby6ezIU2qN41TwT9Z8W+DncMM2ipdnd1PjXxnohwnLySx8xyGurKDoSU
         k9JhkmDx7feNY7rVaaOWU6toQGpZxWpJ3xCZAIHzNxx2D8iZl/QN3hCtlof+4ic2eI3u
         ximSXrUMB76EeqyyZJY7HLHnoa4Ntd3G/fjiqW3UEg9le2KEVsyGd69hNaG0XOXma+CJ
         oUJ+Sn6tL+3Zyf4OWTuwmMGSZHyoADVGDWDC9FP5F5EhdILs3vL+XOihKnKV0AHkv41S
         giBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402815; x=1784007615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhP3fYK+aJLFo/yxK3ki9QBFiA0G/X1T4yRKAQjIIXE=;
        b=rde+84IfnZP2QP4cTmFce2TAspLSleUvB+rXm7oT6sdiY+pQsIE2CJjTMkoHTY/LHo
         IYInmabK1V1k5loN8TdI/g1fYTEKSPioPvV8H1sRj2VWScpDk6s4XhBeXYLFM+mWN70T
         6gbwGQoQ2wFQ+4S0ZuCU4yBBg0hE84sMFschOoumyNfIf6Rp0aqlujDXWof4oRnDOzCN
         Qip3p184zz0WWSEPkz1p0auwjRo53iE7QXMUZE3PTLNqpFL1U8GETe6i0H+/UxZKKGeK
         2tbU6vJUVvS9bmWlttOV9JE0yP0BitspjR5CLrXv8smcxEvvKrVVXtKX27whyL0QNjD8
         8Bsg==
X-Forwarded-Encrypted: i=1; AHgh+Rqc6O31TeK442KzVpbbe9AjH7eoUgKo69lBI6F+5xfm2N58u9Ed333skMMHEC7Q6rf6h97PAvvCYPE1@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHH4vMtsHMp8o3x8/Uv43b41KM3Km0MLp0baYHrbcoSyKiAN3
	84KQxTj4kY0kB1RQsOTlVicq8wNiqDq79TEhuwKmHyujWkQysZBXUts3ex1T7guu2XhenOQW3EA
	N1jd4JqByOxP3hzVpL9gyUW7GfsBv4YpNtTddwuq1aM6HqOC/vIj9XCl0J4mKzfhq
X-Gm-Gg: AfdE7cnvy7W1ZaUA0YH2YX8Bj4VpX9BlpG3MmY8nY56HlxE+Z/8yAS3txmUYcUzd6zK
	9olFWPt4LwDVoZbDjsQOlpMnaprZqm1S7aQx2R+itYoTc3LSteLB+6RFGH4b7FHRW6vKca9GNTk
	v22P05dfn2rb52ZmiEpQSv8uvOWUZmm1TclDjRdEwFzSrddRT6si1v85D/LOy1AtHMyL8EmQpV6
	2aGcDdJjfaRRwxh3NwcKxLpDMZi81W8vXsJ4MW1Er/djMribNnymjunw2xDMNaD3oRrpE6F9v7d
	8E8qbpONqIyY4uBrN7sU2hCQQsZI2L0T8CIUOyZa9ZEvv45lksk3t5Nm6ibFLE5HMEGYqTRB11k
	RtKU+rRHIpIhvx6R2eub80jz1YmAP2T9W51dxKUz+L7HyxUOkOf9x59JECxO/Rr0RGFnOM3ae4J
	GE1Au7
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-387e0bb5ba9mr1259361a91.38.1783402814799;
        Mon, 06 Jul 2026 22:40:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-387e0bb5ba9mr1259321a91.38.1783402814249;
        Mon, 06 Jul 2026 22:40:14 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b413sm451809a91.2.2026.07.06.22.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:40:13 -0700 (PDT)
Message-ID: <ab1cce3f-4066-413e-bcdb-13e89a03932d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:10:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] PCI/pwrctrl: tc9563: Add API to control endpoint
 power and reset
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192838.GA223662@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192838.GA223662@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c913f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=153GEgVumq_bsj_kQ94A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX2+H33tvK6/3F
 8sKAa95dGs9LfndRjAFRX0k84fLwWrvYDr3414yl3k86rmKr09JP8O3HI6i3N4PglYqaTKOmH/k
 P3hI48EDKDVVZK9lpLg36ZI9pRbHpSRr/VSJMZz4aUGCEoSUuQPvML2PaSSo0Ep1LNiQsepuDMw
 RqxnktgVjFKovCnzIVBziUcgEwzJV1g3JBzwusUaFlfiquiz3JLynK4bZnu/K81fq3Qs9Itxolj
 EIv2+V3x9Q45LSZcC49YkJPA1HwI0QRADmSi1dcLwWztIu8fUnH1/e5T2JxpCQN5arEpnTuRIf7
 z+f+ssylbp4bm++p0KN7BRqksFZkGy21UJzAl4hBUt0M2dmbhq1kTlIxMrPjU1oD1chAjZ6PJiw
 gRcBfhMEZaO7uJ3fzXYZpHUGTj33JAgYc9dpxxtvfsMNhoHqaqrPbz7Il5X4ArGS0Vx1FoyAn0C
 iYhsZnsNHJMmVKQqP5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX1odSo4RjqjG1
 vxL4kJJHGDM6Gpd/ucd4H5+l3wP1Hpxg3Uel1ei/+STpfXQwX0gK7g6nYctJSL/s1nYKv69djWG
 taLUTxkrUZWM1S6m61JI9U59px9d5NY=
X-Proofpoint-GUID: Vl0pHC3HRcUKNkP6iazyeffS8zbTSQq0
X-Proofpoint-ORIG-GUID: Vl0pHC3HRcUKNkP6iazyeffS8zbTSQq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051


On 7/1/2026 12:58 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:48AM +0530, Sushrut Shree Trivedi wrote:
>> Some platform utilise TC9563 GPIOs to enable power and
>> control reset of endpoints.
>>
>> This patch adds support to parse endpoint reset and power enable
>> gpios from each TC9563 port node in the devicetree. To configure
>> these GPIO's during the POWER ON sequence, two new API's are
>> introduced: tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset().
> s/Some platform utilise/Some platforms utilise/
> s/This patch adds/Add/
> s/gpios/GPIOs/
>
>    Add tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset() to
>    configure these GPIOs during the power-on sequence.
>
> Wrap to fill 75 columns.

ACK'd.

Sushrut

