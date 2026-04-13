Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DF37F8D1
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069871; cv=none; b=pYx7tkMMvKusKNlYhPphaRvveLuR7wgju2h4nhhiSjoJmqA2ArmRufSbuBhkntGd38pAAzhNndF+ypUyrv9IP9cnOx2jpguMISWd6iz0UHZm0C7WmLitfbXMjw8phSWm86Kgol0BOWco+82/g5iMBzZAjw3omqBZEIxtWq6P4q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069871; c=relaxed/simple;
	bh=Xa47Ih2+joKTi5xGwY6jRk1mo9tGejqiWWwq5tw16dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vj94+qY6HcF/X7iyf2jovr9DpHzJC929AaPvapB2Kop5/jJyHWMxw4W7Bj5193qRvk7vphP7RtL9DceqPlb7yqWAJyKlfuqgoKTeT5G8xmYQUhEzLcKD5GQgW5E/f1fpEZU3twCJ/aWBiZQ7A+tGntLJo+mfCMfnMKyeIrjdwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDYb/7nG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCRfdscU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDYb/7nG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCRfdscU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D78wxw479777
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=; b=eDYb/7nGaXRcjPjn
	vJduO4FuN6FOax3jScBJ7kTg4zCG5I2gtq2fPYZO4C1EYGPh7zkcqGuxhPDnzTy7
	jOLhLyJxcBMyPs6XxiM6knGFvrbctt0YFO9QN3qQV18zWNsfM1jCatH/i/eoaNT4
	gEsrm2NEpBVk9UmQO3bgc0N/zt8AZmj+hGctIIDADaX5YBZ05WfKVm8xdMZoGphF
	d5XDjH4LCyaz/EsRtJlazRFQuYGmZsHdOXok4REpr6rQKz9OLjsbcunSxlRFhgTt
	njSj8bFiphOvEAbKJoymM/Mp2xOE2Zv1oT6J5jEqcJy91FrF4IjekfdKk5Bsekq0
	CBPmKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj8a95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:44:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca2eeac85so6476576d6.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069869; x=1776674669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=;
        b=UCRfdscU5V02Bxz3sSKUrZwGLLaZCeWDgmJK+Ftwq669Bmn9qDP3S6LrqL8hjYdQ3X
         wctv6GTVFosefUMAH0FghfyiIPgYNJ1srFJ+44WX0Z4etchg1t/yxCmWLwDrV0RLDlLo
         EYOVOMLw2w5c/ugDTyoAGtZJn0Hh3rmAOK9cPQCgbUAH81/YKq/at5JJgLSouVP6PPi0
         nYTswHmuo/ylJ/sQBh2Ca0TJp+y7LPQQQh1omIWGKGtq30l6z64aSTPJho9V7BzToBgo
         bpqeqgCy5k7/szBVtUH6/gni5PpIvwlqMpneFkpKmeCE8fEZMCL1gLcz+EBkySN/tlfS
         eeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069869; x=1776674669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9g1zvMDpW/df9uLnMfu0SsgzTiV62o1JoKxyAAnaSc=;
        b=kjbH3py7GhSPzullb60HmPOegh/vPLpjvOGa9xUjX6MuauciQpf442AFdE2qrF/ZJw
         rCdUnXMbZyQDGu7wXGtE7Il1nF2hSMWL/9mBIsVp/MPqybJrQ5N8vAfmd3NoxFNYVg5M
         q4avZt0UxMWPh/fBv2R359jeGpcFMhzZzRntqoMiiBrJiRggveOvAQ2ENCyXSnabWxFq
         /vBNWSBEeNAzAPTDp/QThcFDgjPGhuPMOUXc0liN9FJR+KouUJRjW6njUcJSzyQ81TyT
         pW6XgUhyv12PwVs6Jj4sKmD4FSmKXKmcSygJPVvyqcy+f+1ODlW//poHpnzv/wbXierf
         p2Kg==
