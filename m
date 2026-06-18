Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E73ED5AD
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778119; cv=none; b=Hc8+BVDa+eb8LFIvPg3lV9ibKi/AXjeKuDWi/9bhV6J5aUbQ1+fRvIG9qxs27bAsgImTcwbnupzmpySBIBbe9xv0lbzahI2RryqR6+sd+o0WFc22BKbu93dP70716peCUx5R4WOP9Gd0ahgiHcnGkp+x2KJE5NEQ9r1/0dzD7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778119; c=relaxed/simple;
	bh=9a5003MjZGw/1MmHACvoJ7ldPOZzbWMfDVJ1FnfmyPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fidZfnKKbqptG8baflVSZLUAKjCWWIHEihc+KrfoKUppHyUJQG55izIMVItadickTQz8WA/VijSjEd7b7jJdSClMqnOiNjaUt2B9ptnIBge00zcIUzaI1UxtgD+ox0ad4ngWb1JEJE60Cxlf9wPJAoIQldrolivy8Mw+VLfCOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ap1htXgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQnngxgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ap1htXgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQnngxgl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DhpN692903
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=; b=Ap1htXgQBZSykc1o
	CPuO4BCOfka68GanqAzqZy1M4/zgSSo+6TeZH3LdjSCcrxoxGYYmwwB3ZSwYj+uj
	QZoEIMWJPu/lN6+Rtai/zV424VraOAIKzGbwLATpm0YN8/kLooCeMW8cR6PkzSTB
	h3BIC8/GH707ASO0tDYgpC3uDyOdfjZMhIp0EbqG5Ni9FogquCFIIDpih5KsqI83
	eJe/b3oP3TNSa3YguQewsaBSVz0WFy0Z8D+9x17iRkENq8mTXM3/tHGjEo5e8ZPF
	0kTNZ40WtBNP2o0h9rmwr/T6Z2hPxGRJdg/mGbOHH/VHSKhHQ4WgKrhxLXXcjETU
	abeRSQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cc2ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842208d5b0eso530472b3a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781778111; x=1782382911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=;
        b=RQnngxglmeHt651IzuV7yQe9MKRhUW4jfqjTcWN/kLUtWZe2rg6vNzsRaie9mkF70W
         gu5cP3VORTlj+/z+UwrpIGdAb2AcvZCjWcFnPXB1e9flG/X2IRM5F5WPwKo4LwuE41iB
         EWI6xgb5/u28MZC6AJl75eUiGHW85tg8snH3T5dDy7sfxdjvDytXhdenniKWm6y42gOM
         apkG8AX5L99E9+qQRngtBB6xULIvYL7mUrgagDcKy+w/CPv/ykEEYH9RO1LkD0vdtzZ/
         9fWFcc5JcAIwvAqIVOyNu612mzkaBkPxSMl1b75IMY0WnsfGQrbFc5MPcjjyCgqlBz4h
         QZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778111; x=1782382911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=;
        b=kA7MR+spApdkKyawFd4Y0L0Y5+a47/pZed9j/50UIQl+Gp5KHVFkzmWYEjUG7OXo8K
         GbIr8g95lhpjBkvtOo/rWL/2wTj9Clrtj+mVsjKEFGFjtnS0amrXaz9VPghiAfQge+E8
         jrWsngCKcGzcY46azcnIDuvR2+ZsBewMAE6lbpIvob9BsRa1siJocw0hGqtAFGsgsZh/
         DBa/hDT32e3wmT7AY1pnx7ISc81LP5VFbAE1zOPmzEX23fUSofvomaYj+YHj53He5Jtx
         vkBMxFcLfAlUyEfE1OULX6qWHQnwC4CXe32Juqn0T/LPWVTWiEPAhvJ/8iDRsof4moQg
         MKpg==
X-Forwarded-Encrypted: i=1; AFNElJ8/mfFYpr3tsx5rWBOOy7AVgiqZCHiI9zCbcxaM9zdFcRoJV5WqZndUVBvR0uaDgT+IkBBgCNwwPE1b@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUVxxikoAX4PSIoKZYdzTYgA5B7T9groom41vS2htB9Dm5/aG
	8ADIGUyQsm6uR6iKPR9JX1cAk1i7Yi9cW2lJwV197lk9p46zpy7R6JC9ym1n+OXW8EX2TD5/8nv
	pby32wcVV92/qeMwjesGN+PjSxGpxF3uWnT1aKhZRXO7gjFxykXrdAXQH0iV5Tc2M
