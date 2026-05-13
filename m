Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C018478E5A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684968; cv=none; b=hYlSAPYkQLSLZrH64K7xKIgKI9ziBs/xNvER+113+1ko3chtAiEdVzRaiBK0oFIpYyPy3UJZ20hUYAMpvd1sx4KgbSYljxBySvkTiXV56G35wE8mAo6ZndDTnNkCi7jvKDxHSbtMhKfm0AnponRtTIzuF1p68AHzC5qu1Du9ixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684968; c=relaxed/simple;
	bh=G4SWJdH8lfXq/Q55qE5sancsJQ5dvaiL1/ql5G+w7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r9SCzSju7LtXhMDedNbPNSyRXcUbfgG4nqqELAh3YQH8Ax1Wa9gEMwrP4mb+tFxP8D4SR40eHLOFPu8+2YMx7OVxk00TO2HnXsml552hv5pvHyOPhYglshYXLmdUv1ipsUwS2ugWMBmO5RJVpQIOL6fE1ZQmvNKMm67Z5NL1Hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cB9U0Ih6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Od6x+1Bn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cB9U0Ih6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Od6x+1Bn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgLY3007391
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=; b=cB9U0Ih6c22UxiBH
	PO/hyD4elkmS7CcgC/FwoeTSgjYN9OHqqOSSOMrm7oq+KnPdjokxYKSTKQ9WbPDl
	zQcZ9YUtQ6q4Rej8lsHH3aABaF9LdlW9aLT4Q7cKjp5DJEwPNXkN6m8RbimDGefz
	R6eUWhpJUb1Th5UBykxAodBRbBcZ7lBftIlGHoxTlnba/0l4YXweAooM2ZtzyD1t
	Z+ipbUgVyrs7rovkHMvl8n0JkYPIlF4Iavq5Qgb1Vv6qtUybwHDZrEhCZ9Im8eMD
	fzBGIYB9FKgGrtsFTcMkwilYNjLaJcqX5lxHDNPVdAV2O/GTe9YksSGBl60WcZa3
	H/DKOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h7ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:09:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so300729e0c.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684965; x=1779289765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=;
        b=Od6x+1BnWx1djgN2tyH5KAMtzDq1mxhMQPYj7b5fhA+Fht263C/jgnOI+CS6D8Czrs
         8J6svjtAda8Upx9O5kxeABilwPOlyDHQzftr5cCpSBxk0z/8H29GlDUC59+vCH6CXFvt
         MH6gJySJEBWnze7lHRjyDVw5SvxNTjP00acZ6KibCT1u4UUysM6JbkiaMYorplEbwWRz
         9Isx44V0nTFO7TfKDnsUZVcyt2mUBxTIlLJ3KSVGIUIeaXWXRbWi0Y36Fhh1fKbFHgnH
         4uO7qBC+ZRptyHmJG4igSvXxOenwodG3KoycH2eNEVil4Gg0wDASevLlLyL0rhqYb9Zk
         /qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684965; x=1779289765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0hB+em0HhLvyCaV2q9m7G7h2H9vaqkFqmGjp5daVGU=;
        b=BpaUGJgVSARzQDMmOekctNiOZhmX29ci289pW/znM9st6pJpz9spqbmQHMqTDeyKOg
         i5+RCJzX3SyqVmwMml8hAntpPZiuAEa5qBzBWAPIbEhRPBgYua4qDUDIzeKbgL9MG4iP
         icrwaB3RsVfetXfhtmgxGDqkC/EKyWU4U5Wv1rTZ37YICec7UKkJNdXqIrfsIz10g5ku
         NM228nHIW/Bw5KGFjYkJ4Zd+ZoGMg4S1qoikLfEJKU8lmIqYwDXjnPz0XpDPTdcQKw5L
         QsJG5ynyJoed7PKA7EH8pouvnHEy3jGyr/Z0C3UMNWcJ3DbIJwFOLVEPxv3dqh9TwZxa
         RhfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L26ANUE/tEA8BV0I86mjN22FDtep9A+XH2NJhOMHebPl4/3TMSqnL2/i72sa08QSOjH7orQj1mG9h@vger.kernel.org
