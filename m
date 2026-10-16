Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4133F9F5B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143872; cv=none; b=GGdBM7ntFTB+qKtat8pVnZWYLKgpm5WuWUMUoz9MBIc9a34dB9H8H9gSW2aVv/70t/f8G2t33D2juw6z4eDkyMMJQ8i8S1GaJkzVLrtKF/ozTYCigsWf5AN7SOlurgtmRmL4ypSFi8Rjq4Uq7SX2QxfdCQknAyaQhHJqQpnACd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143872; c=relaxed/simple;
	bh=4taYD215YRAQNUPPxDBw0MIfx4eWRATNX145kiTepZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLVxmzlWBU6vWyHf0GoF7ok4kArqdDVFDV/5ZMuwd55flkAxZcZ9T00T5aLh0L/cBF2F+lRp0sUVXbPJm71HWrkIySwAdrDmUsNd8xf65bus9Z/Kl+VM9E3B7Fq13YuLQWCIo47ULSyCc0X8wrygI3jrVui6YiLfxw73UvA+nhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AC4L7wLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAeHez5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AC4L7wLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAeHez5x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m5M7760391
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=; b=AC4L7wLZXwiaim90
	ZImLR8qALtIKS6d5KcRZ7ykqQD+7IajzgXvYFitNGP3aus6RzwmzejuAQmcy/E++
	LX3SFwpSxGXlV5B0RVojwbtTcLmbKkv9Nlh6FLRxWwTD2P6XmC/AhMBI4JNZ05OW
	coCtoGb8P+57k6I8spmX6L1cz3uTWjvrKUnCBp3gUlMQ7JZLRLgWISg1PzDdLgzT
	xh6TGjYQKSZO1pyPIrWLCDNAVK+79nNlip0PX9Il9bFDMSgIJT7JkuPwYUSAm5Pw
	4NeDwY+9z/LgQp+bZiSwFsWPHsgbtO4g1soF+PjuhpUN5al65i0RZALLeXcaf09r
	a906Sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbumd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:44:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so13016301cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143870; x=1792748670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=;
        b=ZAeHez5xT4rLDA/uKhwzrs5v3fy3W3fbrCiORx22tZWsmznfe5YiFEUtk3xXpFfP6W
         BEiD4npg99uty2UTc4ufVSSPlEQEj+Az4VRPZ3FNDXuu3gI93P9waqdvGoVV//6o626W
         PO+3FsHRWb2hUiRUnYFBB4o4eMbyONLlsPDSyftkqZw8DcOJM8SnhExZFjqOboU+sjfO
         KKAqvncamtNsFkGMhw5Mle8Y+qdQlmDUqEK9NLF7hZDuthRzorEtEVqGGcSZq3C7uhvs
         PgXpDWt9yAUywK4fFUQk96gFLE4VN9vIn1L+Qxn60pYetg1KGwDHAgjwuHwyslpeU5Ec
         PP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143870; x=1792748670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV/ARIk6SD89rptri3hiETMTDQRBtgm1nsFG50VqYcw=;
        b=ifXSLDUGo+YbUrtakyIax5pCouFs0a9S7eZrSTwHa8/zW/3tSI+h9jwMkXUOeCo8Xy
         L2lzNXety+9aDQZhPh291tCuq5gAyGb2sqXaAb3i4dXbpUniZNyCNy7Mw3ZS3hHIIsoq
         2nu2aVIPfDiu7784KcBIXyChW0zEtSUMWMq+Lne2hftiuhRmw1tijcWQNe/+oAemuZJR
         kzu/NKx+9VdePWRmHoa5CGffGNWTY2Cg9nKW4oqP1sr54PFJ4/aMHO2EaEeCp5C4V9DS
         1rzJIpjI6R7i0hrSOHi42D9Rdo3Fo8yoqRMYeIxAd9u+D1KSGJG3dSPnYALH7QiAtf3e
         vdSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+EouqYqCuYVm8LwWJ3YnKhlf8A6EGUhG4mTbWlwA50phEs8hkPO+GcAFOrWxyNGu/58rrMKjYCLaG@vger.kernel.org
X-Gm-Message-State: AFq9FYLK9qtUyxclSXVBGZSGOl78ZwOpQg/0H33NXwdCNxj9QFDXNwhG
	LOWEsI5kP//kNP1eUq1hEG4cJ24eavkStwOFaLb5cB1/hrVa6Li2xiULEbNnXx+AygYevQH7bNP
	dNCfDtnAa0+DoWfm0BMI0DZ6IxllEgD5lpRnWdlJk7x3mFt6YY5k0iOOpju/F11jH
X-Gm-Gg: AYBFou1fUNKrpVvJap5ixGC4x6CqLn+9O6yiJDllgSmVPYLpLFLlF4XmKpuCyVG0K0Z
	yc3fPqP/JilfiHOXDOpK+htYHjGDQgd1/HhS1X3aUiYwi1LF6vHAbFXJHHNmj9DYS3mqKiZ0fVb
	kzB7yNEiXyG7xYAfWLQfWk2v+TdFsCXhdPSfFToulRVQlws/aAOW5ZSlq0DFLFULEhwpYEZ4IWF
	JL+X0l8SODfYJEbD9EKNZuI995cG2GPggmwjLdDkQL3CssLIt4yKFMnSJRrqMynSUZDBo6fX/Tf
	A7LjHJY1aJ8UWOvboGQwoIfONzeBm55EIw7Vn0I9zWVru5M9Y7+Sage2h8g1Djz2vUEMfc3Q7Zn
	rXiGutuXT/876UNWyDoDwsA==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr417895451cf.0.1792143869803;
        Fri, 16 Oct 2026 02:44:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr417894471cf.0.1792143868018;
        Fri, 16 Oct 2026 02:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm55116466b.81.2026.10.16.02.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:44:27 -0700 (PDT)
Message-ID: <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:44:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6v4qyudy4Ycow-avGYTMm0k3UL5HT5iQ
X-Proofpoint-ORIG-GUID: 6v4qyudy4Ycow-avGYTMm0k3UL5HT5iQ
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1f1fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Bb-5hBF-XxEgH8lneVwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX6XKFOplAFfrt
 4MVJEm+ehzbRcSD+jUvRheHSNKAAisNLaS1bMwkZLjodpkqSXUXn99vkObTzvMbI+GqtODlIf1j
 vz29OBneD/PSSg02WhyiyQL6EPLj8v8CW2PHqR3A10vZdorJyB1ELKh8lIs0D8lGYiYAj7LeCpJ
 omdhpDSCDkZjXyUwGDdadR78alGmOxP7e19/OqsCOo64vW6dSN4+uwekJAYxrkn22sMWfDTvwdB
 c+LXN69vEQrp0QD+xz+b46xRjRW7stYMyU7jiYMMOwo1YnjvjcX3v99zZEBpLwmqLCyVlvRrEfZ
 WI5M0+2Wl6LLb62IuLzkqi2qL2FPfnRRibcMp1bYvOkgRW1drkflyq9SwMCTLuL4xodsftDTcyv
 4t+ToRI6gKUEIgaaXxD8OljRFKV/KYR1n931YL9xXUFhec3FMyLwxnehMuTk+/gf67jnFLuFqTo
 p1vwg2Ew+WlnPvwMctg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX2G8p3hVr/HBY
 CsP7p7CkZuyMk3Dx+vYps9+y6MCA0Tj61DhZpnmGautr0HCNNQccLRXQZ0fjjLLULLNUXW0oyqc
 H2P18qlPLtpYEOiars4he/0LB7b0Gk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;

The unit address must match the reg address

Konrad
