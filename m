Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFA23AC0DD
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043390; cv=none; b=V6oIPZ52CqWu+s/ngrqUl8B59EH2VxsQoEPVJ2192E8ke/oL8Dlh1OiALTaeAJ2+lLCNyunA+IelI+81sQhlC9NLUUpo33wnXW1atAX3Enp4m4smyFU9cvjhIJQRuQ2t9QquY/xYztMlOPnxvKTtQ4VZV2Fcb088vqjqay8J9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043390; c=relaxed/simple;
	bh=2qyilwUvmoPpBOyPOp3LPtXbOnhxrUvDkemZNQx/Tvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVWzIlqb1FJGY1em+81UTgN9XN9h2Hi2CBtuHn0xXWX7EYe67xfRXNKvGYpGPJFxGLWBVkPfrdRfJi8/w/DwP2LHVsiXqW2/EJfi1Z40pPoqmMUkO2Utg9QkSznG69SRIX2/YAY8K9wJ2aB6amj3OfFNh7j6boK7KUs3Mudvmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+2YfixB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A71A74ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+2YfixB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A71A74ug"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631APJq21562679
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HCYO1QFh3Q+hgTi19uYl6mUr
	jFcin1yJshF944ZFjqY=; b=Y+2YfixBtoVWKwgqzHIw2AYatOsMBnJx2PuXnPrC
	bUvM5bTwpnlRKJCPC4Us/jUQp+M22RR6g+K/iGX5gqAYV7lIxexN5AYtHwyCUep4
	oLrfi4AlJyY7W7kg6oXozvqHi3vTdVsiXaiObgfGpkZ3T20/nCVd0VwPT0bvLRUW
	tJcu1FBTWg1yk/5wNcxw0uUghjCLtS+40gBXzHcITFPhECkpcWlDyv8YsJ3z+3Ud
	bje8Sflm1ll01i/qS6pZkcY+lPpLyg76654zAVk+Boz0s2MGuR9iTwGhaF8kRdWY
	LX7cLs7awyEraj/rUk0ztYlvxFWYwBN8x8iQsln6cDwr6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sm0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:36:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2cbe7223so217309801cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043387; x=1775648187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCYO1QFh3Q+hgTi19uYl6mUrjFcin1yJshF944ZFjqY=;
        b=A71A74uglhtB6nxpWikP+/fdAN5p72t2mWxh9S8BkO5DAz/z5NPked3gS4XiwAB8Bq
         WnzbUIZ8Jv2urdNa6as+DkyTAaGzrXzKtk2jcfZQsoQw2Xf4S1kkiSfJfwHaaB/ZoUkn
         DFYGu8KtqAzpwsWqq35vKxN2olzQXmbxSA811UhQBeVOejnG/1BIGJnoTLaAq0bdKeYa
         N7Pzi3LUg7RCilfkVF9Z4x1vV7cgLnjqvxnDwavv6H/gJBRh1Z6Jvii5QPgHd4YrAn/T
         zVOnT/GeYxeUZwHr18Dzza7zoTXkvOoqvA136LTBFRcMRB8Rs/xKzO2eneJJJMACDLxJ
         SQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043387; x=1775648187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCYO1QFh3Q+hgTi19uYl6mUrjFcin1yJshF944ZFjqY=;
        b=DDjLXHRyZfyrM5s6Uc/l+kXvs+eIFB8Nthm7ZLKtxKgPvW6mqY+WflqbOgXbu0PTsB
         SZJzaIc004+L+cOAx/YZtkjGjoGBLEuKwrNtTNpaVj8j/q+j7e87hBo1H5+6b+DDCO1M
         Qf+XCTwhYKbHsgImjxjch3voDoxlaL4t3I8nRhenxQMKkTaTcTAQ1MqGkMmaaGac4wO6
         2Z46JAzF8dUwPULnCqH0M2+YYC1Rn3YB2elS7U3f5/j/Ez5RdXsg9b7HKT9DTDtV7i0o
         jhgRJxJsZ98sRipYSVXV5lr8qfU+u0CN9YLfWXo+oCEsKap6U/LgKQc55LdgEQr0Rubm
         6MFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+IOk5NP/DfmkGCtVti9qkO8mLxVEUwsVGIPkxpvgRIXcrFDvWDKsIEDajLTBeDZvNRlixyk5mqJ7N@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYH4IS+fytZWnSOfSnmCV5OKVILV2LJ85fdGpi8GwVWfzIAoX
	IKrbYtUXJmT4ZO+LGbXoKAkwtLPKhSEMUPPhGwQqwAjSbSS4rRtcj+MeBX7V+8LWAWQj8MouF3o
	bYZFelQOvQWaqDJFBys26uh6wXeYquKqHXDemYdmS7NZUmUjiD1CKexfnmi9q4iDB
