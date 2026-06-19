Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0B26F288
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883252; cv=none; b=nd+/wrqm1+O6KQTDHsNN5F140lEuxKfBEut8NFfxjghosTvzMtiTGex7eyW9Joki018WbzwBEMwSM8V2pP1XjXf1eqPOvwpIGMlOgHyegQfsy7JyoWnc8YUoNCK+kFerncU3KOOUS69gmRn2l4z0GQjZQ4HClrCIGssYwheNnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883252; c=relaxed/simple;
	bh=Aw8CQzLmxIquRNmWkUPs11YrpLF4MP5WQbcDEG9bDaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhQ8FB8c5oEW3eZ3x/jnITtHfUpd7fe+p/ndlLkjjpERg4yuhTFNNJbPJ1VT3lgNoMVY/LHkLF/wmFkQvpl7HV1F7KSB2xj0e/3naM729GPd6uG0OJjV3ekNVKeBXOfue202/HI2pIzk7o462wgsgj612+ecAhNhAd7h0+S/1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvGkeaJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axaCW0on; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvGkeaJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axaCW0on"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC5hn556705
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=; b=DvGkeaJVRQ8WGpk6
	ItupFaN/am3GZueUSSVLxwoji/3HPQ6BTtcdMKLllRVQCe0tbNxpPT6B1/xSH7AV
	kWtK0GD75tW6qa9kv7PFvod6cJUpTvDBZdc/No1Dud0d7uVVRcfSks6b6jQV39zw
	hRXCmsdY25jT8FEL8lWgN7WbVfuVaMkl9NkTKkt3gAXxFU9rZR713xmJXNyIxHsr
	ytX7keG+0FRc4jRrHBsdiVbW4LrUsDlXzlT2VGFEOtiPzRrIyLfu5ZGUKPadc0QU
	FZfVziEUZ48R9O7kh0XCFCQyap4t45ylF9qwx+OiQIjAZIyawtTs8h6lTOn5E5tH
	8WyagQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuuhdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:34:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so167997137.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883249; x=1782488049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=;
        b=axaCW0onmqEIm+FqBC8OJ9dnmB3wn+9+WKPv4mBn4kO6yfAagLG+AzdYYzhhmlZ2Yb
         6li5qP1VC/a+FYnDWumsmHGsNTl3AEhfGJsz3wfd8kg4pE1Q8Pejm/d9ilmxzuzSRAjh
         0YK7Op/bt5nTKgpeZ03LEBqHuWR8h0THWNl/XhAPWUEJQO4jYQCpdtv0DWJCqz43uCTp
         wP1nGkhoquoV6+somgUirkahBBxxXpcSvWn0uyDBAdLPrvCC9eXt53C4MSYu0mjOMc2+
         POL3QQtdc8eADnm+rMnYpeWt5haOPc2iihQUHtvB8CS345KPH0bnMM1fSFu25lkJFzH9
         BaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883249; x=1782488049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFlLtab+77FS+ycmX0rT0Ax8oRIsV++t3wwXuk+Z/Yc=;
        b=d/7Iw6q0x9hBg/sMkwnpUM4gQgY8Q+5ijefzx3rtZzyMNHsnmLgDjzoWRptZctDnf9
         DpxaMcWs6o+UIDLIfUlSvjqLN/an98On8cJyiia8Wg/oHTrmJPyP+XQ4uPYGX/mG0BVX
         RBTNpr1dX6LztybcWd6BlqkrIVBU9+0Oisv+vUYU0vim0tW7Tcq5oDqrw0YGl6PAadyk
         UPFUwZQBAF8XGDkIPIqiLK0Rw5YqSElR6uOjOazpmUh2875HpxDh6TbuU716RFUmh+8O
         em7YkSybmVK8yAGfUlcFa7awCkZvHHtjGYzMbe3SQwbVtATUDVEASrYg4dH6M5lK+eBh
         R2lA==
X-Forwarded-Encrypted: i=1; AFNElJ8Fs4txeCB3/4wqxKbL+/sE93cNNZUf6AMFGFUbcKPpFnJU2/s3Qn5A1VcBP749SLdIy/UbdrV1wk+g@vger.kernel.org
X-Gm-Message-State: AOJu0YzWODpgsL8wVuFVE1oMpH3cco0tkifZOk4d4oXIaa3QxNYC1aPi
	2A8DXF3xs0ygXP3AS5qco9ni3wpw/j48LFpgbXM+Z9tCsVmZCskUku36I31AWtIAPbVW5xFcxPj
	MwSEdcAdl7qJBRCT7XKFKsc7i0G8XuQwbYPgXRxtCIA7r7dMb+2m1qiWrGZIn4k3+
