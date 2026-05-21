Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D23D969D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369035; cv=none; b=kyd0Qmc7FzIwfrOQhHx+R+giu/9bzQ8koCCffjpi9u9iabeG4x4M9TPl/jPl2vqAu0/kreilpIZtBUKot3dcyBTw6MnK3O+V1u8eTpRrxwWhJdO7sbixtnmH3IkZVnf+Qo3Zv58HHC5QT+8ceYnBBvJOkG+VpUqsr8qNjGcR2xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369035; c=relaxed/simple;
	bh=2GSnzV9ciCdURTUIeb8cFpTdA8HTh0lpn3BPxfOouaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbneZ7aTWAJed2VIId7DEjc+l7jH61//9Lc9uZ09MM/djkjJue2IWy4DXPuT5HdAggCoSo/x+FVZhGwPc5DcS9tEugwl3HZclOsgW8IuPwy9F0YmEmSpGIlnMM7xH96JpYP+t61dIPCABrJDSw2JDSvalV8c8GEh2NfB5V6alZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZ756s19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/8RGTQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZ756s19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/8RGTQk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9ANGS1731245
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+u39I4+waHFNk0WDdpK3zNnsyjAzm42aKp+xFiWAMI=; b=AZ756s19SuH7Zxx8
	eZnLorFYVrulqy+ULK57h3tw4swbpVyHyxLX8S9zypcRtDhvvrKzwZLxsTWUZita
	7SpK/XCi+QjWTMfiGKhb+9rZV/U710BoIhUMH7bVASKC7G2QyEAM06SlMLLi0+Iz
	+HobBO01uh9TC1j06Pfa1PcvbAtiazo0L8IRK1NcS1Z3cPFACMFk2dPigjyXdnSP
	zKGFCUtcwijpvsGoUNFGkC9XSEqyTLe+/THVBCXxewhWQGSqgr28GiEhhkeDDD28
	3hwJNcBS5+SKvyPZIig57ap0NZFPRi4lV1d+q+quaxSuAYm6cmKuIgEQAEv3VEDR
	ono+IA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5g7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:10:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc763c7256so141588825ad.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369032; x=1779973832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+u39I4+waHFNk0WDdpK3zNnsyjAzm42aKp+xFiWAMI=;
        b=a/8RGTQktKZSfJWzxpqDq9PNbHzofspD9EwDl9wN+oFEMpKjobK6GIpE82jqNB1tO7
         dCV2lLQ5LbBAP3Mz1rVZilAFLxAotytfnsdCL67IHVaQgMtf+LHknhtyxHOcwDKsBsV4
         wei7hHoCHMhBDDo1GVdt/eAQXmDvRMfT4ABACKuMl3xNpBYPSVpHcunL/p0H83S4jOIZ
         wg0mqpaIjcCvA6amC3l0vJ/8n3yCXtftSr501tb5xtRwi+IPxw0F/Rhe18dYtWb/G5QB
         4YY+DJQgb8Mw1xLmrjTEO/aZ9HOjLqe/aaTM4qgGnf2twr4JN0zU8CpXSoEfu4ZCzyA/
         urwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369032; x=1779973832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+u39I4+waHFNk0WDdpK3zNnsyjAzm42aKp+xFiWAMI=;
        b=DKpxQ2rSAb4MIerhX3Fj6IcdES5X51VVDfJYO/Pl0toLYV3YMmUvXG7o8EBPzMVE0X
         qF++zcSeMBDj+Z5mLhv8Qa3R4PtIHX7VrUcz5BuvYVL6dVymuxdG810BLKrO6G9xhvjj
         1XAYQ2LnTeoACY1oMmGUVkZpdrZ7z+cO6diZ3vao4mQvc3aa+QxffJInIHSoNszVfxVP
         opu3ZSa2mk9lMNxRTYvyLq6zSen3oyrq2hc69m+v7l9ChhPcscwB5DmZ6cnjFegWmp6v
         EybAu+O3MCu44IR31V0VCOmTEQil6MyA2E6qwdgq+kCbwliC47TWQHM04QAPn5yS/dk9
         Ztaw==
