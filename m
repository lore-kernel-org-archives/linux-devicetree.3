Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E03E2761
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093373; cv=none; b=rsbmEoQRYxbdEJMdjjKZ+i2N808iu87Y+N86s9cHuKtbZoR0Z6hot5Oel93zb0kJsZAbA4vNM+eML6C0LZksYDOAqaT4nlU/ceX1nYgHnOIQeFLuInhywBV/5pwhfs38fMTMpABj8YZ80KydzIYHX9zMVihZljyOJY4qWVPKXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093373; c=relaxed/simple;
	bh=IcXVmpo4hfZIJ8gVfBw+weIh6aOVHZQDkKMMjT2AUR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrnF2ztHPm14WAY4f0MJ406q9N09izuT0JVOwAtMh048GKi2oLzbeuKJdjZftJkFHmiDv0XikKSc3Yk5MUubb++8wpfIP2ibvk+um07JH1NN+Ry7x45vHKYM29Hh0RfTKQlYdR39Jxrbur80phb4xLuH9JEyXE2pAVyEQynQv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQZ2pfUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSydI8QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQZ2pfUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSydI8QG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I65JVY242848
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=; b=SQZ2pfUzNAq9jdLS
	UBkHmUpFWYaPMEVkkRwTneoigxV9AVg2SlNgNJ/PwwuppMFgTXPfnEvop/ddFIK1
	u4gvC9dhZWTpfep8InIcpMU4S5RiHHZCpF6F9qD/ENf/SKaG03ZO3EBz/mSCSKbS
	da1W9Tf5MsdEBDayViVe9dD2EoqBQFwFSYEx0adG7vwSsX160sKpulw53XRnqVDf
	DcIMTdEVL3vt4BFydtxmtgby+v2fxYjUry7hDAUQMeBfD/O2nID2zUk11rn2dpNh
	JEyUkCskW2S81JByXkvYzLKmPjrunoOjbyH665A63u3XhIugo7JcZRDG45lXHVsI
	8A0Y0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw5gf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:36:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so1263721a91.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779093370; x=1779698170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=;
        b=fSydI8QGU8igqhQHzexmsHMrPeUKo/lYV/pGIIbLhJMKbwgNsi4PkuC5+pYlPN6y2b
         R1TKAWYvpKFxLs7Tr3oLpTzWeUJwo6oHOqviJND7IkNDh3YGiLNjmQfgugTeE2dqX4BX
         1Bb31xL3Q2WAkjDePJTedlGgAIlRLGU570rQoLZmSEPDxoU2x2oQBUNIvi8oM38m3tdM
         zhAJ/czmCzjlQERQTb+n9jh7ihjQOP5XgBA1BublwDxWHIkETTjawzc44zEj5ho1FbhH
         2jPG6qsBlS0l/6v/SfCp5Fd2bJMat5hXU1GjfloKWpb52libXv24WxP8Q2CbdhJJ1lMW
         7NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093370; x=1779698170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0zXoBu1LpOx86nIZzValSPiILnbaCbI2gD6Z76zc/Q=;
        b=Wb2yZgF64Xxk8UDUhzOccCMa9c8auvQUVOuCXw7IMx+RLagrUPdfXUN7BFDcvcGlpG
         xurUNVjnQy7X0dEDa3czeycns8ZWcZKhuvvmCVySOSKObBJBotxSkA9BK/b5+JDqEYTT
         rFkryfxSyQgl2HqPHlyeXkFc7ZE0E/GV2IQBdLmTQu7KQaqeH6uNVW7oex2X8gYx9YG1
         N/Xd1vovQRpjqWw7NFNWeye51G/9vGxODAB8xx2GMC6HQqndOnihqFYslaNe72qjvkqJ
         ycfiFbKGZ7iUMyX1vU4uwS4GXVnQvzHDxar5g48sj/38mOmjSJ+jTgtcPz+NhPRRSIcN
         giqg==
