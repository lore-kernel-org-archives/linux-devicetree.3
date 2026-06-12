Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570636F901
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251709; cv=none; b=SVd9mw1MJ8tfaQJd78wPDFV/2ndmyjLMZ96MYVtauWLAe6bLkgNsrb/d0UjAyHPRonCHx2yAVGIsyX7QbNSNaNeIuOmilm5PgLwbmfiwZZi+x4TlqPWL6IWqa7j0HV5QL7ne96MvE9JM3HQj8/PEd2jbqHUCr9qsTg/ib9fTg8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251709; c=relaxed/simple;
	bh=G7R5v7S4yfvUXe2xOvoA2FRSQ5VC1p6ljqF9ti9JpA8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IRdKXy4FjWiWTt4ILOGu+pcc5oKNL80foeDJPu8FaYMDsiinS8xl0gd0CGIBME+SeZAL3Do+ea9sZcmKevBAsp72hVr5+N4QUtPh6g26AqoV6XiDQ8pndq+mEGhHUs51gBy44cANq0d2ntk7bctIF9moMs7biin+Gbbn52hMsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUkIZABS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUkugKBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUkIZABS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUkugKBc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BqwC2451680
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=; b=jUkIZABSDjvG2+0e
	keSeprAhCzaa5ySTpA+uZ+dB0o2jNq+hfFPZlU2qcEzi3gaDJmjvQR3FlVsKBp61
	TZAMo0kLdzHFxCDKn2VYZWB4VvlT1P6efWlZgYTYh9Xkmn1SIzLdV9J5g0lOfzxR
	SE8cdlv/MVtNx4sX1WhsxWqIw9qWHNMCS3uHG9DUKtUAyo4xKLqTrdDfEINuUf9i
	48Plbe2rc6Ly2G3Z3hs0olOn9cJZeXJAvv+qumItGXA8kixES0gI5uzTefL9ZjMi
	J/5g9HRhH7dVKCeChwtX/Zrxf3z9wgmlybovNvH9U19iKk/ie+C5ytfPLcMAYqFg
	oAiRTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjerd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:08:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso944865a91.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251707; x=1781856507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=;
        b=OUkugKBcDv9MIDob7X6LZTXBKISXHoVnNdyOUlRgQYJbuvZflkMx1rO4HgmXYSGWPu
         04Vc8VxjryJuIOBY7bJt3yrFaTvDZwkdwPYPEMGH6Hud0JLGhaLVds5w4c4A60FK60uK
         WFp31gNjWbjYMKBJKx3OO1yiiOfH4oHbdb4kbiXo8Wisk4uoYDpUJnj6e8qBIUOv57Di
         /jz9xdX+q7FHuszqDgN/3J4Sq7x2ivWuXRjNqlLSqQYh4IRhfx7h0arHn6DTJLqfo+dC
         53i5lcOt/37pm4CZ7/jSDLn17VTosC0kxpLAdSK2W41lCJnMgOraS7fwrEQHnFuLUS/o
         Czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251707; x=1781856507;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=;
        b=gVZbyRk3N/zUBLxpbE3uQSf3oydgTT72oPdUsGFaJOo9HvVY1lz1VcTwNOPDl+CcWf
         a7NU5q/nu0b1/mZyTrEMp5EBXneY8n/FPV8nF2HSEaMnkyqegjn/3Z9xrMxiFlvYWeez
         cIZmLP/XZ4/j4FJDRCkmaFPAQNHsXADVKL+le0x/stt4lAEtY/jwNl0jEsy3I8K8vJmb
         nRXAoHwCyyK8E4SeoxDVT25Mlr0xm2AaYDTKOCtuM5iVhedOPA2fuWTWlQI1XToiI1/G
         pzaRXZGkFGoIzQpcPnLjDwRX9zCTglEnn9R1eu08i00Nq9Hb7TYiq+H/Pt8xFVOVsdG5
         Oc7g==
X-Forwarded-Encrypted: i=1; AFNElJ+FQ/IylQx5yPWgAuIadKmz6OC4xBoih19kvbUPtDNZ4wNQMtsTG6jEXMzBqGB9Lc/8/80PvPGLGS+q@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyjzQQaW+jlrTe9lkz2jiyyk96F1FaLX6KppZWn60WyyQfUT9
	6IRQjHv3nTZG8uJA2KAgUt2X4E2ftlmKvlNJWRFxBXpcSSDmwKY3KjbU4Wb9r9hXXXKh6nT53BG
	RI4SO3BnFtPia7duriryHZaAPb0YlUUFZOuxuRbLJt0Rg5ESvxaXERumEW1uE+/O7