X-Gm-Gg: ATEYQzxN0NkBMc3s7Jw7T9Jevw6enPH69To0uro+0GVx7XaTndrmrytqGpxoPU7Bp9H
	cE/OkXLSx9R9aX1tzsBB+4dyfTydq8WqfHnZiKQHWAMgy8gunCWgsC//tj5p+BDfc6wVKTBUul5
	U8sKtI/oIx91VfK18kKriWfCg5L/dYSBpsuyvXzPLnjbuk0JthCXx1N4zHHTdhpjwI0pk1rgnPK
	WDdp9/ACyBMiDy4mqOdzZ8wpGTkK+IwB95bHFUqRy7DtKjpWhQL7ot8wxbQzxXtyHVWnfnhJHEY
	t6xWQMy5QeQtOftRxirtj8DGCh1NF/wA0xMZG0+Fh42ewOG8oCGOdXpxK+EDt/RtjFWpOTZ9s1a
	CGUfeoKFKIvBfIw5HnvwwHNY4M3AkHVx8hNUYtUJHPcdr+OIm6Oa2FI/J+yAiRMN6zY3bnmHWBj
	YYgG2ADv+qfeIKzzgflxL1NJslOqSRXRjI3Uw=
X-Received: by 2002:a05:622a:1648:b0:50b:2d05:368 with SMTP id d75a77b69052e-50d3bd09620mr42887781cf.42.1775043387301;
        Wed, 01 Apr 2026 04:36:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50b:2d05:368 with SMTP id d75a77b69052e-50d3bd09620mr42887211cf.42.1775043386739;
        Wed, 01 Apr 2026 04:36:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm416944e87.52.2026.04.01.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:36:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:36:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
X-Proofpoint-GUID: 62RqXteO_kCqk6KS5o3tBNFyNqNhQZbi
X-Proofpoint-ORIG-GUID: 62RqXteO_kCqk6KS5o3tBNFyNqNhQZbi
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd033c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BfzaMqt4ej4OykdqmcMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfX8+5XRMlzxnlC
 KZCGVViNWv8mBVn47OxW0W6Bkzt9hDtQTZxRQXubLplDnql8YlUAebOgFiQAvwO7DUUAelWF8G0
 e3UqlSjtnEZUMdSy1ElP1ttG9J8Dmbv/VhzZ0tQ4I7PubjFPKlG2bBUos9uWVFjAsdX4SBJl5R6
 Yw4n+/QXmK/lJKHy8qYSberIImomuj/zqFi0L0bdJsm+uu1ZlysbulcdAWOUyiemHOjEgpNvE4v
 5WklZ0EtX3mNuzPzrK5n5Pptotvas1cgFyLoID+SG7HEfVGY2HB65EQY4BMNCBs804SAmSIYwE/
 G9TnHnJ6226X3yy5eDbAC2rtmSDT4Yvh8f+q0C7VF6Z7sqnD2msNWdUo+n140E43RpgTvhbC8If
 l83WWi6pNKLsV92agijtHV784pGf+G9nEOixcfuC9VrNgLMmwfD3DpPcC7x4big9WESauhRrJ2f
 k/sYKKi4tWykMNdabFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010106

On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> Introduce bindings for the monaco-evk-ac IoT board, which is
> based on the monaco-ac (QCS8300-AC) SoC variant.

If it is a different SoC SKU, should it be reflected in the SoC compat
strings?

> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ca880c105f3b..c76365a89687 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -918,6 +918,7 @@ properties:
>            - enum:
>                - arduino,monza
>                - qcom,monaco-evk
> +              - qcom,monaco-evk-ac
>                - qcom,qcs8300-ride
>            - const: qcom,qcs8300
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