X-Forwarded-Encrypted: i=1; AFNElJ/WhvXIxzAC7fUpoIXlLFDVepbALG+IemWFvJ+gcwsuSMIqbLW0XryFwkVk8+LNCI7ia9Z1XDRASDP7@vger.kernel.org
X-Gm-Message-State: AOJu0YygO+Z7p7Zl0ehunctxJ4ll/qdUAEF8xV+qnL8aqHsfdo9EXOo5
	YMWvcUojgCkEAC7ddUchg8n8jfVwUK5c/mWqZhYECzFSWMtshk6tpmdcIx/vZjVOPAk7zg1KR9E
	zRNKLxmwL5dJfiVoJA6H6B7KY4edYLDFxkq0WFsswKhwyXgP9ASEur83HVUUwedbR
X-Gm-Gg: Acq92OGrOsPcl+bDDExTK3G9fkbmGFGb8DEwSNx7TJTHq2KrwVF3Lpn5Ba69duNe6Yt
	KxHuuXLLE3EU5SdG7Z8GKepVA1qFWfFPQmNGPj6XvS1z593v6PKEl2mL9sTz9vKyZT4yMPGpE59
	iD/hZhixAcHx3pyx6yXithJeOpIN7Ke8IVwUTNUly6ENSBk2WiEwb8i2cgWE5yYbcY+bqT2I5EM
	lqY9U9K9MhdxpcOfhSJ7CobxTnPoIXeK0S2DieysRRb7RegaqMK90gwd/0eiNaO37ZT70RDzihC
	2aOVIiPLop/FIfYGlW+m+aynOeK0sj0T8lDaOr922bSxAoqIeQ4HK7WpgeJZaaDCuJL1+yKOkr8
	hihybdVLAxmsjshIOJiosj5yUYfPoRE00xRIYlSXiZXZIMe7/f2E=
X-Received: by 2002:a17:90b:5604:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36923318fd0mr15265717a91.3.1779093370322;
        Mon, 18 May 2026 01:36:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5604:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36923318fd0mr15265690a91.3.1779093369815;
        Mon, 18 May 2026 01:36:09 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369598fa445sm5241125a91.1.2026.05.18.01.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:36:09 -0700 (PDT)
Message-ID: <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Date: Mon, 18 May 2026 14:06:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MCBTYWx0ZWRfX5Gq6MiXp5fTC
 lZoUc2Er4UhkLiYfUkQS4FX8cE/YUa8lzWc0edP8BybsDqN6IqHKmLovQs5oVtbosgvOwzBeisI
 R3+xXKhT+IRWkjVFMrB7SeROQP117o+KY5+KfswwoXNR4fB2gr9RY8Tlw6iNsxCG4rZ/o7+W52R
 2eKVCVWqGKbfmwBk0gsbkncIwN04Is134cOD9coVO58onpqnl3qha28QTQPqmt5WoNDynrAaSFW
 TbgIMdPafYNGVJ7Rrt1iWHH3LIRIAKaoQ+Zufpa4R51ChDokwlYpUGDZOQQsPJYpeLbxiXP7PHK
 9Q54tkUxU3Trcx+y4ehKm+RAuT0tdkrH/ePhe0mGKVLMBFzij0P/DcoWXDGzNrGBtdkJKTdrV51
 oLfRc5pYUxcjH1KSoVmFVCfhL9uZIL7hIOQVJJFrlVbi2gPAUHjl13PuxX/eHzT/i3IyqwXJxR1
 +PuBl12vC/SkqPyLj5A==
X-Proofpoint-GUID: jTXUJ__UXVwYFWqydRe77LTia5__QqUf
X-Proofpoint-ORIG-GUID: jTXUJ__UXVwYFWqydRe77LTia5__QqUf
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0acf7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UgU4OR3TJw7-EWqsPCAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180080

Hi Bjorn,

On 4/24/2026 2:05 PM, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..64bbd5691229 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		rng: rng@10c3000 {
> +			compatible = "qcom,glymur-trng", "qcom,trng";
> +			reg = <0x0 0x010c3000 0x0 0x1000>;
> +		};
> +
>  		tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x0 0x01f40000 0x0 0x20000>;
> 

A gentle reminder to pick this patch for the 7.2 merge window.

Regards,
Harshal
