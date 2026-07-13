Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4239B943
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941983; cv=none; b=Ko6PYf0H/SPdyN3frJy21mKmt2uIirrgquLEAo00rdxkqPDFmaosJYRQSoTszMtefkr5MHLZme0yMu0u6FjTKDMmGzRA4m52bGvnqaff+ELUsoh++NfMN3VNqHByMH+auXvlq8GgDRJiU7t52PIyr9yfyoTPpFlVBxwmZ2IQh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941983; c=relaxed/simple;
	bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9Dbff8lQQOdto2CHCQRoOxpJq5hOTQ+XCyGNLuMnWwYRgIFCX3NHlUs5ahOIBLR+djYOKkIeocJPR6VM0IeM1SPBPngYl66B8kbOnXCXadUUqhuyU3oksWHkNouJD8YTGO4oglexEHTY+e7IsFkLMc4jXPBay2QhKcsuvzILlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfKkSOWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8htx/JL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfKkSOWS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8htx/JL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KmWk775721
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=; b=VfKkSOWSLtabfyGx
	pBXVACq3Bk/eBuD3eEOqwYcEegaLnYMdpa8oUbCe2nS1cl0ORDFg3iRQh4EEp8XA
	SiEuczpi+kM9VnceNEUfiYqVDsRLX5twmVias+MbOq6n56b6FkfSOo5I4yo3JSx6
	rpFfIJJ0yQ06oM9SMcMTpB+QgxWuNGS/fa9NgCCRlaLI94qQpxv9OlRyBdDYnWAM
	PW2EdZtTGuwO0QjsML2wjPrmcGG1zIwnSPt1c4qor3E/3TaIfnYC9rNwJ5aV1oE0
	3jDrwCBh3shKry3sKSWBAdUfh6FPUhk7bfKplb4DEvs00lMfuzMPDy4wQPyhdj98
	83A/BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00wj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:26:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so5529751cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941980; x=1784546780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
        b=J8htx/JLTO1cP51S7uAbhVsSbFoMsJcVjg2Ku0eUt98vljhlyf0qs6evl2WrgtTiAt
         lw3TD5ZQ+aux1ydVRmJSE2kiWvlC+f/iYr+Y8dhLFJcEgIgPHrqgfpG/nHQ8x4TKOZWb
         fzWB0KebnaMVZ9fNl6j532q9CQBorACovrFwpk9zYCGxREVpHb3yjPiJ7KUVo4ATLO90
         Zp9QKCRGijWKPLI9Vtyg+kjpOowWGWWRxNINqD4TWaCzP+A7MDFZ0dsA1bHpMHK78Cjg
         whbmMi0S8h78tcomEkyiMGReJ3Mv+BDxOxoXsEL792ysXX9uoKSdFF3kZGSi2SAPjy1f
         rH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941980; x=1784546780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEJl9tPGfPCqk+CBkolb/mvH6ltxmH83HP843lDCGR4=;
        b=TbEJ9IvFcklmaDItMrSjyLenmB/WcO3rIfZ5B6BLbEMZtTzfClR77dXFeSlVCZWKX1
         fvgUAqSuN8GfuzH3k+fnBUOiNbqWfhA+BAbdpvBXO1Rci52c4AXU4ggtQ75uuPB5uJZI
         LMUNskvvmQ0KobiOuW+uZTz6joCmB4TsTBhhXBTKAf3DxwGU0DHYh9a4KWKBFKVL5mS4
         IY6vqpuw3k2IF2F4dZp38OncjmwpF77UzWgOvi7L6LmJwHPFF6YEvuSLioPWnBXNcvYi
         li/4mnIY3OyjdwujRB7QKdH74CPLfg/Hw/DYU1FjwKSotg6BSX0AHLeSZLAnxKyvbo8a
         77qQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/LF5sMgoWTfoZt42R8/WYzStYzg4ZihrEvEUDIjkUfAtpBoQ9pe+SzEv7PnAZGOeGFzs3JzuGi0Kc@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwy2fJHmWelllY7aTssMTwEmyd9EZgvAYwtqVFgjr/Zt91iH9
	lk4KoaoL7SSHjJQtCCjgY4O5wzg2cbrPmbZqjuIOtCbQ3ydseNA2l3uWdiyALGpaxjfL5PC9umQ
	pY2IGw1+Ar7Y6IKXLMANfHpL8sX4tJIU1S213e51OhPnisxCl7H8l2jZlALnrHNGo
