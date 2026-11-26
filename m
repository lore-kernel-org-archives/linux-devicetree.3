Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704720;
	b=P81dsklgmo5YHBM2Z75e3MD98eAe3aj68JG0+AyfBpg0Z9CIbh/f7Q/jy730SZqiiVhd
	 yOAMBtxYB7y278LXy533nk7US77124SdmIrMZBlzuKLxR7z6juZjHPD3zkqiCIGENjkIe
	 1xfoRT3G0VH0bkWHz9QfR9Ref9LJZXv8kb4Gf9CPWXSH8HRPyoYJBlxM+4sCOgJv2Wg1L
	 8rgTI7aDIpwE6EeWN9PBXnOlYQLR9NBVe6JfqosrCnyqi9wq3xwaNikog59oZpTNfQBGb
	 4sbSr3nmASIdSAIRzva/aR315Pke8ipDwQLRmICLkicPDUFbPqbJQbdc5+uevD4qPzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
	b=HEuKngQhdLTvFVqIKqhzjorJ6Va0B67TnlLUPlqj5+EncGdyzf/c3sfnRQTc8BHUsfC/
	 e/Jrgp9a7XPdno9/Zq2raMVrxNTdEExvm+zM+7S9hCEyKRpybfcZqSf4yfj4MJbqyItAL
	 0BJdN9qfQfD2J7hods1a51xg3l4kEcnOOUjx2hDfbPXLtf2nX2qw+Hmn1XSTGm4u7FX14
	 aJA/VndfshyFf13EN5j9eop05Cnt0z2fAOZQBrHgcEAhcinphLoylVR4MEfu1Qf1BTn7i
	 KWegC3AGvua/dDOEvSepT6W7TJQCUltgipZ8+LxgnfvdGj+qPoRueOjCR28+sPD/26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17248606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17248606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV55g3863633
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=; b=ma6CmOqVTEZCgkuP
	m5/rETLGCLHystYO812TFoucX4mUdO0JjX92XlMITVuF6EjOjNreb7B3SuhuioTt
	LQt85y43KTKE9XVpLQCBq/Q/j/uvCj+I5SJAFIUe906CdTeeW9pH1sHatp2202YN
	CcJFFIKoLH4h6CS+ojZC7JOqxROKEL31WDgt9q0uLaL7t5WUuFqynEWxmijuWWkL
	axYo7tWVVrxVq5FRjndE8o7afILN6KNXX3mRto5hGTBAJYeCge3CGF4MeLBz2OVS
	TsEUmKaadB3TumSe3PrIZRnfmxt7KkdbFPGShSQTlLgEeg47reKppBr+4dDOFaNm
	TdqwDQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhv0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so15698941cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704718; x=1796309518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=iqpblyhNJ4zEpuCy6AGzzHhRHB5JJxEjLZoVXM6tBWHGPA6S2Jf7a5dVvjdTIhpYML
         sSAV4mxelHyLC7Izt0Wye560jTtK0szrUYLWGYmdI4cP/ch1ccIOu9zNbCMWGnerM6Fs
         yPGYc9QOk7Vkxk4ydKrw94NqnfHSjCJidpRl57w1UOWIdaGEUKnKE9zbp+/ZcPVQM+sp
         uDUqPit3EqFV6wYS9aBLiCFZuFKPTJecI7uoW/kgxHsY+QAC8X49v0zeFdoZj5QQ7ZTW
         /nwJMeOJKzU8bvtRx+Fle0XAVXcs5sMSybTy/y1CnEmHvcOK4BbOoZ+0G15zBfrxSHZp
         yumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704718; x=1796309518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=XzT8Y6OPBTJiSfI4HeC1UejAGUX2uHNcwrLrE+LzI9LnZb8Mi38hZNol7Caeb3um3A
         D+gEtEz4Do0RiwqPtK8KaDtCllITX5K4MLY04uLeuVYMhtewCn0F2U/DsntT3mwGNxhx
         PusbVeLGujfbHJBcXbG7xBB0uAKCDAwlNyHV6X1iR/k9yWlk6PumMu2EVkVHbVaS9ViK
         QvcfA6dOFhN63vyFh5W1ea/5bizWARbqrm5AAvH9RFv6uMq0Ey0hKr4Su7ywncljx7cA
         oqkkOI7ES/Hh1vVo8hGYGwm5tLemUMV5ezWA5hotxa5rSbIKpOFxH4itkWbOjVABLEXs
         6NYQ==
