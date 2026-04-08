Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07292EB5A6
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775609436; cv=none; b=HDgDZwwYUGx+986JzzB301vX0dEnpCapmsB0UXOgprKgqvfTxTxB+/7Vq0a8pzhREY/FdocxB81WijrUQCm83TGow02SbVPYoNV0Ad/kRHjbl7xJsXnVjXg+TbBDv4uzKz7ZP9DHnITR8X22iGu1apFmCoxHqnewJB1lk05rJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775609436; c=relaxed/simple;
	bh=1Cr8PTN53dHeqtE1be+fjHeXvdGFqpP3eIJjucFNLQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDr4lBrDdi9NyHZ9WL/oE4jhaaNTumJJaGtiSyD2agTbBUks1uuin6ewMRRAPH1LO2O9rPf3R0JDig+BbGDQzlSUTivw86HGiKSFtwUv0DVeblENUIBnPbzhQI47fCO09xYrxuxOoF5yhjySVfRKdVYcktio6U5tVvcbZfYkN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozit/gvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yju0S2s+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozit/gvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yju0S2s+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637NfXTV1259209
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 00:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=; b=ozit/gvSbHcoJVGz
	CPR11U4zo2QpOIqtXcl3k6+zGBikRLbtrQVr5d4a1h3S8OG+LYXe1ZT2ZjPKDJ9b
	FnXPxfeg1+T0X/aVOz8pIkNq9VC18GzgQBRYutDbiIjo89g4Nql0GYNR6yZzaSvS
	N7EIAIm/wJccG6eTgLYdRy+TsvPAEWSfStmstOo7ICrO34Q1rBVTPz9z5YemuWUj
	evC3ztikv2vVAXXdNFj69YUXCHdATQV908f2H/jtzmosEREgoQOResAHcY/w0X3F
	lR89svDdwdJ/VZSdkXZ3ioJITapBSv8k16sgYU07AsHbCEQ57r0Da/pI8knxScin
	fR3JgQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttr556-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 00:50:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so7800141eec.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 17:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609432; x=1776214232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=;
        b=Yju0S2s+hoovooUW0Mst4atOgwZoIACRvx9HJ/mLxhRQCd5ToyfyQL23G7ttpdUpaE
         IDPaDEt94y6qasW6M4pnUZ44zMY40SakAL7LotHDSEuC3f0MLxmDSkHqPxzKWokVrwd1
         XtGiiuyUldPLdwynpjotjC0P0UD06qNM5KuFcaLXbQRARwQ/V50dYqTpJSC/2PAAiezQ
         SFJ0yFP9+F73nxVn9aJNGsuNuDbDeek96fGnAgQ4Az+tHQkBBfx5Y7AZzF9G1l6Vfg2a
         w8SjQowKRtqsB0uWZqm8s0BW2dNQObGJzjWB9JHJnVqJ/k2WuA5imoyL/JW18EIBV+Rz
         ELdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609432; x=1776214232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=;
        b=VeCxUottcDpsLxr6LgNQbM95DpCpDFy4KRU2y+kzK1h75Wt2mV2Xd1K57GYbLR8pCB
         VIZ0WySB89PxcV7BMBIkb9MDX6ScFhg5gZT934Cf/IVB2B0fxi+naejWJ9nKj8ygD+OG
         hNY4/uLwe+ynB9pHggHxTNpu5WmZXyR9/bhWc3LB8ZVTDADf0LjvssKLnd7/2WjCki/1
         FdNKokffwvINrVwgumUl22p4TxFQSE37c44p9ljC9LRKblRBdmAePd2rcYT63Y10x65Y
         mIgod1sOuYyBM2oI3OY6uq5hfHQBJ7WnejYMZW3XaSq1cxmoWu4WBDfYu1vav9Q+pTOY
         6x7A==
X-Forwarded-Encrypted: i=1; AJvYcCWrn+nWjc7Pr3VHMjHkcNrcwa6jc3MbXsjwd+t62i3NNXXK4QhjadkqrPxusb70rApBysKEXT8R6L6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxFc7PUlKj6i170/CaZhT866zZ3XlBfpJizABtNoDNRV+amgWoj
	mMfpgR18AR1wKitpBzke5dtxqeDxLJIdmUORrT5kCzfbnkGk/5sP9BpT+YbXsPdjxUZZvNj+rZM
	zUxABKkB7eQfdCbzJ/4Nclvtawl5Umsob7irwxD6py1HXbPdCXJxxhTa4yiiXOucA15fg9alj
