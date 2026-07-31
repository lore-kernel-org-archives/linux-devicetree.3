Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313163EA942
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499518; cv=none; b=ozEEm7tlljmK9AC+T8egVTOx8v2M8NNBzeO/qQrLaeASHWMyeufPW7RpD5W2Ct00ui051Jfui1e7ebXDP9OmJjx56S0pFR4IvqlLtcIGsM9OixDcA4fyifyr6YbBSO3hKCRb+yAu38CTz3tct3zq/1iRX7+ofjvG54bstW1RhwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499518; c=relaxed/simple;
	bh=wleJuZLO9H/CaQxehYvbCC/E9Z04ytG6+HtAeIk8fQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYLkim+dYPFdxop4C5c0m2DD4Ba8v7idQWNunEhhHozgFOkdE9KfMwnxipF/iGNRSwUtFoR5PO0IDzNxusZk6tWFR2vuz28Xzy24c/w8EGmaIaLPcyXqlOHictQN2X2/4DXpsp2QAU+9T+v1YeR69qSi+LG1U832Ub5wGLJQz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA2kchoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8DYToyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA2kchoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8DYToyh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmAef3905279
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=; b=IA2kchojIdO9GNOW
	O7m0Xqcz8KnMDUS4iiCy5S0z2fLet2aYMUFbkfzQ9U9awNHGU1O1r0twoALPj30d
	HNB1ld/vCi4PuTuXwZ1DkJoEK3HYmmjCUTiFq7uwwNxJxBvPgTqIb2++zHrAvQN5
	fT8oyBoj8Di/csTtjzXmtMZ06c3KJy6qtuPJ5Ge4zPiGl2uho4nwNwpE7PeJ3UKY
	GuuoUscW30NKz2AVz9mJX4CVIdif5pZf1OMfwyIfIR4z9ao4/I96YF7zfK+w9saO
	crbqOVmfIRZFLU1gLYXYT8fcjCqGFlWftYW8phho+lcMlhEko4GT/U72ZSKJVKtk
	DAyb5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dg28y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:05:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744c091ec4fso37806137.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499515; x=1786104315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=;
        b=Q8DYToyhDulUGlCfaE/pso0/nma6J12mra9IFet30L2HkH7osrzLlctnOEGgEKXyDz
         xjG/0apbpCUSmsvi31eG1GGyjfQVeGiXZlMwGlawQnrYcNK/FS0NpKxl3dAQw5ouK08A
         lBvCSBTk7qkXPa6qwfAgFLYIRTz1nqCDuhHgYTWD2N/j2HmiPzvR25cYd+7SVnstKJuc
         uTD+kXwj25SfXT/l3Fu8OHgwliAbNiB053KA7ri3hutrR19Wboxyn3pejTuglnW/ysJK
         GZWmS/FVmQmJ6E/aq1e3mb9YSRfTh6c4m3Y5Ow4s5H9yrPl43sexDYnejONBBez/+2EM
         3Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499515; x=1786104315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=;
        b=ZhNi97B40zPwUdTScOx1ZgY5Awmoc3DYVTc3ag1nO7Mi+sfkZIRCX0spjhVaxx2tDO
         e4wb/8vsCOLNgxgMYWLUurOfDPHO3hluhvUMDA1cBHOJi6aKt4dNC7tnslheob34D3aj
         4b3PH3ZSIG7twQq8KtG4BW4TZZkyvyI0PUxlcNT6M7EZmIWc54DQWrx4ljQlMdae1agi
         FfoQzvE45E7ZN0wEtKZObksODcpzNcXfALxLuQDaeH3oSrVpgie8cuU9l/ZgrCbYrdf/
         QdUJrcXpiM5EVix4jYDG+fjSZ5YhKZf0yi8ghWZP3k/UgT2XdrUbyO11AL2lT2++KPgo
         3bAQ==
