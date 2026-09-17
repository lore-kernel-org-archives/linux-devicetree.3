Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A15221E1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651230; cv=none; b=uVzJeRlxn/WCmsDhK8HPvOYsVvTAIbOQkU/hGDM7GI2iP00K+Q8DZ8+RBfSCVMI8hSUXqKKWD4eI6f5u06iZhyWVu+IujQeCytIpnPtXZv7qGWC2nZuetBW49AQKJfcTlhmHkGfAFPlfbGdX+svVqx/w60RE9+EPmb1QKUP5FeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651230; c=relaxed/simple;
	bh=g0OKgrYQTDfjAAm4doBDR1j3Gm6aoztZ1YM4rmFwJ9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IeCZaXx9vv9LJ/pPiE9yhwndqVyUBUlWUVcravlse4Kyqdk25v4OauZ/wj/bUF3R1/qc7OBuNj+47WwP+Vl5eJsGxkSdJvpQaevj2KLKpwuRb21Jm09c3teML5Jl/G2/Aqh33vrx9X2OBO7kbDskO5OIB8+4xbEsUyvbj+orpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZfXe/8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXwrMEdz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZfXe/8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXwrMEdz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrVu1863447
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=; b=hZfXe/8Ytpnhn+ah
	Ql6guasgef1znqZW/1iwQEzbPLrE//iJXRq11c6xUwx5Wgahrveh+djCFsIRmCRh
	e9ULl3ew9/jlxSDfbKxMTai8/PxiHt1a8gw0QHZMVv8C0Gq4fynVrjUqHl8b07Tz
	/p6ynTD0xFTozw7cgHrNnvqBW+QXAri8G73pSARTBqENwoCRybqZTqRzbet30EbF
	soBuodYzs3vgydYrkGalNfUee4fyqO5SkIEIsNFdPlS4XDqKKWPso2l//0oIsRBa
	EL5qvOaryS/CoEggersHh1c8B96MAssrSlr37FGEgfTxUgRXXBOo2ww6j+3ge9eT
	URNovg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6avdbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:20:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3734d06dso17135525ad.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651226; x=1790256026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=LXwrMEdzHBG/zP2TJLQUxvYVuNTAjoymC4d2pasyZYWVqIz/0C2mIRNmOgtyQmx2j9
         vcH8NU5P9pvmR7PVymfW4D5V7FeJ6BMR3kN1smhdQWSmVBG8nWXXhlIaKZMwiEfFu2e7
         9ibCSqnb9UCSE1u/Xvb+SIeAlHDxNVve0nEQF/vOMruRUAPsKYUuiTH4DmHtG1JDnhL2
         3Ox6JJXGEuGkic82/e5wFEXdQb4QSP3JcqeBW1EEmn50iDoEd5PeoXe+Mi5VHySy++1B
         tYyuCrIZBG3x54Zy356+cQob/CmFeRWnOZg18IX4D2Xd7gOnyQfefEtc/jSn02/qqAYM
         jh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651226; x=1790256026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFzXwc6OFZ9D0gNa1dZ6NC7d1osGJKK/kTRItTaXxZs=;
        b=xoEB/NRI+BrgUS7aqvqounv6bg+jPx6AmNq1bcSs+Sw/wUYBjUQn0wgMlvuYDhrBLD
         +qR7kFEIWDun+oEXk0YE1LZMYJaEkd3AYAQkFnYKA3rKR3o2RhHIT9xR68mBO/t+lzM5
         kG0d9oE+rH+QTwn62HoAZCPTV6yCMzbU6oKsN6yv/skY+CRfU0qvi5X4DCG4ugjTyjSW
         u9KJeTNTiWT2Na7GMDM8KdmlQGFazjTqJ4YT155VqAD4Dh4En1nhVqihCvxkUvsU3H6X
         cGnoPUhzKju3kdIiUmEyur0HVczP4mvoVIUNuZgWbupfYQS4FbOKl9obpXazR2nuZ0fV
         NoDA==
