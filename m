Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685467;
	b=Nb9dK5pUl1yQc39SKiXdgiAOI1qGhwdBthnD35YHU3c3Tps8u0yH0U0VR1UCO/ioqm2o
	 WCkFWA6CsDThVlWSfrvbuvUo2U63y9LNV+bywpxvPTWLXfglWfA6tZ1/ApLeJh7aynKHD
	 ieeADjseha9IxLp6i17AEw6NXH+p/BbUMV4rB3wciw6nkaDNOUmTwrG3aQFKMJY4jIOUg
	 5j9pAej3cUNhI9ftLrqgmRSblVV3/vpHN/B/tzWvIDQ8m131Zjk9EkCO6rRBZRQF/lHW0
	 rSRAJ3tZIKtOBVnXxsAqhqIhunR/naRIv7gPphPOCZsHcCzvT0iObkgpnQHhArWclmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
	b=QeT2AdPc+msXdEawCMZd5M8p1oauFCVHjKSRq3S6F2P79kiO5962SShP1P/ULSKQf1As
	 aew+Ak9nCSCvqgrN7D1OYk9r05u1CVI4tIQCZHq8LWw9CJOEVYKpEBcuISIkERFrACKB2
	 Wc8sBOxveSfRToAKDz3Q1Rz90mrQnGlSqtiSVacNt93P7my3aGb5bW6uEsSWI/TTBVA9I
	 gsIsqwVi9ohZn249bXwY1UiYcgBwwN/dfEkiQo7NYoNrCiVGhDhFQ0+QVayymLp865SF6
	 FqWiGqsJ9OQE6CWb+wdXbrISigNAOTDDy6rCmuCA/MzxCCIRSoTaA5klgtY4KW28NTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D840606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D840606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31e99C1433948
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 05:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=; b=S9AesGBP9hSJljeV
	ww3dgpha13lRM5zcSnS3feur4P1jZnXP0q+bCwLoaM83bVFreJ4eKk4lSO7sV0Ju
	0aZdeeRvA5X2Pqj0IKuLFuPKq8CXb02W0x7Sv89jEDg7Sosv+PFys6myY2RL4yKZ
	IAz2j4Mq7an33cLPGhd/LK9OM4Zo3Cbx9+hnNfnMTZ1uu+4a+mRtiFoqjDOdrhC4
	EmU7TKiKJvt4+Z9GWSaXI2kVjgIXmmi+N5LylNICjm5ZKaGdQ9n05GjNfWVNKJYg
	y3DIqexGT/ypBE5B1L+98PYcm2zv2p6Az+5eSxdYn7d67IMV7ZON/Ipop7xAEFkj
	uimAsQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2achk0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:57:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so7679232a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 21:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793685464; x=1794290264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=IPCl2tQ2nWBR383KPUh4rk9EnWD83UOyzXaLKMgjZBIVNl+DnwTqIRLkWroTvhn6DN
         ePGjlsCtFqIfCs0N2COVeIFqTOVV6afBkokvGlxlPd0bH230BLe0n7jJaPZ/s0KtEIxl
         8JEBtDkaMrVnQ09kZf4egi3fgQYUxDCcylwquijPWMXdd6ygNRy1s5CEzSKaOOU7jH0V
         VIezK2Mp6IbzZ9gez8CP7Df1hKIEiSf8pIUWpMbTZsMq/C0PQmKmNIsa3BJu95g8TjoE
         qXTrm7wJUqY2DGoNE6NpC1/ZoC9T+uyd7mFCWFV8afN8IGLrGObO/iy0IjvGXJMAnoNJ
         lVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793685464; x=1794290264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=ke41S3rZPW1MqFcLgUv/2DVumaxZzQsvxqkVNnb1JRUnQWPmxnzeE14EFNq9evh++U
         tPYabZTWIfwy6HLQ2F2Enp4eKJMXV7SvFnmL3y41iDFJzeVVNXWslVOAHJLYUFPKDJ/X
         vGxb24ehooHFsHJqRVDVxDX9gbxqQkBSlrpSeMpysPui4aho/2E0VF2Z/sh1MeOAyQ4z
         VMmZ5JlmkqpcFAVlajAr3m1l8haYQ2bbqAzNibZxzCXli3pD8oL5o7XqR+YZDCrX7OMY
         Wa6iGKgVTG6M5S8mI+LhKPfduBQ88KBZN/PAJm53tUjrfNCdsXVxbIUItG8l2mN3CKPJ
         B/hw==
