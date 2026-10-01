Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34C47142F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843936; cv=none; b=Vut5pZHv7kU/P4L5Izv9n4gh5IrfTpfAoYZ48Xj4/ufnqCi3mEphFiIt1xS26GIZhDTAP1Bt4OLG8oyBiecaE3TFdvQUyjD5HKNPE9cPEomt4mf3tob78uA27yTSiQqzJyU4w7EPJBMcTCimM6EKgZ1ut1BxEr29lkF7lComCQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843936; c=relaxed/simple;
	bh=BIIqgLUhmWpsWY5nKggkmUgfD3kve40HmBqG/K2bve4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J8ppksWAD4C4e7NNkC77XMqxpI+7JU5YSUzHf1AESAVgjW2mL1Gr4CeVJkUaJPIectV2gUnk+IswV2t4zMFYcZt5jSeluBdQ5+8pJGC1leJJvsSVyu+xsoWYOXKNywEu3jC+S2FfBZnoAJQbHNUHsUcHRWzVlzuRryq8zVJyjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cc1ZPgTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUwLdy+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cc1ZPgTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUwLdy+A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfoI2337464
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=; b=cc1ZPgTysUVQ5497
	qKkvDUW0qKAd5P7rx+ZZTC53KoxR93l+nFATzZ9n1cY3QaGUkkYgrmwa7Gq8DLqy
	tFn/DUS6MhFqR6t15Uy1pl301/CYhwMS2tvMO/lW3ELwDFtATVjf/wVN/+A/8cog
	i5yT/gZnsxEAYFjtXbFjSQ71xBxgphMlW6/iJETbaoOnyPOKAyHWWneRKreVWcYk
	+6hnR23OEh53nm+hWyZjKjxNghmw8KWMoZUVb3XgZ/r76krjNg31MSpfVbh15GaX
	or4szjVNFpu9WfIzRz1+lflzmMWprKV+3MVJuv8NpwqwXyOXQwFKSQDLvT2yRGPt
	gie1og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n23te2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:38:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso93641685a.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843933; x=1791448733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=;
        b=dUwLdy+Aui2TmkoL2+4QjdVmlXPlZIzEcmW9b/LMwO7/3ugkfq4bLTMNrcJOilexQM
         11WPPe2acquH6cRMAygbsgAhIX1S1zqGzDxGtf4TxVwTgJPEV3EaGPZ3uUapQp1Fm9QJ
         uZaIOgrn4Mb88dWlQ+dx0lBAxoA6JOKWtE8G+mVUgRORMb6lOrUevYPBiQMiONFo7mGk
         xcr6a3OWhjPUEERP9dUDzSXzA3ZdpaTVlTeC6PUI2ttjG4gBQ+QSqnI3leOR4seEbnxR
         IzMy0iuwcoMosBnCKgcOOwznuvgJ2tiLUYVxLW/KV6uKDewLtmj/tYPP98fBlteRvMCg
         afUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843933; x=1791448733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFA5T25KDO1NFJggwk8JAg6XIqf3mZLwXS73+Irh4q4=;
        b=vFKrOPZj1tkoyMYMAfC1Z1NZBiIgmiaICtQ9gnHjkZKpCafkpqmk/zDqqvfzj2k3vr
         ip9xJM15eP1ZSuDSDs7hyJUPBEgujZtzZJSxgcfxDLvtHZqPWZYQ/8IKIWatmwn55atW
         zSrch1ozNVvSK+hf1NGh2+RLg7zomkg4pYRVDtU7dlTzmiMaVywsN4pLMKb7hm6h+P0Z
         V3Fa0R8zCu+lovowPvPJ7FvVrDXjiIDyXtfW+foeKgUaGY3uC7nJ6SUAwxRjfcTL1glx
         YC8k9kZBiF3jJrjHhcDr8Mhhzu7MqslGOHkSqn4/iSN/HPsPYSzlT/rkBqTc7hnAQ0vb
         LnSw==
