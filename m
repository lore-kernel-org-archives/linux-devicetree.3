Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3C4FDA77
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675995; cv=none; b=DawSCMqX2WA2rmIuGuPdKCCUYkzF1qqcOFVwo3BULLxyIgE2m214BOgt68y3hwr5GsA4dYmKpFNO7g3l4DCzCTaZ7m+8qOFfDnADpqr4hRcZfg5WfqePXPZlLAtDAPIjBkgp8+vg38Ijq3K3M5qHXOqjYuvY9zYu3IhmNyyom6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675995; c=relaxed/simple;
	bh=9Xgc6UQ5KNhU9TgRSQYjuJRejAzY/LAix8Z0rUXJIYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkdN95NQzi3eBFJ8MEcaNarAUHVEhfkiVY0QNQsFMfrb7Kog+qnuHC7do24iBvKFvmJ2n3Uj+n10WgkR+UhHiADzl5hG0PBFJ+JPI3ZlwW6WpXa8JdHzk47KMhaKZX2R8W2VaFOO97ppOyHKExj3JBoQVxlgXZCHbFClDifrd+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXDRv9bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayiJtHeJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXDRv9bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayiJtHeJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TkeP4097687
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=; b=mXDRv9bjA58j+Tob
	SE7hSwMlWvbcfx41LCoagatKQWM0+TWRE1ieogFPw8Gh61qLUUoVmvh8cAdPCyLV
	bLBDAe42vT46BMmSiEmh5vChlAQyYSHtVYpsH4Rpqu4VYeLSsBOGHzSSltGEY2du
	TT+UhktN863kN6EQRmd0Y+aS6+dNqIa/q/0tKnYYppaf2MqAaS5Dr3b1+pITBfn+
	Qvy9i0mwJwJ+okxnimNlLBvKRwbDgsWqhdnXYDyPxa5tfmSbyoMfZFrJvuJXwWqe
	RtorqU6ZP3j5VFwBvh0jR90J9bhugvyag8QVQ28Ruk/kl/a/3gGeKyRZZyIuaDKt
	5zLKyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1urc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:59:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c57e0436aso321520185a.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675989; x=1791280789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=;
        b=ayiJtHeJKy/Bcyaw0vMyyh6HbSXZWOgVYsnW0SMXMpDKUEhqFsKA9YZDd0ZB34K1Uf
         /GktmIG0K5Vb7axF1VMD1mKzC3z99NyrL2JoU9bK1AH/GvrEKD7iI6znioIZAseTJ9Ga
         KVyNylqlx10rsZSZGzsv5GkSYDz0CHTYL/IIBd5KQb0+/ykr8D2Qd2LT+1XpGkYgt2aH
         ZIr4xWlcw4IvRaS1SQtr/motzH3L8B44/GoV15V6toxAGfr1+t4zODQGDrl1LcXvUJmc
         1JKKb4l9UaBYmNFmDKByZDi+E0mwi+apwT/eGImOIzkqcBexkoXySC0bCY1wQKjNVUjx
         bP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675989; x=1791280789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=;
        b=s58uRY18CRKsc/T+oNovFgsz91jB6P5lQliObgHnMg3lMe8xfo/ZpFbVj1niDUpdHf
         cNjRFSNB7TvRa11RtOJfPw+hsJS7qdsAieIxYHaX9WPREEMWgg0vRMGbLRJtrHbHUtl5
         GYv7srOjkGIdPwl/6CohkSQxMHKz90GWk2hTriUj3ju7POYbNGsMTcHVtKUIcGyzk5wb
         j9WRj8xW6C88IFsaud3aomaUJuvirocg6Y1SOFR98Zg22K80nK2tUDoALfn8qNR3z24I
         d7E0cMJSnIiVKZmtANjkYwPfYdvtkitwasrA5K8nko4xPayOn5Y2lqzHLetoQ7tYWkCI
         yfrA==
