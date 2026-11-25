Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607837;
	b=y8Kv/7ADk/kYiLdRGOj801Lr967hqB2JYaPNtTrPIlZK9fOzexdWuH9j7YLwdDXW/q0C
	 /tae6ndlgWvm/6AiLUZsf1xyYp5ace6b81rdIk5/qr+pc3Y/MBe77oFR3yM8641EBiidS
	 HfdTeZydc5+6SD9/yGgxFOUFPZShWgKVBz73RkTkX/IUU9urDGQa2MBle9nUtTczIBVjd
	 x/g2wdUjn/Gg8n1yDjDgsx99LRN5oQe0vc4bjCLzV3F4HhZHV48+Ph6uwGhw9DaIQl1QP
	 OpoUFTztBN744EaOw8/eyAMv2rBPaGdYP0CDfSTDbEzzMi/Uhy0qmxU7c1vmeMZnr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
	b=3Q+CEL+5gVd+8VMYl7ALUpv27SdeeJ3Yc2ppx8WQ2eme8D7PQDJnKDfkw3ULyG0TKFyq
	 xA7/mDlbqqGQs2Y5J5uNDK0NBnn3mUgHHU0l3iaU3M4nlY+lEZBe/6E6fHxNBn9A8sCmB
	 EtEXwZW5Z2j5OARudtJ8aj3AApImEjr9B4FhfLxxhxLFnrUn5uaGe4hpkUpnZ1gyiMbWo
	 23o1FEPCUmZA+hThCBOfOaw4rAEXGyhqmgjA8X44RFxApk24j6WJljbMPieY4/973NRrI
	 aL3KvoK5TQVXTmG9CtMh7MKXNIOqccco//ObjxwkOozYsan0skKGSu/UqCBsXVmz44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB9D606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB9D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mToM4034198
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=; b=Bf0qJbMgIQfinrCm
	T7S1xHwVE75BX50Rkepre02UkLvICu2sBavOAP4WOGy0HbYWHM7q9+ATKrzJWMir
	A2APG+eMge4rxnMXZsWS4PJrcUrihtQyKvLCe4FVaqwQPLJJnx5FJorHoactzt/g
	SH53X66n2WkioAm1+0GZ4vEQVX7BNOG5TKciRIK6JoKXg+UziF8LLuNZcyxejlkk
	aodkDvWL+zApsaqYIAbhPD8raCpv1xu0iIX2mskDC2tOtzFnlLv8fJ59OTzKGRfI
	2BNdxGy/hgTEsEPMw5fEmcyuSnEBn8n0Bf91sSlieVKg0TpUM0kEisIOvd/wSV3t
	ESQegg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjmv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:57:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso78028285a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607835; x=1796212635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=cEUYaFJkJ8xh+J/fvjneJvECXkk5ZJTzDv4XCeXAkUzoCvW4pzfhcXZEjKW5cy8aCz
         T31qceAtj2rndvQrkZDGE/+vUZVdrXdss0zZGym366II1JgdYK7c/cI20WDF4fvX1dUQ
         Gz9jcVoMvWNRlQqVqYWfn+yra+8ZQjj6p1ECjp8uUjywNN73c9nba02yLguBm9KK+HED
         rXADdRrtBBRVytcOFmpPZgAQtJbT6AhFtLQ+RutBPpwJ8nW84sITyo7XeBAdzESHdlLM
         Ld6w6tUzh3HOaD2nLLWiMoJQGbnRVaRVp8EsWhsVq9Z/Q12QCMFiNt7b+JM+GZQbKuNg
         NDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607835; x=1796212635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=NW4Jxnpf1W/Owqx8FoejiCI/hmxHeSZpAdgK/xp8P3T037e5tdkeFLm0sS0Vp8r8Lt
         Ohaa/Kb1HhGMl+EQMDPGTtsBJVxPBSsIhMQRwSBMZV9LpZwIn1ghl201NcCYtY1R1ftd
         U7t4y4Ccve+/UxGM5Wou79CW+7EUesif1nr1+CbUx4J3B/rErlYCm23EkxEq/HKg/kAP
         YMCH0cwb/XR/cL1B57CdKNRTBWBifl4KhZ9FwXXcwAs4exWiR2AV6ByP2GDwDdtS6Ksz
         RaCgupjFvfvYazlr+7fbjiUIvu7iwVXJT7FVuetAon0eFbgViPr+H1Ne/86roNsvEhQ4
         6pCg==
