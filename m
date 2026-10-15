Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8825111B2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061342; cv=none; b=lfhApdaxpvnM1BTEOKOK3fmBLIBjShaHAYPwT6HQ6TSjBL+Jg+f26D/ZZ55Kz691ei30Hp0eX9jE4eRI5bkKDbHnUxDUftZBwdccnuWK2VYWql5fpyVqQrbY+1XSdD19Y2Rtz3nT79qIXAWSNJRggxHwAudt3kG0myHCmtDaF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061342; c=relaxed/simple;
	bh=HI0B6U20PGlmDr9utd8wlA1Fuqt21mxCePzjPM+qxE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5MXY4Pa3ytYdJ7CZyTK5DpOCCD1jBQoZBFFoyYieMcF41iIKQymEZVcAO2jB2Y+xk03n+yzhfJBp0ARlZhYm+CHvhqmYdBO6vY4cv9RSIVCGJ+pIMu0nKslVG8ig894xIGnIjKBr9EdfZEYhih8BgP9sQsN5DqY9AgsS6GDOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Keg1rjob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0bjcki4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keg1rjob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0bjcki4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgHO3510197
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=; b=Keg1rjobQuhKYnqF
	TI0Ep3xQZFA80mzN8TaR5/WuqnFpDmlwTugGSZEbuWufoxwtciA/MVUqgEfGt0iS
	v+lj8prd0Jt9UI4VuQ6TDptQnOOm7wrIlT5ymBEl0x3cWhiuGFWwDqKp+WuSTBHU
	hgoVycVqYlhXmCQKEJUCoTd0EIYgFW9hvkYYa8s9q6c/SP45fd03jtjOetttzWLk
	CQFt5IucgT92jMvfqrlboqZ5wjvhMHDgkWJoPJgq/Mcj5/iJcsVZqyC2d5G/04o1
	U4Z/cWj78KZBCljwa02fCANU5+DHSYJ6Qu7wtHkwZA4cPT9gMoxNMizpV1cxbXk+
	XD8www==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9mev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338d5d0509so11198981cf.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061338; x=1792666138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=g0bjcki4QwlHohbhK2KcQ5DUn/SpSzfutzwyPL4UvMG6UtXI0EDWAmckNeHSp0I+LJ
         VQwEezur3dLr8Dknab4c6llxevr569sYil3XMlXBciXzShcKzKdV0Lyo0k14s/S2DKXd
         nM7y9pFZD85mrjrWdYa+Owm9X+758RlJ7eikLXHIz6B/9C2BZ5jaNEpZZUFqWHMSnyAq
         69DVlHnJ1bn1w95yQ3m/UGMzu6mt/pp7TxpAXPzYlCFJjCU2Wm1cDe3A5ON6vxt697B/
         X6oCnbcMBDAYPMLVut4BlD4TPescc13k/9EWKyIreH9SNjEgo68lodHbFIUdDgQJURlX
         tbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061338; x=1792666138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=M5rpbMOJWwcJPjPQd7cg8Br53yW6Gsh5aVe1o1poLfE3gS6nC/XLqBQSRgBxXjGjbA
         koEr4UTPODmfjp4xwgO789ZxoR0/js/C12tk39eN9yvtCbDphjErXGLC72+UITKcn+gd
         QuHLAASmeMrF5UvVYn+LsrDHvL/6CmnB9l9CVRKQrGs4CPWlYAUIxnWFwuo4QiV8ECb8
         TUx+woyilHOmC9xPS3/v1S13Eu5tDAnqXJizmM4wffPSq7lgyOtdFHZWue7QUFIUIxY5
         iLUMbARUz2/jzBbWV/tWeIpO98hMLRchdJcGa/gT+kTzggSVU1coCP5xHtj+Zi2sTOj3
         ob1A==
X-Forwarded-Encrypted: i=1; AKwUvBwMl1w65HsLsck2id4zRk5lmC2N0cUXsg4/IniMc01Xb/6rkOy2ZhunsQixM0LZgF5MSag1ryevx0cr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ08uaHICJyvJ9FL5K5VYCVJaBplUAgne+vXrYQsVyeLGtAYMhd
	ciIw92rQlc97gv4tahCt21bjAIDAWGjfQDh/vPecQx9G+V08anwucINYAo0LR7jaxGm4IYDc93g
	jhkLFl/MzKvSA0GsNruICVN+uLjZGRURszK5TYwVP3UT4ZHikOqP1dh1YD8ntpKgm
X-Gm-Gg: AYBFou03a1D+s3J1d3NYLZWdIXfCkrvPywv6kqs0/cvhwvCrzTyLMIHhKGPbWAM2Ufb
	fBC91+lCRmKcOGDaIEG0aD5fCIfyzGr8BNFwiVjBa4bxVHqIG+o8JxG1kjwmHQEWJaeLRFdDCaV
	YUiI/7C3MlDXU2zUVnAw7OWk9bSGb0DWFLF5Ff9zthXH72q+uufendGRiDiFe9hyTFVvON/WvlM
	HJ779m1yBjqFz2TU1M9U3PEG4zPyi9IeVpXoHwbIDYY/RJL3dfygw7KBp0T9g14iN68jGMksLII
	2G+m5xvzZB3e3eQ3wpdXbL/EN2YD5U5VR64RwcT08IoTudaXQ5rshKGLJk7gxcaXYVMIu4OpLin
	AwkqPKVUDI2SAVnDLoupzCw==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357213321cf.0.1792061337770;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357212871cf.0.1792061337282;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda61fb26sm108538566b.69.2026.10.15.03.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:55 -0700 (PDT)
Message-ID: <0236914f-1d27-4618-8f94-3bfe6d931860@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm6350-lena: Enable IPA
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dMBk6b_Z9b7G54HUvfwZOIeJo8twXtmK
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0af9a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=KD0jGWNZPHkgkXdHO94A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX8fma5FjjMb4h
 YhjT+Pb+Tb7Wy1/b+MZyDDIrKNT0DLXyEJikeZu3+ZoNexq5rlhgQnNiL75vsP+xnymiU+CDfSX
 a7cCKTH4k15qSX6KuNiHCfa9O4rMaP5DFZlDlMCfoo32E2KHoETZnWf4GY04Q/g8+dh4viET4kE
 ZZ4b35kSWbh0rxd6XuZHCjgCSy9Xo3q/J9zPfalA8J87Dy8kCOdDxW9+EDl5pZXjsnInPoAGL85
 x5kQ4A36rGLmVSDy4niEAbEEzG7igyHDRaTa1RZMx0CsQDD44Mow8O21S+32en5fWcojB/aZ57J
 AdW6T4M+zMgOIaaIn8skegn0cwkdI/GjwXbygcrMkKUCnBs6Tgak+QRpdlwQuSP0nchkW0mQGOs
 AGxxNEuOlhLAfhpJEykGpmF3ELJqzoycJu3gB0gyFeFK5Z19oPTVcfFoxgQXk7Ljkalh21HlvC6
 Kd68dDGgfOOG45152yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX1WBj6cU8M9U+
 dlFCj67ulGWMBWZepvHgEcHlQcXjN5NSJRPhF8Owa4NGOH9UzO/cT2WIY1jH2FKaFcHNQ4pdrXw
 1o/Sr52ncOH6cGDdl1HJYRi3TUsHjH8=
X-Proofpoint-GUID: dMBk6b_Z9b7G54HUvfwZOIeJo8twXtmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the IPA node for the Xperia 10 III which makes mobile data work.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
