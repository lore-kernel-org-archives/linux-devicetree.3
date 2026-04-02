Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803001EFFA1
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 05:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108045; cv=none; b=PiTcJAdmQQHLsHDNyK+6SL0TmJLZ1QJ620ZtScEDq6iSeRVYoTodbcXeVm59K3YE+K758QNttATGFJGKy30hTmIQEcHYjh5j+/8zILVc8m5+7VBUk9kXgD3VKORQniWKfzALkOBV12EBFu709s4Hft5x5fFw/irgTCQPbMheNjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108045; c=relaxed/simple;
	bh=tiXUAnme7SzQSVdThg47R2AtVPzUaSAa99xfS/+ignk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnWdSuR4lDOzK34HDduwRya3VlmECtMBHzrdYJlqBOwhlQ6ogFXX6qV20nWLmxpj4XF6VGXT+gKQbgp/T29eQifUlw1hiHzt1Vm9r3OPE4PhskbJmOTfvxm3MUkcecGmYkED/h8ThzAfwDn9tK0hMHKq2HM0csWYZfG5SCgsiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCKXPRLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xuw+2zpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCKXPRLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xuw+2zpL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VRsG090853
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 05:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=; b=dCKXPRLApemiQsrc
	CrbrqzT1uTndlJxqlPmRCmX9EcfkTcsPw/ntJ4YEm/BLTt5obqSoOPEJCa158DpC
	trUe46g9XxgJlEnt2bWTl4ASYzcgFtav6T+4spyCCli/qv+uFLHVrjrQ/okC4qRv
	wn1flwjbGmF6QEvFO/khWAKyVbd5NeBCVNaW0KEzajRGdEWkTDWvXuEXCSouQ1wQ
	TSFbXD1CDxhxnInmirfgv/OlMYxokD5ZyKV79c7ZAuZOxoiSxK+EV8yp5zL3SKNW
	+SsqQe0+7V0yUdqIeGwbr6PUzEQtMXodJJEEja2b8y1u2IZFflFfM6jYy4tNvHVn
	l9OMSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu80bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 05:34:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso1101567a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108042; x=1775712842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=;
        b=Xuw+2zpLcJ6ov5QQhDXnOyaB10UoDlhPbHzKdkt/xO9RuvJEENHNNTDtA1ib2Ll7AY
         kbIU+XKgdQs73Vfx4Wa2Suop4KOshEnH78u9PNA2GiNc/aPXA4DSeqspClyNtVZ2hSKR
         PPw6zRPPn0BpZPa6zMfAQF7i8rimSzL6Wy1cGnd3VE1oJwGPfenCXcY3WLqimzS3pwPO
         8b6G6ctsAuRy+aPGsV6kRaOwxxFi555DhCs7iWUAq9s/qGnEFTyLN+LguaL78FVpFBCz
         mgsmLB/+MFKCay2qTmfIYJG5sMFZ6p1POgEA4Fw/hP8bo32LS7ZdLstfGf5LP8440lAB
         Wezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108042; x=1775712842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=;
        b=rhvRDgJglbDCPoXviKAd42jj0iO8KrdB6M19HDSVlOLsvr/5achr9ge/1VdhC/uSp3
         gJX5z/AuojftCnfCaSfMj0ok1EQHBo1ICf4UjGE/qCs+S8IuQgf+dRYrGgPOaBCnJZvJ
         GgXHdUXmBaZxM/JUjUzdTTLUolNTxvuatCTr+gTK71fkTwrghYqbNowjYQfxJGPmwX52
         F7bslulNiNU/odA/fUaig7Qt6fgfJhQPEOCDnYka2ckhLNAH7x7Y+0Vb0T88G4hEsWIP
         ClN4KMkl1+E5RiXUQ5fvd6DmOd3BtmT8BxMP2rD5sc9v2E3a4XaFMV6GbM6Aniep4bkZ
         luDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnWdTd/uHjPUNYXr/AHbIoPNfHjqn4+USTW1ESpi/WESgfTaGkHIM7/f9ggLjNs4tU8z1smlM7mxjs@vger.kernel.org
