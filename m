Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5113B42F1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419097; cv=none; b=QHKI/tdStq7oSDq/Ld8X0IkWQEU2lxQ6IeDRq38+XTJPDBJAA9KiqmwrlJQSDbGqvx5UcTionF8ZB0sVspfHmnEVWjj+sPHsNurvyqfdFFV9Oxxd21II72ToQkOtYg73AW9lKUVZ3e+xAep4Cc2ZqjKaYlJFMtSg65Pmr5Be53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419097; c=relaxed/simple;
	bh=6JL0HqvAqJn5maYjK3rA8vUw308VmjsNmU3ovua3Tc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rx4gMeBFICJPp3LkgJ1PuXmGppjPJFIkZ4IqW3Uo94GNGtDUj9kjs8Qc6ott2TtEFLW4/IVVwCp2k9iNEN8Vvn8PaOxky6iAch+XoJrM9MgcrAw196n6aLXOl2LumyB4y4eY0L/AlBkSfdHX7kpZOiB9+tWliWt2GSLkiA4PMZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtLPpa06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDQ20tkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtLPpa06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDQ20tkg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwmZ3070356
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=; b=KtLPpa06A5oo1t+L
	eIxFsHCf32opPqLCXZ3MLd5TpCSXBESUAPmbNluLiTU4CMxqbcJGrN6bAEKcGdmn
	GjOAcKt9lw7SNU5ZOUXAoal7+6epI/zKB3oMle6sdVJa1tb8AEsHoDy0wd1QNFYK
	35vwY5MD+AOIjHaP7LCrWoOVqtuFPrZ2R/kFUnjn2iA7vWmju94VCIjfm/Ago+dc
	M92fqp3S1SLaiUKma26iXOkhdQIP5TYZDqWDy9fzgiQ1qE15QnbBu4xcRxRHZw4S
	axlMOExk19kn68ctfOjN7OSa782NNQ/ipjAeies8cuYGur9Knk8CMT4iNYU2RepB
	0NMZjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8heyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:11:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf9df2eabso3777431cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419093; x=1784023893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=;
        b=HDQ20tkgAyGKVTLI2l5VIE5KvmiQAL9IhwI2MTdi3/DyXGZGbFixggsgUdhK8cQ8JM
         oQpyGOUZWxcYCKLb9apqaKg6OD95uizquBq1AmrHZK8Pju0IjXMDIdbo2OREDm5MSWMJ
         3JjBmKwiem+ANrfL8sXMmP58v5cXYTWXPkI5IJN9SIFFyGYdJWkDG8pi0MDlS7rhWIX8
         suGxZRLjW6jQH0cWQTXFQfTAoGUMvyvy6jhgGSNbLlOAOgDyNffn4VL2Z2bOViof2dpm
         LfBrFXHiaT7p/VjisW8U7ZwppiiMFPs2VCsMvJrgFEbNMN/n6+Egv1xpGAgnJP7GSInY
         0LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419093; x=1784023893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=;
        b=tBgA1cgAHpackU6PES8hsTBcIaRbtuJpqcHP6zsMAhAvfCdiwrKS2kEyLysF/Duujk
         LAvnUPvGBBLdIGcO1/9Pv3yP2pSnelO3cSDnvAhStTdkHoqlhRicijSlAzSat4UxgZfR
         IaaI5/NLUrQTp3HJ8WzXXjPkfzAOIhZ4kJDNTmRMibnbp2sE/ns4nXU67OBgKO/EKpsO
         KyKYQaYcYtkxcljxHgMbiCqcdMEWB0DjJWbAbiqPGBpPFbIRwrwSm8x3f3EgmkNGFu0J
         EB6mi30xqGoqtXIAPOIDfphoTnV3hoRV+n7JcEpg8X/65wpQnvMtMzM8XxVoSH0LSVYa
         MtJw==
X-Forwarded-Encrypted: i=1; AHgh+RriPPp4mWTi7RYhoYqogBN4ZVsrjOR3gBUz8mcbvGBh2VjNxbDKH7ArmTZHSZ7crID+zeT3ozDAWHC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6/2IM5Sl/EO/dNUGPxJQqx0o9EoWnxORYfg9+5HXq8BFsxu+
	g4t3sR1wpB6+0w8M+sJPVBipYKDDBLA2P2XfVL8WiYNQAEq86+7Uu1OmX/P8Psp5+5xOhps3Z9e
	P+nFeVPY19Em2FOkDW81fprMWuE1NsW3t4E/47OcqIjONRinpZBG+WqHO4ueFE9g2
