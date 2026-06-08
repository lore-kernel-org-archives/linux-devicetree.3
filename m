Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D2386C2A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914993; cv=none; b=GSGBMBu1x5qftpRRvSFs6pKMA1pfxqKS/khgH/u6WSuxHwmdQ2JHE1n8JxlIVLGBHa2Eg8Fs30kcX/VssooUkpgRFKjFKbto0EWZiCFAvyAnmnNSXYLsv7ICApSny5ldZ01Sx6bhYTZzVELhLhc9JuEI/xndYIP7BKaMBA6Hl0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914993; c=relaxed/simple;
	bh=xueKkhHn5SxTa0rE8+SCQcYUGJGPna24rZlLrLKUJ/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKzEo8jYYV+2Cq/Rjvu+VLG3LLN7h5JOrbZFgR/GOjB5+fa/3xA84JVUNefY8AlIqcXoZEMnZ5kWTdQRWN1BcGYWGB8A7N/iRl7yNDsT3O1JMJ3ZpU6dHd7p6MCrZERgbzYprBOV5x04h0DcSivYWNlNiDUuAlF1TO/b6jZtQoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlDuD69l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFC1tTg3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlDuD69l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFC1tTg3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PjS32733082
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=; b=AlDuD69lf2KHVjI5
	fjhdMBSy85Vk5gTp6mX/KvR8CQR3Y6Jm53vmQN06K2H0+wqDFERpVrLkOyp9cFlj
	Sh23TPISnh/Dz/0JEjD4Yvq0zNCIMyUf39r0Zut75kCs7B8zLbmlTtJB8wKDJVZ6
	E3m+58mc39+olAmgl2BG7JEL8X11bX6MuHr8RzhFwdgZFvwigbqk9iKgoT14aW7z
	v0kj4Ai1wTWE/PCAJdgZhZ1sMmcaaJu0tqNz5BkTu+IO0KNDm4rg3TXljlcNwV8J
	w37hP/l4RXppynfYqM0en1rPp14zI1BcghkhHpBAXRBdoduKkAQb6wgF2bydidX9
	g8xkdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7ga3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:36:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf004bf8beso51192785ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914990; x=1781519790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=;
        b=MFC1tTg3C4GdGGJrMgrQBGc5fl47pf8Ax+Ih0WX7CAcF8f/5a14Qr3q8YvChtzaNTB
         spWg1Y3zA/foThbID8hgXN3ljjcYANbWxqnHFCL2WZyUrZkGiOAvqqZGIeNfmMEswTmR
         5RM5nQfYj+I9YGk/JKKJSnZKPE1iptQMbLeLIHstNB5orS4eMA3hMWh4rcdB4IhQwVJq
         MxoruomG/1f0GIGVz06TbdBEFsGsEihbsglVQjj2Q745NfsWaB5gCMFreNHkz5bPee6N
         Q0CJGfMsbLhTi/v3KmgoFBjWYq8t7pQl687AGTU7CSt+fTONkDQ3D0oR1VW4Vb/FYmkB
         fF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914990; x=1781519790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImZ0Aq+n4EK2FB5Lr3zyUFNgl2SmAfecI9pM4VllFJk=;
        b=jAQdgO5Dn83YLYP3OugVF7X/BQMDlv6zsVlwSEBm+8qMr92OANvC/SA1Lk/TEMauTp
         53K23b8CnTNpTIqfj/bSfEqq6MZrDGKordV4SSX/NwN5Dy7seWBgr8BdBxypnWHVjqtp
         1DkhsGn4Prr5tgK7sqyVsNUtpDsoB0xCbQhWYEq4xWnwE5KP+u+v2P93S+663dl9nFBl
         TJGUujhzjWrqRCg2SqJUr1rkrPqmqwZuFbXaIR6DUQwfKXOff2p8n4gkraWf4h2n8kmM
         cwPrZrcsr4hpVb2xvQKrWOpAu++D9yvdrXNefdTmlhmS3DJVkR25vHiGD+l984pAAbuN
         qSzg==
X-Forwarded-Encrypted: i=1; AFNElJ/pnuzYOvp1Rcu26cGsKlahjpJMsNKjcCkJJSWszhQUaDNFekmYjDKOZ3b3DFFqYIIYlLgupSWNcT+V@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1s1eINWr7LRwb1AuEtZZEH16uEU7iYDkZ8GwAoW2zVaZpbaj
	lM2vMuGpku8NQCUcHZwoSMni2IgtCRzSeUEV594Um+D2GOfKbLF1f3W8of1UZjK/cIMRrGo3Hhz
	UUYnqdo2V7AXC+SUHJ6KirT47sNWw1I++Q8WY3SRaU/79TsGjcY6BRg4+tVpQjqUE