X-Forwarded-Encrypted: i=1; AFNElJ9MuPhwHyb8PX/7SNXHmwOcdNxDvrkfkdBozpeRqI43JJBYWM6TlfCscYW2DpKrU7RMzFBtlenptJhj@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXpv70FmzvmkYK3XO1TeiAwnAfVGjxqjqW6mvHtpK0p1E23aa
	JE/McIn+uI0BRTwJ9vpDnIkLDABw/9T6NRzAdphiCuz63FsOrS89bYzTAAHTt3VSjiMGkn/jW/W
	i8IQHmerkGClGTxiFaPR9Qb6Ec6VKzgRrZcjb4w/17AVVsKy5/Q5G0dIVsA1xSmW/
X-Gm-Gg: Acq92OFLZ9VUWZl/Cb9XrD6emID1Rb5UH3WcRC0y7glQbuOhuSysXDdl/uPoEkwPWwR
	vF+ozR1EsLm0OiseIfYQdGA0E1tNH/LMjSbmzvnDT3YC/nMFjhpFF8nkq1KDmPQUncgm0Wy7Wsq
	AOoL6H5jGNdeoX5A9srKliNcOXhNrS0p8Ht7NWU7gbVwr72fwrgdL6btyCe/IGRIM/rmvYLxpE9
	aUBRiHQvTF5gmc51/yvm9sBadbv5CVU7MYFHrobaIpiSRYT7FdrJH+1bbGjMiULQAuGG+SP8N0j
	HUH/G4uRaPMnXBRsSe612d5znrgB/B679Q0dn18aWCWScKk9iPWrJ0prQd6z8zSN9wUZXy3gHCz
	Kp6DqQffO5kIcR76CKjt7C8q4Sf9siYxUM2D0CQUr0l2xo5czK3mv4QTL3A==
X-Received: by 2002:a17:903:245:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bea33c2013mr29524935ad.35.1779369031942;
        Thu, 21 May 2026 06:10:31 -0700 (PDT)
X-Received: by 2002:a17:903:245:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bea33c2013mr29524355ad.35.1779369031315;
        Thu, 21 May 2026 06:10:31 -0700 (PDT)
