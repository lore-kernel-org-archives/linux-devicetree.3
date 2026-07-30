Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFE40B10D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431055; cv=none; b=QQU8cPnWVC8wrAdB2MqZLQQ8iKC00BxnmoykBmjOKRk4Rq/9fjApjDs6j/KDnI54BuNgqeljXW1FHQecyX30EBzr499ZfwOoZdu1ZkKJmhCuqcZksqRi+GT9soUO1XpueCHWCheyJs1N2mwAVwDFqibTEHTWw1zCuoHQp8EQwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431055; c=relaxed/simple;
	bh=w4nxZ4t9jToYcjWqK3dqjw1l+neGGSxMyre0r+Uepz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3eIMR0cRtoMXJTh7e5NmZRhZeEZte7z1IAZtNXJAFkXNj1RugENTvKRwyo+qMt+9IX5MlKzWAH7sbjGm1e5a4MgryWpLjRhOT5NCaceMTRamt+qXOiYPyBnkFRC32jQd/7/X0OK9eXr7as5aVs/vc68SEI2eE8vzeXxMW1Ejqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=embT7qVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Izm6MvuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="embT7qVx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Izm6MvuV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWp7w1238746
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=; b=embT7qVxA+JC3jja
	dONZn/Nb8agNVXRh4qwaVMTGSurrtt2as4X2Brqyj4Pl1i9NLXAcEFBL1k4GRwp+
	OpKpY6iI0ftKGT8TiiQwNAYM9QCX7/8uE/+rlDuh4vXDDyUNQJ/PTHqbRs1m7CiJ
	Cokc0kn4ZX2m9wCPGhyd462HusLWs09h7Gh7RLUQM065gEFNJvRfUn/MdXNGYrMp
	HgDOAI2YLUsCWlVSdOnjMaI1Gk8S3oINTfl7/4sBwjSUwb+iY1RJjZLMEviUvqzj
	S5Ypb791oFu9oxoGWdfng4MC0m3yq6f+AlSdXhmvyE31SZHcbZmwtNCeZl5E1I6+
	7OMSdw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38rbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:04:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a4372cc105so19281b6e.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431051; x=1786035851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=Izm6MvuVY6CxNndUBwVjipmQgscc8W1XQJyIuQ2szZ64SS7fBAWBgjO/UmGLdwVzk6
         VTUsed5skOpfb8vAOtLqOGxWTWdeaPq1f/R1AzIDEi+/anA5b4yBp5i0f3ttODizwOkh
         Q7IHomfl3rdmq4w+bOkC6JQ1u8qvPsc8JqpBrPRZ45NnwVSJerliFrxIpl2qCZor3Lfi
         q0IlloVmksLxlLMrXKB0wA5QkObVMdLZ3NQ/GbVdL95Zad6EayTLxWP9li+UHbwC58bU
         y5pSLhcyZDHDyr5oNcEH6J4iLtUBviLeE67p5HdXo6MKxtGFt1vCBFtYavTVhkw4/AX/
         VNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431051; x=1786035851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=MMOfYhLAPoiSr+6RNtAWTo2GmBPBuPfR2gGuOm1l2Tess47TBy5dMQPXlJBSk5tVLg
         rQ4Xfapc4qelburOicwxQ6s52SLemLcwyQSyr4HRqcO3dRf6/vfbYSsLQp4/+pYw8/HU
         F3MiXLhH1QAAXSEX8ILD8Qtxeb7+tDlTH0CV25Bc3qbEkOOR6xgkOPemufD+WuRx/beE
         fapPF7VejaVUQaHfYjrteRF3+w78LDwzS3lNzXV+30NQPDIX5/BnWCZDT5SzqkQTQcXK
         ak+ffl4v0EK2ii4Xs6z6/Xo2NKMUYG0qPrKpXAR9VaHO7T9a2NbbUX+YadlpW/IDgc5f
         yzww==
X-Forwarded-Encrypted: i=1; AHgh+Ro3fX/gFF1BE4im51R+euOaS/EY8gmGUiIwGCEpyA6KlpDaaZdvDegQJxRQNmxbsl6eJntR1frFV1u+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/dwyHoBkMPWYYCYmtFN2a1VovXybQCWCkkN0uTsI4QYXbkm+
	w+ohedzQs51MdyZn9f56Jg6VVzCvWj8WPfbyaFKdC0WwahLoAyJRz0D5kurG8n3ig3HU2mBTdyY
	O8HuLuCqH+5ymN4Wjk648HD8GVHGm1c6Lm1dFXeAywWyAXL+U5pl0TnHXoHAD6oDm
