Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958558;
	b=jnsGDpZvMrl6ceD6KTflPqMW4ZwAa+JPiyEuFKRAAnuFcneNhNJnW7ED+ZVwiP3PMiwd
	 13sJwiVCBv8On0+QPEKTWtB4K56YatxysULZPrvk4NBNIdm7LOM63wIzJTtk8DLumSLTz
	 H6ymf+Qj0zfY11uy0Og0w6Rv2HhT0Ch6L80lafDGVvWlZmyUzCMRkd/XSMfAU5A/n3pbH
	 Lt/Or1SftF4MyFxkwAEM3F92hazfM587j+AyTT55DoK+TsTXYMruByb2J1bAZcALNd0gm
	 joiu1T8PuVTAPXINxNkjYvoJtnKG7xKXK59SBObwkDoSEjD5KKXGZlGEN/7qtnHjA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
	b=IurWBm18PbTI94jcN2sEfYKz3XeVUiiEAVPb+LVE+Pr0xQKuxKu/8nv2DdlhUg1TjZ/L
	 X7twy5t5wYIJate4zclxVV5/7gCLRhh6AxVWJhA/YyELgeEVZtigDz0G8tBpC1YHi6sG/
	 PkpCJZUVq5I46h4Qj++JQJodvxGlccLP+GnO0gQH2mMVwdkbLm+beqajBz+yER205emOZ
	 NQjs0HJp/Wd083rZkxGQFGrDVQ13FSA28JRrFUljqMGiVZiUM9IlMdnzxZSR6Mm6ekBLU
	 6/Ik5/PAG/BVTp4aOm1tOP9F9TK4sql7ZeQP9Bi6zB+T5ke7LNOrBb0XDwl8ceABdRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B06606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B06606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RUqw2730753
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=; b=pXea8PlS650CrBWR
	9U1j/nunVPsZNqQGJX2eoYifIm9HumZvhma6qMSE/6uayReFkrfyasEcR+rv7DuV
	gMTFJK2224qguo/3yxPQP1PR/7iVyfBOyZvP3aZUYo+ko6WeMKDvs4HghUyQI56p
	4QVdTjplsAQb1BiDIlyUBK4QvrJfXH/lVk9Gnd7MvgA8jTv0pD6uqUlzmtWYZ0Z6
	AgabRvbyH2diAGkCEckt8kUcDh++DewJx64lXLsqxR58MChdcBTNPIFaFDz1dw4K
	U+bjIwbpWjtrLCfUgZCzCacoQqjg7EJcuc7BzYDSncaPGMGS7+MxEpLt8nUwBQVu
	HubmLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9j5sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:49:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e90878e7eso541366d6.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958556; x=1794563356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=aj36VljCG/FCzYfOH56u7qZN0wTrTHDdel3RlxwRRRq3YTpM+mV3e3yWwbmsLJ6YUR
         NZBr6JWHw368EJ+BNgKGQQTQtwN7LSvmyY5qsIR3eh8zKvySKhDIlMpM3oTHf/EjLerU
         wOsqybTBgrhthTigMRJA6JX7HQpYC8IKmkdhzNYLcSG8WshpLwtxsWBctW9KXQE57a0e
         mbjUeSa3k53JXZ3HLMQS3D7Z+aI9FR2TYKMjCroXbHjaG2S/WG0ho47rbaIOutGYMZkO
         RIrI2lcMcIFKy0u6Iab7wgg7jlG3cAEUDGRgFttEOMuIZD0hqXSNY0x9pY+FqluVwI1M
         ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958556; x=1794563356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=N4VQ7eUd73/Zj+dog161cbf+u4CyhqplgIQom2t+CW/7yTaytysQbgyxvTPsQ1RamP
         PTcUzC/QSieztOlg/sjgDH+0cUrCYKbDrW/sztyC2vpp9O+wLGMjPNbVLCOGj36WoxNi
         YfBpfxL4xLX9MqCZfv5AbKMfl/ZgVn5AaOc8BledZG939+ZzRErmwFKi18Qngz1n9LM4
         /i1R9OE7HVk2zsTo8G7HbPwZz6a3JXyaLizhS0ArswfRPef/3vCbWeEUCh5b16qNSz30
         UIZ0b2vgFS78ElraC4LcncU2Kv20l52uT/nK/FJJX7PQapw1FD1y9EAS9eCtSmKVadFa
         ERVQ==
