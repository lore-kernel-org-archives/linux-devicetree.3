Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E408257855
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154006; cv=none; b=HONsheZxjYijl5mZdolBw6r9ggo8FknLytfZ1l+nGD2ehlg+M8/4gxASSV4W77UNW3UkN5m+lK6Rk6vXoaPsZn/g/HDOf9TR9u6lc6CZDJ79749H453/aqltqhtmHfWssnfDYfeVRrDZdkyaitTJ/tYiacheBiC4oUxWxGPkE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154006; c=relaxed/simple;
	bh=g5ntTcRjA/DRx/Tc6WHE/ZwjZgOEEGC5sk0DCBMjbUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmUDSaKlUweSeFPoym0Ve3VC9Fl8nIgtNAzD51QWncRLUwu69xpoTjMnsZl18fJUX6wBmBRQOi9M43cIeg+P2FhXyyTN6rb8PhGnAnWv6E9CIHLKtYef/Y3Kn20BkyCV2MfGlm46biuAc4dpkd0jI/piS2YF+SP10HbuyrfF2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5cDsLgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfOr2nzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5cDsLgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfOr2nzf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64INbiJq2892861
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Pgq1DCRhxh3w2geotao8iZx
	v8LzDha+tYB2biNcGVg=; b=p5cDsLgoOpzHCl4Uy7kxrXdGkGxwM0wAuq7kU6zo
	hWMQMPDQ+K/B/qVz95z2RsflJTgTgBEshu4IUfA2j91V5FN5brqHcQTCO3u7QMK3
	nha85kfzDR3iN+bmVFFLw7qOfqv4vojnoM4k3l57kMopBKmZV6z1Pc3HNyulVrjg
	nDdpNf23VUlHaYupZrRLsnlEEgQqc35haKsPAm3B0uPdZfdmaJ/umbl74HJFGHeb
	rbLTsUFRBnXg6HikIy2gztYa0G+cqeYQn190YRBgdr5hocvTkDygFWEfsikKGShK
	znmFL4dCr/IJput/RclK+TBjf8bZjakqL3sV1gEWt1LuYw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1bsuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:26:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so1531501eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 18:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779154004; x=1779758804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pgq1DCRhxh3w2geotao8iZxv8LzDha+tYB2biNcGVg=;
        b=GfOr2nzfgUqwo+STdcPoLHrotNQ1Ya7qsjOsp/vkDGQaCNIHlU4FwLK5c6i1LhFlfL
         lKZiPVJUWE+Ty4rDj5aHMW3d2tnWt1WQaDX5WCfQTBfSs4ZCcjH7mIHavyxv8bvfiuA4
         B55Y+fYDsyhTqBipTobCs59UEJXu+xo6SEUXZ/SqJcNmOmrB8mhnFSO/4EGpzlZopqGd
         GMVAZ4WE5DgDh+i1FlaRmGnjVoEJF+JTwpdXbfO/tlZzQC5CdqN00Zv7879pi2UekmB7
         MN8CwPWuHwYwI1aNZKldp+wzIZ+sk055rsdPwXZaxyyB2Wtd/uKZic/GC9tYNqqeeops
         ywBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779154004; x=1779758804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Pgq1DCRhxh3w2geotao8iZxv8LzDha+tYB2biNcGVg=;
        b=k6JQjQjmCMuj/afI9DCFsDFVxskrF3k5G+Z+WbovZIHtPd4xLi+ArMh1lY5DCAZ+tH
         FJ3S93NuCxy0k1uI6M/7ZmtCp/IWXWQlttVNyEsDwpUb7auURezzT0Vbjz5GxvEhu22O
         S2csyW9CEQqAk37G++WTAHgAjh2CncjBGtIeHI/WXsd5mrXwn2ZrVJtjyS1dq/ih6G1s
         zMaxjywftwrSDRXdSNhq5NHAGyASQCJUV37dwjLTRqPMQ05eDiIPTKb0WDBA0l9iuPvk
         kRr+AsotY3EODRJxdi5IKZdxqKsqNuu1c9w1zFQITJrXONJohGHxLUQNTN2t1t1SDuoE
         vutA==
