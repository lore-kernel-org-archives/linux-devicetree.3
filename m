Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9192365A1D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340252; cv=none; b=ul4MxDGIGrxFne4NnXObEHG+1qmdBGKriq/XTVc7dTxJeluE8YbEFx7mO0loDBHHbnkJI72bzODlAK8JWuPhYZv+D9ENqSQYGXMBu8m83Smcy24XTtFyTDAuMm+VfTmsWu5YBYrdMXGIh/bpOlP230NEv0qTPyFMfRWZLMZupBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340252; c=relaxed/simple;
	bh=sBJQy8FSigpIKdJUl4vZ6PzVWafy99zw2Vw7aZeTlSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjI3+UPw60JYq4wm8ONyToNm3lV1hK/AnKY8/04KpK2B9BkZrR5Q1Aa/XArrQlI7bYtPx8WV+jyunLEA8YSxDOEkCPrV1N+04kRtSWpNq51qRoHPhhmAWkEH7O4cly6Um4s6XHeX4hxEC8GQEmawpSYH5aZLRLzlYO38yNAf32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQc6ojR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLdnXEgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQc6ojR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLdnXEgD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344lfPe919311
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 22:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fMtC8gnkL45PHMz0CqL4xQiV
	V4b9ZWUXoORtR6sfzss=; b=fQc6ojR05j7kLyT6jQFtg3gnsfHZ+OVDYLfC41gi
	ssCRtdAN2E1lIAL/tmjxFgu7qT+7npY3OQouTMOwGEhFvdZPOKqg0Qvw7HPtPZy6
	g0sX9LG15RxbB7bMLr7K2HnfmJPoDcaGWPuc1AwnoGvJWEAHlM3OjPEyI7CKKlxM
	GsnH7zI7hvz6stn9W0utDfRbUDpY/2VN3ffeiKpbqftcS9Nkv0rt0PQmTiEf2hq4
	J6J1iDe9xHqRImb5Ikm7vtPHq55Zs/HkOMoMx5MgMu4GvNxDw+VwnyzFel6S+EJj
	tm4uVzv7HyacCNlj5VcKytFq+FW6Tij2iUy7KkSoTODxYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89f0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 22:04:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899bef1ea49so138637786d6.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340249; x=1775945049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtC8gnkL45PHMz0CqL4xQiVV4b9ZWUXoORtR6sfzss=;
        b=iLdnXEgDyPBUhz5D8iGsxHZLKdkaAT2TXrHyzCX8t4JTUVNDrVQZMgzHDHW/BN47MR
         goExKv41aVHT+O75DAKdQ9ebY9gjLrmOlImjske5q851ZFnIkg/BRPsPZT0zxjvp0ZRT
         LdeBII2uy7l6pBJNIqfMEuW42QTJTYaLmo+ZFThJBW1YildOwB460lp7jZOgfu/vZPr9
         Vke/6bHyDbd9ND29CSy1TFvhh6Fb5+rFmR8pVl5mkPGJW8zgR/3zSfIeFOsNJGyBJJM+
         64r0p9kGHF+O2CJThBvRiyrg0oWnIM37h3Vm5vVnTdEYXURbEDqWblp41cxpb6bwKHCH
         GGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340249; x=1775945049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMtC8gnkL45PHMz0CqL4xQiVV4b9ZWUXoORtR6sfzss=;
        b=BXY+wNU5iFRC69Pmh9D2rxpKjJ2v2bT2bZYRGdex1yUs03DTLJmLYoJDj92kApSf+h
         bwGijCre3nGN7OUjwmTqARy8x16wws+mxeLnwwtD7eyVKZclaM8LMQM8ZICk7Gsb2TZU
         NuvxdHaasKodABfGb3G1uhJQs+pVDq3NPaH+WweuSViiK9lvm9ORgXigVczGHC32h2R9
         LEt7VHLH0G/vTgGEuI2CFOJAR/XoBhUAIiCEb0A1ic7+gailu7RJmaIVRaJN5gkAFrHe
         e5RXsFhtuijqrw+gJHaCvyqNJy7otCDFiHmOhpRx5uD1f+2u2J+4mUuahAaZCK0bjHNk
         pOEw==
X-Forwarded-Encrypted: i=1; AJvYcCWCU06SqeQGl2BdtMRHxJgK3jV4+liRZain8207etoE4+KO0ZpgsoaFRbUeX9GBgxBIYDJQh9uFSKyT@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeHmKHHKemzA7CyRXnxkc8A5W4dDVmCKUIzR4XizmzqvzQupE
	Xv42jGGbkrJB/bOsLwvN7/KHd5Z9mdWkQz3h0fZbRfisBrQiurCP1awhdFvzfL+Dk/9NlfSd/SV
	e+Pj3cT/9gYay5yfu33J6O0psal1h14dPn5Ck4+/u/HX3Fi0rzXIaNrsbopZ3MBbqA8IAW30e
