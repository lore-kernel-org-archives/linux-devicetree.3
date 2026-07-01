Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA7192D8A
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911379; cv=none; b=OPgQvaygW2jh3koLYyo5+6zw8ReZqgKjO2rhUWA0I3QzrXuZoxZczjibhHQ7z4/FmKZa8wMMwok3mXqFNKFlvv32mJtIRXvYFq269WX8H/DTvB3lf3mugpFsQ1w/0095hNPaxgM5uOTR5drD434LCNYqaH8mYChHPmY0Lww7c1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911379; c=relaxed/simple;
	bh=YEagMTZbDFzDpcyW8xwkh7BaPiHT5dfhcaP/2DOM2fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2zzjgCNxFNDb+cDxAoaR6uAtA5qxeKF9qmQyzuZjyvAJxo0XZ2D5WFe/CjNE8rKqnTQ4+fXm8ffOFVqglJOGG1wHtFioRL00CJduMplnW5YJ+uGzsoRUHZiRxsF5NpRNySdhJTzvFcMpHt8UAo2Sg4Zpxv7dwcDH8/ttq66R3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iv1Oi8vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEci4UhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iv1Oi8vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEci4UhC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGEUf793729
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=; b=iv1Oi8vpq4nli5ml
	1Q9t81EyDDy7VVZkFid0cYuNfWDu5H07OMGx9T1ewmMItFFPOpeLcxfF7529EhWC
	vpZiMh0gNo4B4w42RVDngLOOXPr5yIZpQ7orlwhYRMfEPSJWOdwQQHfeQMi7o4qY
	W7RgrHWLMok30yLU/T1LkcXLJB4gz6imgBS18O3EQthPfdBHJYjbF6iCU70Uz79b
	sr+1qsrhjET1UGe2yG0h7poaJxB2ATU/Sz6WgL/Gi9pUqJrPXIwtB4cDo1Oqbtgj
	oBSr8sVSKRcFBGcsJE+xLjepUrMSgL+Yts6WZ2R/xhVrqg4lEBshGQP86awOlSHp
	BaaLqA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510agq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:09:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bda959ebcaso13130e0c.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782911376; x=1783516176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=JEci4UhCoQ6QJQLHw8pdIk/clEgvhZuwivrEh7o5hW+TF08fuEpgBAgo83yz+60fEA
         E2honA3wxeoSl4PLlPIZCfWxl/VtWAPg+h3P8cHdt3Laq8AmlNuuLVOO2mFPfz0Aylhv
         4hoIlZALk0gaLJyg0M3T67LiGkTbmH3j7JFKO6En3RVR5/BNdDc8NU4bW/Hyyfb9brXg
         KPZ4+b2pYgurupuRwWs0gj1ne7kaw9zt+66cFOVDqlTrGGoRhei0lLEkKcW18negAYyK
         o5fEfYCCctqPnXuZWf+OROOjQ8lT3vjXtkP1Vewp71LNVsCuUSyq8YB+CpXhg1HQ4HE2
         JZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911376; x=1783516176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=nmzeYv9AD49vSgNw9wXpFMYiN6jsxsm5Qom6GOV2vrkZQM8GuQxSfdxeEZ4TevUeTo
         mMHWwSpPDNdM+XcB5hRjvweaMwvLJ1gOnK/FRCkXJXMtYOV1PTj6teKTf3JAaAGVQNdO
         3xBUAmDGLniqy01b5kV70xlUxN7EYQo88usv5OA6wOoG4/bhxPsyH5V3kCQPpEBY+Rm0
         y6XoKXIKsCvHqtF+Yp0L1oeyAMtLPJXhN/buqCXCOMFA8Dhe5vc38x5HfQzItpkh9nh/
         ebrEncP0rwOfXPVHB9mjcmnxW8Z6fSxkdLqO9W3lVWQVT5LbIqPKEwXyMqq6U73sBpYP
         jKVg==
