Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796700;
	b=kmpCVcrge9fJzkkj98HLGT42LJlCJBANAj4wSKIH5MAQxdAUCm85gSZdnLQmL5N3iaHP
	 +2TgXP92cLio6g8G25oxoYzEHltzyMXESeSF3JLAMLqGJ5sZDreyAkZvGVqqc2SBohBEO
	 BnZFADQqVDuyu3DcIA1GAOdUlyZui4Z9gukwKDJReVTDeNNIBTEy3ypmxyY7VmqTTBW4t
	 y/Gh60IHn/x9s4+8TjCxVHJCm9DkOOVxEkdHEOco3cngbJz44fejbxtUM+R5HzwDRC6S9
	 TsXJnnEWQJBEYjSE7uXtU6TTtn2stfcKPUdES3NTQR9bVPBRR2jciDmoBaHKl6zp6cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
	b=i0OUNa9Zf/gaVb0z8XO/RBCVHSbu5pZA3Plz9xdVva82ztprvnWWjVNj1uEQuHPsVFg+
	 my353ApZcCzl1M5sQTB25Q5zpCjGVG/gUprGinDaNMUagrlEnITwMIICB11XZyN/xIn4c
	 X2QwGsW+TMUb9fttNcDoQ9Oki/FFNzR31hxBZfu+eGCIVR+t+qZ8ayW4yjES66abcp7Vh
	 8wsvRyKfZ42uFo4LP+Uc5LQYwgzyIx8ujoEudQ+8izfUsIkDIdDFZzkdPoPn4Cl87rq+Q
	 4xpj27s1xdx5CXHQ/2oyjla7Y1KSHqY/rZiV4DZ/QtVu/aieIFf89mCqTDrmShI6OwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F33606A321
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F33606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L22a136946
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=; b=WJrJOScFWbmhsj6y
	AXFvn9SBm43IzYWGZMwIAmxaGxjIXxdlt9wkxfaTSbQ7E07Q0BxLROlUAfuguA80
	EmRTzEg/vKjuBQwh6zpA3hekDlZWsN4v97sul0/C/d3k+hiHtr6ZpjPb5W7rnR9h
	cnJr2qP0IUs0zf5SZEytlzqfqrfUp5LKlRQXplO16NMFIyoV72mI7tBcyJ+9Kzsh
	XCez1LSHjOKwOQr/TscCiudCBtJdt903ne639VG+gBHMZ4Z2RAuB4fmBINzLHpvQ
	ivVLHIJWMnuTCc+nVuR4SNNNoosywSJYae8TVupwaAtor8SM22VnlQjRgUUtsf+1
	OH+qUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk24dus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:38:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so556870285a.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796698; x=1795401498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=L2MJ+PvCZq5kFb18qBpX7JTf0iQ8hVlYPEUP3yAq2FqFXfkLwDPiclDCRp6/QN6zhv
         ZEUK0xDimgat9/EIfD91bkycRHWIboTNAspoit94Oyrb3aWc3UTfVXQvZ623C4ywwLCr
         Q+ESN0ac8BwAafWDY6zl+TUr0PZ3Bz7FcGjs2yi6WnYGyzvMi0OMa3K3XP8SCv2MctlS
         yyGmsPxn3HBJVR90AvfjECN9HgIooxR2mqDHg1JORqCX3z3s1RNFP8XTNjIr1Bkvqk4z
         B3c4IXsVnuHIMiU2K256jDt6IRChLUxFFD0Edjxi/RHx3SnNN3oVsh60CY9jfpXzfD/J
         VL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796698; x=1795401498;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=dUzpqG2BZFmW67mKqVHKZjUv2wSE4/6H1ZobeLiB8VxglvHvhzN0KXvT2OpbeqH6/G
         ZsQPLOnKgAle5/eNsN3GLLubJ71iVVWrJznh36yH86wREhvonrXuVImXmOO6LhtXhQNW
         SLPb2dOWVv9+EqrIZoCBgkmxQRlpY7mha8RqVzkM+/qFOnCWZCPmFpM0+qgeRNIy595N
         8UMAw+lVCuRBdQhahYsG/5Tta1VERZ3gGGwwjMTYdTQtw6Q8WJs4JHUlg7CeBgstCpLL
         TMJdk3rbHLpZIsKstwZUSvb7ZJ16vakRarYm7cD7sMX1iwxOMWuCd+CeGnoRxos9dtTm
         Pgcg==
