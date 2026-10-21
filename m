Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577191;
	b=hrP2z47ToFv1+LpSSEf2/3Dnciyhgs99bb6TviFHRT5WpRvHz/qydiNy0OZJrtsIEq6W
	 6kcpQtQKH1MbwwkAtsRZVYeuokklAHa2AqboEv2gRsdjO+dg0w8pCzPOPwh+58wM0Ct99
	 QxQ+Yxs5tMY/dEoikqqCeKngKrgDGDtj2AK1qJHQdAuTt18NtmKRh0LYOOK5G2iOztFdf
	 YghbvLjJ+S1/3aGzM1uInzg84ia2B7CZ1+sbkL6er5PoYwFEoo0lXfEBn62T7OBQMrnhb
	 0HjskEYbLiYEtTQaPU1PvrItVv++zrWM51cm46qncX/WFHPn9jzT/tM6nkieVU9GyEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
	b=W9F60Df7ucxlvEh3MtAKPmtseSt69OwVjxmL9UGvt177SMwSGjQfqL1UFbi/mfOH76z/
	 LhLXqrCgqlkVbDtx+gURM47RB9hIOVsm9T8zcFohWcyQ1p+3J9792+AhVHSqnKCj3hKiC
	 ltEOoBiLjq485cC1zUSYV1LSnXaAV/8RAbTDeNeo/8lvr7dy40lBL39ADIJSazO8LefS3
	 1cZw2yyKHeZ+nvao6syAepBaamVHLR00XQhQnABGtSV1GPnB3JbwAOIh3DCZwUdgvr3er
	 783fSu4iRofdgCXuf30KtJsGj6YA6tYe3a4oezbbFKvzdRuFOi9veJ8vKpvOC1L4qdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC0606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CC0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6R8n282252
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=; b=aF9HjXVdVXRObLw0
	WVXnKJimB7hnAxD5r4fKqgXYO2WWVp2aTEziVkE3lkCzdXPUEgE5FvlCgn063/QE
	A90+SCuU+PWIrl9x1nRHh6tDuA7OHgcrvnh0prwFpo+pQgFvuiVfgR6tdZA8fw6V
	yYN8c6hSXHsFo4r18387JA4r4BpAkwKZalZVydNFDH59Arb9z8aBSOsMRwvw3TgW
	utr5OmxzYqCARN5j4zG5GX+jiwPqUNU7NsX9V1H5/FpCMavOGQdvT1BLLHQiKcYg
	Co9pkU6K3Sww8JATdou5694XVHRQ86q33zcpH1+8bXxqri4B5QC3fgWV8Ev8MhnF
	08/VBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2g6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:06:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso5165085a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577188; x=1793181988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=HllQlJEEGBXNv4i94MKHJq6UGTfIEW0H8kYbcm6/92LkqFCk6ALqDdfl1keHWTwDqT
         N3oQY/2w4OK3NhMm+Ii5lqp9nq6Lr5PrZKqXdQBkL1ihFy+ZhUolw1QAuWfc6I9fM0qT
         /b2QTfB6JuS3eDQJhUCLnXYRckLMgR3s86KDUNKN74+BFpdBsRxuPzozjJrk9iAym3zy
         dAnTMUcQXG5H1VxjDXxHkrCsQSvCT7snTKks/toXcg+t4+aOBK1B+Os8CaswWBSbxWIa
         fxdeTXQ9W4gvzJg84E3qk4/lRnWc3VUZcs5NLtc7Ln8Z24dOAa00MnFUFYOcN+VACO7+
         JnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577188; x=1793181988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=PNjLxB8YAHBcoQ4iOD4dN9WKM4/AHwQ3PGxu0kSTF0rWsScuNEzC7LQKd8WYdmoqPd
         KjBobVH/inbcfcpvIWdeZO5WwngH+qERzG7c9X/3RWFZVVjeRS/m/yor2+rh451cBwEk
         gmHbg858m/Nr7N7xidOt5DZCTpT7+pmsoRwDn0tpBVQJwiL3STTc0duUxUSFEddwmEmh
         i7EuypXmetKDDLuOw/SjYSmm2NIQo8vtnltMhfgWHatuqmrEARldm+Viu5Mv97i9aK1f
         KmYxB7FRpA5XmO3G27b3lRf+0YI/C1cnXY36Pm8aOK+PylqHRpfblwJnLwz20AKwGIqW
         6ssQ==
