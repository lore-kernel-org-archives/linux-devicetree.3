Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570018;
	b=x8mvpMqCv+tL66s9lrJ8LaKfN6mmJT9HXfVCdAsnJJugVoqFj6mfpEYQ/iu5JhG20yCM
	 dHCsPECrlcdna3m+kmlC2XL3b04BNuTudnnmAdrs4G3oNegRS5/8/DnQHEObEOswmgZtc
	 jx8XFLeanO9TVPPuk/1I6rq4isR8xR8ZLmsYMYbmUoaXZ0NR1jh/C3JIN29fx6MhbxXUV
	 nSa5ZJ9ikW9lyWMFBAKTvi8+f0ZdASomY0eQn5PxQrmROyG0HD3GzwdPa8GOto+N4cgpz
	 Hbko6b5E43Dt9Rgqk2wAarH3oW65v9gLTBcuLrJL+uFX/ckHMg+pHtiiZyC+Z8sZE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
	b=00kTxLAdiyriE5ClUsp9wIQQKQSy8wX13YehdnapaJcjL6Av3ti66LngjlIb2SA0Il57
	 1Wh/ZWk+HdqyfOzHx5TG+HR1ec18aYIv0UPwP3VmZlh5zk/+184EoUPBzwwS08fV3/UXh
	 ADgfkkmjzMhMuYpElulUntTMRfg1k2xgwP5GyVv0a5lLslBEw0oYYVv0RYpfXlBFSXTBn
	 gIhgOpQr32FOEq8nAfu5BurHop36NmYpAjc0/8FY5MhnOPhgt/e0kUhKBktQ1Tcq8Y0KJ
	 Lxq1Dc+wLgdNIH384Rae6C3lVuUNBQ1sK/hRiD15wSkE7qFahhN2n/eFLX7TwFygQYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0qy86Zo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMIPiXX8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A2606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0qy86Zo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMIPiXX8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j06d756361
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=; b=X0qy86Zoug7WeEMf
	4iM7kVEBU81ejOppNBw2waNYs/4WQUFQbQ7s2V/gxbKeIBy5A/HKdeQ4DFnZYlF1
	K9/7H0PHrMWCpg//Zr5Ds0bufO/dtrygCglP2VsPbz5psJ9JZelWTJiwoTjKuGwS
	D0Lkb4umD8arhZSj0PH9nTTSpLRrvIK5ylxcI8ElXwmMAPwdKy3TCjW/UVECNZJ5
	UQhicYC7RIh3MIKC/+CNmBExLc5ZIpQTpdO+DKwbB5Nqbtb0RPW5IWCCQdAfI+eD
	VpMulglUDcVMKL7rCyfguzLMgVVPRz0PConfw2nGXKHK9mp/Q8vPr8nL0KEhttAH
	MK1ZGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tpjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:06:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so12763785a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792570016; x=1793174816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=BMIPiXX86CeD55SJLorAcaQ6hdHNiIOGU2gc6SLXrgM7NGYzpjzt5tbpE4IHsbEi5c
         ozkwxu5SCSHEe8wTshsf6lEStrHVLRCknR/9erpNtT3oIXD2K+wcApcet/iIgylCg2ri
         2auDR1YwDBxDmE9HcoQ0qDcH1wW6VYTIe0oGC9Pwya2E3dZQzbUnSz9ATZh3ErhKfyJI
         6FJVSS2C96y33ZRH/hUnCa8D3Hpa5WUxkOfwf3uvoxvf/3BwxXUoty1VHbCkmdvZULjA
         G/vObc2A6vGOyDEdysNG5oaxhIwVNsQNcVs5nOJ0LVlR+2kXyjKKNJEM6OCJYugLHVQx
         BQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570016; x=1793174816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=b+Loju3pb6F+CeQv8dzFGlF9AEIJneUFOWAfoGm0TUCGFQLfcBWdyKXUn82j6Gj/9w
         D4QfGugdZeVxqXZ7Fg4eXuax/0RuCdoDgx11kqMnNVTgcpn+ln1KxgqziC5p0qgyWIDx
         ZW+l9svUMiBGX1JxXNoLiFAVzBojEhJj/dXxzR83UeRoMPS/kzBoK6udys/3RNZkKS2R
         UUBQio/xtky9PMy3W0jp05v0PtJSeHVB1+bu+LeWh7eGzswETODdPoVIAtMT21RlxPad
         mxhRaOf0Sr31b3gnNN5DGxlQTPiTx+sDnrvYCV21cSr/ceyyiK2ZlXB7RR9YHooQRciZ
         JvNg==
