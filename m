Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8403DA7D3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165159; cv=none; b=d8K3mwY0/4kgza/Ut3OqsFekGf1s6Np4LVRb9WB4a8eQkXGZD6DxSmeYLQoi9TPS8H4G6TbnlPgtKaGWrXyhFTaovyGpjbOOOr6hq3gWyHb/KEh1D8B0evyyrkjTTH1ggqFBxGfs8yG5CPbQo2FAMCuXLpyZHlAiVP97S/qqkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165159; c=relaxed/simple;
	bh=yZKYTHcsRS5EQrmGC8BIeJVQr0HpJZFq4XMLs4w1sPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5Qn1iDyRarynPNqV55nSIaKEqsBkLKT0As0faJ2KdiVB97rSC37bOldvqSv2grqJ/cOFAU9bLEk+kpMz2i2/ZHVDzEUBv3N2z9QeC0cJJPQNX8L9MnVM8Ez2Gnyv22DR5ooW0MTSgQbeR5QyaYqKwszVEtrYAb/YAdTdHdSiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKKBQSgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kezudc/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKKBQSgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kezudc/v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xZrP3427260
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=; b=QKKBQSgvsxoR0RFV
	ggCJcFlBh6vgQdyRNm+IuEKr14xKimc7Qa9Pzf38wxKHetFcEWrgCRnmq1CzRkEO
	Xrpir66teANpsuCByPV38TqZLN3LuFRce9nSBuNwewq3rLUkrat5rckOU1A4PJUg
	xUi+woAa5cxAEBA23eTEGedRLpSS33yMOyNt5YC6GvGPMuNo15ZBstT6OfPjd9yR
	FsZywpHkrCEV68t4yOyKiwdEcX5vS8nFpFsRFxz+4KyHicW/7uzQkuoYkezLeG4e
	/OAwZDWUqb4YetzVDTIABWAIZXH9SFnP5g7o8B8jq7GhvYAqedqKZRpgRsZTTmte
	VhkAWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8eph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so8572511cf.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165155; x=1788769955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=;
        b=Kezudc/vB0GWH7MLUOmos1k5Ya62UaJeHAidZeNJMX7NrxNj+3GiQ3AAoTxN47Tcru
         1AM4bQSzJT+QTHxyJmGPAe1nqWK7AQXShyo8jbKFGhO/3JI2AhIPtnKZx5YbElItlGl1
         sQ1XbSTBdL3ece0/BiLkaMbv3rLFOLLDO6+JfEOVEa9+q0aOej7RlMfalx6tnkxKCEF8
         kW8VH+FLEOHg1SeEGkWNMUOhf85vAK+eQku5bXAB6xQoToDbF13J4jO5k1r7ukUl/rse
         VR2RIFL8FdZN6whk8ltVmw9WtMzyd7F5YuE6GfS+PwZU4766shSNuKkV3qUHH515ZgV7
         qgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165155; x=1788769955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=;
        b=W7hQoQe0hGWDgz7K5w/bWj35FuxQs4O7KGudgkjR++V513RrChm6emY3Ff7SAfH4zQ
         ZNsSQd/1Hu132Qj/URgMtiRl/7ei94cvWXaia9K9DB9feH+9dMfJyEu3eLBOSi/L6cxi
         WyVrMr158Q+ezYFkkBVzb2rEtqgCoJH1p1un+8I4fLMXQrNbAZc/cLOHxZeGHZ3VyCNc
         z11Hfnj3anyiVwAKb4FVlYKoXG3VWxZuS/6lpxiNwt0bj4Ix3Mi/gP4h5wRNLhQTv0P3
         2bl4HrZ/DtzX+jtrVhT/l1A0zi5CTY7Sq1w1LmH8NfsDMgw9vXMGOWwp4MVYdurcKF0i
         I6xA==
