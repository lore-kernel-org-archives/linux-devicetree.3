Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B863C3450
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109586; cv=none; b=pXfYStrVp0Bq9I8jBYhy4aF/Pz3yrbHAkMnQCb2/6Us797QuogdGipCdUC5nbtP7zJUzyREooqJivyFkhnMXpvfOt9AyDtkE9WGew0iBnDqF4InUKEyieiUrcF6XhWP44M/J0wMOib3HOgW1BfMa2TuI/3cakhVrWdibF4R+rAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109586; c=relaxed/simple;
	bh=wChYRMNjA6dSORzFLDNH0okxJr3czp/G7xUpK1tFHJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oa60v2YlY9VRNAlfTkROaMk0zGJp9+6J0q3nvdtqrM4vUJin+tYqO3ecwEfipmw0UQmTpUSf6wPWFsi/eNQ8n/PwbfqrFXO5gghb9vCx4cX+jM5juT/TvbJuho2dvqj1YggPQ42vNl1R+vWhuCYOVaKI2Judh7YkfFJQwAenQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z10tlFty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hluTuaTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z10tlFty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hluTuaTS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9f1aq2503755
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=; b=Z10tlFtybi0hut2P
	hmAUIihm5GkdjOT0m+vjbLFgf8UiSXDjwH1HPzdJtJU/+ePoidBYYzu6uM5jKRJK
	hRXzK/ikajWtD8CKgbA534P/bfOaU0Mtdd82jd6xebe4Jdq/nSy/1UNnHifw+fqy
	UKKxwJUDIDKcNONwsw7PdlHnj4H1JDwRJCcGm0+DnIvKFi5bjp1m4WCEj5oYwJk3
	BGHb0W0DZa84OHJcZGBYMH9UfaYN1SJr7zL+SBq/JYeaDOtXOj1kqshIvyY0IfAu
	p78q14WK+pz4TecWKoa93tigj5usMQDn7kjF5sHfANc5XBvdmuizLp+40Aj0/KYo
	DMbNog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk3276f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:59:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e59d97df1so78728885a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109583; x=1784714383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=;
        b=hluTuaTSvrmuHivv1YUhSG8Bu/ywyO/O3fvVQJMA9PQQO6fHwu3gObPj8knTwpuzKf
         sAz6xgvmyJlNbnRcml7oZrSCfnCRY4G0bf7xZrFzrZfFB6McYluUk7gXcnu3M6NKVgiw
         VxcVbQFc8HCG4KHXZsTbqidKP3JLcB8z+kVNpVhMFZMJp3+J6PwFHDwoYpKak7qlqUUE
         eanqbMTQTasSh8Ft4doKavnbwdnFwRltJgNAsYnjF7Pdxl5o9k15ZEsG2Fk2fRxMdAFL
         Ptsxfb3zi64/q6BUBgnp6Az90/5ARLgxGBd3j2LhB1RwPiUn4XLC1SmZFVlGn/bclQGh
         DYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109583; x=1784714383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu5GcbS1MXosHebLZpWhAloo2pv4JSkTLkcRrlN8re4=;
        b=Rofxzglwt6DyPFtdjo7N7xK6+vCqO2Mbe6cIUf+tsnJYMAuyWGRJZ6HUMfLPTtz77L
         1N7RThMqXaOKYWwbsVFREH/a8NbMKEhiqElceS60vu5HRQFQKSxVQ+qasCr8XKxGQHjZ
         rpq1AmZ3d3AWK4T9ChqDNyNJowyqn9H6DIJdF7sqsEZSAyXYLjnZOLNqDkwIMLZkjkW3
         JyWRi986DA2ak3JA4Ck9XF3pi8c9zYmxbHyVqIhHWSxMcoHfcF1Zvv2cqcYoEGWjIdZG
         n1I32KGXmbGS2aI+ubNSOdvTHH9FuKlmVDpVmTdDlXp0+ouhjC1o5o3qQq4rD6coA+hU
         s34A==
X-Forwarded-Encrypted: i=1; AHgh+RrkX+7f1YKq9EYLoSAsdMVlWUT8kmA/Bba14qwrh3c9dBqQJrzlyxTg5/zw1KBN7zelaH1VNCjJGvaI@vger.kernel.org
X-Gm-Message-State: AOJu0YzGc8J/Ab5xIjZmxxcbam4z97V65idWZvYVyEqEMche+VrkrCX9
	K8qRrB2Pr5KmM93noYbKfWdEq4AKewDQ6QlbkH2Z87g+Avuu5aW1xo9UOOmgwjbBskK+cd9S4hh
	gCvQW8twkFIlxfDNJCBzt9eXFBtY8ENNrSxUs2roz+L6YpErMkP7no2RNb4EErV5T
