Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B8549371
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092873; cv=none; b=EKELCeyGohwMUCge/Omwa9cY3F4wlDbPvZfgCZPk7bU9vtWERE5XDjfWuixbEo7yqMret+IVknlzdAbXmLaJQquYhVNZ9XSi6ZGX5Y9n5Gv3s3WgMonZAQdLW5YYRCsUrWyzIKHuYe1dRCQnIeiBF5tmD/8auPMNaTZeDBc2UVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092873; c=relaxed/simple;
	bh=LHDUfK5CwJ8lI9grWRG7EQmwkF5ujcavl1cQEzZTRu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLwnSLU/XEk0P3CDZ+GZ9cmdb2CJcx0hjwAfMqsl0lf8cUIHNfZaHg5NWpKaIDobmbPlk1a9LyLZ87M5dTSUp2kvPZtD78wsujpd0OlJOwGUA2aIDYt9Yzkt/1W7EGrvK+KaJGG8AcQqZ1YwMUlA+HGTu+bCAW0VA2F5ADKWlfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+P9tur5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6OSGLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+P9tur5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6OSGLK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjOwm3307624
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=; b=g+P9tur5DcPeVXU1
	J/qxk7tS6vpW+LpaqIZgoV6OsWFqu+2NxYqnnsdLI6mW1cx3VKGG8SJm/0uF/RaH
	G/mGn++EQ+U2oA/9gnjpqjPM9jofVKRzAJDrqv8zmIdrTOjPlyhGk6ekhX9LvCDk
	Nw++VREeVpC3cEE9TUQLGN4XSN9d3svo2dJa7BamXRPvlqR3cEoz3qRe3qj/O3YB
	EZJEe7OUMobU9lEtDtnaOnnawZn74eHElJVtfa3GsJPnQE5rvo/WDHFuq2OyHOoN
	n3zAINhb+kxqhATK3AZHWtPqABhUM8wi9evV8ji9wA1reYgNB6FnilvZvO9la+IH
	7S54ZA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1130nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-451b3cca625so8483fac.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=OJ6OSGLKwgmrR2609CwYN85dvPyrBkAkKq5UlIw7ElQyg1/uLkAA4FJi6JP4tvZZ8z
         Pmw4w8woSA1ndcmkkXDsBv2A3FIxcLMtqvw978yLh1TWB2RBiVFOBNJBxY86kcgog7Ge
         Jk2Dx0ocRIGiRLQyPnzfMFxYDd1fWznWxmPajlvO1MACxxe1YDegvqMtl3dLMtUxRJl+
         05CHKk7Vi2p8WVGz/Nw/xb6bfUbUnpy9An8n2vkXDSFr0HqAuza0aFu8GJPy53MFDRtE
         xTkNq03RrF151CLvZMysh23W8iYoBKvy1qh9mAuFstftQOnc8DN1n9HfMS/FOD6ZZ37A
         S5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=rvN7R+G2Boq3Gf7PhUDI55l7iHb2rUayMgkwY4be/0Ppm0eSfbLyZUdkLqBQ27lTbA
         mSA//+bVqijyXd/rfbj6Zns2WSfvO9i32bwhOjzU3vWFdbQu2DixtCjsOSo7mLIURbjD
         +2kY0lF6rWy4P63X0wYoCLlgFFJe49SILCUFC4ibweE3Z2Nd3wQhjdEhS9YLkc4Gw5tE
         SgwpsCxmZDn32BM652if3MljmFUFV1eguWVQDaWazdNylY0DGHdjUYvPHljiEroJeYTL
         ZdSYDTYqZu/6vUxGyXWx0U9v90UyxVBEUVJpMn0O8de/qkC0L9SU9dzVLmYtDBKee/2Q
         Om3g==
X-Forwarded-Encrypted: i=1; AKwUvBzvqmrOQDZ9qzpRpTgaM9w2j0+2EIAGfTdE486cO+JLjQnLsu31cZ9x2L4qKYCkKO9qo9GsLEmVRa4p@vger.kernel.org
X-Gm-Message-State: AFuF++k/uZ2dsgwMyH5iX8d+s6nHQGYD8ZVWorQ3l1qjd+i035dgZm+V
	bQHyKeEE1+Fu6aGjC+0z86kFekLFvVbcGAWbQ7siPsw+vJsPW8mN5PfP80g7dxTKsYs6P3SqP48
	yqOrksD5BLcKL6iFhfMivok3EPPvR4CELMD8P+JN1yVUPxOpyhgAHRZmNXIiojtcX
X-Gm-Gg: AYBFou3w/Ay611elQ4t+23QcbwpIoZyVA9pogl027Sw7nzrkXoQQ55fW3hCYoOCbhNw
	EpC2K91E9JmIWRDi6QP0nmgXoE+ar+BjvwJVph38/BAfdLWXUz6+wGY8jKt2G7+rjR63ebmiqVs
	gQ6bh+LnElgN/qIhgxIdnsIgDAiWiln42BQiYDz3jN0c0dcZiHUGCGXNPv2/ZYt49EGPGkw+J8G
	iG1LhmlnIExzUJzDPhSOiT15Ac70bh1k5hdZdV4NX4BwPcfNSiYRlkcHtIxSVwuiXrLVU8fXowa
	DQeOwSCPiDin0OH2BNc6K3nJ6C6ZmQg+AkrrUlKrBVgRt9SMia/rAWRRp29IJaIkc+pUeulIfsG
	dfnaXdMct/1zfq+HeSkNxlQ==
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165044eaf.2.1790092866700;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165001eaf.2.1790092866108;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c430a09sm110972866b.5.2026.09.22.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:05 -0700 (PDT)
Message-ID: <03f5dc64-c631-41c1-9ab3-d28a867aadb2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:01:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: shikra: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kbwSVby2wy7SBoBIm5BBDPqamftE0KqK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX4SnaamrzFTRm
 mxNm2m5ZVXyhUp371nrxldXd+GGQCORkVgnNwDXANjWYhPdb1MOpKNpAEV2TdO7GncknMxsvRXD
 gc5KTnP/F+mU/RfIy6DF3L8we8YVJm0=
X-Proofpoint-ORIG-GUID: kbwSVby2wy7SBoBIm5BBDPqamftE0KqK
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r52As28OqXcKNvlaLHgA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX6AINcydSEK5c
 7Bn8tQfIQQEqkk75CNjHfmAHBJRybCHq568e2FcdzA42RZKTJlQs8OVHYY3FvoaHFD8qLytoLcj
 WwszxB7Ts95zCyUQK518Na6oPweRBR4mY9CkMjt/oKveUyrvm9zIrjh1kmWg6VWF/ShYjyqkuFv
 1Cm+XBaLkKctAnSs+868i+7oilMYQiOqN7rd1WCiPWfvagtYSCVstRK3pH5uvQmC6Yz13GleCMV
 LJcdEbsC4sqkkMLzxP7cLxd21F1ArOz4L5OaUD/itI7pSCKgwlHwF7fckOu8WTFRRWTUDcKwkE6
 CqNj2fzq2oQLiw/uZCzIWV/Ihi8RN/scr77UHyASpJMV+a22ZVyih90Ja3Kq1OgXzVDs/gRnJmc
 LX0lmTQGH5UAwaxFfDw0epbYjAFskg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add GPR (Generic Packet Router) node along with APM (Audio Process
> Manager) and PRM (Proxy Resource Manager) audio services.
> 
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
