Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBB2737E3
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030681; cv=none; b=FrN7WSHlwBstQnHOeW7Qq0nV631gniaPe6igJBQ51kvan24x06g1caRIoNhmXGEa0zlETBOEH8mZs42RUNE3qGqAKvzZHeLfLTRNuvjpwx6jARs2LSKC+gyn/5vM1UsFwQIh/XGacU/M3d62H7zWLPPwAxHzhD+VgbfhRExuJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030681; c=relaxed/simple;
	bh=wsvWNahd+3JyEYeOYRayZ4Uus5PQGFu9gfDxjFlvWf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NG3yLqAmuAu0AV5eE9j8MlcsghpkG7pPKGjjR8q96Lr/gGyr7NvfZ+Sfzs5d28Vr+T4FZzuSmX/+NBjxs38rqGIDgDb8sh3dPygD8SsrzZykpXp+hiJTfD/vZgNw63TSbB1nuEqI7yZpgmtOvVggj9ehzBKSAT5QimMWZN1py5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9RYRL/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMfOISBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9RYRL/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMfOISBT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNp6m377227
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=; b=k9RYRL/DvL9dx3SK
	EwDCYxBynq1p8t/jPOsudiVWx5qOX67RGW/i5qX7BGh5FJFQtp6oq/p9eWRRyMon
	juMmHl2zohP/joISy6YTr1lolrNTfAQdsbM+5e2ds+uQEaxOP8ChkW2Wqjzb2vMr
	mEHIYA3Iou26QJNeNBuY0Iv23Jt1KVYq6FmV8V72L1SMt/AIyspvfNh+EbTnysKc
	tR2rbHWqEjbJPbtKA4nMuLF25j4vRvA7VCIEGBLp8tjdy6Gd5A9Lt7x387a18G5a
	kOffn5iukt235JuVo1QcGFaYYQf+lnASBvo67sYUnfY7IqL6A795M13vx+gXBM2t
	+52UEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4a3ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:04:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso75542295ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030677; x=1784635477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=;
        b=IMfOISBT2eVS+lXSMkhesarCjLSkko9ur2inDJUc7XM9qzRAqm4RB21Cuky6cj9kma
         iO1hhg+t160R8ogzlzrSNGMl7dgylRF5U2hr4N4qq2PCg1Z1UkwoHCFNUUPdc/iefcP6
         PLJL41QeH5yZU2EVKikBW5uhldAa1XQjgZzOwJw9LGUxt9VJh6hBeXAYYZ/YdskRJFkt
         6Zv47c7QWXKlVGNVt0pOh8nY5Qud6Ha5+lAH7+0pUcdtWz1iIzjSYu1nUwcY/7Lr1pvA
         /GKdi1fU0e/WroW6gYmJE701NNWU34cVUhXBCAiT/oOj66ZqUCpjUhSuYUHEeq+yPYhi
         OJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030677; x=1784635477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=;
        b=P9LsyVHXnaXUpc1yhjOddRzq91fjahaoLmNC4d6FPkfttlCulTiYAnV+XQw81gdHHD
         nr/QxbWmZZYLFSgvFscyVy6wnU6RVolJ3gHUJVDytvLkNxvfQk558uveWjtfn5mERK4x
         xpt+XB5Bw2vo4ADkN4HtHe/+21M63gayj7KbxpVRKr3DJE9+kzfBpNKtJ0s/D1vFuZzC
         GyahI45z1i/JoKy5Wl85t7e3HQ2JppwKWOUYw+m8yH/WNfYv2pDk3IlPZu9ehv4pr0jR
         M4Vq+2EoBxp/SSqkYoyxmW4lbk+eKHu01Nhrq+PpOlrp53sltMbwa8oGuMBe2dvspCiI
         t6bA==
X-Forwarded-Encrypted: i=1; AHgh+Rp07AkjDWlqtbwzCeXTsqEdDzpZAXCoWgHo//6R7IkkMQpl54/dyYyn1R+g3EpXqTJpnrrrTyAKSpBL@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJ66gOUvGut4iWYHkCh3c6qFEq5urCxErTWxiTOAU3+Wz0OVQ
	LkXTfSfYM4gHQlFVZwUDv9+r994lP9HBVV3leHSBHy+XviU6L/lhTXpIHLbtHVn+N+Xsq4kzFOk
	AWndDVqgksncx138kHJJ7+E/VO5X6meWxMNLvgmsrS5t+lnnhgJ8xXFQ/crhYucjc
X-Gm-Gg: AfdE7cmRu+NJy7uLVXBuU2rznoNmhC/pgbZkeorReKUDMTgZtjrifmMbt3fc84VcdtY
	+qg+UnoEtjkzW4IhRFjpbv6wjYdI+qbMMrfsLo5T5gR3LNYs6xrSx8z3qTTmfEMypV20ZlN6Fe3
	P4AFVFUU78NVUOPpwqvoOAY1Ep5vDSFt2M0JUwXegxpfbEuIAmcNIJfW1aUGbyfMkujMGHxo0mN
	2kyj5SkrpisXRK0zXTZNdUYxDRIzxu2oXQPIf6sABGi3E6ZZHAGz6pQXieL2xmHNIVHZ7md9C6U
	RNDp1ogR5JCiLnOUpnNVi+J3GeBgCWi5g6Y+wMrlNUifoYNBUNJxYMTZzLaG1y/SP16BifikfAf
	b+AfjCb9cd43EddesAI8b6myEjVHFJbn/fKqjJbXhcLE=