X-Forwarded-Encrypted: i=1; AKwUvByJ9kw6YdA5TOiyLFDhWkpgwbIOXCWXTfD/+Owhh4+nWWRwnwK6b40XCZ90qg49Xsc+nrQChjYuGe/B@vger.kernel.org
X-Gm-Message-State: AFuF++l/ocb7dqqXpwK82noQIJI2vR+fzTzYq8u+TPTzxqH4y4lgZW90
	ZKUrTEvZsvqlbejCamVgU0c6Ro+E5+Nv4SNt9Zo65lk6y/tZnIVxdMuOBcGMR2HWC04Ct843JvZ
	CGGJxHC9REr5wl7WdKjraA1/iWD0SexkRmA3o+ubfEqCgPh9O1j6TOe7WlEqllQv5
X-Gm-Gg: AYBFou3pfGYPpmWQuSi0zMA6CNY+obWFbh9ixE2vbPwvDEY7Tihssnh+yCtG8t6xJVN
	id6VgyBjDIxufePZ4KqAW/69/DSN6bSxiRzHmtGxv9JxeMlORTh9W3NKSB5Viq28MJIleLkINrv
	36X7NaMSgW7f3lYk9U2RqRFyEU6t/Q+BzrEQJEF3zUTR7rGyYkvDfvch6ASd1o3B2Kruf60Btnq
	j24T8tDvjh5DsXE5eLgyE16ghJI8UE2JfUuF4yIdZBHCfTq/7uUmy+h+mUIoKClOIAOEycrOY4a
	PUd5qhdY4LssxJXzHjKgB58rJ0QaeFAKJLdINHbplRwxtq4vLTqVwmBW7tbItmjqu6UuVlBlO4y
	+K1xGbtFQ9hRuSr8NRTkyXirvzl/+WpeP2Qw/VTPhxWJ5RX/R7E8pk4r0HXnUCQ==
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr2578311085a.43.1790675988722;
        Tue, 29 Sep 2026 02:59:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr2578307785a.43.1790675988156;
        Tue, 29 Sep 2026 02:59:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm3353200f8f.11.2026.09.29.02.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:59:47 -0700 (PDT)
Message-ID: <4846bb08-9317-407a-a25a-8437a599ee7d@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:59:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <aruFjEq4AfcIOxa3@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aruFjEq4AfcIOxa3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfXyPwUnlDmwa1n
 TpecnhcqjU19TN39dituGDl/mgVu3wLw1YHBuur5K0Em97jGWf1LLL0U12aAIkVEVUmQiIds3zp
 7g9ZLo5/nNzjV3T63PyO9GUZHuj1PK8=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb8c15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8k6WQxmsAAAA:8
 a=7Jf4kJHaAAAA:8 a=EUspDBNiAAAA:8 a=yHKr3JDVMgr7eIydpkwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=B30mOkiisUNQCrgcu9ts:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX0b9ol8SnM1Nl
 N1TSh6AS9PctSAyB3VV4gZJZdnS3x4uadFo9o/17m49dOCWQDpAqV/7SzKyE3PQJrXCT0396Vfq
 LFrnNwINgyx0e7kcJYgNe9mxgjOpDPLdchjEwkTdRoj6/UgBU+ujuQKv6tIxjBv8ISUc8tbHXtu
 /JxnKWQW4coiaXNJQ3luvGP8gj/uivTmP2PfL58xEf9lUn44eqgZAAkp0hAV1qNn7uatrb1psXo
 UL6C+AE54LjdVgJ0szl6IkIMHS7MGUvkPXFMCLOxZAzorG8+3ejeroTKIcd7R1D8mWBcAr65jNb
 0jafGb8n3oQwDZ8KT/69iuvGuPDtyWWn/CjjbqS42uAiT7iKBdfFrDe7W9BL3HDoYvKFETbDLUW
 OJlTBoTtidVFLnfK01E51/R+QTo87cfGMXoH4773eWvWo4EhYWo6QGLsnMx+i4o63/Eqj4jflFK
 dZQgxI3RTeT0EiP94Bw==
X-Proofpoint-GUID: ObhVKOzvbubiV48QoaPK6pVxTKEJ5qNL
X-Proofpoint-ORIG-GUID: ObhVKOzvbubiV48QoaPK6pVxTKEJ5qNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290039