X-Gm-Gg: AR+sD10Xh+s6BsKs3t0PeuY5Pl27Mun4aG+BjfHMBdwdzczdDlPpcbJusLHY8O0yOWj
	IFubBZ7t1xTr3aoBAuW2YETrXGT7MC2JsJ7tFSrkMPvshPNNg14uMeaKt9lmkDJaPMHtdBrQnFG
	i0dmb7+vzbKrVBdVe72M4XaU+SLSflSj5n1/m51KSmVTfruDE3n+DtJs7l6A1nQ2VNgTlR4obBF
	DqsE1N/0pfMc370Y6zuSRylzs4R+ReE50x8YUxNAcPW3aBc/O6s9Z384LY5qdN7etsdwh+jwDI0
	jpZPBTCQLKFV2cLphTAvASlupMKOPM/gnZGQVZTDQceQMEbWT8YTtUynHSLI1cheG7A/hxmeYq3
	QxZReBheDvTRfRnKKdpPRS7ON
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176954b6e.2.1785431051323;
        Thu, 30 Jul 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176871b6e.2.1785431050733;
        Thu, 30 Jul 2026 10:04:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85dbe43sm93327666b.27.2026.07.30.10.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:04:09 -0700 (PDT)
Message-ID: <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
 <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b840b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=j8X-GRWtO0FzkeSpfNQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 0WXYMY8LU9g76ALhzPgssiZOGXZjFwG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX4/irUln8C6OR
 MyaxCowjiKbs6RZwlegxZCSVBfHkL++xhPYqQCrtAwHmjOq67LSA2Rx0+bHV+kedjgtvXiW43VL
 UTyJeyNqeEzKKae14wyanqy9EqgfcSM55qMremR2O+DODwHQrvlpVP2W1mut8b+NT6asNyRfj6b
 MvP/lDbwzVtKTXt/VXrBYo7AVxz2gFnLnJYblTCtTzTgcGTCq8FmyyxWBAbLTYLKN9cBtX7uAi7
 erFytsKhcFZKeIGWHH1D4W/pGh2PMn+bB4Z70fV//qR87ybjt2qg92VTu3Jld2K+DBXHh5WKlY8
 RR45167VkjAeM0f2W0UY8wwmkcbDU7gwrURBNn4lfj2XtlNFcaZq7APbBA5J79WNtOqZAOdNBP+
 13S6FZmwxNUlsodB2ULUNu714BQqanhhMJQ38+6Jp4ayA/Ph/U7M8QK+Z6lL3D88qBD4RGk1l7u
 0vOplbZ30O1rGbJiG8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX/9hEi4kwQwzL
 GZA7KKL4RQjbzS+enHiUkHf9T00oRiaVaxuBu3T7w1dfF8vdpzPX2fdx4S0mHw+3/Du0XIH/jfp
 ghLESChXFe5Lp/P3/UjNxo86Ss3Qtq4=
X-Proofpoint-ORIG-GUID: 0WXYMY8LU9g76ALhzPgssiZOGXZjFwG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/29/26 3:03 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the EC command definitions and handler function for reporting the
>>> SoC junction temperature (Tj) to the EC.
>>>
>>> Discover the platform's thermal sensor to zone mapping via the
>>> qcom,tsens device tree property, average the junction temperatures
>>> across the mapped zones, and periodically report the result to the EC
>>> over SMBus using a delayed work item. Serialize this and the existing
>>> EC command sequences (firmware version read, thermal capability read,
>>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>>> since the delayed work item now runs concurrently with those paths.
>>>
>>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>>> racing with the modern standby transition.
>>> ---

[...]

> Agreed, will split the devm_add_action_or_reset() conversion into its
> own commit — it's an independent correctness fix (also disables SCI
> events on partial probe failure, not just on remove()), unrelated to SoC
> Tj reporting.
> 
> On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
> its threaded handler still running) while the I2C SE resources are down
> for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
> around suspend/resume here and follow up.

I hope I'm misjudging here, but if I'm going to talk to your agent
instead of you, this is pointless..

Konrad
