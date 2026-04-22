Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B843624AF
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888187; cv=none; b=ubE14NHeWRwnZPVI/Bg8y0DF2ceEivANsJj4ppLkSFAe5aUmYfL7cARyc6dMg4rNPrDEtSf81vHygwNrfyV/MwtnvhcZIIJQH2dYQ9n0Gfh9zg+XzsEeFq0N08+G7CBH455lGHmMiWOcTPR4e3v4FiKf9vU5PydsLwvD3J8NkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888187; c=relaxed/simple;
	bh=o3uw8Dl/mDosRTBxq+evRZ5aY6Q5yBBBb4lp4lxAIhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u33m4slNooxY1Xa804ob5ItTlzRArhNSCKCwBWwd42TxinNSk56EgsHGzt+D2noTMnTNWpKQq8pP1qVPydPqNzGsEDZGirewRQ36/U5WtFL9avmRpcpeKg+tHohqOAAOo3TfLERvhXM89mdoBrKjbfK0/7EBqgcWF3bzwfF1zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKxHAsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lqpt0Ese; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKxHAsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lqpt0Ese"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG44Hw122921
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uwtLBUqQQkmSkDCqcS+GWdss
	NcMifU1gLo5bRnSqrfc=; b=lEKxHAsik6FJ6HUGneLN1ZT2KQgTXLF0hnGafeY2
	yIu5osCeC22v+sv//KKgMtlUneLNP7jnuUl/aYe4vuMASRLx1nNZSAk2TUIp/Q40
	hSGL+MmSpcmBYxEQ8ZcUB3PZf8bxLL+YaICbDhNfFcmNlvEMsLdWAattVbtRdPl1
	Fk5xowyw6oGFtvzpRrIRJKjBSYXRhKIhs5VnMod1xOv7whhErIGMGuKXtfNEx0dQ
	qpJqQ4N5qKb2dcbSDuVLhCbqpHeDnlLlYJCVNlV1PRjJE5i3mGzrR2qM+egCPYPG
	7rEKu7o6OJqvcfRHPoFPEQlngUIK6BVQN0n18FGQWSDm5A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80use-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:03:05 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6921f42fdc1so6546601eaf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888184; x=1777492984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwtLBUqQQkmSkDCqcS+GWdssNcMifU1gLo5bRnSqrfc=;
        b=Lqpt0EserkxK4nP08gpeTue2BRUUj7LrnqMovhJwN1jVX4gTeIw87HVw6X6wQTUtU5
         f2TEma3Xlo9dglm9yQNGiNOqcYzxT97zBBK57nzs0/QU9hIWhCY5eEtVbX8X5jRQ8Kap
         COxyKlO4zNTfUiu86CcS0uCcYQ8kLmOxLYvFNLCYCjJlUPaBjE2Iv8rzcwdsilyepYWx
         MYCGKBf5qCkP9tE1zkz6mjzCfbLNrG2pMhr+dyMRkyBcZjEkBIyJ7oavNBYZCCznjBO9
         GpzfF9yDs2ScwwkYQmBPQnCvez1CnjaMtTMZcs8Va1ROoi1WXJNRFc/1SKCCVf7yStlY
         F9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888184; x=1777492984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwtLBUqQQkmSkDCqcS+GWdssNcMifU1gLo5bRnSqrfc=;
        b=ludS+ztfMspsgoaEBCFT0D96JSUOagTvkTP2Sn687/oYU+/pGsq9Xjwx8hLdjHgJGw
         OZke64q09OwlVKIgNQeV4lftQWcs5dfITfGXNMmlIxhtuOHTRGrtt5fflbLzCjES+VyA
         iyvc89XV1lLlsa0okI64WFyaPTUkb2KUsnarX0PbyOytXnKTYb/s2pLgZnLyO/vVcMh9
         ho8u0g1pRcw6aRYxdnkIPSf/jRfEwaUpNU38LZSi+q4+y3NturQSORyNB/G8wTsrdoGL
         2uDl+VJQAXCbpNlhfvBeG5Pj6ATHyklpMw+6MiKYnReyjFXJQpis4Fl6a1X8Mu9mQhW2
         uSiw==
