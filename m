Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175966;
	b=jR56bjJ+tP+MSW7qEwjBl2fdvMpHre/kD61ija8p/O2/En/c9uOghNyeq+bf4Pb/xHaB
	 lKGgT/FQyDU7j8/VMs6SixGU4ukjz2+2761aOFhVLTbR/zbpWbdCe2Jo7eX6U0sIGD1RV
	 MAbzq0XrLp1gfWoYUuLrBpHZ9Fg32ABpHsFae2aV5dWElvTmlGDv881mPAhHorgbQBkx4
	 hekBnhjtdJMDkHhONCmLiX2eZPmQ60c5GKJE2bfL7UALwSSM/YeE+54dueFr8CnRWHZDI
	 kwwqecJWtWMpb1Hv6w1pXtoVhXBeBiZSIBQoDemiOH2uWH3qbKshvu1e5xKSPSRcuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
	b=fRTTNRkma6zLETaplQwAg+Q0zEQOyPft8SGsAsIHZlxL4Dk+H9A2sHXpYhm2rCxRnAYh
	 IZay0PPyFLTvosyS2i84a/9d5CZqkpeH2Rp+MdeYlvfPB1cNWi42ZGEM/bGFV0c+U9RV4
	 qf1AJiPFHnvoc5LqPeDZq+s9MdaxOvXAQRu3pS0RaSJ3OSPxv5BOxNNNYLh6o2gUZYDhU
	 UQubLEVnDhGMzkxrBle7+wz6KVQ1FRla4S9GZ4xYseY17rI1mVuK+ZMUKdRn++eRTocBr
	 wPoaZmS8+PuCKPYVYI/TaZyAMY3nALoV6pp27b/IRgAZak1INF6HZ4d5+iHoS+1PnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMgwwsY7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E179606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E179606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMgwwsY7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K8Ef253377
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=; b=BZZnV1HoTJPOHFH6
	lR8CYjd0lI4eTFGocQe+uV2qoM+H7Y8hMQ/jzFxDJ5MFHb4IwTtFrCcfsng9hZbB
	XFVxHXEIlFSYU9b7XpV9azCkHjuHXqe0S30b9UZU/g6NJzoebK2fVZ31uruW9X+k
	4OFfzMt9nxvasYdjxmyVTbfdZc4mI6cVNU8P/HrQ+hvi1Y7MhCRkkIyolLnp4Wsp
	QdeUlVP1s0OJCLqqj6oj8xmnIFAwHPvgZnFaudTrCuSekkl7HIjJSgy/UUk9e20p
	9IaReO+fXZs4oaHOogiFzx7WGeHKuznPksEqW7SJjFTQRtFq1EJRo8Kul4dQ8D1X
	5frejw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1h20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:26:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so93882185a.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175964; x=1793780764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=XMgwwsY7Ln5jhCG9XHDjZqzM4DCcMDbdYf/J1MutxMWLNzznuFAP60HrZ8QpB+rgfU
         JqjHeQnqHLKpj1ntSleGZe7ZK10VU0tJeuYh2o70rCYN5sT9bfgzoIqnX5XJS31RWHwJ
         NGsWlmAtQMCV5hMi5istZUqYBeeADDkRiwatt2afeXy67m47Um2mkefCsiDYxqjTS7Zs
         w4XLcYvNV1oaSTs1BpgYyzWaZwrcSD1isbpi0V+Z2/WdZB41c6p70GWNTh7MdSbtI+QM
         QDu4c5jMfXIWSUKZzxd+zg+rCUwoYRo9W+I0OqyZeqUxigIalM4jMIbs+OleAcdb5FGf
         EQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175964; x=1793780764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=ad4mEuuyKj1DnBM4t/rLN68cT0tUWv44/vihbdjuWQvZrIjON0jrsd6GyNJG8zMdqZ
         tpr66nfcbkkShtve9tLrP4qXGAnE3667S74WEA9TCJZ6jsiw28cg5MPWxZdfZT3hXQGJ
         se2LupyhgQlwlH6omF95qAFkdzBg3jKyzb684jFw6EOUcqO7vVNPap8zmmPlZbbdBKZs
         CNs+IBT2YYsKA/NvTwkXfaKAbDy8idMEAR2sVdE1kDsrboR20xE/pYpUp6P4UUFqRRcb
         gTGLJHCbGCuS1xbr8SCZj4HaEOC6MH1g7g+ANNpVJJsuz+++urA2GEvaJ7ivO0lCUPZO
         kLfA==
