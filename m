Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163820;
	b=wAivoWhBcmS4xkdUQAdXQ7LU9ldpCBwPEB9bnoIibbAcHuILiRKb/oMWjzvB88eSVSPS
	 KaJQy2W+Q0zksLFKdmIl7sRofWhTATyZ2dQtDRwEXyBYuGTQ5RHinrCxsjJwOoSzbIuq9
	 VMDAtlpW0wkOp3iyPQFDw9uPY90GS+UpBpBgkjvKNHmxkxdHqv/fzXXEOuVsSEDeFv509
	 TXKoicrJ1t948qNFRqPSnLn5kipO56XgKhKSCpjOdeVgf7mGiCBwVx+diRkWV0FSyKQLO
	 CbJyxU21vnU/yKun9gTuHSR42gc6n9L6YXwF5UIHfORz6rynJdpfqqc0yzeKt4Jf94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
	b=YwUpKmu51QoHFNmr3TJmThOLqoX41xkER6fcueeYxjA7lJlpev0XwzZRgo0Lw1ydaEW8
	 R0w4gDRyrcrygrZ+zI9DwDDU1jtMxREt83VwYz1FZ0o1yT+H45Gb0scmToeFn0zAoy8hX
	 AVd4DjCja+/1wRxwTuCkZvO6Vp82rW9nItpAiKQAOej10YEKAkxfMjQkj3F2gV6RvHGTe
	 COY21zHAfx/G0fLamK8bMk59QwDJ/yWjEKhSqLic8B1FpuZksUu2ykIrv6MJtwxyrN8mj
	 NCnPtSR50mL0a39c3nSdukc5s32wy11MYj+2oTMHX11H22yYyF4UFK4cQJBJRTdzvgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uf1VTMux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KKx0/uLw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D35606A33F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D35606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uf1VTMux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKx0/uLw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2fu1112285
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/LvAr3BbXaRFsNH7WIibnZui
	PeBJRtU12clkeRljYRc=; b=Uf1VTMuxbK70bP3kiUk9/DfuxZ37IF0jt/l0lFQS
	QbsrruOofSPLVvwf9tahQbJxfXKVlxe4QtFonl+W+ssKVekQYO5bAl1b7wGz3jBO
	axsiMWgEGFHmRqvHiDal9bDbWzTSNXroqDbNImLiabiJ0aOX13SHE2lJ5+bq7zLP
	Na5y+zKWDLYEraejq5eqCoeKxqbDXIY7Cz4Ne+957a1stcjsz6pcwNDyEdltwI2G
	hIbmxwNJU4MYFuDj/lCALuRefnm8FlTSqK/v5AAd48TwDp6Gzdb2i7QK/h7DYQtO
	ViW4zXjlxskF25p/gM+SKrCoHS8YXCAQaR8fGbcd+n1Tlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtrutw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so148660185a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163818; x=1795768618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
        b=KKx0/uLwEExofgAmGjFzKmYOBpVN/8jDfupIZ2biM9GgsQ+iDjCiW8+XihojIEo07f
         F5V0mxvE6ePXE/OWz9HuMsFO5LSE+ycjo3QjNL6Z1C5pScxgEfhA0taWafoiyQ+NwkOV
         OD5HkCzjJL7Zadi6E7MjCj1bLd0oJCy6/1GRam6qcZHZSaG+YnWTrOC7oJXZV4ykolZ4
         JIsZuMLTocByV90VcPDJZVSeEV7zg0mRKWTTrA8qHevcyQNQehr1rTiikl1HtflUUa9D
         szBEgL+NJ7IignTGAc3yazfjFfFCEWAiQoSty2GhwUnnbvW2IubP1aI1pGjFyTzitFMl
         n2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163818; x=1795768618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
        b=oqzAM27TMEoWQoK34JoP2CYOR1Bb7Rr9nCS0oeADxGPrwJ4YmxMEFlpr3WCrAcVlV6
         ajZW8xoHzjWXRYc2X8NI05pqbmoaN14jvbRgEt5OtgIg9Q5H3ipz7inMZnhPiTcYTsEi
         DnewYYSmvHN+cLzKahaXKkGT8ORA+HVPLGwT+pJ/gwHCIYE4lFjwmSg7seoXANh3Robs
         TOdAhRCOQSOp2yYuNDXhV151H6yUWXHCGvCcVy+T+vcHNg1cxNbLAWx5YHKLkFCLRiqb
         p9XdmH/mbXbjahwHELcjrbAPsXpZ4iyOUUz6dfOUo3nc6XXw0jV0hRr4m73p61y57RXp
         34Vg==
