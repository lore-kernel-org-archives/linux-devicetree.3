Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F833F1678
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815388; cv=none; b=O5M1y4RRwFXhDSXOanTHxvy4iU0xBW3Ke5GCuc+FSxOp/ILdT15MBmuIh5IraQ6alSzlEwgyOImfDy2afqIMO8EiIg9zs5zLzIP/EEyE/M8lASVPlaDI3PUonsSKCbz8MIibtmdxmwCeNfpfukgr3XZU5/fquSnrtW47Ttegmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815388; c=relaxed/simple;
	bh=JHWRXvwmSeTOmbwGnLOsuT0Bx2T1EIUFvdkZow20AXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+rcMRCB4x4odAXs5XKHR7nQAL8uZI0+55pkypJg+9wHc82euna+QvDR6AAxO9fjI9XIO9yiu3kucEsOHO40MINYZIUriqMdhpEjzKQlasTqThNrmXEZf3iAGzJKf4dylprjO2f0sSqkHzXHAJBc6/4S5D9p7ODyJ9QOVvdedoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrReYOPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zuln/Mx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrReYOPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zuln/Mx/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4uB1508630
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=; b=CrReYOPOizaRMOtQ
	aaHmDGF0s0/RPlzrp4zoq8ksqDyRDmskSlWiB7j1akzgtsgtLtd4aOhJB2PnsM+K
	XaNEj4F3yzchJPArzkdQSaJ2K2V+OOtN28I8b06QZD4jJDPuVngd0D3oyd+Vf1NM
	qiiPsQNIG1rl7PLQg4rAtiB5sDE8mBeX4h5hjO4YLJvuu0dn48aY8FErNNAB6Gf8
	IHV+A0umSFg7LhYMeYj/utpRVfTaxnHxY2sqmJuhcmL50rZOGO1DB4Vu+3/4dW2p
	+KfoiyP1oMbvXVaynBHqB+RIK3qVVpFlcsXF62stwrJ/0+jfZIULFirYHwHCnfbd
	MNLU1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j300h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a89451078so4326961cf.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815385; x=1783420185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=;
        b=Zuln/Mx/44nfNqD/0SZh4vliqIJ5GS464FYKrxq7W/bKjBJfcsWaOi96xOIDf0btlD
         5BFddG6757/t0Cfa/qhGWjHov7U65FxXs21FmIBUZcNz6P41iPOyoTm/f9kzGhZTJT7y
         QdZ9KMTCK/TOpNvQ9I2cdc4wbOp1rD0R5a4nYL1z3fnOxVEy9PrbqvZr5wlQNH1CVM4Q
         dwd+Hgza/QGSeypdAAoo1L7j36uqNwOfGEZq/JFiiz2sMBUsqGjf7/KQEwHlypuypOD/
         8rvkzpuB4WHkhRUTcQzTyR6kfgiJAniT/EHLoETH4GMzNCs/WiPLf5tVrfuwlLjLBcYH
         5rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815385; x=1783420185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=;
        b=BaD1avWBL4O33PP79Xv2wh/vLr+SpswbX/bCNZqBrRzogGINwBEEqibvdbzObfllpQ
         KFw+hRVFLAMJh+aSW9RaM+TQmAnHRSq02DE09ZjRB4Z4x807wu9X71e2suoCh4ktSxNK
         mACRu5W8c6VaKIkHcQE6/hZwtpk4IygsyuzEm9NjqwsXt7hUPvBC/fl0xLf+nFqODXWm
         o4V8TMh6vWNdl1eMOaWpggFa4okFf4VCMWwkTjv59ZHJBNG161GTcHD8mbrsgAggywIH
         t272RAXtqaHwNXeUqHXXSmw2DHAgEod1OOGcD9J84EsOaZwFRlNcNDwj2OcXTBwDFtIs
         BtlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MD6wtEvYnDFEFbd+gEu+YHowwPkHcTLYOoqtpAiSZpu0XATqwQYvfDseRWpAktd96zaYzfYnDp3HN@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBujvbH7sjNJdX9wOv+aTE752n98Y6i2mIc1nMVOKIJ3I+jT9
	HDPlac1QdPpPkDvZcykzR4dvJvS3+9fomgECpcSUz6tigh1MdNjDPVLWmq3CJQzHRNa9vzk7D+M
	nW9ubei3gls8mQVlfWfLj0qefTeK/N3lxnzrwhFBaUNVL/ewKvmimAO6APmWJOJd3
