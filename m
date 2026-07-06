Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D99748BD4E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320625; cv=none; b=grDMf7VsGOCiayqiw1KT2e7/rLUlNJs4A37C1+cWgmtiwUyzVu0ND4R/tP3xupNiu9x8Zz4gey2LGm8K4OQq1ERFsvnaAasGaSdl9Ckzy5Xdrc6iwg5JCKsHQqSafe9QSk6VdX+dL5J8IGOBP/eh+Ek7WHlSjZN8nzYB75mcDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320625; c=relaxed/simple;
	bh=5XP7U3XbdBQGJ3DIDkBx+wxl+FEgzzyh8LBWUgI6TQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tacn4GMgSAgzSftSn0kqOSub2Y+JuXWT6qSifTPuxNUUFGNfMe++FXj22Wqgx9Pf8tu4t3gUqKX7ZrZRQEDX3pTdO2b5pyPwDUHgdBw7M0AEuPfvv10JrADD37XZdDZMYAaF7s3sfIJvEa1S+7G5lzZX5Nw8Qxwma8SBc/NjbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noQoj6EI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ER3HEviS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noQoj6EI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ER3HEviS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641VpQ3623887
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IaQwN2nby+dYnOfO1eYFhhN9
	iCDNr2VXqiO2x4Ci9z8=; b=noQoj6EIVIsdeUYLfr71smgxpUhEul3V7Rve2ciI
	PYl+DXCl81H05w/Hp45GE+wEfgE7Dd9tRRWMTYcArDFeGJ/j91TL0aQtD+moxhcS
	YOoX8cw+rv1AlU5W66ugsAeBp/JU3oC5VRt+osXw7FAhdejLbeot8TFWeK8XLjZe
	AHqhx1eD5g14gXbaR9PoRB3aclYacCtqy4PPF7BDKxn2TXQt0uCEIlzvexfKUJY2
	zSROPSYhcy6d8GvK7QfAHNQ+WngIcL8l8jIQyLtkqsyNd1jApqwJizYGUNnnntJi
	ODJFip82kCMFdkTR7XVDlAQusDoTU9UMFeSXoLD4WFG2LQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw108-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:50:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c916d17dd43so4286807a12.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320614; x=1783925414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaQwN2nby+dYnOfO1eYFhhN9iCDNr2VXqiO2x4Ci9z8=;
        b=ER3HEviSlmQBHHlEqbmp/lTQAn7VREiY6kS6cPJo2//dylI2yIMcwoeXEyR2l1RX9h
         tSw2vUmr+lLUvNWoCpXi0h11Ra+nW0YWR5sfbQ87VJj8k+ABEBFuGyLWjM/sZhmDB6YR
         Et+2CrcTtj7gXO/9bWPj1/OlLF9JlAvTrp5rpcBnD9quDVwk+p8zlZfSZpm4lkqjPiMm
         +vdYGWU77xld7DLFn2AjhIwS30QbvlwcvNifwwvKUtWSO8jlCpo4i+gcJDcl0xlZhr8H
         vGtwlNDPumi2iPp9PQ255oPNzU3xA9wT+zpRaYs5kMvBPGHvS5rNwihlhwAKKH8Oas1j
         H6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320614; x=1783925414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaQwN2nby+dYnOfO1eYFhhN9iCDNr2VXqiO2x4Ci9z8=;
        b=GZzRb+NZ2hV1RZjts1X35izYjim3QqZoonjee1TDrpGlgj81Q97SYD+G9v86KZCO0U
         Uf0NuWLCp3h6901Qhv/e1A2bL++EdjF+e7T1Qk6jjK86mx9jvVGoCZIthIbmBjG95zUD
         3dRTYlYUOo/PxbY6fnW1OnEncq7Kj1XjDGMsQXAZJAr+sIatIkDxTuN6eMrpaFZwQm1u
         QPe9eZxmMKtu4kAgJyd7+JfN/7Ov501Npo9fkuTMz1nqRJOBqSD3uPkX1EpC1wtn9Tkd
         SdP3O45zG50g3s2onokVBFFsbtEpZ9IQCAT4ipUqx70GEOArjwzRS5ItQuTrLynp9eIj
         GIjA==
X-Forwarded-Encrypted: i=1; AHgh+RpS4IzXn1D9U3L54UanzbrRo6qDI/nsFubFckc9jT2t7soZiJROGQiiVHNQwqNNpLhX1DzxPo8lb/vF@vger.kernel.org
X-Gm-Message-State: AOJu0YylV22xgFs0pmFSJ2BAnRfhi2bOf4SB3gmR9FkuOoaX0F6mi5Q+
	Jq5QGw+Jd44OVZn9ic/J1BRQfQc8HaDfqwtaa9BDZMQHBY+AHZErqYFLLw8vj/IKCBt0UVmngQR
	mkl8jsQBlM80JyyUvA4cOleensSfn8nnZrtrc6ebYoPXUpBHzMUoEHZVC6ydRGBmo
