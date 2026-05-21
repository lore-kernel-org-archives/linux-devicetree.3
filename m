Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396E3DBD4F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369433; cv=none; b=tuPQEX9OODX4eaU49sUAdJKht7GMcJxOhUzi7iE5ZcARqyhGAM40TwmsC5HC79MmQxuPJsmAXZUnOAVM91uf1ONCOgUdeABmMOaWdtEA1C0UPAQA4w237gK7vzW4UMwmzYzSP11VEAzr5V672kU9qDKy7m2YlzHWIFa+ff9X2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369433; c=relaxed/simple;
	bh=rEhgf+plDqfF1iHQj2avM/Yea3aAhqW3nHftW6pqB74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjzvK2RxTnRcCQsdrjWsxmWpDREuQz09eDLXDyFCV4Y92gfXVFh5A1qUlm2poZZOdS5h5cj2bCzrO1xjptCBvaXjomCY8P3anyRruHs9GelpdJFvW4q3uW6DhCNIiXbFTcGYUWFqlK544sAc/iGbS3h3BIFal1bvuAQUD23o1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea734BEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dnd055Jv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea734BEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dnd055Jv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uoU3772831
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmO7s4tc6H15glCVZR685KG1G1WPxtrKnGHzx/C+V+o=; b=Ea734BEK4zzY8HN9
	dRe4nY6EwO5Of9FRXTucovvLoxFUPnte+pxxMav2GdWaRujH5HbfraS4yvQ1OmWh
	nn5mBu8OX4R2nMlW1OhviVXvAss93qKoYXXzZ+ynfv65bpdCwWTrgtfpst5pXtAu
	hsjsL+8iCG+wglqEmBf7fsfwELEvE1N95VwS3B8PgyzzMtYhBzIEu5NjafEopK67
	mmr5VJD7xmHMFJzXqr/FNFtMK3bNDuzTSHZlJOiC1AePUV2WHaHqU6wZyPegal8h
	gEpNIVDnuCa6lhdn0wp5dJnxf9ExgcX9GVZiNW14LFXDtox4ldqx+KMiunXb2aFX
	XtqEdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43bkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:17:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so5425276a91.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369431; x=1779974231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmO7s4tc6H15glCVZR685KG1G1WPxtrKnGHzx/C+V+o=;
        b=Dnd055Jv6/aDuFFzvfoH0x5ZaNvRdnBSeblzkSSledC/hQgKRwtaoPlEm6zfkoRq+R
         DMpn72qBl9G2gI4R6vuMVqcdFLSY2dwQrX7dHKZSl/xpzka7rxI9g4F22Nrxcua9dchD
         yF+WxtdwUfkKJJfBZNiVJfG75PxgC++hJqPUTLBSCemcKnK4tpgoCznwrWJRj5eygZcS
         hLBY4rwI1DIuJsNmH9Jd9CPHmxAJ6iHGCMjh3aNlvKMrEq1QS0CbcaEstfigc090+uF7
         j9PvtlTn0rc9A8SYN4SYjB46lvAZcCZy2LvNf2Lc+3lBEp2NCAbvHfVba8slCyJwMG5D
         5Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369431; x=1779974231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmO7s4tc6H15glCVZR685KG1G1WPxtrKnGHzx/C+V+o=;
        b=VBcLDZqhCj6lSEg1D+EpTPdYGrvyX17gUCDHGKIegkNXVJIeHmKwJQiiq2DLr6wYLP
         b6r9xyUO9PzJd0csG+saZqWKvi594j3wkgi3lWhfaSqbIXCino66Ebmg9EuvHJD7N70y
         RNqcFdN9HCRQxKhVIO4y+KNKpox2YXiz52Ij0vzEtQrCMfGN0PwJULjx/+/TpHKhAwEu
         KqpMM8pxfigpUiN+7Y1KP8iV0F9NtOg+wUsYYu3WNq4BxjAUpBZeqjrIn4dsMjSdxAui
         ZxCIcHhle96FEeaoAYQZymd33urlgINLn7L8XNrqvGxEuak+GnIzHf0umL+SBgPYQ/tE
         /cdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6r1L4fF8Xn6L+3vQN16tIZit7rfKQkZK0w2CM19r97jjkNirdn51NtJGtTlWs+q4J6e9ARB3Spd9t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lN//g1KcWEjIecpuGz6wc00vtagxtEH2/Eu59kt58z7cQC1u
	aVtyJzcWi8ARmC2i14i63FnpKnCv13mzOHHIuRl/EckLbv2v48HhHL68H7mdT4vSDBqXA03JqvN
	Rml2ZtA3zTK2Nz/6qbb1y5fPwzRVx8fxdQA1zHpjsjuZGNTjamp8Mp4Ew1dxqrUAX