X-Forwarded-Encrypted: i=1; AL+hErEX1jbgl1wggGcA/PZQBM0Azp7LdVDe+BnzG0JFk5mwj7b7/R6Cl42W2KhLsxhhW4lYf/IQMtY/fQDg@vger.kernel.org
X-Gm-Message-State: APuU4Z+lvIBMdYZm1pYkh6wZJhKHN/8ne1K3+fhH91cjBidaMQHRn8lx
	7eKFrXjaGt5nxwg5x3NgAwVD/Wg2dcHRrsTNtWniGna3+709cIaLug1pX14ZXjJ/pniGgz3ZnbH
	JxIp2F2F8WeGi4PbD9EwrDKWffaZbGYvaFiecwFm6KhITxC1Ph4Ck9bUrSeG2/jM7
X-Gm-Gg: AZFdTZepPmgelKe8qXDbNMWjliKrgnN8A3gZC5CcDN5UOUExoidz9ztoPQb8HoEcs5A
	87bc8D/771gMl2Onp1TA4wrzU9PjNykksFGj5a4nyyDK76Z9wcOetj52d917kCt5R9pmOcfrVhk
	UJmZXS9u2nNZuBfeEn08PvmNiMjeKpG72hDzbWAmHPQGbqctDjmrKJSSNhuj4PxKeLP/N5A52hT
	8hg/2qJ59W6jH9PQQevT/vGCbkbzxQVeWGyPkxp9BpbV//9iuEls4c8hVbo+HLjbHyTOeorzBYK
	lKW/wsZn+G33AbNCBcYtR+RctgQamGXbWk87IAVxBq+nG9EoWAoMGmcAyba+PnBml1Xiw3g5Jbf
	PGpYxK84yOj4+/xTNvdzIhnGRmdAdZrJ7N0NYeLMyYT6ENUVhxDcZ3dJPCULH3MqszmDCWd4=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064946285a.6.1795607834542;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064941185a.6.1795607834035;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc244asm621335166b.55.2026.11.25.03.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:57:13 -0800 (PST)
Message-ID: <f4d667b0-8a92-48f1-a033-3ba12e0e85b4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:57:10 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
 <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
 <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX16eJHRhDfyg+
 FR/0V7rO+DYg6Yb8dA144IrLgPI9/jtlWfT4cmb4+bmVENWWF8t+NCUSxJJn1XVuhHR1hzniNjL
 LuvRGyyo7aVdkKyXDjcTtxGvH6YpyPk=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06cd1b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BrYspsXIrGSGt3-AnOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXxSVraTzpFdDB
 2s05n3js079U+VfnLx5xA+96rVG3xbHQqI/MrP005ax6pnHD+wXy+OiFBZ4CNRYcygbw2IosNS3
 lfCfMjR/Sk+lOVdLcerprahib0EBUcjKSM2eRpLAfcc+tUNZNN84cXrLREP7uLMXYiAU/h/7Jpo
 kdV8dRTmhBootKDKrOwvrLrHWOADlXthEm4y2wtlT69phfao3UvHLVWL0OPiuBSLBE9C3CoonUf
 IqiU0h6RcQkd4MUy/IBjmof9O1XRXtUUZmN3AtXjcNgKxuhWdaolfnApYQLV1uA7q5HvvDtW8MI
 +gP03ZLxOsU9+OkhRtIW3Du0qcu3X/LH320gBxAcTTuIIQOWGgn77AOEe3wJiyPE/BxqRdCFFPH
 KwXAegnDxEiHnPwkBL/K40jVAoPYmlJxeDN8pSnWG9Y8spkVrObdjuKwoyTAYGsQaz8csWVZTJR
 imDwShU1teXdu4CjplA==
X-Proofpoint-ORIG-GUID: Z8m7wUd-9Eevon3pudPxdVO3TwIRUfM2
X-Proofpoint-GUID: Z8m7wUd-9Eevon3pudPxdVO3TwIRUfM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/3/26 11:58 AM, Ziyue Zhang wrote:
> 
> On 10/28/2026 10:37 PM, Konrad Dybcio wrote:
>> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
>>> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
>>> LDO supplies for QREF to provide a stable reference clock. Without these
>>> supplies, the PCIe PHYs cannot work properly. Mark them as required for
>>> the affected compatibles even though it breaks ABI.
>>>
>>> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
>>> compatibles. refgen-supply is required for QCS8300 only, as a workaround
>>> for a hardware issue where QREF actually depends on refgen3 rather than
>>> refgen2 as documented, so the PHY driver votes for refgen3 directly via
>>> this supply.
>>>
>>> Signed-off-by: Ziyue Zhang<ziyue.zhang@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> index b353b7bfb839..bd4c98784142 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> @@ -94,6 +94,11 @@ properties:
>>>       vdda-qref-supply: true
>>>   +  vdda-refgen-supply: true
>> There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
>> defines both.
>>
>> Konrad
> 
> Monaco and Lemans only have a single refgen(vreg_l7a) supply. There are
> no separate 0.9 V and 1.2 V REFGEN supplies on these platforms.

VDD_A_REFGEN_0P9 L4A
VDD_A_REFGEN_1P2 lemans=L1C monaco=L6A

Konrad
