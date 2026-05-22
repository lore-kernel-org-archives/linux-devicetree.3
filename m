Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A53C2787
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443238; cv=none; b=cjBXfhX7EaGDJtSUdw9+IX8ujbdrW5JkGX/ycMbHIXnw8WamtLaS6yob12sGo0uIxg39MOjhmn3VnwOTdtRWIXXkb42cVafO2ek59Rv9+bGi1+lw7eTVKVKxqDPokKkNcagoctHqW/sdbMjzhpnKypDwZkXvhGbW3WVKrnCJUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443238; c=relaxed/simple;
	bh=o9GC/6ank0uxJw5NfpsZY/9YO+co0ljwtXYLI4sQCGs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Us134zDRHQx2H4iZDsKwsDb4BXfaNAQi4OIsKdeCN9yZiUVpnHshX46Dp3BAXsoXG4YaA7SEavTTOOfcIgpI5DwJF4nvwrEJ8/te6eXFo/LdY9gGiuEHSXjf9EgVVvhN4/qGGcXiAJaYuO4pwGPt0x6SVa+KTJ7l8QgZ6peToUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdimGnyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SraMj8XH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdimGnyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SraMj8XH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6x3vc778821
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=; b=KdimGnyPsjDMWGCo
	YburTCoVlqDHirZ4cQXWfpFh5+HDeSBFwcw8lNsv6Q4JbquDJ72kX4UQ02gjTpsR
	ErpJY/9t0thu8/ebKBIYsDDa4skf68W2Tq3aeZqnsy7AyvRLdFuezCYVBda5ms3j
	/nqrmasBjBkirux/efqcO93rn0xEhTKsubIrQdtqjVQrAuteMoNj+L8kS8tGLcNS
	GrQft/68IQfmbDgx+zqFGxOC/MTRtsgjxTzNhT9DOU04OMV9TqIRM8em3PShTdHU
	2tir4aCIzrp8QVbv/Ip1o+oz61zIfJT8+c1aALlV9SdCQIpUvSx97Z2hZnSuGesU
	k+Q1Gg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at44b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:47:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso7524025a91.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443234; x=1780048034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=SraMj8XHUgDnI5Jo6mkUIm0uipaqn60/Mt45v+9NBN3tY3U3je17BcsKponZGyDidA
         TgSfE58ysSwxG6PTprrGv9AF5CYLXLVKGGGVIF+IFavvn8+GgDEy59Ryvn+rWoS/ajqh
         wBqWxgmyTbCJ8aMLPP19CplAGarXFmKeEfkzrIHzdKk/oYIg5h5E3WFyt5fOnMM+ZgU0
         Dj6XtzbZFslEiBuzC6XX8YKejydw+K4e7vtlKMKReJDPRy/SLR8AZ9oDA+/Okcgi/Ktz
         AK5tTotwlmbxJn36DJex194IS2FLJiqBI4a/2cLnDJBn6FEBpnKh3mGYeglho3NqKsKH
         ofOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443234; x=1780048034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=UaSbpOlF2Jlynv/llKpKdMLAoQJqL91ogfmjSHuKeEffusBoWDhhC3iPLLW9R6lMZN
         cqtc1o974IwcHhV0brJtHllxYjl0AOInlyxMSyqmPstVxVmB9yhpu+wSHUsU7kQ0NDv7
         EL+zKPPeadtyRpXznBIfoPQzw3kcjokQSSFGl6fPsovnOQTjRCC4NgLu1pu73JqARIDv
         uRfVGFp7VSkVrUZrVE6NF084D4k7JLuVb7SM6qTZMJUZ75qAi6hv8UbknZ/5gkblnJUF
         /+v05XIAg643zDucqE8F0D7gVnqgSpMBLuoLPx9ObbDCEFRAjsImVgwVBf8e639bonLQ
         R6BQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6wXBw5g3LCdoKivIO0JGbPdOfwB5gXB4ASLud9msjY6qBOLFeqKHXDoBWXua+qDE6+4dS4ccyXU68@vger.kernel.org
