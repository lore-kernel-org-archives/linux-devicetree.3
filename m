Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100287;
	b=MKA7+p0HqJ8wI3NqPxO9YSEn6UAfR7MfV350o6oe4EHyNd6BWmJojo85NJopKmv7RxOe
	 Nqle3YNvpA8Gvu2VaxikXMTeRT4VgGbsemBDRFuXbvliHe/9lA+N79SCMfyNpUVCbJTZ9
	 jjSGXiAIiggzZpcyojCZpgR/eXi3PCBBP5KV6EILZsFnQg9Pc6CcCIV11DOUGrRiO784J
	 +iPN/qAT5xyY1yGTHyrj4G4A6CkUiULs1S4ck5aQec3AUrkMaCvZ392VtoQK8SmRn7j0b
	 4jN2XzeEYTwznn/AbdQybnH5yOTh9G1/5XumTvnaAJyC90auvyhb7dvQ4w1vEwxJydQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
	b=4LEKNmK0xsu1cLh+QQSEvfh1TW3hVXCmxz5UOuni1VVLVp1DF9MgE2OkCDaYyaXpNcIL
	 0KWgAIcf9d2zUlz+mpBZ8VekkcpqcmVC8BUxfrme4FA4yMdL99EzBdnTe6FWJtQh/lMXr
	 2QzZemXvPxfIN0ml3GI8W/GZfHtL6sq5ezuSYjM6aVubUeUBSpENAcw/MNhBAxjADkrBm
	 oShTp1oJ64jkGqvBVnp4XB9i7nUNbnfQBrAX4JT1PkB1cxCOghhXOx8fN3OudWq3Ay6PY
	 ptlTdtK0E/k2mpS9oDACA7IxT6WJlaP3alLjbm7kzNzUzQl0gdN/duMOhl61T5jGXOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TRPH/WHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hh/hcgDh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1928606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1928606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRPH/WHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh/hcgDh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeriq1938145
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EebyHFSMp1n9L12tdULGndsY
	oFeYpVO3FQRxlQ5nOoE=; b=TRPH/WHKXcU5bERME6r6Sfqelaypr4fFjNzjkaxa
	YrKCMAnP9iS/qaiiZnI3szfyLH+fhSPrLUAh124W2cP6GCejTAUF0VLYQE5tziKx
	/tp9d+0n7MOqWtc5qrR04x8pqVAOzXfsFa8QLR5hC9Rle5Sk1Vf5DnAgoDZVmm3D
	N9JWzoR19LOkbDBTtZyjJIpwLMeUwAw+VsUiYZUw9NRbOM5nqNBYYjq8Dd2d1N1/
	G11vD8bnRc3SdQoRo8L+9kenhO+kBtjpn3S0pVeCzGjKeDwCXLt1pJtUtSKWMDg7
	vdc6EgW5Pc5QIdYY9peXirc2Pfd9WGOvX4o/EorN2Bsc4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtjsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso643310585a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100280; x=1793705080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=Hh/hcgDhL9DivEOD7blRfa5Qz8zze0LKOjo21tSOf0TZCss+yRduFCrTULIjdCe/Wo
         6AT8+iRF75ewkWRJlh01YOvekeRQgsPOT/FHXvnBPlZKfnNDTTBeOz37Y+kQXSeA0iCx
         qGGqAv4ETB5RieYfZ3+QX/4GLiFp/+b9g5bn3OTZXfjehq8bUOCtkP8JDdnBiYxbgYHp
         GWrXqJHa6NzE5S9r3v+JuBq3jA8J1ynNEX3ff7RXdkKK+MgkywnGC37deWZRovPdvbnO
         YP1SgqC5y+qXsTxjdit/IRn26FeZ+wdDtZwWifK0J6qxtI8lgLgYpF1Vd9c67tWddzRx
         SvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100280; x=1793705080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=j//EPXJ5+go7gifEvw0suGW7C+WPWFglBAYtXfmDhqwOk4d0SGkIyUmI71EqI4Gq33
         wH2frMBjM+jJel9SRQ5em78h639sydfld0i19yqyUSj0+Sb9zy/kQS8DFTwuQ6jciPo3
         Kihi/MG04z/5IHY0jdC+vT9/C2iD+jDDWKelDQmp/ug9fR50OEGH519S+SwY4JqsQIPj
         M+Hk5V5xM/V74WoL5+uUUn/Y9vaq6h5SS9q8j2m3la1RNrKd4u2PtyowKMg4QfYuT8N8
         9ZAoX1KKs0aGe9MWOaGMQGEdXwae8Fw7LeDhnnGZ9+nfQ0pg6s4O4PtDfJaDvtxUGQJX
         HzBw==