On 9/29/26 11:31, Stephan Gerhold wrote:
> On Tue, Sep 22, 2026 at 08:18:18PM +0200, Daniel Lezcano wrote:
>> Add the thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> The keyboard area is the main thermal constraint under sustained CPU
>> load. Add a passive thermal zone for it and progressively throttle the
>> three CPU groups as the temperature approaches the 53°C limit. The
>> groups are activated at 49°C, 51°C and 53°C respectively, with a
>> 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> The cooling maps limit each CPU cooling device to state 6, which
>> corresponds to approximately 1.9 GHz. Testing showed that the system can
>> sustain the workload with all three CPU clusters capped at this
>> frequency while maintaining the expected performance, making it a
>> suitable upper cooling state for thermal regulation.
>>
>> Several configurations were evaluated while tuning the keyboard zone.
>> Using a single 53°C trip for all CPUs allowed the temperature to rise
>> quickly but resulted in a stable operating point around 54.3°C, about
>> 1.3°C above the intended limit. Introducing staged cooling before the
>> target significantly reduced the thermal overshoot. A 49/51/53°C
>> configuration kept the steady-state temperature close to 53°C, while a
>> later 49.5/51.5/53°C configuration improved the heating response but
>> shifted the equilibrium slightly above the target. Based on these
>> results, keep the earlier 49/51/53°C staging.
>>
>> Also add a passive back-cover thermal zone which uses the GPU as a
>> cooling device at 64°C, together with a 73°C critical shutdown trip.
>>
>> Describe the remaining SMB, SDX, east and west board temperature
>> sensors as monitoring-only thermal zones, and enable ADC thermal
>> monitoring on the corresponding PMK8550 VADC channels.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>>   1 file changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> index 5cc6a63d1ef6..9407868864ad 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> @@ -10,6 +10,117 @@ / {
>>   	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>>   		     "qcom,x1e78100", "qcom,x1e80100";
>>   
>> +	thermal-zones {
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> 
> I believe this is "towards back cover next to heat pipe" on T14s, not
> "keyboard".
> 
> SYS_THERM1 is RT8502 and you can find that labelled on the top bottom
> right in this mainboard picture:
> https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
> 
> In the T14s, the mainboard is mounted 180° rotated, you can see the same
> part of the mainboard in the top middle here, above the heat pipe,
> facing towards the back cover:
> https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg

Thanks for pointing it out, I'll double check

>> +
>> +			trips {
>> +
>> +				keyboard_alert0: trip-point0 {
>> +					temperature = <49000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
> 
> If I'm reading the Windows ACPI setup correctly, it starts throttling
> much later. The main thermal zone used for throttling on Windows is
> TZ40, which is thermistor 2 read through the qcom-hamoa-ec interface
> (b94000.i2c, 'i2cget -y N 0x36 0x2a b'). TZ39 with thermistor 1 looks
> like the SoC thermistor, so TZ40 could be the EC equivalent of
> SYS_THERM1, i.e. RT8202 also visible in the mainboard picture above.
> 
> On Windows, TZ40 is configured as follows on my T14s:
> 
> Passive throttling starting at:
>   - 3310 dK (57.85°C), power mode "balanced" (current default for EC)
>   - 3330 dK (59.85°C), power mode "performance"
>   - 3230 dK (49.85°C), power mode "low power"

Yes, probably it is time to take benefit of the platform profile in 
order to change the trip points.

> Cooling devices:
>   - CLS0.CPU0-3
>   - CLS1.CPU0-3
>   - CLS2.CPU0-3
>   - GPU0
> 
> If we start throttling earlier than Windows, I would be worried that the
> EC will not reach the trip point for maximum fan speed, and we'll end up
> overly throttling the device.

Mmmh, that is a good point.

I don't know the thermal management in Windows and if it has exactly the 
same design as the Linux thermal framework.

As we can set multiple passive trip points, may be we can try to step in 
the different cooling devices instead of making them all together tied 
with a single trip point.

Or do you think it is better to just make all devices capped at the same 
time ?