Received: from [192.168.1.9] ([205.254.168.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9a3c89csm10065165ad.83.2026.05.21.06.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:10:31 -0700 (PDT)
Message-ID: <57ad7943-ab05-4b7d-b55f-3a7da7457137@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:40:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/3] of: Factor arguments passed to of_map_id() into a
 struct
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-pci@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260520-parse_iommu_cells-v15-2-b5f99ad4e7e8@oss.qualcomm.com>
 <20260520085613.9052F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260520085613.9052F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f0449 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=49gMqqAeKCh39Y98CdGbvA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ysTZoyIZg4-46AWNULEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7oVEa4EaVCEU3ipQYLV_aQjkDrohkQjl
X-Proofpoint-ORIG-GUID: 7oVEa4EaVCEU3ipQYLV_aQjkDrohkQjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX1O58M6wkzlZa
 4B4+3DyfsX46iEsvMegEnXoOcM2D/otwT2xTnpHSk6aYrnAsgioThELrzYrI7kldTYCtS9ZN2pw
 kDv2jxpooJHv3Bd+Pmn+i4IeBbtCC5YR9O+5RBb5m4WnxwNVKkmx3a2oAGhG74AIepeqDNzhevc
 BdZOPhUBjw+82aFrEr9hGtIdUM60z6L1W4+tXi1xtRgqu+WMgT6UrNmUj5psGi+cHnJfuoNemrJ
 yity5OT0x7l1R3e7Iu+pDxaw6NPQ2tT57vLe64qN+b8vRax6iMSMRLRAnqNUPfroWEmPq/PbbxC
 eH55VGnZ43xxzYw74i4UA61R0kuMS2YvMKZ6XF9vTidbHpP0jd4F2RNBG4R7cYnXtPVFQgzuDDe
 IU9+UCzcn/wH67oQUU/W/+mtSK32D8FPrue+/4gxpOLKWudOwXuCLYMYsxojz0LjgGaPB8bRc4m
 yUOxXeTAkil+zfB0u1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131



On 5/20/2026 2:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unconditional dereference of `msi_node` in `of_check_msi_parent` when it can be NULL.
> --
> 
> commit d17879206927f3ee695759bc3559fd04a6a551ab
> Author: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Subject: of: Factor arguments passed to of_map_id() into a struct
> 
> This patch updates of_map_id() to take a struct of_phandle_args instead of
> passing the target device node and translated IDs separately. It explicitly
> separates the input filter node from the output arguments and transfers
> ownership of the matched node reference to the caller.
> 
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index e37c1b3f87362..e63a43be6c4a3 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -796,14 +796,15 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
>>  /**
>>   * of_msi_xlate - map a MSI ID and find relevant MSI controller node
>>   * @dev: device for which the mapping is to be done.
>> - * @msi_np: Pointer to target MSI controller node
>> + * @msi_np: Pointer to target MSI controller node, or NULL if the caller
>> + *           only needs the translated ID without receiving the controller node.
>> + *           If non-NULL and pointing to a non-NULL node, only entries targeting
>> + *           that node will be matched. If non-NULL and pointing to NULL, it will
>> + *           receive the first matching target node with a reference held.
>>   * @id_in: Device ID.
>>   *
>>   * Walk up the device hierarchy looking for devices with a "msi-map"
>>   * or "msi-parent" property. If found, apply the mapping to @id_in.
>> - * If @msi_np points to a non-NULL device node pointer, only entries targeting
>> - * that node will be matched; if it points to a NULL value, it will receive the
>> - * device node of the first matching target phandle, with a reference held.
>>   *
>>   * Returns: The mapped MSI id.
>>   */
>> @@ -817,8 +818,21 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>>  	 * "msi-map" or an "msi-parent" property.
>>  	 */
>>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
>> -		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>> +		struct of_phandle_args msi_spec = {};
>> +
>> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
>> +			if (msi_spec.np) {
>> +				/* msi-map matched: use the translated ID and target node */
>> +				if (msi_spec.args_count > 0)
>> +					id_out = msi_spec.args[0];
>> +				if (msi_np && !*msi_np)
>> +					*msi_np = of_node_get(msi_spec.np);
>> +				of_node_put(msi_spec.np);
>> +			}
>> +			/* msi-map present but no match → stop walking */
>>  			break;
>> +		}
>> +		/* -ENODEV: msi-map absent → check for msi-parent */
>>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> 
> [Severity: High]
> This is a pre-existing issue, but does of_check_msi_parent() handle a NULL
> msi_np pointer correctly here?
> 
> The documentation added above explicitly states that msi_np can be NULL if
> the caller only needs the translated ID without receiving the controller node.
> However, if msi-map is absent, execution falls through to
> of_check_msi_parent() with that potentially NULL pointer.
> 
> Looking at drivers/of/irq.c:of_check_msi_parent(), if the msi-parent
> property is found, it evaluates:
> 
> 	if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
> 		ret = -EINVAL;
> 
> 	if (!ret) {
> 		/* Return with a node reference held */
> 		*msi_node = msi_spec.np;
> 		return 0;
> 	}
> 
> If msi_np is NULL, wouldn't dereferencing it via *msi_node trigger a NULL
> pointer dereference? Should this be fixed to safely handle a NULL pointer?
> 

I see this is indeed a pre-existing latent bug .

fsl_mc_get_msi_id() in drivers/bus/fsl-mc/fsl-mc-msi.c already passes NULL for msi_np:

return (root_dprc_dev->parent->of_node ?
    of_msi_xlate(dev, NULL, mc_dev->icid) :
    iort_msi_map_id(dev, mc_dev->icid));

In practice it never triggered because FSL MC devices use msi-map, so of_map_msi_id()
succeeds and of_check_msi_parent() is never reached.

I'll will fix this in v16 by checking for msi_np aswell before calling 
of_check_msi_parent() in of_msi_xlate().

if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
    break;


Thanks,
Vijay

>>  			break;
>>  	}
> 

