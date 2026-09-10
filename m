Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B74A43E2
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052801; cv=none; b=HqXEalhsQCWDa0H3qzCHEamQZqz9yxWXArjDh6WxmeiYue3Td+vb5H1VpOIDEUo3w/aClBZwfL2Qvg5cYvDCuVzdwdRBrbtkAOB/BGfWaw/iTahAcPV9U3UFHfWH/+vQpHbErOYidhZ/LJXrXTZpZmbNfvejy/vLDajur4uK1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052801; c=relaxed/simple;
	bh=HhKxfqZri4OGfPWO86TNfFiRawc8WRDx4wxR8ivdMMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz+tDggyP5r0oqln03MrJtvm2jfCCSVsL2x2O23Golqtjts9ql6WMoXi09D4VzkTXWspNTyFSaTfJzV5taQqVVC2GeulFcmw9KKunZ7b/q4MBI16C6f9yygHbzw9/zI1qoPbAh3rfDrZpD3rOdfRCLIOzwDuA4LuPUvCPS9LVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWMeiqBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwTofXjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWMeiqBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwTofXjv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF5eac651638
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PkPrpuB/2JVj3QeHoZHTBk6+
	P5ZBHLDJoXGucnbPeZ0=; b=DWMeiqBqEHVh3r3sB6fUKU2AXhCac2u3sfAnj2dh
	/6caS+/4QyoMpgUoqOc2QVOc3zvRrHDuN1wO2YTZ46CiW2M11CQDEf1prnU4UgrN
	3owOi4eeco0GBjW9selJVxpLPdTCTfDfRzfFUtXg2lw/PHsBMVH0ilToDhW3N/WB
	Si62Mf/bHaxrRjk4LKrluxGrlZrAN3SiZnTEkcY+j67SRlwduRyRJtatCYXd7UZi
	9uUZ46h4t1Kmkooub0tJkgEWKcaabuRluLlx5xbaxguagD4H+4eEP+CybNEvQoii
	U/68grNkRbZSicAeVN6/e8dJrxvywGZEDcoklGSAUpoqWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv780w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:06:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so145016045ad.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052794; x=1789657594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=iwTofXjvi1eeO8dwVvyj4RLo+d57HVMKRXmi7/4r0lXWgDww9q86cTXKrRDOQ6EyKP
         OToFheiLGtc6IHBep1btGp2yx3oEvB5zOb8opjS1hQkqEzs7JhDmUNK8DrsXqYJtx0eD
         H24XS79xy9h8qycz6/TF0en74Tgxx0426cMOAfJiE84N0kvHoOxrLaaqp89KQgbXWm2P
         KMHA2CyoPlWBF4AIMTJE63UoXGmoQs30G5y+Jvn9pGMHAtCxQcwT2yseXuqzLFUIk3WV
         P4+P+hm39mx/KOzmvirbHYG91bZFTYNTjXCumto/f96EN5S553yzkRnlAwd+TZL6GGKS
         hW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052794; x=1789657594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=JVKr78Dly5liqVCuDD1hpQp4eYmkV7qFeRIN+ey7YI8DswaN3HtJENnxRTatsQSDwS
         prl73U+DTHVFXMM+8R7MhHLQxtfE7Og1qzZehTeuPUPYZ4f2PyzTfqj0BkxuYdw35Iju
         I4zxEfVmCSuDLPrqzWI4nAJ/GdAx87HlG5+7ehaImw/abeAZduPKMYrzjnJlUCSnq/GH
         0cElXlamlbETvhl+GedX5mu3XBi88xP7VPA6XVyHyUVCguwGPrBJINeWmwHyRo+UvkLH
         fxBegyyXOFvtGtZCMfKZtEk0o0snqoG1Qs+l1Ej+GkU+17uxr6mr3W4VV4X7vbA2DPAR
         OdnQ==
