Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF23D75A6
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786679713; cv=none; b=maPjbUdGRorQbMhPBlKjTU3NbomKi1Ccxd/hVQ7kng4gBuuwjCy0yxmh4c/pk0uLwB55Pq3S6H7crgalU4lnazhKYtM8RLbX/+CWJbwRaz0nS+tFZd+FMlEg7DaWuuM93GRBNSaTVGUpy10ldCVVxXOuuPiLLC7yaPuV+qooiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786679713; c=relaxed/simple;
	bh=o4ccvS06V2MhTeY331ntvlGHTRj2o8ia2jNaCP4OBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omNRY482eJrlp1eJtdnSAk86gmNw7j7R8FYVNKlWOCDlhJZHp+OhaO7w6VAwRel36jJArVWI6tPSTji6772iJWscjRb6isNjvBfWIDFxed9vsMEyyROhcTWoRETcTClnYBAzNxqwHlDUSJGJq3xElPxAPq9v6+eJ4nhPrSWnuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2+DFHMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcvmGz6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2+DFHMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcvmGz6T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E199br4024429
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yPIzUBfzGTz6jZ+0zEOwyurU
	D5i0511kS2C5l61RL/U=; b=m2+DFHMuVs2QMuQEjm/vYW2BNWgJdRRYtN2tsljI
	3cXb7jqm4YPmyIxzhNBuvUJz2gq2rRbn2zkTwOPDT4kJwRNknRu2vlfgNUpNXJQP
	FNXmRVGImhf/tQp+6E4vLzQhKcgTYZ4KQIcaIcVFEqpm4Boa6d0eEPU986+bl98Z
	xljXnmTGBa9RdZz0B3dl16YzPZlITSz9Rr/n4vtV8y1spDKvnymzLzLiub0KKwvi
	a8Ys5yHpEC6JK3GyCQRZXVjnd2L68wtI+Rg6DWFrQQ8sy5T8WO9am8lB09mvn1Ow
	JIs+9qLpJMcnL/6+VzFAIwwOR/AJfiOXlR2CXs2msj0DyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5kv6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso6389005ad.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786679711; x=1787284511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=VcvmGz6Tn3S4Fsh2oZ2rQoecl8UAIOVx9JSeFZaQqNwHPptt6QviwlURn9WZx6lDc7
         7NZUyG7gCerf0Zg5J6aGGiF380lUxZYxlNmngO5P+PDozlcmDe0G/2p2EpGTA1n24c2y
         gQdTTZuZXFPmSnf8CnlmSJvTIU14+Ono4yx9wf/bOVdEBz2SBG5Rt1akhW5kL3+y/8gs
         /mNV9C5W1iTqoVwYQ4cV6h5khwiAhWQ1ajmM4CZvOa2Z1hN3jN0xFjOYBJh+w+AM/1j0
         ZSwrtC6Oem0ao3ZBbu0vQG+4PlkLSLpaGP8zsaJeefgJ/DOrZ93pxxrYrSxMsd5mbBrY
         jfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786679711; x=1787284511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=Xqcy92es1raki4YoLlGOQc2McDW+1Fm67RLCJFA+UytrqBZWT8ajieXwAQPHc+CdCZ
         +oDdq0NAtVZTWi065NU1OQDwfyifba/TSfe2qncGwVIn84H3KJhfzEdwzmmyXYbNW1Ns
         qvEF5QtHhAopmO2FcKRuMJcFyWIX24bL9YiNvlL+IU6Pq7QaRPG2fQ3iG+4opQnDK3pi
         toaSCSyoi3d1DBHYKuUwclDsbxfLYkdoV2yiOxmObvYJmcfRsK4kt0+thuCF31LyYrUy
         Nyb9NC5JJUslmHWcoQRGNyhu1ZiY8EHnl61F5IEUhHjKTNd/8jKe6rNm65OBEZQDmzfC
         Pe4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq+2dkHNtVMQetXJwEukmMys/sAR8GIMTfpHq8CSM5lFOt+/02J/iNIfxgMu/GP5twav5EzyEpFz4C8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+doijRyovCuxAj38ojZz2PDqZxh30KFmOGbSUoQTvdmnrHbrC
	Xij0cUuM/Xl47GZTP35QSt7D6OYFa0HXm+u/3APo8b1RPoeo5SOgrZssVNEDaqFGcYH00s3I0nT
	jJMZmMgTxL0Q9RlOL8mH1Pd8E3a0H2MqjqZghWfx8FHmoJeGG72T4qLYa8xU0hobV