X-Forwarded-Encrypted: i=1; AKwUvBxtSvNYQsQ47qXSr0ysdOIuSKts8h60nmQH9/vyvq8tvw6NA7eYOIuxLaSrX/Yqz2FL6WIxyTL0CmBq@vger.kernel.org
X-Gm-Message-State: AFuF++kYHOAxnLe+7/rPBIXmCKgkh4U8k0g7zW/oPMoAUy6LS9ljSQzD
	a34mKlgN9fut56lNdofWyXXjK+DCzUreFES5Jc7fQ9uYpnCS9GcfGAVUOYia4BdwCfMGdd4rRyY
	GTcn+aPLLMNmExFYEFZK8HyxRrTAOPJ3N2utC5yhcUhZrJdWDZfGkhuwbzruMwcax
X-Gm-Gg: AYBFou1IOxZi0bcGA4B0S5PjCqOwr60/olWKFOM5G9prjPF2HhMiPJxFiKm223OS9jU
	FeyH7Fxi1JIUmeUcq45ZxCgg43/6rBD2OvKBkVUtVzJ0+I8UjxafNwYMgAFINaGvOLRZxhWbloy
	UdctT/S+SY/6XJ11D2g4ty6djNMRD8m1lkL2U9GK/AdWCZD+J1Bq6/K3IY4vRxx3loMMjKu756E
	9lv8USDucZ1zQZI+VSX7KqVoMDngI8iQPn03i3FkcbHnIFaTGYVwHE0jPPYcJysQ8IV0MdaA9Zi
	aX9TBxApDfzf7XEZ8rISUiaAt5czQGlTQ7fE4OgTduM6phkYKWHM7+O/6wWoZMJLzTkqL0eowpv
	C0e0dzyhReRqSQOxj2qogJA==
X-Received: by 2002:a05:620a:40d6:b0:939:8bc:8826 with SMTP id af79cd13be357-93ca9683063mr675711385a.2.1790843932842;
        Thu, 01 Oct 2026 01:38:52 -0700 (PDT)
X-Received: by 2002:a05:620a:40d6:b0:939:8bc:8826 with SMTP id af79cd13be357-93ca9683063mr675709385a.2.1790843932231;
        Thu, 01 Oct 2026 01:38:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8efb0sm107009866b.23.2026.10.01.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:38:51 -0700 (PDT)
Message-ID: <152190f2-5293-4e6c-ae6a-349cba77b6bf@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe1c1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=6YNwo6Dc39sHZJQzegsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX0LNSle7RMC7+
 N85Blp/OLidbubwj1lMGZp3whL5w/Q4i20Wncg98+VZflHcHJh7WwrG110UrqMJ6Ug33GC4Kodi
 MclxebRrC0R4Hz9N4VGoMIHIaKzGo2Q=
X-Proofpoint-GUID: JJolVG7a6yrzcfveAegeMt4_qW8x1uwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX/j2kJdFG0tY3
 M6AJHCP7OMnnHcCHQtYdaJeI7xLstcKEQUqQaYqG3BJwVagUcd2dCPzzcnKBZaNU764SsaZoAJT
 IoYljJWgHJFDyXxe2UQyC0C0+HNUIBw3Pm42ySc8kd4VK5jhQmm71a860m8XqLk9ss9/9kONY1c
 ThHiMH8ryxrnhU5LiYoCtslxupsiKybckcVGInr747zAYnAc8aoNRQIkP2CqKs126j5YLOA4JOM
 4v7Fwn5D8zpOvN7qe4Fot9UPoElPykwu4iv+YZukvt/yNlhHh5CGtxz/TLVdGSmwIC+abRlQb/4
 c44K9niqb9UqaQ4U8g5lgdcDpYDPiTGoxY2VRjIHr+FoddjrWj+R0EHHlC6rB0M+P/mUnYopfUx
 WU/7W8pqPUDn9N6gNs2FdyZFyuPRT2MXl895XKnD/4iwX8ZR6A68Fj/WebCYMIshEuaJ7fgCNc1
 jWWG/Mh+Ubn48PXz0Jw==
X-Proofpoint-ORIG-GUID: JJolVG7a6yrzcfveAegeMt4_qW8x1uwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:57 AM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index b4854801a5f5..70996b94cd33 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -196,6 +196,11 @@ cam_vio_ldo: cam-vio-ldo-regulator {
>  	};
>  };
>  
> +&adsp_pas {
> +	status = "okay";
> +	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
> +};

Please ensure 'status' is the last property with an \n before it

Konrad
