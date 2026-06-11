Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5553DE440
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176661; cv=none; b=rSy8QItRrgfMQJjqlCuc4kzq72sgJu1xshinFJiTqqZ0tQ85KqwXsgYGe02cAf3iIEDQNaJ+sfvc8YMRotNqquzwnukmaSTflQbRwMOeSUsFug8ELaQGefLLMZ7TEVa3WMIOjbDDGfid9EVnStEFXtEiVcJjyUjWxw4NvsB1b34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176661; c=relaxed/simple;
	bh=1pifwWWb17dbidWTWH+BgP3O4ayaax1Q8L+I/6p3Y+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgyK1rTkcVXds3PyTy5QPoApwtrUBWL5laAnREFuEMqd4KVW97S52VNkxet2lulZUXFxldW0mET5GjpqKsOwpDnyTJX066YKsMyhgi0Qc67GEBMxxER3gm5w7OCVh7xxDbdYM/SfD60TI5ZVOLyUtn60hLbWGl3wOJyo/FUiYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzS1JlYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPbH/0rw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzS1JlYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPbH/0rw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1nAd271411
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br+nxqdNrndGB7+BxtsLhbcmDeid+9MpBuzSC8ZBMIQ=; b=JzS1JlYqcRhhO2rJ
	fvo8A/c8gBMc/GjNMGoCnwTztoDs5nAYtpWxfIPcK2VsT6nMuBvDx18OSDxlQWNo
	YUBtn7ePDnprqmQehabv6Qp5I37OhZiaIXp8Js+IDvPTw5+e4qBIWv783k+QSwZE
	HdLZ5yX9luMygNeiHgcPQnJV0049HF2/8uv3vaWvJmP55ce45DoSvUHL+a29CFH8
	cWrSMSqBShw1netZbTbVszk5pfgSubO5aj9zMBKpXcnT4dFXYv+NdIDfRUmLfXDe
	fUTAIVaG9Dpu2IMjXFk2SM0ohdGNLBchK/LCc27OfW/38eaaF4g2ObEM24XKgiTo
	/ioFyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71k73u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:17:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51759082206so23327091cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176658; x=1781781458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Br+nxqdNrndGB7+BxtsLhbcmDeid+9MpBuzSC8ZBMIQ=;
        b=hPbH/0rwVG7w6OkHWF+7IEnaS7HxLVNJsZ3CHhSZAvup4HOjMTt5rGL7GTfT52mAHd
         8nVBEJzjvvH4rnTyjuMCZR/pPXneD0+EW3OeHH4QEbJ1jTXqjYBBFxXWifx5HViirOVL
         PEfBgk/9qyBGiqcWsXQb5m8bNa8EO2M/Qo+5kCtzbaXji1Ajqbw8wDDqFWJMpfIl1aEN
         pMZJKcOQetsGAPVuYFH0DHzKa7C1sqBnSWssXnmNCSEu6A3WT4XoI5cfJwf5VUayxbDp
         w+Q67cBtHKzGpDFEVJBavEae0Xkf1WyKr9pG+/l7hWPxmdIQ5ZklmwKZ8hjJLI0OoXSC
         2aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176658; x=1781781458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br+nxqdNrndGB7+BxtsLhbcmDeid+9MpBuzSC8ZBMIQ=;
        b=Bwd7tqBX3Y3bbmTDA0kK3dpKivhLIvmVzkrufTpbEXwqFOMeG3khRRYTZL0VnBUN9s
         B8TPWyt4VZktEtS9GA4WAlkfHuOX5ZAdpLH9wpYpGseETKfENYfQ7Zewb9HTtUsES00A
         KlkDMZUULzuaDMgcQNVtv2/oh0C+uhOaSXgiheJ8Z28y7crsEKWOupzFQo2XWsTVGZA8
         NnUK+3Q6lBGfr+ab6B5eFDeJFQSZ7Y1uFDDqyCIjMufguvXGVIpetaBODH+VB3AvUkk4
         YoKDr4YMqZG/Y1Xx2Ycu7U2JU5cpGoeMV/Jaypf3ksBFa8RRibHIBoQpJosFRXO2EKba
         /r1g==
