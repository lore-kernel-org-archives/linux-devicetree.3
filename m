Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E85229B12
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761546; cv=none; b=QoDGJUZA0DjAzo7Z9266Xx4nORfqHWte5zeXDuFICIvsFXpLCt1HF/Djused+ngs4U8dieS4M9qjWc2LqmIXNXgeXRSZ5tOA1tqY0xn9FBrFKnto6hWJ+Bt6ApHA9pb2WpvXQVHOr8RZ0bRMOQfu1OqkUd1JbOU7lFbEqcR8cg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761546; c=relaxed/simple;
	bh=0x1+kUeIY1ww03zMcigz18OPM59MnPltsz8N6gc6P6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyYJrEVctCvBW3ykOFF4BK8lHB7589QIICWl51e7vDbCOkUq2aInuha6stvHKmU+hDEgNoR3s8xwGJo/gRyTUM/LZ0hW/nU3bcc79QPAMI8RPB9nUJmeN22uTRqA2pvUwY7/m0PEdVGwJojkrbLx1JSUlVpCE3xAaENS8JA7anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezrct5nv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCWKEN8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezrct5nv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCWKEN8F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4PAC1059501
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=; b=ezrct5nvd0Snvvlj
	DTH2GOsdXZFN3ZmhjK4p74GnyjPDXhQBaenp/gMSvUGAGACXHNwrEz7EEIwPolc1
	rV3ez2C28JADV92CkPgUSwey9udk2yqVMrzHK1XozCkmpa+2SNVjUA+hnPwQnK3H
	5FRWrfR1D2azxlCG/ngAbg9hyxkaFShuoylD3yjT3o6EI7uj0rEfsYzW7Q/ZJSPI
	7ZhkQek6y6J5rvkVutxWS20BQAGVjM3hRJAcERNB5T3iO38wbdXxOnzvhIYrotw/
	8LEaJYotIZLmbfw8R6w9LhwSMQx7NrZ7nESL8pEYOhTH3ZSd8xMsJBVB2/7NZ5da
	qUTcqA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd9jdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:52:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84885a4fcabso3964832b3a.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785761543; x=1786366343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=;
        b=DCWKEN8FkkUUaT6hsH6e4qiJ3WDr9ZSha00M3zF7dU5zZdQeAt6ssuHgi37TMHgZpx
         WnHX3YWDZj3yjgUKqXUGufz0NXYk09VuqNNgPSAR01wzU3DHnpfgB6DNxUAhFyL0glmp
         /9YzTGtDUeTD+5BE8LV7z5gEUsFzoe7hMU+xfw5WFzw+IJY9ncgwVv1K0WUyYx/fc4Zp
         +OXF//UEl9TPD0cUjLhAdNLwycN/8PJdDku1jF6cEEfKUn5qc89Lcpn/RzFJR4UHQGFz
         m505zDB5INv9GtUvjYzNuOAYfafqTteBABg9eQOuFZZd8i77vmHVo2ncx2bWlbZn2TaM
         CZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761543; x=1786366343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=;
        b=c16jYQtHMaVR/PsMboUa0MusJI6cgX0m55SztOHVYPjMheEOB3bDWLC6XulKjak0DN
         mR6vGNAGSTZ88xFBC6N4BYXd71NnJqM0nf/z5txlhdR/LLrCWSG4KHUM0wvjGo4yvU1a
         st6nkm4L6zKOi77QKaqMAfERSnGFQmOPIwqEXo3qJeJ/EB93tFs4VTaa5eSmdLv1NK4o
         PgTUvOZmSzHK5d8J4jSFX9NIAWkjLi78HU/CR/0cebuUN0mIso4HCJUm21pORwjBvSy9
         gLA6i2gCARw2mQZwAvPHoT9v/9lJqyYvJYhFCrJSJEOo2rND9XQapDvmB9+7sefLgahL
         d/6w==
X-Gm-Message-State: AOJu0YyWV3Waouz0A3lX3Vqfpeok+JNnARVW+v11hXqtqmW4QRTuvAMg
	yemIA1q/iJrMd8TcEaavJeicjYVeXG8zHvqt9REfOSisiqSpkKLfd9YyT1/MCjbbeq38tU9125S
	YWzX5Jm1N6rAEjrRF3o0hLR0cpVYiUDna9Ogq3n6vKQxhXsae7TpZ1ENTVw8Ogvke