X-Forwarded-Encrypted: i=1; AL+hErHkDImJBhYFv4JWend9Fz5ff6hrOHczJ2uVeTyhN6mFMfJNLRHBoihAd504UocZM7OBcOXlGyqG+bud@vger.kernel.org
X-Gm-Message-State: APuU4Z+62+RsLXwjcC6OQzT7p76r+eYgsTN1AljOsxE2c3hwjsQKo/hU
	1BT5FtEjMWpdXIbba7pC66PksJrM2ueoaZcJE4x5tpkjj5wwaYfbIO2RC782VfCBZ1vv9IiiDyl
	v60xjdVG3c181wKrXGIdPXUBfQQzJ8fAceBQk++a5FzbSNkBEkKygFxLKOQHz2h3b
X-Gm-Gg: AYBFou0QghXKlgbdi98RP/C38LvbYL2haPrpmodtYjsSKc+KTRg/o0hzQZHOCjfrgP+
	GMTmlC2tjtqI8qIWDENuMiCahRSx5Dv5RQ53UIKhylNV01EeRR+GlmgzD7CIExOUU8rX+jjmRW1
	lFe+E642mOT23NQfqKS5vDdjTeUvdOjtTnlnpOQuEK3lZaciu9Sr9gCrN/IPQEa8S3LqPLK5wVv
	vvhRJtVQ75UXokHOBcbMfGfn25eiRaIAmFvTvDHY7lMDHKCX8cS0FKnrHBH7m5qHKV9PNcqZSZW
	BbGyVfwz/dqU/Hm2oRUNBcGytmCeg1aoKpmucSotPHuozkPgMaHyBhU9OdxCKX3pCZ/IQbAJsGI
	Q9I5stVaI1jXB9fHuOy9+pTQhoJiVAR4+U7RT94Z3XzxIZ3PqXjQmGWCEb+4UFwCnJ7d+71jQmh
	ghVrJWvuVM7cANNSeNZElxpp8ThRM7cHP/JA==
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471816585a.56.1794796698177;
        Sun, 15 Nov 2026 18:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471814785a.56.1794796697746;
        Sun, 15 Nov 2026 18:38:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497a4f1bccsm186560185a.36.2026.11.15.18.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:38:16 -0800 (PST)
Message-ID: <d784b5e9-af98-40a2-8670-6c12208983dd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:38:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <20261114-voracious-capable-guan-99cacf@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261114-voracious-capable-guan-99cacf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kr0bLLg2g1c6cHrOH4wljYad5yC-HI5L
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa6c9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4xkCrKK1q9XhPcYNJToA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfXx8hDJlczc3XB
 eFmNVO5bjTsb8oIa9MpVMbQu27zWteoLGmUgkhJ8tzgFQv1T6HoVhjhoRs4RiV0FcYjy4OhU8dj
 OfIbTdXM4R+1JrDh0uXK+81pm1e7+nVxIqXrk/sU04L7mE7AsevHPgGkr8W7pa5raYbcwxFDeNS
 bT+YX/bFT8pdA+w7CjVpf/80euvpMiN7Ykommx/XuAT8fcVW4pVqxlqfulOkW2IqnDCQkW54tzm
 00bqsWKEIqr7LhlmCTXCq3pjiDd1e/CSHMb9uCEwkwWJ4jIlcIlh38j9iZpZFLNYPDlO0rCtdR8
 a5r3t+/trR/pqo5RABLq2yyJQzLEsQOv35pXrvmQNkPNmk3n7I7Dt/cIBbA3kIJNcwvoAh0Jw7h
 Nm4VVsEVqY9zHBVcHmzAHmOpytOccirZ0BCvRyen/WCaXQgRP6hnkURSwDtVcfoHJ9W66OH0XJo
 TCSS7CFM6NGwdftnutw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfXwemeM1+0H5Mp
 OcazKinFaHl+b4hXGuFUHnIcDgWJ3P1z9Tv00UH/XvOTn0gXkqFpaKhXH8NEAzEG7DIGteRabpQ
 zXnktm4vPaKv4QdmwrHaxG5p2jYsCmM=
X-Proofpoint-GUID: Kr0bLLg2g1c6cHrOH4wljYad5yC-HI5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Krzysztof,

On 11/15/2026 2:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Nov 14, 2026 at 07:29:18PM +0800, Wenmeng Liu wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Does not apply, so should be squashed with dependency. Why having it
> separate?

Since Bryan is about to apply the dependent bindings and driver changes, 
I kept them separate rather than squashing them into this series. I'll 
rebase this series once the KNP series has been applied.

Thanks,
Wenmeng

> 
> Best regards,
> Krzysztof



