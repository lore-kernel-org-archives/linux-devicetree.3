Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559344;
	b=wzauRq3HhYhKCyKotbAptmFGaGjY6cVLw7chmTqjBsIDseI8nwvfThxm7z9L58zwsV9J
	 A8JKTp8d9Gq+Ng9B28x5AqdmPmWMjxT9E2zLejve9JrV+j036pVyERkx0YzODO3dVBXrb
	 LNahtaoT8Y2ACGgDfluhaNjGKn7G8l+exIMCmkPqVkUq4MptEpLcj/BrIoSGD4hsPOrzu
	 5HPUSjtNXrP/PZCICiR+V++EQAFU1PNoTXN/cDOIDXWfjYsk0R1037j7orbItOoDOZ/oH
	 aMwmoLvOTGq+ND19+6NIRi7w0Oat7baIEcroQC/XOVEyyj3HyaRJRGuXl/1WbYoSaYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
	b=yog2W+doIN4eZITRw6QocqRRxOjNwsOEq8xoQp/78gPN3Go84gPPW/10gHFaN3ELd9Tp
	 YcWBZlEQvfAmm8d+MAN8xlrjPU7DQk77vWinSdgaoATfVbiAeQXcv+ysBThwfR8DPrUbn
	 s35+5MikX9iUtiQfHekTp2doV8NVGVKM9PX92vTBONzp7xuw0Fa4t5Fr58WldIUCdq0I4
	 7DKkhqj391QBnyTYQ//dFlfZmX+lC4iM7VCXz1E2x5h2uph1tc685v/pho3d+Oqx1SAyu
	 0pg6zD+EMEjRAh28M1qfcsmBG+9WucPX2eJLSb97T1s5zFIMz/HGA7Ou87YkI/phirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336F2606A8B7
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336F2606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvS83164531
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=; b=fGimaLUTuSPB67+L
	gkMMHlc562vtZxedcLBFHVCNY9pUSb5wic+JzVyNQC1ApGW5gxEPJCrGVMbLeGhP
	at0naneyMKTeLeh7CM/W9aU4HVHbb177KouisW5UPzmGkyeeEf/xMk8Sgmj4PNCi
	zb/Bddm9d2PDbV2/x4DROibRhIvH6dC4Juv0BlPKtRSYWSepO0yjekplezkHDyND
	tmQbv5xLCk/YTQyoR7YHZndsEI4+EKZ4s5llIUcHkKEKqwA3WubiOHbWVKXREdes
	G09MQgWippVzJhJ33E3es1ATdU3m4HUN9nWCia8E8yUyUyXXwzZq+F/+3eqpzZXQ
	nldyrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mrxyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533758f24f4so1579961cf.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559341; x=1795164141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=Zvc8X65exbYm+98h5ztZOo1g0aYl2ufrTl4e+b+Q8ebFDiZi7oyZs9zEXAlpXz5MEe
         AzbTG+CcE37JW4oKwYHtBLO+apmh8Qs/6PQWhaq56atoapKmfvm4ek7S6rFq67x+M720
         7h4bSCzzwwFGYcmR7lVeUffSVwyvVInZfwmnGcuTTvi4P45Jt/OYsGlHfwVENVkF2Jjk
         2fmAqLO8IVV+dXNSdHpDC3bleVa2jSUpQFrPXvcCXdCAE1Jl/UstsAFnAK3EHddYz+Ld
         9Cv6zS7CHXRkkydivEWn9iut09Dn1vm3u9BST8kD5eM85v4fZYN1TY2lZsevfd30eBIR
         lGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559341; x=1795164141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=idyOWb0GUUjTk5M3GjIsYIUDPADRCT/2L8giWvjn2uzeV+M86u8mnAJmYzUII66CCE
         9LZHiVWQZPAMuljrzveLZlL0RPld4+FryzIOrKn99A9oiBkQhQ9ZfX6AmnHEN8LpJYc0
         AxA4ht2ZIzJX9y9DkO/CzViE2QERyG7DqPLws/8lAM4wDi4AaQEcotM+sguuv3t5xLkf
         zC8LimKMROVsgox3oCJDMz9aWX09St94RzxAlI6UqOrzmh406cW2CJvrnUiK51zyzMir
         IJ6pIGoQOS2WY0RBygD+tz0918ZrRHyIif24K30fXuJ07FBAjP0w6s78z/pgF9OvCD6M
         Onxw==