X-Gm-Gg: Acq92OFSB+8q4XYDiZNkRLlZTm6G4UFzH89srsveSAyW51vqwQoX/mghD6fXirapSNa
	GcEFbYQ3haPv1k2+xT/Huhp4y9y8WQwTdXDKHkG++84CO4WvZ600OkUKNVnpeKETjMtLDLRuDGo
	CkTeff2BVvX8rkTVr/9AE+EgKjnMCttkyJT6hw2KkCWNi5A0lwNmuSg3Y8rpKKWO/n5i1K4eNaN
	MxFFshR5bZWxj1tpG+h6PZt6Irb7VoWyD0bLaTxnMS76QRpON5Z1FNHFbvHUulekI4XZch5YTPg
	L/bt1D/43lgCu53jYmbW2R2xE8/WSuaZeeNGZOupdDZ/Bj0X+Dkxfj5ZMXc8lO3WFLf8nGjuftv
	0haamlZRbBtHgTKFIiTZ9CVYZU72O+VS/Vnhnb2BgD/dCvNRQ1TIqvAAMPkhnbf8=
X-Received: by 2002:a17:90b:2c84:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-37a038e1996mr1933135a91.14.1781251706674;
        Fri, 12 Jun 2026 01:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-37a038e1996mr1933110a91.14.1781251706192;
        Fri, 12 Jun 2026 01:08:26 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm1578146a91.5.2026.06.12.01.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:08:25 -0700 (PDT)
Message-ID: <cb1c557b-c411-4102-ab1f-38fec91d7677@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 13:38:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <aiqYtowP2DQt7Jw0@vaman>
 <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MiBTYWx0ZWRfXzQtX0auXxHW8
 tk26eBSJJ0wOzfLTg2mAKX8qep08AvoP83jaerXKtlAdezo3M3BbJ6zg63wbXT5GHnC+SLkaM5M
 fwlgt5XHqpbAs973ZM0R0LVjHR5VsHISzdH0k0v6GxF4pbCnArAg6EuSbIhE2EUWzCRLFUEpSrN
 whAZgnUj3mXfNAX55MOVWWNQ7ZfczgKvjQhPrmCnHyWVT2ronJlPfNYqVbI8aumelpc+udxk6il
 36E6S2Gxt824lYh1wJn1LzpRivz+HL68YOgAwSubl5FSrM2dTSTRzPm5fumdCI+SJIU9VK1YnGD
 yBCokdl1XYKIrVvIY432me72w/DZA26d+gVn+3ynz+2EKU/InDwxR55MBpNWQhPp68i4WLQMGKE
 3Mea20Vptj/YPEIsRpTAfFcshBcoIQL5ptTeZ2rCcyCp/gPwoY7zBlgyyiNaXWs3xIkHMB+7GSx
 zinjWAGuDeyms6cIpjA==
X-Proofpoint-GUID: WHLIo0wgSlfQusFHUybEmm1o_tXdQOX1
X-Proofpoint-ORIG-GUID: WHLIo0wgSlfQusFHUybEmm1o_tXdQOX1
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bbe7b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mUgSyTONyoZcvpXPCScA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MiBTYWx0ZWRfX+2vwN7gWOYo7
 xEXxfOU4T5I9bTiR2oLLGG9NuN5Ng2Bh8x+B9mz1m8maNkUndTYx6e959FisChq5ySMxxQkyFZY
 b/LNfBLfD6wP+III8fBQnr3ZxniTXuY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120072


On 6/11/2026 9:52 PM, Kathiravan Thirumoorthy wrote:
>
> On 6/11/2026 4:45 PM, Vinod Koul wrote:
>> On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
>>> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
>>> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
>>> refgen supply is needed to bringup the PHYs. Both single and dual lane
>>> shares the same HW init sequence. So reuse the tables.
>>>
>>> Document the compatible along with refgen supply and add the phy driver
>>> support for it.
>> Please rebase this on phy-next tomorrow. It does not apply for me due to
>> changes applied ealier today
>
> There is a discussion open about the supplies[1]. Once that is 
> clarified, let me re spin. So we can take up this series for v7.3 once 
> that discussion is closed.
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/aiqYtowP2DQt7Jw0@vaman/T/#m37a571fac0c77fd00f6379ad9a2414b60431820b 
>

Discussion is concluded and I have sent the V2[1] on top of phy-next 
(2ace2e949979 ("phy: rockchip: inno-usb2: Add missing clkout_ctl_phy 
kerneldoc")). Please take a look at it.

[1] 
https://lore.kernel.org/linux-arm-msm/20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com/#t

