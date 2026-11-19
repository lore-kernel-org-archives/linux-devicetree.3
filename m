Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081931;
	b=THWaSZM0colhCD3u3KvnOx7180ASQohIHM5gp8lvREBzUTQtUn+hiwzLN+SvPrWD5/zB
	 QzrRC99cpFXPhxlQM9vvSLG5pSvk8UIbOK/rNWZyYZEW3L8jElOgXegoOEYbIbIq6qYyM
	 7FNEE9l3sDXMcDsmLBWwO2svFzuAEDk+k3xkf6leuOJq9kDTt3jV9X43937HARra5V7VA
	 pOkTqrm64elGGNmGmsLt/LarOLkgxgfwBOgNn3IQ2Iw0ecwXOvhR971WhhKM/OOzt6GGs
	 YhiRBCfdtd0CiAbJtQNMDfgj2+c/C/mQGxdOoTBwHzBu0m7hBvDUGywuK3xngA53fIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
	b=vNu1SwjOzhUaWfqTEwhkMWwTeQvuVpWxWlMbeChYwbLTQeJgMdMo7kYrRStdakdYYNv/
	 1wn79esmrKK6Q4jVIPLm+FaKkwmaSXlgEw26fsfIls6aEidm44/y+7EEcdmARayZEOeMy
	 jl6i875/fJjHUJ0zJYNWPKj836p6/9dekb4yapLMNs747Dyq/bqmoiEti2/p/oqjFgPqP
	 XBHnpegBwDO9RXpLKV1wSG2R9/dKRruFXyX0qQQY8u32zhVTixr9jkfqCpsDiPY26Hqbl
	 u5llfVpYrJEqjDQfRaopyCu3tRtjuCeAMgtpnJnCW5UBC31qIrtcSDxsm6FesTDV9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/1//x+S";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5C606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/1//x+S
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWmm330695
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=; b=VFyt1hB+9wQlMz+p
	hOTNWkff0nFqw6MVRCUzaZSOS4DLhAAoiXOhIsfPwE+F2FUyHE2/owOWSnfbZGwV
	AKtSLHpusLYDsD58Sq87Ajl8DyiWAKANA0U1Iyx+7EW9HKaWcOsUWZkWUpPyIjyb
	Lv9X/WVn4kE81U3rso7Bp4K3aEgM4iKOl5z9ZtIuyZ4fWGC/bRt65P79YzuVFQ0B
	knCPijvz8QYkZSt6BQDaTXKDXWUr7DxKK45ixEREdap8n5auGnI97+eh6+oYhhHg
	fxM9wftRjPUPJU6wjUWyZnYy0F9UUH6rO9YPnCaFJ17dCeIiXvmB4HVRDi1NMiNC
	4LO9tg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkwa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:52:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso806189a91.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081929; x=1795686729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=M/1//x+SX1LSinI/YBU/2HjQonY8ab9IMrHpR1/skqyGFYLRjbWy29ejKAoKoXUZ15
         GD/xY/nibitxhsBlXTBZnZxV65Of8KshUkKsqooWS4Jd9rizphTyXuodi+AlsXJax5W+
         fdxPtyc4eDYp/Bxy83qSF5ZQrJTiCkiif1OT+vsQWfcbacVDfV6Bida6qymifL4eJAqm
         heQ+RC6EvvMcoY3MSHRiRYlnpER2ThHiUppBSZxe/UyhA88/pjaTuI3d9rU7fNJnzpmM
         kZ90rx6l8lPs4KykbVd8wWB81aAi1aIud5N83iCPKbeWQXA0wECPuq+58CEaQEKHQbBj
         /5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081929; x=1795686729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=lkR/eNtrMNOfQ32DspkuSyQg/WODoi6gUCvfxqjF0pKlzDKNAVsm1ZZzEAl/SirsBX
         NaprI8rzPjNPr56J7dw+rB5N5Kj2aO2vc32vuOLHC/tn83ePbk6INonpPjhM/iustnUc
         L4f/8DpX0UsbZgyXP5Y9O2t6dhRz18xLhiqHutAy7HWR5kTV1tcc+nyTqplATo+7E98Q
         RP0D5Et+flRsVvxDRHew1jIRRKRa5J8Cr1YvU6xM9b0unlah89Zk0g5FnD12N5fp1wzW
         BsqTkpJww8l2Y0GqBJhtp7d8ombqAORqw3xp5WdamGbJoz6vNX9z5xu5GFBDrEF56Xgq
         fpNA==
