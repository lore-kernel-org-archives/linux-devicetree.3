Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789126;
	b=ib4fJtr33f+0a2XqnH6j/dtO75r2Bga/4cRBw33rj0UVlkFmM+k6uA9syuXX4An8sCbj
	 YVNnECdwvQP/7X4+axpBTzFge8NuOyLQcldU28DYLRbyDCA/Kz7QjXTLR4aY1mXGPVoH0
	 /oV2o3uC0+MSuhlVdSJ/Kwx4zDzcH05BBoMTn+pz5njLAv1SnNe/yxRyeV6hgwlPxiyL6
	 Md15elEY0ibaAxUQWAoZN+yl4cyuCCXl8rsSITIflu3BfyQJS+DxXSINmYvrcUwbb15/T
	 g+HK+amy/cM4cttYqjfnaE077RE1i7bKINO0sxB7mbfvTsHDKGPZYGn+bIggs2H2kyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
	b=Jh/ov9ODE1ACkyNwTg0Fr90DrvKOAtP96pmFlYzkKKRTGStMLAEt6BXk14yilHjKPGyn
	 Y8I/PjvVJWSdf/Bnsq+EzOJ4O9gTaDb2NgqSXbXd0edi6xvLwDh5I9ed4+1hjG+9UQeb6
	 Fr2dqvNz2NDfFWIE1Gq1uoKv2i+2FqRffF5jAEwMmIm2GzE5sa02eJLMyOzz/v0eytrrf
	 Pwq+MW3ltgLVZZlqVf1Y2HWoE9aZ5aYi2W9VgsGZZkW5w6dVpThhfStXrrN1vriRDPBFy
	 l94CfltbT7Z8g4lVWwdV2wwQOOr804+8arrOz159tnbZZB3iQ3FVCL6iKJtIWc37D/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/36J6pi";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F6606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/36J6pi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1NJ02683952
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=; b=MpM2d2sQOjX3C0iJ
	5SFCSPvUX/RSIwDOi2p4mbqjLG10v6T1+JoVIbq4saOZxqoME7DZHOQEM4CUBKHt
	HmfJpr8k2Tu4UCON5RI+9PIgus1a6kbh/PKgxAweGTyImjN1yGZDkAu7nTKlg6n5
	20/R5GtCHKALP+yYEhCGJ4q5RLV6IPZktenLUzjTmMCHripjCNyf+dARgpNZbyJK
	ijaBLSNrkPpZKNVrgGAGATJDIBNsB+UUmscbAJUSDLsvGnaUKnFmTHLOTrMnciN/
	6bL4cBBqCDjq15sNiLj8iqJqr+xERlScDE0iSmSbh5diX0Zap0FNfUTbUfiUw3KG
	m8fucg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj048-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:18:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso356759e0c.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789124; x=1796393924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=R/36J6piOOlMDb2xMKz4Mwuw6vOSFF/6NvYMvOGCGTcGH093N+OxfgLC5KZClDwxdu
         MOBxEGfiLzZIihwGORMSqmkib3nM4NtVzzALcItBc1Kaaaee7EVCEcLqrUZYJAZXmw0W
         2dfBukJRGQF76fN30W9tp8CFa8DdJPkmkKlTiBYX4JnfSgHhhKFiN8gaE7w4BbAjQrHK
         ARdHducKV4dehjRxyxQnqcCpJNvFH6aNtPyeToarQc2/IzpOUkFsZccrLnTfir4vawsr
         DFOal8uvMsGvTql37cFcDkNdizMRqJlDF8aDJwArIRNtJFF4FeR0bo89BGO0pKZNoTOz
         BwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789124; x=1796393924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=ayg8BJ6vPZDh/Y4ttJyW/PkliU3/znRgNSzF7IuBnfg1XvAu4FfToQkO2UEzi/auyM
         6E9uZynjyuW2tEIV02PIAN0J9g+fgYGDRk2WsUzpdCES4v5EMeDOso28fNpcxjBATOY0
         tL40oaTf/q01AxiFFr57AWPRRDuNJaQSR9b1h5eTxnRST/R3y/Nau3VJe+zvz1jO1DcZ
         p+A63Nd+rYx7DOSOkV+3VYwuqnXl2Okm5ULtU1mMn4k/yj2flQYj6FSM+LB6fuDfvdPK
         9toC8bqHKDdbnb7+XR3eDczBESdS9qJcw03QFfXTvLSwbYqvYKJc6EEHFkgyA0fB/Yla
         XBxw==
