Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4B3FE64C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083003; cv=none; b=PXMRrM2EHav3lkPyTm/KOjIpECeMvvvw+ChhiNXarU88TAoCZ00+ud53UBHUvjs8blfv+aItC/1y1A7okn+X0tubXz73CsWv2eSDeIvjfsucE8jPZZ//1EqcZwfrJv8CBPTWuplsqHxsFKVSNLBWwKHzF3vNG28oWqM4qj+bPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083003; c=relaxed/simple;
	bh=slFlcG18qKmRJPdDvfi5FDwm64deTGUrtGeGdyAySDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLDL/qaiqMHCEVCP9P22KOxSlYrMhKxSfX/+D4/W0LAber+g2vQmvmZQHpPN+ZNua6FhJdDfO3p2+L97me3U3lfxL4pBr3xUi2J8dBf4h7rpI1tHe7z83vGi8r/XY4QV5mzbyo630oAKpEXbl2D3cduIJuldFYmW949Jwo554/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUxvZK/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIKjr2P7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUxvZK/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIKjr2P7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DoLVH1527930
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 15:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=; b=lUxvZK/PdTXLb89b
	kOoFZzfSwhMEpLuomTDMDCEb9V9gM+reKqMbt8imv00LFL4ox2+0XRRxQQKYs4H/
	NETs2OgFotrUI2GcCrm7MF+nNG4n0jtg7T7bvOAZuMSXHRJO+7I0Ap2ACljVhWsI
	3yk+jVM3ctQiYEa2TFQR/v2V0wb/DS9nkAU2PlK8Dg0TqRLSTlO0wAWbN58oJyjI
	yRpcUQDms2KpkQk5y7fVN0D4TpOkiK+tRcE3nDm+ezn4J175nyy+POEhuepbYwjX
	7ILtgxrunRAwI1Vk/7/V5qzBGZU3w8n/0FS4FbXUqyywjAhnMywFnbo+musI0766
	x90uCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128a1bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 15:56:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so11937834a91.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082998; x=1778687798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=jIKjr2P722tkurHjHV7xJofcCGFSsSiVhkBLM9r7JX2TYjtVT2va5NbJDtA6cvRNy0
         /odua52NzkOUhW4cUmSUxUKD0W4jj6Zo4EwSNLzWCp98vpG8X152kq7zRAmucmqmXAg6
         3akokDbb10zFfQrWPGBK9CoDoReRwLaHX3+FfBYup50lgedc1R9NTSZGTnEBra1HrYWT
         uvjTt+gc1yBOTuot6dIrKINR0y+fSn3CB8f7iAjZBooRO59n1Lt55io+Fa9QaxrHWiua
         g1Gde9ziCYWVDGkfHLrmiifdedEqLnRj/r5JTGvkfLtftG/wK1mmk3cmKqiEKfWBRe35
         zuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082998; x=1778687798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=rdLr3LrhUZnDQQ23tiQq36I2zkowjsgxBdGE4ns8eMohGpPpUlT+2HlL9s37SDBWVi
         pxs9ulUw+rRsWQaQMi0dXY7q0p3WTPJa6AwnWMjpZJMi6Z13EqCNhG0z+ZiBhqBA+eFM
         Oxk/MRJb7FJg4GPPbpbyD13WCAxHQ1avZGJcliADPwTyeTyPZKZj13H5wJg29CqtCovc
         gglK5ToN8u4pJBIX4xoTSKo0Qg014glmE6ont8DxYs154Itn3GYTarZKeIXySZB7K9NO
         mqaIYkkmWiG+WsjFySeNRpzWcj/LFlM/7Yo2mk6fMvbfoKUdECbthdACxPWSjH0/bZLO
         GEhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T/43niZnI0Wt0idBqNdUaoaxu2vD0/F3xlkexvapXzYovYf7rVoHJRvT2FFrP3BALTbqo836B/JYg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IbPJEfo42iyn792+gccO0ua4kkibaDxDqrI+B8nVZSmQm1Lv
	PxHdKSJWLBucQINB0mL8se7EVUNclhLhj1RnQG8J/90b8/BTVRlS2o6oAzpfnpiwrdIqhS9YdiZ
	B2DXisu4qb2xzRhFSCGL6waUFEjuR8y7uSiC/v12FLmi8hx2iGVukco1Z3EAr7nes
X-Gm-Gg: AeBDieuvkpKiXzMvBB4qca0CafKHOce8c/+rWnJdQp5eLusjJU2QzshKBHDR3gaI7j7
	3rEZT1PS1MaNEedMCI3cdH2+I1pVaeMfbab8aRreupIZN2y6TnZMLzSMxVoh+pRJHeCKm8hy0Vh
	yhc5OkWot5eKxCvXdXIcckUe3n/+odXG2LicwhwzsesQdzRQMhcjtZNOuQ4EjTbgbeYX78IwVD9
	gUuaPtyxqE6g5vPkgg+Bw69qnvRrpLEs1UqiLZ2Yo8S8XJsNV+xG/JQim+7wk0xcdXKUBKmndTs
	Q+fsRq/KXfmZVR/fI5SMTKRmV5BCZS7oeHeimPJekeQRGkSjgcyfsqgPVXW5BI4d+CReseeZayF
	NgVimk1bCnUhxAwJJmW47ajaeTbswhsfUmJcDefcQWFFlW33vf2pNWDVEtaqGLxFV
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145704a91.6.1778082997921;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145671a91.6.1778082997424;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bd8debsm2886209a91.2.2026.05.06.08.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:56:36 -0700 (PDT)
Message-ID: <47413644-1c3e-4668-980c-e60f7b8c1352@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:26:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] media: iris: Add platform data for glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 21WsmuZP5j-uUkyquUMocsxtiKhWJbPJ
X-Proofpoint-ORIG-GUID: 21WsmuZP5j-uUkyquUMocsxtiKhWJbPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NyBTYWx0ZWRfX/Xhf6oQzOWUx
 KVZZ9IOP8Oi1+5sOvTLv12Uh7P5UJqh6bXkCUscScIAwpWIjLtEsvOiwKYS8CrSv75o7P0W/MCZ
 et4FhW6NfsQ9ZYTpWdhHXFBmqNKA7ule2YBY9lFxkbvIQ6i4TfeEpxfiLw5tssolGje5YQHKXci
 dpUZD5BEtOAT/djM6M64CavkK4c8Tzv0yeXsuL/jbELUmPcaUrjw710SPdQbJyOcAk4Ex3ekQi3
 ynraqC+D5s4J/qZi3z97Yw+dCmFvTPx+3970+LeyJRAisAmrkmVhLWNNV3qb+pogcKwl32klTiO
 aRDdhDcLWwfAIlaaIux8FZxzs32tg7qBcNGjZRS3NUymnuYnbXk2xNQbCyWyLGLSpx8ZpKSZiLy
 p/aQPqBJfhdUcIT1NipDDEloG33QlAMrcLq6PbH43ORcTti3QYwXMwPhgSJp7QUmva7o8ooeJok
 Ov666k6TnLnLMbb0TUg==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb64b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2SVvIUmmVaN44YnEgAEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060157


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
