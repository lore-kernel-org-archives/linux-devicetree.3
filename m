Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E234393DF5
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077597; cv=none; b=Aob1n7qfXE+LtY2alAkNbLSTKkeXs+cLFbN5KYhaPCNKQuFWACoKsdSF+Su7Enfdu3oQCAuxUPeE7ZKuiLr6tLb0/b3FpI0fvg7Hj0EbYqUkXBbuwxQQ4IGnf+2OQQrWRAm147bYDAO7d3CWvOTyRAoQiNYnoC7rSYXpAwQztmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077597; c=relaxed/simple;
	bh=srPsf9DGtjuwNp0lmZ/jXjqw3neX9w70YKOrPJckz/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp2Xux0U+Uw+AjvNqPUxwHnDwbh2Iav2szYg2HcKZwkSMXBXC9B2ljCi0G/2cMBaBdNkF6CdxNb3G9OOx9hgw4lPmVYzOCfrEHLT+1EITbzU57hmYR1iyDTRU15yZTKU5lkFrKfPUWuvmk58kpiwXXKUAWCAPmqfn7tgoavympQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iN1G/EWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvtkZsZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iN1G/EWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvtkZsZF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646CVLsG1515371
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=; b=iN1G/EWNwfgWQKL3
	YAX+dNLrgxe2qqzkPQEvOTz9o8n8gYjG7HIbqbrC2dQ48IromOGPqNvckoG7DZUm
	YMO+2WEfAZPWoygw22tPuxiAD/h6hOndd+qVPjNqUqVRFRM6tGdtUqqM45pMfRdp
	XocTHk1vLrByN6EWoqEqhTNyBZBHOB5b5YceOBvwtrKR8MYSM71ZWotYXEId+SS/
	UMwJWBgTzPwoMThpSEhpbiqecdJibaGDgMNoNp4Bq9RAIKotGSQrGHjBacQsHnz0
	8LDRjA1lCwoPo8jw+yGY+eQz4Qi6m+3mXezqCYhCE5tTPSwx6+s1H879cO2FAT+i
	4t2eFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1ssja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 14:26:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83565161a6eso449868b3a.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778077593; x=1778682393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=NvtkZsZFEwZi/479mxw8kezbBqwrCiUc8ummFTwSSJgHaffXvJdLFBYkRA214aQ7BA
         r3HKzrr0ikF3E3vw0oUWOexuGK9yR45CJEtpt6hjOr157SA/Y2fW5jpqTlXuaOLTMRGk
         ivWEC0dAY3fqkSrPFQpM0nCTysMhPAWzqAxqDtRXftcU+5hLEIEdTSsVfvoMY6jtbYob
         WwyCtFoIbxGBVDgLchzajLcdBAu1bpgLd8n88tt9tw0L7I5L3WCxfEa4U7lhbBj3mr/Z
         FeWcKjx7xBPu81PWQFyLa469RfL1FEIzehXfmNJFo7l0t5bnPcMLko/vbq360uyxbNDt
         O4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077593; x=1778682393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=FqJqI/vN1yypnNjSDXEZ/5CRxJT6NzqVTopu1Cb0SxlbhfZPUpwdF4DRHqkWdJ2boB
         pTjRjsCxUjQ4rVhkzZcUtU1zX26b+mBEsy5AntZcSoN5XyJOK/xyDm93gkUC9dUULXoi
         PdGMwjIgFixJFOgJySqtxTJvy25yg72uGND0fUbkrWDl5etyti7n6ywmBHgLw/2L19Ej
         H53wN8SDshbT2qRYKQR1yWU5ROBUHBFEKT5O7IoMqibwNU8vF1lT7Bf0MmRVuPySA7Jf
         oKnk2mqBOyd4dnW+INaP+K1lcPfXqk70RZ2UPNWUoIK6adg1Ro8du5us0J9pBqrGcOl8
         KwzA==
X-Forwarded-Encrypted: i=1; AFNElJ8OV8IlzRygS54gz7+nFHXuGu0eakBBmjk8mGt+r1RrKCemGDNx4EpJ9SV0srwEgScbHqq1R8Of3W90@vger.kernel.org
X-Gm-Message-State: AOJu0YyGby+YH0ZsSi6orSh3inADomEbTsmu4XFLqbOyaqOujBrT31F0
	1UCPmAGsxZp+CK/hhQmiFSAPO/YyBLRAUTfqV2Ddmf5Sz68vPhYT1sf5upmMUq0uKXVQjggxPzW
	82/Zbkh7lKvqFgTlZJVIDb93ZBmv0dT6UPBnV+QG+OY3g9C5gCTJAy+FWH5Mgdm98
X-Gm-Gg: AeBDieuFO+XBa7NiVVHfz9qLiSKrKi2ImwXI+NbYNFvWhquax151/nvvuhpGouJCYU9
	OM2cdYoBoL2bqlbLJ4LjPAI0Nu32WDgwQh/JOZvDSMyh2EmvbFuUV0BNudNfiQ9UfpK/YmA7rIT
	fNxUcHbuDBXGOi+kSd9or6Rg/0fI2ZWPjwqi+CrKADlR/Q8ZhS/PvKbtPYhXjOza2Pn5sXG6FUQ
	jt4TEtmyBA/HshVAeF2DeuX76QXGb0awXsicyD5naBr53k0gj0RXovcjkr4TGcljrgQKLjUIrd+
	0/hA4CkydjrS5mPWm1QSqjUFF407cNP2LvpBRkX41PMA9qGDaYuJwvlCpveYGkqEpVImRB7iuGe
	CKbw3mROZCdc1Wu5hRJvw3M7zJFmxz1IHYEGLd29m5Tc0AyqXqLoTEPYFlRF48asp
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814163b3a.34.1778077592389;
        Wed, 06 May 2026 07:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814130b3a.34.1778077591827;
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm7146996b3a.25.2026.05.06.07.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Message-ID: <0c33ae9b-db53-4557-8fff-27c2da69366c@oss.qualcomm.com>
Date: Wed, 6 May 2026 19:56:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
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
 <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ldpPCdYhDGA8PJ8U-ayHSNVCUz_B8re
X-Proofpoint-GUID: 4ldpPCdYhDGA8PJ8U-ayHSNVCUz_B8re
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb4f99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LctZHUKdXz4wyCJjwzEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MSBTYWx0ZWRfX/8LU2TJvvUBL
 I9cyPXKE1SEMNzLltDp1nR6jNLg0jgyj6LfrtUfBUv4fr/9xeb7SCtV9t9nhKGvx0aoR0x7Ds7E
 VLhVAicnHENC+yjLHYMQ0N9EF6CaTCSlv6//REO/ygHUDD68LD+/I+Zi0u2PDrGh0LgMIo/Jlec
 RXzTWlsUuZ8Ilmc9ayd+k/dwmf/ciTmCZbjfrG/ySrGz5pop1Ts5+1xNFrrN657BySGRQHPuAnR
 TyetfvXDcDYCSlGW2fzZzZjHhMqBXsxlgl0pnIRU8Czcs9gWTO3WOJZGr0nshmgEzoeT9tAuF0G
 N+er0SID+nePmUqW/jmbQ/GlHI2eqWI5jzc9h4SE5GUUny6bieRu2mREQNyVkYYJk1P+yahFy8C
 EY5jr28e1Hfr5HdppbHojSyS072eamMieRJFjIViFMH3EPlbcn5iEO6woQaNNgWbGg+F7mJTd23
 VxPBPkG3DVq/B8C8aiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060141


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.
> 
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