X-Gm-Gg: AfdE7ckokU2WSNKZsZUC3aLtM4yie04oR1foeEtX7JrMmlCf2y/6a6IfLcFw0CocGE0
	vVRiyXxMGBEK2LRPdtb77NkZ71JR0lQXWCtzHfJrNX+ds079hHK4Y1JKPdB56N6yVedLda3kky/
	I6VM7V82kC9TZlzlyY8u+xCO8RX+R3NYecL4ykXyNCSTYbWmy2ioSzrdQsCf7V6GjarrwB6z9kT
	TmYJ7uHFxJumTnqaKLVPZItwYcyAgQd871vvkpFbufQ1hr7qXhQ/JDQUzZzKhXE8QoXt5JunJqT
	XeUG9Mh2hobuuCgh3kRDmxAMVMNGrcqXcLtHMwad4mlIMWCUKgR3FrPN/B+cmDgFE8ESuAX6wqI
	dWB5FszA7SBDx3CVAU6B3ey0NpaVjPnW8or2bnIdwKOxTsPnq6S5syVPz4tGc
X-Received: by 2002:a05:6300:670e:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c03e592fdfmr8095338637.50.1783320613682;
        Sun, 05 Jul 2026 23:50:13 -0700 (PDT)
X-Received: by 2002:a05:6300:670e:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c03e592fdfmr8095320637.50.1783320613208;
        Sun, 05 Jul 2026 23:50:13 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31158ddede9sm8584495eec.29.2026.07.05.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:50:12 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:50:10 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Message-ID: <aktQIt4yEKKW6OKq@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
 <akrWGWtPpIJhL0pF@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akrWGWtPpIJhL0pF@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX0+9pjuWyFRwD
 V+UG8ikWyezR2rz9J+FyB4WOLJxxmkBaqmdJpBuvt5NoEmdVKMQfVGISMb2HtMPY+72HYnPPHMO
 np8KezuPHNONSkj1c8cfV+BdKx4Bs5o=
X-Proofpoint-ORIG-GUID: aM9Jucuw6OXtWjWgl8_nlAR6Q2E7a8KP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX5z2tDOvOoLdF
 d8wywSqQvZCWrEC0akeLGZrH9AvWzL9JMFRBoTeqqcpN6runWH9TGblbcSoI/RHUiF8SfKMZ6ST
 8TJD1Ezk4CywUiD0H6gHU5iRrQ0UPoGIJzwfF+CjUvCFY1/NKQhZmMX8BYiesxDNrDy+X1/nQcV
 8FzqheUGZTBQ+V0KIkp+bsLSdsMtmnBzVAJBbItuStpKLO66VD3ShUWsXOeM7YlH5YMGBqQFiPr
 Yy7hIqyDgtluOnfpmNu7yImsxqzqlR4NWzw3TYdAOV5AiX1/Y4tPCkDDn7DeGdvIPu4GFVT2M1g
 zH4P+pr0+DefEopo87MuSOeKChmixg6wMiG9rb3Or6oWJmpsGhWYQ47cEs6CY4Z4CkReaRIl5R1
 OazWfwiV/XtvRSYQg06o/vN9bcLfQ01YN3dE8rOVvZvaywOd0iXgJluVBQCKi3z41FzEBVKNtrN
 5kSNXcmMSjnsMyRY3kQ==
X-Proofpoint-GUID: aM9Jucuw6OXtWjWgl8_nlAR6Q2E7a8KP
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b5026 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Q97BnuzodRhVEAZlOpAA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060066

Hi Bjorn,

On Sun, Jul 05, 2026 at 05:26:22PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:11AM -0700, Ananthu C V wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles Stage 2 IOMMU configuration.
> 
> This statement is true, but the IOMMU isn't involved in the interaction
> between OS and TZ, so it doesn't add value to your problem description.
> 
> > Additionally, SHM bridge setup is required to enable memory protection
> > for both remoteproc metadata and its memory regions.
> 
> "Additionally"? Isn't this the entire problem?
> 
> > When the aforementioned hypervisor is absent, the operating system
> > must perform these configurations instead.
> 
> Please rephrase these three sentences to make sure we have a clear
> problem description.
> 
> Then, at this point in the text you have established the problem, so
> break the paragraph with an empty line.
> 
> > We've been relying on the iommu property being present for this, but
> > for remoteprocs that are already running like SoCCP the mappings are
> > already in place, and any attempt to recreate them while active would
> > lead to smmu faults and a non-functional remoteproc.
> 
> This is a significant detail. Please expand the description around
> "attempt to recreate them while active" to ensure that it's clear to the
> reader what the problem (what does it mean that mappings are already in
> place).
> 
> Then another </p><p> here, as we're once again in need of some breathing
> and thinking-room.
> 
> > Fix this by adding a needs_tzmem
> > flag which ensures tzmem and SHM bridge setup is performed independent to
> > the iommu property being present.
> 
> "flag which ensures...", the flag doesn't ensure anything, it is
> propagates as an alternative trigger to the PAS helpers to ensure that
> the shmbridge is established.
> 
> Regards,
> Bjorn

ACK to all, will take in the suggestions and improve the commit message.
Thanks for the review.

Best,
Ananthu