X-Gm-Message-State: AOJu0YxYtno7bQt23ln6clC4m6itEYtfbZ/CA0MgRImmqTR3dvgfqNhl
	/Nom1rih9HcMSlFMwDPxgFL+zvrnSkzytO/lkCr4ALFey3RbUR4H96yFX46qXyR8pmcYb9X06uX
	7GciKEaJz6gGKnjr28IiJCh9osnm45A/nUGygrE188/POIdvioG2F1ZAIn23GAAk5
X-Gm-Gg: Acq92OGcE71xBZD4i3enwxlP/Ac3AMMqQmFGVeKGefJBW1qh6b2F/wFyqfpJ5Kw8mVH
	MzYSa6Ku03w+IB74T2HkbDR0JUEU+Fuil1R1rN4qTYB4IzsyeqH0MzgmohDemFQqVH9VcU5QM9s
	0kB6wla+gXoFH5eriI4VwIGtvY4mbybE43jFsXUL0TvDA9OY7C4QajzIkHJLtDZEUrxaHfm9LCj
	jFRjbJTUUd2xoB0pSDWC2N/YOb+v21qaiPR0WKarLzCAl9Mwcmj1eXEDKg+ytw97vzw0ecrbeFX
	dpPq5SUNataX7+8IPlT/1upq1TfNZRAJe27/cMUZL8xDz/fUks+G9G9AB3xnSG2H+II8Y4BBjMc
	YC4Ntx+ZZyHfWUCagtDBsY7K3eUZYzSlafv46Op9HmaMu2qKKl8bAK5PB
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100570a91.13.1779443234184;
        Fri, 22 May 2026 02:47:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100525a91.13.1779443233648;
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fecbsm1062574a12.1.2026.05.22.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Message-ID: <a3c4a161-8222-4b57-8328-b1106b1b854f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:17:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
References: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
 <20260520092923.0EDD11F000E9@smtp.kernel.org>
 <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ffP6rH8MC6HQwA2U-2iY2k9FUQbrkg7q
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102623 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=7_kb8tBQChwwwGt_9_wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: ffP6rH8MC6HQwA2U-2iY2k9FUQbrkg7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NyBTYWx0ZWRfX7HJV8qmR8Rn5
 dQpOAlgIugn4KpkW91aNreC/JBRQlzzAP71FRoAQLHlVsRCmttiIYz+jG4YMgCtweaAHw8hJB1l
 lIyaOFekhzYvz2b25fm312iKC/bl2cchN4cVVvxPio9yKIaEtUftnP04lyEc+qDL0rJEyga6biF
 4A6V7eMDTpuymhqbrZmQfUUTfSxOHiIt85M6VQqAUbIX5mrkEksqg2VH0N0yJf87h6U9idEIx/f
 jHgsslvDGoyPGnLXM0hBq8EeMxcH+guYcTIAi824wbN5wvKqU06pKQor1fsTDFE8MUaWXUHRltl
 V4qv863zLzYlNR5oGhsxNpau1kGJZrAaM2xKOwocOEwXECfI2jxvOA6COx0o/ib3ZkaMg8syutq
 gmb4/J9bI38mYkHnYU7tBc0C/tF/0mnmUfD+4dfXIA0dL4DvSRFufqzV9g0Bp4Cpqn7D4YexET/
 /UO39lJOChZspoJKjog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220097



