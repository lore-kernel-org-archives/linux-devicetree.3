Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C443CE53
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848609; cv=none; b=m2WjBX9O9EfkRLvqJBBcW0kk5mUa+aPOCSRPcXVzQzl5H1gQHvdVl13ote8WUqHfVSUGbXlmLA9Cc8+Pa9CSHjAcGv+sIMuYApjHsHVrla+Uvz9eSzHzdv2D07OD4x+kMigEwG7gIFEqXJqCtLbIlWXXNyy5f75uzpiwiH8IIpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848609; c=relaxed/simple;
	bh=1V4OL9uc2YgKaEpq8j3+rq7TPwpT0zJ3+rZXCwWkSks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gct0oANUJkvkZPBeD1KMx7y8L2TXUno+GhN69zFz54POHw8Eb5Wag5F2BkM75AztNcgaN5Xy1w/ry/MzT/CybIMtXae4ZyU2HKF8AfAoFs+/38Xe4SW26i+uRHkF/bdNuReVL6TWsNiz106++I8hlWv+Rto6OQZzTlsuTjDEj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/4DiWRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTVe7AbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/4DiWRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTVe7AbG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D2wDQ4031569
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vvBEYX1Um4GhmzUJ4aK/c3sr
	FYJyqvPvRSQvm19rzaE=; b=T/4DiWRGsSdBmRU3gDnBp6yzVDBI/z+S7FnFBFwJ
	Q3ZFlDyTgOLHgJ7DtxJLPWlXUfaCuLYCw7Ceu06Sq/JuekIFdxXd23AnYXyBOFBh
	ncfrFh2ystMPnLSVa+6Rlg0IETmZtDm+xtfYdNEZcJYaHw+1PVf9TNGeaKj8e/GK
	KRleooS0jcdvNMUNWMxOi/ugk93izYCMu6GUjaVvBeUQ9rgoFw8WzXScLoblCLcp
	BcEdOmZ7qz9IpzldoKM6ab7WrQICupcwl3QNC3j4D6rgtdLW2CXSmmSUzS4bItdb
	/fDkBPh8QLY0p7lGJTMeFfRPD6sT3Hz4jxtUZl0PDv2Nbw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmg003j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:03:27 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-485ebc5706cso1545689b6e.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785848606; x=1786453406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvBEYX1Um4GhmzUJ4aK/c3srFYJyqvPvRSQvm19rzaE=;
        b=ZTVe7AbGWvdrm061SO9ioaYk3HHq1R4diGgOFGAvlXFUVAu91JB3QMkN6gCduLgSKO
         W2vhqx1Hv/IL17asYLPBWK09XxsH1dV6k/IVH4hsnjudkAizZMwEYgksKaFj502JFgYu
         o5z4vTHnRG/bV2gRPer1US4cjUI5E6maFI4eZjmj7Urwjnv54qIXwyqneP3t2zdZ4jt7
         KTSjqGJfeglj0SOiFYLxRBwnF3B8xnNFoYKcm5uVX8XlAW1I4Du8WhYOcGma5tdXuRyF
         OA31XMR/jdTGrZO9ijSnEdTN9u6gql73WZVPzIz8xkM+czV23TIydiv9aef2KrSqnRm3
         pyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848606; x=1786453406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvBEYX1Um4GhmzUJ4aK/c3srFYJyqvPvRSQvm19rzaE=;
        b=gfOG0mZq8zwFGJwBGe136bcdv5lxUSh8AR803k2Ite8uBivJXQMnDq0idUC1KSIKcp
         R6pCAmSVFAKFpmPCFzRUIjmuFwK2oMF5/rjUZO6TY0eundzTP99geAIdGWisUmDdqBAD
         2OlnviNQVP/5V8/siqDw4cC/Ba/3dpZbPAMUEy++oH97KiAdjozXWUwLPcNwXsk+9KxV
         VJTpiNbKMU6a+7j9k0CdXJaKd07B9bmfADMshUci5lDhk8OFPOmayZK5Y6LRKI64bcz9
         ahbgoNGE3r1gOHZ0b4IxGc1d0o2rSLRF14ss9p4L9jEx0Y4EDrAx4PDURXhwDZpEpzEP
         42uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZHFPTIpwrZidYVd1h45oSkWVSou6z5e4+AjIEm7V6D3WMW1gMx64B2UvHLs2ZN7SoyveI7SNvzLnl@vger.kernel.org