X-Forwarded-Encrypted: i=1; AL+hErESLmRoGZGLZgnkGB3emY1+NZrV9bARvAuYTrDuYCWKisr6/26vYf/3uUk2Wvk4fPXCVOJr/30THN4y@vger.kernel.org
X-Gm-Message-State: APuU4Z9awcI/5KzxApug6AyioYPvPMWehI4lmXCjsLfugQfstlhn2nG7
	RC8+Qq3GlkxccTm5PJKDbky6MObBJOqpmicE0ll+YfEQYfVx7c+R1/drsW22wJfMIyws+vUP9NA
	hiIxLHoH7qIB+ubjisxSsw7m4nY+taiWOPiwgsPs1AKh6vVuHE3bF4Ytg+PBHF43i
X-Gm-Gg: AZFdTZe10CZe0g09bWWBQU2hl7U28giY2lAdgzMTNNf5EvYeoPFtssavidqrthiQqgA
	+4N9Th/Vimir4qLi3TuIIrUfBpfrR8seFZFHeOfU43UPERB5psyAx1rrKxLh/UtxrW8QHOPa/Yl
	MvdVG4fQPtgO5IJtqn4LDgLSfUPiwoNdHAVVYuQ8ETvesP4sSqyfmq9GBB1zF8gRUutYHC4dRsb
	QCLi4XmHx0yxY5I+QAX0P/pA1D4oNj6vLBqpe3j2h8RXATepG3hWCrYhQfiGCg0Jej6lhWhT8Wr
	Rr2v+4ZsChzOqCDEY74QZV2fpotM+Yhe9tV+/hILIJ350uwktfQfXPTbSQA2ZoKRRnqidFpqGRO
	DWxW8yRbdnVYLzZFAviGbUiPWt95OqNmzE3RYGuUQ+k7Ojbr3wD7AMdA0r+WAUbijpQb7IKs=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374722885a.3.1795704718195;
        Thu, 26 Nov 2026 06:51:58 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374717485a.3.1795704717712;
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm741485966b.13.2026.11.26.06.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Message-ID: <874b1934-c17f-4134-98c1-fa24e287749c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:51:54 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 CDSP
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXwUMVKHu8hygs
 53h8FVb8y2hWuV0NYPVATSXXwqjF7xV7n1/L+s/d05NxMA+1MYfd7zvYj+C9LE14pn+0aFssKJt
 NlZ2Qz4sv85sl+diWqGinstURsQl/DsRktCAhyAXfVN72w/vNx039dMkCgUIgNnkMvvicMJRTQT
 LdG8dmHG+P0BV1w7oyyaE2frwixzn4TpCCzlPSIEKIqZ/g0Vt8/LBNvOEZV3aNGL+3OSZrwvur8
 ocMEwVhwtg3y/3NpPtRaAB0W5FAutcAzWTpriNORszxLO2aiXQD2R/6H9VghLwy4Uxqjpyma32u
 Zh2OCxcx8P81z/TQ1SEbRPf8h3ROehVDiMG1dkCTe0T12rJbfBnhMd8ycJ1DXIS8v8LC4oxqmyF
 /mjRuUp9qgUTzlcXvGE91Cj57euMfHGdvdNL/px6Rpd7Cz9N/NMPk7hQJXTy62aCvgR0aHBha3S
 8kq2wvCiEXSiX7NoSlw==
X-Proofpoint-GUID: J_OQ0lLg80m6w_2k0i2mg3rvfP7j1Pca
X-Proofpoint-ORIG-GUID: J_OQ0lLg80m6w_2k0i2mg3rvfP7j1Pca
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX3xsaTqIvt3Uj
 g0gIwKKlwDZHDItKxvsVGjb9wUOsQISM6jULjlK2fqk5o/DyV3s6BFV+gwpqkF3gMMV6mZqNky3
 Hfx61ftrysbJNXc5++uId20j1fx/KcI=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08478f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Enable the CDSP with the Samsung-signed firmware shipped on the device.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
