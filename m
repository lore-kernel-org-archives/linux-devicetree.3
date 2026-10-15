Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694F51DE16
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065939; cv=none; b=aG5qdu97E4c4dUQ6tY2lbF/LTfsvYCYlOCpRMZUH17ZFNOwnyhE/yUbnEi6xw6sPLo47AgTtulD6/1YGDC/55j14pQ9iadiw+h7L5Kdf8kOsLlQ4bLhQINZgZAYTkYXTrt3AALwfXYGo9d3rTHTwHVD0PiD8poSyn1t0HdBCYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065939; c=relaxed/simple;
	bh=M/RFP3tW6J/fH2HQRESbe9xsyMg57bApE1n6BVIlfeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4b0VKAjfqbYCpkHxzQpU4y4Ro9YaM7EtWyXes+hEiwTExE9i5yRRMDWmazjShJlns7E+Vt1R3Yp1vQ7NfA24Qoc8pI58IS8FKiV+7BWjrd69bHkLpsXKrP1V1J49s1mX1PeFp3E2qdHviUfU7JjLsxNI+p+hqDpsO9oHjfyiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mv+FzTc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4Oe5Esg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv+FzTc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4Oe5Esg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPh824100240
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=; b=Mv+FzTc9WBRENdJj
	CIJFc7nngedIb3QAP+juJRAhYYpa8IcUUXvv6KxJU121fyt9/VRdRyvxgNyAw7AA
	Pr7ajw7YEDcEZ6DDBRZvSitsvLGa/L27aI9yNLk2vsvhEOsxwLmdFYlUsriFupxD
	PgKr1kQ8NnUrUbSQ7JLv5HluUsCuX0JqGeVpnouK5FytYjKNLOZjBG6rpcLJqzf9
	I2KcBCtFlzaHzF5hZD9pQhbocrBHOX/EPU+ConMpljdRqLp/Z/krmb6W4bXw+tdu
	d7a8pVPaG1K+Ktbp6WoV+uHRt/pKEsa2SGzE2b1U2e0Ybu8DPr5Xmi1/kPi1t/Pa
	2gnuDg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8bda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:05:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc081f3066so12391137.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065933; x=1792670733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=f4Oe5EsgJ+23cnSujMEWwbIKb5IVFS85XBSPX8LZZAiD4U1yzHsF0QFp0kGMByom+S
         uNytV9nKMllh3ed8lHZdIM13kPRXNxDLe6LCcEJWEO+bmDHh57lB7cuypZsCtHtUEHhZ
         DwwFSiP6xYGERwaIKUJIbGeEqPaRWOVm0VRrwcpaf66/V1wNr2ElHtTKuFM1AixMltwI
         0uLHVW+qP2iIrN/yVedjokJ7yYDz7wrZi9lFguBpBOqt00sgUu1EB3F0FhcU4130uWDs
         HSLUkAwuy4jI07lc/ondWYhsJm4gNCsHghO+66KBb/IwB/Igpdy76uc4tUAyFEohA58F
         yf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065933; x=1792670733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=f2StNDanSO3+cXQUdJyDZrPBTqFxMFsyJmyAfEWfWOxCshizDHuhexmByYDeU/22Zc
         ZQc1lBNQGJsmSEKLcj8s4FUsUcwkKhAdtfiMAcMXdPhhWEfg5/yWdX07jwZT0tRaCuKB
         dpm+PSnbFdptIgCeEtbMjFja0sifLYgLRbsWMkVQ3AZgOuOCpfS6jNdUjaEFpq9oQXrC
         jTpmQTOI4f079EUcI3MLjpGkrR/bpL57d8xCeltFiY4/2gU1yqhGI+WMZ1Vl+lP/6pyh
         o5Cdd0MGZqL2Oh81f6/rQD8eImCFG607Q05VdvO7qEVIXL5mbypqXjrrJP3c6og8CwDD
         enrA==
