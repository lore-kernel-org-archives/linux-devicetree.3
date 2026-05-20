Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C55F3D34AC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280633; cv=none; b=gCbh/qGoq8OqIWn0j4iTbtuInyMOx0j0swCNzuimk4NU8Xlu1TbxICbuRk1v+DRi95Jkl6ncYR4+JdRGaNe716GRZ9aORetQpl0ngqIqM3zgKUvDDdH2Hc9moE/4MBJ6at/7wDnBeQqmEchqWRNdYXgng2fWiPhSNlaFNM+DraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280633; c=relaxed/simple;
	bh=MLZJQfVxkc3p+wwRG14wvrhVLIjk5+YA93+ABf6M8oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGu/1gSQC6+rZUZCkby+b/wqRI1tyGUzfvim8UlPA2/4lxqpyKtpLxtabwGmcmUbLFh9UFOgV5IEqZf6AT+a/gVz7G4X4kCV2glgyhfuhlb6tJazniO8Pz8X8yIaoxFBa/nCIHhoy2Ix4AAuBweF+03yiHmemWn9AbWkfVyM0gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PE0g9x9E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmIfLjDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PE0g9x9E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmIfLjDy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6wYVi1237947
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gn5gBpD04Wh/dxj5O9L+mE/y
	SwSb/e86AAimCDaG5vI=; b=PE0g9x9EkAYAa7NJAkxDINWmBiPkgxAICnjHbadV
	d0bcu3Yz0S2HFEXrXGPsq5yXEY7Bql+xk7t1KZ+mIFUdh8vLGVYXFUDIUIyeLd07
	Qo4/vnRmdiYIm1XKj5Ok5v1xEta8VM23bIV/YhaV08JAigGdtXXCsjg/j35or712
	BSixfUvDTq84m0vW7nsKGFBDamewORYudK/hA1P7r8x5kcq49Kbtk1TN/u4c4Ftm
	4JI7E+ItA4Y5AeryYaXjfE+kbVc3td2r88RHkyArplSZpOxzqpfaukAd4p67qoxd
	w36Y8xubgXMqlwpd46OIk66Cy8FtYYumRDLvLQnNKcFutg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svt3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:37:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso10527332a91.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280631; x=1779885431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gn5gBpD04Wh/dxj5O9L+mE/ySwSb/e86AAimCDaG5vI=;
        b=bmIfLjDyaM1w9XZmNE2ECPfOEOfcsE8eXF0yQxccxTD0isLEky1OOgkiF7IKupnzsK
         +0StKET39wdNK9Lu1w6tEs5mN6Os7Z4bu1I4bgW6z1LWzkXa5bZgyjaOrV9s8CzS9sIe
         gBpjaX3U1eheEyA9s2A3e6J/vbOcCxETqnS+LXwVrMPL1NxyR+KteGUmwaSbyfq4YlIc
         uXfUxViGlQYNzBmVDLH6YIwaQUydZ0uhuxCUQWRxmYsyosZLnBeAR7lJUByWzRloGNef
         N2K1WAoVfNyv9nkfv/A1OXw12fD4t9cxMxpLZ9XSQDDVyFVs9oh8oY4Ou+noH4KQEuMa
         i5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280631; x=1779885431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn5gBpD04Wh/dxj5O9L+mE/ySwSb/e86AAimCDaG5vI=;
        b=pxyrmGORrt5NUlZATpbMXCdRauYmYtY0dr1CaNKhbzR1LpkKkOV1DmSDpN9742uCs5
         EwkE9fXrHrXFjbVXKUkK42xoihAZXhQqcq/zVibV5rAFu+D49myxA0cmc/GSBAANpZ/O
         UtIWtno1ZQoZcfu0ShxwgUbGHPA0rpWdMztRqm1SDhKtFBS8DDFTzPOlKzvHsbZPxDZz
         fO+hvuCS5psHKDMHbigGhct12qVAhtXlyLBh+tR5DfHTweTfXiMmzBM0QxPjRZK6c9B0
         0ZwPXqEyMSpWzOPVNBjDp6MXGAx1RAPVFyQZQmaIdN24FfQyuDV/bwcFhPUQ72chrIWA
         F10g==
X-Forwarded-Encrypted: i=1; AFNElJ+lE0JdWhaBoRb5qcHlOEvzqw3LZV+qNahwAAF/ApWQblnksAy6ICjgpHXhF81gTWSLUmEm+dyI4DKB@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzqv+3PF4riXB7eHSZzDwpTcGkN8+jg3XyAGiR0ndK4kL4TxR
	HUJLUNnt8Z9Tq3DGO8Yyl5Y2v2mpbmeMyaTcdEzpK+f/Z4kinC/Aafo2GDzIhVomX3HHZsB732W
	5Ylt1DSsNQGyyFdin6L8wMqKq4UBjgR3c62BTqo2KxOg1wbQY0UdB+zjp49Vq0KCs
