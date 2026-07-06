Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BA3DF019
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360802; cv=none; b=H6/KaBj53+eED4QPzwHqwI7j9Fm4ao2ovK9ZFIbZy1Mu8pR74k2nsp8ZWUKM7s1Yho48nZpBe0KX9bQcoFiGeZsHn/zkNw1FOmxMZY306jI/gzRZm/pBqEvYyTOjDAhYIc3ROmuZC4eGMEC85/ybj55bEu44dOWcUb0MYf9ssiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360802; c=relaxed/simple;
	bh=u0T8rFUON4gCPLJJi8Pp03ITVB5LhSihDlwqC1tcdxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e9UHt+sQvD68EwAGunDmIMstafqFB/cZZi0jj+IhQh12vWfjF8gDU33tynAUdRpGCEa6brOOKLRE9lsHgr2ltQOnei8khahTUWTgFJeUHegOmKAAhRDGKg3SRacmA5pvuasMu4Y1l38+03A2YdBuGS5U/+DcPTanxVpFzHOrCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbE4BUF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2m6ipbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbE4BUF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2m6ipbC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6Mj982443
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=; b=HbE4BUF+JP5HvsOH
	TUKHWFnaoawF8heIFUT/IIq4FM8XW/D04DwpDZJwj5bjSQjbXXFDwJ7LavT8ZJ64
	U8Rzn34m07DGevVyriMvuKnFGtjtJ8ytnM+aX/FQctoYhUJObkFbAyrrc42FCQIV
	eb9A3k7/l8GcEKgeWCPlIGV1KupaV9qg7Kc0+qOxXhev9/YswcP6qR+XRMJK3fCf
	EGFERZuJMh0d3lC2LgmXhqpRc1EYiDOY+3KJ9hwrVmfapmJRtTa3Xk/Kbl1Mrs10
	DTx3BqahmdF0LiUQChVgR+di283RP99+su/TkuUjioRnmOUNMLibEvV/fQZQB0sD
	HZF4pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpja56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:59:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9a2b95b5so525030385a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360799; x=1783965599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=;
        b=G2m6ipbCXbAa+9vz2IYLZ0DznhYaYcSzzgPAjQ0wecaGnMZhFC78YqHXvIQgdQhj8G
         Z2dP8jT2bfRpvD8520lURmKWNptBtjXNu0RwP9wyQb8gcHw5I5w7wDUKm+/amlFl9/tV
         3ThuoiH/SIEuHdJoBQ5BZLlQmTj5tMTHRHceYbIUuJ2ygPnE4wPO730+Cj+PD0WhLwge
         LSFPvQRaymJnb5vyOdawYo+DwyzFehkUsugU5LqfXvCPGP5Tbghelm5evjDgTzenGpEZ
         5aiGdbkoycnDJE6/9Q8e0RXiJR/VF/t7vj50Hs90rtMjTMeufRGkP122TwVn3etvrHW7
         UqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360799; x=1783965599;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=;
        b=R+ESsJ6ZSShZuLoo5jKJ1om31oXXGRPZ/3Kz2iqIjkUrRFyamB9zdrTQuPbBuwxvTK
         V+EBDS4nKT36uVGFTpRvRMF9vt1WnaNxrkp7VGBafN+d+aUeQPpGe77sDc5UvICizKJ3
         hTk6sTQvAXSjuG0DqePuQVWAG5XxmpqJ8pbZFlrjTJTKIvmKBHArPjOamPL01KkVsXE0
         h9L+18d+ZcBdp7WYav2Rg9UZQ6VTlOqsqMXBK7yQmOCjpJB/kOaTGa1CWTQb3kBoS9s5
         XdBPNC4+ECGf8cW+aY/UbR4MJhVdsOhOiDF8XNFXFKCctTOg0pqp3DA8hfidY3fCO4TU
         cH/w==