X-Forwarded-Encrypted: i=1; AL+hErGvp+/t+FoYdX6+HQKpZeNuWatIbS7/JCbyXv9R/6I9cRXUHkuoJl2Gx5j5gMipwJXFmq0mykYBB82T@vger.kernel.org
X-Gm-Message-State: APuU4Z9FebUi5XN5ruC4Ez+lLOEuvF1zSlN9GWGWlx5wqY3ZBmmSlfk0
	+P25v9iGxo7nBZKljokar3aF3RyPI5gtHBHdZMyz5SOTRWKmy8zxZgEhY9uFW7qgL0az5vBdzY9
	DIdOMYkuwYiFz9F9KLenLfmyRg82LeNxN6k7oQQOFvrWw4suXrdYm/BOT5vI0fz75
X-Gm-Gg: AYBFou2Ibo6reCvqy4yDzXIuxtk6uopP2aW80yPCU5hWN//uB3FOLjLwnqy9o5dLsbZ
	s21fBM+NbeF3hjSkLVyORiaWZbTbc3A4ACKW3nDHA3yESUSY3pMIFGu/xvXYVLM890qSKTM18ar
	mw9ZA0kNHV5TqzQCZfEejEDKJRHOANMyRMMq9KVDT3Q3xJYBpNLr1TpWqVvxL5VQp/Bpm23Jmiz
	x1qqAJoo3N4MMG7g9CUUv+LxW0eK/QoyMbPsg4opC9r7n7FXx3ZuJrSAZmUiNZ1lR1hd9THd3Mg
	nuqktBhsL7L4s9I/W3CYHprrfQljCgXXKKOWepJHsX07qjJ5F7buVuXo5d9J1tgIEABg3spwIIo
	0t7Dv4nySIBTeacdV7ZmkkYvwTlbFeZeoIohAQT4gk8TMCfHUVrS+Ln76j50sZ002JkvAOqw=
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691361cf.0.1794559341237;
        Fri, 13 Nov 2026 00:42:21 -0800 (PST)
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691231cf.0.1794559340706;
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b911desm64855966b.81.2026.11.13.00.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Message-ID: <9d0a3aec-052f-4209-b2db-0c2112de33aa@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:42:17 +0100
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        taniya.das@oss.qualcomm.com, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
 <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0aA76tyaR5fy893FJ3Gigwho2zCrA0RJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX0FmEGcUL+2OI
 yW5ddgdfwzZVekjiJWVjJcazHNls8/SPRvwMOPUdbO+fKSZnsGJTybeAyjSYvLpGwhAfgCnZW2o
 jeIWqXw5pEFSAoaBEt+/DegfGnSebkhpNLEJK++l3VlO2jXg+8o1sqegca8s5VPT4v5hZ56267n
 isBN50b+ONuysGfWul+8V+QXzp5Ze1D8w7NxEvDGysMdMkZW+9wBHwvi1lnvArLsbPvRKkA7a5Y
 ybxZDhqlqDWMzYxZxlSkfX9zQT7KtCkO5dlpuN0D2ZUV+imGZljhcBjjrvyUK8jDuprQ9LWTUfk
 9NEHh6JtvDTKIOY5QSexo+LoKf4KbtUe4oGsXajBff6gJwWZKcdFkS+gu7aqSw7CUL/rdGUkDlc
 pZwme0D2BLcsByl23G8wFPjbWv9bkTi2X/d1LY2l1X41EQXZTma/2B/0sTdV1SofsAtzwIXBdbz
 AgsVVBoF+YaDYTISSiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX8tsUOf47ZrCa
 xFBr3nyiTkfaW7+n1s05LmyUuKcF/AyxbDivZRF2HVeGHdaACDWaqbm3uo6gR6IiEmQejnx7wBM
 KtB2r+3BLQKWPV4yL2cQ9rCZmg6xC+c=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6cd6e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PjA2QlHgYP8RnRe0R20A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0aA76tyaR5fy893FJ3Gigwho2zCrA0RJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

On 11/13/26 9:36 AM, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, a block reset for the MDSS core INT2 interrupt controller.  The
> MDSS node is an interrupt controller in DT and the DPU takes its IRQ
> from it, so INT2 is part of the same block, not a separate device.
> 
> Bootloaders hand over with the display block still running, so describe
> both block resets and let the MDSS reset return the whole group to a
> known state before any display hardware is programmed.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
