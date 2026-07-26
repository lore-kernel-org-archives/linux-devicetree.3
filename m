Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5063C09E8
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785085737; cv=none; b=gySLSWeRGdT5Was0+Snog3kwblqJEzY8YG+4ihDJicjNX7rF8eF2DPz4e8yq2qQ675QmAkRyfQfohNIy7gpnmC5A2dJGIPCHx3HqbcnnnHHKYVlQG5H8sTtQP5x5sMSjZ77uy4s+JAJvGn5BijwqnEUa25+FOxpIDZl2PkR9DVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785085737; c=relaxed/simple;
	bh=3fweRvX7MMmIfm6fBBdLurF+STbGvyfWftLxuHCdRxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjRTT5hLz1rG65dD0or5txriaucKHJySEEsG/qmv5mWhCSWtW1WZXKrsestf6XMAUEgu36P3WO0ctaGSZp91FdOQn2FeoMmrqPYlhidlGFWREfvtZ9A/rJzFv/EXLT6SFJe84UNlkkGBTKpL7ngNjCWqrTO2qIxoryAe14w9WcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq8foyBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bhj1id4P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq8foyBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bhj1id4P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH73e21333213
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=; b=lq8foyBX9L6drq12
	ZuDookkAaOfZkS5kKuhL3iugpv12GkKl2Y23VadUuboRqfqaEKH2v37Eo5PZBQnV
	szKo0Q1EAJeNWGr2yidPbBQD1y/kb2LUMd4ZAIYKujKQ9Hd8cD15OAlTfzV1qZPm
	BNBi1bfByifqcABh7vBKw+2rWVs1HXfKd6dhyuYX0PuO2tTrrWUxrOwp7rRB/NtK
	36aPa7UJpvqsKTMiW5Tm77HAmMtt7TIklU68meS+kSG9Z1kGJAMTbF1PxTkdCj0T
	tBNH9KM5C9Lfss2DpBR7iE6kLtOE5jCCgqNc4iifXuxtmfk6pp8yRGq/p5jDJrIo
	tm/7eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbcaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so27273195ad.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785085734; x=1785690534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=Bhj1id4PbksnD7yv99r0Ny7CkeWPpGaNMw4/jtbne/0I+Ww0r7Ssvs7fQWLE8SR4kx
         8Mm+VeDqoX0qy2M4+DiohSSjv0s8pxX0R34NQy/J7jm+Um3TEP/+UXDvavKC3RALbvnL
         22qFwVJtnMQ0OtEQ7qVhHgXFYqzHbj8H35FnXVGODyzaH/g1CSf8CdY/PiFOJaNNh2LY
         R2zC9Gpx2XUEQ/JWx7yzh8oNpasfFWyU79sqZHpN768XiDaTKjcXzUi7JEjU1QPBpYfD
         H5vaIxqXfqmLJnBNk1hM2R8OWHWujIo4YlD0v3/hoRIi2NAGMLIKwooRCQ8j2M0lwVT8
         TGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785085734; x=1785690534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=XPe8WtHQ2Zgph3iaT8VW2o1aXK5OPE+l1PRAaa0frs/Dmp6xIUL68yzkWUj6R6v1MR
         yIUjwijDhcYiD8xQXodOGtq+3Y9qhzIME7goXJtRykocxdQz8g2rwljCOnVM6nHCoXzf
         OcTeZ+eL/lYFQ3B0ZK9EyrbR86KB5OnuY1RMU9hnN7/Bx8IkotPydcQfnzdagHu5nGAc
         7jJHMJfC1Eg9PVe5v9lcMjifpMk9ZKN5ITasSQ9HmusOxaYTrfIYq/D0G8+cDL/PP2tA
         v1SYIjXqD5dLmqDX1vMrbrsqewAnjMGmvBjeW4IoILdolxB4RnBAbUgRdwAcoAJt1D/e
         ZP8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEvmk6XgkzN0ySFB5DZXMW9o/gjsokIimOELn9Eb6ZfIYfD6t6DiJlK++I3w0Yyra3kCipUtz96ah5@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFzsleVCGAo5V1jqz5hSi5MnPpbSGSYJpGW4vufDDClaL06o2
	hjSdRPpfP9CkHF8v4xPUqXcw0ru1XcbKEdblXchlOa/qqstks3N929D1KAlI+1LiQn0XN44erO0
	gsD3K7j0lGy3NjT5KmNuIp+vj1Heju+h2s4FwCMZUqVOTY1sqybsiNuOshXmZnBVMBaEnr4Kq
