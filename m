Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC687280037
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037297; cv=none; b=qfyLKA4LvUteaHzQNZfFUPOJ2v29DmQXztTEwB0F1Xzi9p6IEcQyEPs7khqvaCwo8OOeg5415/lov7IXqO/K6MA707/SNLNYcxpo1fvGohXAC/A5ajepyYzTKTZI3f9Tv2G1F3u7VbM0e/ww/M3hpYtE1JG0EWoXLWSBA6lLlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037297; c=relaxed/simple;
	bh=97g/NdktaIsfmzcUs7B3fZAs/ud1qLpVVqapGtwmntw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7grbDaPxan9a5B/m0P8yqZwjf+5lmIZ+kMJiqX0ufQ2vTaCoT3YOWRta6D8pZ9rmYYOdKHndWRdWRk5LLXx+5q+yJrj5HHAGp+1nNc8/6TKsHqs2BKYwlvOqipucJ6Wc4PsIgYdnmXWchlY5zV1pLT41MCJPxfiDTkCaHyG1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPSKucqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QA8ZiHla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPSKucqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QA8ZiHla"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1PGgK3425500
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=; b=DPSKucqdOpkA8zhl
	f5TYHIXNv5YMsgwOibwUCJd6SE6lBZatsSAd4CQD8coNkgGneC0kxdkCCgIWxKFS
	j2zpDvOoIb8V+ha4eJfhW2bkTM6NxJ0W68Bd/Gc/6EmHA/jQBfgr1MGEQwyL99Qt
	SBWxRSlUNofr2ec1TNzbmW/1l+43Bbw+AuCoeyUuGYvKrzk+MyUs76NBP1gIJgT9
	iu+g1xp+vf3X72gQByT1rPzC3eh4S2EmpTLTZpZCqrZQIl4f8OKuVTOXE+oz/0Lz
	Jgv1HteWLh+AevDerqNcIP8HQkzjHcLr34Jhkhg1U2p2Yu3eLzksg0L99jSmGk8r
	ICyNhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyu8cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:01:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so38232175ad.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779037293; x=1779642093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=;
        b=QA8ZiHla08Yxykdk5baymhBkGyn+nSsBHccjZsmlriV2cGCBqkuRrSGxvbi9uUbqZu
         ctFkBCVrRdkhnC21VFmSmnbgyrBPZSyO53FTxLX6YEo5wrJSNaeNHot2Q6Xcg9Dfz3z7
         fjbGR2cR8kTVFMrtrbRAXwVt0q4cbfDVo1FsRaMoS6tZCiaoLw2YDlZ52SY8EHnxL7ur
         wmr7ldWe22bm+vFpAgtxONiY5356etYGYhccW8yqgQVeczuiqBcidgQ1h4OgP8BT2HDc
         aYTC2VzZJZs4IeBgWrKQzPzyrwaei+9YDsFHRth6Lqh5HmSjAx4L2386oRLZ9GZqqGj7
         gN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037293; x=1779642093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xRzeH96dtwyj2Z5WMwnZyLEFHICTIHnJvR10SSBCzg=;
        b=d0oRpPzXRc9cqBH5RMR1/SuA8wQBMDSShdFvJY4pqZ7xCycw5lfnjCc6m+OEva9CvY
         vQ6buXp53V5XkM5dnst8JcEFAuhzCeAflmsYyhnyCKM5oZBI1DJLTSBmy1FDodzNYloi
         GwGNB6yKf9TP6sigp1TKY2utqpi5t8frOsivosGzqzvd6BOiM68dLG4ICd1uoQEsJIN3
         dBQ23NoC7RBDZBLweshVYLd2CN4bUTnwsBb0gOvPwV9JvFFMkbMGLw3MNoTTdrweUHDU
         G035jDKhIdwYAHzqrNjLY8ugQmnvpK316rs3qA9ekx1vqvgLmCR1AkBMAv1M92IowfrV
         L7SA==
X-Forwarded-Encrypted: i=1; AFNElJ+FIZcaJSF7FTo/ZusISPN6f2s+oDaufutO9PUC80xO97qPM7ZOb1QD/W9QkwVdHXT/s7+5alzYFldg@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJW4F7uvo6coDl7FXK7NOmmtymZr5r/PWTHPS3x8kqNhmCmXx
	LAOvV4zgW4xkweyugzjlwPcF+CXuRIl3yqvBrA1AToYv557zUmceMo8Hjw4b+M9pDeGIwQ2s20u
	1+PcGbfhgdxzBDrwjP3wwvzYMoUx++9ZqZ9ihqy9ZVaTpcQpAi/X/oMi5C75ooT7a
