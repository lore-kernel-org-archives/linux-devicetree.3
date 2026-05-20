Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89033CF698
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271533; cv=none; b=NinN5vIw2ou9cGnkttOEKCxo8FrPAKvAkvdnmyLZ3O8dGnMrFp98zurHR1h1jPsYHM7vTQqxa4HpKnHY/zDA0aQiGyEBytjlyvaVdj0OvMJZ4lcyb9fVzXj4TPnG00vHsHtyJtOYcFqoINapRNcU2QBYmBd1a0Xwv0jhsdGi8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271533; c=relaxed/simple;
	bh=ISTb9VzGs8Xj0MPzhjKw1URcNpCQEcUmGujhOYHMfpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twhN+sKr1oDx93jCW1HPUHbM5p2hce69h1M4m4+pPEgkwf3DfsFW3rAMTwCzcQ8QvWMjS5qozEDbHJ1utrj8FmKAqIRCqcvWu+A8b6dHhbhsM4lw9o6uiBp3XJf2rXxC6v/J00K6JB3YQEpgLyP7IKPGSzDaO5SqPs6L2yPXPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvtHNRb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBfUtjrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvtHNRb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBfUtjrQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kR9e2984427
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=; b=NvtHNRb73nhfYxj7
	k4XZu93/c+/qCDR7IHpVI994MxMZwIs/E7QM9kgoPC+ka2IROsP3LKPw2WrPRDp2
	Hbk8fgxcylTpE80npM9gLlTKJGyDMXt1cBj/OnERk6jatkZ8JxSicmHlh4aoylVl
	AeLO/8wL3yUge4pmjuD3vP1uroQPNZNESlIwEdrHmgLG8CQvzLwQysH1QYtzXRd0
	eXh3EaVySrITj3EsHBsw/K7c7CJLbusgMspqB3riVe2JsYmDvAh7KFOR8E9QjR8s
	qRpOgRhi4uYqlX8vd+kewolN20T4MhjWa1FEniQJ+uQNX49xqGzIFWmY5ucebOID
	G58hkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t494p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91056376aa0so125755385a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271530; x=1779876330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=;
        b=KBfUtjrQ//cthgr5Ol3eooo2igKpRaCL0oANdLDJvb1hAQjrnrze5fRMOe72KvikOF
         sna+UWnfVZDEGUOWx8AaREhNaSRmABBcWTVFDonSWUCNaBynfzk+NCCI6OLaXIbmSw1z
         ZAU3+Kni3FbyEvQv3c8X55EdxXX5nhHJRgtK4Z1QFlV1+WfVdU8sdF6BHBT5vB7RSZHM
         VTQyLELcOWlkO84XhN0ybmiho1n0TVx53mExxKAbJxvLArcJJ7rDhrTl4I4WlManpC9J
         0tjtqRFqfixMsDAZVgEz1XTmp2fslkWxF30aVdGTbdi6F/RuTS+jtOZYF68ymVOtXUdH
         9bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271530; x=1779876330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=;
        b=F1+aMPnfsnUzOSQIGpJkbxN5mRexjOCopsKG4f+hXwBEcD12GzCn1KHYCRDhXCizEC
         wgXjE3+/wY97Q7nsSrUwZLGBuHE7XgA7mpF9Vs3k2U8axRhqic9LmR9l2hd0wBcIhjS4
         TVzMSUWNFN9klNhH8F6Ay1IIA4PVY+JQzzAyJy3D2ihE3qQeLFaMYUfFapJs1JbngSQP
         QVPXqUm6RVduch73/6llNE7GFGn3PHgSF/MgkmAXZ1K7BBiZebWP9NW3vyQq3Wc1rY9s
         truMVGUNCc2RbKLusy4fDQMXKmxD+C+Yx9u3C93ta+yy8QH5A+A5zaJcGG72vnIx7uMV
         jUHA==