X-Forwarded-Encrypted: i=1; AFNElJ+oGRncawQamePkUP8s55KtRe3Rnm6dnBxLI6xc1zJZaawWIEEV04Q9cYKXfrMmxoiPB7cB4r0Gzwvt@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjZheGA7zhy8CjGFR4m/3O5OWqkjdzZwApC4tBOJbAzXdUh0H
	pQ54cpZ7g5Lm351vqM09rJbXuiZL4xVTxplIN/5MxVVSxyjXsdtWKmApWNKed66MQ0hIZoSdzpx
	ZXaVEamz3hNdtIaoxSmeitUQsJJ+XBGnIO0uceg7mQRT//Nn65LI+QJWcRcVr3JeC
X-Gm-Gg: AeBDieu22vfI/v91eZJSsn9IqkDGuHiLrtlXk9Ms7WPbrr6tcYb1+cjVU/FYGSdHMbm
	GlpXkyFhDe183hsRdvUkOhQWp1LUsTsO9F7RcWbmIK0dQIZJbPuu+jWp28KkAfXMfGBmdrwOE7F
	wi53tQVP3kjYeWzJOaP26OlJR+/gw5KxNXNJV3cGzNdFw1Rdod8C9ct7nyWw4JjueHwh3uJcc+b
	pXlP/Kus6clSDBEg4tVMjmQ0L5qApY/5BkqGoUV3iyUCUTy40vufUY6UVxP1F+OrWwgCM9H0+Mp
	fn8v0NKwqqKNTq1xmja0OXZTRftHlv/0keEqws7ayVtB3CyxbFBxMoe+vcrEki1f20VU/qAYENm
	Lz14xce5ylD1CLVrWrNAA9aROe79PQ0tKf5T5XA0KE7QjyrM2EozCtkWH+5LTfvru8ME2TgHQIn
	qWH+8=
X-Received: by 2002:a05:6214:2424:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8ac8627aaacmr145221486d6.7.1776069868618;
        Mon, 13 Apr 2026 01:44:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2424:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8ac8627aaacmr145221356d6.7.1776069868194;
        Mon, 13 Apr 2026 01:44:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a13sm290371966b.53.2026.04.13.01.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:44:27 -0700 (PDT)
Message-ID: <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:44:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Enable DISPLAY-PORT
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NCBTYWx0ZWRfX6IJQfGgAUex6
 plMn5ogd9dbOrl/eGkIVBH7oaL/fBf6vSUL/efh40gtCrHXEHkt/OvMbMIIU3mIOW+i9jjofsmA
 Hm0Z5xLnq6kqaiO1M80EZuqo2EPiL/ty/2eDjXjiWVS5G/b4RowC1xpWBNR75TZdlzML69ZoB5e
 OnLQ+XlvPk0b2HWyXhkD6NWeyfy5838WXPFYoLwyeMDLo4XfPByy4YgiiqO5NUq9v1cMansZqWk
 7BoZ4Ec2SOutE2L72NBLnLPKu01cDcsP5HwhMpGq1NNwpx68e2Z4txq68peCbQlXRwKY0Rlp0cY
 FTEOehPj+p6EClr7kdMfS2QQD7q5+kOgfHWH8oZAbp2TYNRnBqD6kX6+v2zuFyUxty/UYw3nc/v
 ySDFcHOkCZcLMfRsPUDXDt0MhKj7x1FXRxxE4JXHhsY1a7t2Q2bpmH9dRXa4pnY7zyo/tHdXOHd
 7lve+VWxbQh/R2nFRuQ==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcaced cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=C7MUFykBl6qcWS5LoXUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DuTukcn78c1KaeEqVmvtiWIcEFJWIMh0
X-Proofpoint-ORIG-GUID: DuTukcn78c1KaeEqVmvtiWIcEFJWIMh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130084

On 4/13/26 6:37 AM, Kumar Anurag wrote:
> Add dailinks for DISPLAY-PORT to enable audio functionality
> on edp0.

"DisplayPort"

The commit title is misleading.

[...]

> +		dp0-dai-link {
> +			link-name = "DisplayPort0 Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&mdss0_dp0>;
> +			};

'co'dec < 'cp'u, please re-sort

Konrad
