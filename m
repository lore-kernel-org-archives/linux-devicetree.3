Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE43DDDCD
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085589; cv=none; b=qWVNIWlnQlczy4cyiPQb0sEI5CTcKOtsbXNLe6nnp4gE1QHf1H+MbVz5sBo6Erj/vqsqVnS15oePCapSNDWvuNHZDr0HgmcjyLJPrAUrw58u2qFzWVdHqDb44rNEAB5oxRQd73cZr89BFs4vKjXuFYROPkh0GHSYtP04JmfX1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085589; c=relaxed/simple;
	bh=jjz3Y+pL9ioG4LyZO0SNtKu6JxBaKciVZAOTIOeDNJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBjl6M9a/p/0wMcxDrIlIohTlQ5i9ZaoE2K1j7ByOUDwgTKbx7NeZdQHyr8ZuwpD0t6H+WyksY7M5hz0+TCrp6or9yI9Eayuc7nYHiRx/YH0oHjQ5BfArHCIJiD+Wc4CcsO4sZeFx2opQym2x+eQ5929JDNtNqRqdPsc+sXs3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM4wmrr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlntIq+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM4wmrr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlntIq+v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2Ah8q2444106
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=; b=GM4wmrr5/358OIyZ
	pBVTNkpy1Uqs1SIjv/+EsoaIwhurKA4f+YJNGOLjji/yc+WGYKzeZud3VJGIwVnJ
	3pkc3GbxCOx+SWrL14+UTCEdxtZYBGlHbKOmZU0BVqb7M6tQ44Xhf1rV1HgpgR7h
	YgBTDjR74qmG9x4bNBsepObGY/d/S4RNwhyenXGr9KvwL4lvp6gc4i5WK0mw2CZZ
	Af3ZE5++MS6cwikoj2Y5UYUHj6X70Z6RhIjIATRQ38RLYPRwShqbfvcEOlDCrL9h
	1CevsaXGoNtginyJ8yp2wAiGhGZ3yoJohnJw62SJp8IpmfRD4a8AAA6N3OU61+g+
	UyxA4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6vx5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:26:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso21298165ad.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779085584; x=1779690384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=;
        b=TlntIq+vFZnZwhLic5QYi0/dN2n5KoIgQaPBlBJIol7troxW5BRJJZoD/efwVFLTtG
         YzogtLb+WbM1UsYegPQ6HsNoq+KYmWd9fj2Q4oyJK1m2Q1WK/elsJZzv3Y90gpavA9CN
         DSwZ3fxEVbk2T4I3d/dKlcy2BChp/PCuPYTPbG9xDSVZiB35JxIgEKKWSEjcOg71OF2f
         Bt499hFI/PtKq7cFjyWVONxXCE+TO+WuHBgqUcXp+3gqhUKvX+opPex0GWghb7okWKd5
         w+83FEKn42G/FQFVGeCHYJ6hXaQENdQW4I/HTJdt4aCeooQ2tsdBYTxR6ahLekNY5tTa
         NxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779085584; x=1779690384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJx5ROeCjQxor4dcHhUL14+iMhM743IgRkZgfrNQ0Zw=;
        b=RF+GjOTD3kcRGBp9r9VkHHLskxWIp4ulTc4zyu4iQfd8rotqrP0yqFk5iNKlmshTP5
         viS7GAT2yDGmyqDOk+5MWHiM3tH1VA0lzOQJwy+ApaTBm6PMYAEoP6WOyyVd7MGEHozW
         uMaL4Cp7eTZtvOvxu0gFDUq56tlGdyyShAhDg7+n9uf4YLImLZwQv+rXCiJfqDfB/h3J
         44PWm5PbpEbba31ZD0Ncr8GL6uo4cPOiMlz1KvCbzj8mBjvRfzqqDp++LUUF3JHvxdHM
         avD6kbGAYEGjeQSr2V04zizyMNzuuroUsI9GxA+N3kGAUSL9vQ3OOSMdvt9hCsBfVeyj
         UF0A==
X-Forwarded-Encrypted: i=1; AFNElJ/cWlCLBvkmiP4HJFLj3A8exK2JM9yRMevHsLxwhnJFbNGvtT+Y5GZWRK+AnGJYcljZEHkSmLfKXYQt@vger.kernel.org
X-Gm-Message-State: AOJu0YxtehKuSwcjSi4/5+05gQZzyqt8mmHqvso6qpgXurDWWjhrcyJq
	iP5vW65aLALp/tTAHG2dZfT5n65ZwxJcShBx2pWHopEwrdW6hLt3UxZ7lVKA0HDgFKAanPMOYvZ
	kK3Da0m9C6F74QDLW7x/BRzc4UEY50cIKYG9UL62483BK7P8bjnO8I0gtGhXtjzF4
