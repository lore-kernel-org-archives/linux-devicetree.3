Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693390;
	b=hoydh0bfa/DBOaaoAcIlzW6lWTx0kTb1vY8tpzj2USphyvrvcy+v+RJ6/LzcnSkq5w76
	 QBfCl5RryatD+gmwsKf/9SCpq8c9AcIVTwtODvvlvft7Od1z5OOSIy/Sraojn6ynG9URK
	 5GLRX44yj4EKhb5RhWcZzkoSBjr/iM6ClZaNmnYAqNlTq/lKQ6CTn9AJEZXmKoLYlnJ2x
	 2U+b4baRPwC3dYPgYtmt7BEZMz5ckdRcyrEB4eINLpKhYvf8isABBLba9NkDj6/7HJDaq
	 DjYdeVsFDL1N4zeibKlDVAEgWDstsBWcV/WuyYPHjghOxVwmwdReejLH+bitjeCw7ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
	b=VoCS9viT49iCfwsNLPjTOP0pFXErH9A4fz22pTcHpLgk7Qx6NjeHfuy3KcaaFMolwBuW
	 36TFWfl10TEr7hQydRCcEVf6slkN12V07i1z5/Sp+sbN+92C/a4bGhx5IMgjpWRY9keeG
	 CAkIxCB2CSl0cGTp76KxYPU1Zn15KWmevVvdzs4c+jzphAzb3QHaBrPNmTgGFzIbHWOJF
	 cc270d+GbP0AofPFmgMI9kmsQzDXAjGFx8c3dGI+aeaHcUbXIrHeKbsWhgfEocR2FirTH
	 +Bsda0BDJtG1tNTHHwrZQTSf4cf5NIcs//SJ4YoG25me/Q+h7xMtHfW+iHtPCIKqxeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ph/l1Nb4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BF606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph/l1Nb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVaQe2263599
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=; b=Ph/l1Nb46qAXKfsC
	hyU7zCheehfxWT4PC437hldcVQcirZYNI6wZxfMO6DWMr9ipcXXx8Kc1DGaOhby7
	Ogfn5blLfhe9b8OfC1ftRmFzp6ebCGUe2NSahdxUyC28/izEQG1hHelH38r28KAO
	RMppqdpaOaQxd1Z0hKa+vNBNW5Kuqz2vA+4gORX5maUMobVt2WuYkH6oNm5nXYa6
	2Hv4pY852MHss3mwbaZXQ6xUiD+6ss4sG/qaKGxnzSKWMMRFIOsAL7wrU6Ka+N6K
	y1hZo9Stexzgd44BAyvlk8FQDNN1qFFh+AGJy7AOdsnA5AO+DgA9ZZCe94FIbQ4j
	kUmAwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekxsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:43:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c4997063aso19481921cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693388; x=1796298188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=UtJF6JCaxBGZMfyGbRZmWPT4cpp2/DhODVOalw1RyH/JjnNftzzl+CP4RbFWNcUsr/
         hfjMuAAP2ced6WeZNV2YacTCcgoN6bSdKeP5fBsQq299aLsB8ihDamL01pu9yI1gMF0l
         D34Aqbeys5ZmG0cemu4LCFa723cQ29REP+hcUOUkq25OPeqA0ZiBWE94ZWhg7iQnusiL
         /HNa/ChktFJB6G9kIef134cmTY/+jZNZ1J8bVbRGhB/POC+E9S74bIgiIFECbNEdQ1/6
         9PS8shuGjN6iV401BnBMhlHs5cJ/mgOYsJRJTPdgrWpYgN+IgtTy4tS/pgXWyIfy9bcv
         Xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693388; x=1796298188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=v1vq4p+9M+vAU9GJqr29KcUXtm6lTLBHQmPqRGKk+7zS7QjqH5Ycu+bO/rpvjPIftF
         F9W4w9X3aKxJDTNe+zqzLW2T0aHlGX99dZGxO1ddtADklQKNYbIJIdV0y6IbnQJfKwoU
         8j/p9ap3g7OHfFq9h88yHdADjGthMe6Z5zIuZ3Xto1/7R2WRND/6M7uZdz+nUTzr6UFT
         wvaot9uW2k0RTHHiUBZyBiT6RodKeyUdNSqht8wjE+aZg9AVU52Q5mO75y58UU6Pgxby
         CAYE0VcTwDxJYqkAKN2GFZcG7JbqedeldIhgznZAqdgUOhbI9/5MyQNpNHU6tNHm96Ae
         RV2Q==