X-Gm-Gg: AR+sD11x5D4/oxZiRWeI9O6ZURCJ019kaUpQY6T86Ujzco6rvU9KljOhUhXfieNFnVE
	zDq1AHTzSP9yYK1/aj3pYUwSLcuma/WqGTfc3UoEY9PwXSMOu1ajJvS9yVA3sRDmZFAoL/5KFW1
	b8FQN/hX2JeowUgXz9qVH81WkOEX2rKA7bNVLvXtORv1ljTlEW7KRHoCH2YKFmFOyal1YdP7S0i
	ugM0IcTPjbpFWVa1NISQvsuoVamwteO8bNr9SwnPCmCq4FsdV0fLfrx0CgsrDPXkb6rgksZnunu
	ZSE6ao1f+4u6K25IonH81wYwQMOXxmtykPFoZGjZrUDnxzvVqhm7q488CSZqvoLCmJ4pE0ACqGd
	kFp9Pz86yWKOerfafgt+4eALyLF6P3oXHWg==
X-Received: by 2002:a05:6a00:2382:b0:84e:695:edfb with SMTP id d2e1a72fcca58-84ee492901fmr8846020b3a.54.1785761543334;
        Mon, 03 Aug 2026 05:52:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2382:b0:84e:695:edfb with SMTP id d2e1a72fcca58-84ee492901fmr8845979b3a.54.1785761542645;
        Mon, 03 Aug 2026 05:52:22 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35a4esm3705788b3a.10.2026.08.03.05.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:52:22 -0700 (PDT)
Message-ID: <eb7c8660-1892-4cd3-a960-9f4a15ca31d8@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:22:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev,
        robh@kernel.org, lee@kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260803100748.34BE81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803100748.34BE81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExNSBTYWx0ZWRfXzWM8p3dCYhJZ
 HWspSd6DUKHd6nYGTIP7Z2bvw52gySWAEE2wb0i5DvryYb/xz/5tCXb2PCGwMHBmGJF0KLJnvos
 uLOptQ2c+6fIhN5hBKXt1wHDcElxjZ0=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a708f08 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l9OOgqi_LA2bN5GlWgcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: g7x8sM8QGwlUBhzCTvbZlJ06kWtWWpLb
X-Proofpoint-ORIG-GUID: g7x8sM8QGwlUBhzCTvbZlJ06kWtWWpLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExNSBTYWx0ZWRfX3UdsaDbMLUrX
 GTSAUa+iPa7ER5zUgriemnHzHZ/Bae+vzB+Z/rz+2Gd4XjoeUbfPaaPPMOO6HW1UM3qiW6kVL06
 2v0bdfLsHmWif9Sp/+6rGJIdiFDPSUGi+h+SiBUIasvg0c2/QOC+UHwxmbgTfMc0BKuuuR50oJg
 vYr0ET8F2cRpluHH0WD0Qho1O96pZv62SbBPoWXHndNh8FBzb9TzmM6pxMYofck+Z44m65PH2sJ
 FIEJl7YpWGbphXdAGpmiw3BxqJbEOX5pWx/i9q2Tqj7Vx2i3mdtcxZbzvKrXxBAN3GMp6k/hYtS
 GdbxRqJoneDPRYVRww+QzSRmMiHPIwkspMCH7V5QVbw1afdzLSXdKi1ufBzDtLkleSMVh4jhtgH
 d6mk4rSNsyh06VGURL9pogINOnt3EmJ3a+72QJqd/TeR9WgJGQLfbeT7O6ZDNBlokeeQM2gI8sD
 LEU3OTT44O2t74Vvhtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030115



On 8/3/2026 3:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The MFD probe function swallows errors from devm_mfd_add_devices() instead of propagating them to abort the probe.
> --
> 
> --- Patch [8]: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell ---
> commit 88cfe078ed8299db3dd71fd877f29ff443d5037e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: psci-mfd: Add psci-reboot-mode child cell
>      
> This commit exposes the PSCI reboot-mode node as a proper child cell using
> a named_fwnode. It also registers the psci-cpuidle-domain cell first to
> isolate it from reboot-mode failures.
> 
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd8..7befc4fa86f5d 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
> 
> [ ... ]
> 
>> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>> +		ret = 0;
>> +	}
> 
> [Severity: Medium]
> Should this propagate the error instead of returning 0?
> 
> According to the MFD subsystem guidelines, if a child device fails to
> register during an MFD probe, the entire probe must fail and unwind
> previously registered children. By setting ret = 0 here, the driver reports
> success for the parent probe even if the reboot-mode child cell fails to
> register. Does this leave the device in an incomplete state and violate the
> requirement to propagate devm_mfd_add_devices() errors?

This is done on purpose.
psci-mfd adds two child cells, psci-cpuidle-domain and psci-reboot-mode.
psci-cpuidle-domain is a critical driver for device device bootup on 
supported systems. psci-reboot-mode child is hence added separately as 
optional child which will not affect the probe of psci-mfd.

thanks,
Shivendra
