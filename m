Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241443F8B5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383896; cv=none; b=Pbz2JciSsHpV1+6cguKYSRxedXAi5bbq22vJ56fBKBJycx84d9GfJIQl8sxsknjiSSny/kPxw+0r+4OzUWembvyv/17BlkNpdkXIoz/PnaL/VoEPIKk4nT5VHEbceT4gTaGJo4S200Lkmuqk41vb2FjO2/Uc3lZ9GWemOGwuLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383896; c=relaxed/simple;
	bh=IQcctOlp+ZBNyk+MWt9pjtBT+n2ACcBUvj8zTzblXDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ6H+egrK2ZEsKKglNixsPRoSIgU3dY0LqMt7mqdEsrLhwfvQXOmjsWwRVKJFIynX9GeSUkcW9LyydIOy2OYLUO4ubcGQlI/5jZbncni6E67J83wvviL5fbEHglMVfrSl9KyNyamr3wZqoqNBaO4T5d6ixnebu5+NJfGI0vkwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEaniymq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6axgOS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEaniymq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6axgOS+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8hY530991
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=; b=WEaniymqpGs7X1a1
	YXKHEC/bDwWWQU4ynDdBe+ExsVgbOrk8zK2zpesiiUJMlv/6dPxDjWvWp2/dQJ3y
	8U1MDOU65vpZdnK+lHMxSVEl3tNF3/a2/sNa5AHQx15aZaIV2QHggenwhl+Ze4I8
	2RMnI4/KGgHoJW59O09HJomooPMcZ/vltZEAgg6bdE7Y9CX/FdRnYG6C1N/Vgbq6
	tp6SYKfA/3uMfmKl+IvmdQbRoYxyWDzk6xnjYxoUE6d9t3iHPmSday/s480Wqn/y
	GA3/cxRX14EhTF6JsjgSdzMnbDPwHKWHYBt5TQL11xIfmn0+ZNXGYs5CJHWYTod9
	Dc3gCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst4px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:04:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so48619885a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383857; x=1789988657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=i6axgOS+TneU4jG7eHWgzWAfsuULk6n17uJmZ3IKV8tFqhiKIMJqKFR8nN68A9TLz1
         cUvdL4LEmX6CT0QRBA1fjw98wLbsoe+taX6SdTxKK8GeUtmJO7PRJFZYWUhV0rJXqf6+
         DPSirbfTO9xOrv3cfrCjCvgYjNezwMDcNxvnwpE9fGiBLmQXTdqzN84sl9ZLNh6JOr3i
         hKpZNSoW/I16LybIqZFhZxd1316j9ZvYBTMLfG3NwEMhcSVWXku+odFRIqOVViaTYj6F
         hNNRgKvZs68jojiSZJdeQe+/4bnILQvlLQb5Id+RMwngQ8YOI0OvWfdXqB1VElHvl/cH
         Gwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383857; x=1789988657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=Id12pnn2iLrdDnN7nB3yxLgEYKX9APXxnLR4vrgZFkPY9v/dmSgw758Hpa/UE7oQdF
         vKmsCg0aD+akCi877DgX7DveW2trZ1aE6QjU4lv+4QNOU5xp20Ri99PbtI0JD0RmEtB4
         kJgEO6TcXKmAXmo7CWzU7DWKY80t8+j4WLdsGBnphoYx7av3drlpIbsIKPzBmNc/i3Wh
         o++BS29VxLH5B/i6nsuI/EdHLonJaAHAI/H4bjISE2miR3oJXX6sVX+mlw48ZfriIpxh
         933q7KntT5wyTi+prBdN/ynZAwuTc5DCGnU2dX0yi1hc4ieWG2gXfRC5Jk55RAfoWSRf
         tk2w==