X-Forwarded-Encrypted: i=1; AKwUvBy1HG4Amg2OXEzTgvyPePiYwZ+zkQy3JjX1gmt1bAdNOEhjwHA8eNGWBnA5hCxxFaNNgkbUvk/nKmHA@vger.kernel.org
X-Gm-Message-State: AFuF++mP48z1ICFHfZxLAE2cZTW0mMnzyFB5pbuOkJCmNsPwi/DLMbcT
	CyaRq/7FXLworAtsu5983ExqfSwyM0F/D6hrnY8YvIfd1jM+FqU0R6qjU2a2QBBScKVq5kwCdcl
	1miZYCgs3NwH46GnnXHGavUnm+cg+l0UI2hWM4izoUZ5rHAlkcUgcvwO7jucPoNvw
X-Gm-Gg: AYBFou0kXYmwaX9iniFECZALnIwvclWIeOynvhRo5fxBk/IImR0U+35ebmT8JGxRALt
	kSKblH0BnnGHubM/kgnru630rmYcdoaoVvQBBA3mE/YMofwHq2QnikP7zi0Udft+lFr5cZXiR+K
	uBLrAWMLkWeA+s5s1EupTZG6Ej6WzHFcEmVcWvAllids3ijcvr4V/eEOWhwKNdjLUaMME2r7aAG
	R+coZDVGY+y2hONHQ9sb8qgU5+pTSAEITcE6IRnqqszb0jX5ku0dgRaVnufU3Qb6T5VAuHXOtWA
	OirLptRIgasVJy4DyY4y8966xmJpLL0yMB5Qx3QbRahjBEEDeqGX6ak2qoWR+pL0bwRTsmJLSiR
	hsdGCjKSnsNFcBFQ76Tcp7anVAwDQsMsMfYx1
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141887195ad.2.1789651222584;
        Thu, 17 Sep 2026 06:20:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr141886355ad.2.1789651221893;
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm26488215ad.82.2026.09.17.06.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:20:21 -0700 (PDT)
Message-ID: <db725f23-0164-4416-a148-5bc2a4520a4a@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:50:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
 <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GQqtPMLIP7NkT-uZyAkf02OEDIh3NrG6
X-Proofpoint-ORIG-GUID: GQqtPMLIP7NkT-uZyAkf02OEDIh3NrG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfXzOUg14uyPlFV
 l4SKs1wO/iB51Asu/k4WaiqVGT7gMXmdycANow2pcdz9ULs2vZla17IVFADOTCf3q36jmX1JXA7
 plQ24AOh3UYa+wbo7gm2oUeM7/UNm/x3m7jY2PiC+3jmyJWoy9Ukkc1047sHEznDCeAtc4Pe//1
 gwAdS405oAbUBEQS4OsA+ZCBtdsClrV71BRFHsuXpu7a4RNtyw+riz/0f9Hi2esxVy3gR52DWWe
 OFP2by3lCXgDWiaPMKNAn9xNyNteBL/kShFQGf8WX8Y45u4j12QpVeYlDH1YCToaqzL9CoUY+Vd
 N5m/ozPZh1wUO+c3QXnqOw29reGeBsI/Nnj6qkYknTsZjgfZbuAHtKXxIZDxE5Iyzel1E1A3pVQ
 25xqW1koOTxRvNEaUcsjg8B6Uakw2jUbXdtCD5ntF26NZi7h35UxJ4YIBfTZ672gzMc3aW+fg+h
 Lom3gNfkwN0S+xxBT8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX0C5nzg09FU7W
 JdlhXH64W+sQb0kdwVlgFu1yWV48V78xPwAi8YSkvja6nVFq39L2NxD1Up1frDVe+f9l5NU9rfU
 hC9FY6wOdZ3URoJz878jkiMrz4/mU68=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabe91b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0mNTRpIox99THDeoYOAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170187


On 9/2/2026 3:48 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
>> Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
>> PMIC, and essential connectivity, designed to mount on carrier boards.
> [...]
>
>> +&gcc {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK_A>,
>> +		 <&sleep_clk>;
>> +};
> This is a NOP override
Agree, Will fix in v2.
>
> [...]
>
>> +&rpmhcc {
>> +	clocks = <&xo_board_clk>;
>> +};
> Likewise
Will Fix in v2.
>
> Konrad
