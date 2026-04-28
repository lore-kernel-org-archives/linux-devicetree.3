Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8D3C1979
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381441; cv=none; b=a03R733+XoskcvXLThnudmEcHWx4xaHtVxfnz3mvFekDUY4rNjhvvxDfJ7Qay8c8Hzxis7xdoUo/FA95Gd5m2SvkuRiKVAkmlFYKrcb3GcXo3u/jTXJIFPXfBv1MQ3iCykp7MYEmqCJAj8r/HnKYKApquNAxeEQOTB7srQT4Hn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381441; c=relaxed/simple;
	bh=zMRyXcEm7U3cf1SylS8c8cB7KknppFvUvjwhR5g/Q58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN6RswjGxtpn8UgHm6bniGChEiAAo71qzKg3VaVpUV873rdOdRRwqXU4qRs34kZ0fY/mkyFYX2NdDpUauGrdeXhmxAWKzTRW5uei2ocXC9h9iDBIvlFV/GUyeGXQ/IIdn1p6f3eTV/UOMKwseY0gia04VZP+J9Wj9e5Bn6JeWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYaawt/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M27yxZV8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYaawt/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M27yxZV8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2sj7984964
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=; b=BYaawt/RD60vaCeB
	D4mo3F6HauIskPzn5KMZ5/f+uRXNZFKv7bNjlkhJjHRY9nLVZWHHicYxNBJpcXcN
	C6LDUojPAMnECGglKZz4dhBxCzSC7+8us+wps9pVn2mo9BHuj9FBQCdsvnAK/xJu
	o5YTw5KyX3/30OrX1Ijds7M0MHbjDCSRAmWt1c/hniDczfuDXtE6ZfKQzmzBhQax
	No5I2k1c1pl6wWBJN0voVjSHHKq2RZXrYHHw9jKkmvzj4Qr+iutveCqHeaA0AX2v
	lf1IlPs0EubBCY9dMNQXVwLbq7j10ensLCq+ITCttbUjeu+ArABBxWYFfqttAf5Y
	uAaU5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2rnrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c66fdd4aeso17034761c88.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381438; x=1777986238; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=;
        b=M27yxZV82taA05w8eVcSP6VVjVM9uO6KL9pvXrzkDRdWlvd+UkNeSKfr29NOJZvA4k
         ymWrmTiU04nGA2Ez+tNWGhcDofSSAL53NUTlHCmnAux2KD6vO4E5eVP453pYC2pTLk+7
         kRpQZgBw1+D82Ld9RnqJ0UQuKPGtgzAVT5Bx6MOyYCUr+JCPj9T6TnKm3FO8IcFOp6a4
         OABAo4lJmPDlbNTLhqEE0YhsoZDrvRAZjtc19RVaole5UHAtnM30D6Xhm3HCArjho1My
         JP5RcwrpSqxSql/6pB5Eo0xw8ea66t7bWZhbA/o4RCXQs+26gtjNVkomL1OP+nSMSlxs
         C0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381438; x=1777986238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=;
        b=pREoS99Bo1rtOG66e72Hu82ES/tVo5LsExTs4lxt9Jgqd/XOh6k4GEc1kY9QVQL8dD
         2KFkmYvAwGRlV6IkyRU5bBzZxawhGkn4YbOXM7Nae2nWyurS6YDv+jufb5oZWZFyh53p
         hBBJm5PS/SUTQUT3xRVhpIkfH1HnjeTNcd9GLeL9U0hQDAo099WER6gv/0srxxaDBaii
         2891MobAUC1FeDYF+9CV37yiteVOH8FAtn8cqzRPCg2nujtWz9Z1tmNZdSXivjyg9DY5
         PkmhVL7f115QWmPc8bZQV1wbTYW3vLiaMIKTQlp4cRF+EISYlG2hh6qzMSZAa8s3Bv4s
         uM/w==
