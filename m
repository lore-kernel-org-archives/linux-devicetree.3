Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A845DF50
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236140; cv=none; b=e9azCwM2G5thFbhopQ7tcir0Bxd9DqZcCo1Zo0M+gIbr6tZo/6Yy6p4HHpbh9pZAcGNrszWY6/UGCY28QXwccwjgAyT2qBgAPfcooQNc/s5t5cb9C8AEQUZQPcxz7ME0084FzEYM/pRG0O03JfgiW5TUJzFemSBneAOXwHkUKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236140; c=relaxed/simple;
	bh=Rlg36dlg49DGpbzZguuseW1TDCIQRWjjAPDcspTd+3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eS7g0IyJT19A6lBJC8JY0DbWqDs/+9VJH+LrkSh5pOBGpQRIhjRAMCW6p5x7uA0qKQwLT2Em8WTGlrmG+PQyRSGo0/9lVJZr0tZoP/N2DOcYYcZ9norOHkFEWiIfdmZ4SvLkCBAc3Ec55feoVEfKVr/vSb8HnCOAUOp8alzEtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjmLKskE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9GFQGiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjmLKskE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9GFQGiX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7ZgL506092
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=; b=kjmLKskEBUQmMzCo
	ULVPSTmifuDAtsOPXPNau2mAkMMq/CFfk59EK13eRSTWl5mP9e3MykSpOwMpCB12
	/+shK29vSs33VH9zlxI6Ji67KsMByUCvdw0mTLiPsigQkPYhW3nQacDatVDptqPk
	sg7/2Zk4Z2Vu8u49EDaHBDtJxBTcuhoe39ihIEaBVCFcNtyJk66KcjoghTuUDimU
	bHaa3rgoRwkHC5K9ppKI3Y1JRR42qieFHuuV9d5XmYTM7b8ZtspjF+le3iyUoMXI
	kkN/7ji12+xnnt2zR9gJsw4BxQ3naFRGgMO0XQGdm1pDmD7UP+p2zSnsR+Vzw+Ja
	TJ4L+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn89twe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:28:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907a1e04111so22079386d6.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236137; x=1787840937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=J9GFQGiXUIkXmeFt93XtXrWCJ3zpVF1UV2NaByW9+X/NPg7/4B0B6Az9UdRRTx0/Qe
         4w8rlUs5XJWFMecwa4+fjYbVa58L10kWFNJTLM0wFzwAtv5sITupT56PIUGvsCM6o9PT
         umFaLxnMgD3tmWfnk2GbndPDStHQotD+VD1wacwKSEnOARYIy+bztmSQoAsa4bff59Ot
         ztawRYgRBcAzSiHwWraJHcrSbdxPYFAe85hTqrs7x489mF10Exx7LtH7W7o/SxQPUOmP
         Bl7NsvltRv6THTacrYzls5ZcCjw9TK3hsTG2BsqCwCnCmIrLCKE7eJXIEVOir4DVgnfq
         pb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236137; x=1787840937;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=T2I9uFzsPB1WfZmqgOi/YztRIB9xEUCiDczvS7p0Zl2pfAdELI9hnFnd23/8sJHV5i
         R3QIb/aUiEy0fBo5rKkjPegg+GPGhdorgqW72na1Mu9qgiLozGP7cj+tu5n3d/MVriQp
         /C4jlR/GOuMkFpeHNWtA7yHv/0N/2VJ5Tr4NInaRGzy5yU/j2y3GYFIPgGnlDbAgHRBt
         GPmeL7sqO+ZBz1/TmtOZBOD9AcXsirXebahPzzKlNQhXJRE10fLg+Z3EFgBtqt3jb++G
         KESkLGIlQNrHvzBHM6j8S176mbBnVRIfcAi4QzkR+lpe2HJ/x/AgrXdES8v0SFOjH4c5
         Hihg==
