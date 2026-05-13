Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392347D951
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686244; cv=none; b=JY1QmJRcCI5ttxZSM6yC7y5wjfS2xHxawQMJZAna/fGpRfnug+9TyEX5VBjZH9UgwrJKSbIEHiOoK2Re5DHMsXYa9l3TbKZ/5+RnCvrktMCCP5qVVT7Pk2UANsoAdeNz6ARg/ncW97X6KY6abjDPPMA2Ms8pBZqsxS4Uih1602g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686244; c=relaxed/simple;
	bh=luAq7DXJKx8vBvfT2bVB1S0HU4SGbPOQLpxviv6b5Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rh/NTlXh7sfNRf8MSzrj0zYCAFPpDq5hkpuEyHKiJt8SEra8zTLFNptIHT6E2+gbYPJlQNha+XSL9McR+y4QSdshFUeMLbQFB8vhaBidGCJPjxZLuZjpp68M/UZW6jiFzoN9EsyAlQmy92Gx+oMQlhcQSMtr77v13b4FFm6FI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgEkMAYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9CVJM0k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgEkMAYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9CVJM0k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEgDQ82888326
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=; b=QgEkMAYyK2rJqpvn
	xPIVDK2TwGPj0gVti7Iy9lq6cowwpGTJP5DAwSiPWd/BRqL/cK3c6tSXhvp/f5gC
	BG57BPtmLHOVbKwzo1rVevWSTRr3+G3wAh83/zR8o5f3yosZOU8H3ELPeldS/eMg
	mf7ue56cU+6TZptCmQoUKA40rGcIM+5Vf/Yw+TDJetUIfvXYDiHlEgWyDmjckOXT
	g+g0sQXOLJvTrL7g2yYTn86caczXE9M57DAfmcwQ+cyqNZIZ/zMU04KMB5CLhKps
	MK22eOR4wKjs68cJWMbCwEQ1aHEYApwAeddPDmiDdujN3THi7Xmg7iOFyrWpk5EY
	8aF/WA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghkg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:30:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so4061724b3a.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686242; x=1779291042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=;
        b=Y9CVJM0k1kq9Udp0aaid7ZRqyfyRb066eQ2GAepM+ldlQRAb+UovgVO8jJCsMMEimV
         9hczmTBoXIUo2cKthJQYhR2+b+SB96kF4o1plK7idSImnG1YyPVSdvtps0Vw6bAfX2Tg
         PPOSYtgUvdMV56RHMXp8wH6W1nMS1vgV/p8wKFckyKxbjcFQxOkdKVpynNW5pwY4aOGl
         w5rPBntl12deUk04cSJj1TmKzCZtFqMNVoMFpDkrR1nxHquRN/9QTC/X7uGemfGPdkA3
         1BQPLq7cbp/tPYsz4beq6m+NndV2uGUlrRUO59mUwmMWSHfaeSNVXB4cr34damUJ8+OT
         g8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686242; x=1779291042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXTDSi1x3zyTbG7iudpAT/EqeU148nb6obfK/o+r5aE=;
        b=p7TJbS0gIYUgZX04i4d6p0kTcJEJIRUfKDNp5JEaFfUZOwYvUc9dFdi6vRgPKsOlau
         FWVAyBeZEpGwBfWCueOUvQo0AAmCBIkM/mPoPSpiC/z2nh0/Npktgoi0YU0RL++waSJT
         c2dEeQwaGrxbUNrdxic/2+K1co6ihyaeRV5m+SxD+UQcrwm1NUz3alzKWuZc+ffspqZP
         0vkjJ0R6BvRhL7uEMxQIcTu1Y6N9dqmP3bILy1+E4nAQtX5bApTWxTCfzgNTNp6qvyfk
         ABXJnEfGHBmVFRIZADTYaAqFyi5+9JAuWET/qetvfEuk4F+ofePBQqsnzeBgm21gff/V
         zMYA==