X-Received: by 2002:a17:90b:184b:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e1ae9fabcmr2505725a91.11.1784030677431;
        Tue, 14 Jul 2026 05:04:37 -0700 (PDT)
X-Received: by 2002:a17:90b:184b:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e1ae9fabcmr2505666a91.11.1784030676707;
        Tue, 14 Jul 2026 05:04:36 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172e46basm1412585a91.9.2026.07.14.05.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:04:36 -0700 (PDT)
Message-ID: <27141365-9fbb-4377-9db4-dae281741d0e@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:34:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <alKYqD6yp97DV6R-@baldur>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <alKYqD6yp97DV6R-@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A6RIjRtm6eKaGe19Iwa6w9_Hc_r_KMsw
X-Proofpoint-ORIG-GUID: A6RIjRtm6eKaGe19Iwa6w9_Hc_r_KMsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX+ArQa3FpjtDu
 pTo6WfD7ij6mK9eD4Ng10Fpfr57sWV3m0M6POsp9l5UmF6hzKXE+wC0+DC36hTQuWUdOveznInQ
 I8iiUPPDMvIEEQ9unjLYOCV8hVQpLOCym0uxx3wIQMlps8ipd4pGeRyWkleFqRUukWRRqaUyar8
 9qConjfcChJ2IlR9c9S/ncHiIQQsoQ5aQf/GfCEpHg17tvulFwaTJHWYuZgato3E4oQDEW6Iqgg
 S05yKu4VvbcoBW+xUoENAYNBiI+1jkKDCv3I7tooZLTZ4K1Ky0E0nLA46WpIVha4O+/HN08LnFp
 k+tfwW/tDF2HvcyQKxa4DlkedyOte+z2qzqem9ol9421S9NPE4m6UFd6OxDLZ6l3XMWVkzTtG69
 wSYzYYBzLC3wekr6MYoZ+POAxYHhHwGGRBYZBPOBqSSTu70+wwKtQBPZVVkhrYqVdgJFXtgwWz+
 8CUC1W8kdBuFA8/kSeg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5625d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xYWi_SFv9V9xdDSnKu4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX5aMgPBxA1EW8
 TLnNnsPMczikagztxnCKtLWYkXOFBKc8nXDelyMg7DrEnYpCl4o4BJ7mSCMk9bOnCPIYaLgJSaO
 tKo0woX89RWlq3RX6szywsi38F3E5QI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140125

Hi Bjorn,

On 7/12/2026 1:11 AM, Bjorn Andersson wrote:
> On Sun, Jun 14, 2026 at 01:35:11PM +0530, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC node and define channels for:
>> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
>> - PM8550: Die temperature, VPH power, and system thermistors.
>>
>> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
>> correspond to the off-PMIC system thermistors connected via
>> PM8550 AMUX/GPIO lines.
> 
> These are connected to thermistors on the PCB, which would make them
> board-specific. In fact, you specify all 7 thermal-zones, but at least 2
> of those are not connected on my board according to the schematics.
> 
> So, I think the thermal-zones definitions should be deferred to
> board-specific dts.

Yes, I see your point, since thermistors can vary between boards,
it may be better to keep thermal-zones definitions in board-specific
dts files.

> 
>>
>> Also,add io-channels and io-channel-names properties to the
>> temp_alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
>>  1 file changed, 250 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> index 6a31a0adf8be..2e746ede850f 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> @@ -6,7 +6,9 @@
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/input/linux-event-codes.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>  #include <dt-bindings/spmi/spmi.h>
>> +#include "qcom-adc5-gen3.h"
>>  
>>  / {
>>  	thermal-zones {
>> @@ -189,6 +191,90 @@ trip1 {
>>  				};
>>  			};
>>  		};
>> +
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> 
> As I said above, this doesn't match my board.
> 
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		sys-1-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		sys-2-thermal {
> 
> This provides the temperature of my keyboard, so I'd certainly want to
> override the properties within - and perhaps use this for throttling
> things.
> 
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
> [..]
>> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
>>  
>>  			status = "disabled";
>>  		};
>> +
>> +		pmk8550_vadc: adc@9000 {
> [..]
>> +			channel@14a {
>> +				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> 
> I guess per my own argument, you don't know that this channel has a 100K
> resistor...
> 
> But that said, people have waited forever for this to be ready to allow
> thermal throttling of overheating laptops. So please just drop the
> thermal-zones, address Konrad's other comment and resubmit this.
> 

OK, please let me know in case you see any issues with the following
changes:

I'll drop the thermal-zones nodes for now. To avoid any error messages,
like from attempts at thermal device registration, I'll drop the "qcom,adc-tm"
property from channels having it and also the "#thermal-sensor-cells"
property from the main ADC node.

I'll keep the ADC channel nodes under the main ADC node in place and
delete the ones absent on Purwa boards in Purwa board files, to address
Konrad's comment.

Later, I can push a separate patch to add proper thermal configurations
for thermistors per board, and only for the boards we use internally.

Thanks,
Jishnu

> Regards,
> Bjorn

