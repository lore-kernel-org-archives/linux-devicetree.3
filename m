Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E71E98E3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260922; cv=none; b=j8yBzwtwQIONAK88T+9EPirTNxkhEzuFV+lbnP2VEk1Fxxb+IL+YDPf0XK1PWX3ic0rOoQfdznZW0bZ4bEuNFZl/+wmZ56NRUty90VOg8rinY1XnkgkBFkspRY3i66y7sGmy9JMOEy12NB2F8r9BNlzMOhYKeAfF5z6k0zudih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260922; c=relaxed/simple;
	bh=92cLXHzrAqf48BacIkw6uQDUxQE3a6GefFXkFcyNUzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEFOV/pXupCJd53eEg7ORftMh4iLvw0UsZUtCub5rqzzm07TsLZw3/LGzi/fDDVMVSEmMfeHRzStJqOOmvozUEgj/wiEurwQRi0ZScr/CQ7KLzjEoQl3w8mX0rv/vqwrHBPbI/46HP3pxNXGOm/NxNEHV0bHZVID60baTMv9yrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAUBte/C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+YKTevn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAUBte/C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+YKTevn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33s9i496323
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VSfn/psaW64aaGF/jOJqnZFrdwGIefKJhxAL9S6G7U=; b=dAUBte/CCOQRcMar
	lCWCerGkyQB7DmiX0xnHHWkPGVgOABd9E2cTtKpaG7jp+1iKq29aG2k1xT8UUIAN
	2gKDcZ/Zs8o/rTHeVrMD8z+emUzeE6OKFM7gpDV8LvjL1lz1/EtPNhkOS9AmYnh0
	MB1mmGWreo4uGRsQWse+9hQnutmsDaHx11gNBcMRt84MIeWpN502rfJIOfPNBMhU
	Z5J9FsGziAcogwRP7RKlH1yJieH0GQOGkTU4/l0TPRzbmxYPniiwueDCuRehi1H8
	b/MfYBtZ42h0siNoQE+CnKZco+xEsE9WgiPOOzPqmvGJ088vOZ2qfhfZIs5oMfNT
	C0gxXQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex4fsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:01:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so14054336b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260919; x=1784865719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VSfn/psaW64aaGF/jOJqnZFrdwGIefKJhxAL9S6G7U=;
        b=B+YKTevn6kmEp2qoCaTMa/+4qZqaeS1RoQQq4La5G8xiYDNklCdr5tCQr48JR5svOT
         /89r/qXdN53CSfqoETPDgGzguDdqIjN+ZqShkgZZ9kVAGih2jHCQbcjTfBPeJ4ODrY9s
         ggBghyN1TU1ryRIm6p3jhzwa4ki5MtHnACaHo5Sv0w2LFJDZ7ZY/+qAvulW0cWSRrkOo
         xnbBYC9H3usOyp5+dTFrokN8/bXBuR88/mo+Hs9Dn5va5G7bM9PnnF26k+BJ+Ci24VlC
         8i3bThItnh5aPEEJdkKmCaJlysRyxIt6KVF41zEwAI7cDm2SF5K5cbUkOl6pK92o8naY
         E6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260919; x=1784865719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VSfn/psaW64aaGF/jOJqnZFrdwGIefKJhxAL9S6G7U=;
        b=QeeAKOAmpgr8NTk9+xg0zPGf31ft+4N95RJ6Vt0+kIRARI+vJTbhf+eEnB/Kg9vIGL
         bk/04/PxlnemCxXDXItx5JBlIWgAWkz/y1chnbP5X26ue8OsnMaTcqyAvlRpNc6iQH77
         ygSU5y06Trh7IvKYTxaiESw16qvJSAxAZ5QzgjJ9wdYRZevAKiVw73GMiwEMZTQEO46j
         p5rCVI121rgB5XTcKqFsPwAxSaoX8bqN/OOXY9UFcFTJVK9UKH9jGIwJ7NkkAvuhm83Q
         PkkKUSU2UZS2BpVPpw7afLoNntFKX9vVSqWnSqL7Gu0C/U31p8GOdQvRZgybq8XqGER4
         hNzA==
X-Forwarded-Encrypted: i=1; AHgh+RoySY004dl6rHaJPOcWRyAGa7hbETKFjM1I25+1gaCdsGHEk432oe1urPza3GvSkdFJveK/wKDsCXGg@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeYuxj0HaVoqr/yeS3oV1SbCL4TRziQHdC80UJVjrCstrAhJ/
	l8He83A1gNadJheumybuK5tJFgZbMKA28Q3Y8gUY8bmL1MZ5uI5fjct3+M1RKbEuzoCqKvVgn6a
	DbVDhdmER0bvlerObow1CnqST962jxBMgWk4yDScWbKUGlp1jKEo6mLdRP6e2IvqY
X-Gm-Gg: AfdE7cnFpRORtGxt0mO3u7+7Tea32vbRl/vz8GHBiiX6+tXlAZBAS6I01kB90/xFFrv
	38S4MqH95KfaqqqFR4kDj9uP/vPk+CYBUW5dlkGftFnQw/FzhDASTpWZdqLaHgAFaKGmBO5psJk
	1YjebZgA7DuIHuNTpzoGK/iCb3k6uavsW5Baek/pt8Muvab23fuFPqPK5Op0PpAW/2+EGIz7OUT
	r2JgRZVFNX0GLDMiLyqvE4TJoHHsOTrWS2BPCbm4I23qDlFm9A6I+nVGXy9Fyn4YhDOcnTdRQUR
	TkEYe58FBX0t1u05cfuea2ALORpgfZvQ4OqJy5U57e5KkhHNEW0YaVPbupzojIb+dRkdKHa1dTz
	p8jQj9ygOZXvHP4gQMsKIJpt351ZPw5IgOnM/0XTJSjrbsuMZrY+MuVZwSxg9zpblGW2i
