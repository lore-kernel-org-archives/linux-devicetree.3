Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905403C10B4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178887; cv=none; b=f5964JDwAHuj5I9AtICSANOo5T8qjwRJV+uB4RK2ieMGFgxvuYnIUEP7m0LL6VmA5DXa8BMFewDlNBLKpW4NQ6qXqU9ukJDdP/MzeHtyOl2sFdIFDpgjOragADRtNgWG+zq1EEdQyuydoFtURNHtpv1PgJJAwZ0Xquec0MuTnu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178887; c=relaxed/simple;
	bh=aGzMDiq3cXRRQ/rhHELbsPnJZmxLWFamWZhd4QjjA7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvfdN8wX5e0vv31ur0ikLFRg2EI8JqF4mYh9fvfDBbxsM10zMV3OaKBqAqhX21HzbQSAeQI2RTjlu8ZnO9zlUAF2Z7D+i1N9BPnhNnvshm1GAQb1sE+pGHCIe5rJ03vDAN4DgsLQo73auhpunSmBLSzvcy0KN935F2Vr2NFb/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs1+TR8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQvpyBwB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs1+TR8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQvpyBwB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBdG242655
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=; b=Vs1+TR8uABKi9vdf
	EaNT3+3T3+ivWOG518iWwjstcT4N/16Ogs2Q6NeLReXD27OBBtcAI3Xq35M5ogH5
	p7baLPTsZlpUnTHyNKmgpCRTWr1XTC38e7gscqeFk7Cz6mFWaCZicobTdQj7YtZ4
	UWMAIaBI+x6jySlIt5TSHVHT4yMsTv0E6eLw9pIruBDsUg2AP06luMK3I2mcStxT
	+/Esz/eCMPjhOaGw/50ArjckxNZTea4LNhwgu6M/XzOXHqJNMNpNGbV5jKatcCd5
	mKNqj1p3ijlVbRbxaf8v447s02XjMRmeQAnBscDQebqcWggdRy8CxR2iMtPdpgjg
	glfxiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:54:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550f68e7cso186061985a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781178885; x=1781783685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=;
        b=TQvpyBwBeDCTdjxAIEmheNYBKBdHt//+tB+d6FbWRnSp0HLZraIte3FVk58Z5sHwzE
         qeva+QzDXck6CVhyuPE7ZvZz5g9KQ86/ZxnruEUSGAO9UHRR6xzCvQ6uzewWf+WlvygJ
         9nbEBEg5AhcqMzNwzR0Ibgs22pO7s6twQZSRHFWtgVjWECfF8S22GvhIyAe0xyhFinkH
         F/UASn3YgF8A+CvmYkJVhzfjoNgALUGR6xg2FNDT/s3SIh0D64UljQgYkuj+7KmksiBs
         UtSDpxYf5/O5+6eMg9ksmHIxiExARAmgljjIcshMNhdZfC3kK7/k1Xqyjw8l4S4LdCkX
         r+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178885; x=1781783685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=;
        b=IuAUxuwWbuhW4YH9/OwJEOPjJnPuAaMy3OAij84qGrPa+52zomKPhZnlIMh2b5VD08
         8kyPzlysaBEOFk3K89U9fFAckrDQ/+qnAlK6MEXEd725aP0oDSYJk9GX6/utdUw85CqG
         YGfZvLuUDj/RLTUEC128Y0kWf5iVBLFH156MeYpNyUAv04pqzeySo0UGIMkMzk+zgnRj
         xAQ312L/4JRHFSRNUrFWIk/h1ptJDfDTY6jUh6GssCUwCdzDI37UdgDeU6yilRnJPY4L
         dEVJq6ucJSnytqmenRVsSIPLx7wRmAruCRVjcIejBt5MSlnEM/n+stmKrjZA6Zh/8EVd
         dvZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iilVx/kSKxPKJz/vsnF4eBUTkzKpWg7KhU5FDhVGmfN+8rozVf4yt/D1ED91cYIjurZ8dIoRAuANz@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdB5psOZajUWjmIJEkUasr0CRZ27dgfvNbwqRhoiVADEEQCid
	yMX9/NRa/iuOZdFPx/RD6GfTsvd7j5SyYHUWYRpDHLsZ8z0UE+FLN/KJDh3X0KbJyp9rmz7NLBa
	0i5gxWpjqSyVfZeov/sNyhlUeZS3Uqigw8XYOTJsbXHUKPgw7QK6ovD7skghiDr7P