X-Gm-Gg: AfdE7cnFE9RyIciQZ0q6oNmW4a73pUsxjrusIpDIp5GyjtZ50E2R1KhugLSRq/Z3YJC
	ISuLPmauErS1+WOgRhc6bSSiTA+I5YL+OZCN9AwUmfyQGVQZe6yE6pQOgRoToOxjX8bbXdoBhQ2
	KTGR7AfpVolhHYbtgS08LHLfW4uqUE4pXiFTJnBgMvcxHhGFTjmW4UquJvqfCLkceNvAsVKoOZR
	vw2mKWoUSuEkZmF2V7rqpzJw3m5OBaYv8KZFlkV1zEvMQ3JpdLahWV0gMlzthbtEelhhROXFcbF
	L1Vv0M9Ezi7i+7bAg5lCmu1atrHCYzdycAXsFhbAPd28nIKQoq0z9ZLbnOlF9CLq8DOPV/Rhrqq
	iTLLUo/IFcrJojk8pI0Oiy2WB4uSm+ubMbBE=
X-Received: by 2002:a05:622a:554:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51cbed4c424mr131200871cf.0.1784109583595;
        Wed, 15 Jul 2026 02:59:43 -0700 (PDT)
X-Received: by 2002:a05:622a:554:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51cbed4c424mr131200731cf.0.1784109583087;
        Wed, 15 Jul 2026 02:59:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm904850766b.10.2026.07.15.02.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:59:41 -0700 (PDT)
Message-ID: <47748f07-b1c6-45e9-911d-b50f41a85556@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:59:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path for
 timer and pin regs
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a575a10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Cs3LUSVxlKGBK3EvLigA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: datOjdL2IOoR6Ds7sVsDJjRxeJhNuAg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX28U68wWy/Knd
 n6XgGNA877tROZ5qkPpxjeQnGp4VgmpTRmliVuN085MQ9LJFTCYYgZz6nyD0DVloKSATzLOLvyB
 sY4MEFbdrVS4viSZ6WlDo8QDd0vEE7PR+H2TorqVuwu0zHYL/XRqII6+NtiWE+tEmx2O2JgzQoC
 Bwsu0laMiRkKnnROxVwwVGGCy6YIDvwtZxBn3cjJLvW2Vp1jI2lfYUX+oeC9h3j8JYiViAx6HSe
 dAE6LLla8Ex7vW3Nc+L7bglzzCFq6VY1OlZO7SKq2t+Auav4ruPmsFJmXeBX/M90iwuAWXcA2cW
 5FYNITymupTg5zyr44+DPS2WKwWhykW9OJheSlz33pv25Ocmwhzdot186LhQ7g7U26yo0TvNmm1
 ES8EfssH09fCqe3wJrOngRQP0qXEFTH740H6G6LJrQl+9Q7kL4tk4Bdxshzuoo9Q9pgEOuVS4hC
 47VSFmZCilsfJUH/M2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX2RFu2ZBUh1+O
 459XRBgnXk/9x13H5tln/X3x1NCF7EzOQ1RlBJVOJeCOKKXh7MTa46r0L1mYrAGRdRSLM/c//pt
 3IYNtnSC97kAk/btJqpjcYzW23zpOPw=
X-Proofpoint-GUID: datOjdL2IOoR6Ds7sVsDJjRxeJhNuAg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150097

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> The vMPM layout starts with two timer registers followed by pin register
> banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
> number of entries.
> 
> Use qcom_mpm_offset() as the common addressing helper for both timer and
> pin register accesses based on that layout.
> 
> vMPM has MPM_REG_* values represented as contiguous register IDs,
> hence replace the macros with enum qcom_mpm_reg and modify the accessor
> helpers accordingly.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
> +				    unsigned int index)
> +{
> +	unsigned int reg_offset;
> +
> +	/*
> +	 * Per the vMPM register map, TIMER[0..1] starts at register index 0 and all pin-specific
> +	 * registers start after the two TIMER regs. Pin-specific register IDs start at
> +	 * MPM_REG_ENABLE, so subtract it to convert to a zero-based pin-register group index.
> +	 */
> +	if (reg == MPM_REG_TIMER)
> +		reg_offset = index;
> +	else
> +		reg_offset = MPM_TIMER_REGS +
> +			 (reg - MPM_REG_ENABLE) * priv->reg_stride + index;
> +
> +	return reg_offset * sizeof(u32);

I think this comment is superfluous given the visual representation of
the register space just a couple dozen lines above

Maybe this could be a little easier to follow written this way:

s/MPM_TIMER_REGS/MPM_NUM_TIMER_REGS

reg_offset = 0;

if (reg != MPM_REG_TIMER) {
	reg_offset += MPM_NUM_TIMER_REGS;
	reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
}

reg_offset += index;

Konrad