X-Gm-Gg: AfdE7cmYawqXeEaYPw006rmUDxy7c3sThzQSBqyIa9FntVNqXT96aTAtG1imaaR4i7S
	BRSIauIKWJCPXsiZ4HY8ovYALvpsk2Dw4GbWPtGd67UdHjeg2VkRXj09LJW1xtvffTb2Y07eUrG
	GZS4mfA6tyqL2pqhwptciGzJgKdqNeHXmqgJmm+hv3LR4Ll39jDaGmrY9Nh8UIrTIZtwq4BN/kr
	ju2aEZUJSh/t9F1QvBIV1ZxsME/O1bt3BqdvewrN5EQYDopClH21NILs8Udk1pmBmVWOfdL57TL
	ILkGEPs6L8v+gBL/PCfw9o/y3TlSQI0Ln+1Olxw9PUYETcAuJXFidQWX3gOmfaT2gASnnpLb+Oj
	UC/vJQoiSKWq51FL7MSaZ03Ln3KUuGyPQaZo=
X-Received: by 2002:a05:622a:44a:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c109079a0mr27106271cf.9.1782815385337;
        Tue, 30 Jun 2026 03:29:45 -0700 (PDT)
X-Received: by 2002:a05:622a:44a:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c109079a0mr27106041cf.9.1782815384782;
        Tue, 30 Jun 2026 03:29:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4d90esm100637466b.45.2026.06.30.03.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:29:44 -0700 (PDT)
Message-ID: <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:29:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 507ggQWYiN8M-DSvOOTDOLNVwemeqCwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX4icHO8D5zcUl
 allg5H7Cp1L3ZrWVuM9QqKIvpnYwNrZwojzPCdJJ4J7KCi9dAUEvqNA1prH8dmbXbIjwLfqkGBb
 G6apbUtVfblmFwfRVbBhYZSUzAXpuuCyeB1vi8gOtivvFSJobyL1/mmmfyIDWof+GVXZyDXmLUF
 FOH5M+9rOD5PvTpRPaDxPHiPtUySJYskG5coBFcDqFANTwgMfgoeMyxrc7KejQVmu6mVWsIXDjC
 xrPUg9ju4+Gnf3Yb1Xyl5X/kfB3eHpe/QjIJ4zeHENyzsj7R35ia+BwwEqdD83PRqQsKq68lI0c
 sJeK7xiFLjtGmKws1603DFgtQx3kBWTQsfLG4De5C788DU14Tgsloo72r0nnCJsEFVN5veQEgSQ
 TfEEmf/9EzlpcyedOnGKxsLMqoihKBzPopWfVU044Qv9Bdj4RQoBZ9+MCSW/J+hYmRmAc9nY7YD
 0hyWCivgpahY5qu0Urw==
X-Proofpoint-GUID: 507ggQWYiN8M-DSvOOTDOLNVwemeqCwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX0obUKcfqpOrB
 w8I4DSUR5YMWU0rYdg3SrMVgPnOgpAT17QXlWbc/mtQz6ffSnfKZAynCQpvFQR9hfnxs2biRc6I
 FRnQKicpoy6qnJpnzmNg9vTfzdn3rXU=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a439a9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K0VU_phB8ntNZSznENYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

On 6/30/26 11:28 AM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>> DSI panel driver have been added for a while, so add the DT node to
>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>> describes the wrong, no impact after manual disabling these wrong
>>> supplies.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&mdss0_dsi0 {
>>> +     /* real vdda is unknown */
>>> +
>>
>> L3B: DSI core 1.2 V (both?)
>> L6B: DSI0/1 PLL and core 0.9 V
>>
> 
> Yes, that is what I saw in the DSDT, however, I can disable them
> safely (hack the regulator driver to add a sysfs to handle these
> regulators), the panel works well.

L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
ends up being on), UFSPHY and USB1_PHY

L6B additionally powers the same components, minus refgen and USB

Konrad
