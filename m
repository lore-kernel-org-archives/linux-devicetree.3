Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155823ACA79
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565213; cv=none; b=l2kCoSJw+iD22s0Y01/kIh2yj/3J21AePsBv6M3kQkoJVrtqzgtra6EvE5nPd7CL1QMtl72UxhfTIPuRyDnV9KU/wiOdX1acb1dUAc01dTVYoCz+Qtdyc7mSo55zpq1wy4ZshiMXZNnHyAl057Pzr677pfVgkTkLV46d1Qq7K+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565213; c=relaxed/simple;
	bh=/SFRWd4s6/zDXRWcNQtbzjimLl77s3aTX/GJXWKcwpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyrCyaieM5u/PioAk2AqSopZ539ty21zyTd7Vj7By0SJKCMtzLVZn3vzySD/qwwu7pN5e1Amn5g/T068vr9nx5JGnS0oBoBajF+DyK0rASYDRzkfVDW6pEJM3upN+ajNWbRLQklHsWFTpD1YnfWjlIOkxGq1p6e0K2ZHpkIPMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRdR7Sx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMO0QPgp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRdR7Sx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMO0QPgp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbDxw1493152
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=; b=DRdR7Sx94OAR5rKQ
	GpSjlI3Et0TCCMsP/se5dpCAJnMz9quWray0E0ed0GMKSPyH3sdiMHPw52vGvrNN
	K2idutEA4pSTiUDjOw4gJlrfu085cjCzHZnKUqWy/L9M15fF0yMEBf3SPuHb69Tb
	/qRchcrGQowVYP2AaGPRakqGMveRXEE3t9MBxOMMwZl90VVVyE9eNBdAdQk7zsoM
	gye+n5p9+877nlqHwNnj4HuxkjzfyF1lHXPZZ+KvcMymLvdhPf8h0HbhCrnE5N+k
	v1RIVU+CUW9hUA6Wcfmi/Szea7zLZuKc9MWZCKV8mIrRpudOx1AhNGrJqHjWUgk8
	d6KvIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h73kgg677-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 17:00:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8884a02ee85so6973584b3a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791565204; x=1792170004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=AMO0QPgptxRGyMYnuo3J52oYI4gDXgnHC/1pdrOnToursr8aI2LeTa1qKntZADtfCh
         E0rCA6Afd5nMYNFBJUiWQvEpXVkq25HJzRqsYYx51yYZCj8N27R45rdVAkUzoA1P82lW
         IvLzHM8k2xgwUgfHK788Qcang8p6P+g4/dkJTwQfRUyVQIx+LSDSBlbgbdLKqNe5U9Og
         VxkdMZ3c9rrsAQbwUaVaF5bOxsuVxXCfdrDgt5ZerRzdi6uIi8bed0zz0Wf3puyL3VDJ
         vUm06lClHtppmqCAa14ZQtR3NOV9PXViCfeb9tB6uxkPVuQy+Yuif3QH8HtI2yMuUuTg
         Yb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565204; x=1792170004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=EMi8nwy/3WP9oGMoPaIfRX+qEm36P2YG6uCGH/3n0IcTRNcjZ/K8D/Cb/T1kTz9ccf
         UdeUi3b1Sr9ahW42rlw6CKj918ZQJrHpWKaUKR85UwuWb+v50rvU7azqgcFUmTep4gKL
         l4teA/8g75kyy9XKzGsILmG34DJ+zUFGM0iN/0yNKT4rlUqgFvAxCiHGlw8SjiSMOvia
         p77i1GlSen4PMCp57pyOCbN/CT10CFNWoPSNl8QIU7LT4krV6DYm9FxnM9VwbqZazgnQ
         P8lTRGwE9xSJRyqA115YZg0/me8GUyc7noM2eukyXQOxcGoYtkm7A7xBpo22iTfWhgeT
         fkBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4HxTonU/VGrOs3krIcVGI3BmxXcTpU8DuVI0v+JDTs5nIegkT1nY2KsOndC0sr38ACsl+a8U3kjD1@vger.kernel.org
X-Gm-Message-State: AFuF++nCPaJ5OP8I+0CPGla+TRCN4VTKmAVhNn9vqURAHETngPi5i3Uo
	PLLm0v/HD30frvTJkIw49+HZz11l8EPOjFbHW4KrPgjxDJqcFT4awZrxEBAOOKh4xluH3FrAXFi
	riBDjV1fsvzR3Whz4d9iE8RdH8e+OaScFVVThuAMHtjGyYrfDWF/r4eBjLImj6T8a