X-Forwarded-Encrypted: i=1; AL+hErEy7DSa3Uy5lQf20gKWmryXqWvn/7RA9Od1EtWf1YQydYRcWankN5fjIPb7FJbH8evLaW3P1Pr6eIxK@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3BsDw2SqOl9N1Gpzupm3nn5GJ/wGh4WmcJPzFHI5NQxBPzoz
	lERXKn/WjGF57+qKtSFKzMrKV5zFP9Ra2Ankrc1ld5YKCWL00WlTsP3VWYpAq5IhbvPY+1LaqV+
	IClMo8U0eqts6uGY83KeQgx/CcExHtvxBKKMSjriUAuN/GUoIvXWg/CVzdo/Pe8xw
X-Gm-Gg: AZFdTZcLqlK/TcRYT2u7rIbqRV46c91qeDxTg664dzs77RNA9goV5VgxfqJaCw+8xif
	v5f9zG9tar9I0BFmvdbwJtag5OAQluKmW06EYXFKVcQdcq46RA1nGTcADjN7OjCectiQrMsPs6n
	MlXQJPkGtMB4swQ71ci5GCN4WUhRATHgQM/NmnDeQQVy8wGvtspjS+mBbC5naKjNEtsTj6MnD4L
	BM/PPBzZ5/OgyOvpSNRI/+V4ERDpiEWUxM3Ir9w6MPKrfwSJ3UeKs1xeAEXPUthWyDVjcZ32cq7
	SWUa+LzImx6q5rmCtcdHhluwk6Z80k/AaD6EUiQKTD4vyufVmA8gWx4gLEW9til2tt+cOme5oiN
	EeDb64Zz4mijM3aOYd2Yok3Dyu37SoTNY7yVvJPSsYqnzztTYswswNOVZ182vsXSggDZA5vaXD5
	QTvRX0wKw=
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365139a91.33.1795081928848;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365128a91.33.1795081928418;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
Received: from [10.219.49.219] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4028310c5sm1189430a91.3.2026.11.19.01.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:52:07 -0800 (PST)
Message-ID: <813a113d-f4fa-44e1-9616-c01dc5577365@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:22:02 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
 <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WaQ8zyAVhUgb2qV8qI5OuTaDbsmbZ0D4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfXzJmoeR1pkNxH
 h4M7LMT2k1RwQ/JjojDAPQevlux964x0Y7vP5C1M6yf0/PQG9648JiTypzxDmE0lU4UfsaLREhZ
 oZoHOKW9+WPuhhrkJ7FTUA2O2wBSoFUKp7aCZsMIX0s+6OX3zzv/tsNMS3zmLC4YW+KbcTnmrSx
 xtHgVhnhaZ/sGzh7q/3xm5MTmtYEWlYyrXtznHasMIOBpnu/Ebej9r+eeQmAzq8FUpCdu6qLMuJ
 etJI8R5063/irkXFYU14GnPJUhXydcWMQexfzwI3lyw8HNLdB/QQ4sETqBVgswDAOYpvUsV9VzM
 fJeLjTm5IBSH0NhzxPOo708QHTSzoOA4BTPSNRvLPCRkVm9/YfY0EL3tCaWhp6sPJjn4d0BTHVE
 ut/L5sRR5ZwHQxcUO+hjmxnE3dFtCyU4zqeZ1GFWKS+Y2b+1w/gDPeTS8HKPf7mPf0AsLaz28ur
 /ivMKmigqqFqaDD0Tvg==
X-Proofpoint-ORIG-GUID: WaQ8zyAVhUgb2qV8qI5OuTaDbsmbZ0D4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfX6AMOfQaB4M3N
 SzW+WlIfjhX1S4ea8jPoOAfgfD8JrMWriwswea1sqEjbRczdD783uVXm9yFm2abpGGRrLgHNj/u
 D5LeNjEcyLACb0/zxxGjeZ6lT58uWMQ=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afec6c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4tHaGl9kwi2XGHUKs7MA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190039


On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Hawi integrates the Bolero v4.0 TX macro. This version extends the
>> existing TX macro register layout with CFG2 port-select registers,
>> per-path CFG2 registers and an ADPT control block.
>> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_TX_ADPT_CTRL_EN_MASK	GENMASK(7, 0)
> This is also 8 bits wide.
Thanks for the comments Mark,
Right, the enable field covers the entire 8-bit register. Since we clear 
the whole register here, I'll switch this to a direct write and drop the 
mask.

>
>> +	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
>> +
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),
>> +	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
>> +	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
>> +	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
>> +	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},
> These muxes look weird, the different settings don't seem to change
> anything?

The mux options select different values in the CFG1/CFG2 registers, so 
each selection does change the hardware configuration. They all use the 
same |TX SWR_INPUT|route because the input path itself is shared; only the WSA/port 
selection within that path changes. Thanks, Prasad


>