X-Gm-Gg: Acq92OFPyIffSLHOv1K2m8pBMv3vpyDenW6A+5t2IgT2w4kXhFegryeSaK6vUqpKLz5
	Xv/u69jzUgJ33j5iqxdyOpV4EgQewakKGO/uCSRjN61dYQ4dJOSYFSJ4lbXQyZM2Nom+mh1hD7G
	XTHQrzyV5YIANJ20SuLMXNoL3ddgSxo2fer8+Y8zCm++fD7Xl08R+iTBxebBFlcVJ3bJHyAYLty
	tTazPw9j/JP/ThvafTG2dlAWoPLVt40awgqCqa+RlV3Pft6Xty/tEeBtPnjQ7DgTadWCY7S2nWc
	6mz9a7SaMAmtX8Auj0L5ltZcsrLy78t5qmrajHPXZI8jGiOhq5fJZD1+J93e3y6HnDaXtRUfDhR
	B30SgTwBwVita7yxYG1cDuJJ6E0LZj/oRBUFeiADujeKEY1xXE0JB8mkrJg==
X-Received: by 2002:a17:90b:3c89:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-36a4561a294mr2766053a91.15.1779369430698;
        Thu, 21 May 2026 06:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3c89:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-36a4561a294mr2766023a91.15.1779369430119;
        Thu, 21 May 2026 06:17:10 -0700 (PDT)