X-Gm-Gg: Acq92OE/LwvxgnDjEQpYKVK/0gLJT3N3brLzcaXCM2XXX9MCZriCxrAC07OqDMddcg/
	yhF9IeL2vEIt6cBdSuplveEjDRWM1CNAM4yOO5t/iWqV2VBBxF8MdD+FaojJ0S3Q1TD+bixXEIH
	Mcr6dzLFf6mDkYwJfg/kOnOfs1vVzC0qLM/iXIMv1jTtDx8IP9Ena8u/Sx/ZLZOTCC6AfeLxV6G
	n3AUl9vnnuoc1Wn9PqaKrosCcBbgv8xMoX40yBSmlQAx0SIx2l34u3RbFyq7c5taIhUohy9YLVN
	SqHh6Dl9puurO6Hn8nTl9soeXJVtC6K1HzKyqxxRrSz3xLhJWMb73tkJfLXqJTaGK4LKsCIw1A5
	lk4cIaMozFm8qz27SCfPV4TsGw+VIHvdw0TnnAct1aAmayMkpCOmsDaWDM0kOUos=
X-Received: by 2002:a17:903:2389:b0:2bf:305a:312a with SMTP id d9443c01a7336-2c1e820985amr174110565ad.22.1780914989927;
        Mon, 08 Jun 2026 03:36:29 -0700 (PDT)
X-Received: by 2002:a17:903:2389:b0:2bf:305a:312a with SMTP id d9443c01a7336-2c1e820985amr174110265ad.22.1780914989510;
        Mon, 08 Jun 2026 03:36:29 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm167065495ad.12.2026.06.08.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:36:28 -0700 (PDT)
Message-ID: <84d8eac2-e031-4781-8f3a-d301b5ac5a0d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 16:06:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for rng on shikra
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a269b2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ygU-B8C60GXm5nKEi1AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: uDuMiZOwdSlAS8w_BXX_z_LsfGcqhBGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX6TRfxmiN4ZdW
 TeIL4xdlCLE3TcZEhEZAnK4QmiLRlciEwU+vMsrB6Nr15R/Xb8WB3/v4O5QbvwxMwT5gs14zlpf
 9Oe9EgktqRnq+EMSQHVpa+VDDHzOVMyRrBeVCmxxHSh0Br7BNX/zRAO2BZTo3WkMGCRa+l4GMl0
 z0M85j2VTCW1dpui6FbcN0uXXB45iL3pK2XXB2ek8dVTI+cyjh/OcPg/JonlpeUdrASqKc7MrnA
 RnG5IZfr35NwAWIu4AVhR6S1Gmcg7ql80CBrDdT6Gk6Sr1C2FfO2aMCdE9A1/vJC9Ej0s/kozlu
 ZbnwfJInbff3go8jD0dDQjeV7asLaFJJCS63dXSJ6YVwWSGMXF4yy/B6z/TxlT0r+UwbcDrtUSV
 DZ7nYZYkl3OlIjQkCFbOQMflqLeWspbJ6N8vTwxkfMlDRwuKhFHJ+UJ1TDoY2Z9gFC/ibXfiemB
 oRfAbAAK7azgV1SGp4g==
X-Proofpoint-GUID: uDuMiZOwdSlAS8w_BXX_z_LsfGcqhBGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080099

On 14-05-2026 18:46, Kuldeep Singh wrote:
> The patchseries contain dt-binding and DT changes for enabling rng on
> shikra.
> 
> This series depends on the following prerequisite patchset:
> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> 
> Tested-on: shikra-iqs-evk
> 
> Testing:
> - Boot the board and verify qcom_rng driver probe success.
> - Validated rngtest utils
> - validated against dt_binding and dtbs_check.
> 
> Steps followed:
> - cat /sys/class/misc/hw_random/rng_available
> - echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
> - cat /sys/class/misc/hw_random/rng_current
> - cat /dev/random | rngtest -c 1000
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Kind reminder, rng/ice/qcrypto patchsets are sent together sometime back
in single series and please follow here[1] for discussions.

Please consider this series as inactive from merger point of view.

[1]
https://lore.kernel.org/all/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

-- 
Regards
Kuldeep