X-Forwarded-Encrypted: i=1; AHgh+RqPiBilfkMZfGxXQZtwZNtHZdpbLt78VT+mrsx5CWx74WcFcN98KJ9c3Vm1pPg9ypdJb8QDIHFH+Wwi@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZicOkxyppHGwTyJHQKmZnvoxO/BrOADIIPFbsslXuj1Z1UQU
	GzdJATsbp0q+0jv+kfvjdS4lAtP4BunONG0Aa7kZKw2K7rYzB9B9U082xcP9DynuDlAjSQrrZUn
	UJtIW2/qeBVHgsgeJ+oyXZ1l1ZhFq5yYDsLsSYFkdAwWaz6noy4+QxyQ32zWZQkHg
X-Gm-Gg: AfdE7clYdL86wLEr42ZI2OMQhnzg1ckeOwmXaZPM+6GWsEg3NZ3zIKg3pRbExRa42bq
	a37yJehgCeKSjd7yZD0CDRGD6tpoVURTs+D3J7GNNbgDub99Nx6ZJ54865s/pDSP/8qK++iDFvf
	R2t3fQiuFYFsDWLrO3tm+EP5q4z1/Pkm7OcQXt2LZBWL3kUdjIhKPQtMxbvmwrH7zxLeuA7Cpzk
	+O6XNk9367Ld+7S0G0O244BGyj4rf5Z+GqhYO+fng+WA1Uczf6TVoggT/j/aK4ADtZ9AznXmAKs
	NrSLIldwKJd0rsQmwTthjhaXHDZ+3byxT7BrTq0eQMvFNgXL/aTZ5/xeLirK9+WieGELP8dGpCG
	GTXopExtT/XcPAOhrRCW367RrKUOTnCRCop1leW/F
X-Received: by 2002:a05:620a:4041:b0:915:cb40:f774 with SMTP id af79cd13be357-92ebb57f369mr219619585a.31.1783360799427;
        Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:915:cb40:f774 with SMTP id af79cd13be357-92ebb57f369mr219616885a.31.1783360799052;
        Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00d2sm842545e9.6.2026.07.06.10.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:59:58 -0700 (PDT)
Message-ID: <148bc671-6d3d-41a1-bbff-538deb1ee022@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:59:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ARM: dts: marvell: kirkwood: Correct indentation
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bed1f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mqQ9Yrk4-jIDK0wGc0AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jGE32zc7hnEsPbzFuNJBZVRKL9bySmq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX5SIrguwwAnfM
 p/M0DTaTbj/SvYlpFCRFkxRlSjmQ7vkaMEUg6itg1XFCOWd34xurYulwtIVqfyW4no8ybYgcr45
 g/cH0hk4CGPVkq7iT17PTqhC7Xs67IDsG/S6N1eUnDdEKTEoKCYC2VG+bPuFNdUMbQPT9hJpRKN
 OCgolBb8IPJh6R/4sRf2uX0o96uPBMcKOK5fkIUXD0WmCI2CgckNdmCPgaErov9kR3DNswXyC7H
 W35IQT8O4djkuSo6b0fUI5+Prh25LFCMqmTrQ+oJvE+9QsIQuNTp+qzQQvt7AH6v0KcW4hftNjW
 juJR+06dXEmrvDiVVRh4tdBV5qTWlXWWKjAu3CCW4YzbQeMb/h40oUBnE9VdP8msxfzp0wOfHIE
 P2w/kUKdb3G4F79okfEVKU4EIu0f2i5oA+JEmSdH2btP4GDZRThetotyp+hqjdXRKu3mKAyIoFW
 4MlsW00Ox/L6+kjOfBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfXzJnog3iyyNeE
 6slOFYR1/Sl8rkYrAArCj1/gHgBosfKX0CfFqk414mLigkCNjP1lI7l2Wg2UPAZTFxj6x7s3rVS
 H4RX3upAap9eVvStTXM12eZIySYfIK4=
X-Proofpoint-GUID: jGE32zc7hnEsPbzFuNJBZVRKL9bySmq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060181

On 06/07/2026 12:19, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---

There will be v2 of this.

Best regards,
Krzysztof