X-Forwarded-Encrypted: i=1; AFNElJ+Vd61MgvYFxNANaeTuoTMNIfYHBF2jtS8+fdHF9qJZl09P5EvE81a+BwSIkZq74+pDg9fcddbQKKex@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWjqrGAd6Ir/F7Dpmx8v0PhfJN6gsBck6wiorbkzj2HZzBF3F
	fiaf8oP/MozG5FacS+sTdckNDPNLq55li7fny55RsEP3N0tfxGfgE7m/u29njRA+6XrX8NPnL4T
	mpTxOadaa0vhQJgXTgUCF3HUZClw5tHgVLe9XIgzLtSiTCF7iloQTfSiN2C9UXwuX
X-Gm-Gg: Acq92OFSUyIkDHEkwx/qO5D90yldIOnYJzGMoYCdgvxv2FXeYEUKFTCgxGLv3malqWW
	aii/BKFkHi4SgKWyRlKLC0KeiXP0TGMnv7a64FRWy5slH4qoF5WzTFh07YIqeyUAjnBsgL4nu6B
	2y4VU9gXx8u/9KNEiVj8D6ouok3AqkvR8yqaEb/VNtvHEJEVXiS0UjnyIJ9ltVrhhKTbTWUMsqG
	rqxtetlLK+WM4rjtZWd+26vrgYtN4QfYEzt5+1Kt77NkCXO/rNLioFZPH2Fd+FPlHfz75vfZOix
	4UsWrnK38FpdeHB0oxa2KzpqOOTCv8Rp9BIHBKWPEQxcD6DZseNbx2s3HZKIdZULTJA4QbH0Ayv
	8lXv3bYJwLkPR7ptqMzG0455XsYaDmsQI4lrfZyPotPVJAQ2F6A==
X-Received: by 2002:a05:6a00:94d3:b0:827:32de:d197 with SMTP id d2e1a72fcca58-83f05c4113amr3522159b3a.40.1778686242127;
        Wed, 13 May 2026 08:30:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d3:b0:827:32de:d197 with SMTP id d2e1a72fcca58-83f05c4113amr3522016b3a.40.1778686240258;
        Wed, 13 May 2026 08:30:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682aba01sm27002322b3a.55.2026.05.13.08.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:30:39 -0700 (PDT)
Message-ID: <07247629-68ee-4a4f-be1f-7fc44a9403c5@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:00:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
 <agOHPTif98-gTk8_@baldur>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <agOHPTif98-gTk8_@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uObYdtBVqn-RdXaZm1l_HT9mOVfXLBmo
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a049922 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HJv6DiLbUnBpThDv1aEA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uObYdtBVqn-RdXaZm1l_HT9mOVfXLBmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfXx3kldm5npsd6
 HomRgafsRx+WilWry1IwK3MbmGj77Z63/qSxWsm1cOcQJtD5Gj2K+KPEQlCfb47DEhFJ6iUyoCW
 MAPSi7ra9ABi/s5BE8wefSibBC0aJBmFmD18lbAD0RZjLkc2Xhr+8eNippJsBuAtlK+x6jFcKl8
 yzqLwFllexdhzpCXVHKICyEfXyJIXVZdN8utju57nA9/JbFn3oQcRUb/DL4TEKsRvPIxUd4Nf5d
 Q4iNShupd+hWQ5jg2KCRrcvZKr4nEI1akzBXjhP7Byx2HH5DqSixz1nrhcGgIWJf7EXaSkoKsw4
 VdXcCP+YEl2MZPHzvph/2/StHqXSOJ4pozIHaRLmUqwrBSyJVCN52Z6sSksABRDNwEhHNKaSiUU
 /KJGfv/ZMiFBJhDzJ980LyJge9pNpoCSxePqRdAsyVBeR9ez5nlLovhkJQW/XTceJTKDQxVIgFw
 COOz7fBAeWEyR1rYRVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159



On 5/13/2026 1:43 AM, Bjorn Andersson wrote:
>> +#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
>> +#include <dt-bindings/clock/qcom,sm8750-camcc.h>
> I had to fix the sort order, but the merge conflict tells me that you
> didn't rebase this on v7.1-rc1 (or later).
> 

Thanks Bjorn. Apologies for missing the rebase.
-- 
Thanks,
Taniya Das

