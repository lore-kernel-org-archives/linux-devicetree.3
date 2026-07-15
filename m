Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7744682F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118325; cv=none; b=icEjSuAI5whrtVezckglfeFzkXZoM3grnKqwggZmxnoFnDdBN4BlA/d8bdxqw1Da/B9GeorxNW3RB3Mf6KvcldlRHkhKAJDxSsCLOPYe1ktXHzE3OMYxb333iHocLE477SiBT4kzMtSpgq5Uwp5VQErIo3P3HZyQPfUqgNLctaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118325; c=relaxed/simple;
	bh=LemhIJNoxz1ueRDJoKpSFvwPciOjqddo6VJZFndA1jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo2UdKvDGuvCQcjU2ct8N2wV4z8NiKxJKXC9V/LoYncnpI/rmx84qf4b8CD+Qs0LY7ofGZi5TrVvgrWvhJdjHqTfKNiXZD7i2DHFQSJgKCY0yyClAqQsuLvRkDuWVHfYGQuck2w6JenOhvxgdKO8bKTV2Tp/fOEcHj7CiqVeFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsfasX80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeMT1Rdn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsfasX80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeMT1Rdn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcl3m3707725
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=; b=NsfasX80ru7B4YHv
	8uib49PEwXRTI90eTMTO63SWRjQ2S8oCDAkM/nu02ZMbuiaLSxvPTNCOtDZRU/dK
	c/CbVqsfRwybM3kLno79KtnrI7mlpC8kNzuaULE0BTE3cyyOcWHZODhiAHpsOikA
	YYo7tLpjhTlkKve5c6SwEJVjl5bpLWL3w+oo4T0seYs2rHQsct2C1luZ/AhMqRPj
	Yhudlp3Z2M7IgdKE/X4Ywsf9lY24zQBHB7Ty6oDQJ1blOzupdK40wl5QWkyaY5FP
	KLeqvwMrg2wLqUcaInd+R6TDgHRE/8N5g0+91SnsyWTr7x0L7o/BYfWCK86uxoyC
	FXY2Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgna0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:25:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so1676530a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118322; x=1784723122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=;
        b=WeMT1Rdn91IRJVWvbUrw/ajL19etuDXyWPcbzSBtgI/1iAJ9uCkGDiTfroX1JqN6vD
         e905dM9XYC7oEaOkBdS1jp9ndZRRjukUZdeSy492ye+HT+fnCRRXwybOqTbhYJtzwEZN
         3jsn6pyjW7t7Uoul6GfZHdijQZTdZxBl6J3BQ084YD+28+jC4dOqcy8XFRkh6oXFum70
         nxr2wZqxTXvP2IeH9+m82MXXAIBniEfvpcZeSaMqcLQ370us467BGkujKORTPlVLg/7r
         glUSvV/3YMc0MUOoLeE5ARkz2v/CMMe8ufT6BR93VMwcb4pElVWaUabNC/OYmXsy3C27
         b8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118322; x=1784723122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=;
        b=jJJ+XOh+brX13DotaScgF2gkHwD+7gWq+zvBFtz8VPzJG13FfUBwspfuHz2sjVWAAQ
         jdWE4hI9ffAEj8N9RyXKlgeU3p8ITZqqTuwwIOv73GzLOsbj/m0c6OKwoxh3xfTiHP0y
         1xTeRORpFlX3n2gvjljg/JCC6rC19BzlUZrkrTVlvDCX9zpd5MBdBKWTOQE8aZ8dnw/H
         g/kpchjK/fVFHCI9DyEcHRAQ7ZIO5piCs5+w1VaQ4LCQT6D7tEBE7/N218oqthqGSQMg
         Jv7UldAf617zrKVhB0xLEbF7Kdw9oZCpjGXrywTSapHhXqzSMQQ+xgRZY8L+xUS43AtX
         isbg==
X-Forwarded-Encrypted: i=1; AHgh+RpOty4ZIFrKstT6BwJk1yj8rJNFPtgumdTaqBBgTfwt5ItaRtXoWGz5Bf3g99maTczIytG+hcyDIi4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0iCTuIAZa36kVbloroo2JXli8Z6E8R2vyG7JPfARS+sbOsft8
	ufzzR/GfZh1shefXC9+krGiHuAD1d7OcgRrJ9jKIxLeIYpADE10WbKAU5hH8hPEyxrutzU/4g4E
	+f681yhRq+ktX9/px0Da/OauGqtGtXyCf0Zkc7vbGBbnPdKXMED92jYcr7FsHcs0b