X-Forwarded-Encrypted: i=1; AL+hErH5sQuwSgkiHj9Db+c2M/AQUF1i8mAfUI7yO3mlHivRbfbKUXV2+W327pRtadNZE8LDvw1r4LPiKhp0@vger.kernel.org
X-Gm-Message-State: APuU4Z8CZtxJ1WFhI73L3kotF4s0ihbhIUCnOs50AiWtu/pB5ysC/Uqk
	eudjSyxgJQrxCsuoA/aSwgTHA7Yr8mCTOQEZ84owFQVmh9+CFRajD41GCeCqX5OjOpIT0Ejkpfd
	rKD6UIcjJkWY1vk4GP2Tg0otaT2BfweVbNxFvg94uhsrZF7y7BoVqyIoG76K4hyE2
X-Gm-Gg: AZFdTZeqPPGZ9vpgMMBqpL2PyTBWU6w4AZvoYR4IEB0ScTPTyoyG1aKPsFld3I5aRna
	RYb0QGrn5jtiyhJhKzCGL5FxzvsmfNH13rCdKW0s9Mt8xjz7GzlHk3HSfwsL4W4QGUiFcwg5nVr
	4OCdXyQ1Hp1LDGzb0r4t2MMrBjwVP5ABzo9Wb9zN3oGXDqBF4gxtPF11+7AqNvux7MycjC7L4W0
	rSrzcqlrdFHeEscacO1GPrl/I+oy5CwXm6S/2rvK2DmfDWju+Ol53BIk8whwhSekNepK8gqhq/L
	+W/tOHAp4br/npQlui8G8doVT4O5J9rFZ4DdsrWtbanVpNaTJJQK3mXfWthyr/CL5YqVKajXRYW
	5JO8bRIqFTiQ5OgXJ/8bChGOdAjcXNtkmVkntspqADI+lNQ6cfses8D8G38HnyAmtLdXQFu8=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742101285a.3.1795693387931;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742094985a.3.1795693387401;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm769058066b.25.2026.11.26.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:43:06 -0800 (PST)
Message-ID: <91e80164-620f-482d-add6-cda9cb8550c1@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:05 +0100
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
 <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX2zCzATErM+nv
 yUUUP3RroW+i70AJEBtEtww9LbWxAQrzcehFwTi6CN5Pla21toXqf3CM6ulvWWn/ByGkay5al98
 vUjXnPRuiKpD4YBweZojqsMmr4z8kQu5BIRqKBWaLUpiG81xkYa3h5MZ1LsSTRBGp64PluGps/8
 LFQe3zQiEyxdmobwG8XpHVqbHPat3VewL0pk8VR9kuRz9ECfAC2Nhpkq4tEiMQb4REbJb5xFLkP
 +LadHIi6JojrgkaKzkuvFH2K2Qvvi7QV4IBP1Efr/VwUK1UPRNAMXS5nK+NS9LGdGMj/YEXlRdT
 82OvL4AzYlB4WhoICaNPE6J63OFc2okumj4eS375vs7AtV/ktRQxtnmu1/eE3veoN94XGyAjLLq
 WFSIvhaTy7x3BBJKNsHF7zFcNMFV+AkGwEWgp9j1RymWQf4sSrtDHp1Ym8QWEMnF3ZZf7cD3lXN
 OcgPHd10rW7dnCpQJ/A==
X-Proofpoint-GUID: QOw_PihS2AhaB_yds5xSLheryF6cBAf1
X-Proofpoint-ORIG-GUID: QOw_PihS2AhaB_yds5xSLheryF6cBAf1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX4A8p0cfdvV09
 0zya2iuECgaRrKuG2uCkK3hNKQu74Hi+b9pNfKzdFpNRjQlyk+PKtL2YFQyqFpvIy7suGz+XiNe
 Weh8vSUeaF3vJmNaIvvRmCSEy+VXoZo=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081b4d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rtFBXQNc0A1WECV3onsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The geni-se driver loads the QUP firmware into a serial engine that the
> boot firmware has left unprogrammed, but only if the wrapper node names
> the image. Without the name such engines fail to probe:
> 
>   geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22
> 
> On the UNO Q this happens for every I2C, SPI and UART controller except
> the console when the board boots TF-A and OP-TEE instead of QTEE.
> 
> Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
> the image the stock boot chain loads from the qupfw partition. Engines
> that are already programmed are not touched.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
