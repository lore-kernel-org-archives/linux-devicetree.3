Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB818871F
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782517821; cv=none; b=jb1g6BFKx5sx07PtkBTGaL9tQMT8prHO+pMQRVkZ7SCOIZqaPA+QYkMeEp5rDneP35Fns2ZngsTdS0E7Z/+o6gNNOa14OYVg0hTSRnOPcVuB/VmG4IqSYcdVLBwGfY2+qGuU1WwZqe3x20p1D6sKqSyCEAocPEw96ze5Lz8AUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782517821; c=relaxed/simple;
	bh=tw7O3G18WM+tsEMcajV83sOUmXqD1KkathtWb/FhU0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsjnOO+xU0kGUiirJtsaX5Mntq/k8PGtygAFu0VUPKXvdaJ7arpC0/MjgNKVeQiEJmoTkSLmpnYrOAKH7XKlrMUOjAeTZ73Qng5G3io/mxqFV7Az8jaWX4v6rocg6SgAUVX6rUt+xfUxAmRs3E7PXjIc7+9ELGM+ceeMLabdxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0BD1A6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7XMmVul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0BD1A6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7XMmVul"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QMxk5X2210634
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 23:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=; b=k0BD1A6pneDG660A
	MuQ8jHjeCDCmqYUboDEQtY73XNqlUKMEwfgh1AYDFOZrdZ5XhccmPLnCVIah/YzQ
	vPH3Txxakq3StxhF86rC3HTy9rEFDuXLx1BsAIp8xldC3vbNocIWsjuoxJApV2a2
	r3ynWntN8Qbn/7b50ihWz7a6Qp/pAreqYQgCkKjl4Bxk3VvYUXIj0p3jaawBd8qk
	7GvuGnnkIJSwyY6zYBkiHM2PQPbeL7UbGUIrcqnJStU/HHanHffO7voASH19Sy7R
	AdVwtULgUJmb9/ltcEa66qZTRNSJR3Q5eqRP8N14uqYmo1cKivs/1GXqX5CLGXko
	MfBYpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qt3gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 23:50:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fac944af9so134437a91.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782517819; x=1783122619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=;
        b=j7XMmVulIwL2OPrb+OW367Dl1FtF2rZ+/utJgCiWmtn76ydozle86FHa8gD7HNd+ce
         WVMKuyOKV4U5MiLAydwcKCXdzcBPDSjpol2KdBEK1mYVIyajXZd7lkFCPGGFZiO+Fu3C
         5Q4H/ZofrAOB+yltVMiTA4eNRw39HHoOFZ5KHooIZmT/m7Cwm9s5MXfhXV/nd6w2H6+g
         gzzpyDrYXKflKq9YE0cZTJyrF8YfszEggV7sjBYF4KkALp+Dv6ck8Nd4XHoY5MBdJwyk
         nMCuACAZiuU+9+ZUuk0yGzVu2QHSU6RLMEgQj5S/foQxqvsGIdOxDaAgT2z47U05/uPD
         pD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782517819; x=1783122619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=;
        b=ByH4iSQc0tlllY102cmx8Jz6cgfn5h9MZza//sm6E22K046kHXg+aG+R/cNb/BbwUq
         QPEB/wWo3dFhJEVocYD9kt7aFGT1MmtUq+jB1KKZCfB4gs4xdU77EbyLgS+POKixqzHs
         o+dgkoI221fhWZc/ac+AoNUpbn7oL7ETfRRA9ijKAQikdX8K3xorplGjVTtlmArGP8/8
         mIplA6EksixIiTWjmP6xMKjRP8u7yir1Foxz7botAfbZ49WoNOK1TT2/Ho0b95dZx5V/
         8tp3N/uYJIgz+9k3UA23kkKqgmoBTZyt4iV2tOIVB+7MXTTCySnbN2SpD+AxWzlu3vuq
         HLiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgD+mrS/IPrcEBGzKpUBB1WQ44fpk1DK1frtr/G+jmiUIbhiI5d2sDUds1g6q7l8a2UlMOxy7bgquN@vger.kernel.org
X-Gm-Message-State: AOJu0YzZD5TpG0EXrFb2stPgp7OewNKvJ01sqtezkJz4NX3WA8j4/5DM
	R9iA3gt8YyZ5I1Y5oVrRh5FDeXYGH815nglGjZ5GRsIr/tGa9K6D2yly8NNyYWPR6Z2xnuQC7Mf
	BsIY8FbPbe0UyZ0gcBb9Aimeho1tmV/zTZmj9hdcLEh8nO2GfFdTycDetMDUGA80Y