X-Forwarded-Encrypted: i=1; AL+hErEbG3zgHfMyZsK39wMN5Gebw49pxq8uKqOc/SMtkS1H68BllOmy/itsHzg/YHn2INKx/GU7mOB4siTx@vger.kernel.org
X-Gm-Message-State: APuU4Z/2nC24sg9g1Uvs5TBbCdLukyLD6+u2RMfW5vrwtwJ+LvVSt+Wc
	CKkV3gLby0uuMc3ZENqwfy6RXiR2BMNU9nYwtKIqfQ5rJ4zqzHy5NQtAO3bE5/62qnO27ePIbBn
	kTpA/ZmoxE1unIuTNhqBMpEkdtCfVxhvfJoB9y+c20MsWOfU1tXbyawmEI5SAmcWC
X-Gm-Gg: AZFdTZdYjfqvsDneVxc0EJfkI45JaVjo5dzAt3TlClTvSOhyNsw4/5YSyxO4V8cJWf/
	M91rrg+4uAizh5p5ya1FnzhHZPdUsssdpTrv/lrLhoyGkS3t5CXSphnwXnAKooavQrgiZXRltEv
	0eO+XP3jfBSTQzGfr0nDb60fb/W4evHxSHLxVmuCtXRwulLSsLwi1Z6lJBIR49i7tofOiAPRowM
	YtTJu/5XHIE7L6iIXqpW/gq/Y1G9t6T7/vd0bvPZRhOQzwuuJAeJgXaOeeSFudexegnKQ64oSsb
	mhY7x3DeHp61a/VtTNj8SkxE7l4HJKy6oNE76h9dhI/vsSnAlSDO00jGa11FXnZ6ShtBeCJ2rEK
	9HY0SYK8sQOwZOBXoIDZIlpiZL/WIMy/07zF1YDHMtImMwNaRKo2Kjlv9Pv5QIW+uPQ31cy4=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084634e0c.2.1795789123669;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084556e0c.2.1795789123132;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm876314966b.21.2026.11.27.06.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:18:42 -0800 (PST)
Message-ID: <39f263a8-f664-490c-ab25-5efb4bc606f5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:40 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXwpmOPwwOGV0k
 TWlZmIUJwgiCu/HeLfEPuWCuQ695T/Qi7HVzyq5envDdn6TpXO3Ce7ChKkIVWkGbLvdUeODrxVy
 bMBC4evKkg1FyqgjRIExhd0VA0HzF50=
X-Proofpoint-ORIG-GUID: 5a4XksqsfOuNLpOpU2nKayOHWDmntumN
X-Proofpoint-GUID: 5a4XksqsfOuNLpOpU2nKayOHWDmntumN
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b099144 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QFD2gNDBM12XyJM7r4gA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX5YIpz6o1jzFE
 ZPw9llz2QLQJqMQi5sVseJi/E0WyjupdlmjPSKWQ0A8I6yNUocwZV29nXFGSsmAxZih+BCD3miQ
 SpdHHdlEk/o58K4oNVCtjnQKjdELtKClQvAO/6/V+0Jv5TEWqkCI9xhjKxUtGsgNB+zE/ETNKCf
 YDxy51hD52Tl7TwbgYLCx8lHxmgL0RH0tCfxbShnICPkOB52tSIIcAdi9yfly3/znHf7krr5Nkz
 IeOZO0PnRGYvg2gTUcFsqFC9l9escAKx0mKrwl6vj5tVHyyxDaA3IyYv9u5Do+Tn/oc4HMEVN5h
 NDPCkONlcJl+G1SRQNjOJ7p1NjywaPLVtQ17iKA0lhK+L4d1Pvm/PiH4qPBnaVWBXrw2MXcM3zx
 HGCj6PvhAvQR+svXbUf13pIY/7vaK8fWaArC4F/qxqkkV0EOv8yZkJmRzHSNL4OwwmtwWeBHsC/
 CbcyVaKXKw+g33EUa3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/23/26 1:27 PM, Akash Kumar wrote:
> Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
> Shikra CQM, CQS and IQS platforms, and wire up their connectors to
> the corresponding USB controllers.
> 
> CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
> I2C3, connected to the HS-only usb_2 controller. IQS exposes two
> USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
> first port is HS-only and connects to usb_2, while the second port
> carries both the HS and SuperSpeed lanes and connects to usb_1 and
> its QMP SS PHY.
> 
> Both affected USB controllers are switched from the board-default
> peripheral-only mode to OTG, so that the role-switch framework can

Is there a real reason for keeping the peripheral override in
shikra-evk now, or was it only a convenient shortcut beforehand?

OTG is the default value, so preferably we would drop all overrides

Konrad