X-Gm-Gg: AeBDievfa4YCLr9NTK2PTWVdVK47t7zDWpllFNl2Hjg0yuR378DVXCQlmiU7AKAduMI
	4pXM+CSllqD35h0zTdCDOu7Gjnq6TZ7wkHQ8hfWIqWFPSFWGX1tEOTPjXUL801ateTx2vJha9zQ
	pHJJSghs4r0ywQJUyJYLL8ZQvf6oMExTqEfQ0dP/eVXnSajW7b/cE5jTJaKD5/l2W6vAwaZHeTL
	XodXiV8AFxZrNELRINsJph00ptB22K3amg0zMF1jEj8bxXMdGnS8hv6EdCJCO13PDeatXvG6/8C
	ugbsvsPcXUblS2zXcaz6uSi5Qd/JXdCvBPmZvGpfJdbEUfudhDw3KBENH63zpCvbE0heG8YI4XB
	peV1V5qhbs1e2e2Xkiaj2FnjRWmhhQZUJJQpjVPLoci7DESRkX6gxHw1Mutnlq/zCmsOroOOgbj
	92jlxDyXlBarpTtSxW0gj9SZP6yj//lF/H6lo=
X-Received: by 2002:a05:6214:f2f:b0:899:fab4:730f with SMTP id 6a1803df08f44-8a704bb7389mr131489036d6.49.1775340249033;
        Sat, 04 Apr 2026 15:04:09 -0700 (PDT)
X-Received: by 2002:a05:6214:f2f:b0:899:fab4:730f with SMTP id 6a1803df08f44-8a704bb7389mr131488686d6.49.1775340248618;
        Sat, 04 Apr 2026 15:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd208sm23015631fa.12.2026.04.04.15.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:04:06 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: display/msm: dp-controller: Allow DAI
 on SM8650
Message-ID: <ozofiq5dwk7luisfa6a4e4wbqw4vuvcs2h463hqxt7uee4aod3@j7aslgp4hkn3>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rqG572EUFILOfDlVcBpoc0928OwMZzzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX5fnfTCqKL7V9
 xAVd2p1r09uPnkZnL8y0caZ+TAgSDhBgeG9xGsXJtQHXmT/wmfnKqTeoeGHBNid+Hmze3sWfXUl
 xWA0UdDtj2c9cr9RO7W3HUPkjTkjr+TQ79rwdM5qxMpmW7AcPO3u9GgyWYoJGlDxZwG4iae+Qbo
 UyfCt2ySAo0HcGpa/HqOtOejWz+u3JU2dBtCurkr5ymD9Z+a8frcP+w3dMzGF1hO4j6hZkI8bke
 6PIb9kGUebhEpqZX8LqYJck8qVbT+vyLTT9ut9MCj6tDatcq79tsPLMfe7igX/Ynz13kI2TYsBz
 099NTPE3Uy2R+shZXseeK05I966eyXLqDMsIAi3/rrW33OcQeZsgXvdKSesOoJBOBlx8KMNYV1D
 kX8dRVSuRdd+45HD9AdkwjZXXkdChKZIy82N6zq9r+5zl2cwM/td2IloYmvSvA0qmjK9kHUBpYc
 gZ6sW422+86eNsV4lug==
X-Proofpoint-GUID: rqG572EUFILOfDlVcBpoc0928OwMZzzk
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d18ada cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RWX2ZFlerEUOqWKuYikA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040210

On Thu, Apr 02, 2026 at 01:45:13PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort on Qualcomm SM8650 (and compatible SM8750) supports audio
> and there is DTS already having cells and sound-name-prefix.  Add SM8650
> to the list of SoCs referencing the dai-common.yaml schema to solve
> dtbs_check warnings like:
> 
>   sm8650-hdk-display-card-rear-camera-card.dtb:
>     displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index e4f17d29343b..f8daaee8d065 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -210,6 +210,7 @@ allOf:
>                enum:
>                  - qcom,glymur-dp
>                  - qcom,sa8775p-dp
> +                - qcom,sm8650-dp
>                  - qcom,x1e80100-dp
>        then:
>          $ref: /schemas/sound/dai-common.yaml#

This clause is for the platforms which can work either with the eDP
(aux-bus) or DP (sound-dai-cells) setup. Instead please extend the else
clause to $ref dai-common.yaml.

> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