X-Gm-Message-State: AOJu0Yx5KZTaXKOFQcrU3uOvXB9T+DgUkXnSBrpcG8xLiObwzSqvq0Mj
	ac4LdaI1MlgWVxOlaADzNHqt02NIk4jyWpQcNy4EK6iqAY65RI1N3NYIa3922fmoIAf55o6lGD5
	4n3KgetccTJ/9sxzzNJDuoMMhum/eccYanbUJ9NMWlREsKYMOARitQpNbWYNMf5UaXpvHVFg6
X-Gm-Gg: AR+sD11EG+LuKtBOtfPjPRaUxnTlWbGMURGercx0CieCQ4RR64O8a9X9Mfhyj6xIea4
	/cxV0DFj/SUUQXibZisp3vusXb54qb96qANvAOeghUok/r8q7zxWZQwW4xcCJSodT56IcRQVgv6
	jjigzfFu+5RKiIW2UQYyMgi0t3nLq0MeqhL8FyyFHGF+PMIUEuiatNn1zTTQ1/KoSy0zRcRQOnk
	dV7pom7T1SULWFvJRNK3dJDiCeS6lJ2qZ+3yLMnOtz9L5ZZUb+NsTabqLcaNr4OKXOWze5VzCQ1
	OHO8cogmp28IfIXvd2kIc5qSfvE9HzPGCcX+JxpcM3GG5ykzCO/8mpDW4btao5SPtQTjuRKvneV
	EKavpAd64fub2MhSZhkt9bw4O
X-Received: by 2002:a05:6102:570c:b0:740:2974:57bd with SMTP id ada2fe7eead31-758f6b67072mr265952137.0.1785499515447;
        Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
X-Received: by 2002:a05:6102:570c:b0:740:2974:57bd with SMTP id ada2fe7eead31-758f6b67072mr265926137.0.1785499515061;
        Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1224069a12.27.2026.07.31.05.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:05:14 -0700 (PDT)
Message-ID: <69341ab6-8b45-4c47-a7b3-7053fe873a88@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:05:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
 <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HI3XqzYIZPFOEyMOMAW3xgHXnIrVimS_
X-Proofpoint-GUID: HI3XqzYIZPFOEyMOMAW3xgHXnIrVimS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX3ne8A6KGpDnL
 k/sthQpQyMNtAds5stWgaeuqE8i4W0ioAyu9dLvA8ISuKTOvDhaqBFjNL5q1n+2fSRVF72JFgkl
 Uoy6/2+33aRcoRa9ZWLaUgEz0vHpqbs8g0N8QZpvmMD2FCp7ZzYsoWYu/fW8nXt/+NQp4sACvCI
 qNf2PxFblmOIElLJEgWI0TMPtEdvuI7sarX9y1zC7ocR5sgoouEUbD6g4kfRJeAvV+HlumTKig3
 qeatCf08yeMi4F5S97XfAfDowwkofzJdWFuurVuUTZRJ9kK6AFITeVbLWx2/93mvXtW3UFnXaL4
 uNSIALii36qi44tQU8vmRG9h3Y8vf6aK+2or9dNm9eWY2WbCFBjd8kzU4pxvmV5ZlOqTEW82PWs
 9Oj5vPZ8GYxhE4PlP1zaOk4C4d9ap2z+HSFgqASQZsrMpJFvU8HCj6GjSiqTR/uGzPwMXvxPe+i
 t5VzpdsGzQvVGbdQcHA==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6c8f7c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gNcS5RXMAAAA:8 a=EUspDBNiAAAA:8 a=4C2i0tmSEkLqNy9-opIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX1t9O3uwVpe84
 cnd6mTL9J/8oK9QYDUvfGPwvbDpkjpJELfoh6TyAaIIqpgb7MYFX/+7p2nLg8Vqp5v5eoRouSBA
 udRavipVeVypD76tnVVTsgNmfg0MHPE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On 7/23/26 8:18 PM, William Bright wrote:
> The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
> onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
> the off-module peripherals.
> 
> With this DTS, the board can boot to shell with a UFS rootfs with
> debugging through uart7. USB is also are fully functional.
> 
> Features enabled are:
> - On-board regulators
> - uSD
> - UART
> - UFS
> - PCIe0 (M.2 Key-E)
> - USB
> - ADSP, CDSP
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
