Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C3382296
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784175166; cv=none; b=H6+UlngJ0r4nX7hLDK4gDJtmYz/5SPJnxESejlMJ6q6w/rXjVg7OXHj2aCrVdysRl3P2OsdGZmmCWSf+mR9CdElMleJornC557LZaQ6zZZCANwHpikMek6ipMfVnomOfa9LfHWD/oGcHHeoKKVJHAx2OzHyH1OEehiMBV5yrOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784175166; c=relaxed/simple;
	bh=/dyoMv/UYdVyyF+qnuzKPqZMYCQmEci40zFu3E4B9JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV4Ly0vQ1GpGPHH40B7pOLfyAi++eHDlO4qXTKgl5IStkhnHZ3bx6/0Teeh2IrFQoKSo7NPD87C4hnRyoz/d7/bguOnCZlSfbJPciMDW/iUY2F7hlVzBK+fkUlJWSwuQ6SzdtybgEQsd87R0lzl9wY3QTnXJ9hC8bZCehDfZKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jykNlWKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ir2vz1nh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jykNlWKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ir2vz1nh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wIJd1451612
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuDvcNYhRq9zIu+xk0S4V0i28EaJt8kIw2n7KS87xsE=; b=jykNlWKB5KbBs7uc
	6YQRvf1ywfb02A/rnPVHuhmetYNCkunKhCJzOITXSIjqa2qDgboilF6TgsY4toVK
	brgEKHaQ5fKs/yS7e9pkcQsGx5RSdNpczTlbJ/mIyANPlZQAS2KFldHcwL4J1tTj
	pmXxyLba75Bu+SwEJbLt7pnNlmYNVXVnKwEqp6JZqTnqHKuaEVi4hqjveXplY3QC
	CTSMoiB8EhffslFm/CCNmOT9BRdXFpq8p0MjeotuGTAtgH5LkroUELrRpS2utgpy
	Fw+UkhW2KLmIKr6Y6oo5IS3hivy/pNETe+KWon5x5LnzsLwOzR00B3d5YeXtZv2h
	m4Y3vw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnyah1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:12:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so223083a91.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784175163; x=1784779963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuDvcNYhRq9zIu+xk0S4V0i28EaJt8kIw2n7KS87xsE=;
        b=ir2vz1nh2wm8gpf/0Um9e2wKZxFEafeIszn4xQ0FgvER9miob2swpgRoIuT2mzqb+Q
         wUJhe2c2e7rpC/z9GWdNT4aKULiQAQcDsFLp1tNSkWfPDvElIHuKdpQF4+WEPOnLXYV4
         8aKByVMZ+Sd25TYljy6qLXswRrYvffXHfCudNWjjlAtGjui0Kg9xNn5IF4khfQW6R8AX
         b9OuheN1ViJAduVFZ6OtB71DI9jD0OOV+n9bvJzAU/U54zqC3oJLUnuE9xyY1AliwVYy
         NbGY2Xbp9vp7t9qOUbjg5DywX8Uei2FJJG2MXDv+sz5ocC+adzyXaBbhzOkA/N4AvgmW
         ddQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784175163; x=1784779963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuDvcNYhRq9zIu+xk0S4V0i28EaJt8kIw2n7KS87xsE=;
        b=UOGPgsjPRW/4qzfM64DLAED51/oc6LOQM2kpb2Ft62lJeSNP2UsWtnzcjgbOkafMQo
         au7wgEubAKilUtIldATpXhfDB18PB9ZWQwfS7jhPwkGHAabOhCpIEKINz+ETZ+iEVvmZ
         1APfFQp2fPM8xOzPgHpiF/6QAERvyJWXjonQoNNb3QOMgZSKQF24A9QjjGQd7Hxyq2pE
         QIUIHJQWfscX0GPFSw6XwggZw3cpBxLEs7xN0Rsq4YXHhWi6WCHtd6v4l5K6vWTP6Rnz
         2bK1Uwi1q+ye4Ocd4E/xtUuuBMxgiw6wxQRRaHZBxppJzCCCFJi7+nCijNMt4Tuod5/Z
         hJFw==
X-Forwarded-Encrypted: i=1; AHgh+RqtVXXeBB9+sEnQfO5ioEEDBBL7PYOofP2BDVgjinj3F7S8m15HbnUj62EViWusjYOJVa2zkxv9hMZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtMlvIXAILRGOmVNtKkzEcolxqsrVShjEB6LAZqmczHLBoopl
	icFD4dedM4aEZh0I17LC5JPesTEqFzKlRHEIiwyC6By5uRnSQEzR7O9M6j0QX3yjvDj7etpGsEK
	M5P2tSFGnAAs8xHTmqK6lGSzUJ4XoTk8NmP/2N4u9UmcOqPRtlOjumgWWcaITUN6a
X-Gm-Gg: AfdE7cnlLjVG9sdSvsVuHOucYHgqDWJ5+bbl79ZTmHvbZRNXYZ2spziqUTIKIhkgz0R
	U3/7S76t10Tz4Y8K7VsOwdKnlCmlUtAcXS7RbhLNQy1itwdsvcNl7Nk2bgc+BNLvBcqUMj+xeot
	p+pOUTd0Q8UljE4Wkaqzmu9g2ysRBrw62y7VL5XstBPrLZLwBQjhosQTv4VVlosFUJAdkDDvTmR
	J5927ff3YNiuMlTRrwZbzt4dnZgfti4F09TaQKSAT91+YEWzaP4FWlppO0PEf4iVGIFti/Typ4r
	PtN3pC87OQx7Iee4B2j/36cg+HdTkSYZJXypo4zgalzEoIli7BqK1PHjC9IBFSThFxWtquhysnZ
	ys+8gTqiUz+boy2NHnou1zI9t9Zc/BLXJ6IaDgENcV6nuyK7pB9x4YKpAJQFDmBokCAmQ
