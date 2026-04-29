Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF33BA221
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452810; cv=none; b=Lh8ViDnd0iqrj4S8ZIWjeE09bwPCkznYgYKqXPHumdQmk1H+uad2TAXOJH2ecDAwPUVRQU5DynaYYXYFY63NNm6rMUubtG173Mria7wDz7EKfMQL8NW1h5aVllIGit5CilutclclZ3awIoVl+g9R/bTCxae02Zxx0VM83HXB2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452810; c=relaxed/simple;
	bh=xX9zWyeGWNMM7GK+K88UijKblKtT1kBrY5FxPzbVWiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzQ09i+/nJxCr4lMle2x++pJsVS5Fmv/hLF76nzeRbEz91NNmY1m0cD2Ue0HwXE+DPxL4gJd7IufV7b0byUgumGGcYrfcm3ltKdUgeHdoonOWU4PXlj7de+tiARl4BEH2D6M2adXqKQxVIHYLtoCBeaZ7i1eBPJAH4ARTuRED9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WErclJ2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc0h5d3J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WErclJ2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc0h5d3J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEii3066948
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=; b=WErclJ2Un8X1XDVF
	TWxoOWPT6SpmqndxnhCaUCOr4pR7PDMMMMpq2b0TUGnFYmD960v2Ul4UDTwq04hI
	kzF9l6OWR5GjhjBeDuR774uHTZoZjgXuRRCDlNjwy+NckAQBsM/RoLSGE9XCqU57
	2Q6Pl2zh6gOBvLSD1fD/gvw13kgV5PRLomsefllI/iud/0wX7C0ZKNBqtiI/gJMc
	HS92HBSZKzuHTXhgmflGw3YMAA9yEytLzpyoLXDpIpGyhmbEMgiybT3GMT0xIrRg
	N4T+BGySqkLwUfTMvnXeZ33jmTMc3x1yxbPzURXYw86zit12hHrmMAy/TQ2VU2+e
	KCiiaA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9p10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so140705e0c.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777452807; x=1778057607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=Lc0h5d3Jx8cM60ST7FB9x5bJ27qEsqVaonj36m1D3nFUV3VezZu2SXb0jFTlJdEc8I
         wAsAYmyaSQRjKTJnXaZKKpoxvZI7kc162TwsynMCol6iXsI9Gpzd/h+ish+IhMgwUjxv
         ClfYbob3Uj7fQ6LzU5vNUFwRktkFrAd7lx2g5M9XBGNo/mqicfBIx+b1jxwUskO+knI7
         FRb+yK2HJbhQam0qVDhwl66PJvDq+5tMWc1xqmRvTteBc8HqrimcGdmwgk+of0lXyCUv
         /sreM93bEjVON7jzAeypcGYzc6svRPKrJ0CNQkpQkMOFG6x3CTiaOXEeqCM3VI5y+ZFu
         47dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452807; x=1778057607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=YMODF7g5DfxPUNgquc4aIX0LM8aHmvh4760b+5xS9n7pYJaMNRbqwTzVPByCW1xYLW
         iM/1kfFDRHgheBH1oJKGfL2nrS6NTeoYEj4GGB+13unqEKUch/HdaqljcGj5cqPREjfZ
         qy7/3/UoC7OstDs3eCX3CLt7YD0j0HlH59ND5Go+yBMATc9xwrgzXdS2Eq3RxkcmFTGn
         5OAjAs41yaiK+xH1dLW3+GlVNxWJjuJajLyD3zX24zhWBS2TG61USOd3NOsmvYW+J3Ui
         LeTEqTNo1K99q7wGDQDPJV5URiwgsQu4VBaN/J7xC2CZOSjlrQmcmaSxgEmjeSizd/FP
         HDNw==