X-Gm-Gg: AYBFou33RK0CmK3eygNyw3SxclpHJCwM4ad0uJ13aO5VkmOgMtcD+/sFzsd0l+LxdAv
	OpSvlhgGmnTYVFLKOJ7aFZLdp4dBAtsZMWhl18G90EyausqNZJlhigkuVnOu2udPwv70NZR4QlR
	5zNrUGGX4TaJWZ4374kE2xo+52XjQ+Dv4wMAcXGvhRSTokdyjdjxrRQMGe4go4aPQKaqtkLxVt4
	MucUkh9o2HCjHM0LmvvhgaVssca+mTSTCHCbTzMf+Bl9Coy7VuDJ9R3wjpWhrvaOBLeisqEVhPh
	xwY7jCTDkElFpPowje7PO2LCKzHIOnn5vTqBJfscKqhsTH4xiHy/KQRErgkTsPF9UaFuW5pWXsT
	06CGUQtLTblf8Jv0amm6d02k3gSqp9/EJgdOOTWlVQ4IF+mfYm79fgSHA/kXTzwMOe5LE
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2589982637.18.1791565204200;
        Fri, 09 Oct 2026 10:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2589960637.18.1791565203736;
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.100.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm1395220a12.31.2026.10.09.09.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Message-ID: <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 22:29:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <asNji2_GUda8x245@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfXykTGCb3NCJ2S
 WK58VnlerInvcOQGsRwZAoZLAVuHwRITfMEog8QuAvrXx0LT7kQ889GLl5KkxF470YG01Uulawn
 eUfnWK1ykSU3AjXypY9nU3EBbBMBtuoCOhFrfkMLdKQ8+mRNjuEnkHpT8y5iMGjyyHP5TAUr4s0
 eTSmvc++SbeDkoCJKYbR7AbtU6BjJN4fBGScFQ3CORLQkjV5XE7j7xru9VvJGe8ct5SGUU9/gkq
 NVA024zucZESmk7NizTN3HkSawkMyNHmhkw/PcU4T+s/SKlVRH84Sxq+MwOFOAgbxIo7WpuKyaR
 2SqnikqsXrKtiPK+GxypZWo60Wz8H5j/YhHFgqAnsnQ3VYhKkPHYYEEb13cz/3b44R/3YmTIo4Z
 ojMa6fvjO9LoygWz2J6VcxLAhCHxN9blzNP/MuhSig4hczUwv1tl+1uFim6DOpHgtmOkBJnrIzP
 EvBlqIOvRTZpMkjD0MA==
X-Authority-Analysis: v=2.4 cv=RfYFmFtv c=1 sm=1 tr=0 ts=6ac91d94 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=jBUYxde0W5cEf5DRjetLAw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=a43HgpfhDiYDw8gHJIcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 88uYbHJqjoP3o2BhixOtOUGwv1kWghko
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX6DrG/G9NeB49
 g6rCdULFsbkh3mvbh4PMnqNIzseDAfhi2CIT36CmNQaarY6T4NkztbOniGNx+eBhtkwFAoBe6uc
 cN7AAoh2QRoXjEVDfWuPcptq3etwkYg=
X-Proofpoint-GUID: 88uYbHJqjoP3o2BhixOtOUGwv1kWghko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090067



On 10/5/2026 2:14 PM, Vinod Koul wrote:
> On 13-09-26, 20:10, Krishna Kurapati wrote:
>> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
>> required to know the type of phy (rather than the operating mode) because
>> DP and DM interrupt lines need to be configured differently for each of
>> them.
> 
> Does the controller care? In preceding patch you defined the EUSB2 in dt
> type, so this describes the hardware. So phy knows it is usb or eusb...
>>

Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now 
its type, but it needs to communicate the same to controller.

>> Add support to cache the PHY_TYPE and add the following helpers:
>>
>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>
>> - phy_get_type() for the consumers (like USB controllers) to query the
>> type of phy connected to them.
> 
> I am not convinced that this is the way to go... Driver already knows
> the type and should use it...
> we alreayd have mode, i am inclined to not say yes to adding type here
> 

"Mode" attribute describes the current operating scenario of the phy 
(device mode, host mode, high speed, super speed etc.,). But it doesn't 
describe the type of hardware and hence a new attribute.

Regards,
Krishna,

>>
>> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index ea47975e288a..038c2b58bbe1 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -21,6 +21,8 @@
>>   #include <linux/phy/phy-lvds.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   struct phy;
>>   
>>   enum phy_mode {
>> @@ -152,11 +154,13 @@ struct phy_ops {
>>    * @bus_width: Data path width implemented by PHY
>>    * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
>>    * @mode: PHY mode
>> + * @type: PHY type
>>    */
>>   struct phy_attrs {
>>   	u32			bus_width;
>>   	u32			max_link_rate;
>>   	enum phy_mode		mode;
>> +	int			type;
>>   };
>>   
>>   /**
>> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   {
>>   	return phy->attrs.mode;
>>   }
>> +
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	if (phy)
>> +		return phy->attrs.type;
>> +
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +	phy->attrs.type = type;
>> +}
>> +
>>   int phy_reset(struct phy *phy);
>>   int phy_calibrate(struct phy *phy);
>>   int phy_notify_connect(struct phy *phy, int port);
>> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   	return PHY_MODE_INVALID;
>>   }
>>   
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +}
>> +
>>   static inline int phy_reset(struct phy *phy)
>>   {
>>   	if (!phy)
>>
>> -- 
>> 2.34.1
> 