X-Gm-Gg: AR+sD12Jdj7LeZaW2YJtbQvJ0rvESsscp0YbXmyiIXwzIz4D9WKZE/hMUS0QnmUicv/
	U9CF4gUeOti3p+pUDDsyMUUStazzMhKqvp/H7Zvr9dZO7g4Fpgl22590RcNDrBSTmXUV/tmlJ/h
	VQvtSC8BpGq8kIpG0HGP/JCBjJ4reXel+Y5/tbnVnHu1x3j05Qgq3Gp6927uEjDAB1esMn0BuZ0
	wTSY6NiurgRQsK+DQjn9kTHRke+qm3ldYCWWXnK7bpCHDg8DFBdZ4XuboeZ8GglHQCkWdhDnDpG
	6cBXBgQkS9PUv9cntQx5tOqXruisgF+ugtqohz7teVxlqb+VPvaAgsCXWLn7oYE/rJORLx6Yd6f
	WxRMUmCpOqEJzfeGtkh4+1k8nx1alrnQJAYKJIRzguXVLfYF8jm073vA7lotXQO9Uss3t
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293895ad.13.1785085733536;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293705ad.13.1785085733122;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
Received: from [192.168.1.9] ([122.177.243.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f442bsm21570895ad.65.2026.07.26.10.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 10:08:51 -0700 (PDT)
Message-ID: <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:38:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
 <amPdeL2GWkNhPoal@venus>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <amPdeL2GWkNhPoal@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a663f26 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SscvhSW7bbCibxPycpFs8Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gCZJ6Er7C-9YbjHnqbwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: IMdEJkWZoHlt3bO0F0U3bp84lKPM7pdx
X-Proofpoint-ORIG-GUID: IMdEJkWZoHlt3bO0F0U3bp84lKPM7pdx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfX+7TRceK/hqBV
 OEqpdbjI3L8AzlKeHtJSCD6feqMTw4ypNR/xiy+BmPdGvUNVZf9bWL5Zx3mtombkqnzicyDWikE
 MN6IqPYQEj3sKRGHSmDOKfL+xVkfgWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfX2fMNjHpTMv5Z
 SEZPoMKJ6L+Hl+AERVEl+pT/JDnINBOgmUeQPdhxjrdiTypx3fPhhvnzQwd4Le+SuLDs3q1XrGn
 tK2fhKin7zJ+kgk6sHuKlJEdYLvAwUiV2mLEU10QzgO+Si3IquNEPyxF7+a+EPQGlmQSlbpcnz1
 jGRptS6Pqu4d8H4ZMsr1Rzn3nNFWywrsK5zz+d0S5V7w4nxmmyegf8jVJdCBdfVNEC4RYU29CBI
 3RyEsfjfMJJR3HiS7o0hIdXygJPuw3qeo71eZP94cLcGNl7N3DoZDLrVLQiYpCfPBYl1pu3eEiX
 RJM3c67ul6aLDdyPa17pe4I+00v0A81gkpNa33Jhp++xDS6OG+/df/YFeBLIFRB713KcpjH3I+F
 XKDO7uxXoFqy6nZe3ACrcVU0am0RMIIfA4//GBf89RXgb8fUuoZfCShrwFx1be3rqQGr+1wCty9
 k3JwtWpZWVSQdG3lGCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260174



On 7/25/2026 3:21 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Jul 23, 2026 at 04:09:06PM +0530, Krishna Kurapati wrote:
>> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
>> connected to it. Set the phy type to EUSB2 to let the controller know
>> the phy type when queried during its probe.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index f90bf7e95463..e139b17bcda5 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
>>   #define USB_PHY_RST_MASK		GENMASK(1, 0)
>>   #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
>> @@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return PTR_ERR(generic_phy);
>>   	}
>>   
>> +	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
> 
> Isn't there a potential race condition if it's handled in this way?
> 
> 1. phy-snps-eusb2 probe: PHY is registered
> 2. dwc3 probes
> 3. phy-snps-eusb2 probe: PHY type is set
> 

How about we do this get_type call after dwc3_probe call during 
dwc3_qcom_probe. That way we can ensure phy is up for sure since core 
init has to happen as part of dwc3_probe.

Regards,
Krishna,

> Greetings,
> 
> -- Sebastian
> 
>> +
>>   	dev_set_drvdata(dev, phy);
>>   	phy_set_drvdata(generic_phy, phy);
>>   
>>
>> -- 
>> 2.34.1
>>
>>