X-Gm-Gg: AfdE7clkttCJhMf/dOFfMU0H9lDcBuG0kstNKbq9MHm6MMJ8Uj4Adx1dWboaH0GPPu/
	fCnHwzvv5DjPWYUuKgAARZkng4HZ8MMXS7e6HQdbV+EY8XYEw6bhfyX+xuZRR46ZkmduSfLZaun
	wwN6EwnavAiR1NgLf6b51L7pcNTbdm42at25YsB6GWql8HeS7DTrqOnsfnQsj72kKsJi0MyQP1n
	ajqrMKlQRtXLTMEE9NjujQGxpMVpYZy4U1ik8NmMq0TmeHh6MZh/cEMR1G4WJoVFS5mb71Ehqbr
	k7v26MYgCJChCo6g1vyqrqCLtS6l9SAg71flhs/PcbNDbhes5LSeq8t78EnPaRJbItGlxGTZ3ZN
	UdQgQwkCJ17xxJ3xd6i5b8utdVxo9a/0ymX9IC+TW
X-Received: by 2002:a05:6a00:b41:b0:845:42b9:60a9 with SMTP id d2e1a72fcca58-84542b96779mr1977669b3a.38.1781778110601;
        Thu, 18 Jun 2026 03:21:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:b41:b0:845:42b9:60a9 with SMTP id d2e1a72fcca58-84542b96779mr1977632b3a.38.1781778110132;
        Thu, 18 Jun 2026 03:21:50 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm22715971b3a.57.2026.06.18.03.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:21:49 -0700 (PDT)
Message-ID: <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:51:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
 <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX1HhLI7tfgyxp
 ImZUnqrS2xHnqeIIu21HMouFJxLncgRouiG3yDJcBR/8/6ffAtWU5gOfgjMKm9E5T/iWnyCCwJI
 i/nG2UNYfAfMyt8UkhB4iJgtgemod4g+6yFzOrR7wd+Aq0gSsCJWEhYPjD+6ZIgl3QSIEC3Ughz
 UD5964fnfW3H8R2r3SvUXyrHvjs8Lqkt+CfgrmaOGFD6KU8nZBIcNycs5FxTMifHA6r8HYQPM8K
 /ED5yd+kBlGWwieIIKnfDTJAnnTFCKZFCZ3t0zIGlTKUv09CpZYu8/1GBGMVx5DDlIJKlQhMs8A
 GekHDzvgk5CbNAfG1dbzIpHC8wZ5rqExhbL9zAhxRx5S+ErFJp9do5/nD8OV5/PTSxoVpPsJB34
 sEQCsKtYZ5D/Cw1oawi9ppoKyoK64LJICsN+dJAgYL+qUWwfJTv9HAPefTlj6zOAFQZp9MS4IM1
 fH+CWYlUFsZEKwoLvmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX3Lui9Lb2jJ/l
 LHLWzI50nPC7wEAWQ7dCL/ZTuZm5S8GUMlzwMWfSCinD8gbBGjGBiVwQkXwIB4K3US6nh2ewH4c
 VCaZpw3Hffq2dv9pMs5c7WNzEDXrHt8=
X-Proofpoint-GUID: J9RstmkqxDPXEwx-UBHJud3eq1Y5pFlD
X-Proofpoint-ORIG-GUID: J9RstmkqxDPXEwx-UBHJud3eq1Y5pFlD
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33c6bf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-7KxEBqrqmoxkvx5lt4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180096

Hi Konrad,

On 6/15/2026 9:26 PM, Konrad Dybcio wrote:
> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>> pmm8654au_3) on the Lemans platform.
>>
>> Each ADC node exposes the following ADC channels:
>> - DIE_TEMP: PMIC die temperature channel
>> - VPH_PWR: Battery/supply voltage channel
>>
>> Also add the io-channels and io-channel-names properties under
>> the temp-alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
>>  1 file changed, 93 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> index 341119fc8244..6caec3e4df4b 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> @@ -5,6 +5,7 @@
>>  
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/spmi/spmi.h>
>> +#include "qcom-adc5-gen3.h"
>>  
>>  / {
>>  	thermal-zones {
>> @@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
>>  			reg = <0xa00>;
>>  			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>  			#thermal-sensor-cells = <0>;
>> +			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
>> +			io-channel-names = "thermal";
>>  		};
>>  
>>  		pmm8654au_0_pon: pon@1200 {
>> @@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
>>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>>  		};
>>  
>> +		pmm8654au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#io-channel-cells = <1>;
>> +
>> +			channel@3 {
>> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
>> +				label = "pmm8654au_0_die_temp";
> 
> Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
> or "die_temp"?

From what I see, there's no functional issue with updating the label to either
of the names you suggested. We made it this way at first as we thought it would
be useful to have the exact PMIC instance name in the label of each channel.

Do you want any changes in the labels? If yes, which convention do you prefer?

Thanks,
Jishnu

> 
> Konrad