X-Forwarded-Encrypted: i=1; AKwUvByeBmvYga8nyArGr5w2phehm78I5/XpwnUUvDABwACShpaBvDDrGS4OloVNDU34jU3JNKtVrZcm/jTq@vger.kernel.org
X-Gm-Message-State: AFq9FYKyNSqmDlqn5lvRKTwmOre+ieJNTWAZIfg5znkmuBRsvzLpCaUh
	a7ZNmaBgQrNNdUp7pp5UFsEIMuuaF19gQSY8eWOs3QIQ6sF0rpoZp+sCFaylc0vRGbtWqOrQi/x
	TsruScVAAIEFjnOj5mRpo1xBPZKxCsLOE3zoK6n2bjfk1cXQa/rA6vrB3n/p2mcl7
X-Gm-Gg: AYBFou3eH6eI94APXPi1tN94+f8Qme8mvDYBN1pqHaFnYgTTSP5f7PnkwcEsIEj3JQh
	VxJnm4I+G/hB3oA+97Weh/k5CHCt979fDZdC+u4AnfAU4hcgZqhECyFG2nK7iibj5ditaZxJ1Li
	7+YbDN8CCOF4sBWmheIxitjvBNsPNqa9TS720rzCjl9BRrIbVxi/g42xETs2TmxuF1ukiJ5mnX+
	Qau21NTMhVUdeNioXyifAXHxgNwtOH4tf/V7ij88se+Usl6Y+etI0jcwKC0CajeblTMF6dR2Lb6
	XQTmvyKuJmk4W+a+bI3roDEC5nnrkU5n6SSkx/7FFPr76CBZ3xLfMu0JK2w375IgkwHxPPQNh2t
	vyMo0zd/J86VBclyiPx3Jwg==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354620285a.6.1792577188379;
        Wed, 21 Oct 2026 03:06:28 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354616485a.6.1792577187926;
        Wed, 21 Oct 2026 03:06:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313258dsm679293a12.28.2026.10.21.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:06:25 -0700 (PDT)
Message-ID: <2196fe69-b520-4d1f-b04f-e32808b689f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:22 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
 <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88ea5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aQ57efiQKxvF-d_-SPoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kHH9hvzG2k3xJKS4uTI2QwC-KAczpGI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX1DT/owd323kS
 5nex1v7afdw51Y5DC4EZcfAW+1uY2q7R1+dWXIN20UZGa0yInUwWiAf27NULBjf4atoWo5BOau8
 HASdgb5CZFWfCglwRK4nu7p9/68R+nXlBq6jXK/YIm7GqAoo5GvQPIu93DcAlefVApYK8nHy7Y2
 rmaDQJVEJSouQmmZSeeZxQdqfTASnbbuQPH+5GxuSM0ZgUdUTZv9HttTkUYnkSLG0URMGvZvCHq
 livcvgmvMfe5qIWgV8we0wT91LSblMT1NA/fDTPyJOK627nLHt/wHijGzDLZO+p/zg6sXOAsZou
 bN5LqrvL+4G7O4C/4RGRtL9TQS8N4MgvRDWwvy+i3/FSmtaWea5MzB6yYsZuDqxj1XmP27HhQKn
 cs4BhrRzQ+tbVeBAJvLEnaaCSUPWJC0xyFxVvaos3atZ8KZ/a5qMumf7XrtTad6VHy6v/kI0BR7
 qgDi/RhptBeHDd6kbxA==
X-Proofpoint-GUID: kHH9hvzG2k3xJKS4uTI2QwC-KAczpGI_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX6eenSLaOPeIN
 c0aIfdnDTjwmEe5G6XAHGBRAkOPc3GhmHcewBLbnWtcF4AwFK+Eu5J2xQfSWs/Uugb4qD/227Cp
 bdWcdbNWgT0IAZFk6qKGNJui3GZ3lrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Purwa IoT EVK variants are available with and without an eDP panel.
> When the panel is not connected, DP3 is unused, but the base
> DTS still describes the eDP panel and display path.
> 
> This causes the eDP-panel driver to probe an unavailable panel, resulting
> in AUX probe timeouts and missing display modes. Userspace then attempts
> display commits through the eDP connector, causing repeated DPU vblank,
> frame-done, and IRQ timeout errors.
> 
> Move the DP3 and eDP panel specific nodes into an overlay so the base
> DTB describes the configuration without the panel, while the overlay
> enables eDP panel for boards with the panel connected.
> 
> DT overlays cannot remove properties from a node defined in the base
> DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
> where it takes effect.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
