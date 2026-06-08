Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167036DA18
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897074; cv=none; b=MOfhw9QowO+pj6c8CA4GvdBHfndrrzOoWY5/Xi5hizoALSGJ1gdMp3/c7kz+ARqKapahUweW5b0833tQD/13WglOLIq0Vixy73CcPvSicknDcjn9ZJXhxk/JJ83WzuXOlteQo7gdOtfLaX3krxvPcQlEZeHEO3zglfUNc0C6A0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897074; c=relaxed/simple;
	bh=k433kSHHswEjNIEXyatPSmR6tDkM60pP7cSVKDezh9s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pZWawEmkPxHitfHtaMxAg7bCWY2gVpgOJNeXaLqAWqAYWElQGADKv9rKea73r7Jgp7ChhWMHlrXNW75JUmJ3GKz1VQq36FX1X8S+r/VkPvo4suoZ+1WO1ldVzv79LtJTU63EeytMfeZ9d0MfOhelHwaYHNF18DSw24LGrOfDyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oST/aAnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/XEnh5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oST/aAnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/XEnh5U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Ggv12027779
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=; b=oST/aAnLGnFERZ1w
	jAI97r3p5duMRn/uzxoMzgeeRgGSVPzsdQtl8YGK+t1LCHhfvlSdPgRPoGHysNiB
	TjnzyPbV6HATGBl92snWV6tp515SdKfmLLJRNxhsiU61x5/bmQGXPZvWcF4X2eWJ
	Pler0N+8Dy+5GhlaNh0eT9TggmmLnLiAJ7CGCB4wazTojEtbWtx/UR5PoS437R5w
	IwOMO50d7i3DhoBnwK1GPRAj38xqhoUn2c9wnSYVurG604qUDgopsP3VqRIqBIXn
	UzCNsunsu50J27UQLBlr1/32uGmhe3dhAaZWagXc6hlUHhqmwmkniWHzgeg2I6qB
	Kq1Kuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4x9ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:37:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso4621774a91.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897071; x=1781501871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=X/XEnh5UjVKwGrpZX9YUKgoLE8Mi92V095wmODe/yiTEEx+u7nN93ID+4ouO7NsPdC
         azUB0lox8DdZRo9JBa1hAjZjboDWGv3jP9icyJ2hXFM1rV6SCFtu/gTKhLJsWiixHLtQ
         VsI74atZV4EyRKfEi7jjVBw4I87mC36DzwklN2ajF4vJCYDRtuI8TvcrU3fCoh/2rOHH
         EdsElKmgjhCkMB3hw/As7QWbc6Xb3UD2HRbMi1SLTLNZWGosKXVIYH/4fgAr8k6+8Cg5
         omnLzVQOXz/+tVYMRB6n4IHpUmwrX1ZB6yU/KQfKLjr6rlANyVvnp1pvfdzY1OixXd99
         pNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897071; x=1781501871;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=WyWVX8dz/Bm95ZiE43BQ3oPJF9qK0xtMmp0q0VgpOhVd6Rwal8J4/ZlrfZ2cWKuVJ0
         hgnL+RWT8QvmYC6bTZmYW89rQ4UB19vG9H9BDbiB5c0Tpegm/rNK2Bb3XNqA+UeUXZUr
         cR8vO7jNWvy8DqkkTLOByHMQFWBpG7qEKGqXvTZPDu4nD/sspJA3yc0ehKUeP2NXI4Hw
         411mh6CZpAPYeSOW2+qIBnldS4s0Dfgq5VRIKABFdH2MHUNXQ17eXNSrvthotvJN4oWd
         xYR9R+o67QeTJLu2rgKyh/qsnxiMFuJxrVhugSHLIKVJzExciSWTMfBIjMPODbJfBi9p
         XKAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wu5+G04nsN6PHNMOBa0GFNOtiftpQkSHt2tLX7mUxYZzKS3MbrUfUM0SR+rDOu/7g1+sJ0bQhSIYw@vger.kernel.org
X-Gm-Message-State: AOJu0YwHyf+F146mZEcoWyllWe0xfUWHg/gbWS+O5lWChuBzSCh1o0f9
	GsUvPNgxASoiQg2kuuPIZGBBbOO0WCEIfYTBY9YFWV4CPn3MKseJhjpyHEaef+CcbFZ5u6e0oCp
	efI0mTfUIElRYmM0J9Ak4ysuzbzgDaDrL57UhmT1hBGfpi9bDYCleqLYEA8uisUrO