X-Gm-Gg: Acq92OFk4jYK4sQ+cXMlvpZDkGksZ13ZqudwAbkOeXea0C5c9WtUHrbpSg1VbIKC4Wy
	KrEwNbqr6ehA+WG0HmFkV+J967KJiVIzgXKu/eKqHPL4OxeUDN0tqVp8HuuApsG7k9PnSTBJzBu
	gkptZp5LUqmQWdeICjUvRrtdycfZ11JZeTdAKJ76Tjf76q34UEecFAKbPYaFvgRCPAceVZch7lG
	0wI2+R0OhbNRoPi8Qq9R5ekj5Yb0+R2AZd6J80eLISzLfoscLmoNdH2Osv7XkK/OxWg+hJs4Poo
	qGQEPb0xImrbXwb6NX2zrquJh5RBcFH62zdUVSOBnj9ojU3pEXAbKGDbUyJlWFcauDCcj6OcxIi
	ENtYzH+JC3g5MgGXWvrpu5kOPKrARMOSffUjk5/LEPwgjPA5izSk=
X-Received: by 2002:a17:903:240e:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2bd7e831c89mr127658505ad.10.1779037293140;
        Sun, 17 May 2026 10:01:33 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2bd7e831c89mr127657885ad.10.1779037292600;
        Sun, 17 May 2026 10:01:32 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm115580535ad.30.2026.05.17.10.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 10:01:32 -0700 (PDT)
Message-ID: <a31e27c4-b024-4377-a5c1-f02c2bf02a0d@oss.qualcomm.com>
Date: Sun, 17 May 2026 22:31:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
 <20260515-pumpkin-cuscus-of-expression-cec1ea@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260515-pumpkin-cuscus-of-expression-cec1ea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4MiBTYWx0ZWRfX2vSmRj0o/kpE
 LjIumDduSekKOqGAOA6UH+IiY8rCYMToh4LJ2DBR9ieTUBBVC/AWWT67HpG7APnYGIqjZ9041lC
 mO/jfBckFZ1LJ7YCnp5uUw4WnDPLc9m1YptR6OvNNn+dIHelu8xIZKf6mXs2TSEkVBvOHkttpgI
 gKwlZAFA4w3ucctESgQv40K8owBpU6+kQYXjVUnckDrq0L0cUaIUA85vmFi/DHD02oydUZhMYx3
 0nRu7kJwe/lPXMr0mX4zmuLLSlFZGY8/Nrc1MO58Tr87cxTnNqgOFCudKww6wh9trhOTkFIeC87
 kRyIEdBEBxKHtD5ZJYSsP4Jl8gzZBgZOrORoI2yzgH6i7ngpR8LNdA6/r0cBM1rUT4sUuO1B4tC
 Ldykbv9+a7f4a3rFmKqntwvF7LX3AXFmqqc3NhrKHs9semxN9VZYETXbRLTdpqWJkHnLW/86mdw
 +MamO26Qr/O7eN1cQFQ==
X-Proofpoint-ORIG-GUID: pY63xfHrqul7VAmfWYe7qKUJAQckpDXY
X-Proofpoint-GUID: pY63xfHrqul7VAmfWYe7qKUJAQckpDXY
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a09f46d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QP8ThlpALwkLgMcBQ0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170182

On 5/15/2026 2:21 PM, Krzysztof Kozlowski wrote:
> On Tue, May 12, 2026 at 09:38:04AM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> One SoM variant is introduced:
>>    - CQM: retail variant with integrated modem (PM4125 PMIC)
>>
>> Two EVK boards are supported:
>>    - shikra-cqm-evk: pairs with the CQM SoM
>>    - shikra-cqs-evk: pairs with the CQM SoM, with no modem support
> s/CQM/CQS/

Right, will fix this typo.

>
> but anyway I would prefer to use full product names from
> include/dt-bindings/arm/qcom,ids.h (so CQXXXXM).

Sure, I'll update both CQM and CQS to their corresponding full name.

>
>> Each EVK provides debug UART, USB, and other peripheral interfaces.
>>
>> Add compatible strings for the CQM SoM variant and its two
>> corresponding EVK boards.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 2741c07e9f41..f041d71d7957 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -963,6 +963,13 @@ properties:
>>             - const: qcom,qcs9100
>>             - const: qcom,sa8775p
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-cqm-evk
>> +              - qcom,shikra-cqs-evk
>> +          - const: qcom,shikra-cqm-som
> This is not accurate. The SoM has physically different SoC - either CQM
> or CQS. You either need two lists, like Toradex is doing (e.g.
> toradex,verdin-imx95), or enum in the middle of the lists, like Renesas
> is doing (e.g. renesas,rzt2h-evk).
>
> I prefer the first option, so Toradex choice.
>
> But for sure you do not get the third solution... Really, you are not
> supposed to invent these things, but look at existing solutions (and I
> was mentioning Toradex during internal meetings whenever someone asked
> me how the SoM and carrier should be organized).

Sure, I’ll follow the Toradex approach and restructure this with 
separate compatible lists for each EVK/SoM combination, as below:

- items:
       - enum:
           - qcom,shikra-cqm-evk
       - const: qcom,shikra-cqm-som
       - const: qcom,shikra

   - items:
       - enum:
           - qcom,shikra-cqs-evk
       - const: qcom,shikra-cqs-som
       - const: qcom,shikra


Thanks
Komal
