Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484649;
	b=mbuEdxhT0pzI8ID5ZhjnSC88KnqVjELiPEqOfu12f79VHolRg30edTBOFjQsFBo88+tr
	 zSrZ1hTViYDnznWlZRN8Db5sUgHorVABy1lVbPmJ5PR9nVRP2Lvn0X5HMdz3q09nKCkZB
	 CkBTRJNvvrJ+yzPcWGkQJXq2IF9zhXNEaN0pCdU3lxr5vp610kgoVG1K+dS43AVqVdX4x
	 zok6PcfviSrmlqFuVkkhTTfhCcvxKYWgdsEc0e6JQZsLnw2boFCKNAbdtwzL+ukfJV3Je
	 LdW6dYcpDgBAfqDOEClNbRx1Veen7usy5WvADkPKWwv3uiyOL7d8uPk854eAD5tfUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
	b=jke/i3XuuQFWBsCKC0taC/1LrCQSbePzDm0bNtvZFVHID7S9Tm26XSo4iKtVczmmgCXI
	 ferCUvSvqevPepVf8Ia26Cw43RFsQlX4A630WjDyRW8iuq2B5UteuApZbg5w6o/71pVeS
	 tvlnDxfEj3ngEdcS9I4C12yHv8Fw2rMskGuvg8e+9c9P/RKfI2a17/2cg18pNsJruL6BF
	 d9nGDAU7EvStkr9/MQJBcjXb9V6oExHxqyk5zmXi4nWeaDIVy/JBb5kgTkmFkExbYQoaj
	 lpQzmlKmB5/P1+FOee6dU9huNJ1Ny8DUZVUEPHXLaSHo7ZvTqaqSLJeUSXtTpFUYxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Gkc/bAi2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBz2IBjm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14488606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14488606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gkc/bAi2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBz2IBjm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC6ZrEd3670877
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=; b=Gkc/bAi2rhAAuIjI
	q0KHMXMnAZViXImWfEbIOd2boB17rtebnyaxvXCDv/i3i20Knxqe9SwP8jGCIIC/
	L0AQm5TgyXWQwIZvH6r34FRLim3OfYfspv3fv4DHq1hPtXRB/6q8IUbEZF3gbxaO
	KXVXlutsiZRuGzbJWnoVVy1IpqmG4kqd+QkaQeNYt50A+lsvYp5ytRqcxBc3cGCs
	BXjK01zwgnjVKf25t+1pp9eqkY0oEzFVoD8Z3x7q15ekXVvbzs8jctIzK7+Hn2HY
	negOhAJMISYFp3nGmSIUTEzUvi2Mj1RBOgOsu2ac7bmvLsX2IHHcQ2x10DXBdRKm
	yyGqxg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuhdgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:57:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ecff433dso2706275137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484647; x=1795089447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
        b=XBz2IBjmlWLDqLM9zLU6z7j+X0rfVaR+vw12aFjdvSPpo625aIGXwb9VtFFKH5PzrB
         6Q2+MIQCHjBdligZL0bbomi4mjwSWYJekLOY8vgvketMLZjKy0mwAXP3X1DrlgtRnMQS
         sjUOL5g2xXf8xygtCQ6DRUOnrQ1VmbJ78J+OShiabiIuRLB0X3AEZBtE7/XpMky7jauZ
         M1VqYjYDs8FdIxDbPqzhmidWHpRVZDZ+ol0HIUf7h/cZze6uqxyRhesegft9fc8/03tj
         DQERSNOYS8DIrsJ2ghMTaX1wVlfk6gHt1Xl4CqN8KIdbSIZVWs7wjZQvBjJBMbMu0QsA
         2ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484647; x=1795089447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
        b=B7yIEO0U2sWDYX6MHvwhIi/LqygwleNQJcmK0aHHPi9JEtXuT9tkqlnB3pSlw+2YRn
         UzKQx1Kv0Lg5Vnl8rcbYs1pbqi81JNrS/Y6EqfsClEq/DvBQtAomJeZ5xlt44mXYo00a
         brlnM5gtwsRaFP1n+q7kSpn6qPzyuyI4N0MLAm4CTLJ3l2patCepSpl6sHvAgXBch4Qa
         bPXJw/k3PVXWDRV+up6ZNYJgWk8X7+WcgH1WzZQPC9pxWxtST8NvVgpSbAjNUDFQUPR8
         IQ7yrKYos1AZJ/Hvh2yKuyFOgtqtbfT3NIIze90veKR96IVxjH7+uOrYw7yoWbrJNeHe
         RHuw==