X-Forwarded-Encrypted: i=1; AHgh+RorB1Jv7egHMJ6t95Vm4upvfLbXI5Z8tRVo8xgWojSrIhyWqQ3ecWoXc98/81cpgiHMawa8DwOkNMux@vger.kernel.org
X-Gm-Message-State: AOJu0YwceSPbb52b2PLcgZQHedtUxv7gqyLpXOd76ANK/siBYiUpqBgE
	nGkhETd8kIx3SdsfBTu7MW/zAY+EU7DARzNnZaY/xDym5q+Dw9ZFJZDHVdazmtnk0SSz28tv5dS
	tyAKVGcPByhCojhEPw7dJKmjY16CxNOXiGpkw55DOwVCXhCNfUzVahDVW4ozhU6RO
X-Gm-Gg: AfdE7ckqIslzfxnqW2uFiCQwT/DUEr6egTkJN36Onn+nkTV6FEjyQvqwQ+LvpswNlPb
	wXNBsKaOuhgPZZfa1sfH0hiumtkaamTQcGqmERg4N/jEGc/2yhIdyydJVNdEaHOT+4w6KQek/28
	liZT+ZlwWGROKFLCOxj3zGhzh2GMeRqvU3/xEhoU+TLGaSz/qW0Cn+LjYU77jTav5kqujop4yTh
	Pa9qShfnCQnaY8mRkd27n9cN/kjzwEGKRGnixKLL7iN5lDapODdeonloKmGCINifL/8KWflhpo4
	y/q2SZF+DsXVtcpOfR1j+MPZzROLJ/rJMhwp0pSK4GlKigpc1edMr+7E+Sq2pSp1C2rziLFBTI0
	JF2o+Gk46uzACXa+zTIe8IhKx3usH3Mta36M=
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185658137.5.1782911376372;
        Wed, 01 Jul 2026 06:09:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185631137.5.1782911375950;
        Wed, 01 Jul 2026 06:09:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm2686116a12.30.2026.07.01.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:09:34 -0700 (PDT)
Message-ID: <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:09:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iAmNKcB4DtC882w7s3A9HZk7maZxJpSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfXyXJ7oEN/jkcP
 RSjrCIKaB2S4y8dL7pB7ACUvMzVKc9GIZzVCPdv5I845H7BlC1Dv+5oJQoMU/udYBX3bxFuff7J
 G4qavIOGYRKqwqOEQ/QOo1wxzwnQB0JpTDTsH04n0rDccwu24fxNOWKD2WfymwIrKui8668xFD4
 y1UedPGOnmZ0Oveo+dEy36fwA4ldGedHh3E4H9/rrtgxyij1HL3Qrj5yHIqP724a882EiZ3mViV
 WXe9GsHrQTga2GvESIkNpx5LlPvPbKKtc//t4uA5D/r6Pqks7Q08daeUUhrRro5sb2gQ5TxuS9b
 BKMyrvM7hUs0APe/+j/6JPTo+gaHgYLHeXk46uPAepTH424Efw47icNmvXoKIORvYPXvzUT9PVc
 rLKBOM8hqIFxb+D7v+ulSqzMiHRCtyUDh6ODe3t1Sz4GgAe/COvRCApHKoSGIrrX5uOyz0mhB80
 0rerVt3DwPq1Mq9PyTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfX+KDu2puGNYWb
 ilzaGI7G9UDQfdVjEvDPFMygtXQmcPCNW0nLjl515dl/7bM5e6J/Q7g72FNFvTP3dQzekI9j7l6
 ZjXJ0RvQuFp4J7o4ePp5+KeoxAScIo8=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a451191 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EXNCQnpXykppytCkcAYA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: iAmNKcB4DtC882w7s3A9HZk7maZxJpSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010137

On 7/1/26 2:54 PM, Jie Gan wrote:
> 
> 
> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>> AMBA bus.
>>>>>>>
>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>> created on the platform bus instead of the AMBA bus.
>>
>> [...]
>>
>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>> clearly distinguish this platform-specific case from the standard
>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>
>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>> I do not see there a fake, duplicated compatible for the same device.
>>>> Can you elaborate how is that relevant?
>>>
>>> Will fix it by removing AMBA related description.
>>>
>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>
>> Why?
> 
> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
> 
> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml

Well, if you need to break the bindings already, might as well on
the grounds of choosing a saner ("clock names shouldn't include _clk")
name.. Not sure if Krzysztof will like it

Konrad