X-Forwarded-Encrypted: i=1; AFNElJ8QeYxXuctbNBuR5h4lyVMEDmGHhcypeWA8LKnwyc97S8Y7sg3MxSDZzouDMsIdi1/h6VZVs1ftx6AV@vger.kernel.org
X-Gm-Message-State: AOJu0YyYl67PYuRbEdCdt96D8Mqs5yXqH7ZjO9Ep6ShP7Fb5JDGJlaAR
	2refT2tr2XH/AAws9ZFolKBPH7sJOzpK5n7VkN7G96TX54J7lvsW7iIAEN9tWDwt+5tgex79Twu
	6LuOK1z6iCxD3kocijSPwHP3TyaDLCkBAX0soRefksus1U4hc9Qn++BHhZ+JP4vbg
X-Gm-Gg: Acq92OHh5ZSfjXk0IIXTPHmoy1ZzstMgRHV0tvKeP4SicWhIGzww7eJgHD82KkKOSeE
	KgMtuHQ585OzH0skbUpZOMQAsrceYnVUxwH8/4I4Z0LsWebA9SDQNFPeTgSMNlTfCVHibAI6KcD
	GHUUg25l6ya8Bj89QvLRiwdJHsChabr8BFr0tY1a5mEd7y6K6FIt290VdXz+/DP8VjROaHcOPn3
	8AxGY0fn/8Qy9g80/U40KnfG49nIHfgCM63LgawnRaMJiDwQmP7tK+R5fVbw4c1sZ1/AqbtFqXt
	9lWzDSMSwhzB4iEqcdq5g0Np79VAqo9S06/oskExxRYTt7bz+mbkR39nkWkd3X3QuzVdri4xonV
	PRfL8oc3L2VrKeHQYZdFrH8hOZdK86O/AoXV2bKuHj+TDFqAv47HvC+8CadiAb+hnJMQ2lV0DHa
	WHnAA=
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr2206634285a.8.1779271530288;
        Wed, 20 May 2026 03:05:30 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr2206630085a.8.1779271529705;
        Wed, 20 May 2026 03:05:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ded942sm834773466b.36.2026.05.20.03.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:05:29 -0700 (PDT)
Message-ID: <b8784516-fa22-4602-93d8-9c5e4e255414@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:05:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d876b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZPYqqAgv-PGnnvAlRyEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vMYUf_vixyQGtWz5FOp_aShOvIVMaEAN
X-Proofpoint-GUID: vMYUf_vixyQGtWz5FOp_aShOvIVMaEAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX3pUnwvobhIF2
 gDd/55JTRAtobzVvBX7ij6l8fDHCjaLJz8nN3sIynoz7+xZu7enDuCL9jw/dXWM9yDTt2wUc3SG
 dwAczO1klxiXmttmegkFwO6F+jNL/wKBbBuvTVV+iFi2omVS1gM7vEgqUZTDecAToHXd2qjoK1b
 UZxb4921yfWKQlodrrbDwwGNToUxM5AiZ4jR6k53TVqTvRrJojeXllwDgEpJ2uw9d9Rb4tHapv5
 F1zv4+piqXuxJzt/bwOIme20c3/fYi9oE5VUDqkIsHyBLZy+B/hvbTQz0e7KbafWcyT1pcF5uzv
 YjHiFnohWOSQf1BgLNUbG9Tt+IBt7gl+9lmDCcKTlXg+mjFjC1hh8kqL3dzt1bg2YG758xN8DHQ
 6VEXvaVFezjIR24zsnFU4MGVp0anpIx0msT8h09s50DFMVGCLtg7sAeB+XfrPWCd+/IziKkJsXG
 XwFKXIw6gtY4Ug+0oDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> The schema checking for expected naming patterns for SoC IP block nodes
> was really incomplete and was checking only nodes with single
> compatible.  Improve that because questions about expected compatibles
> still appear, e.g. we have
> Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:
> 
> - qcom,pcie-x1e80100 (expected old legacy style)
> - qcom,glymur-pcie (change to new style, ok fine, let's switch to new
>   style... but...)
> 
> I am afraid that a new SoC will revert that back to old style, e.g.:
> qcom,pcie-whatever-new-soc
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali and others in SoC names
			      ^^^ typo

Konrad