X-Forwarded-Encrypted: i=1; AFNElJ/dE2mPfLsW2M8bEdgxtQ3CBOAGRoCLd7BACR8VtOfpdf57BEDQ43Bk7KIoJDh5gOW8jN6xV+Yy1wPa@vger.kernel.org
X-Gm-Message-State: AOJu0YxMOsV5yFbPIbTFGRfojoGWOD94ofKRC88v1m96TKNBaUwoNwnz
	yPK3vI4FUUCUHYzEdYkkGEFTOOkv74qskD0zb6HpOqopiuy0ymQ4EjTcYukzmxoJ1AcNSC1AFn2
	ylDH8JgrPdP5QhQgYl4HStfucszdQn4c+1ZPiAbMWGGjGvqEUSgVTFAkMXkI1rr/D
X-Gm-Gg: AeBDieuqkBkrexKqjaWZbo0iLbZIjMdqyt9/VDKfYuD0wsHO9QshL/+zysv+C7mLPQE
	2TSstlMDPbQjyQY3DaWy5y7yKa/F7CROIT5jVUaQMAOLMPWNmwqKadDIIZottfVK4XrC8NnMMGB
	ErHbBJWYkY3YF5q+Ar0KbxKh4vlfE0v5sFShxLhfIxmMkXAFoDBPKaioOcZzQmirgjbpMNlPPk8
	uPOKJ8R5om7NbYOCK0CX7S9Vc4ZLcxAlxZiD4+N/EFZ9NKrD4J0v9d9km0s+MwXtiQl5VVwiqMP
	3aL46CtUIY7apQ8FUmwzsZxWsgdPQlxZZrjm7tZWFN3W9hDsTcEaE3Q8aW9jt2JTZGMvVoGuYPE
	58dAfbxGPvLlC/DE280DFGk1OHkeRX2IdURCLvMKF+5+9Wthm5EfJIDXxW3k6BJFEXNJNYkzwdd
	yOx7mxgFN+8I1KKg==
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225698e0c.0.1777452807506;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225691e0c.0.1777452807044;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9854396dcsm60429466b.40.2026.04.29.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:53:26 -0700 (PDT)
Message-ID: <2aca441f-55cb-469e-a680-2ad3f322fd85@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:53:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
 <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g1FP2M2GVtnC-G2BnFtuW9DTvtJjxlJU
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1c708 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HnUB0FDFPF86eyfwSe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OCBTYWx0ZWRfX/BX1bKMrHoMQ
 SE1RsnxjW9FCTvpro+kXhD3E8pwyzU9MkeoM361gtk4aa0uv/RV0CLi0OJi/qua/bhXqrFviuDF
 ixaV80xYJsWvm2SnOFnEkupCQH7JALSctmfxm4qAWh3FfbBA3Tb5gDy3Lq98D151ilK+qMfTFSs
 mXHot6eDb9by+aXrEBTYRn+UYsuOQDYxubVIDVRuwFFqjjk9vq1QYTIaS/eI5vcNpw9sU9CMhtW
 pSRTQbWqJgJwFksjHbyZ8PbJlt2jJXEmPCaNnlXmSgoOkLnFy7z7Xeid55JzPMpSfGDTV0ZJpQL
 +RDR3p4qs932asnauKqH+08Lf0JLodJ9i7ODfYa25tdKI2x/cFpdZASqcYeUcSGGzY+mb6772yk
 3LasEefGGvgiviVHlO4dxnhvgJzl8A3PUzbnQd9cKXeblT+ZFJDI3olS0thGIMvVssyjrw13m37
 vBcMXTU4RGFZpQSwyBw==
X-Proofpoint-ORIG-GUID: g1FP2M2GVtnC-G2BnFtuW9DTvtJjxlJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290088

On 4/29/26 5:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
>> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>>> rdp488 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> Overall looks good, just a couple comments
>>
>> [...]
>>
>>> +        CPU0: cpu@0 {
>> Labels should be lowercase
> 
> Ack.
> 
>>
>>> +            device_type = "cpu";
>>> +            compatible = "arm,cortex-a55";
>>> +            reg = <0x0>;
>>> +            enable-method = "psci";
>>> +            next-level-cache = <&l2_0>;
>> You likely want to add #cooling-cells = <2>
> 
> I left it because to add it along with the TSENS support. Do you prefer to add it now? do let me know.

Up to you, it's not very useful without tsens

Konrad