X-Forwarded-Encrypted: i=1; AL+hErH9iY9zVt26BXOCUKtlRsZ1te72mR9DadlMrs8qPajLCHMNLdZLrGuFuGj8qKGijL4F8MO6EgwBH14t@vger.kernel.org
X-Gm-Message-State: APuU4Z/t61obv1H1hbtHn9wjYJsKUWt1n3XrEH41DdFygZLYMSrVVyNd
	ljGNYEVIWeeGwF5NlJA8d7nD5dDFQ08jSjnygBz8Mzm0Jzo+UC5zvMWxwUL8hpuahX8A/vaqtmn
	2lLICBDYdiRQCAj2TvWjH0lZcxv9cGRYMrOnIlTggekHJVpdL0gPwJexu5Gtq9SdRQ2a3sH6A
X-Gm-Gg: AYBFou3cIsnI4MQsBCrDOWITOUd257b/+QhL1/RkMtcPbozmykT7ZjtNcBdwIzUrtGh
	lJ0jpl0t4TdhW7csQ0B131+iLEUyeVkjf8jCC32KNfVEQY766HaM9jVAYQozrgGNaJDsutmnosq
	5ChfSlP4fH4M6/CgVWgDIkxPT6P0U3kH4J4UQgI1fxogRfS8j9U5apku0fWXIMZ5QjuBmGYK0U2
	KMV2pvn8fBIPb0eMcko+/oMeCh0lYsL56E4kIft7w/v5o3VPUne44R1vvHZQV1qYFVkqG6lcMPT
	T0AFGtK3Vh8f0MiTviQTZ74sQ6qG62DykqMUm5v7dIirDPbFyoqAqBBIw9BCEgDXLovIkxW5Qfw
	alnL/iv+v7eBc2PrTrWUZaS5cKTAkxOvH4RAa5JJgGfWJNgsf6ECDpVRo+HeyGu/tnr18fD3ewc
	g=
X-Received: by 2002:a05:6102:3585:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d4eff7be7dmr2317057137.3.1794484647311;
        Thu, 12 Nov 2026 03:57:27 -0800 (PST)
X-Received: by 2002:a05:6102:3585:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d4eff7be7dmr2317050137.3.1794484646780;
        Thu, 12 Nov 2026 03:57:26 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm58369565e9.10.2026.11.12.03.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:57:25 -0800 (PST)
Message-ID: <13b50054-68c2-4c04-b895-b4846e0eb285@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:57:23 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing
 enable-gpio in PCI
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-201975@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-201975@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yLSe2I8ndZ5nzSKAY3ugGpEQ8t9uWJnu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXyikNyJ/qpfbZ
 N2ZRaV41Od9iPqwkpAG1zNmP2UWz9WeSpJ3ueDZPA3CdKxnrNaE7zsKJeS4NaSVQWSOFDHFX7/x
 I6ULgHPWHtapW0WrCDMsH+vZVN88hrE=
X-Proofpoint-ORIG-GUID: yLSe2I8ndZ5nzSKAY3ugGpEQ8t9uWJnu
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5a9a8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EtXGP54Q8iIVWt6SxLwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX6pu4Ifx3VhTy
 bTC33moAXWbFGNRPAuKl0wuZPRBpJ4wI0j/ovhoUELCUjo2Zpl2Aiq61Wf07Qq6mRxtGGmRyjKl
 gz7uFmP90OHgzX9bdzLK8IjFmYbGMzmgr6HzBYbPcddqkVgpxbvot5k52w0zr2HP+TBwqfGWnVv
 eI1JXfTUs/aZdp7KwxC5ZGCLNrkaV8rZterhPYIgjSFqQDbBLL2w7BZgxEjwSpg7X9rUlvn7y1A
 +ne4llvCje4XmlAKsH43zZSOn4GSmPg4P9fWgFqVsFEiBNSsIGTgm1UmI6WXYULAj5VsGwXCisV
 8jDdWPKYLEWmKAiDyn+ZumN4/LgAay7Jbc60NILbojTwgVD5dO4i1objsypJP8drZbiT91WlHv4
 teM41Z0OvgJ9RMXq9+EWRM4HtjNftSqSHjQGoxe5Q/GFDd/uwShhzDSep33RtmbFoxYCcujh9Dy
 C+lMQMxDOGtLsSV01RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120047

On 06/11/2026 18:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8150: pcie1 enable-gpio dropped instead
>   of wake-gpios
> - [Low] arm64: dts: qcom: sm8150: missing Fixes trailer for commit
>   a1c86c680533

Ack


Best regards,
Krzysztof