X-Forwarded-Encrypted: i=1; AFNElJ9ppG4HblpflI1HH+zG5MrfNUEOAbZj7cU9yl9Zt3sHUioxcjRngny53KPNfwpsE42uwTM7slvdL3QK@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPmUDV0ljKkWSP7BICbYbMv7hdwFyoyQ2pyxZKDZwUPPoDRzb
	dUWgRlyImVOjj+RQzNCU7RkghNTnaw8OenpG/nkZVM56PIJRZ/PWz3AAe+5F0P+gAYzSiIo746U
	xuGk2X+eBLxGzUV1uD/C75MT6jpwQD2MW+3zSYJOc9/mSM+DECMeO+KsGImJgw+T3
X-Gm-Gg: AeBDiesVD+bx4C17T/wbYBeJdIl4MLOtT0DTG6OlvJf7iL0gn2aGf7tgRc0X+6gpT0k
	2BzOg4ptiFrczjmirRsBcqCRc/Kt4OFGUmwGLa0do7Vd8YSrXkiiuRcFxFGzXOPQgLwrPaEBb3U
	4R7mnWw/sIwL0SRpMkFFNa6TDn8WZ9I5QROqAMJFBSu2YmJP6yOdktPkNcwbI0fN7a05wuBhZkm
	qBELag4yibLm1tjJXcof6HllDGKFOVZP56jA4BaILJcY5cGoH0B/X1vp4Big8tCKr8uck6ETMqw
	iu+3rEOvaaJ+csDcheHHbEG4jA4roq5eQhUYifWG2ULB8hSokBQzx0B8OiLRjthXXY8Zb/qT2NI
	0NVLzXPMBVGN307k4zqGSrej8u8A+oSj90ZwWIjIqbJK+CGMw9piwJzWenwwiqzYrF+BTpuSlbG
	0=
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-12dde3ff940mr676906c88.35.1777381438051;
        Tue, 28 Apr 2026 06:03:58 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-12dde3ff940mr676791c88.35.1777381436973;
        Tue, 28 Apr 2026 06:03:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm2094729c88.2.2026.04.28.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:03:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:03:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Message-ID: <afCwNi8L4XhhGRbL@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
 <20260428-ultramarine-bison-of-camouflage-99f8ca@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428-ultramarine-bison-of-camouflage-99f8ca@quoll>
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0b03f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=AQRRnR0zCre0b2-3JCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: mkC0XL3tsLbG8nqnZcUybx-rIQt3DFZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMSBTYWx0ZWRfXz8Nd2qaEY6J4
 ZDzRavjjT3RVXSnYbhY1y7trMZryhkPCwBCcBIWhB3hbngULWR8E3YVFsDaC9SwrBXhtiQp1Mcg
 GZQXK1L86osZgx+lsz6O3Vji65epWue/wYujXplgASYnIkBtrOYqhFGWXLEwgJzTNQ0orfokwYA
 3lQUPFJB9bKxunHR/uolagNJiiz0fU0fzvMhn2JmNJ7zsqUyz2yKkjT7ObkrC13o92/sKz5vuv2
 DGngqhjKroAi7FMVdJy3B1Ykg223kuoF8PeyEKdymDBEJHiDRooXG5jCiPNCHZB5PHqm5Ldr2JS
 lPBqudpCauRcsfmXA5np7f5ROBeLo/OcKHRcMmqzFLd7/zobDj3llor2OJBvrJmoHRwZgH7j2Q8
 en3542FfC7mW2kjdB8TCh0uPfGCH0r9kDySgILKGtDA/Msm6I9NYSWsHPEN39rPA3b0+F+kjqjx
 CZ3kcXBuUpG74eaWXJQ==
X-Proofpoint-GUID: mkC0XL3tsLbG8nqnZcUybx-rIQt3DFZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280121

On Tue, Apr 28, 2026 at 09:23:16AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 10:34:54AM +0800, Shawn Guo wrote:
> > Add compatible for SA8797P Ride which is an automotive‑grade development
> > board from Qualcomm.
> 
> This is the first usage of sa8797p compatible, I think, so it should
> be explained what that is and why using it. I guess the Ride board
> cannot have anything else mounted than the automotive SA8797P?

Right, all Nord Ride boards I have seen are based on SA8797P, and I have
never heard any plan of building a Ride board with Nord IOT variant.

Shawn
