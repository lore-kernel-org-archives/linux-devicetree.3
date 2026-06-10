Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587340B38D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098423; cv=none; b=E9mgNHigHRRZlu660YHOphYNBFgeOlt98NpHzwtDE+8HWZOhTC1oQYvJnLjcu6P4wOXIxMNJy1gNfNJwndFjhTuOhXgX5yV/e7P/0v4InyNEwCHnfbwRx8h0dsoPB7jE/Qk2XoXLxscYG9Iu3Bm/pegg1joXcsi+UsXZW+HzRzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098423; c=relaxed/simple;
	bh=7SY1PH293lcA3bYD35gQnFOlWsjpROvUy9VVFgIsYBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPChIVTKVa0fsf8RuSLf+HS6zOVRrZAMaQiF56btxvj9Z8Z0quCAFmmvQR5DjLmOF62TDCyV/Ji/Qn4tf+KhRGYbB8H0jYMVVngmbmTPaM4V7MLp3Q6KDcX0eHh84PEthHWlAf8lSY6vIcYoe7EUC4JlXwCmCk3HMXUHFAVrTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcacYaBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDaaMin1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcacYaBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDaaMin1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtJi1169916
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=; b=TcacYaBdx9GGqTgF
	GTgKtvwQLx94hjGwJLd5UXoXpGAczFvfoinq49yxWMBqiYOXxZiBnSbw6nZrTuea
	2ZenQ08LWd/+rCLvB4lWJPOV14hGhgyvP0lIsmvGaq/kOHF/AdH604BP8xPajjsZ
	vrTImnZUW+7k/q6h1CzMC6AY8e/u8UxSGcFjL+4FSfZqguDq+RdE2PnFUU7Ovvr3
	gff3CjLQR0+qb87l9YZT/Erh1ddJGoFX5KOxwO2escviSbYkq5aSzcR4A1CKQq1U
	gJrv56lYdWOTyyR4SfCZOC7P46bkGFn/FoLi+DHqVZNq0qPd6BNaIu/8TqKmt/TT
	1IbG6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s0v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:33:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so131601685a.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098416; x=1781703216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=;
        b=TDaaMin1qJtWL1o/G9ifew3zILitxFsQ56krHXO5cW/jZPGSfDr9qcM7XjfD3Scm3X
         jJzQZZurIwUFaSD3PbCgmAgi9HB9za9bl98MI5TI4PMDG6mkPdcNoEcbXnFO4lMpD/4U
         rOwxKwZiXvecUQoBbE6zlWrkB7pO8ZXwNpnWeMA7Ip2VJ/+zrt3hIEYWRYdu8yBSsPip
         C+yeurH6Fibhe9KMdmK8LpQO1x5H7mV/V9synx+zO3G8qLWqqumGJGieWgh2IP38jHe9
         Umv+eIGUhaObeG+gNt5lHYnRlF9mPt2KeoI5GavWzdtaEIg8qIMrOA+II6bDt9O6rbhJ
         OQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098416; x=1781703216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=;
        b=KERKcyGwBz7d2xECprfc/XUn2laanXk0kQ4KzDeQnGmScRdp1KunMq9LHeAH2DbP/a
         DqWGNnWMTMJ4uFFRhJwO/lpttz2Eg425+8ZkJvwKQb6ncOY9AoO2mg627rflCbP8YXFd
         Mz24tLCkowtDdE9GtC/ZSud3k1/gbheQJOrCw4DoyF0mYw8sixyH6BeeyC26P4z7RCwz
         a7hTx9GZ+ktdU8hUU+gn4KnZgcVJwE/+hsD7xbqZJ1L5r9OuWx6E4YiULwkM1qWMMi93
         wtARFayyHW+39kY7nlAVLRZbk7CiOVRZoOq8NVcTmWa2CxS2GxI5TDYyRBopXTPHo1Ov
         4t0A==