X-Gm-Message-State: AOJu0YwReETWBR8y72AM5gOWVwhA7zMP0zR8BsZ3rFEakvW5O00blomF
	0QyHet9nmKZUfO3SFO3tX2X1mQLem2QsVkJS3gTjvHRQChIXfABt083b2abLnX2ZOla2z0ud687
	nd3DVQ3ExnAhI50rVtFGpZEyr8HDz8cmIDxzNAmklo78cSh5vkegAjffzq0lzdmE4
X-Gm-Gg: Acq92OHMk32XMBRHkxAM7VW7YxrjHi/p4iyu9gLd35z+fu5GBt+eUq8QojWzmdBF4sw
	hJ0KGa5gMDkazcBW9p+4rEG1OIGSjgYwEX7WMKZj3WsHqC2FWeP9K2PXE+ojaBTbOsRW3pC7zp2
	2Ppkbasg5wvqy/LN+MBWMEuvHz3lANGJfiME5NyfzRXGZ9PYp9XsWnVeD58Q5Z5/cCC2TIy5yQd
	hKBrq55vISIOQwn79RXPypnwAQVE357qPcNxtT3Lj2UyZjfF2V7d7lDlBkR4k+LFzQCxNr62BHV
	uwejRcHp2ZyRwz2ZxERtHq6jb+ufd0wPqPcaihGE6LRTnEvqAkoXqA7Ppe83eF+JMp9odeF0kMS
	DQkQP5BIZjnWgDq4gyfEiC1JUyabyQSJ7Su7hfBEv6cggwk5a588RscWuYLGdCl7WxfEJOGNfWA
	a0Znc=
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr541732e0c.3.1778684965231;
        Wed, 13 May 2026 08:09:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr541715e0c.3.1778684964835;
        Wed, 13 May 2026 08:09:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfebf0ab11sm502646366b.62.2026.05.13.08.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:09:24 -0700 (PDT)
Message-ID: <ab036c8f-fdef-4123-898a-7a0acc62e64d@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:09:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67c50d27e133774e0a4edc17403e4218ddd86efd.1778498477.git.harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX/39H+aZj+GfB
 KlVLVhx9lRcDpcCTPGqvxJy3kOyeerCFp7GCUYPLsjqfWhcI5DPnABH2+OlWOmgWWtSzZiaDl7j
 vtn1xcLGLoPKTtk5VjxF/19LULt40O+WblpuXPgvSw3X71GZgPiHTXcsju27ixecUWhWkxu56S7
 9btbPJxylv7JWoIHzerANigFMdaiEuyA1BQEWIuQpOgeWrQjYvdvXJLfGoaZ5GbPbFPEY1rJlkn
 JYntwvucPatgUZWnWdTpYnUKwxb0T3Ob85lu+wShfFyBE9fBaCp/kXQ/vb1UaIGtMqbEMkIQSpZ
 /0u1I/9HjYs5C14Kojkp1nHU/CApvbxOheA1K5lSUBqnEoFScxoybShqiv2aa54XWErH1dV0zgE
 D/11lruHbaGcvxzebGROOcY2mp80Imi0XSzqJ0UV9T4/okFlF51/FE/BUp35rm0g0w74NtNq4L6
 NcSM/Hhl7+omeSTvMxA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049425 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B2TC37y4lXDFjVec2ukA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ofIoJ5h9l6BEmZgJY7hfl_Gl4ut1vZA3
X-Proofpoint-GUID: ofIoJ5h9l6BEmZgJY7hfl_Gl4ut1vZA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130155

On 5/11/26 4:40 PM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +				 "qcom,sm8550-pmic-glink",
> +				 "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +					<&tlmm 123 GPIO_ACTIVE_HIGH>;

Please align the "s and <s


[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&edp0_hpd_default>;

Please make sure to keep this order, file-wide:

property-n
property-names

[...]

> +&ufs_mem_hc {
> +	status = "okay";

Let's keep status uniformly the last property, preceded by a \n

[...]

> +&usb_1_ss0 {
> +	status = "okay";
> +	dr_mode = "host";

You declared the Type-C ports as dual-role - does it work if you skip this bit?

Konrad