X-Forwarded-Encrypted: i=1; AKwUvBwucb7yZUv1ccsdCpUZ3j2yrRKYzpqOgtiBBw3ULQDYAHki6iOAMWfzwFNs9/9Db0GyaXgoVG8JPg8Z@vger.kernel.org
X-Gm-Message-State: AFq9FYL1oCkaRqWfjqIVmUCdy7ARLYWHJQUp/NbgFJKRayXwyCu7YSX9
	xzPmgZwApQit7YHr+NwmLBjNeBI59xho1AO3U9VWuSJPLIjJwmxAi2bAwSMjknCm3pN2jlo8bL3
	nVki7AKfifFeM9kswpW8Hi4tN1Or2+Do++JSlMOTFGtWLLjwGRxJGw24JWIZrZQ4F
X-Gm-Gg: AYBFou0jK2zArqBdwSmJz380AwnkFeOnz2CdBytGxZUzWdE0AGuVxD83h4bcq3TVOz0
	7EPRzYz92tMNK6Gv2+LFApxCWin5ZyVsX9eFdcaEqSaI7GT5jAewwjKkmv81S2t5yGj9k5F5caD
	QHDaWQxfuDihV/VIl9E83dfP6jIyiuXz0jXqPBBgUfVK6qOb4U9Byps0ibUgV7o+akP35wOybsi
	UdEZ1xVgzRHUM5R/p9VTagOBy2UwpdRhIX9xPTq/EFsLB9oLDo8x6hCoIsYMrAlgJRoVG4pVR2C
	h/oHRHxFKdIYB7Q8KJO0CsW0JmkFWKXmxLK7Od++HE40Xkiivv6WJAaMQHrGhOb5enZ6pVQ3kmX
	a9/J1sCweJU5qtsqEPscSug==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998245e0c.0.1792065932657;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998226e0c.0.1792065932228;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm2510539a12.11.2026.10.15.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:05:30 -0700 (PDT)
Message-ID: <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:05:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX52YQY1KJ4QQ2
 I/JQbSx8f65u230oHGSf/RQJR4jU6cmhsyXKlVQ7UYyvEHe8sjlt4BU1YxayIkiY75cj3ZwmjrZ
 llaZi7IYLXNhY5swnywyKk1BTAzpLnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX+R0/Hk2xOnpe
 yrq5MqQlglRbTHXHc00b7xZ/eM7PgSH87F0AbCo4GV5DWjQeGW4/xacxX5EJ5l3VCol78l16vyb
 ZIjKRPTcrCcuFfrK3CEodGsLd3eEpT86evHFEagqtmMPuR3VvDtNgcyMElEPFYkS90rgUidI1/7
 8NxocgsRVxyXjxSGkHRz6PR6DUijX7fdL01PsEmmVFSEsW3wWC7PTi/A7OsiTFgcBEt44ZrXTWf
 KuhTFWz0oxj9f01uW7uWLzoiyHRe1orcjIMGRLW8i4j2tzyMy8CsiYY0NOJOnEIDD1bGeP6JAoU
 T5rP++Xvkj1xEVReVwO/Lopv2JhHlHbdO3ysEiCP3Y+uwfe5JpOfKh7xqDCblLshFwVAtxLWyLk
 X2F9klWB1hGSwCVmEHCfLbhkQqeylhDOsnejYBDzcncj3Xv7yc/woJDQ+BXvUYk4fdc3fR4PALh
 Hrj2PotD66wCl+P7sOQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0c18d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5QhvE01mUc9NbrqAj7EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Y1t0Scq1spVFXt5HXW_RvcaBKU_YxpTP
X-Proofpoint-ORIG-GUID: Y1t0Scq1spVFXt5HXW_RvcaBKU_YxpTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 4179427f3891..8b1bbb4052a7 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
>  	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>  };
>  
> +static const struct mfd_cell pm8008_no_irq_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),

There's no reason to not register the temperature alarm driver
if we don't have an irq. It will not be able to carry out the
"alarm" part, but one can still poll on it.

Konrad