X-Gm-Gg: AfdE7cnm+Ho1ppGR3L2GLdXYCdnN8BrtSHMuZtIyTmkRWVkCZgeE7ZDgGS90u/4rv6O
	faEATlz2/QJaIVAz+2wU0L8lX7aYqjXgXV+VnlElmzw4pJxoQ2T7ERCpqNu+8wzgtZ0UtwcEkOG
	FIoHg3SQz9HS55MX4NbanwhbC6KuBkFGkrr6i848H8pBckxeB9E2Tf62jMYJeIYf4wyVFHT7dNK
	krBcBEyRmSzAZmZyjVkqWNZfP1WeOjqUTcyqPnSqzobeMvOkRIG7iI5IpSWxu4w4lRgWWKeOAY8
	DaIYsqtUC2Ka/h74hqbvUqrmEEeeF/2ut0AZOLXS4+iBygHk9c9OU2J7QwiaVZi2ggAvxETsbhq
	f6iPyiEL8d7OwHHazfnPVzyS5WMqTeHT66w8=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr134669041cf.2.1783419092392;
        Tue, 07 Jul 2026 03:11:32 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr134668681cf.2.1783419091715;
        Tue, 07 Jul 2026 03:11:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84bc3dsm101215766b.21.2026.07.07.03.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:11:30 -0700 (PDT)
Message-ID: <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:11:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX6blnmaf/1hsA
 TA+w1ZHD1VjtuOnt5yACMjCnaE/97NgNKtVU1VxJw7N4p5ljB/TJt6coV2KXlQHQRBEGlItX4wi
 GBnRhH62P+TLDfRegkRipsFr5o8fLRCqslfx1biM72f0iiAqI+AATU/JPQ44YM+NQqQaYvLXHk1
 AkLApBjztjaboqzcPSVB8DNzWJVKSKcnfctR+2iFEp2xPW0tuzv1GLJy1k1oKDWctOwSuawpHkn
 m0RNPGfynAUncQmUoVVwN7fY3kM0kG4SJzNlhP0vVtaoac01oaQuamxp7upJUUVGqIM7rWTiSwN
 KePhZM0GnbER/P64zDpFjsAo3V79cw/GYtiI1pRWL/5lBokQqwnWWCeBT5VchP0ugldZowcAPub
 xNEguFxo5CI/nvwyC+zyMCPASiv+rN5TR5Ukzdv/h33ytmpwiBnX+RvlS9PIxUfZk1o0qt37oxf
 5uhyertHWvU6p0XnEXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX3Ycll49RgNEp
 PXGs4YxTos2UNLJN4S1J6zUp7TIO8eF5hh+ZyjF5Kg1ruyycGf7wC/14jMJMqIEJPGfCCP24J/s
 6l9mHNi9+ROTbnjaLyqj0Xjn60gXoJs=
X-Proofpoint-GUID: NC8fMexAmO-T7xj0_nS49aJ5NIyNQgDD
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cd0d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=lEcDftd587Omc_cSSeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NC8fMexAmO-T7xj0_nS49aJ5NIyNQgDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070098

On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 10:24, Konrad Dybcio wrote:
>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> 
>>>>>
>>>>> The idea is to make all of these peers, eventually. Not particular block
>>>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>>>
>>>>
>>>> The statement provides the same information as before, e.g. it's found here:
>>>>
>>>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>>>
>>>>       There's no functional linkage between CAMSS/IFE and JPEG - they are
>>>>       peers within the CAMSS power-island.
>>>>
>>>> Thus "the CAMSS power-island" exists, and it got its hardware description
>>>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>>>> a natural resource of all devices on "CAMSS power-island",
>>>
>>> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
>>>
>>> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
>>>
>>> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.
>>
>> They are all subordinate to CAMSS_TOP - Vlad indeed said they are
>> peers (i.e. there's no co-dependence between them specifically, but
>> their parent is shared).
>>
>> You can't use any of these IP blocks if you don't first power up
>> TOP because of the physical layout.
> 
> Yes and I'm asking for TOP to be listed in each of the subordinate nodes for reasons given below.
> 
> But unlike MDSS - OPE for example doesn't require IFE or CSID to do its job.

MDSS also contains a number of unrelated peers - e.g. DP and DSI
controllers.

> Over time we can move the bindings to a model where the only thing in CAMSS is a top-level bus like declaration but _right_now_ what you would do is create an artificial dependency on say CSIPHY for JPEG.

I don't see where such a dependency is created.

>> This is exactly identical to the MDSS case.
>> I was hoping this was clear after N other similar threads.
> When we split IFE, CSID etc up into their own individual nodes it would be possible to model as for argument sake
> 
> compat = "camss-bus";
> power-domains = <TITAN_TOP_GDSC>;
> 
> jpeg@x {
>     power-domains = <JPEG_GDSC>, <MMCX>, <MXC>;
> };
> 
> What I'm saying here is do this
> 
> compat = "camss";
> regs = ife, csid; // exisiting bindings for the last ~ 11 years
> power-domains = <TITAN_TOP_GDSC>;
> 
> jpeg@x {
>     power-domains = <TITAN_TOP_GDSC>, <JPEG_GDSC>, <MMCX>, <MXC>;
> };
> 
> Otherwise you create entirely artificial dependencies between IFE, CSIPHY and JPEG, OPE et al.
> 
> And BTW if/when we get to the camss-bus stage of things having TITAN_TOP_GDSC listed in OPE and JPEG is a very small price to pay.

Patch 1 (+ devm_of_platform_populate(dev);) makes camss-bus a reality
today


> We've already agreed to gradually transition the bindings instead of go for a big-band integration several times.

JPEG isn't a block that's described today so I see no blockers here

Konrad