X-Forwarded-Encrypted: i=1; AL+hErE4+EodX/YAjxwNr72HSAhzW2D+SWdnfZUI9XU4rNfM0OA5nZQ5NgrKKbWgkoZ4nXu7kdriei5ghZ5X@vger.kernel.org
X-Gm-Message-State: APuU4Z+/PzCZPonMy/nnl7f8wlBxDvWh5gyV7wUgeSp2Tvuwm0nO6o1a
	6xCGFZdZj3jWYn69aj+8yx8FUG82qHNuDmdaMNVK3Ks/eCzQMs7stnFBiqOpYg+QsaXLmHsMKx2
	l7WmFmMVMGC59vGgQxQ76vZcPlwlCUekoEO7YYJgjJEM81veGh3X6TbseAjv1aYTh
X-Gm-Gg: AYBFou2GtwKVmwp7rytO1l9o4gBzzhUYV9JsrEvjroEFB5bnq0rgb4RnzTtCzee85I6
	10aAVJpbaN5Gvy26T6lynol+hkZlXXrZXYML7imULmtpa7aHLzVUZRvkVlrWjyeaMJxPOYX21hX
	xo+PhGzq7VPVcShF/AP6tv/7p8C2sqLK2sJ0eKxBdnKZ8eSOnmem9E2pbH4+S6vAWcIjD6sZfTh
	fiIY6fmPDpEnf5cqdseuTadFd5KMRoc7DEo8zi0/1H2Vb5Y1tH3dn1M9j9IEW5QzACm51kD/fHc
	Uz75dG5UtELgpxU3zDODtzbMJL6hj29GIKGqfrzFk4QW38BqI8RRlMGDMJoYeX4qRLZ+FzwTuwS
	0jfkhkI+Kga4SHgll9vqF96Ic+hysCDOKjDDn5BK1r+/XcXAB8JoxdE79sEjcZpqsya/BEw==
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495506d6.5.1793958555799;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495146d6.5.1793958555226;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm62951066b.80.2026.11.06.01.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:49:14 -0800 (PST)
Message-ID: <6f15892c-bc2b-4f83-8c81-53e7b40fe35a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:49:12 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for
 interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fKWaUULMMaQ6yDROfdeLAu4ME-R0kAza
X-Proofpoint-GUID: fKWaUULMMaQ6yDROfdeLAu4ME-R0kAza
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX2Arl+1m5Cxko
 ec5eJPHu0OfVbOLJB0uRUkVZrld658EUbMVEz3mLXNiZ8kuKRUzhwaDVsFZZXn2qdbqN7MDtCqq
 mk1+RkQmAAxeOkhK+/sECIH1fl271DE=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aeda29c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hdY4OLW_gtqzIo9ogFYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfXwcdhyFg+43S2
 T3tf2HyrqQXnTRml5L4nE+iTKBd3P8WJUFMZUaizjTXmfePLsYcIEORHy8ay/ZymX0Hh8CLubwE
 QUWsRVOBw/NKMMaaff7M5hniR5nfPpY76/Wlx1h01sXmwF/7fconcr7E+SJEBPjBtBS0jRAeIDH
 XxezRrJZNaMULza/HZFPeHr5lvkhmDltoNUsno5s3azgLVSj3abkrGmCcdiCq878cP2xUW3LWhO
 giNWdRb+jdU4z6abfMUVOdZiLVq42YFY2aFhbVHzFSyAaEwsTS/F/w7yO0gIS0NFZqOFZ0xN45G
 3+sP13BWIF2UkKjLv8kWONM0GlR+Ll9BLddBu+eNtmVboxeCFmeELN8IpB0r1qGclD0VrbeHP19
 UmNfKyMf+ZnzYT5ji6wL2XJPzE+yycK1+Y252/36LCNw+FAWxB3J8d2WEMHLLfeOXskA3tGH+vD
 /iqwZgDLH7BG8imzAyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

On 11/6/26 8:37 AM, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