X-Forwarded-Encrypted: i=1; AKwUvBzjBDBZPhEfY/8tS08VHGcIJhtLXCD7njwhYvKe0SSCW/mgN/5jS5oxgHri/Rtbxa9Mdov7Rzg9568Y@vger.kernel.org
X-Gm-Message-State: AFq9FYIi/YELfME4LToR40UKGx5++gf4P7qF2zB30fckKQEZ7NHc84aY
	DRGu+5Z0OU3rnWIQIYzor9iqX8bL7U4qxCehP0gtywtbuRnFIkGcmN7k4RxYczci9rmkH/nGWOE
	LCfL97RmriMQgSgz9dfU5GS1owPewrfGczzlIkptorL2pjRVQkzD3oG26wuUr/3u3
X-Gm-Gg: AYBFou2KM3yneEimq7+AGAUxX0N37bAIR9hBTWj0P7IPDJm90fa6nWNcKdi00Ou+pfh
	OcuzkRTmmNsdxkFngQz56SSjOFYN3fHw9ijhQc/4kqW5k+GVk/MISFkqXtcS04r+cORWzxeVx9j
	Bx24VDTlzc754cyeJY1pEhJrlFSCCENyLeVWZyFv46KCb0w35y9l72OdaiB0MeNBUZHB/9fL/2B
	FxAEtZep2OnIUcuycGGAOCF7rGtztApvpWFfyc6rLo3QaiNdPqUJ4tcmDollDRwWhW9cEKstSP9
	9azeUdo92CNYHebe+44ZGwSEK9mPOBtqPNDuk96o4ErIAMgiWd6ej55LtG/fT/mJ8lzNb//winU
	kc/t97wo9KflC7zIHKQXQKhOuaheXzBQj6bmlvioq20pOn8IHOO4FT9R0j+mlumTk7Q1sZdE8ph
	Q=
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214971085a.18.1793175964246;
        Wed, 28 Oct 2026 01:26:04 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214969085a.18.1793175963800;
        Wed, 28 Oct 2026 01:26:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f1403sm30752595e9.9.2026.10.28.01.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:26:02 -0700 (PDT)
Message-ID: <4ffc0e05-f6bb-4b3d-9281-1930a1d83da8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 09:26:00 +0100
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
Subject: Re: [PATCH] dt-bindings: interconnect: qcom: Relax child node name
 pattern
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Danila Tikhonov <danila@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qnC4n95VErcjPPAO_QNKtIa-M1hMgrYO
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1b19c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DKZtW8Xn8zsu_FwnbecA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX6bhF4lbGiD+k
 hhZyJRzNXcpwjhjMj3WRPnRDoFcO2/2IfSwzsN+59JPJT9tLc7QN+J1sq26FOxJmokFIwUT2zf1
 //shhuaDYPyD87Jn96ZM9DzTLe7bATw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXyQp/z+PCb3W+
 PNB3h1Tn188RwlqjhVVQLwzVB0vD3bseTnFH+qbymGJntar9O1SMPSvxPJ0RCkZoOOUQf/rhyOS
 zHsZj9UAprjlYHWMVtF3yxTaRlyzaVleoEO6tdKS9bFk2dHIE/wWszj2rTquR7atocGGbeIOJgB
 dlbts2H1PV0Tvlkqt8YWte63TAGZabu2FIbnZD0V597cnKy70hzMpQ1oFfbjMmaQw5cQyps9mxD
 l372Px6NZK+ugSa3Jq7AvEoIPQZayCDbCGyJb29se1JaSUzSt15NLsxS0XOpMhOKIJoUYaO3c16
 CS6Fw2N/tdgNUMGRvVK3qPaGOKt5J9BCxk/lnra5RVznY8/sw9PPgs/tZlpO2fvzrvNBiLlItJ+
 atiSHV/QfHWA+X24cl0oKbGlPPfwnCaXOuYSc3Kb5JpebBBXHVng1bqrYxwJJs0/m9P4nWFO1mS
 w5PEsuPei0W97yBgyaQ==
X-Proofpoint-GUID: qnC4n95VErcjPPAO_QNKtIa-M1hMgrYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280033

On 28/10/2026 09:12, Krzysztof Kozlowski wrote:
> Some Qualcomm SoCs interconnect nodes have a one child, thus that child
> should be named 'interconnect' just like the parent, not
> 'interconnect-0' or 'interconnect-foo' (see Devicetree specification on
> generic device node naming).  Ideally the child should be just a
> property, not patternProperties, but that would be an ABI change.  Relax
> the pattern for children to allow the correct naming.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8939.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,msm8953.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,qcm2290.yaml         | 3 +--
>  .../devicetree/bindings/interconnect/qcom,shikra.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6115.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml     | 2 +-
>  .../devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml     | 3 +--
>  7 files changed, 7 insertions(+), 11 deletions(-)
> 

As Sashiko points, this needs updates.

Best regards,
Krzysztof
