Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583517;
	b=tihzcHF7p9CCvqYD3ioesojgQyRCGBUkrDSytImL+qbZzSLuk63cOSH+wTwOZ/UlhMcC
	 WLon3t6m3itFDVmfZQoVUT3FQNrO3O3gsAUXdA1PYdx6PjqZGFenb9B2R990WYC3ct6Bz
	 LKlX3juNhuCObq9OwRZy9aZ2oKs23TNZ4HXb8Ya+Dk6zAVBuFmpELkxQ7Fwryrqe4FCuM
	 lFvfe2L3wH3ZLs98QhoaqY/lfbiQlBy0wg/opOadzBvian1OmIT2aSLwifscIPR9HI733
	 ZLkvgKcwcY/qv++U2toPWyAaGSlwWBRIkt62RpfFSWY89ZLbXa6YLq78mEI1tawkCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
	b=1RQbbUYpb02nv7iEQTn73TYlN/kQYGplQeG/bqgzJwwMQHrmMptwPubw1WASSFoz6sb7
	 p6q/zpsmI+UJQAbLO7aKrEmuKQSrd6jjXEiooNTi98frQEVAXaWYXCGwHs7ya7CMIDkEI
	 qmZM/6OvtbChFJFx6px5wjMo+9FLnQq7rhrnwFLlKILBzKRoWKagpXv81Hg9SBudktDl/
	 xOvZSoq1JZdvEhGAvZcWQ0n5Vq1FwVbXtchHNruHU59xUONAghJ1RV6qPvMm4gX6s/01R
	 88FMK/9XYjuL78yXHSuBKl98gd88bctIJN1phLfyjllvkqRkFmLYfiD0YRDDe6ejhow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZrNBlDPM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFD606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBFD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlhaLsB8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZrNBlDPM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg8Im3225075
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=; b=BlhaLsB8tV1S7WHo
	mFG1BNvflm0u9jHBOpjQ9dK24lk8As4RVKB6HBvefgkPRDkgd4s+7nEH0lnZw/Eo
	g+vGNP4oBbJevgXHilXfN8jD0jJmfSNXjBQrKoz62+1pF1q3yfc46Tq3giHe5Ud5
	cJ6sD6jK8A2B2+689kjUIORvtGB5ZUrUAkqb3k4Y/bIHI2NcAMLycPze47KLQDA8
	GQQT/RRDzzd7t6I4jiQCTnUpU0vUOPenxglCglsYYJRPio4+ZqjCnDcF0wNenxNC
	gWQ/sh8SHJ7EIyHjVW4dtS2qaZIL8C5iNpU5W6D+kQtas8mXiqia25NVrWpw77Ox
	A5pPuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78va9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:51:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso10180985a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583515; x=1793188315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=ZrNBlDPM1vPFNBpn/zAHU8Wdo+qyc73uKsTApRAos4Yl3W3pfezM+ioW9WzhkmprXQ
         iIxVOXLouHEe6Z2GFdfaHCSvZAjtYJ+Zc7tj4XATyTzX1qlf9jixNWzBdXe0ML6WOvnq
         XhymWe6w79VkS0xXlQo68qrPx23P8zTGpao2nLQtMaGDbVoORO2iHF2M58GA1QyAhCot
         iGcYLoJa68lFGhUNH6f017o+WkYJzUL60j8xZsZ4wiSaL7iblCOdOayrPNb3jTU9EqBM
         4rIhRgs1d4zC0qnxST10NAMVDOGP0Kfpwe7VmczftRMxFnEhoqgyKkCWfNVRXs7FWzRO
         K/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583515; x=1793188315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHGi1gVtAcNCijVovmdgQDTWlAIi6csG7suzvk1qxYw=;
        b=qMqvuFtt0WMxz96hDVqi6QEKxEu2mSqvxo6YaW9jpOLmxdHRmrGA/BZTdIKL19hWaB
         KAI+393wQfbjlksyKryA9RkC+pBzNgJeftZyd6xUi450M6OBObGslqvmKX1PO24UhC1h
         e4F8gT8Q8JmIgh/mNtwicXk+P3pE4/XOrfFm2hewNg27gbhmtOe1bsmFVow7d9idQMos
         ZEP/8+cqvctJeVmJE/EzRZWk7OcV/kNjq43qpwKw4+Wc+HXIRAS3Pj12V9e2vH+rJsFe
         ZeB6T6MgJ9GDO/uiPqkcHrHF53+szm3oFWD37IYU6DSiABXf/25JivqjQnnSrz2gWZ5e
         EjeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCTMgDwalckBFf3M2nJN80gNz0BXB03TMarVIu5vY8x8RpnQPbDU/7cdDZ8VxJCfu63TDDbG3jo4ph@vger.kernel.org