X-Received: by 2002:a17:90b:17ce:b0:38d:9eda:fa04 with SMTP id 98e67ed59e1d1-38e3d134073mr1049435a91.2.1784175162886;
        Wed, 15 Jul 2026 21:12:42 -0700 (PDT)
X-Received: by 2002:a17:90b:17ce:b0:38d:9eda:fa04 with SMTP id 98e67ed59e1d1-38e3d134073mr1049402a91.2.1784175162366;
        Wed, 15 Jul 2026 21:12:42 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e545bb7sm5558475eec.3.2026.07.15.21.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:12:41 -0700 (PDT)
Message-ID: <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 09:42:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Peter Chen <peter.chen@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
References: <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <algTE3PyJVxLdFq6@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX5A0VFxzqEtyf
 QlK3fHjifK/2k/A+k6QKCa5u3vMGMKptt/5BcV/GQvciOy99AFxi+AaZiKaFAlS/gYC2D8aWlLM
 nW8o8oC9vJVgHc+HZSWaBKo/FPW78KU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX7rfjEc/BKjyk
 J5kgsONXiXGIHG42lakIrRE12L07HPA/UkLlbdFqz5W17On63zuhmTx7A203G1yu9XV52dz3LE1
 /Dmnie5Tn5K5Y6x7WVudJhl5r81k0PuACZObJQdo0+mJ/TdDwbiHfhYmpkmoFyqvHKVdYuy83fc
 WnyUBa6KJEqprhEHSo3vzUC4sp0c8aXXExE11SidScIeuHwilyulzoJprn/j7JOyoLN4KpXsiJo
 yid1kmQQ8vdzCqjMKbNb6I5MZfFIiHHuZIoyK/IDreSrB/5zgPHH4VHtudG2Q5zK+deysFYxMmM
 Gbcjx5DD+ciDSBSt8Ty0+1rEHLvxzxrG6pUUWv7ji0hs7Gvxvr48ydPihG1BBVh0bD6AfhaUCQN
 oxVjIC7KEch3YnpSAQoxIBuMa/O87SWi7V3qUqFb0IT99xJUrkKKivy0IfQrhK2IxUcidFAvCS1
 kedNaVDv4uMcf6Zp3Hw==
X-Proofpoint-ORIG-GUID: qkTFWiRlsJ_3SgwpcuaomReNTRxCtAUW
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a585a3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=08YGO8N92OaCWiTnn_kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qkTFWiRlsJ_3SgwpcuaomReNTRxCtAUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160038



On 7/16/2026 4:49 AM, Thinh Nguyen wrote:
> On Wed, Jul 15, 2026, Krishna Kurapati wrote:
>>
>>
>> On 7/15/2026 4:53 AM, Thinh Nguyen wrote:
>>> On Mon, Jul 13, 2026, Peter Chen wrote:
>>>> On 26-07-13 23:41:14, Thinh Nguyen wrote:
>>>>> On Mon, Jul 13, 2026, Peter Chen wrote:
>>>>>> On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
>>>>>>>>> And Dmitry already said this at v3.
>>>>>>>>
>>>>>>>> And I've already responded to his comment in v3:
>>>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$
>>>>>>>
>>>>>>> It does not change the fact that type of phy is implied by compatible,
>>>>>>> thus you do not get a new property.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> For USB2 PHY, it has property "phy_type" already, it could extend support
>>>>>> list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
>>>>>> or re-use dwc3->hsphy_mode depends on where it needs to use.
>>>>>>
>>>>>> diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
>>>>>> index 1ab134f45d67..5cbf17d493ad 100644
>>>>>> --- a/drivers/usb/phy/of.c
>>>>>> +++ b/drivers/usb/phy/of.c
>>>>>> @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
>>>>>>    	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
>>>>>>    	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
>>>>>>    	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
>>>>>> +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
>>>>>>    };
>>>>>>
>>>>>>
>>>>>
>>>>> eusb2 uses utmi, so it doesn't fit here as a separate mode.
>>>>>
>>>>
>>>> Hi Thinh
>>>>
>>>> Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
>>>> Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
>>>> Features.
>>>>
>>>>
>>>>> To go this route properly, we'd need to introduce a new phy type
>>>>> attribute in the phy framework, which will be a bigger change that may
>>>>> impact more than this driver.
>>>>>
>>>>
>>>> It is not at generic PHY framework, it is just for USB PHY dedicated.
>>>>
>>>> I do not see big changes, it only needs to change above files and related
>>>> dt-binding files, and other users may leverage it if the controller
>>>> has special sequence or settings for eUSB2.
>>>>
>>>
>>> The usbphy_modes describes the interface between the controller and the
>>> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
>>> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
>>> and every other driver that uses usbphy_modes to handle the new mode
>>> correctly.
>>
>> Hi Thinh,
>>
>> I don't think any existing drivers need to be modified after adding this. If
>> anyone wants to use the newly added enum for any eusb2 specific purpose,
>> they can do so in a diff change/patch I guess.
>>
> 
> At minimum, dwc3 needs to be reviewed and updated for dwc->hsphy_mode
> check when configuring GUSB2PHYCFG. Regardless, phy type should not be a
> usbphy_modes enum as I noted above.
> 
We can just add the enum for eusb2 in of.c as pointed by Peter in [1], 
read that in dwc3-qcom.c and use it during suspend resume for interrupt 
handling and to modify the DWC3_GUSB2PHYCFG_EUSB2OPMODE bit once we are 
modifying it in core.

[1]: https://lore.kernel.org/all/alhDjZ0gJZq_7G6z@hu-petche-lv.qualcomm.com/

Regards,
Krishna,
