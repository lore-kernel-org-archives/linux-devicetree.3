Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377195;
	b=WI8Onos3LdLIgpolpr+vzWOaWoWpNzbcKk7U5ab7oaHpfjnSd+i+uLD6blEs4lxxlm1+
	 Qxz3AXi/oY5jYPRen3yHkarIe1VbZFPTtnqGN9ezEz5C9c1nzKQXCmMLfWePMkncCFUcz
	 WlapQ4+itfCFmvTl0nD3MrEuOCaChr8CtGuqMR2k6H9yrxG28xfKVfAhW9FGb2er3SDEx
	 6b2Bnb5KW+wVsSn1kqXZzdI9Jf2xkNUey5ajz2f5dveeMWkCvOzJv/VypCZIUXX1LQctS
	 +wHJR3LqGKvhBSM13xu/LK7UFdyflaOsgCBha3zWCkN3+DmSgYUbm6xAVcc5ek59Isw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
	b=zugChU7RfEqqc6EimXJ/OEj9zs8oCCS3RvbeAKbKeJM5cUHyDO09FG5hFkE3F81XU5lh
	 9uj9Vgndhth0WsMOBKqiGkSxtJHmSI3XsusZrjmKJnEzmyI7zyIzm88Rfrqsu05yiYhC3
	 kDlmMeoBhwAzgy8UrU5r3/ajVnQRWCNDmIStrA99+2RqNkhuxHjFOiy0s77Fp8iQbGp+t
	 wAsTi5cHNQShaUhyMLPiMuaFNLcME6OQI+PjuJrm45ipAJogh8HkEHVNDTpsbcZnB3SBD
	 as0cj6mAQo94A6+mIeVfFzMZ5KgdcIqdsqfdG5EknMy3AhLJxRRQs+xYBAyOk8Sd4iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4E606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDQT4141550
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=em7nwsBvfkjrmGxpt9MT8h8i
	0Wxrvo6KZRBsSUc4l0w=; b=BZJFO39bVpwRcsNSYuDl9B3uxiG74rruMnfkZrIU
	Mu2PYyaDjL6u++CRwdn5AdtMY8XASnCVN8kqgiKt9nuMtZns0XxLF2fO8hbD5j/x
	4eckunkiekMnuMbD3EsOQOTRBn611K9TiF+u9wHLqKBb15j4PHqJoHwF0SsbD1FA
	0+SfPB9E/K730dRBI5/ZaFGWQKJQZzc75jtLUw7eypHPNIrj58C2anOAoEgmapTr
	VxH5gxon9uwaoZjVilUYyBa/uYULDxZsFzIrPAMYRSlD9jadWzNh6zW7CccPk03U
	GfkuOPQ6XrTtnboEZV2MZ14nob0dGu1hFIlNz4/EOUaEBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qux2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:19:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so80604085a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377193; x=1793981993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=Q7h4hYvzLOm7FJg5o4lcC6mwrfoVcJ2k5uX7U0uRMq1aF28lblN0W4ognMaRhPovJl
         ruMRuoRNp4jINI7jsaZ+XQlxokDFrOAkshPYFj7+OB9Dvsn923YscxYXXE+3mLfa62aT
         A4FQL4ZxIdnbELebv4lFaWwZIpqonEiSRWsZxxsgvr+4z8yw0vpxBfFK4QmoSgkW6RJP
         EP/UCc364aJP665F1BXJEq75Me/laViyAOX0nMQC7waohl67+XB2BV9XmoC5ic4H7prD
         Q2O4l0u93cs5o/fT8Ctu/9AWolJPeqOgjtZAE4CN9hDlvplt6oiKnjtE/aWH+KEiVJNQ
         53gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377193; x=1793981993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=XDtT85b4YtIBeLoUUZh/8T+kshthGhcy55FgmUn+z5GPQ/cYWYzO/q0eQ4WHVgu5wQ
         xVNpmZyAA3lDG6S7T7vPscNkKVHzo369bdEC1WQZt4gasYcyIlFmCEuniceYR8OlGl7b
         niJMRSMKipLR5g4u/29JUjJTFpW1MeVo21zzZZGB442zQkL2w1JPntERi4xQGm+rsio5
         wed42qjvSXOy/IIpSnmmioe76KOOZm7FMmVouOSEh3zo6WE03FDxm1uQhVnxQUlRDBoW
         np/q5/JSMpmd30NNCOWhko2mfK7Sf9v0rlPGtMUOvNOqEiSIQ9+ac2P0owF8ZQ4Y74Zc
         GM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+0QpBsJMCjcnsvrlzCAguC5WLiIPIuJlUaBM7p9x0Tp7+fAHqQ+gHFHkvhfU8+8uiiFL8Xe3WPTyx@vger.kernel.org
