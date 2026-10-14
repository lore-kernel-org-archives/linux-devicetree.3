Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261F21A453
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941041; cv=none; b=ZwWEfh47+8RmzlPug2BtSWuF9xVAPYBLDNGf5V9Em2aEekJ/DdOKnSFO18wN2ensGJJwm/rdo58ERRJVOJ6LFMm3weUh1krecPMomKlEw9Qxp3QXHUdkObjYEp2BJqXONvYoG7A5VKhhSrj9hJuA6h5mSE9kT/5WmyyZhBo763U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941041; c=relaxed/simple;
	bh=bME5i0DZIV1lF2NykRIiMJxtZ8bK6OAsp3vw9WaYnKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZOBdByn2VKBqEQPVlbZA3PEx0Q8lmtUeuKzmjssIJ4opF4J0RXh2HIknX/qtNfNKG8pdi9nn3DnonkWDP/1Is6OvMgMZ3KQBXujue43AgAygCBxa98Iu2Uo8F81cPwUtqtEwfHAX9gj4RrkWsvfOBpB9yZyWKoe1o7U+z08kdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAWqs9Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbGnihuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAWqs9Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbGnihuV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DMVDu63104065
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=; b=ZAWqs9Nku6EgdLWr
	O+52qKP98n4qtMbEHVbuz6r4yUh99KZ1p2ZTvHpqUi4KbwwqGgmCHfjjDjbsydvw
	81Z7y1Iu1p3h22OF9HEA6FsI+SHB6S6UUVxHFlVIRY2hb2AP9XribDpq7avCfbGQ
	2HTod1fCyoA0htHMwR/hz3LbVsMgXFnluFHDyvR9lWxl8m9ERhEeOJtn5h6X9OSX
	r5NAccZkKshiPWq8+TsW44CD2VejeAIr3s8a22Ed/Rb9BZmNGxNAqeIwQGBsjF3v
	l62ZSqBcj/XbhlFkbFBYd9SgSRw93OzrgLnPG5IWPbD5fCImNYzCgEinqxjbO/ZW
	PS/o9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt0fgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:23:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so3582371a91.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791941038; x=1792545838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=LbGnihuVCOJRH7tjTLJPWzBC+niHAgmpVw+7VuL7pGZHE2tS+NeJUif+S1/4SOs6JT
         ckp+JHHx16mkDlaD09NK90TudRgEcGw3LLeANCzzCJpifhN7OE7Y6yzx0eo/QauOd9rY
         PAPi3M3jz0VJAGuiUTAk7SWZlbI4ebYxLKuHf+5gBhXOgoE7rS//MeKdae9/yLXOYpgP
         qbL1KqlxH+gngPYHThoPSX59QYqWyjRXNoN5R8murfgnlhKWYfdbr7jET27SC1H/IcqX
         ATSglJKM1xtTbhxM4XiSebEnYbDP77aIl7CXnn9h2HQ48tliE002WRYF8ytCOCbncAU2
         dYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791941038; x=1792545838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=Hcc7xS2iA+4zGO+bYsqj7rCRPtHVWLEAyk4vlj5F52NqG043UxMxHDhcrDatJLPtHM
         zD1zFekQ3mb0t3Ycjsx3hoq4XqegBHEh/6bnxmZEVHaWp3F/g/OPJKo4t/HJe7os7BAm
         i+l0hSemnJl4lvsCx9ip0Oew4gQ8Ta/kwuNpF0GNW0bMaUE6GaEYsgW4y6SQuilJwL/1
         qOH4cVoNaCpTOPmeuMwnqYhKx9npEeTpBVt6Ek2Vtl42hmIpOSDS/5Y4PXw2tR76z8R4
         sfRVozMCewShiUmL3MF21yb43n5n3GgkVqRcrXyXhAorfm7cibY32PzVXHefaM/k30Tg
         NyFA==
X-Forwarded-Encrypted: i=1; AKwUvBwqjOcd36rOVaZdw5JadS2lrAuowEjOiQVQxAZSl/6+PfmATbMJROhDYH/6c4DpZvCgjuRgxwgSsJs1@vger.kernel.org
X-Gm-Message-State: AFq9FYLC8H4vlLuKvD6j2a8Z5DpxjWBjW6k61kVpCz4k/xdhiEkqoIP4
	pegDjLBWmDfcPEBzUBOhLIM3Qpp2Cew2q13PkCOZ7Du05XgXMvRe8XHU5nTTUz+f5OtQuedZIO1
	WOqUMLYk0lPsnmaa2sKOX5sq1XX6xzAWkMv1lNHppdhZZQ7Lv0TI3IIw2xiCidgTr
