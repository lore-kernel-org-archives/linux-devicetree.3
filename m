Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC34376A07
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296295; cv=none; b=doJOL8IQQ/RKFDGknQfgEVbxnkGA9I0gOREk0ZqLe1ZSq3cxqvUFIVba7H52DMFBV096AKSt29C2BEnHC1FpmqsJDS15V6wct1EYEvMFtyusWBjPiWc3F2COEljogQATvLdCQg4tC4KZBN06H7PB03ni05Hfw2Oo+RmY1x1RgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296295; c=relaxed/simple;
	bh=y0ohOQUQsQjKkW0i8jiRyaPm1625hq/EctBCh4wmkjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igzJOM8lJTbqJhncKzb8I5ic9zwapOO/IFGhCBy6tXRmrnG3qbAjWhHTBOO0AUnj2ptn5wQwTykyGBKb19N/S2yHXVp+/k+eXcDOvmilxCtPAiaYRVWgbefuqgY8U/25sz2fcvimxmzSRCzYo5WAJno6ppJaCLdF+KHPt3/hQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU+FSvQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGldIADa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU+FSvQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGldIADa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VN8WQP3211001
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=TU+FSvQT2edVb55V
	Nry2/mRwkVZb3mVd0wwM8wR76ihIHoEdAZZZN7x2kdQ+f3VcBMXjPd8oYnfluC0a
	1k75n5F1ZRr7SOwbZHq6JmarRR7aklFuF2kSLc/IheXzjgYP88mGh3cNgu8kpTWh
	5Y2vrsnXYghJOpKYstVqahN++SwR6/8WsESZaELCZKdGL0oqp9+rNdfBnIKGzmDt
	ObopznuiINieCCxjglsyKI56RT3hRYPqapeYDL2QKwuOj/6Y2ChquD2/QKeRWOPz
	FsZKQer/yYRTOULRB5xkWUT2dU22XXio/Y2y4ekSrqqzD0a6PBB3Hxzgjg92weoX
	yiVOjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98e203-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:44:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c854c4b740cso3300219a12.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296292; x=1780901092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=TGldIADa+ckhM+Ta7BIKVHJBunq0m1GK8WKOh2elvXQMZj3PatDVkS96Y25+0BffOo
         zLLAy2MPajAdHLo2BW34o7/vjyjfQIaGKG2ICFIUD0McvCra0feptcqc90cNqXzSO6mp
         nFGptfg4pNruXJs6msMWASfDH3PkauRNJ/G9OnNkT31QLB0qkE1fxzNhKXCpss2IFhq6
         6VQQDfPw1L8UCUB8lP6FKWvZ7TzjXtHOr+ZA1MFg2LpDrxb+2X4cywhFA2rako06IZBM
         faJfEPhg8TsmhvkVyGkYloFFNZ0vM/vSgczJsc0BA4xp/Nk34w2A9ETxEaMbnckTcbWI
         dotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296292; x=1780901092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=IIko4gxIzRS5hk/nj9BjdAUrh5czIkX8YPxaljC9KNfOpq9tqgkfCWmpATj4/Ldqbh
         0F3BuGoYboTGmk/hc8VVnwFEZY2OJ61s2TezOgRshqaAyiX8eiIcQLmipXQVU3h+OtqR
         SYfyjXxohU3qATZJlNoMPjDX5TKxtaeZg7us2/Wue6/Qqn9e0Iave2DDsFCxT0NlitCh
         ggPKp5WpT/IgaTUaQ2Z++geF/MD26PJYAo+P/V6Q9DnemJymNGMCzwCuEcXYJtNqmvXz
         eT2/9KJbTVbVeXu73Uid40Q+8TxK7Va9aYHt6r5AhDSW18i+Ht5bxTN/2GB5PfrZHXuf
         5B8w==