X-Gm-Gg: AfdE7cmDJ20G7W5fWQyUgQkUURvOEaXsYhMPGsriw/hDxj6PTObTVCTWJjug72nPHcE
	2SXGgW+o0PgoZpLoGgGj7V5PxSv2lagEiUBL6/n+0kLqWH69wLR/i3mBdaoSWF63BKlkC4KYGRl
	HM0V3muhKxpmBzoie4SHHaW5YDhJGNlunVcLEnhXbbnz49/IBMoSbIj7LUeb6y4hPFK801krwoM
	ESz5r0brjKqbeCQ3PMhFa41Bm8NrVENttGSRexxLLXVVHloaB+7oBV35XCYbHaUQzRGZsBW2OYr
	NvD/5umWoV16lPxpc6eoYIBLzXjS2L2Z/esDC42AsmqsHz2uYpdGpE7fYGd4PpIRDdiTvjaLaBP
	+ZoAJkvbWo9GVmBH+04QT0QnrPsJDZrHVk44z10/9Kpw5kg==
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr165508135ad.3.1784118322490;
        Wed, 15 Jul 2026 05:25:22 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr165507855ad.3.1784118321992;
        Wed, 15 Jul 2026 05:25:21 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm1729961c88.15.2026.07.15.05.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:25:21 -0700 (PDT)
Message-ID: <afe3c1aa-081d-4eda-ac61-5b9be10f1990@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:55:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
 <20260714172443.080241F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714172443.080241F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMyBTYWx0ZWRfX8ZuQHeUErd1R
 QLLcWEw1u8E4KINgU2oir6acX07MRpkOSkHZJP5y95wOE8KtO29904+BBX44XRBAzgkjX6CCmMQ
 feSnslHH3w77z++AoBmE2/l8Is5FoiY=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a577c33 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yevAzQFRF-SW-JHV9rgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: d1cGpy1i3TiqT5EeQIpIjg_j75x-W2vZ
X-Proofpoint-GUID: d1cGpy1i3TiqT5EeQIpIjg_j75x-W2vZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMyBTYWx0ZWRfX6PzLiM/y/qIn
 peLhKth3DU1szhsSn++grtBGmS2XomfvPnWmaPScoAwE7I1S8ZF0qH1Ku/ZUbnDjP/Du///1+WO
 IWnlvhdOANCgNCGR7zoFsV+c0xpYI4eikunQ/HUjapFj90r50l/WMJZeYAinuoSY8Yuvlp85zoG
 0gsne7tSKqMXv4PlCN5YxDSF2tA0QA6teXE5scEiYr8t4tl0t0djjZhxTkeiz4q0BmrQ1s4mKwl
 CRSaDBw5NKVVOh17phhzgQkVnNQ0fZMAjL1u+Vkr8vXT7VJDyJUujqZaMnTw+lmPWB8Lfj2q1fO
 cBFfWwEf6wTTRt/CHMmPy6/wgioOe1sJy8onRpIkz9TxsYBqwOuRE0co/MQ9aqBZL9LFKKDI/Zs
 BWhJOyGUPJfeFzmwaNjWN/31wG54eLMOE3KFPh7ja780aQqRPtlJckmKc1wEmZneJi504kbaLUi
 4SQCBLFx2+yf+PlvKBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150123



On 14-07-2026 22:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The probe function `psci_mfd_probe` ignores the return value of `devm_mfd_add_devices()` for the `psci_reboot_mode_cell` child device, violating the MFD subsystem guideline requiring probe failures to be propagated and unwound.
> --
> 
> --- Patch [9]: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell ---
> commit 73724460c58fad980d9dd8ef39b9485acffad30e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: psci-mfd: Add psci-reboot-mode child cell
> 
> This commit adds the psci-reboot-mode child cell to the psci-mfd driver.
> It retrieves the reboot-mode firmware node and registers the new cell
> using devm_mfd_add_devices if the node is present.
> 
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd8..8c6b78ac471bf 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
> 
> [ ... ]
> 
>> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>   
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
>> +	if (!fwnode)
>> +		return 0;
>> +
>> +	fwnode_handle_put(fwnode);
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret)
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>> +
>> +	return 0;
> 
> [Severity: High]
> Should this propagate the error code instead of returning 0?
> 
> The MFD subsystem guidelines specify that if a child device fails to register
> during probe, the entire probe must fail and unwind previously registered
> children. By returning 0 here, the MFD device is left in a partially
> initialized state if the psci-reboot-mode cell fails to register.

the cpu-idle-domain is a mandatory driver. We do not want to fail 
psci-mfd for any probe failures in reboot-mode probe and unwind the 
cpu-idle-domain driver. Have documented in commit text.

thanks,
Shivendra