X-Forwarded-Encrypted: i=1; AFNElJ9Vizpth5a3jJkLtuEtiMBPBVzGozVuH8zqcBMi8YLRhmQscNfszRDIcuXbl0gWnEjXjzukuY811Cj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8Jj8dnUr4CsHyvutKW9N42TP0wWYNFgvo1OjqPakpi/dM00O
	i/k8r9EFjHTvWKtmRh6B70m7t9zPsjnkC6wbfCd4DabohReRrLJOI7X/diLl8m5zLxK2hOIJhMA
	41iZR5wM/sWHf4PJow1izTnKUF+bFJXdlE4Vv8GFxIacVaxGVQ8/jxNGhqVFj/evR
X-Gm-Gg: Acq92OFkod6p09+aXPZARlJEOeyXcA2N3l9DkRfrDzcHNYo3S2wqUwzQq6lLL4JI8us
	PDotvyfhzZ3rVmpEN/D/BufMdUf0T/+4Hl/ag6mR+fbF6SAYQHSZw3JqREulTImlSQdb68oJpFs
	OMUN95ZVVUTxg1zb7kk2g3Gtx3Q5YhFfXQavbDbrfSquSivACBHqekb6/5OsZHyAmK0VbRHussP
	toDVlj3OMJ9WwNQrc/5ijZ8U1MjzxlebrRBmy6OgQ97l54M7AXGLg2EfDgs+YnoWNcAv89gLrqP
	Wn5tvCvDAQSE2L6iFSzvThEOthBbifodq6OwiDfHERM39ZkuVdy7ryK/4mpVB7K/4ZiR4/xZ/v7
	hME5VD8zDMgjcCydM9rJrHrt7eZXHwzvq+MNLSzkgi2Y5VJ8LwI30t6xPUH/VisCD
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id 5a478bee46e88-303986814f8mr8376352eec.17.1779154003770;
        Mon, 18 May 2026 18:26:43 -0700 (PDT)
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id 5a478bee46e88-303986814f8mr8376345eec.17.1779154003281;
        Mon, 18 May 2026 18:26:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm15050372eec.28.2026.05.18.18.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:26:42 -0700 (PDT)
Date: Tue, 19 May 2026 09:26:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
Message-ID: <agu8TRpjYRqs0Sja@QCOM-aGQu4IUr3Y>
References: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 4ea-auF21BdKyyu_sKd3uJK8zAxupWdO
X-Proofpoint-ORIG-GUID: 4ea-auF21BdKyyu_sKd3uJK8zAxupWdO
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bbc54 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I7k1zq4nAz8js2EDA9IA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxMCBTYWx0ZWRfX0zi2/N8rOAiF
 Od5pCEpemMKvMf9PbDm46pp/FEsLqpW2936WTqc4lnxfHA/MLL0iOCQwu3BlChSO7S8jRYYM5sx
 cCIK41Z/ZFXimKd8ah7ZhlGBquww+923xdgFrVXeEzh6/LrzrHwU0aX9qJF/m5QWma3iFSWsNzh
 4NJuTFvouL6vSYfab3QXMYspVVxEShaaaBRJ/hSRYWRN1jqzlxxzXWO8TW68o+hMBd1c7BqcrrQ
 WdoRP9qhGzpIEMpsj8xz4v5R08wDFhIasq/3H70gxPHZBw1VYo3F74WkYr2xCWrk5cQtxiMzOUU
 YPBJGkxH6MeAwLSu3N2W3iKQkAN80VFU26m2Z5YZV1TU4ULxwDKMmx9C4fekVHN3kjPbX3UjXsU
 EmJIBIgnk0c9HoVriccvl6V8N/MckkWmja51z/FzNE75SMeNh7pY8NrmfXxZ8Z6JdqHQ6T978zg
 26qNexKa46Ux55z7K2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190010

On Tue, May 05, 2026 at 09:14:54AM +0200, Krzysztof Kozlowski wrote:
> Many of SMMU on Qualcomm SoCs come in two flavors using same front
> compatible but a bit different fallback:
> 
> 1. For application processor, usually without any controllable
>    clocks,
> 
> 2. For the Adreno GPU, with some controllable clock(s) and using
>    additionally qcom,adreno-smmu fallback compatible.
> 
> Add missing constraints for Glymur SMMU on Adreno GPU and several other
> Qualcomm SMMUs for application processors, to restrict the clocks
> property to a specific value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
