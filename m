Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29306429802
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688625; cv=none; b=OnFN1gYYWR9P1U/vT0sE+OYW8EGio3JpV9gZDW/UxAEIZlMDbqaAYlUowJ2eYFlyYLUbRJ+o2PT7GfNJBdAfzsk/PJ+HEgw9KR7kbUPgTrGcSG58BIxH7SMIcglZWnLAEcqH7bNvtXghEJ157uLpHfdiMx7uKEXAZP016yTeI/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688625; c=relaxed/simple;
	bh=YamR9oqNlWWWno0Tn6QJ4b9+RoZA1dn7WMh0CvPPxrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzJ8fvhfVcK2+o5Gp5pvqNJuiks5efqvFWpjRxpS1GVbZT6WCzOTkAdaScwm9cpG194adsuPZ/xV8VBChR1hQb7+CFccDd1mU5CS6jSXK/pa9HGsJ1lbrrWI2FDUeXeFaCIf7K6AIEqKt1rR6lsYB/oIO4yr1aBnORg66gNQvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtS8wmN0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnbWgqr2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtS8wmN0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnbWgqr2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmW8u569271
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=; b=YtS8wmN0NnnHqnU4
	b7kNfYw2IAYA6jymBvG/Wwscu8B9i1IukVQUY2N+TLgqnhWQv/ihi77mwDavC0eY
	nYc0kny2+2s9PZkFmg39wDDN6tS+Ly/9tb0PfcidtdpmCTLekWiZTHeRH2kSp2Xx
	L37Y41sUyLsgpeewQRUAk3u20GlZcUJCskB2kJpNtGwVXIPkxJICjVntMsb9kSnl
	Rn0KwnNjfVrgj7BlIPY+tSR7TkxqBdDkO0oYElY7F7JozxHqQAkXJxx+X67xIcFC
	WNjLVDuVmaB95MoPqBIVq7cjhOoEGMELe+nAwge13deUeyWSHevzpsG9Er49zt6w
	ITDXfA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8r06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:03:43 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e4a02796so231894a34.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688622; x=1784293422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=;
        b=dnbWgqr29ygNne+Shu1YsyOeiFy1WE/oPi2JeScaN6RiL3ecaOzZL7pVkqPU6ZVbwO
         I/3MavO2BpVYRv5Gh35ubnV4FPbhG5gDPQszWXubGAkOJJO3tq4Qxa6XJZex6gLv7NnN
         UKbMZ/uqsEpm7/OIhtpkfOBmfT4WanpY3//nPGGTi5VTB7sODoN5GyOCsBhBZ7B2ez3y
         zR0Dd/J33Xn6AGPm4OpkBlVJhhRSs6wJtt/oU0CdaQ7v4dhWEyvrSLigABICfyuSJgUz
         EMJfq8yfoI7F+f/73ouGZzM2T8Sq8d8uwpuyncolfOITV+t05DaU3UVRTNu0m4znG3Wr
         YxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688622; x=1784293422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=;
        b=GmR5Mz8vG0+o9s5u8U4e4RklcdhP8k3uVOKK7jYvo5L/HETzhjdzfKeER5ErPtD2/V
         bzY07J7wMjoabSeXgBVIoMeBOQpY10J9zWivnoKsae5WWwo/GBw1C4+mJCffL0YvsEye
         Ei6KWLwe4jC5665MRZDub8tgJBKTcnhjQLqo/k6vK6fHIy5UBi9VMFJ9ZOpNzRMgqcuO
         7tpG3Tc2tuo+NMHmMgEKec2CWjDIo/Gg8u7XA67Q2yjbuYfZLtud/6EP4BpUzLkhUfq2
         G4reoll15GBcnxvaQ8kbbcLqMk1Sy1xMSCh3DcI8ITGAXxAjKcdDPbpN9BuFOXunkwSu
         hGUw==