X-Forwarded-Encrypted: i=1; AHgh+RovsmeQSIPQ+5hHyX4IHOhtp3S/NT842Hu0hRxfpt75OI5gy8O7l6gCztaDy240xXZFkis0N4ZyMBOe@vger.kernel.org
X-Gm-Message-State: AFuF++kBJKvDgMngYl9bvEdvJPE1c+EX9dnx294ctM0lwY+zPg//1Xnf
	dBkFfliqdHzPJv+0JF9g5snXwKTWY9wAGNBud3vkGFA0thoucVbCS2/fczBqisg7vFOoMGsI3gZ
	u50jeJJcPgc/oBpCKn1phjvRRl8dHFMhgxp5fSTMMs6mp0yUwJmRHODqbHib34jm6
X-Gm-Gg: AR+sD13bj+NsOu4BAhiCBaXkwCRXJLeDb3kEXPyzHeG7G8O7oR3hueypWmJHl6wscwk
	QiwBT8uMiACrToGkr5dakLYZdM9VRaxuWbVILQnYmKk4MxiIYylrgdsyYI5g+hiO6jSy3Ue/L1q
	tfKpnZG3aV3WblpvNo9e1+Un1AIHBoSLQIYf7ygTWgTrY4brfHYXAIxKSfs0EE+5nMU3XwQU1A4
	JGF8D1z3dCe7nEwICgL06LdOz0dUmkAjUEWT9kjsRq2tCBsQ4MDPH0WjenG13vUbWXdSKx174DD
	b3wWzRfyqOk/dI7HyLUBiH33vtNk9BmDDIfcHdzbLykJLzSpi7iaAR2yBcn45t1JHaklk2tQ1r0
	jNWjA+fXpstz1N4EyIXSdgQ==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr194388021cf.3.1788165155135;
        Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr194387641cf.3.1788165154620;
        Mon, 31 Aug 2026 01:32:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b67879sm2981473a12.7.2026.08.31.01.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:32:33 -0700 (PDT)
Message-ID: <2cd6b5e9-d442-4815-9a00-38d4d7324467@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 10:32:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JfQXHLep38SEkgQ_DRRY0iNKFIKt8ePr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXwBuJSvibNqNj
 oo0kLhGtRwtYwcCmI19K9Z5NaSGVlvmCkDvbp0OgG7cPAsKOmiCqjBpXWP3FA4C35P1Bd9BB3h1
 DabWua4FnJdMGZOvK2Am92pGXjMBuwpD0SUAozE9elt54/yqMOJcowwCQ8Rka1bWCiEqU0SenUw
 iVd7+hG959yJl3uHWIm2D9cjD1nD5x1sImajv22WJpESWIkZQd/bPONAa3VM8zjm/upmruqRheX
 VLf29zkrFTwgaoSmc1/LhlH/TuWHEBIMpRGa3a6lGZQUUYn6K44as5KiU9HBE7lPF1N8Nq+DuvJ
 xi+xT6vsBKdARBehMQmtj9bhliSmuWD75gYVUiG0JKwrCkRZV8eY5mIaO5tniwpHVozsCfoHn5w
 +aeL3xp27fFIwzPw2cBa7IvTpgO3EcDlk6RwUv/sQ62yyOcR3MbSCVmvvASelFkQhz3656FEcaV
 ZgqyYqJjyOYtFQqs6gw==
X-Proofpoint-GUID: JfQXHLep38SEkgQ_DRRY0iNKFIKt8ePr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX8VisTtTMf24k
 SgdQbRdmvg24WcY7LZIF9OYe/Ap9Y0MyXK4nJKuctbu4In+WefXvIyRivrWdy22gP7qH9UbfFgM
 kl/qpVQpcpB2JaAAoiqkjcX8UAeMDlM=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953c23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mksASzzMHVar48QEIzYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 8/30/26 7:40 PM, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
>    bit 0 = 1 --> DMIC0 enabled
> bits 3:1 = 2 --> DMIC clock divider = /4
> 
> The current dmic-sample-rate of 4800000 corresponds to the default DMIC
> clock divider of /2.
> 
> Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
> the working Windows configuration and resulting in perfect audio.
> 
> While we're at it, remove the reference to dmic23_default, as we only
> have two microphones and don't need to configure the pins for a 3rd/4th
> microphone.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