X-Gm-Gg: AR+sD13Bb0/ew4RX69UiCKk75CiyQHxxvppoMhVovP8PcV6Ax/SepbTR2R786OWBAnV
	Ax92YcWTKUz86sSdZ3gWQHqbnRZe0K9CzE1GpVg45lSJs2PkrArlQeRwMVrc0hjY0AO0iMC/kKd
	zz5cExsZBSUR6+0PRLOwPZ6Ea3U/PgaMZD/JM8CCDSQRUdaT9b/am65evyytzAVTLgJz9c8AoEH
	ZzPnDYNEpSq4UcYqSphdwjgVzjcLBreTLdL0seP7MekknPvmPgHaX9PeHdhEupfQEtwfqMMJz3k
	ZLHb+DqsqMKLJDugVHdxZueEC/c6WdY1xT47uG5VTuLJsQpeFlQHRusWQvT4/oL2skdg3Vg4V/W
	IP6aXuRERwQjQjOtowjYCwkhXh4wiwc0mDB2dCDTm3e2bgzE=
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027755ad.11.1786679710587;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027225ad.11.1786679710060;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc39de5sm13076707eec.22.2026.08.13.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:55:09 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:55:07 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <an6Rm1Mkpo0cHfgc@hu-qianyu-lv.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
 <20260812-lively-determined-loon-31f65e@quoll>
 <an1qXeZoTdzrXqVx@hu-qianyu-lv.qualcomm.com>
 <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
X-Proofpoint-ORIG-GUID: 3b1PyVqpYlOutC8eNq16cXAiOr80Lt3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfX26xvEdhs3if2
 u2e+iXbXLnV+G3z/KZrk6ubOfsbn/ipmIMXBE04Ks3JFNYGkAVguGaqZ5dIQ9vrymbzXpBolPo+
 r/N1HpCnJYalpugFOThUajyVRUL8+m0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfX/b5++r1J3oOy
 9HPShDOZuawSLBQ2OL24g6NR59nFtMVNua21sR9/FEYz6UYkgaxqzoNFnP/ErL8beTQpsrVeAc9
 8Zs8EIgkxLfKaJj2/ky/9UD8VCGXDxRccHfobPDSDzYg6BPojkHomfiKNB6cAOxU3//fSwoAOvE
 RpfZS9rqla9BprzrutOY+yYUAy/vy2XQVMfXyVFEp75cwa8LeC9v02nJoNXlJN/dzRfh3d/7B6T
 O8SgJ+vmwXVf2z1v9r8Bcf5VBqYU+zUB0Rfb9xirgPkECatjro7DE+r1H8NAE5QsfV5ClJ7RuLE
 CWc9Bp9fiqWB+CIYFzU3FyulFQo3/GAOt41wiG56YLywb6swOjKL9a8uJnHj4fN91nZmROpKeFm
 1CqaIPZWlfr5XmALUHT62e8RRwIBgCQ3HHyEZi60PRqDeEA89BG/m/FUM321fBcy88cCdvFBqkk
 +etfiPWttpacKPlsp2Q==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7e919f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ze9qwfLbtIFlt0bMIQkA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3b1PyVqpYlOutC8eNq16cXAiOr80Lt3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140028

On Thu, Aug 13, 2026 at 09:38:36AM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2026 08:55, Qiang Yu wrote:
> >>> +required:
> >>> +  - compatible
> >>> +  - clocks
> >>> +  - '#clock-cells'
> >>> +  - '#reset-cells'
> >>
> >> This is unexplained ABI change. When you are asked, you need to address
> >> feedback from LLM, not blindly implement it without checking its
> >> validity.
> >>
> > After adding these two properties to the required list, I ran a dtb
> > check and saw no related errors or warnings. But I overlooked one
> > thing: my dtb check was against the current tree only. This change
> > could make dtb checks fail for historical TCSR DT nodes that did not
> > have these two properties. So to be safe, I don't think they should be
> > added to the required list.
> 
> Did you change the driver code to fail when DTS is not having these?

No, the driver logic is unchanged.

For #clock-cells: I did not add any failure path, but a missing
#clock-cells already makes consumers fail to get their clocks --
of_parse_phandle_with_args() returns -EINVAL when the provider lacks
the cells property, so of_clk_get() fails. This is enforced by the OF
core, not by this driver.

For #reset-cells: the TCSR does not provide any reset and no consumer
gets a reset from it, so there is nothing that would fail.

- Qiang Yu