X-Gm-Gg: AeBDieshO7ffUngXIdH7p/eA3sMXnAkhXc1feJd+UTl8w2hlrs0v+5aBCKAR2q4GDgp
	F9JtEASpRmpgMIxCtL+jfJpoaQhtL0DTZs27p9dimOeWvK7Y3Dh8b4Zzgj8xHZmf6aD1NJ+N6tM
	cpSoFwkv3FJTsrjyYIAkBI6qq1oAydbuhlZgVQvwGf3R5pi+PfwTsDw4r8Lti8ssX8hSBNBzp9i
	+fmDJioAR2NaNISApnm0u+SMDDZ6ij3kun/ixCGbr3uPrvw00faJ/1vgfG3oauHRVGkXc5Z7lbw
	TP7R4pDSnp01TZDQP90lEoHNiG4EvaHAhe4rLPfWReGMbrAQ1ZAW/pLjBZRyJXa9Fy36krQtXUy
	XdMAerCWJrdSt1qszW7oUUpFN0KYOutipXMm5CkmLOA8JTeTbIY8XbBqMbRjvIwRGRmy1GJaID8
	9C
X-Received: by 2002:a05:7301:1f01:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2cbfa9b024bmr8302628eec.12.1775609432231;
        Tue, 07 Apr 2026 17:50:32 -0700 (PDT)
X-Received: by 2002:a05:7301:1f01:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2cbfa9b024bmr8302609eec.12.1775609431693;
        Tue, 07 Apr 2026 17:50:31 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Message-Id: <177560943002.2878209.1743406779357406462.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:30 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: H8xetP1bo-0AKTxycGCUMiI1tGcUMvB4
X-Proofpoint-GUID: H8xetP1bo-0AKTxycGCUMiI1tGcUMvB4
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d5a659 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2XysiazmuIoG6y2HQ6cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfX/IUSVivw+VrE
 xjYyvH45EMsajg45go3HqUUsBho50DYLXCl4yBfmDzvYKKKta103vfo/W2C8gsjD4MRRvg0oEp0
 CpoRaHQlQAYQl8BVh0PQL4JifXqIZrqgQD8ZHj7elt1lhTW0Vn/aJlGkNrMIZqFVTOmcAygBfLz
 GS4hTncvMAUi1UbAKm/8dh9JnifwoX5aCrmboTpa4vhA3r9Zof3ZJm5z9GXprROemnxQxZ73FAz
 USP0bTW5eNreLGkGDDljV69bxkGhS2iWPwwWsOTKHH42F14flTbNu7BxKitya2JNr6aoKknqIMU
 nSaPuWhO8oCNU7uGq+VU+KfoToQ7YDYJk+1T1XaDVMqfhK3mO4gCM/MS0BFzuuhz4PV/WUvsXj8
 uYTIE/a0PCg9PNyiuLrvY51zformNyBmITNgK1/vMF3kMWdP4cK6Q6n6Tbai94nyEsAdDmFMpr3
 yfqArp3WgDvnUh3E0zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080003


On Tue, 07 Apr 2026 10:56:27 +0530, Raj Kumar Bhagat wrote:
> Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
> AHB only supports IPQ5332 WiFi devices.
> 
> The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
> configurations. To enable the IPQ5424 device:
> - Add the necessary hardware parameters for IPQ5424.
> - Modify the boot-up sequence for ath12k AHB to accommodate the
>   requirements of the IPQ5424 device.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      commit: 3ebaf730b5832319726e12ebe634a7679eaf2e9b
[2/6] wifi: ath12k: Add ath12k_hw_params for IPQ5424
      commit: b1ad1a052beda2ac0400d6d4cc05dd2e549a6936
[3/6] wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424
      commit: 74f5a619b1a6a06cc5e6246d326da5b6f2b0fcbd
[4/6] wifi: ath12k: add ath12k_hw_regs for IPQ5424
      commit: 7e2131ba332f5ae62b6302eb889feeeea56a1691
[5/6] wifi: ath12k: Add CE remap hardware parameters for IPQ5424
      commit: 38cff745fa7c0b006f95565a2e5de9f0cac13702
[6/6] wifi: ath12k: Enable IPQ5424 WiFi device support
      commit: 8fb66931fe31094aa2e1b2a5c015050b8b4cb2ec

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