X-Gm-Gg: AfdE7ckcXx/1MWoaI0J0egO3on5iQOHUoy59ivbdCN4qv6QQbVHXgPrq+8PtNaNL9SO
	1RjOLdPbvvTQBhq1xDB/oxtLEnagb9A1E+xO9hnESppHEQIRbHaurqBHZ75zkeY75RqZ6uABPQp
	bCFJ6AQ4jrUPSUOW/GYB21c5s6BjOda9TNXPkD+6+AfENqp1wSI4J9sdsUyg7/iJqJL+QJ88vJy
	Kv6XdcbD2cLl3xcld6xXikKxBygB3RfK5vjIfbFZc4PpzpJ9rFkfKA0oYryp+VqncOtnoI8voTh
	+IKett8hhGO40oCORIGfQImz78dHJ97G/cl7QiGV7NvwArfGjtzLmq9gV+53CFSMAtdGYvXSGyu
	ShvIGrO5z3+s60KSpvk2UxNDSUM/zobcPFug=
X-Received: by 2002:a05:6102:b0c:b0:727:36b9:dee with SMTP id ada2fe7eead31-72a05233a70mr1159181137.8.1781883249029;
        Fri, 19 Jun 2026 08:34:09 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:727:36b9:dee with SMTP id ada2fe7eead31-72a05233a70mr1159160137.8.1781883248616;
        Fri, 19 Jun 2026 08:34:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cbfesm95830266b.21.2026.06.19.08.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:34:07 -0700 (PDT)
Message-ID: <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:34:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ag_QL5DIo7MxsdYU@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX5jZ72E1Tul84
 Pr+Z2e7Ra7D3SRhb9cRDOmBYsEFC2FhY5ubAVwkh7WNvbcsyQrMIEOeIRZs1s6j63iY7WVlo9cr
 8hMCImfY1nL+BT/aFteJANdbcdva5Qg=
X-Proofpoint-GUID: jodejCwkY0rxEFab_LWMbKhJxmEdMzQr
X-Proofpoint-ORIG-GUID: jodejCwkY0rxEFab_LWMbKhJxmEdMzQr
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a356171 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3UH1jKWRaBeUPcqG0MQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX/gRF/YkkC6S3
 UAdP6Za05BEe0JwEbWTRbFj228Xo8+QVmPBsYpjoya3MeeZa9n5qW82K1HOImxOKW87s5She2RF
 umDDjZhUiiza798jD47AaTktkMQMrMCKpdp595gzTD/8L5y4zzF6Aj54qFZEZSzMYhvNn3tGzmG
 cbRKSWaW9GocFa0z3/qOJHvKAmR09VCtbAMRQpagkUG/PsrIBu0sepSyduWNeNscua9cxFao72+
 H3VcB6s9SXMyMNyK6xxilTEKmObwS9nu562N5WAhJwjLqnVZKa6QjYwEQI+MPmPevT2koal8pE1
 l4VMVYK8nH9I62Q1daW/dNBUhx8qHhaDJYjXDRRp+OupjJZy2LAK4xucmwpI4ayOXlzmt/LPsHS
 pJ9vXftX+AEx0S+zfdvqAdLNt48rqFU/0hQg/2vo8XvFe0jKG+OOQPdmPYjGGrxKca7Ok1Ho8pN
 zanNbpkoQEehGeVInKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

On 5/22/26 5:41 AM, Bjorn Andersson wrote:
> On Wed, Apr 29, 2026 at 12:10:39PM +0530, Mahadevan P wrote:
>> This series enables full 4-lane DisplayPort operation on SC7280/kodiak
>> platforms by wiring up the QMP Combo PHY correctly and consolidating
>> the DP endpoint configuration in the SoC dtsi.
>>
>> Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
>> which is required for the PHY to respond to USB-C Alternate Mode
>> negotiation and switch into 4-lane DP configuration.
>>
>> Patch 2 moves the data-lanes property from individual board files into
>> kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
>> It also removes redundant remote-endpoint and orientation-switch
>> overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
>> are already covered by the SoC dtsi.
>>
>> Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
>> that mode-switch is in place, enabling the full 4-lane DP link.
> 
> Are you sure that herobrine has 4 lanes routed on the PCB?

+Doug any chance you still have schematics for that old boy?

Bjorn, perhaps we could switch to a model where we define the max
capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
them as necessary? Not meeting these is borderline a board defect anyway

Konrad
