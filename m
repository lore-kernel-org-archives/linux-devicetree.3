Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ECE383C94
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401766; cv=none; b=dExVocn83CZ1uKVAuxSj6BMV4LcdGdb6VCp9AlXpYqvDqflUCTinK1zB0TAtPa+Lr4eg5Of5qut6vKd7M6ghIN16dRTGoFe2qg7yj6OHnzylioUSDmtfGVyzvsFafALBAjZTxWmPEcAIDZCCviOCt4XnU7pOFsyhtM/ofCMNOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401766; c=relaxed/simple;
	bh=ApKlw4zdM1kqaFRJB1TkfiMNzc9jbXcEnTAG9K+OdVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcunwxbAYXzmlHEsqWi8jSqIYbDrKGR7/fgrzC+y63ew7y7AYaEF5yyXwhbY0pKup8cr5BMvOcRhbXENbi9i8ZFhPMHkIkh/6Z1egRqxoZpXMJAieXnMVr3VUor0vm47mEajdOZMsWjHYytZCBL3rlT5bctmZQzplr7HOCfsgxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVak5XrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpjKsq6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVak5XrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpjKsq6H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Mgq2645714
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=; b=jVak5XrJF8UTqII2
	2wV4zicP7nMHMmWN8O9uOWpCPLgbM30BMFwSfOef1wXQnOqZXGyACOlQUW34CBqj
	NX21SMPjKCD59TblcAUkFlAYvMiXvOAl7nsyM31fG86Tz37GN/n+XneQ/bjvWQ9m
	XAq6qH+dzIwY04IPJR2Umwqn4bTjKJ6kVe2UHnVrFbNlt3OVt2un8GoGJ7+Or37S
	1hBZ+Jjr4z6ITWHl/N67P5SCy0XDbbZyaiFHw7tztDAqbvlgJC/PwnerAuuTvfSw
	86Q4qwPJt3AnFKyHa49hs0k3wC/BWSwBz+FY06L4rbkPamtD5c7OONivXulLJ0vm
	tj+0og==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cqa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:22:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478947e047so7312226b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401762; x=1784006562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=;
        b=UpjKsq6HCiKHz5MxiD94LWe3LWFvSafWF27CDPaey2HJPE5G+MPjkjfCtzTX6Je8n4
         W5Zhyf5c+a7OXp2p4J/gNeIrOvO0+2YAwYBLKDP8ZRFqny/YKD9Mvq7CqLojX4Zk+ALR
         KPOPGSsvcUSLAIp9GN00i1ol/Ooncg8dbN3gEZVByghEesVqtjlmhlc/t0100ip9axnb
         91zAuPYxXvL0owhEZ7+zWl0oHjph1yLze8+gwkfHsS+fbSqBNU+MwOQIfBGukj/mtc4o
         ORUr/8t1OZLisBWlndiIFNUcRGEZp4L1EAkx2QMixhP6y5agKcaMdzkD8MC9AtdT5L71
         2bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401763; x=1784006563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=;
        b=SDhpe3SfMUxUHHjwdWa5NF6wIW2cwLz31pw12d7WOg9QtoRNgG7MFN4ZB58FtXn2hg
         I19Wp1nBkm/JKZjIdWSV7qocw5V13sF04qDYNU7hqIjOCJNfT+23+ai6aYvDf3md/t29
         to4VinE2NyegBdSu4VVpHR2CbdQwN82JZ/kO073lkrV4iJr0nLF2Ds4qZiyb4hDuLqdF
         GmW1+1I02SkHnPgii+honFYbZDYgM7w5jvsRUosJVofmNR3VAqgbnxS9Y2eHVrUzXCZ/
         g/L4UZzsYTEvHb4gGnOhP2Or7bfjQf62goKIvrDsZxS26YviygGcQDQorLvfCDrXXIrK
         zsOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0ScJ+fc0G768n2JBpqn5elqneSZ5I72bzoj/fAzzkDIa56lAs32PHsf28B+fdii81R7wND2kAyGKz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoz4WHbi9hsRmhLOxixpwO70iAJOr4icsxoC/JtU09SoPCoH/0
	6LURkqn9X2cqXnucbB2U0+jx23SmOR0rPw4m49rA1x2Vt8XgMUAkPLYW7m55+BBtSieVq6x7/04
	svEyDv960B+FM++s2xY+4S9kuwSH42qSBgsJ5TWHsAdJp3xZCfUdxRvMYFLR89f/u
