Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7C130F92E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944955; cv=none; b=gZiDhlf4+hN6drnoBaKnLCaTxzKHtjNDNm4AmJXB8+QNNq3yzl9FeH3L4LuRtElONE4vMjf30QIax23PAHC9eryD2fexvssB3/lAUy+Y1dMak3YlOCxE26SZbCIwd+YGYPf+2XH3ZwZUELjqUcsgaR9+KLgPhk00L9GaHHB6qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944955; c=relaxed/simple;
	bh=n869U33FgzQwQgeAx52QnufJ4gsAYthki6NGc+wQWZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4VncMeT9O2s1uwb/MQccZ6UbplCK6Yu7lw6xbcyjjaEsXLaSTt9jIQWr08fwpcS5SvbtsJYCWPrMo857ReppMFbt+0iXxsKY+dc446AqIAL1umZSnBaX38OWIB/ZybHFQLYJpwtS9bzoNOHi/CkQpYP0pdmyzuQNJph2Pg5c9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4Ci4anG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ3KlKyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4Ci4anG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ3KlKyQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68967GNe129793
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=; b=F4Ci4anGRiSYp4BE
	IpcscbNIAe64rKx47jXH447Xmey98s12mspnUsfyakiPlMsAcqLD7UkcZUOiSVVO
	2LPKss7dF0jKvnnGF6wk2vHxaO7SuWsI8v1oUe11bgT/TJttP541ZLAQEcjp0S95
	F/TUSHKpm3NlMaCK8pZC1nAgZwaVH3JzpwdticLCXkE/tP1lQmEghvkH8+KNuKnC
	xY8Wiifm4c9IIm4CFosV3kpriWb3kPS7cm4EYocs6Lw5uv3tvrZYf1rAvTnrO7o/
	BvqmKidQuqVFtHxNElIQSfY4EVpd/cJSuBcKFskAhCFHWS8Ea1GxOxSUhfQczKP1
	BZKuYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpkqd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so106024785a.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944952; x=1789549752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=cQ3KlKyQKxSbsvsz8ba9ciSByGFTFafEQP7z8t0pVxgSLbbDhkaAZkYcpuIwV6/h6V
         zltXvDMIp2ButP+JdZCLQ76Nq04EGnwnsGxS/tZzNNjmmoWUfyvIe4ExYz77zTBeSAZs
         7wFrLqE7W4J9PIGvob9x23kCA/R9zoiZ3DzOYa2JSBJxMw7IQBoOVI3hIWiHsMXFFIyQ
         G/ozNtIHNZfBtTho1whKItQmoc4m9OXUKstvsgpNVACi0Juufgvhx+UmK9oP1L/0Y4ZA
         bpY4fLfiRrqv91SToeCJEf/5M5Sf4Srve/vR/r0zmPUJJ48qi33q9FoQ2c6u4BL6LUK3
         n+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944952; x=1789549752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=ThMyWhzu/z6BZkexO7mf6bzEcp3bfliYWdwL3p0xVUK4qcNWBq/VTSswoEe4CTHIqN
         6nRsKMJZ0eZdS0DN4a63+4a+2Pb0N1IIgeMNBOjYdH3kho8GSW54yztedjqjR06pO+ly
         283So8gXYhAyYfXneYV9ritks5JVXgoNvEghQwGJCzt7VjhZXZ8uuS44oUnUO6JwJz4m
         uRB8pcqQKJYLD33HQ+IJ0+m3OC/OTwIvL442lYPLooI60j41WUL75zu7EtnRR+FIz6/B
         fE5LW+CyZCMYUQIP0ufF2PTcaH4HAe8AiPi1S8XArjeZjvT1JPiCeZYKKY/R59Fz4TR0
         of5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxE4rTzSMxUKkiOIJslHApwXZaD02hluxGxNkpEctZCq0z7kjbmeWzhQYb596g1tn1uwJ6vTW5ntyY9@vger.kernel.org
X-Gm-Message-State: AFuF++kQQQU0y1U6n86eW9LTtg+sPiFR7qU0TpG0qJwLCrg4PSUPboaB
	p+wbkDPfypGnuG8S8qgNvHgvd7+LzESOMasLPgXEt2KhAKPcNsP1aDhQbWmFzw7y09SL0homxgZ
	M14UUmgZbiiA4/b4O3b4OhiU2AchBDBHWaH8UagyuxTduK2jap3iOe1y6KTFhGNP9
X-Gm-Gg: AYBFou1NeKGc87PlweSBYiOMJgZywTJhDhSTf9vxi2D4zfqAg7dnTpkQ0V/bUQaI8tX
	sKQDZKwm7DHPo94e2qrEJX5ktyrJ+5GEHfel1RsKk38RWAgVK8xR2kAnpdaJFQTArg7a9PLRb4/
	LBURlRw0qedRPHpHQT5G7TtuC59Ltf+HPSUJe/vsNVskPNaIT5m0Nsmtgb4vS2zUVzkcjN2OPqc
	f3zd/MQuIRfb7RoZa5vbdglkxpiO7Yij+JM8gfG9zodXoKVThn26LCaavYNlU7QRABF/026dIuv
	WlOK5UWYeSoPDjJcbNVsmxK3m216+KQsBXpomi9AugN/VAfKvUi3D5J/CmN0hgemL3OiO9Rcwbo
	ZcsbeFOKd5jwV1KmdPLmcsA==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979971885a.5.1788944952172;
        Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979966085a.5.1788944951632;
        Wed, 09 Sep 2026 02:09:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm1274405a12.16.2026.09.09.02.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:09:09 -0700 (PDT)
Message-ID: <775b06dc-d97b-432d-96b8-f645f685b845@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:09:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXwOGHxH+ZRIJ6
 x278zcGfyLXeDVs43b2oGDNPyBEQa5BFoInH6adBqll69dLha6eQ8mJH+gcIJzZ/tlPBhaX4C+1
 antwNUVmL8SuIEhMRY3K6ejUbqrMkTYPqLuH7i6f2lQUROtcDQqBB8HCkir3ofAhAOnsjotP1Qo
 BNh41gBBbC5FrnMJgNagKr5854nwwrpNeID8PMW7aid6a/0qs/OmFmiiBhRdg6ec5C5b2LKgD0i
 wP9uaV7BiikKMO2ccjWInWxJ7/eLsL5SDmMeSI7oN/RVLvHu9CVvb88ZxyQP+nYHlgCwCwbmEp/
 OEMQ6Gbx7WOe9w3K2xjeOEA6dUahS6A0QnYv1/aNue8FNP8j2UMHWLmK1Ka72d29DxFbUSRhfDR
 0ifL/2GlXwl4zDl1LpkIkWIo10CH2AVhnO0wc2MqGCE10JY5cXVckMxMibkSikbbLayVHIs/BfE
 WILlgFubwWs7OrbcTJA==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa12238 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xUZbN4lFiT613QqVwd_EwJKAWF930ZXa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXwRV+IzDLbpXu
 hCfIXq0j5qWDbib5NES/EVC3PvV7BATwFZaHZoK7BGR2Ss2odhwXXwKn1xfZOobn3zsEnq9CqJQ
 eqx6as/2HaA5rxAhzRrJXNWY+ioFyPQ=
X-Proofpoint-GUID: xUZbN4lFiT613QqVwd_EwJKAWF930ZXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090101

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