X-Forwarded-Encrypted: i=1; AFNElJ9/Bp3sV2YCizqxdBTtJRtsGzubVVZK+we23HhWkInH+xeGTptM1pzVUylpAazB4QyxRw+QbwautJH+@vger.kernel.org
X-Gm-Message-State: AOJu0YyG15OQ8XAUDBVeBI9mhA4fTriPd4eFzIbfHUkrCBwvG8TfK96S
	mfn5em+ULQ2166W+tF7QWtLeTcToEpYGv7O7EeJj3FQ7UlpxVWqAJ8e5Qoo5Nm/9xf/eifOiycp
	7zQ/vVKARKV/Yq94HTp2G8wHL+zazdfs16oimkWL+Mkqi0YfjImT7JIbCBfWuOtFYA39BaiN4xU
	U=
X-Gm-Gg: Acq92OHVaYhvZAi0IqWyYole0u/xqVWJe94q8BBvIPAFPUccwFlfp8xMZ5Y5h8lLbws
	Izp/bby4cxCx/PwN+KkRhP8LQxYhc6Dm3oRifRtS9QjPeF0kR7/ReHzp3p5Erpqxm27OyeAgpxj
	jMCoVry2ACMlkUE5t4k0F8Dq23f2idNxiavNjHQrAiXEuoj+Uvzy+udoyWifhZP2dj4A1DIzP4w
	BF6aiHkcVrxoeKtdM849E+W2+HbcVVMjWWcJTsSQ6Jy0eQPNkBrxaUqfho/gT5cIBSRzafQnCd/
	SRrId166dXgi9QAEM6fji9ezqx6L0JofheK6YEOfZZ2qbHLHejNsh9nyaojzVHmf61J9mSfG5eX
	ZYsbdWHL/TjJVipgV0sm0auTOiLCNKm9+UfwTP6MjqnidlBJr9UlZe26ggGlw6Q==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977785637.17.1780296292500;
        Sun, 31 May 2026 23:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977746637.17.1780296291949;
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423ea48bccsm4142372b3a.13.2026.05.31.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Message-ID: <145b763d-49f1-4412-95de-76c22a81a728@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:14:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
 <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Language: en-US
In-Reply-To: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d2a65 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6icYdhiYefjo0O0wKhgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vgF-Zxl0r_TntyIgiTA6oouSs3Nxlf0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfX1LJamWT2qE4S
 pPKvIM1DCYq9ca/edArLkxtOllv0138j0Kd+bWsnayY4HgIX/QMZ/gnJK0EfFnhRiWwlfXOdbNx
 9H9WZw0Q7TNJPVDRxd+ttV9OIY6RvARWLKMIPrLPJof5wAbkMtfhfpOL8Dby9nu1Ef9ZSGGB74y
 IiD2Va+ZZSFjKPJ+juImiswFgVrjhh2bHCVcyGAHRsgiW3JvvDP6LVJ4t0cNSPGzKQIrOBC136/
 9mg/XL24S+SIHUEV8EWR9Ir5+7DkjHEvTpNvqQ/QpitNC47xzb+7rBLZkkArhvMZ2mPgvI8/dl7
 NhdjzS46TdKBO8h5g9zusr+FWQwKPAIlwFAYn7GviaYF9/1yJZPI/0CTrwag4v+cdAZ+b4I+Tsb
 PJ+0JzL1TevRNo3mHkuUJTqp0xDL3CgzmUO8YIcDaoj0GqKrGYDC5RLlKznVFX9w1CnOoyXhmsg
 dZ8gFxh69Lfk6yTdfMw==
X-Proofpoint-ORIG-GUID: vgF-Zxl0r_TntyIgiTA6oouSs3Nxlf0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065



On 30-05-2026 17:04, Krzysztof Kozlowski wrote:
>>    iommus:
>> +    minItems: 1
> No. Same feedback as before - you need to describe now the items if you
> claim that there is distinction. I already pointed this out to Qualcomm
> at least two or three times.

Thanks for the review. will fix it in v2 by adding per-item
descriptions under iommus.

Regards,
Nihal