X-Gm-Gg: AYBFou00TGD8MCuYlO0snVF6Brlal2lahK5a/oANkV3aferhHXtSRQYUvE8mnN4C6F9
	t7shlQ6hFXmZaQQzhR0MbCR2blZ2A2QouyT7tCKn5G0xigHA1SNuUPwqOwpQ+e9yK4o83n7NW0h
	HtzsWg5rO/MQdAWC4Ocn+t+IqT+YW6mLbFBm5OlQfMmuvZt3RiY8eaow/UdPsPqI3d7SJqNkTVr
	NGbSY/z/kaGu7GADqWPZiV9TNAYy7Kt8b+h8jgWtq84DndB+Ikciw1OXRDj9//F/qCOMvM4UOaI
	VBBg5I0kKOQLt+TTXsbsMSFP8OHDJoCRpSAdMPwhZaqH5LBrypZzANuxgzAxLm3nYB0OzM4PahO
	tIokyPA/y30JkZC20cBSOcHJcrQAsWY+yc5bx6qrNbz3VKUd5WLTdy4uHq50ojAIV
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738465a91.2.1791941038151;
        Tue, 13 Oct 2026 18:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738443a91.2.1791941037641;
        Tue, 13 Oct 2026 18:23:57 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac678d2229sm616463a91.3.2026.10.13.18.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:23:56 -0700 (PDT)
Message-ID: <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:23:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX+GmgCYXslp1p
 /StUx0/9PqdOUGKME43Pd5FLO4irv6Mj3ZwIiR+kW/gSBBw/vyUQnY2QisvIKjdS8ul6/ucwYJr
 M4O3/+rH/JsiUmXkP77hBb9vQ373olxZouvuDE8nB/TyrFtsh15jBaMxWrpd8QzEAb3D1G8aAth
 QOLxfSKOcROni6XpWYcafFj06ufihQ69PTPUqX76NPxf3aHb5iBvOtJ9+EF5HJSQLtrauNHYS53
 hwtuwFl2qxAvVlijP9L+kcQREgOVCvDESDee1hWTCAf68oVZ/tCkRDbTJJxYks1s9pUvNxXa+6h
 Ek0zcyDmGxADQMq/js/aNc2m1ESlyF51+Byxm8YbWwZSPRjr6POnWCpGlITeaU/8SEZ/tbDYWI4
 4gkAXEB70jX3ELa6eDCukKSu/HNtaFOxjNWBRJalCTzKt+lI2eOJ0loP7uDcjDQSN+9Hrz8l5aH
 ILuDd5rTo615m8G1TTg==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6aced9af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ay6wXbw5ScRiw2kLOwEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: TiAYDsMbVAlT9RvUyraLlQjA7sTcYP9A
X-Proofpoint-ORIG-GUID: TiAYDsMbVAlT9RvUyraLlQjA7sTcYP9A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfXz61nYCpL0r8s
 +VFx0Pb6xTE3qTQEOWP3snEfvTFR80fswuhueqK3YGDzDojvUKp6ex4S5wPIZ2Zs9SvRGUXNyhO
 j/URPsUIZfD8eoPNo1f8DSCG3fEuJ7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140005



On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETE,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the cluster_pd domain to
>> each of these nodes, so their power state is tied to the CPU cluster
>> domain and the runtime PM core can power the domain on before the
>> devices are accessed and let it be powered off otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>>   1 file changed, 567 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 131fd2a16c54..d9313de53ee5 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>>   		};
>>   	};
>>   
>> +	ete-0 {
>> +		compatible = "arm,embedded-trace-extension";
> 
> No power-domains for these too?

ETM/ETE device is the debug device of the CPU, no power-domain property 
attached to the device and the power management operations relies on the 
CPU itself.

I missed qcom,skip-power-up; for those nodes, ETE device should not 
check the power state of the device.

Will send new version to address it.

> 
> [...]
> 
>> +		tmc@1d029000 {
>> +			compatible = "arm,coresight-tmc", "arm,primecell";
>> +			reg = <0x0 0x1d029000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			power-domains = <&cluster_pd>;
> 
> Is there only being a single cluster_pd a mistake on kaanapali?
> 

 From psci map, KNP only has one cluster_pd shared among all CPUs.

Hi Jingyi,

Can you please help to comment this part?

Thanks,
Jie

> The CPUs have a different Aff1 value in the MPIDR register, so one
> would think there's 2 (also according to the cpu-map)
> 
> Konrad