X-Forwarded-Encrypted: i=1; AKwUvByedHkM25u69ODnCEFFJpbSmOkZuz2J+XXYAKxQu/ahEMfhL3+1PJjuQXXnsg4gWhkYb54N7n+dddjn@vger.kernel.org
X-Gm-Message-State: AFq9FYLQdb/Qs83YhiDFqnzVpmnZ3K3RomhLhNERAYKoEHkAYOd1KJjV
	+PMB+2WsYdbG2wgZYgpaLLaRlssSyBG13sRcjoGcwZ0UyNDuw+x/glmW42ApkrgKwEMYRujwpva
	NCIr6Y72fT8FcAiHqOccfSLbpLoKgq48c48fPMbX37rGgQo6rvBNbJSU4ok18LhL8
X-Gm-Gg: AYBFou07QaBgvnyZSL3tEao7o5OJLLmUiZRqmpJ18zUFV4njPNEv0PdKzrIYiEwk5BG
	NCr3KYyNDb9XAfaEeA62tGpTIw9mPIJi8ftlLQV5x5CWiJNF3dSyHYtwX4dsmAOly8fK//sb5Xu
	wjv+rhAMCI4mWJSebyplHRBvGzypxXFYy8gLfvzwZvBY/ID6TqvffBV0D/WJ7H1coR9cPibcd8b
	a3k3SOptJ0tk67p/4R2NelO3XBsNx01+SEEslnRdhjp4OOnW4OWTu6zf5BN+8CBYYcQj5B1yg4g
	c9mfFHJe72QLqqvdi2XeqixBzHe0AH91LBAg2fOh4sNH5VVkLN8JzZlyCx9Utk9FfrAX14DkJRU
	6dxdR0njSSy0tLAno
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488918385a.18.1793100279932;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488913785a.18.1793100279289;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm20649357f8f.22.2026.10.27.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:24:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:24:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
Message-ID: <dz4woik4nsgqpyahkbzvxeq65oaqhopvf3mltpsxvf6dpkvof6@zjsv4sbzjfjr>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
X-Proofpoint-GUID: NfgB4F1qbUgZwbvvLwwJ9UWhqL3VcfDW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9W38gO6KfEz5
 OQqyF3UtH+xHpTVy9NwvjO4/W8uOcztmHO3Jl+eS53/LY2DlTHrWIg87KrnHcVjcZIrG5w5Rr8v
 gk8xHSB0AWUP5LT6eUk+niCr/WGtY7c=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae089f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=v7bdSaspc-564zGwiskA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NfgB4F1qbUgZwbvvLwwJ9UWhqL3VcfDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX1Matj7fJlTaz
 Z9kuaU7eHLMkgMhlTGH/moxSbjbuQzXbsPFHfpeJsS51ASGrqxZf7Uy+K0qA5PhqJG92LsukRwD
 DbwqaAcFx3pFJlMW2slS3/iNjtJSInxhb9f265SatT3jW6Ej5TFrG0wwYvBBtM+jdheidshl8b1
 8ApONi+N3Jk3ZBCpH+xZzsvTDpRLsml9LNNFl4ig3xP3xkMg+si4PClFZ2SYljmCwaHKoetg8cA
 8k6tWeaUohLvb+Ca4iRM0goFBFaiDQxRlaUSbqdIOSRZAyJ4JCjMAi08kU3Ej+G4fUr+/rv0Rij
 X4fMq6dd7aAWMbYs7tFv86h7ttb4InQD6I4eijMoiW9iezesbxAxFg2WDSZxI0cNResatST+v0U
 Lv+fRir7dZ08uq0NlTS8bbdrEdBNz+iyLp8Ml1d0nPKg5g+J+5FKNElheXkyA7kdn6QsteoIpWp
 dq4MRVX66vyui9siZNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:12, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