X-Forwarded-Encrypted: i=1; AKwUvByB5c2LlSpMuRuGuZaWiLaempHWFavneOCBwIxVAFfsoQNzxGRwpsM64OvrzcRGcfsrRgqDInhRdj/j@vger.kernel.org
X-Gm-Message-State: AFuF++mfL1kzqv/5HkwmUxDbsVu+yHRNTnxRE6R4E4wV5att7MJb65nL
	HKDfO6odOhhteQ01xakm++pPKlrRnOiuW4IgXeopFgrWxfYhYVVU0TCMscoF13457phJiMgVU+r
	CdUjMMO3x+06+aOrpnLrxgHhVvGqnw1Am/z0Qui6nQJ627hmiKlDK0uDH04x/KAqU
X-Gm-Gg: AYBFou0jQaVdu1OLYpjFi1uqP++KUyknrN3GOejzypVfhirBZmTLjTe1gcwSG7k4xmF
	5QKQlB0nATODqpF1VDy/wXpoU7QZytg4wxMDDtyaz+bTjRYnlJi/p4U1z7NAsZO3FFBm4x+Hdrw
	jkTfG0S8POjjqJjMdTqUeco6SrVhxE5nLvmdSfYI5TJ5lZ0hYqu0GRbQ8NRiFUkSxOy23rm+aIj
	Pmi6+ACgKjA+yM+L4RNqcA9gw0/+KPWWPvT2lR3S0B3qnBF2iX9Ts8DrDgr40817ge1FFGvyRDd
	a1jdRY3s+9/FLUjqTO2HbZHUpfUKtXaLg43dIXQ/B9WDTTdo2/N7f4vp2tCWgQVf8Ola583Ns+t
	J7c8J8xMi0jIjdYKcUPOZ1A==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203889385a.5.1789383856923;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203881985a.5.1789383856403;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c7e82cc1sm3020828a12.0.2026.09.14.04.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:04:15 -0700 (PDT)
Message-ID: <f0409205-b5bf-481c-bcbc-45e56d9b9bc5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:04:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfXzD7H4C1CypF7
 w1YYFKVxwvinIk9VWvtMLsxO7tMLxF77ATKH+MZiaa2g/i4KabuPcGZrW+Esj1L+qp8FSa4evwi
 E2e1Iivu+LEaXwDLyoe/k2VLsVQLeLp07Oujrp5qSBBogmEoLQM+blmH0+nbgaBd0xe+x1xme0T
 Zs/N5Q7dSztg0a7Jdf33O7yElWWO62oPuNbKLgdIqLWMRnOZjNYOtEC42bWpns1P1ecH7s6zJ2z
 bfc2D9icPG1QNd+64s4SfKeqJ/PrYvbshF45IZoBagiJPsrNQcP1PDrR7bAxG86rJRZ/0SSR8cQ
 FEC/ye+AZa0qBHuh+kPW22UPBnJ9DboQGZyO42/4K7dJoqSTpeZkF7eFMKSH1TENTniQX46iiV6
 y7d5hP5ClWaDbu81k6FoDzhxjgKfuVaodUgH0UGlR+Q81WCAZ2bW0/VlTKN7E221dHqfpW9wJ50
 FwVY0qKX3vtXyOx7yxQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d4d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: J2LOcCy-l3xRFjdCm_cn7sGrw3srmD2X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX+W+UXffZy4fu
 YJFpYv7vxOS/gEVEpgi8LozySGoTDa/XZot8UORIfGpUWn6OXlxg1SLMfoHh+ce5/E7FeImwnlH
 7O4NpYp+3DW7d8lf89i7ENZTX9HVuN8=
X-Proofpoint-ORIG-GUID: J2LOcCy-l3xRFjdCm_cn7sGrw3srmD2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/9/26 12:50 PM, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and bail out on failure, unwinding any
> previously voted proxy PDs via the existing unroll path. A proxy
> performance state failure indicates that the requested OPP is not
> supported by the underlying power domain; continuing would leave
> the remoteproc running with an unconfigured voltage/frequency
> vote, so treat it as fatal.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
