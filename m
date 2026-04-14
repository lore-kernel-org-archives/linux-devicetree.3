Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F93E5EC4
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167926; cv=none; b=QzmVeeb0vj1OKDJl5eUPHL1hYGlBcAOlAHwSPCWHvCV9kq+G8LpAn2ePMwgE8LxiZXX/k39XfXeV/LsSTz0hOT/QmRJ1ELzREFCIM0eDcznHnIMZKTCgE1dr0QtJDueX4P6cVAHLCLyNORDkD7E4MsQPyKTzrT8PBgExdvhwfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167926; c=relaxed/simple;
	bh=EEFObfF/Tpk7ryEqe5WG4MfQjoGFMoxAfSFegUKj280=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIUG1tz2A0HZlX1dNq2xcidtmC1ygAwQyjsyf2JCWa55HxUoqJtAwa1QLB7/8O+cDyohLdHyYas/RBBYD4/hK8VR+K0qwUtahgEZP9IYRn7RQLXbzo/iQD4+4nCLyGvbMJ1ze4f8eN++hcpOdSs9iDO/quRV35JogHeITBQvJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCkcZuQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFUXdD+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCkcZuQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFUXdD+v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBJx3f3682698
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=; b=PCkcZuQIsktbyp5q
	IRuvFaQR0gxX0Bl61kMFDGGSE19hkpxiE87+A0dGLE56bRs06akUveHADWL9zXQK
	P3Kr/G40BAmrHBx8xQGcxEAj9srSiMGecpOvqygF4+qDy/tvTvEnDyIqSNIiMFhv
	XQSnSqUH3CH+e+EPLbk4Jsqxf113i1yaYF3/shNEt0QtGXc305i5fA+s7EtsD19R
	ZsO9aGWBlI9cMUpc1ofkgLcO/kHxesmO8QlEmrtaqnxfFfAkICe7ytugp57SFhe/
	DcMif1Vn9FlGgVfeXaMoZHSgWs2uk4k+YtaKaWhjqBWtJ8Ean5GShqkLA9HSIgFD
	nAGm7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d2jge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:58:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so16962741cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167922; x=1776772722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=EFUXdD+vwrw76LFks3ofuP0zCTR8mIYHdbuvht7cESKbtwr2GowmV4eElhDuDWThF+
         K6ulpJ6v25YKTJg2nxpYHnwrN9HVn9rbwfnV58KLYfWRl87rJz9bzZZZntQBdv5Mv72O
         umqv0rxFS2advQV1QMrYIUgdmsPH5bD7v81pum0baoiX3uAclbO1OHjeOcDL6IHA8ClC
         Iwi51x0kcl5HCVuHgoDtDm1aFgUv07NnAoeRM1QgedSVxm7LZ9iqR6jAcGzrdlgBKWw7
         2GYYS9gc1Dt/b2P05WZwxBQyAT3KsGA63lviGswiP2aoUix8KMHVsnb/w4zvnyC7mrVj
         lCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167922; x=1776772722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=S6KtwXmDf9EblZlIZNLoH5JNKSdUpXvxDaF0+gKUgWPDeGhXjQCbReQcDfAh9UEC5S
         qohoCJmIYWdmojiYKs48T2X4IzgdWj8XElRvdtvkadDCk0jAggGnpJfBZ/QeWpasp4KF
         vpD4UO4jyU46jXPHtXUYJugco4IkXyh0aAsUs8q/ok4oolrR8HCHMm+wr4oZbIsZV4G/
         ToLL2KIdqXVCUfg5xPSttpO+pbilll8IX6i5jo8bZUvH8hZLzMqYHSiJQSbMFtLtYIRX
         mWBg2mrvT2AdpsxmOFb27fHKL/vMdSGFE20W4c9fwDfCb44KIIIgWgy658gL5RCjIXxJ
         yNkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/16oE+CBcruyQeFLYeKqp3fGc4hCRFLu4TZTUuTDn1kBPAg/xfLcqFPd1QGpCzd0g1bRNRyWTyd6Qt@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5baoMK7IZiu2l1sd9/a33apXhcYZJX/caaTSZEnKPKogO7xV
	nCekNNxZkhnbgX8N86ciJz8j+KhaAPlq2HGklq66V351Cv7zqnWvLGjTeObACHZkztgJto0/j5Q
	GT9O8V5/dZv9um8nC2z19abI0fzvS8qGIsVEILXACnCxbiaa0nRqmQl4T+HASGAZw
X-Gm-Gg: AeBDietRyoH8qUIlASDE54wdQmDWOvYXuTpWDaDXnkMjgdexJzNMhcA4Qrd6gg5uLIt
	1ahJQi3CjUIHPUIBC9Kfq0kfZixfnPmt+p0Lx0dR+qbw9vbcJ2dydFUtAth4RXGT1J7uLUrGlOS
	rOz4g6y01+D4PuvPVC1Kswaow4WMxhf6D5tEF/oWyonYdLDvgy7oLTaCfQCJtJjfKOg4VV1mPfI
	IPgffIrOlhMMIxVKj+nhQAnJr8LCfhh0rvlUksS4NulsG3AVUg/X20hLuaOhLQ5s5T/ipfoZu0I
	rYS1sGpXXC79n0xa4hqsXWbGG4UREdRo53KuQFl4zUYdlcitdw/bLAXi7FpDZHefCgw1RpPiu8+
	DiYnhgDrhJsvrqnHvYJDrerXKNWBgpWI2RQEFGVtx1J6A96ztGpG6YXcxX8lJvMWRbqcYbrOeQk
	e3H+VJwYCWbivC2A==
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182739061cf.2.1776167922350;
        Tue, 14 Apr 2026 04:58:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182738731cf.2.1776167921894;
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67205b178f9sm150130a12.29.2026.04.14.04.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Message-ID: <19079a5e-655b-4099-8cf8-650e8d743e49@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:58:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMiBTYWx0ZWRfXyFoa2SXT3V6C
 9bOWM3nh+szxdUjyVeGSAMCRwYeE1fHd8rLBw5/k4efpzUyej3lZdOTGrv0BD25ZSaUhB5JL+yY
 xwmOulWB4QND2QcXxzNX/cYig3s8cw0Vx0ebKmsNMyq4DW8RlnzorsqtD6Zst/K2v4CopJcgPJW
 LyqXL3C/DTvjpplzff8mDsv+RyzbILA8hVsPX3FOwry26MlYTegL35b6RXRkcRUcQibqzztktu6
 8zT0i2W0BKZMHt6inbBjFxKzI6oPSorUFKBXmt39fRsQxZ9Hu0Y+JWssSbxOejDNRCCtz1HQ2PU
 3FO7fIosq6Rv0cY6F4iFIOUweWOptE5Fcfh1ZLx32158ae4MyNk4f7upUqT8p/vuhOwO7bK+E/v
 /urMUrmGBcOHM6xjYi4+sc8SkTixKtTSgg2FNUJNMBaNkD9D53h2ZOBzveoySgYJcMO4Bd7qG+U
 ZaWhpTG2ihV1rbPLawA==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de2bf2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4xeVu9ZCkff-2oTzBxcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: fbSk7pVCq07LhrdjpmrFgZLOzIBR5AoA
X-Proofpoint-ORIG-GUID: fbSk7pVCq07LhrdjpmrFgZLOzIBR5AoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140112

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Enable secondary mi2s to support HDMI audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

[...]

> +&mi2s1_data0 {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&mi2s1_mclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;

For these pins in their "mission mode" function, do we expect these
pincfg settings to ever change (i.e. across boards, will the drive-strength/
bias/output properties differ?)

Konrad
