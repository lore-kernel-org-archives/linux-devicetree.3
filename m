Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264934;
	b=kmIJmpc+k2al+HZ2VFYInl06mAUwcnD4OB8kKZglTglo9cEQ3kfsWeCoVfGAbR+4Zjh/
	 2V/plaBgnLuixu/+PW7tFl1grEyu4UE2eesyIDUK7EFn6DCf42shAtdstIMzM/VXT9JJF
	 DsVU3Q5aQ6qbVtdB0Upu1wJOu0CFlvzPh3dHy542hzeUmheXZuKm1IjYesOGKIJ2I+3x8
	 /BRwyMnhpVEsSyIHNLYtcgMRImqzHRIHlNCghx3LUq0lalq8+96DCw/q6JasnfG/3txWR
	 TH76jG7MZ8RGftaRTO2fGwaEh76a/AfI8dbF31CLjokavpTPQ+Yn8S1OdtzCOrC86Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
	b=MMcVXikKdaWC3v0L4D2kH7aSkGKhjCZIFZ637wBfLT+vde2mL79jbpc3qsuVYE8Uxv+I
	 OTYiKlI6kj9CPhCm72NDFEbg0aGnQwmfECzgeatrOxIAVtcpodC1ip5S6+I1QOTerhqFw
	 OxYAUSw4+RNmXei+Cpsy7eTYfLVmR3EEfwWUTOTgmiv35zYvOnstqcmjJM9jZLTqqMVWx
	 n98vcnU1Pg6FosH8LGki6IVlzoT5xBY4TW0rB2cLxc9VQ014V8PXvmSONSlC2ZFVLsn0e
	 iXMQDHhiG162GXX0yt5DHC/BTM5EBqPEOGq9eE6ix+5f/0Ebx3zaWcZvsGrM4A1sgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D729606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D729606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vHb03766076
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=; b=JfLpqT4E2z86BnrD
	rpjh/O+SJAZqd2RuxnUSnwHWbjQpSzdsEuO4rPVslqU81GRZPwV9M67X2uP39che
	+8IUmRGwImPFC8500NMG4G+ETcSn8jeyvI+ik1W3QQF/4114r5wdglAahfyz8C0M
	6T4KMrfAjpvdgfT3FqGQA8hIvfW3SepexSfKwevJLbI/hZffAEq0fhmIjQgm/pte
	Y3Vg5idvHPghSVexB5SJsUkfvxUCeY2o1+sBe6sU/FzCo0ZFxazdzCWkG/gLGTNh
	HWbKyMuTkhJ3DUZl9RU71C5MLG7qa+5ndmdGBhCQ1SUVFg2TuKKl7yhJHeZ5Q5Y/
	HMPe1Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpttrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1459353a12.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264932; x=1793869732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=CJcgHsMf5EX6+gI2yDqQ861uOiP6ReCSiXGlMgLjNq+thhc9dM9PdWlwPvLWTh5SRN
         HJPE7pUOibNEYXiybfcauozltWvvZqdhWnJLzMGKRltCSU6o0fpBVcFa+bCybTjePyvR
         CNc1GQCw3gzMGaau/w7yBv398MuDrgrzgbW51bWm5UR5SbBk6sAoPlEtAZtkIRNEf9cn
         vOozfeGJKTrMRKKMp5gTUlfuZrbBujdAZ1dj02GJOzlRaHnJWT/1mnhjBQg46abLrA/Y
         aBKhKGaEI681+3hSWQuIKvifKMws0+flrcp8VBNgW8GN2c/mWQiOlm5Zog8XhhqrTnDZ
         lWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264932; x=1793869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=hf4DRRS1SCu79gfSJAPL1Eh1ZNyjL8OFQfM1Jl+BmMv+MUl7J3Tn3J6RJYgSSfaezM
         fdxCPg68FuxaiPmvG6CeOdI5vJpQiDZhNN54y8x5srLyASnMpgjuWMvTPk5mZdaMQGgq
         PzepnZxvWu0RpbqRUnfc4QyNPXY0MT18r+6lI7J59XQtZ+iSqK62pGRL3WThCAmM8arS
         5UIZG4nd1IcMI9zoOsDZNqgsbDDfTQHJTD2moK2RUd7SY4STHKnOEsQTH/LEFtFUJE2b
         JKpT0m4T8RbU3MzY+L7h0zTa8tNuEnwwqPiAaW15Rqets0NczxC2nL3ts/pLhCMPy5Pg
         fIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf/FV/o6XP6ykNG3lQSBW5XHx25M/Z13hCLvjQG8pJSZwqFoEnr4vaTQFCCusVxb6PpumC+P+VHvwN@vger.kernel.org