X-Gm-Gg: Acq92OGGjOiKF+UrzCTUVpwihvDEl7TCTytnzCqjqsSZVoVqiengoANL9F/OL57kkjU
	wXAYdyr9sAUn/fFVsjXsjajVR9UwPupmWNWqkzznLCe04Vmw25s2YIKiIcaTPDNBAQgOBAtdzVR
	fhUa0XeeGakvQDcZLr4ZUucSNHsAmrQz4U5SGoYL47fpX3AkB1ljMJ6mDoSw85K11AhbADBhvU6
	/R9LrCmZaaWPig4BlgUg9CCwKtscbyA2oiY4Af5w5NV49AttNfyqB77uMY60xMxGbUFgr9X0EqB
	8DsjFCKjxAJ5scAkw0j2D6DtUHMtYSV9gHmmVeouH3mvyC11Cvm7Vx80z1nzk5W+rwqjeYrXvV2
	ALMUunyd9Xzkkjk5cZtjHRHuHc0FjJf4xhEYgHxRBEBIUeOLuJuauCG08qDY=
X-Received: by 2002:a17:90b:3b4d:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-36951b75db7mr22645818a91.14.1779280630931;
        Wed, 20 May 2026 05:37:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4d:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-36951b75db7mr22645779a91.14.1779280630270;
        Wed, 20 May 2026 05:37:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c5f0eb2bsm9489673a91.7.2026.05.20.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:37:09 -0700 (PDT)
Date: Wed, 20 May 2026 18:07:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Constrain clocks for Hawi
 SoC
Message-ID: <20260520123703.zsf7bt5w54xuaanb@hu-mojha-hyd.qualcomm.com>
References: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
 <20260520-evasive-harrier-of-honeydew-06ba84@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-evasive-harrier-of-honeydew-06ba84@quoll>
X-Proofpoint-GUID: G3VD3nHjUuBqSHePFpgQQ8oS2ktbvxl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMiBTYWx0ZWRfX4Ny6yeyiaiS1
 li1ECINtIFRUDyzGumCvVCdQCoOAyIu30QlMXM4zIr3LrDyTPRFuoUibEi/A5xf7uRE3EswVI3s
 YlizhicDlaC0QdBpDrOnwUtJmvBIWJBK6YZJ7qMhR2b/Uv+KvcY5TuxE+O3ktKd5pXtELJayuKP
 vULSNBjJAIGGpE8UehspixQy3+ULnORKdSkYxEGGERfHLliShBa1CyEiLFO6mUa3iGQu2zNARdN
 1LBkOBpJvyiVBxnLjxE8csvq38uRamZT0XngRFHXYQaGEsjQ65I/pxEct6s+ouGUNIxZ7dIzTst
 96ePjTsySdDP83WNFmWDuags4/P2mI5oEnT72XwrRLIPTKgX7rEwAOuSUzxLYT5ijFXvy4Xrbk2
 w3EYyQiD7prrVNZzyg35dy4n+gKPDjYE6g1yW9DCZQXgCKHdRlSQdYdUg7q2uTqbm6kchbvmxLL
 DuEs95AYHYHe4QpxCpQ==
X-Proofpoint-ORIG-GUID: G3VD3nHjUuBqSHePFpgQQ8oS2ktbvxl7
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0daaf7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_gGcc725SQTycyyT32wA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200122

On Wed, May 20, 2026 at 12:57:13PM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 01:04:47PM +0530, Mukesh Ojha wrote:
> > The Hawi SoC has two SMMU instances with different clock requirements.
> > The Adreno GPU SMMU uses the qcom,adreno-smmu fallback and requires a
> > single HLOS vote clock, matching the pattern already established for
> > Glymur and SM8750. The Application Processor SMMU (APSS) uses the
> > qcom,smmu-500 fallback and has no controllable clocks.
> > 
> > Add qcom,hawi-smmu-500 to the single-clock constraint block for the
> > Adreno GPU SMMU and to the no-clocks constraint block for the APSS SMMU,
> > following the pattern how it is done for other SoCs.
> 
> If you decided to make a competitive simultaneous work, you could at
> least tell me that.

Well, I covered for one SoC, while you covered for others. I am fine with either one getting picked.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
-Mukesh Ojha