X-Gm-Message-State: AOJu0YzJeXM4TgpZzavtbPXIxKEaE8H03+5uLuGACStiZTmw86rdTq7e
	ny9RCpF3FVq6EPhFjevVV+QUIKow5WGWAAvofLNZWVnXTnocgPKM3jXj6zYQwiGRHbhb0kpH1P6
	jvUXrfCBINx0q80HnODXRekZ0U3F28IQMjN/bXHIqK8uyi4EfBEfk6G+GTUVkggLn
X-Gm-Gg: AR+sD10SWymNyRtcIwJEkK4SjYy0jf1hMnhNvEw0NexLAICiIFxbQ8XJk8UAczG3I4b
	S6iYxuzwCp7d0DklgOAMMndwCOnyEIQAc0WSH1S7Ffc9uVI5P0JafoBqsYKMDUe1JXt2uH3T+NH
	zPraIgkqypw2rL1nQWmEV1vocabBDMWEtZHQmzOXKVPcOCQ2lxG4lsoy+xU6Us9YOGF12iRXbWg
	fwZNgW/M/vboqw1kZjpnHi5xiQpRaHyxlQovZwdrYaqZK5Mt92xjxjzqPTFQw4hYYFEW6UbnHX+
	3dgosNrHBVzPoqEBkjtuKjKt00XAIERm2uSZWqM0onHjiF75v4TwceG9e2kBDuV1JyT6FQtdo7h
	or0TiF8pVhdzI2g==
X-Received: by 2002:a05:6820:160f:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6ae82b35c55mr4022192eaf.21.1785848606367;
        Tue, 04 Aug 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:6820:160f:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6ae82b35c55mr4022137eaf.21.1785848605795;
        Tue, 04 Aug 2026 06:03:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd88c8sm100969035e9.7.2026.08.04.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:03:24 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:03:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Correct white-space style
Message-ID: <u7hvmjpptzqk3mzelazrxrm3mhk5lpryuakhrehfixsrvoreuy@kbijxhnp4za6>
References: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfX9QFNrP1fqYEg
 OdgzWfYA5oZhsSl8MQhM+zKOKdhBZtn4xXYaOppHnHcD8TWnUJ0RlE0hQK7djA3IQk73B4Osl3P
 ivin52FFlfyhEju6KYsELFU6XyT79ec=
X-Authority-Analysis: v=2.4 cv=F89nsKhN c=1 sm=1 tr=0 ts=6a71e31f cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=d1Fdhz7F2SYFlaUOAXsA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: FYETXIafAwhDcpSmlPg3-QwMGBMPIW1Z
X-Proofpoint-ORIG-GUID: FYETXIafAwhDcpSmlPg3-QwMGBMPIW1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfX4rw5dJcaJ1EF
 CV74kC/AOhDwtjzkWencINaNSaUTcijLseSC8FXewkl/oy+LLS9+2OBQ3nZvGmq8TaeXKqbgM4t
 PoPLOBWYn24xJVXbu7Rmil/raX3K5Baniko/pYbFtsRUQbgnIcgBRoYyOAMc/KxLRcZfJJLigQH
 wemRpWUGsGZJuWCa+x5ZcgciQWF7OXOZ7qzcjPs4ksbpEvpPdksx0SDSmU0GjUqxxIQzXG2Di8f
 45/RDf84n3CPuGzk08Kliw6kh3e0gE4dzXb25HHo2XsaZK5ZXPyDxywTun/WXysZK/Shqth4UCE
 WRhRdWk+7fMFxkMI2anQvzOa06E+Qu6zAk5iepLI94CFVLBEYPC3fjiHKAlxuJnvdM1taObHTzb
 lgg/8rOqr5fKvrUb3oX618luaaIUYkstRMIHlI4GAhKpme0Ss06FBOzMOrtSglx6b1Az/VVSLnI
 ouRAW6FhWpXgvRJpHuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040104

On 26-08-01 23:03:44, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