X-Forwarded-Encrypted: i=1; AFNElJ8FPzPuJz9F4DAiIjBLDLDqug9QL7Hx8XhC7HXndiShFNYsODoVFsJH4PpPAQ/zbTrdIvb1DamruGmi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DlpyCPvdCYf4QB/LOcpfW3ONYUgPi56YjC13DkZNVxJ8ZLPV
	q0/cQozqMefCguiDx2FjRkIP4dUzWQlqarH6kzEukWaPDAW2VUyyOYeorzNh2nDmm73PFd7OaqN
	kFeng7xexxRXtJ+TaxYOi/2dTHHsufCyuf1unfnsOymE6TrNK28uaeTEK+gfCq0BC
X-Gm-Gg: Acq92OEad4NciOSDxMrRtKmHRknj8KWhA5eNOt9yziI6LUAW9DzQqVKP/rZ7Wh75O7o
	ilQPBErmXcipbG5uMTyIw8b/os0OGc/vAESKWkfbuxcx0yfaci0jiAkK4vPM6klgyB6JwuqhaZd
	vDcbwtrliuDOP2abAWuaRDbbZ/dN63dH7xJzK/0JW8dXSJYl3PvIGMpLKYJOPUSmuY/fPCz06fc
	F0fvkrQm+OHqA0vcLRylU/S2YPo3Muz0sIqxkSaV78mbF1yzhO4uwvFezOdtf9FyIGbrqLSBdVY
	t579PI1nmzKCnaxMzcK1q1Own1Qjmrk1MLl1Fk+eEP8tJCXV4qYt05AgcsxqFJCFq4f37Xxh6Jv
	aKQpSCQ1fm3TB1NdU7Hi+nRZxE+JnBTXfAncAwZuGqU5nhsVhpkyFu7Tn
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr2525538185a.3.1781098415679;
        Wed, 10 Jun 2026 06:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr2525533985a.3.1781098415251;
        Wed, 10 Jun 2026 06:33:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed74asm5362236e87.13.2026.06.10.06.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:33:34 -0700 (PDT)
Message-ID: <2e90f4e5-7151-482f-bdac-4cb210ecf6de@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:33:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
 <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6OKeTig01rGKW51oZiZbDyj3e16d2AK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMCBTYWx0ZWRfX+XebaQqg0UmT
 YVUx8cV4TSiyKwjQ/tZSm7VSnCi427gxI6Kxh8w0VFyDsXtDc61mmFyON5EATdNqUGub0+va/i7
 6m2VkattBAA2JMmgiNccHJz2mJbwwiDPZRlNNBbWoyGT5tkjboXcGY9fhX3GG4f94mlCreBJ2QR
 yXo7MNtIDY3l/iH+phFUjQGhRqUmP8BeN1Yw26b4mPEpoi9Et7vV3s/UxfRFSSSIRtyve4YLZfA
 za43Ih9hDbeP0XSagXVfcQuhqQ7ELr6GZtrEmYyBxtv37YCdOlYCl/RMMg0426HuuXbfU/Q92HT
 yM816eb3BmuDyM3e7ae48t9BkuqUkvd0trDmr36DtEx+XzLptjF09V6o9M4DTblMsSSpoh9eEDS
 D1tRjB6HNCnjgVzFwIY7CyngHR835DyNJ/g5vrdQfBr10aQ0Wk++i0Jz8gZdO/8EN5lWnQ8aCS0
 QeS4FBfsOoJFedi7+bQ==
X-Proofpoint-GUID: 6OKeTig01rGKW51oZiZbDyj3e16d2AK6
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2967b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZzvzhfFT30TdYZK-mrMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100130

On 6/10/26 3:21 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:04:16PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
>> Describe that in the DT.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 2f67e665996f..b7cd1928335c 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
>>  			clock-names = "cfg_ahb", "ref";
>>  
>>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +			power-domains = <&rpmpd MSM8996_VDDMX>;
>> +			required-opps = <&rpmpd_opp4>;
> 
> Interesting, might it be the reason for QUSB PLL locking issues which I
> have been observing from time to time?

Possibly. I'm surprised that this is such a high value (4 out of 7,
whatever that used to mean in the olden RPM SMD times, maybe NOM?)
but that's what msm-3.18 uses..

Konrad