X-Gm-Gg: AfdE7ckFMb+wflq0EVY6PwDBwV6kExzl1ccpg07Uv2efdHltaQFRAo+65oHFTfqOz75
	6fywKDTiCq+Uy40UPAZlgzHrmAmEdx4R3dqcewcoWpq/GMBlayoqZSOx7h25sn2EmI6dx8w/+vl
	AdJh+oLsGSQr7zWYiPn9mab2+wPT3yTJVzjlIcepRIKjb60ssnd7osKhxRdoeBaCONDJGTrYRqt
	YSLmJV4J+Y0BTEeb75iELIyrSY2XQwoyTzeKCh7W8qaZt6ti9GfGNCg2f1fADwOZWkZUPRbAXS1
	zM1UJpyKpx+cybsFpncBHY5cZqpzwscgnexn8JYRbsU/eusZWoOMqX67oATyufp2zQ5OZFfS/UW
	26dr80t7lfaU9zwdbwBmdRFehLK8VdHuXwOWYtaywAPpjKSZPyK2FChlPdhEJvTh/HsIv88W/Wu
	Bxn4vu
X-Received: by 2002:a05:6a00:234c:b0:847:8107:1bd7 with SMTP id d2e1a72fcca58-84826decac2mr3441056b3a.53.1783401762572;
        Mon, 06 Jul 2026 22:22:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:234c:b0:847:8107:1bd7 with SMTP id d2e1a72fcca58-84826decac2mr3441022b3a.53.1783401762139;
        Mon, 06 Jul 2026 22:22:42 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a915sm4707164b3a.44.2026.07.06.22.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:22:41 -0700 (PDT)
Message-ID: <27b3c359-d8f6-40f8-8da6-48fa6decbf36@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:52:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
 <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LpKggfQrWrAgJUb2NYB_zpy9kB8rz6Gj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX1aGNOOnQeiZK
 nlw8ngvUCP6ioeR04QyVc9j+tsQUotFYANSU5vnQ06NFyKE740o8HiMKy3VgdXvcxoRO64UCB/u
 h7oOcv9IJ7ZhcMrl06sBJ1rvAd8VKcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX7QLES8t3394b
 htWPYhdGWjXcc06t87wMKkXCddkKt2QYQdUu+gi5xP4y+VcGTywPg81znPj90dJQxPhK+nT1/16
 aLyARL2Lqp/rrGboNwh0tin9N7izhT6njJUo77PQYXMmIGVK2W3c9EYz6CRe1LYCKY1i4RtCVm1
 bnsb7qMIZKOs4vnPduqeiX826L/k9P/iACPMYpMOpl/xyTzmU/AjhCZzt7/usHzPi+e+mZ3F3hc
 7PtVYLFXgrkZ09dZoqmEHqORE147kU+dm5ARLjjunR1JKmaPO+7JPnmf6wp3+HO6EKtfbdVx6Dz
 WIlYwiqMQ/Igv+w+CpeWmp/W71DIB+HHx5KBS6rSH0iVAZDGnv4ayIAimQr5G/89rFzy9x6nqTf
 d0s80ZgvZ2iq+CBP541SCVKMQ2r65n4YRcLaFYy5/LoHniC1YPMXpi2sXOVbQk+t3dsOD0pSC/5
 qDo7p0CD+jxUmt7p+DA==
X-Proofpoint-GUID: LpKggfQrWrAgJUb2NYB_zpy9kB8rz6Gj
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c8d23 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=S2spThItiBpve86ZF9EA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048


On 7/1/2026 4:05 PM, Konrad Dybcio wrote:
> On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
>> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
>> has three downstream ports.Two embedded Ethernet devices are present
>> on one of the downstream ports. All the ports present in the
>> node represent the downstream ports and embedded endpoints.
>>
>> Power to the TC9563 is supplied through two LDO regulators, which
>> are on by default and are added as fixed regulators. TC9563 can be
>> configured through I2C.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie {
>> +	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
> This property belongs to the port node
>
> Please also mention in the commit message the reason for the
> PERST# pin remaining undescribed
>
> Konrad

ACK'd.

Sushrut