On 5/21/2026 6:47 PM, Vijayanand Jitta wrote:
> 
> 
> On 5/20/2026 2:59 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Strict requirement for `#iommu-cells` or `#msi-cells` breaks MSI allocations on standard-compliant controllers.
>> - [High] Array desynchronization when parsing legacy 0-cell maps padded to 4 words per entry.
>> --
>>
>> commit 23cece64ecb1dcea6290dbab34facbdac53ff293
>> Author: Robin Murphy <robin.murphy@arm.com>
>> Date:   Wed May 20 08:02:42 2026 +0000
>>
>> of: Respect #{iommu,msi}-cells in maps
>>
>> This commit adds support for parsing target nodes' #cells values for
>> iommu-map and msi-map properties, instead of assuming output specifiers
>> always have exactly 1 cell. It updates of_map_id() to parse multi-cell and
>> 0-cell output specifiers and reflect the actual number of output specifier
>> cells.
>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d658c26201353..f436e26763818 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>
>> [ ... ]
>>
>>> @@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
>>
>> [ ... ]
>>
>>> +		phandle = be32_to_cpup(map + offset + 1);
>>>  		phandle_node = of_find_node_by_phandle(phandle);
>>>  		if (!phandle_node)
>>>  			return -ENODEV;
>>>  
>>> +		if (bad_map) {
>>> +			cells = 1;
>>> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
>>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>>> +			of_node_put(phandle_node);
>>> +			return -EINVAL;
>>> +		}
>>
>> [Severity: High]
>> Does this strict requirement for #iommu-cells or #msi-cells break MSI
>> allocations on standard-compliant controllers?
>>
>> Several MSI controllers validly lack a #msi-cells property. For instance,
>> arm,gic-v2m-frame nodes do not require it. In
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi, the pcie0 node defines:
>>
>> msi-map = <0x0 &v2m0 0x0 0xff8>;
>>
>> but v2m0 does not have #msi-cells.
>>
>> Prior to this patch, of_map_id() implicitly consumed 4 words per entry and
>> succeeded. Will it now fail to find #msi-cells, print an error, and
>> return -EINVAL, propagating the error through of_msi_xlate() and breaking
>> MSI initialization on affected platforms?
>>
> 
> I see both arch/arm64/boot/dts/qcom/ipq5018.dtsi and ipq5332.dtsi both have
> msi-map pointing to arm,gic-v2m-frame nodes without #msi-cells.
> 
> The new strict pr_err + -EINVAL breaks MSI on these platforms. I'll fix this
> in v16 by defaulting  cells to '1' when #msi-cells is absent.
> 
> 
>>> +
>>> +		if (cells > MAX_PHANDLE_ARGS) {
>>
>> [ ... ]
>>
>>> +		if (map_len - offset < 3 + cells) {
>>> +			of_node_put(phandle_node);
>>> +			goto err_map_len;
>>> +		}
>>> +
>>> +		out_base = map + offset + 2;
>>> +		offset += 3 + cells;
>>
>> [Severity: High]
>> Could this cause array desynchronization when parsing legacy 0-cell maps
>> that were padded to 4 words per entry?
>>
>> Prior to this patch, of_map_id() mandated that the map property length must
>> be a multiple of 16 bytes:
>>
>> if (!map_len || map_len % (4 * sizeof(*map)))
>>     return -EINVAL;
>>
>> Consequently, if a legacy device tree targeted an MSI controller that
>> explicitly defined #msi-cells = <0> (such as RISC-V IMSIC nodes), it was
>> structurally forced to pad the 3-word map entry with a dummy 4th word to
>> satisfy the kernel's length check.
>>
>> Since the new logic computes the entry stride dynamically as 3 + cells,
>> when parsing a legacy padded map with cells=0, does the code advance by 3
>> and incorrectly interpret the 4th dummy word of the first entry as the
>> id_base of the second entry?
>>
> 
> I see there is no real in-tree DT combines #msi-cells = <0> or #iommu-cells = <0>
> with msi-map/iommu-map. All in-tree #msi-cells = <0> nodes (RISC-V IMSIC) use msi-parent.
> If such DTs appear in the future, they would need to use the new 3-word entry format
> (without the old padding), which is correct per the binding spec.
> 
> So, No changes are needed here.
> 
> Thanks,
> Vijay
> 

Please do let me know if there are any further comments. I'll address those
as well as part of v16.

Thanks,
Vijay