X-Forwarded-Encrypted: i=1; AFNElJ+z5D/TUSHaSGSwlf5zlI5iOQJhfnGrynv7yASGRpoDtcGHAnl2916I8xWsKXgfl1a0XXlZe6yX+RI8@vger.kernel.org
X-Gm-Message-State: AOJu0YwfASDPP8SHK7Y1Zp3Kl633ctMOw06O84Wpmcoim/Wyymdl5mip
	FkWpEIALD3G1P7ic3vKMKMhkoaZSpJot0UosfLmpn+EyaAqIDvP/3XBoBaJa+sd2d+6RJD+p9EM
	YBnXaQV7qgdlRsTP36Rq8288LmpTct+GrHIZhsJWcAfTQqjRQmxEdjIcWxrsFL9Fw
X-Gm-Gg: AfdE7ckkSLha3kdRn1J9hv3SajYFJVBEcURLZT92owjT3Ay7pjgY32YieCanRTfiZWk
	rVCQpkuqFova3ZxMqQRem+EQ04OBbekVzQC1IVHNy3B73P8VmsWxFW+U3VSWi/kcS9/Zu/gUgKh
	8pTyYLPkE28AxqXi08y3XttKrrJqnudda6sMeeHtsRKv/d2hKU9snGz4Ufu5QRT6bT0mH/bN9tb
	qGPbpPrZ3f9oQp+jmOdRDMlA4EDos/h9NCpm/6SPFn1c87gXFC0rG85FkXplptA8dT6oJM/Gdkb
	yZgiVAuOuw2FijVCn/GrhdvcwBVyuJ9iKMnX6EPPKweSYDyHvrPX1s7cA1zJIhX44dYMCmYYikL
	F9umZN6tkGLRbLO0UVmhReyyyaSs53yJ9AgQ=
X-Received: by 2002:a05:6820:179:b0:6a1:818c:ade with SMTP id 006d021491bc7-6a3790ebc63mr2866977eaf.0.1783688622363;
        Fri, 10 Jul 2026 06:03:42 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6a1:818c:ade with SMTP id 006d021491bc7-6a3790ebc63mr2866947eaf.0.1783688621765;
        Fri, 10 Jul 2026 06:03:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm450890566b.23.2026.07.10.06.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:03:40 -0700 (PDT)
Message-ID: <52d5bb82-dd01-434c-9a63-319694e28c15@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:03:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50edaf cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RXrNB5dDG2c-zWUEkKQA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: aQQUkyaj9YtdJl4USUrqeJfXegJK6m_0
X-Proofpoint-GUID: aQQUkyaj9YtdJl4USUrqeJfXegJK6m_0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX64V0crIj9g+4
 mzcISZRELuWirfR543kYf8/bzc1A1Qu6ZOR5ppma4DdPP+huc9X9fUQ4w8VRTRn9J32GESYadmO
 3kVrM/NwO+FiqNBnQlSIP7ye7TC9lPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX8STFRD/5coEk
 prIA78RIlLVItWJzZEHr71LXxcR5MuNVQPmXKuItLl2QSbs+3gmNPdLIS8r7xu6DCrYyiTZRbLE
 Bhn8ObaX6mJDNcIYuRSSp5vxDKk4+nZGz6/RFaEAbrHU8iMmE9pFNhUAJTTUeowKoFOtgNis100
 goIOtdF/E60BCfoOUsVLS6yw3s0iHl+zqMcyMQ6a8T+YlvrolUhbha1dblFwVIIzfaMmZI5G3i5
 Jc3W8cVPX+XtmeNvCwkX+1lzDnNDRZ9ffHeqHlmmCrDVKRmfQ+dffXXsO1IczcmTvB/VeN1Fs3K
 GWVh1pfWc2/s4EO7NlZ28kT03DQUyyNIAmYz/54THs4v7HRQd2l55teEKzqOWDzctidN3ujcHyj
 i7B4MAr8I3U0jIzxEgv414wHWUUZe9R7+bGMFpt93Ys53GU6j6CJpRAfod18YhajXWOW9qQEyPl
 XQFQAkDceslUaaYIHzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100129

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
> for them.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