X-Gm-Message-State: AFq9FYICAQYXdgeUidemfoAOaboGAWhc6nvRSxUUCgIUeklfe7BUM/jK
	B5nZHCiDbq4/spu7KgZbzz2t/9cYP5G5/5xj6T828n5RdZHMn1KXXj1QLjSChwTcMFY2CXFNdLj
	wDDT2GKhF2SHKoyWcQiufCVwgnhTqWJ5dTGTwJ5BVezyiDCDSUo9tVI1ouD8LDJPs
X-Gm-Gg: AYBFou21xyZS9KNTTDyN5W6U2oQCKGtBli17RfVmudU6hApRi7jRB113OmRL2H4u1oh
	inHrJAJKS7ORh4+R8Zgt2Lof9iVS1o3JS3auiffnRLBHHUy8vqMyFoGedUH0SZv2FR/ftE5RmAp
	kS1Ta/XkFKYXMX6otghs84FFcUWuc86CS0ZycjQfkCUqAVlp+Y5CcvN0AlxgoB3HszZ+oCCgSmL
	PLoDSeKAqJ/q+5yznQBBv3WM4eUEUfIAN5LFZuXYdR+/oCDfb1sN3xJRcOmmSXtMIcq/kts0bHJ
	XeWfvDz4LUFfZYOuYM+nHzxZ3l8vuiT39xHQU2YZreBgdjTD+MfPPwmDtQPFas8yGowNHRPkJvY
	GXgy/1nGYuQpdqJaI9z7QPBdUdWtncatKFh4dlpjiAqZSc3o/85dVFAhXsJQAAi+B
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462071785a.7.1793377192950;
        Fri, 30 Oct 2026 09:19:52 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462065885a.7.1793377192292;
        Fri, 30 Oct 2026 09:19:52 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm126104a12.10.2026.10.30.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:19:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:19:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Mark USB controllers as dma-coherent
Message-ID: <3mxenh7tqbblbipiybfjfgbm3zboui7gnzw47ondqet2pjvwo6@55xlnjgmop5y>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Proofpoint-GUID: i0PHI2b0Ys8NnRMjaymgrAHzy5CiZrOg
X-Proofpoint-ORIG-GUID: i0PHI2b0Ys8NnRMjaymgrAHzy5CiZrOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX3pUaR58aO4hv
 /rtj6Za3aMDvFwBNbX8wh97dZxLQb1W+F0yHB4NQS5Gl3xtxQbkwEAG2LHSKky/9tfPC40vXPqw
 U6BreCvfZx2b9v+lURT3I9bOUcb2+YW7j/HV/jhSJ4TN+oJZMYqdO5PEVrtiWPxnLFyT7Eg8nva
 IRFogFugw3C3iIrCgxUKiXoOylvSwOLXj5o6n7WaCBMYklNGrDLaGFr4oQhrQ2jVV5x1aYNLgWO
 yCBRycmvb2zSuzsEMdirFPBru3tZOhTJIVjI5ZKXMsIppWBAvC785t+fmCPEIn7m/gDvZXkic8q
 GABZNhQG/0wVUNjbaITelzP60JT/UNW8wfvZk9XGB9faGtNq1tr1vCan9HlTqfetuEuZumbk4vg
 S55rbUNa2albczXbpzDaoFQI1Xb4vyGL3BOMMzMkOcu8T51gHGMMPjJ2+Twy9tm9tRySM/fVaEA
 s1V6qjmzyQfdZwLbrSA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4c3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=q5fyLHn3ZVvuh8gySswA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX91uJaYvuyVVz
 L7hyh+/y61iPMBNsRj9Dl1Zn8FTuHMoUPfYsU2NcCr5tnxvWIwFlItQk+1g7xLs/3qFSXU4Y2AO
 jtrhO4lE0pmQsAcFWVcslGuqfJ4p5Z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300064

On 26-10-30 00:03:37, Krishna Kurapati wrote:
> The USB controllers on some platforms are DMA coherent but that property
> is not marked in DT. Fix it up.
> 
> This series has only been compile tested.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Entire series looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