X-Gm-Gg: Acq92OFEAK4B4qfK5rVbCkRRQBIKzOYl8Ymvf5Cur+NIyWHcKKV3GX2G8ARGmUuUTGf
	jRf9ipGEvb8v9t0Vkk/QbM/bV6hgSMRdVzSisAc5WgnjjH782iC0HaRxm4sFVO/MeY52zzKI8Fn
	aPEI/0Ec0+E6m5ysXiof9Zb0UkoRukUGifpixh9OtNqB9XMn0+N9Z0l+WI+hhzfOBEbCkdBucUW
	GHJ7enRgXVnRkXPDyMckFnmM4IlOLwFHeYxRHpBO7jNWoeyp2UCzcEr7K9p7NwPGCPPpwzqjl8n
	SsjS0QxL68hIIMIkh3Eq609kYknSdzyFX+1Gk3rIGHnEzZkEaqZY6LBBJ3TVl/m+T36AcKjpnA0
	QiKUWa1oZV+sVUFZjhY4jbEmIHvN8X6DXJR13N5BCQqxzjk91GYe3LpWO
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr198784285a.4.1781178884894;
        Thu, 11 Jun 2026 04:54:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr198780185a.4.1781178884422;
        Thu, 11 Jun 2026 04:54:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abe4a9sm55098666b.46.2026.06.11.04.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:54:43 -0700 (PDT)
Message-ID: <f492327c-7ee1-443f-bb11-b78af0eda207@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:54:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Andrew Lunn <andrew@lunn.ch>,
        George Moussalem <george.moussalem@outlook.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
 <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
 <SN7PR19MB673634FEEF98FB8BCBBB15979D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <471a21f2-7ab0-410c-861d-5722a94b127d@lunn.ch>
 <SN7PR19MB67363B4F852FB37071637A299D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX8UkRa7epsgfD
 hbhT1h9G4v8i6AImu/bSH2PcPM8Ra4JhdAPmbrnRLiIPSyk4STFarU913n6bKyH6BvMmu4TWFIF
 2xeOSK6+drVmdO+5cue8lpK/foC8H69uxQV74F8gdh8YlLkSJis14LN3TK8kuF8YfrkvdWMnvdL
 jLIHce/GOR8N01HKK0ZuWuUoT3rjKfllrMpT+TncVmq+2lGFuXn3TByJ/nv1ZnGXyjRAhAB35f0
 MbM92Li37TPhfz4MT9E6XnNkFwYhbJsx7oTXOH/1NSAyOLYKququoO5hV6A/q9GTROfP2PPaoy4
 zCVSqphPEh68IHffqsOu+k0pkw6PwfuX9sNrjFa+7lIeyXuM6KfZ+kbYgd2CW/gxIS8ax3fshrK
 fBXL1KFAt1iICRysPgRjaKiIQYYiJNHRahOHbKw5isQyTWJbFHrqym/4490QoBroV9TlzVkVr3i
 7lUBjdxgPGvNNy6u0Eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXy1apCGHmxvx6
 mbPDkytsEhr3jIdXuEpwo+4gy8BFawUoQYXw7rFllKaXlSnJhxOnhlgupn+4jnPbFVF+ehNPb6K
 F+3dQAcSGqyt2wSbuPugR5sk7y4h0O0=
X-Proofpoint-GUID: YKbrl2NUWNb8yWgvAnGbAj5QrMm8n_M9
X-Proofpoint-ORIG-GUID: YKbrl2NUWNb8yWgvAnGbAj5QrMm8n_M9
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2aa205 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=C1GzXxPXE202J-4HI-EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110120

On 6/5/26 8:14 PM, Andrew Lunn wrote:
>>>> This PHY is integrated into the IPQ5018 SoC, connected to the first GMAC
>>>> (GMAC0) and probed upon boot. However, this PHY is not used on all
>>>> boards because an external PHY or switch can be wired to the SoC's
>>>> second GMAC instead (through a PCS). So from a power management
>>>> perspective, it would be better if we can disable the clocks if there's
>>>> no link detected.
>>>
>>> Humm, is link the correct criteria? If the PHY is not used,
>>> .config_aneg should not be called. Why not have the probe method get
>>> the optional clocks, but leave them off. When .config_aneg is called
>>> for the first time, enable the clocks?
>>
>> Will check if config_aneg is called and test accordingly.
>>
>> ip link set eth0 up/down and cable (un)plug do trigger
>> link_change_notify, and based on the link state the RX/TX clocks are
>> turned off/on properly.
> 
> You are talking about something else here. You say the device is not
> used. If it is not used, .config_aneg should not be called.
> 
> This is a second use case, the device is used, and you want to limit
> the power it consumes, when there is no link. Do you have any numbers?
> How much power is actually saved?

If the PHY is part of the SoC, keeping it online would require some
more hw to be online, so it probably sums up.. I don't know for sure,
I don't really work with the router SoCs

Is there any prior art wrt enabling/disabling the PHYs (not necessarily
clocks specifically, but say power supplies) at runtime?
A quick grep only points to this very driver, which gets the regulator
during probe, enables it and never turns it off

Maybe +Kathiravan knows more?

Konrad