X-Received: by 2002:a05:6a21:a87:b0:3c3:a8a4:e71a with SMTP id adf61e73a8af0-3c3ad6035d4mr882297637.11.1784260918810;
        Thu, 16 Jul 2026 21:01:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:a87:b0:3c3:a8a4:e71a with SMTP id adf61e73a8af0-3c3ad6035d4mr882263637.11.1784260918344;
        Thu, 16 Jul 2026 21:01:58 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb770sm1822442eec.16.2026.07.16.21.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:01:57 -0700 (PDT)
Message-ID: <bea99c43-16c2-4f5b-b14c-e1a518b97e11@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:31:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com> <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com> <almJeSq1zfcC1mjj@vbox>
 <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a59a937 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=081tR47BLqD6ycLrW70A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: zAgJdZEZMGHMt2_Yo6ykTTG2yWVzdF6g
X-Proofpoint-GUID: zAgJdZEZMGHMt2_Yo6ykTTG2yWVzdF6g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNSBTYWx0ZWRfX/EGL3Bgb14c3
 dDErYa8DiLVgTSnLr9ieM2HuffrojBVBjfdxR2Eu2khEN83k9ZS0qFDag5agFW2KrICkgdbQ3J8
 mn8xLRxwwx1fISde4/0z7Ewxzmn1PnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNSBTYWx0ZWRfX3d6IdB1c5+yo
 Ae1a461/0Wjgro3azWolTg2vYXdoMN2G+EQYNWoEWb4B4TF6M1QYaNMkDj35HFp6grTpA8qal2w
 0RvIssTCgZGofR/KouHbyg28510xFz9wjUOC/om6DHaw2/AO/B3nkh2fU+QNEsi/JOOSt826vX2
 J/5PJA+as+W7auyfH7mMrtdqrDnny2x8I+89ObdpYvR83yH2RM1JmVyK2EE2KDPjOZpJ2RdS3rB
 rtlUsjG4+JezYDyVMRf2Np/8xXxwCTR+ZeEMbVr2PZ8/9GtUswZgzRl+TT/f6R0gJ2NK4sq7/XK
 Os9cm0cKfYAtszN6m3Nh0at9wR9Vx2KUI4j/x9mgALs+B4AtTMAwRkgSVKpLF49Xh9f1XPAh4DC
 u8zoyApiAqgzkyLilWCSsvtEGqAmJPhaz1E3unYvFW5QabUS/O7eZNWvlg0Tls1HY+hVXPGoC0g
 CK5EpEo1DBl/NtEoZjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170035



On 7/17/2026 9:12 AM, Peter Chen wrote:
> On 26-07-17 01:56:59, Thinh Nguyen wrote:
>> On Thu, Jul 16, 2026, Peter Chen wrote:
>>> On 26-07-17 00:06:37, Thinh Nguyen wrote:
>>>>>
>>>>> I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
>>>>> core uses it only for special cases and the code was added for
>>>>> ten years ago. For the default situation, we may not need to
>>>>> change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
>>>>> correct?
>>>>>
>>>>
>>>> The GUSB2PHYCFG.eUSB2OPMODE is only relevant for host mode and mainly
>>>> for electrical compliance. Usually by default, the CoreConsultant
>>>> setting should have this set correctly. So not explicitly setting it
>>>> should be functionally fine (IIRC).
>>>>
>>>> That said, this is separate from the GUSB2PHYCFG.PHYIF, which the core
>>>> uses dwc->hsphy_mode to indicate whether the UTMI interface is 8-bit or
>>>> 16-bit.
>>>>
>>>
>>> Why only rockchip uses this "phy_type" property, why other SoC vendors
>>> no this requirement for UTMI width setting?
>>>
>>
>> Not just rockchip, some tegra and hikey also use it. Some old qcom dts
>> files also have it for ulpi.
> 
> Tegra and old qcom platforms use chipidea, hikey uses dwc3.
> 
>>
>> It is typically set when the coreConsultant default differs from what
>> the platform needs, so the driver can override it with the correct
>> setting.
>>
>> My point is that changing "phy_type" definition is more involved than it
>> looks. I'm open to alternatives.
>>
> 
> I know your concern that in case the eUSB2 PHY SoC wants to change UTMI
> width, it can't do that. Are there controller register know it connects
> eUSB2 PHY?
> 
> For the place to put "eusb2" for phy type, I still think enum
> usb_phy_interface at: include/linux/usb/phy.h is the most suitable
> place, would you have any alternatives?
> 
> Another solution is using generic PHY API phy_get_mode, set fixed "eusb2"
> mode at eUSB2 PHY driver, but it depends on PHY driver doesn't have
> different settings for device and host mode.
> 

Konrad did suggest this on v3:

https://lore.kernel.org/all/3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com/

This involves cleaning all drivers using these enums if we take that route.

Regards,
Krishna,

> Other solution is compare the generic PHY compatible string at dwc3 qcom
> glue layer, it depends on eUSB2 PHY compatible string always contains
> "eusb2-phy"
> 
> I prefer the solution that extend enum usb_phy_interface for eUSB2 PHY,
> it uses existed kernel structure and device tree binding.
> 