X-Gm-Gg: Acq92OEXEfDz3K1WL1Ch2UNQ+2JXyiS4QsegYm7QIUZ7vv+UaE5LEk6UM/GNeCWRa0R
	FxmzVnOopkKwPeCDvqNlT6APkBUXgvASqAXtNH8UsxfwetQjpzou0WOLjOSBuWUt32iYoTSOLfy
	PkR9+tQjSTe4vcpsMvaNp+GluNj7IoPMgQYJYfWpmRRsJoTGcPRmWqYH+TONKKfb2Dv7dWhVC0R
	BK7akAKeChb7511+lPWiyU8a3zPTecsOPA1dZyvM/SCCegL+MJKWz+jD+sVbY1+Y3N7OF+kSkJ8
	s3MMagku/kLPqIxvZev2ApiJIFyJSDTyfHKwzCDUu6qwFNxFcAL+F1ZezmOGGf6GQFNcTvt18Py
	v3h7Pnmdh6BGHhPCAC7RgV8myUz7h62nj4JmwtktVLjeZd/bL9uU=
X-Received: by 2002:a17:903:2b03:b0:2bd:9da9:a29b with SMTP id d9443c01a7336-2bd9da9a3a9mr100296775ad.5.1779085584211;
        Sun, 17 May 2026 23:26:24 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2bd:9da9:a29b with SMTP id d9443c01a7336-2bd9da9a3a9mr100296565ad.5.1779085583727;
        Sun, 17 May 2026 23:26:23 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fbc05sm134371195ad.57.2026.05.17.23.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:26:23 -0700 (PDT)
Message-ID: <d68ea0df-f275-4b9f-9fc2-154d76517135@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:56:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM
 v2.0.0 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
 <20260514-knp_qce-v2-1-890e3372eef8@oss.qualcomm.com>
 <20260515-prompt-determined-ape-943cdb@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260515-prompt-determined-ape-943cdb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RacBSmnNXGXBwBNF22Fi3YxihtH__dut
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0ab110 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P5E9getwEY79pbPPo3QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: RacBSmnNXGXBwBNF22Fi3YxihtH__dut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1OSBTYWx0ZWRfXx2X64U4e9Byl
 +MoYVZYYSZj4HmbS8tILFdRaDRzrDfYGu6G3NMpkF/C4seml634irRnOjnP81a9s/UYrVYnIsYv
 d6VdEvo40/C+PtIorcbx7godi+tuzccCxcbLl3cgK5v9dEuYeIJx7+sI0/iU63VqeBXZF36slAD
 +sxoQ9LwZpc4pPWJbBMRCCoxYQx0s1N8DfR1UyMZyx8uXqhQ/fjAJ7XQnKEiEMctzHVOxHfZteM
 NR/Bz+1fMubT8hC0hzU9B0tBddDsgN6R2AVJYE4UCihjb7FuJWOmzRsKRKhzHh+liiefVMkCFA0
 Ak8wRHvsb5YvZnqnwBnBubR0RCgMMUbsDgu/XOMzKCryvFe3baJsuZSoruaQ2zcgDhqabNdvipW
 KzekLzlq/oG7ynB4DX5U4dysQjFhn3wH3N5nj/Z/H4GmZ1gYqqweH6mPdgURHlJwUS6LereMxdC
 2XdWB/k6veDW5dTLncw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180059

On 15-05-2026 12:23, Krzysztof Kozlowski wrote:
> On Thu, May 14, 2026 at 12:22:20AM +0530, Kuldeep Singh wrote:
>> Document compatible string for bam v2.0.0 version found on kaanapali.
>> BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
>> layout and offsets, requiring a distinct compatible for correct hardware
>> description.
>>
>> Also add a new example for BAM v2.0.0 to illustrate a more complete
>> configuration than the existing v1.4 example. The new example covers
>> 64-bit address and size cells, IOMMU bindings and execution
>> environment–related properties required on newer platforms.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> I am not going to repeat my comments.

Hi Krzysztof,
As per last discussion,
https://lore.kernel.org/linux-arm-msm/2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org/

Intention was to improve commit message on showcasing v2.0.0 diff with
existing v1.7.X versions and also what extra the new example is
covering. I hope i mentioned it clearly in v2 commit message.

May i know what extra information you are looking?
This helps in aligning ourself and incorporate all relevant feedback.
-- 
Regards
Kuldeep