X-Forwarded-Encrypted: i=1; AFNElJ/PeiGluh3sGGGJI6W3W5Rn0aX5C8AGBS2pPHEn8YH4CpCi4YgLjL2PGG4xOV4zgDWK0XFo+dmYJBe2@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlRx97sFklAovEZCs6Tx1vD8kKXTEG9ZwgAL5DTGvNAMZu5t5
	REwsQThST8FzMhhemVmbAoFg0rQxckhvfCE74SABjAnMWHl9WTNK3RgcNvj65qNV111cxF8f5qh
	2lYpLNglib7WVapFAZcxecShbul43ZpPeXy5M4PtnZ2FhW01lkQBb6Dbu2f5wlESt
X-Gm-Gg: AeBDievhZiGHKMMZdw6UaptLBoS/qh4uiSGxkknjf5Ar2uSCmZbAhDgY3qPACuqoCAn
	W9l2pZtZM8hehS4XCC1+O15rh31NrISXt9MHB7gwy2LXd9bDyOQcCvzKh+Dn7qyD0C20HxomlUi
	lU80NyPHs0lUwtRbqFwl1Al9ASCM04wHtgTDWZprvfUKp3hUZSw/z0VUL+xmD1iVNzF0oHUj9gs
	BhRt4xGBzxGK2TpenK4OxXjMj9hDS10VgcL9XKAggkF2BeN7c7nQoPQ7COHbsEMLLwNLDqA4eIa
	MWh+6P4ezQCbL099eSZzgQWoM9+rQVnPgFaGM7LGbeuZP5XfhX1QsgDqHfoBNoDeq0bt7t9AL/I
	B7/FHqN6La6pruZLQrlYf8bJAn+tuuEN86OUEoMWLwEHjU8mfsFQx1aBL1iS1v0sUu37Ind8hJO
	T6EAtPiRcDNn7qFvV7WC71Wxcj2HPiy74yWz1fUoSxaydvAA==
X-Received: by 2002:a05:6820:81cf:b0:67e:cc7:ccf5 with SMTP id 006d021491bc7-69462e168ccmr12989584eaf.9.1776888184563;
        Wed, 22 Apr 2026 13:03:04 -0700 (PDT)
X-Received: by 2002:a05:6820:81cf:b0:67e:cc7:ccf5 with SMTP id 006d021491bc7-69462e168ccmr12989547eaf.9.1776888184086;
        Wed, 22 Apr 2026 13:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec153sm4690454e87.79.2026.04.22.13.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:03:03 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:03:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Message-ID: <6gsfte5cqf4455la62ruf5gtqkwk3i5wv2xkgvs36oj5hyqpzn@dfcsgoy6vo4z>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX2NEaPSA2TlNA
 Pr9QH+P1y2Hu5Kc12YxwE3HJnu0jaIhcZC2Gch4RCebzRCHpXrYzwKMmllQB7rvtKKfMSjkt60q
 +NC/FjWo5OaJdckIBovb4LxpmgibnP9Fviz+ZngYy39yEGUndCXE/Fz9IGXj/HoC0D9v/6/NINn
 YKtUZEgcCLyiDljpwgSr1xDbXWzmo+vpvpBD3gEbED/pBL/kYYaGNs65b4BIIOYrk8M4C2WnqmL
 mOr7GkyEymvYPzHoStsLX9VQjibbyl27ei50XJqoe6jSD7gK0T0GcH9HszZyh0QeXzPSNthwPu1
 TBLbjZb1P26L67SexZPaact30a+k2uppwC3fSECkjMWiy2gs0ueG+iKC1pIF4zJPdOP++8dXGrJ
 Ve/LsHcsWp97/va81jMAz8u/WEQ3u4xjDdzlrdvfZPG9L69Z1XFkK5Xp7O0yKia67LhNDFSCJ8d
 K0zoSv5GqyF/iLUrfyQ==
X-Proofpoint-GUID: S-pheSxEeY9jJa2HO7j0UyVBQykIQ3A1
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e92979 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DiFzayPZZ94SbrHq8V0A:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: S-pheSxEeY9jJa2HO7j0UyVBQykIQ3A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220194

On Wed, Apr 22, 2026 at 02:05:13AM +0000, Raviteja Laggyshetty wrote:
> Add clocks which need to be enabled for configuring QoS on
> x1e80100 SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