X-Gm-Message-State: AOJu0YyXICQwNCpY4yndzMc+E6WGi3kj5pdDJSE4CMHyuhG7U3W2yw2R
	FbHWpnuXG4CXBlqj/976ug9/CsMIf8YmLrS8MIj4j9QX9BBo+/ENNaH8KlNAcxQzJr3D10PbmSL
	O/qlVVAxFH5tZ3zPxNT9B7ZcgT2s3oyUf8MEvLJ5ylhw3GJzsvAlKQJlxa4sfZ6Bs
X-Gm-Gg: AeBDiesvlDvntCv3y3TYku16N9UtcoWmqjFe0vWjbmi/E36Oe7KsFkpHOAxjnSARFQw
	4wyv1QbnXI9OEWsUgEtfbb01AxX5Lh0bRKUZczca48zBKyrZ8hv2WCvDTeReUmSMJ587/WD9TNI
	xsiEIyj1uVJDhvyi5XrfD2torZezk85XMYB5zgCRaOe/2Q+uVgyG3Ke+DGL1bDdmmpVkHWBb4e6
	s5E6udv/tPfnJIL7vvdh2YYMbAw5k3/O9Z6sHiKMrg4JaYKltaN3ngI0oh3tfVqgSCKzdep89/U
	rPBVhYCP3EKuqu0isAi1mOLekrgnExlZu8Wf0KXVxNlPdoMZDeWPVcBNXEQLH836YsJ85dC9Ujq
	1aonE+cTcTFDWpKYwGE5TLeuk7xwrGf+/BWTpf5uO+t0PggDd9w==
X-Received: by 2002:a17:90b:1344:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35dc6f5fde7mr6087095a91.17.1775108042472;
        Wed, 01 Apr 2026 22:34:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1344:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35dc6f5fde7mr6087050a91.17.1775108041987;
        Wed, 01 Apr 2026 22:34:01 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm6744589a91.8.2026.04.01.22.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 22:34:01 -0700 (PDT)
Message-ID: <7866c1b6-7bd0-4202-93d1-955d60218b43@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:03:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
 <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
 <382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0NiBTYWx0ZWRfX64s/lxi6JXKS
 b1Ef68a474GYB7Z2b1A30D6hxdCWJZ6OWqyGhj6s90PQvRSKzxtqFeU6YsbF+uJvsjAXCW+SqJO
 LoxeTmQ+l6LZJxVaVd75umR4phIDi2Skm9vmK0ak5sPDZAOVBb0mdqcC1hgiXCLnCMrrwN662bI
 BToniSLh/h78eyvL5JsDtIz8TP61tBIojeAT+cbXjFhWjYtOu+q+Ah3NGjkTcrkTtdqIpN3HZlA
 HnD3duLvWYnN/5OKt+7xCwEXlp6ng8FLsS2RPHeboM1SlpNPHzNwCBLQziZ+1jQOCS13KIgbopL
 jwTPa2LhJBNN2A05Wf5E8OFekykx1OMQnlJ5OX4Ey/45M0sZCDbBMfWxkpuR1DEzpxMNB5DPknZ
 e0VKfYWxOOV39qd3w4or7uZ8K2t/JqE3q8BuSsovUiw5XDYk3xMYRNz3oeF8wiBF6dTlIucgjm5
 QeSbRjvygN5IHXUAUZA==
X-Proofpoint-GUID: gsmFWZuXl7f6B4j9ue9XWURi7jjUrzke
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69cdffcb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=E-vbLytUzHry21UsOq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: gsmFWZuXl7f6B4j9ue9XWURi7jjUrzke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020046



On 3/3/2026 3:35 PM, Konrad Dybcio wrote:
>> Konrad, MxA is always ON, and with the current clock configuration, a
>> performance vote isn’t required because the clock controller currently
>> votes only for the minimum level.
> Yes, it's on, however I'm asking whether it needs to be at any specific
> higher OPP as the clocks are scaled to higher rates.
> 
> In particular, PLL2 and the MCLK RCGs/branches have *some* references
> to MXA, yet their FMAX is possible @ LOWSVS_D1, so it may be that we
> *effectively* don't need any.

Sorry for the late response, Konrad. The PLL2 operates at a fixed
frequency. The maximum frequency derived from the MCLK RCGs/branches is
68.57 MHz, which can be achieved at LOWSVS_D1.

Therefore, MxA at LOWSVS_D1 should be sufficient for the MCLKs to
operate, and no explicit voting is required.

-- 
Thanks,
Taniya Das