X-Gm-Message-State: AFq9FYKVgHIJ4vsRwkmJ9+fV3tc8pMhBD6oydyqplHEobhSzZEKyK6VJ
	K+pYC3hY8NAdjMbSycDQ0DL3F3d32/ZYeKY3Z5d3LH0IfguyEj2hrenwM2CuOgRiHTBJj86Jd95
	NPF4IVUkCf/2ChIi1a8euwA0D/xWOSogHp5qFLifRg6ctx+nyDL+nQS4QLEUPQonl
X-Gm-Gg: AYBFou28X5zKYrxoFOvYj1laL+o4uqUov76purVa4EyggstVusPfA7lUB2ekUyvw5nd
	sUALqUfLDK4zgm/x07QQVER2rOLYdF0sJqlB/KKq92tFSFHYI8iMmZI+9wcJfisRidX/YzI07hY
	IdCJVDnByvafDrROh2SKGw8sNYZBgckIl7IP8UFFGbENb32c0gVr3psWhPjRdpMyqSyJCxSPohw
	EHwSqqcN6OT+xi4kVas51A3Un3ifPROBQnk6Xjc4b66yOPTafPlDjhz6CQpdvtAvh8IRQP54t9g
	Y0aVuZPIQVU3MgmlvXfAfDiLzN/Gnk9deGLxiPMaw4qi1CBCxgb7EUeGXmmN+E73k1FcKJ6awT6
	O3LxEvR3jZFeAzO/TdEXXlA==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413685385a.2.1792583514611;
        Wed, 21 Oct 2026 04:51:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr413680385a.2.1792583513972;
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77ac4sm69148066b.28.2026.10.21.04.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:51:53 -0700 (PDT)
Message-ID: <92642c70-04da-4283-b25f-80369b788b51@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:51:50 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AgmOqVclagOblI_QObx1o8tvG8IXgWAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX22MxKeQ2IXys
 Uooq4vHXMePSHLaBBpgTN+kfyQu+rACJRoz533xq98omUgk8n7fWGC+b/Tyrpk+VtBTxD0wQPrd
 rSWODpUI1eDfsrKdp3cncoRcb5vIQFOW8OteB/Yj2kaF6Cu5muECI56+Q200zdIcfOlfhClOwo0
 fgn39e56PBdo2VWykoT9r6B+5JKWs1XwTYTkjVYCxxYD0v4vduWYuYxT2UgW4pflU0JilnOTose
 c9GJJDkmT4zgHZS6OUuPhsVFQdOPiET7qhu2Zzk0YpXTygIlKrCNgKpODl5yPb/TS+cgDjv1LpM
 kLJ8mMlIDSOabIIWKNabmI4hRK7ErngL6sy7YId9QNYkBGaOSHlOJENZ6FATLwc3WeIdLwL7yP8
 86G/ZYkxvPUA2ufobnfsAz+Bv7Y40+V4tViGU+3ANpBkd5KxTEVdMHfVHxv3AEKPsutK+jdLt/N
 +SJbj3WPMHn2VDQpOVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX7cAqhOghvmO+
 BSHyQFIx7CblpzWOpIMIfeD/ly8AE2R2WyKFNDQ2foSCf24e+I22k0YbFE4/JLRB+F05fG9LGK+
 c1esBu6mkPjNvO76ZF7kfOkMWrYPyAw=
X-Proofpoint-ORIG-GUID: AgmOqVclagOblI_QObx1o8tvG8IXgWAN
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8a75b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hSA76YPsP928zEigGEUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047

On 10/21/26 1:45 PM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