X-Forwarded-Encrypted: i=1; AFNElJ/33mgzNiyK0DEgYGRXHvFKkITtlgF/ixWjtQ1ZTqgDEgU0mylETNT+r7DaTwP1nRZps5/iRTGlWCQi@vger.kernel.org
X-Gm-Message-State: AOJu0YxujLU9KC5sbq/xCqGufAMgkFkMMTeuN8a1cY7kK3CYLoqb2MCE
	Nt7ZEo0s8Ix0JfYYuxr9jVprTLiMv+l0/iz/tznnC3+460i05eqSEJEo5zLSlhGe8UUqzkG4zfT
	Sb0zZF899ke9Cw/5mqRUR3YXo3sN5yktvt+YdnxkFyfIQDf5v24ZB4la217n4kl4a
X-Gm-Gg: Acq92OFKUefpEU9K1WHt+r8ZwgwpdqBKPhOw/eGoISXqB2Sl9VCWm3543kXh3/TDp5f
	H+vsNyplhlYMMQ/fFtGEKWmu0FUb4vEwsoHRU7dqp3QY9Xtb2p+kkfV4Kc0Gm0BqXwLClXnUGX1
	wixZCVbN8SVu2Akw6g2pipQALC/uj/NmACfPqzPkRHeWylX4g0Cp8+QLItFLyKSO03CmKx0Ge5o
	lA36/+7KXu0X4o6zh8zQSnivFJ41viyMt0mds7QDDQJQ9oLYH4zpy0Mk37eaF6WqA2AOZeNb/8Z
	mnjTGt8pzCgMIEGlg5l8LQSt8vjP9PsYu9JElS/yQ3bVXRCxW7bOkpm9hExyZpY1RYNoHHaFbjK
	dJ3Ochzcx5eTLPu+u/MEW+7B5tINeAsRqsmC2OfT3ZDyAQqsEXoygShvB
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr22659461cf.2.1781176658103;
        Thu, 11 Jun 2026 04:17:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr22658951cf.2.1781176657518;
        Thu, 11 Jun 2026 04:17:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb688410csm50029866b.61.2026.06.11.04.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:17:36 -0700 (PDT)
Message-ID: <f919e897-c465-493a-a1df-01921e9e273a@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:17:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
To: Paolo Abeni <pabeni@redhat.com>, george.moussalem@outlook.com,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
 <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
 <3d0f0b12-9bec-42b2-b8e8-264c6da0fbae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3d0f0b12-9bec-42b2-b8e8-264c6da0fbae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1RFpLzR3lywIkm5UtDtqLMhTqfCq16IZ
X-Proofpoint-GUID: 1RFpLzR3lywIkm5UtDtqLMhTqfCq16IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX5af1E87a7kW3
 14r56+mxUfDlu4DeA2k8nWeHTmTUTIp9Enka9km+Ts5OYqtRqmxPM6GsyXF/0L7VGR88BqgBr+h
 V0Z4bSNraTNQdhJ8rzCy+k5fxTblrBifx61g5j5TkvYnTLV6wsJE6M2+JOMc/QUo/EU5a4UEMwW
 VN+TiYHB75xcxh14vhTNPZgkAVo5sPdjjqdwEo4mZQ+f/yXe0xlXQ2DBsDNWgakzwGwBEXM0iPH
 A2TE6VhnOCBfNBt9WjrrTDwefK4NWwTMKmSNi9S6sJzV7MvFd5FAlo/1VL5Egw1Er25fRuNeKAl
 HsPifgeqN6zByO96kUZmvf7RnogdMXNBiwdjaqhuh/fHU+MpoECVBaI0p2ApoGIs3C5UQifQjnA
 Fx3fTizNfJ6maE6wkIzIEIa2J4asLch3EZVmWOuS1osBo1Yt0OHMm2yXEjVgCaF+eqUNVhvf3tE
 /dD/vX19V0dDPwnoDew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX+C+XGjzi0fn4
 739B0akQFgpVCFPNas2QClz4ZEBfkm1eboCMdseb7/5M/7Cn2MYGApBm+/cDWiNeuKCogvn5oKA
 3oxe+LOHwsgEnk8fFumRn9ApUtWeCV4=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a9952 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=qu9RNVSyyiXgUSAWbcIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113

On 6/11/26 1:17 PM, Konrad Dybcio wrote:
> On 6/11/26 11:28 AM, Paolo Abeni wrote:
>> On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
>>>
>>> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>
>> I think here we need an explicit ack from arm people to take this patch
>> (and the whole series).
> 
> This one should go through the qcom tree

this one = this single dts patch

Konrad