Received: from [192.168.1.9] ([205.254.168.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb3b3edsm3705303a91.3.2026.05.21.06.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:17:09 -0700 (PDT)
Message-ID: <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
References: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
 <20260520092923.0EDD11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260520092923.0EDD11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f05d7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=49gMqqAeKCh39Y98CdGbvA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=h-5JRy4KEujm8fWzgV8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hTPKIP1LJsszM92QF5nZuWwKfh-mdlQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfX82+5bhccyjgT
 ZZ1BJijiLZlzgXY/7VMEfHcq4C2TmyDcnoBew5yJxIV2UQFYonflDPVLx+BMMqEtpj/jCQwR5+i
 hg/ZDo341T30cogjRYAC70WySuS0HLrnmpLcahrZ9wn32vIxwIAQyuX4vTyX1Cwump9RQUGyfRC
 auL8d5IeZdSYPwmkxfwkXIDaysY7sET1IxoxnGC5AE33UNzmI9I0IV0VuKpXu+US7/rXIubYi12
 81wflLNCWydJrssPJ2SYaNWLuShe1eBfexjmzN2ucM3Wd0EfBvmY2HVVthjK972OO7Fqs/UPgrl
 2oy5fGS7y1nHxs2eKS/s/cfgXzPZZd1LwF2Q6YFVCzAzXQgbuR+9OQGsUl8GmQpTky4IGf68sfn
 o2fmgddkp2rKDdmbEgq1AeW3cUwIlff5JYhFfEOX0vIvsu0h+NC5BHwnAk/KVtDXUBRCS4anChG
 mZjotVD8JWpYipbE0vw==
X-Proofpoint-ORIG-GUID: hTPKIP1LJsszM92QF5nZuWwKfh-mdlQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132



On 5/20/2026 2:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Strict requirement for `#iommu-cells` or `#msi-cells` breaks MSI allocations on standard-compliant controllers.
> - [High] Array desynchronization when parsing legacy 0-cell maps padded to 4 words per entry.
> --
> 
> commit 23cece64ecb1dcea6290dbab34facbdac53ff293
> Author: Robin Murphy <robin.murphy@arm.com>
> Date:   Wed May 20 08:02:42 2026 +0000
> 
> of: Respect #{iommu,msi}-cells in maps
> 
> This commit adds support for parsing target nodes' #cells values for
> iommu-map and msi-map properties, instead of assuming output specifiers
> always have exactly 1 cell. It updates of_map_id() to parse multi-cell and
> 0-cell output specifiers and reflect the actual number of output specifier
> cells.
> 
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d658c26201353..f436e26763818 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
> 
> [ ... ]
> 
>> @@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
> 
> [ ... ]
> 
>> +		phandle = be32_to_cpup(map + offset + 1);
>>  		phandle_node = of_find_node_by_phandle(phandle);
>>  		if (!phandle_node)
>>  			return -ENODEV;
>>  
>> +		if (bad_map) {
>> +			cells = 1;
>> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>> +			of_node_put(phandle_node);
>> +			return -EINVAL;
>> +		}
> 
> [Severity: High]
> Does this strict requirement for #iommu-cells or #msi-cells break MSI
> allocations on standard-compliant controllers?
> 
> Several MSI controllers validly lack a #msi-cells property. For instance,
> arm,gic-v2m-frame nodes do not require it. In
> arch/arm64/boot/dts/qcom/ipq5018.dtsi, the pcie0 node defines:
> 
> msi-map = <0x0 &v2m0 0x0 0xff8>;
> 
> but v2m0 does not have #msi-cells.
> 
> Prior to this patch, of_map_id() implicitly consumed 4 words per entry and
> succeeded. Will it now fail to find #msi-cells, print an error, and
> return -EINVAL, propagating the error through of_msi_xlate() and breaking
> MSI initialization on affected platforms?
> 

I see both arch/arm64/boot/dts/qcom/ipq5018.dtsi and ipq5332.dtsi both have
msi-map pointing to arm,gic-v2m-frame nodes without #msi-cells.

The new strict pr_err + -EINVAL breaks MSI on these platforms. I'll fix this
in v16 by defaulting  cells to '1' when #msi-cells is absent.


>> +
>> +		if (cells > MAX_PHANDLE_ARGS) {
> 
> [ ... ]
> 
>> +		if (map_len - offset < 3 + cells) {
>> +			of_node_put(phandle_node);
>> +			goto err_map_len;
>> +		}
>> +
>> +		out_base = map + offset + 2;
>> +		offset += 3 + cells;
> 
> [Severity: High]
> Could this cause array desynchronization when parsing legacy 0-cell maps
> that were padded to 4 words per entry?
> 
> Prior to this patch, of_map_id() mandated that the map property length must
> be a multiple of 16 bytes:
> 
> if (!map_len || map_len % (4 * sizeof(*map)))
>     return -EINVAL;
> 
> Consequently, if a legacy device tree targeted an MSI controller that
> explicitly defined #msi-cells = <0> (such as RISC-V IMSIC nodes), it was
> structurally forced to pad the 3-word map entry with a dummy 4th word to
> satisfy the kernel's length check.
> 
> Since the new logic computes the entry stride dynamically as 3 + cells,
> when parsing a legacy padded map with cells=0, does the code advance by 3
> and incorrectly interpret the 4th dummy word of the first entry as the
> id_base of the second entry?
> 

I see there is no real in-tree DT combines #msi-cells = <0> or #iommu-cells = <0>
with msi-map/iommu-map. All in-tree #msi-cells = <0> nodes (RISC-V IMSIC) use msi-parent.
If such DTs appear in the future, they would need to use the new 3-word entry format
(without the old padding), which is correct per the binding spec.

So, No changes are needed here.

Thanks,
Vijay