X-Forwarded-Encrypted: i=1; AL+hErHGHM6RNAXKKBN24mGRlfJxPfRkJv5VUr3ccUav2pnXWT4Hw/6mhDlLliDd6JwLfLwLF7c8XoKcX/iq@vger.kernel.org
X-Gm-Message-State: APuU4Z8mkuj6He9/A1ZEj1ZzFpV2ldqfqz5TbBEQMJtANbynRJMWK0Ie
	fi85JG0D1coEJYzk9smsa07BzVRYXsjm+KKkxcYwKROEM62DGVwCCQVx96hyzDBHNk+yuKaz3vq
	3hB/3EKSaARbPqM5EZYjZQV1NZDSDBg5+rYuA3BZ8wZeAhmrLTVtrLRJgJ75cRSKeRd3RMpjw
X-Gm-Gg: AYBFou3+I1ushAz2dMiOLbmDfPjQs+OQzkfLQgZxmRzoN7D48uIEZYr7KAQbqfU6Qvh
	/CuYhAAzwhQwW3qEriOknTGq56ha+wfrXQhVXVKtihucPLTfYC0tqEQAsF2apxsdB9/POuFKRRj
	r7hVK+wxRqYP4dEQE6U+XfijnCFcZNd/FCUhchddTC1KAPtPhCYkfKLL/g1UPxa6/sh7IKlOb9m
	s4+cF5RxpvxDwuyU05FdCnNHmhGRiUBzAd7zsKcG7lSTs7kmuJzx+feblFWRsOAr5UUANcm3feZ
	oFoVubAN29J1xL0LRYA5Xm30wieMZctpuvTP+BGGPTPec923ox+OeA04BaFVYvIJ1hfy5JO/Mqw
	SuV1WgD8XKuoL7sNKskgH81iBkX/TFaFZJEl5pMf+O3aju0/PthOXGAReMhZR/GxQ
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr411425385a.35.1795163817849;
        Fri, 20 Nov 2026 00:36:57 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr411421985a.35.1795163817235;
        Fri, 20 Nov 2026 00:36:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm111410415e9.10.2026.11.20.00.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:56 -0800 (PST)
Date: Fri, 20 Nov 2026 10:36:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
Message-ID: <gdsrcec2y7vglhrwe3nf6oacvlxgkudu2fm55qnselrsgetihg@3a65cpxavzsl>
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
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
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0UU6HEKdnyUlL15k2zD5NJdUm3ihlphy
X-Proofpoint-GUID: 0UU6HEKdnyUlL15k2zD5NJdUm3ihlphy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX1R8bHQdxfXcT
 Zb5l3dI/EJ474YAX+LdsEfGVRNKoNbKTy0Q+IFqICBvN0k3Tnpo44rjpbAIn6l2JnPLkxXU0dcP
 ahFort/y+QQsvUoRgX3Osj4VzZMCgITT5ZlYmSSaK2xWrZRkRkJjjgswyeWgcTlnBveXpsacDSJ
 IfgRs9ZPTN+LKAKVu18RfRyKvnZHhBQk+BzUL/B4Vx0M5SLARUqEmr0uLFtJtWQNHFg4JMnZzRv
 pPylAKn/bqS+RygchoSVTlZq2JdaZzfQlOpL+SrB2v0qqSdnCVMycyVF1r72+S9XN6YI5DP5tMb
 DRZbLl+2GdWu4paPUrJS5mc0HrKM3G6SRshOEy+nFysZGniLePGFO5F2Ht/tNWIsiPOLNg9VRjz
 jnBC94fQa5cJgk/jZqmBaxbR9fLtswUgClOeaPDgFy1R67VaL03A2eSHXyS/HMZdUmB24FHMEAV
 R+GyMTdy5Gt7BGWdQyg==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b0006aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xToav2RPaKhFB7xxpWAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX18WJfgRtHn/o
 5bkYVz+vNb723Tb2G7A2ZtfweWgXyQWMiKeIelWiKoDiY1nT8RifwQYWeCe4hWfdJ0E7Zt3LV7S
 Q2jaANVnIJMRjFHlm3gWZEN9074Vsqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 17:08:54, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