X-Forwarded-Encrypted: i=1; AKwUvBweAQj9rR9hhdUk8s4wi0E/j0C62HxL5ZrZqfmrkxPfjzCpnNqQHC4bObrRlbpoGAzpTTpFFGxTBs8P@vger.kernel.org
X-Gm-Message-State: APuU4Z84/FTAgFV+j1ECid3d4DCtXRDS6YgZ1btJuOH32bnkBhnjN1nT
	hihbkFwvwF79+XsKuQcpRfpCfvLFHW4IETLd8acmswr/rvRT/yP8aZ7ZoHvpTg+L8h39LTZBzlu
	mFS0Tai4RcS99XbhFmtJM4zyFRqh55V0ZWt6TgoSl1LrY1dsGwsODGo30U15kqYjC
X-Gm-Gg: AYBFou121nNkReItf6FDe9wcqVZP/yOVdnDARm5lAUKcFZYYYmDaJ4XgvbSLmAvqbHr
	ZrZ3f7El0EhwqiYu7Nh8I/K925By5Ws667zkt7zQ9cw4f1n0UxzFYFRwQIh1BTxMDebUK85N6QK
	4EeWuvuG/NedJcbMUFnpP+2inYvTaZ+jkpSl1x7NrXgB2ApabPJJ/o2JjI5bFnZD7hWPCgc+Lw1
	bc4CyuWQCIr0JFtRsSq+7gWAjj124VNxMST6w4oa1E+CS7+TvB/q3HEFQV4wK2nrBguogt5Qbpl
	otrYcxI5C1To8XWuFkZZ/8GvOEoTNI4oVYbdryBbpywuvdvsZj0KtgFQ0FGLAWKmdolnhMTOBbU
	whGpuU7SoykMXWYKDSML3eRZd112LPS7CYhGn67j+/VlVg7Q/7KrYHeI90Wti3AmbCJZBbCHU0S
	bIhg==
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250877a91.59.1793685464291;
        Mon, 02 Nov 2026 21:57:44 -0800 (PST)
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250861a91.59.1793685463790;
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm2470465a91.5.2026.11.02.21.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Message-ID: <c394d2b5-8f66-4fba-a38d-4ba52778b471@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:27:38 +0530
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
Subject: Re: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
 <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
 <53640a9c-395f-4faf-bbac-20c47013cec4@oss.qualcomm.com>
 <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae977d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3EltNRdik5pUTb2ctQ8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX9wDt6cBPS0jz
 NvN1dH8MJc11JxlNYO2GKXTKoTcggQGxcSWCTCZh1oKnaB+raK6wa9GxasUW5mirEHMjCm5sFX9
 A0IxGU/V3CvwvMtRFYfKCalxuAyGwSmifkpAAqmPUN43AsKcRI6VEIVX2tW2vunwvsuGEmoFiHn
 8PhSC/dPPESVaNMuVcAP5r8W8bZw8VmQmfs+9zd7D5raSmJ3JTbhDee76AqXsJfwVZ2VbxQhg/D
 dpvbBbvnabMPMCH+cDR2WMUkqAoHwjlPG/vF9co8J0ARwJn2Y6iAkEoQuEzM/D8LGn1a5LxPHkb
 EYGlBt+L3imJIJjna/gLCnwiNIwuHdVubrNoeUPNZa66d+kB5+M+/eITkabQ60Wd4cpT6Lkt1Im
 tukqAEVD9kzEFoSx1gYl2cmRPk/0s0Wg7PkZB/l2FFMJN0k3X4l7lCntMFpoU8nFiCtIgETf8O/
 AnpmQOCMdGeUp+EDW1w==
X-Proofpoint-GUID: KYTmy75q4YXYDMqDHwQsLufX_GTanVv4
X-Proofpoint-ORIG-GUID: KYTmy75q4YXYDMqDHwQsLufX_GTanVv4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX8bPJpa9mwGkt
 UFiAdkt8H1GDOOj7nYSkTyMU0ECB2ydkNCDF7FjoWH/nZ/endeGxwDI/OJMFuApuFS/l4yD4gXR
 TFLGq2ixU6rS2eDDXgr9DJ4Rk2KFEtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030023



On 11/2/2026 4:59 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 07:28:57PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 10/30/2026 7:06 PM, Krzysztof Kozlowski wrote:
>>> On 30/10/2026 14:30, Jyothi Kumar Seerapu wrote:
>>>> Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
>>>> instances configured for QSPI operation.
>>>>
>>>> The compatible also allows the driver to select the appropriate protocol
>>>> firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
>>>> distinguishing between SPI and QSPI firmware.
>>>>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>
>>> Where is any user of this? You speak about driver, but there is no driver.
>>>
>> Thanks for the review. This patch only adds the QSPI binding change. The
> 
> Please avoid stating obvious. I can read the patch.
> 
>> corresponding driver changes to add QSPI support will be submitted in an
>> upcoming separate patch.
> 
> So no point for this submission. Please read submitting patches
> documents (both).

Understood. I will submit the binding change together with the 
corresponding QSPI driver support.

> 
> Best regards,
> Krzysztof