X-Gm-Gg: Acq92OHEusuJHQFoRsnHiRBrPZ67nSFjzp/hGM5fVktxxrJ8SfbRbRuE84ov0K0yLkR
	kftZEqN+I0mnZViQj4jwwlCjcxauaMQJ7UwiUYYmtGNPuXjiVa/hEgPq7c2AAqyKtZ/Ia87tOvh
	PH2Eg+Uict7Rxx0UIj7wpigXwH4QjyRLbygyu6/TrBYcyjmToQ7Vk8XTuQ5iJ4Wj+hSyYk1cdT4
	d8qUSjwBURDY6S3pynrzM8w9pZ4w+6y1EAODdpexuTbt9jyfJk9bbrAOMq9NMI+QnOgKP+0Ynrf
	pk4/ylrFXFFXGmnxAFJ5wQ91IUULQi2NbVODxfqaO77ORM+ZSvsPRrD5W4zWMysFhFOqvyHcLwA
	uu58bxYwC+kyK2rLvigK9C3MBmGDqH1OiyIrNtVUdIR2QN2Pgs1ngpN25+TkGPLII
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813209a91.15.1780897071395;
        Sun, 07 Jun 2026 22:37:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813176a91.15.1780897070991;
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm14471868a91.14.2026.06.07.22.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Message-ID: <e1a47ff2-1849-86b5-5a3d-bd820d535b1b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:07:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
 <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dDGhuc1XISBjVER7GJHq7n9DYYWeZ7Pn
X-Proofpoint-GUID: dDGhuc1XISBjVER7GJHq7n9DYYWeZ7Pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OCBTYWx0ZWRfX+cSDrinHEGoR
 103Nx+bcWX3ZBxjAYG/C/67P2t2kYs8DzY3qLLeJUJ0qieoGvAFnlg+Gze92SLx3D+krHdkmpzl
 vPiC0yNbaBWJm4Y73dN5VX2prMalCBl5J84wkQ+OqrJB7pArCoUSMAcRteyW63YPDFvPDvu2LGh
 tfSJUMtYKsKxisOUkvVhWAP8OfljksqKH7fDYnFiHLumRj7tRM9FsCjPXO9AWw1uHI800sRigNC
 bvY8eOeYEFWZekZLQwp3xbKpvz1TBiTNYZi0qgGkY4Ei90tusm7SVOoZCTIVJpk1dl3jHYVEQL5
 5iua7JQSFOLgw20yIX6mTpXPWlg3s9y0ayfLn1/NVhYxKX/1XUoAOTmxLjbjSmXztlorNbuh0v8
 kWBSKoOX5d3NfPFyRV+COqSLhkUBB1VvHC/DYtQK/giNNP4aQYp9jfa9rf0Rv0rc91y1GnKgoD5
 5AHBYfjPYKyS8E6ajCQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a265530 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gQWBvvTIlS5GmZPSv-0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080048


On 6/3/2026 8:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding a vendor-specific media driver virtual bus (`iris_vpu_bus_type`) to the core `iommu_buses` array is an architectural layering violation and abuses the device model.
> --
>
> commit 237441c1b5f7b6f9432bcd95591b1105966e57b0
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> iommu: Add iris-vpu-bus to iommu_buses
>
> Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
> subsystem so that the bus notifier callbacks are registered for
> device addition and removal events.
>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde5..fe51600953ceb 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/bug.h>
>>  #include <linux/types.h>
>>  #include <linux/init.h>
>> +#include <linux/iris_vpu_bus.h>
> [Severity: High]
> Does this introduce a layering violation by pulling a vendor-specific media
> driver header directly into the core IOMMU framework?
>
>>  #include <linux/export.h>
>>  #include <linux/slab.h>
>>  #include <linux/errno.h>
> [ ... ]
>
>> @@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
>>  #ifdef CONFIG_CDX_BUS
>>  	&cdx_bus_type,
>>  #endif
>> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
>> +	&iris_vpu_bus_type,
>> +#endif
>>  };
> [Severity: High]
> Is it appropriate to add an artificial software bus created inside a single
> media driver to the system-level hardware interconnects list here?
>
> The iommu_buses array is generally intended for system-level hardware
> interconnects like PCI or Platform buses. Modifying the core framework to
> accommodate a vendor driver's private bus seems to couple subsystems together
> incorrectly.
>
> Additionally, because CONFIG_QCOM_IRIS_VPU_BUS is defined as a bool in the
> driver's Kconfig and registers its bus using a postcore_initcall, this forces
> the custom bus code into the core kernel binary even when the media driver is
> built as a loadable module, leading to kernel bloat and abusing core
> initialization levels.

iris-vpu-bus will be compiled along with kernel. This bus is used the external
loadable modules. So here bus is not an external module.

> Can generic solutions be used instead, such as using standard platform_device
> child nodes or creating a standardized context bus?

platform_device child nodes method is not accepted and got suggestion to create
a custom bus.