X-Gm-Message-State: AFq9FYJyhGi3T6MjhBKjVYD6bPJz9hbg5yEl782nw7yaf+3iVSdQPHB1
	xPjn6lwRdIxAqPejCgKoQpUSmrC0Hpz3hJLRX3SBAc25sHIZvW05RpzKercuX3s6jmi/wpoS9vv
	2zgCyTAV72s4UcxlV2F3yZi7E4l5OeDXLlSyARVdByo2TGtejYHA+Bo9onC44DSuZ
X-Gm-Gg: AYBFou060KowAe3q1sJo+0qcFzxO3iwkjm0AylGctfvDyd635Z03xyecqIBOEMZjoDr
	FphpeDEjMraHgCz/OVXPQ3LxpJCsm1o8XyorL4rIHZ8y25hsF72l7jOuA8NkmqZYwep8yJRfKWy
	hSIdiBqkqq/NMH77mAZRJDJsqPOeGZdcJTRlZ3F1R8i4FirOlUHum2v4jRDrstkMqsYH+oWh2F3
	rvEsJScjlZWkzpqIvXwlKDX2S9avQXfGMhv3CxkcqayqcJOl89uybbuWemMmDbjYNjOm+y7bpHh
	zdu+Ee6suvDiWWhY47fGzH2Yr2Taa9iQK0Svv7PhTSZkk9IVujHLOHQKabqHIu4tJTjxXY9fsxq
	34lE9nwnLe3uFs6ZGYRGXN53NSxA42o6f5vD5adc+oqXhqwTMArpMa3ipmIasB67dJuFjmdVn6s
	3tadWwg/IynBVSN+jJjdPl2ObG6d5rCakgsx+92+nw4jNDlZp383Wf2GtbiLEm
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036779637.38.1793264932300;
        Thu, 29 Oct 2026 02:08:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036765637.38.1793264931832;
        Thu, 29 Oct 2026 02:08:51 -0700 (PDT)
Received: from [10.79.116.57] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm2039697b3a.28.2026.10.29.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:50 -0700 (PDT)
Message-ID: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:38:44 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX4PphUBeeckZs
 PIbl1/RTOIyF8JicFkTH1z2N8krd7ALFwvDDXKX/Nc0/udyihr3DFTKgTe7I/mEDxNY6LvyRgmS
 +vHNDk8laOgzKkIK8ayG/CsQzMdslBCP+cwrxKL4RjpPC64rrn74nkSWreZPVDPKnPvlR4fhVLo
 YetdY+n+/SIhQ3tj8hmESii1VqILJldAe19jwB2zVfE4aCaIQsdsgpPfv52NdYIda+oEHV6oK/0
 f0fCQ7I/Zd9w9UZGxwPwHwdW1Ib85WzIkW2qg/q747JN7vJUQE9gXnirud79iRfPURUFVLrfADp
 eWGF1tEb51xPMzlaqsXh/n+ELMPgNZO14Mz1hfLcB11V8nuY8VJkgiI5D1ULF8YfbZMAWTIYkGL
 9OznFd1zua16b1vwZ9y4tyy4IdmAiYHLz3XY+l4UTMAFhaQLVvaPobrLoMFgW2xay3QKyhedMip
 FBMKsAZYO0a2PABn8NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfXyMBtaQiu3asg
 wL6denReQREteS6SOPv7vFCQ7TRPgfEw8Pi+p+LCB49+3LwS/RJsHiB3i0tlpsryB4k0NWmDbnz
 ecw3R5wdmu2obhDPdLxHgyiUmyWYFxs=
X-Proofpoint-ORIG-GUID: ekJlJV2CnhxaVUrFhuolCVCvSI7xKDNG
X-Proofpoint-GUID: ekJlJV2CnhxaVUrFhuolCVCvSI7xKDNG
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30d25 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HxamSshyuiQp_YgWtbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035



On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index e27c697e3170..571c98124a40 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -594,10 +594,12 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	embedded-controller@76 {
>> +	ec: embedded-controller@76 {
> "ec" is a super short label, perhaps let's spell out
> embedded_controller
>

Thanks for you review, I will rename the label to embedded_controller.
> [...]
> 
>> +&thermal_zones {
>> +	ec-back-cover {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 2>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> This is *really* hot!
>

The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
lower value if this is too high for the keyboard and back-cover sensors.
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +
>> +	ec-keyboard {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 1>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> Likewise
> 
> Konrad

-- 
Best Regards,
Anvesh