X-Gm-Gg: AfdE7clffMGnQV8TdNf0sWtaTUHRR8Q3Tb+/EjJyp8z7/VdRyGheFm39Q1fjoFe+OZS
	33pmJAA0K/+mvzLfszkNRp969crmDcnLlmFkx0fFr6v8QFPUIdnSRyM5sOV3MqSW5aCcSxPygYD
	zYirnsge+DL/dF4XCve0My8lKYcKS2vpWewfF88e8Ig6/hpwhAWS+tcnT7mjv9WldqPkbhspJev
	D4uHJ00WZjrGRM04YOeIRTv+tYOCGmjHF7QQo2VAeJiV9LChBpVTSQf6ExbR+CZFhQ/C4LkyRbs
	b+zkiQp90gEKWk0Ks77lrocAdRlKaYxMn2+jDisGMCitb0CbQLnxicQsa0rk9J4rTAQSi2MG5dr
	IO725qUnBdkdeQkLDY5+OGYulF571SofWHcs=
X-Received: by 2002:ac8:5fd0:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51cbf30e92fmr64404291cf.10.1783941980567;
        Mon, 13 Jul 2026 04:26:20 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51cbf30e92fmr64404151cf.10.1783941980178;
        Mon, 13 Jul 2026 04:26:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c165a9b7c73sm8359266b.9.2026.07.13.04.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:26:19 -0700 (PDT)
Message-ID: <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:26:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExOSBTYWx0ZWRfX6ajiCmzFbkFn
 fZSSAzWr5WUWvBG+YA3VTXaMmsW95/pFx209MI0ioZS0YcK7payGmKTl/13DZUf+A/n56GRsjsv
 Ttn3N05iu60dgCeaMIgNpCU01KIxIcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExOSBTYWx0ZWRfXytj1ktg7RQGO
 epR9PAM7CZUkchVWeuerfJDMLJPMRDGGGQChHFuJ/FF8wnyWZw2bNX4n4Lol5stvbY1Os4I8G/g
 UKnki5Hmus97Yqw9Fp3yWOoPE1HwifHmrSlO6woekX5O7C8UtUdPmieDjqU8nL/K4dMBqhtNOoD
 B7ph4D8A/b9+NI5Lve0hrqdyWqCJ/UaXLKQBnih85O3y+moe64QuPZM5Zo15WKYpxcBRI6B8/HJ
 wJQhmVE8ibDC/4STLBAXTc8hWhEd1SUIWXoWmn+GQs+gqzDqiPBXu0rvCsUYZd5ixy6RZhqCGb+
 crRHMTymZ2KeNvXH1T65sXRGyYIBXRf1Abz7926womDsL+TELxJI7urGVMWhOn4thVSKqrnq26G
 tRI9pggMZ3uI9EsD5tR5MK/41QmgmGsDfdKUGu18cWvnYFRyeulyttiKZqkPMlzo2xkpJR3vvzW
 c8QAYO0Hcesf31f9SJQ==
X-Proofpoint-ORIG-GUID: sFM8G7hv9cKmWLPL8JLyHllLpLY9nnGP
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54cb5d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qFC8wAhaXB78bAukjjYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sFM8G7hv9cKmWLPL8JLyHllLpLY9nnGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130119

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Remove #power-domain-cells property and add power-domains property for
> MPM device.

"why"?

Konrad
