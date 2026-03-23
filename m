Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CC38836D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259798; cv=none; b=WdZAmvzW1vYZ24wn+2Za4UQTTVPNismywFAjF6Pv57jb1tzKGuIebjzjZNiKDdQalII4Vy9xXQOnhkR0SMYqJItuxUzbXTLR/7exiUd0hh9rG7B6t51ia2Yl/kWNApmB3l8tBmPIbpHr8zuH52xgG5stSunxiiU+fVngMeruA4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259798; c=relaxed/simple;
	bh=VxA7xozyGLK0LLCMm62CBbAm+HBWU+eTUB895uTPzLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mW78w9+IMHcDUzHK9Btt7f7heO90ONjkMs6Os8r4qEUF/O6nO2r0XSyiK1FwhKiWksDbnoilbthrvS2l8CizZfZcQbrGoaHwzuEfIA0eo5ZLiwDg5T6trmSgEZZ/vwbzvji3YT04aDyUxBuEu1DBCT90i8G4h57QUljntwEDdz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZVMTSK7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rnm3tNyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZVMTSK7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rnm3tNyc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71SuW949420
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=; b=WZVMTSK7E8dwP/Yt
	hc2ER/YwcjTHBSCakDAr9EEVZsf/7X5XBm7RNwAbvffj6rcWGts9LY/jAKAM/76w
	EW+i4bXKL52NfjmELsvH7lSqxy1YV2yWItYTsQzvQ/F/J1H3kcuOf0Ki9XOmq6GW
	J/yo+j3nLeTXHeaQJhz+PnK3Qb2JLdijBnL7Jqj0pRhp3VLWXKtg9L+sXnGwqqMT
	8AY0evEd84vMIzpjmRs09z3FkVzUko7wjCIGmCWb8ChQBPQ3hhat+W1noqpCIBx+
	xPUzqj1LxdTXQKHuv/N2MxxS6G8NKYsAwHykg01hk6d9wPs+MSuDzPMs/KFlOyR+
	IHtt7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcpyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50947db2e97so36615681cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259795; x=1774864595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=Rnm3tNycel9dogNNLxriJheixofjWHs36lL1AyR8HNit8T4yR/qZHhbmS27IdYREwv
         Pi++jufHm/qIZPnVNI0n5EAxHcn9jns7pzH/u7wVoI6FepS2gkdLJH98VyJ2X6ewBaCO
         /mQNYf/tbUoTyY1USb4bGYCmQxzQTIRcSyzjn9uXag9F4IZEJsxm6mqz44G1o6y2JJdJ
         x/8HBiW2slADK6ogs+Z3a72OljN2pG+S3UxPGMqEDqYRMudrU9r+5yRlVFAb9fpsHWD3
         ubrL6WJZUQbLtGWx4COJMsMtGGqdaXBi+tyb5oHKQmLlMLwZ6Vifbca60FKDu+ivQXjE
         wdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259795; x=1774864595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=KzeEYOSaCcd0qDuMTdE2dclaU8q5iJYnmmjUFE7GH+Mw67dQJ7HGSSH6XQJCMgfTk/
         K+f88ocjPBkscGJ4wivRSC2HXwLpYIvCZ7slGVGCvKYNi+UNFqB9DhfEqwGm3Bowv18U
         9gRuw64dEsMOojo4fw0BT9Xpt3P412HOIRHnWm/k5WJJZwvZ3vNF9uci75xAYmBLI9jr
         LsNXFvUiOXC9NqHkaWUAA40AReI7yyKHJkfct8eDUG9HTPn9RPffq/jRYq+GH6WkGAVv
         RPatWkxlFsBO+5NEeCdfKMtxf+nExSweZj6nQn4LcgMVEQpXjUL/5pA+7P7pGJh8TJLF
         2CdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvpZapjiR0I9a5SKPiKBB97//JrkQM1FLsYJMlK0LLspXYvVtesJA0WoieIwoGvhITs2kO0ESaUI5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5L7zb4xXahUIV1P8iqftY0DWVNqDWTj06cUWeuYTyudzwn1+
	OEyNJncgvIE7wMvTKP31LrgiLsQP31/Vb6h+uhV3xxfrdxP7t5aWABz9YUfYmMIFeQacj3SYNvi
	Quu6itQ6K8QCOu9yCv893KJYnuzZCn454RVjDfTaNL1q2tRpy/N0Yi1LUh1fCy8h+
X-Gm-Gg: ATEYQzza6t45guFXBmvRCYYhXJExo94Xt8Pj8c1LZdVHdzeMvu0cbuG8ioJUIFa3up1
	6UegQoqdYQQz+/q1QAjx6cQTPQVs1XWvlgUS1zf9jdF6r08VgwB5JMl7JLEG+cLsqSk8yumRqmY
	g3KupKUxxlGmwKdYAmkXEDLSywf5ow8NCMWqLpU27u+6B3Dsu62C3lOBD0iAqrKnnCpYk+2wB2o
	2mnvLvopTSVwFnOttW9Luh/c1lGbKrFfKVCX5dgMUFCmB6iG5Mekwyz6+JzHCGAyfOgZmFjk1R5
	gFmWzsiib1m3H2IFoxeVnfsegt7FVIp6wG0HKJxsx033KrSNshTcaAgJ/ghZtH8a4ZTeyI/cFT9
	61VmcYzbDq9LM1wdKbE+6cd5rB1HBVUS0ymG5U0wLrenVC8Cc78FfatQXkxq6amJNCNVTx762oe
	XYd14=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701381cf.9.1774259795169;
        Mon, 23 Mar 2026 02:56:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701241cf.9.1774259794756;
        Mon, 23 Mar 2026 02:56:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm2467287e87.41.2026.03.23.02.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:33 -0700 (PDT)
Message-ID: <8be2b64e-7df4-419c-84ab-bd4d728bb282@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10e54 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=P4yiY5-ZpFYs4z6YB5kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-ORIG-GUID: 7vfcUUAaXMDx4rUoWKA28fWxjZ84ANzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXw84dtW5MBHHj
 u930wTRrnuimacrHr0cyVXCrjydj3STsYL7i7fbl/W/c3k8DU3YcBVDahDmhy0Z6gnXb0zZVerk
 r37F4AnZI7ohsDHVFHgA5qUlQg5J2Y6cFRdW1OqxKPOsOxolQDtwS0rlKMI1msLum+CJCYUVyeX
 A28+3E0Y8gzlfk6qIv9Y73OC5flf2/ndmMgdYcwAdR2v1AipwLUT12k/zaC5ALBlpR3zd45fyob
 dzNl+7PmR5YyQXNOXinwHN1gipaJAaEvzQvNcVe6f5wkQN46MnLP4dlFqZWojRB9zjWDcPjeXJ+
 T6srBHCTQZMoK4K96L1dy2FN4e1K3C0FUON56AiC4Jh/FJ5flrSfPbxFOAyvEY3b5fOjF8s/4Vj
 wvjuPUfvdTza7eN+RUOqJKjA4GIhZSZUNcR6URgO5Jb1kkixtN6WT3csuk32XJG76AVj3SYbXrA
 9DhLaxezpR3xVQd3p3A==
X-Proofpoint-GUID: 7vfcUUAaXMDx4rUoWKA28fWxjZ84ANzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