X-Gm-Gg: AfdE7cnir94fTVIxk6XVpi3Qutk2yLBOLcno4EcO18Gi40vxheLPdrI1pEDrNEI/Xn7
	EaQNhvJivg+iDjc2RO25G72WMZrNZDh6VYEFuuEubBkeWMtpwgLLQEZ2o2Re16VFnZyyPuP2wFI
	UbzGs3jDv5mRWPwbVKzJoZ7pHzInrVp4+IJFWdld3at/YV4sDsEwGjjNcrc9ZLsbtwNFE3SCbgK
	DxA4OtN6q9/Azvo0Hbyj+eC8Qgn62rpZtJGhcL6XKYMrkBV58D1dypNlMGkUyREJ0PzzfU8/4WP
	5crDgnwQasYjC+64w8pfwbMwNJ1xzgtXpFqfggI5lGvrUAjZbrsvM0UtmytuRBaF/o95JzcKfa0
	Zeqs1wxLxsYwPcW2Fj+ghCBLDhIPyh9z7qOk=
X-Received: by 2002:a17:90b:53c3:b0:36b:9231:9718 with SMTP id 98e67ed59e1d1-37dfa2c9951mr4623236a91.6.1782517819227;
        Fri, 26 Jun 2026 16:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:36b:9231:9718 with SMTP id 98e67ed59e1d1-37dfa2c9951mr4623217a91.6.1782517818575;
        Fri, 26 Jun 2026 16:50:18 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96eccf8sm4246469a12.3.2026.06.26.16.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 16:50:18 -0700 (PDT)
Message-ID: <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 07:50:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
To: Alban Bedel <alban.bedel@lht.dlh.de>, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5OSBTYWx0ZWRfXwf1PfMylvLYk
 ooEZjgD1HxKLYyiXQ93LS6QD66R0JFana1cgCxmNidhu5EKThygbimspKpmzdLRc6k+e/sbWhQ9
 1kM4PEdRz6L+diaNTXGhYD6lnJL7bWc=
X-Proofpoint-GUID: 76rOJ2Rn8EPXwGx2ylrezCqRH0nhkEqu
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3f103b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=eDjjQEo3sodWcWNWpWEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 76rOJ2Rn8EPXwGx2ylrezCqRH0nhkEqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5OSBTYWx0ZWRfXw/v7DmVPTsaN
 kj1a88CNnhzo/xU/Sgy/loWVituX8N+7+2f+Ejs293AShiPrsSA0GqSQp/+isiUdr/B1p+AheWw
 7CZPxYhEll7P9DyeSfdWFG4Y+xFfsvQiwmyStpaSty1Kg+5CT2L0CBn6li9Nf/AklHAc6Fwhc4t
 NgPLAr1MGE0Z0X3Gzvhmh3zoXVYkb4xLIOXp4USlDmrvG4x3MUz44qLYbGJJXhlQXwjznoBbLb/
 uY7MCZe+kDh/+aFig6cdM8AFKr52bD8CAiiDGpcbw9vf6GEOPaCbD2NiuzAjzu8qwwrlPGH5Bzt
 IhtEJ+4lkz3tMkLw0jADjJRYpxrwb1xZIUVMbnknIhy69Ten293CdARtgI4Dg2B6PPSyqB3okx2
 Bf4oyLl2+yLkYh47z1FeHZo7NDiSITLLsa1jyOIUIGXSF5UVNKQYcOP1rZiKP0C8zeg97QBf7oo
 xpYofKgFTANfrHBHOYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260199

On 6/18/2026 11:20 PM, Alban Bedel wrote:
> The bounds check for the index passed to
> software_node_get_reference_args() was failing when passed UINT_MAX,
> this in turn would lead to an out of bound access in the property
> array. Fix the bound check to also cover the UINT_MAX case.
> 
> Fixes: 31e4e12e0e960 ("software node: Correct a OOB check in software_node_get_reference_args()")

i think the fix tag may not be right.

for original express before the fix tag: if (index * sizeof(*ref) > prop->length)

for UINT_MAX, multiplication overflow?

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-devicetree/20260611103904.7CB131F00893@smtp.kernel.org/
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> --
> v2: No changes. Only submit this patch along with the patch that
>     triggered the Sashiko report, to hopefully avoid another useless
>     report.
> ---
>  drivers/base/swnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 869228a65cb36..2bc76f01eb77d 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -537,7 +537,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  	if (prop->is_inline)
>  		return -EINVAL;
>  
> -	if ((index + 1) * sizeof(*ref) > prop->length)
> +	if (index >= prop->length / sizeof(*ref))
>  		return -ENOENT;
>  

who will use UINT_MAX ?

This function is a interface function.  the best fix should check
input parameter @index and return -EINVAL if it is not expected?



