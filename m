Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B43DFC6A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419744; cv=none; b=g4OxWBB22598FpAXMbHqor21EvEZ4PaU96xBR9ykbJshWZKTJudrTuUJFM2hDlzx66h6aAqd4HC6BM02WMA503zuVyP68I6G8VmwiaYJUrEhgPL86mSwfWkuw8U+6hPdA3aifOiFFJxy2cB5KG7TKq6VyMYwbVDyENZZOPi/W9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419744; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBVze0yvJ98ZNT/o1FxuRq5Ex2NrCRDtIIPLUNZ8sDUCBJlEQ/jjmsud5WDLQO0TV2kQekc29cL3r5aQ+twmpJ4kOSAfMJfZXlSJQnpiG6mJc7R5bqDbOKOOfHe1ygzOkBxWciqcIAbip3vCHZbH0L2RjFpwFlb+TVWpP0i3XPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8/Lqifz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsSRenYA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8/Lqifz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsSRenYA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DspP3182768
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=f8/Lqifz1/Y0hpVt
	j6lzMZBbpvGRZkMu5/LDZ7xaQYCc5LY5uWXBiwudLTshmobUB50Ciejn4lJn+Oce
	sNbglL364PX4X7E+PeecJTPa1p1PCjVw9/NGa3Z19jdLwbUA1LSQwbtzkv8Dqpg5
	oKH9Qqq2Q604F8zUDEuEJYfYO+K03Pp+ru+YcWcPMd6A2THtshIFITXzlAe4uR/S
	jCJ2nNDL2FDQZVuU58jeKGRlRqNgItjMSn51AhVgAGoCLgYHUCuFpGeHSTbAMUPz
	/6tkQMWlCO9jnzIpN2vc6027afhvndC+HkHURzNMerS/yFHPQDVAEjwKmcZaAnye
	zDsHsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8ysg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:22:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so9880696d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419741; x=1784024541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=OsSRenYAfylfN5druYA16rXeHaEz1nQjRK+3VVuvM1C+X4x1Uq3kQ4N2AhvXs15cdr
         xEuNDmvpTi25wx8JOT8u/2DCcb6VdILdexHkpJaJEbVzCaDobtIZ7vHxPAf/fl5ytaLE
         wzY028RMJ77Rkl/HCOEwW29B9q9SGDUqDBD5aQ5nA/kgqJbhDZ69VfI+SxJMqB3cdUOK
         dSq2MHOyhfw3TGgEyHtk6yS2j6OWXWznT11pNnyyMwGKhm2lTVUGrUdF2s2BmWVLo4h7
         w7xLpdlmmtYBq13h+Heh0EnLzjVq6e/IOeO3flEDAgTsL9sjpqucH55v9YlY13bYxcd0
         qUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419741; x=1784024541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=mQWdJ+yaMQvfkOLQiALrZtRnRzHRXbv7LS0G90qRG3XGs5S+dgNWwXpRSo55JdCuWr
         dJjLkdhr8qeNsvmEGfv1ViZXT/KZHU4gIwgY6EzRl6MuFI3lI1UfGQ0loTMyl6yK7N/+
         Quu+YkjdDk5reXxIIH95vbcMRC9/Ypfo4CGepth+0f0HXr+D2eQJVzfqV6biu2HsqDSu
         7aGgAXvG4VvVDJefF18GKlxC727n6OVclpgRGLkOlusRQXkXO94kE8K+zXtIxLiTg5gD
         HxOM352K393Zzdl5JIJrirw3cdCuPGDHTozYoJBySpcHhN7Nf10kLEaupVkI79aI0Lxk
         pvWA==
X-Forwarded-Encrypted: i=1; AHgh+RqqXe+Y6hDimDNQ302ovJ2aDDD1Czj+8psW2rPbjd7SQ4pmykUlCYnLyr6NUuBTbE+DZqzN1F/PGT1t@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyEdJXTCsuUWvw6kSItZN1oo8MsRM/nM6bWB03gg/AYpuVEA3
	dJAjG6A3cC3e5YncPRXLLIC4NNaDZTSNUgM+vZKhtW0gePoXxkuWt/EbfUA7GGfvDvnAiVOihaJ
	Vwbx/HOV9iPkorIhRJtMkGJMEIJWaEqExVXxXjKrwgV72dlk2BjCbSjmTUF0/yBHpX3qiuRFP
X-Gm-Gg: AfdE7cmPEnBsyIiBz1P+1alN1pc+9Nu1rlD7ZSm/s0VqEkUC0KC9MUPG6busCXxo+Xa
	9x3dziVIwdqbRZgm74s0Ls8XzbYZp+BlG1HxdXK865g3b3bNvjqgTfV7EGCqeuOpLGFK4Dvilps
	i71bw32vwNrMkMof0H8GctZBx7wqEOPVZ1l/jODcB28GzK9i0ihBUOCbDOVyIK/bBOJp0RByPri
	gaemLgPSx8OLL/t1xjXBOZul/Y05FTFmfIzZzaTOw+3QUxvVynqWcVcntUjnupnCK+NJoO/NHN2
	bawf1ugFUzt6iII9dWOGWXWRM5BiHB0x9FJG35kWyc5TfhutmfZAuYbVUm6Nh4fBE2rjJD8nOy6
	Z+1ojXXY+TuhIjldLq5Ak2M4G6ovEjWZvSEA=
X-Received: by 2002:a05:6214:ac5:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fd3012fdd2mr19171426d6.4.1783419741294;
        Tue, 07 Jul 2026 03:22:21 -0700 (PDT)
X-Received: by 2002:a05:6214:ac5:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fd3012fdd2mr19171196d6.4.1783419740757;
        Tue, 07 Jul 2026 03:22:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm5816743a12.7.2026.07.07.03.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:22:19 -0700 (PDT)
Message-ID: <4f8e4082-3173-4462-beb0-079dbaeb1846@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:22:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Chr2O6KgIfynzoK-8feT5T0Gk4KNxJBq
X-Proofpoint-ORIG-GUID: Chr2O6KgIfynzoK-8feT5T0Gk4KNxJBq
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd35d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX8HqVhh6W7qCr
 ohoFAyNGjbjtkHosGN1g/2PqF03suyU3VnBeF4uz2y1OOGfCIHKQSqocvqlvAPk7TGo+IHdOQu0
 80+PlZnaLnZ9/6WV4fuHwvHZNCPE9ou9uLZm/D7woRm52hDfJDk2AYD9kJs6hbIOStlIp3H89wS
 Dqlu3tMvPyMvy5QlKOr0ioMbY9M5ea1lEZmcd068n/dy8AZXJdSw34VITcc2kYAEF8uSReg5A3C
 E3OEN5Lxb65X+kibXc8vf8viEDd+SzZyDD8ymnM8US+IJocOQbXPE7ZVXQ34AeCV+iNAQoGitf7
 9+w/yJTJAPxPJv14bRGQMStRFkswgK8ONmjLBG4ox0SUPGQtmDAizIZ6CgvhQwZIn7UHaMXhPoe
 12cB5cLPAWNnwcFKyq/oIPiYKEuowswcZYpExbAX6uYXlB5Sb8nBe91TdFFlEEWZeitL32d65Hd
 qjlixSU9WNW0p8LLhOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXyeXmnzKp98IQ
 CFhcH2gmSVhUd9sgELgSRNMkMSx1uLFUb5Bf/CYUhXsvmxSWNW5zXfYOEZ9A9/G6L8ya6OhoXSc
 1lNPfdmZLOvyM7KP1ND7jLMwGIAEEP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