X-Forwarded-Encrypted: i=1; AHgh+RpOoyvcUMeQw4KgldaXGJiI1u2GMZ7BAle/Y7IG/H2f3iJKEjx97/4nQtWtdzdvuwrsn/MBN5T/Khab@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/K1tj8wtnElcvpHyFlanwJCraIu80dS59LLru+uc4Uir7pLa
	yldTSod1byfCVk9nRONFIpY44gGYyFO4eEz71VdLimbY3qm2l3Kqr3LZmkp1QEzhpySnrG58qPx
	JsmXsajC2PG14qYPdkgnxa0edNu//pulGL6Q8EaO8DP0jGKUVNaXrzttmxydxYgqB
X-Gm-Gg: AR+sD11/J2gCJH5UdSox7ofoFA+pwrJZh+3w4VK0UeE/Y2j84sLolUOrcuDLz3T22xe
	TQPgcd6AM8m3hLZSan/MtONGr0Ye3mSGiauZKXseleOv3JiJNgenwHKiAaEVfg1c0B1y8MkRDzY
	qPlxfTFe3Hl7o5UrD+8lSjTQYryUronQmM2P+DUNzwUQ0aCFxcFYbnG/hPlZrHVPTbdynY4cNNL
	8SqS2I/a4Ic+TYKZaFurf1vP+fL++eM78Vu3JssEa8m0bHudNZYR8E9rIERVcZwqwBH/8o/Afno
	YgpHI/aAWbkO1XBsqhOqfCMvSDS1tRZavRb+JcHfvtA835Fjg+aPyTKx0GwUe4NSNtkJ6DNhGb4
	npKk09nyke4UtgpvgPNgMpcSu0Mps
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417192285a.15.1787236137267;
        Thu, 20 Aug 2026 07:28:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417182485a.15.1787236136788;
        Thu, 20 Aug 2026 07:28:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2148727sm48532405e9.3.2026.08.20.07.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:28:55 -0700 (PDT)
Message-ID: <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:28:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfXwqOwyu08LkDg
 6wn7FFEYqXetxhCPaTdL5GOzfUeTdm/40DQczmoSPWaZFg1QuRTxfE29AzsbiQeMiWJ4sc8fKwV
 kLRjFiME+pXE4eIu1K++wJWijmJIDo5y5KAMwD6JDkYoUGwdu/mr5YUF681nP5ySdqd+bYubCNn
 8mjV9/K7RrT/Qis+0nEP82o+YGDJWzOJJdXKn57XwoaMdmx2jiCptSMITEQ6JIxfAsuyCe8Ej0W
 fNYXG+uvrDodLq7kJUeD3Di3Ga5f5rrNZkOBHXMpbGQ+I/3Q0sqFvrNKN9CpVtxRqRRsYCyZvil
 5pELZhVJv0VUujDsFwAVllt5+Pvo88uoWia3zGeygejOR9e/ATXJik1yziQeeCTU9kuBxds/pDC
 vAUgoGFtHrFS9FeEoNrRGEp5rPfJtmal7gx3q7AN+SC/AQz3k/PN8Bf2D/pQcuinczedTElOJwX
 sYTdiltmZu0S5irJ1xw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a870f2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EHrKs5ltxLiqmug07hMA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfXydvN2MDhbORF
 b5cFV+oCDRNmxMPUH5ZmThZHTLKGl2ri5l2LOdZbuNLsSNUtYYdP9/0QBrcZBLWmoK/Yqlsr5Qb
 OEFEaA5tvlea/Pc+TCOADA8hUSjduus=
X-Proofpoint-ORIG-GUID: kBubAMcxADMSscLZ4tf3yxV-4KqVQLya
X-Proofpoint-GUID: kBubAMcxADMSscLZ4tf3yxV-4KqVQLya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200108

On 20/08/2026 16:23, Thomas Turner wrote:
> Hi all,
> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.
> 

Again: slow down.

Why does this appear under empty subject thread?

Best regards,
Krzysztof

