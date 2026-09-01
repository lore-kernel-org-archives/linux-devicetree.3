Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0835E926
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251677; cv=none; b=KAW7Xt0GWwpKxqCEzD24hSu2EAnvD9BRELLdHlavYxHiVY+pUqw1uDhz3i2ogG26eYHHYUqa3/ToZQtzLx/D+SZ5qoQQmHW/4n1ZgJCQpiJikQQMIiMxv5FTnbJY/BsuDvbYAaijxQ/rPdar0uVD4XsafA9BrJRKb54Xbw7VitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251677; c=relaxed/simple;
	bh=+2D/ucg0xsdoUCrlgOH62aNlq5NomRTOZrwN7SeHwgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbMNnCZAeinwYj9+Rlv7SVrCALwIBg+TEeYDrj8CRVr/vVF/LmouOD3GVSNSTGr1FRFhiH2ECqqzz/0JmmVb/NgfclwbTcb1rFO/zwpisgkr8ZeCsrbWeRD1BJdJrTB5H3yKDzN+41Qvvv1LnSsNJzecpepl5VwjFNHaAji9y28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E77LP+lI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWYfa0RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E77LP+lI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWYfa0RH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CO42061528
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=; b=E77LP+lIGiO9Nxcv
	jY9dmnpHRg5VHoBBHUjxhZxQikjYXwC/sn/0SzMWYRW+xKtmm/U0r/S3obz6UAkJ
	i6BrzJRWiEDmjSZj7wdZANuwEnSz/ZbF2sHrC15NohXSGumSMxBkf3sow0ZCj/nH
	q1x/4Bkez10x/Cr8HGoNkKT0NNqAWo7AuIhyx3bnRjGddBOrHMj58m/z9pObZakI
	4e9dIN9JE/JR5lfPfSif2tISJuxZoHIj4myu0Ii0VbtkKxKb/5Ubhyh313Agsc3U
	IbjmzFCEpkUXWHxL/iKOJ634WCJ/C7WugpK0LxA0qQC2FIqDmlKmZ4sD5tgQDPgH
	5prxCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh12r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:34:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so116330285a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788251675; x=1788856475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=DWYfa0RHjccGdOSmmLwmqHt5fEqcnOx4cPR1OF1JHJw367NHjNdMM/EReWXDJVaQZe
         71xOQnNWck3fTF/tbWefZvj0e08jCWh4bJ3+Zw6IAhAl+EVNkkVRqiFk4wLMgih+cMXo
         /aBgUrdLYEDJg7TMPWAmoeKzOtoD/sc5ATrVt/uEBykgQbllEwu/Egn5hU4cZlO9l0L/
         JlUNL+60F52JemQLZbOjQ7M0gC9SsxDm55k7CR9/zhJNGLLKDBasrk7wu5yNYjihYuhU
         R3/pSfXeYpqEODfsOfqSZf6u7cr2ybWqke3rflN1ewvIPQgEHU353IMoK4iu9i+73ejh
         ki6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251675; x=1788856475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=lOyER/90aMJJx1gvAkx+Nna2294J82PkI7ZUk4S50TCkmMY67n1lwvI2GvYX3d83nB
         RjKCuQdg8qXpU6KifvHKblC7vOVLP0SlWhLI4ICQIeoZ0m40W0EqMj79zm/Rnnw7kcOS
         6hrcq98NUDTHoI83DJagciFSdAIuFg00O9Y/6ajU2koO1zbDsraXRanHbSxk0Ldys6hO
         Rzi7LSY6q0GNx8o0mTk5xQIjdNgicJAg2aDtbpRybkDTyTTSruR65w28WcyM1d5HkEhQ
         Et7GeSc36JCo1Dxl2gKGcnGGrCs0o5obuZyaAiP2SbYNyWwqro6nEWGFL7hCAWVKS4bc
         evRA==
X-Gm-Message-State: AFuF++nDHeQHAuirn321BoNgjRItDOg8OySF039BRx+DVn23NoBYbdmp
	DrT9Z1LGP+D/PuPD8aXOE4QGkQEpsCxw+0uxiz0n7ip1LhXs1rEsXzwn9BaGmaJ7TDA2sTNmyxh
	EW2i6tvIOH6fusuqBIhPXzYWqFLXSOP59sOTJIoQPWRVnRQvLmQAOL6r+32zP3TMRccmAEXTq
X-Gm-Gg: AR+sD12fQI1tv/cU/H1sOVurIa7WLtktYhBp0W0Y6KkLRBqYmWvG5YB/ri909CQyhzz
	egjDYyVcShGkWZUTvecYLPen6spv8kGrSjwSXeatco5U+BB0i84vQKEgFHXPNUQ5vxeljPA+8WM
	8gF6n6HZME3vm7eE82si6/LPcVNp4KJgtoDzr06onGkMP+xqBgi4snNmCC+xr6Qr+iPuJ9pZ6kK
	0YpPPN4tscCr2ONH70aZWch0Gek6U48yf9LSY7F7ff6/SV7K6ImuoBvee5GVluHJPP1M0IloicK
	3Xe0Lnz2m388szjnXjO/RpTk/DX0FUxIyzN9oigovh+7txl/KctvayCbP2hh4Hv3GVFVb1YdmFS
	bqriIaZ8m8wWdGv4J0T+4Ng==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426951085a.4.1788251674677;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426949785a.4.1788251674233;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b23esm525247466b.2.2026.09.01.01.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:34:33 -0700 (PDT)
Message-ID: <1019ed3d-cc30-40e6-b82a-940144a97e91@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:34:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX2aYeo7nGqAaM
 IdXaEfH4Eco16KeDReEp6cHAxZx9nCzWbr1VJ0eH/BMvgXHeCputtEuLSg2e5v4UH0o+It6vbT8
 Rx053w2u3JaBf/AYdvUgvMw3iQPI6zc=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a968e1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yxBm9irkQl15ksekz78A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: P5NSByz46G3GHb_jcBGKf3I2ifznEXTo
X-Proofpoint-ORIG-GUID: P5NSByz46G3GHb_jcBGKf3I2ifznEXTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX0XphbAFa10OX
 E9vaaofhXun4wsPOmI2HizxS9U6pNb27VBy/6QQo5Hcx/m0bjlMEvahjnVnX5LOZqQvi3NSu9SL
 qwGEgvXAFW9qmIIxjLwWRm0umeeFHWifsbT8uryfvYm6xjCKA4CULs/ih7Dzkfu2QZLiR9VVo4E
 t8PLuXuU3TSF3LplFMXYPxdAPRekB/OLal2PWpItitlB8XpkLfkrs1wjMF3J7kSTRoD+m5w6Hf1
 ng8CbPorHWfhXUlXrVGheLdAp2BAlgtYDFcHWXsT1wqvk6EfrTYk8sG24xpT3m6Hgpvw4WX4ZLh
 cB5Dj30eu3egx/LxYaQZGcVyN4ulQxylkA+r6juP/aP+YnZLX3aXLKZTXuzUiEk/1hw6zMjA5pj
 4k6qQTzZem0h45JwX5HuHTeAJERsAqwOGyxCCHyqkpaRYhiwMR3ipWKLcokh8RD+OP9L7nJOx37
 L3vAPZlSj4Mpcn04XYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010075

On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Rob, can you pick this one up?

Konrad