X-Gm-Message-State: AFq9FYKKg2gW71PNRLZaeepayok/YkEhVUOrny3lsGNW/42Lod14AYBO
	j0o18KHEc3EgukjadJ7K5Ok9d2dulnrSTkeZHhs8krM+SNov10xZjHx+izyvSVHhmd6U9C50G5Y
	XoCXQWrbwmVM2GcS+N/kMcObn0aF6lxOedftLGXo4ER+lke3rp0IbHz/vYw9BR2c2
X-Gm-Gg: AYBFou3C3+/JQhsSOxEzgO1+J3cFAe5DEBQgmOpiwXgC/R5w+vI0I1bOdFm10Eb7fSV
	hlqKv48V+ELCsyPeK9JnVPHUbMiqTbUWWPdjTBWAMLn/lx0jAtYVonMDtgBBEJHOQd9z2b9pFi4
	Cj7TE822di42bIsW9L0lJhRhiYUrlPca8zClE8zjiuHcg8jurmRWOr7E8swhgPBF9elvutAmN4y
	Wdqp3y3V/5fEUPZdY4y0sV796g9jtuy9dqrVrwlk23rSKfp4jjciKpYQ9X0W9VRNnsrzcmgeGLo
	1V5X5Y0UcS+AMgf8eUZf0NR6VjwLi+hvxJQGRDS1iQUPsM+58/pvrbwMbdAReUBPNLml83/eRhi
	uc2JT3LwswoXGASAjKuAJbg==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr350769085a.1.1792570016554;
        Wed, 21 Oct 2026 01:06:56 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr350767285a.1.1792570016222;
        Wed, 21 Oct 2026 01:06:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037aafsm50051466b.86.2026.10.21.01.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:55 -0700 (PDT)
Message-ID: <f3a88d95-b6ad-4ac8-8e09-e89338559760@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:06:53 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O0Pk4ml9uagVZWwc51PNS2TY_HZkbrGH
X-Proofpoint-GUID: O0Pk4ml9uagVZWwc51PNS2TY_HZkbrGH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX9U2vEHgBpMx6
 RpfGu1wQVCHOdYHYV8ZF7sx8yQUJUlEilCF7yhNwWoQmPS4DcIzzkgZEsPph0svveNa3JhOqCf9
 /Tmz5pAjNg9vTtmpxf82UeQ8YwxcmPg=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad872a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=V2dyZ2dXe6VeIo8NBxQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX8p30jH6Tzev6
 bIq2PKNCV18dQVEV6jB/PbRV/feRRdI2PGZ1cbtdH4njRGOpgxmwHBYdlHJn6OhXmkCtSjGQWgd
 6wHVh+2K6p4OIFkgXhTgnxaFbsDRf3l7IDSFvH7p2EvDYCiHBVajT93F/UxaTzz29BYCOzemSYE
 MyJvSjNNgalNeVbzT/APxjAcoBAf/qR9NAlORg+8vH7svujq/quzGppqLIxqKUblFOL4RnVeGhi
 lB77jW/1gbqc26DL+zBuLiettAIjg1Is666VT2rEHpp98cKh9DJNO2puT2W77nSSJiEXi157NDy
 J8CFBPtapCfcZc4Qxwf/xDxpaLFnfJaOKNbQYxNhV7sybzKUDd47CAcyz4K5AiSQZVfIo0r7RIN
 K1FOW/hVIRMIHc5mVg8BpPQtLsMOp1DTO7WGwq8/Xi/NJhCZ6ioOvZCv6JUD3SDWDnclq5liMor
 88y6qhzQXKkHKPy285Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/19/26 6:46 PM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> To achieve this, add the IMEM node. The overall IMEM region is 32KB but
> only initial 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