X-Forwarded-Encrypted: i=1; AKwUvByjNvl8Oz9aCkcjd6TRjLWs8LoPaq/91phZIxNqydIjE19NJ/3EHibpDo2KfZo+Zw8H/pKvf0oSgW9X@vger.kernel.org
X-Gm-Message-State: AFuF++mrivM67/ouDpKjgh59UHxLGW7sGnqPXaykTlFsCXqyGxnWaY7I
	nz//ejbAaWEmg+QDb8ll6kKZ+YadhcOWJfWIks1j1Nh6VUecetJQQZtXy6ujDFiJs/5qgwwSaWC
	6zVQ/romkWaonD7nYrITr0rGsuOrDjJdChA4CFBxbpkstR0ghQxdDB8rhO2csCozg
X-Gm-Gg: AYBFou3uIClKAWZNzR9THMvkRAeygZMRwlPbA2LjpJk0fmG8b4GSKR+0f8FV5gggLnf
	RvXQ6gYvx79wYmd7wein0aZboKPCDLoxkHyXmPojpkAJ8bl/FHUkgPVJorwzaWT7NxW373hpT6l
	HM5K7I2S1hbL+IB+D64T7hMO0poGwd7DD2FAARE2gPZNJTKyhZtnv+XOTK+WYQr5p9wJ42VYLmu
	My0ogiWdJBpfp6ZgEE1TaqyZy+Ia8fHW899J5soLohCu/uXfylF/M4i0SaNZFAqgU+n/dHMKLBt
	BaISudWXveVMl4tTz4oPtS8depny6Y2ng1uKohj9Bpw5M9+rvWmOMqYsqVAs6wVWqDY0+zpRJ8U
	ild0Ho6XFzBR5pWtsEn3EF6Q9Sqc=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18020027a91.23.1789052793765;
        Thu, 10 Sep 2026 08:06:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18019875a91.23.1789052792935;
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm47578520c88.3.2026.09.10.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:36:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260910150625.6sqdwduft5ccflv4@hu-mojha-hyd.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
 <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX04HgqB9DGAfS
 N6j7YhFyfdqqCQ6zl1gKXVhlRnrw5TNqRdfC3aMdFw4kXxZFELRExT5iSsdxnV8BYQsBjGAoYNP
 pnA/ZAybozBf3n68dTcALLQYULfwHMk=
X-Proofpoint-GUID: YZYcdnXRxPskZKZy7YBds9IuGKlnZ7ly
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2c77b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=LBkXyKVgYJf2stFOIyoA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXwdQXz8NmhsBq
 V9hNbJUi7XJmA697vL4cjGuAU4XlHsz3BPJpXhKo50nfcUcd6St7N6XtpOQzUBlX9WyfvcyzkFk
 La4qn4DJ+3j00fjxf/5BqYWgPllLDLJu9KgyLF3pT/7Q3i3N4sfuOYTE1Q1mKBEQU0Ld6E4OtYJ
 3eqm7ODdIYpo99SDFI/fBgPiLdYXxeuju7Scd8F3ImaoVgQp+E08+51h10LA2APkepYFBHdB2Z+
 3ApIO2Hx07rdQI6A3wL/iK6D6euaCkF2Y4clqg5WJsrXsWehh3fhfW58IZ/PJOfClR7kveivhIz
 aqjpMtTAdOxvGzjND5aA36z9OD0viRgSWMSUTYln+DwO76mSsTKnIq8Ix8Nam2mEXM5sU7q6s0b
 CoM60RpBs4mR4YFHwsgznbmPxxRSJnBMyuIOZfwg3S2esYjPl3LN89x5FzZb2Q0xhwfaCSDu5V6
 VMGvrD7Oxn55znW+VUw==
X-Proofpoint-ORIG-GUID: YZYcdnXRxPskZKZy7YBds9IuGKlnZ7ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

On Thu, Sep 10, 2026 at 12:26:21PM +0800, Yijie Yang wrote:
> Maili faces the same issue, and I have verified that they share the same
> fix. Please bundle the Maili binding changes into the next version of this
> patch series.
> 

Sure.

- 
-Mukesh Ojha
