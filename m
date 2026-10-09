Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8821044BCB0
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556651; cv=none; b=f5TS1tJopr8VGTI0+laD2ktlOYwwiTbD8zKQjQ3Cspwd35LIi6KKx6+CxDqufwTUVyIj4M3Mo9JXMHM3ZR1YoxHMQa543jwLYK30PufQ56ISeZ5VOGwMoHkWOxJWyCGeBPIhlcMPbtwnTFm2I/ItYrC910okwd0xgql7BjdW+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556651; c=relaxed/simple;
	bh=4Z/B13xeXzf4YPZIReMjXwn2fJtAzbXk6Calg/Vkz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFpHVBHRXVB0ZpHUiqkTYuLlOZTQ2L4+vK1QswokGa976YwEmozJzb/XHJLaVY05dEkmSsJwZRoC2lIZ4Ux/wKjr1Bv80KCyoie8yrqNUbzI8XRvcltH9QeTgfOQq5fKscNtXZ20jg2534b+r23TLVnHYWvg+DOMGVVArfs7kzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGXWYehF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKP/hhMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGXWYehF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKP/hhMu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DknW91639641
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 14:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKS8ycvYM4Xi70sP59B/TTRP
	HMYkNwv2hxl45JH+Q9M=; b=HGXWYehF1iN+pqqSimfuU3NqI0PJvhAcJQcn9Lq1
	KSZgXEanez/fntA9HQ9CtYNjV20rBxmRA7R22IF3q3+i90vHXxbP0tpxmslKJEAC
	adpp6khJtia8ihobi6KvIIWsJgSR21okQ6Oo6+MeQ/h9RJQKo9z2cNq9uI8QXdu1
	fdZYaHJZ5WlDpQODUrJ0pszKzK20V2GMTi8jRNYEWF4jL02GxzMKHRjl23vs702x
	zmUEp3xIJf1qK7n4lVeAw88oBM/wvRq+tvPlOvN3wbr2bpkRKzmk8mAb/6mcaJQm
	QoixRQLtI5Sxrpksy7FvziBMNtGZst0Wbh+2NVBdfO03Ew==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f1r764-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:37:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-809f1af7992so15268978a34.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556649; x=1792161449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=AKP/hhMu4R5TW3RIaXcfvnFbqwe1agZ0g+njgaNtIOH5HAF9JhkjnuYENhdMBmDfbK
         DCZnd+9HG5eZBeQvUfaX9gkr0EmnrEaNdD5Bbdj/LjXpg+apT5y+OhKqki8jmtGmxMU6
         TIGTAH0UBKnsas376WjTD00/C8pogfNcSflapviz/YMxwjvH8/4r7ELK3QtRfPSuiwm1
         Ldd+Zh2d/FxWrIyxdU67UXCmGXc9XY5WcpBwbo4Iqk5KEIy+oEHOgxCZ7g3ifui23aGa
         RFz20We2kWbPSqGTTFR70LRogq6yMhHFSrNEACh102HNZXzR0PHHmzmtTa8cPdWfuE4U
         0Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556649; x=1792161449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=oAYujdw7fTSDgsoDNU074+PZGY+lrThTDeLTMUkPMwUbmxlwTRXp39rwhnQO2aIOsd
         Ckoj3FHGPMZcjNwCKlLi62pXifLuPhKtf3n+p2vx5m1RP1caAZxGWdKf47FTKZqRjlTM
         W26igcjCqZkRX01zOLAF4Ipe8FL4g5Dt6GR7ogyfs4jR2shVX1bvWSNe5xp1PrG/3LPO
         J0hrcnTJ+iDFsL9aoC1jaLdfp39TMsbRSSSSnymQzZEoh5a3H7BCjDXrAXhxcvBPVXhU
         SZZ1F5qF1yWPB4K+ejfld+hiVkMWvgZ6IO31fccdK7YEYAABPYuSEvxP3Gw96+PBwWxJ
         2SsA==
X-Forwarded-Encrypted: i=1; AKwUvBw8gyUeMIUV9XtgY8ez97duPPRlBCoZBU97Aa6iee7nxiD4xWNtsxHcpJoJQFyG6WEmqvSDL/F+uLtm@vger.kernel.org
X-Gm-Message-State: AFuF++mfGy1wchf5i8Hj4gnIxG/4nhjY9Rh6qwl/EfyKl+36ZcJhbnBi
	TryHthoI28nOG4yAnh8HPhEnv5noaprQ4ttcbAxjRWpRy4bIiS0YrczLmlbFtgMhyt/DNrlIY39
	5gcGK0NKNIQGr6ILVHNqtX5WBqOpzWWikWbaWkl1ArHfXNqyQp/JETwU+ULSBIYyP
X-Gm-Gg: AYBFou3q00ZKdi+boxgf+8cbJu/Nld70RXDIID28UhL0isujFKHNQjxc4Q5Y37EN0bS
	0NEk5IWRQ/VhiGhZeqkMz9e+qeC7hRj1A+G+CrRWM7dqJOZnTTI+PyWUR9I3kk3V4KP5jONk/eH
	h9V+b1wxbMRZjt71G1o9Ap4viPyoJtEK5re7GKh22viTZMUFztaAPCqT63BOyr3oVBgrB7dRQBK
	j3i4g5E+xIDUcBEnJjnE0gOAg7OBzA4njdZEBebo5KGZb/xUv0xLTb7R4fype5218JDzKee7jEC
	ECcxN22AxGCwAbcjipropg3zZSgvJl7oSGuCAiCEFiUTEoPJQNQwYM9HwkV342iYr6chofl9zUG
	U8SEshmek9xnd+T7MOYx2j+9H2uY=
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725338b6e.38.1791556648822;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725309b6e.38.1791556648153;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50bfe56242bsm2101180b6e.0.2026.10.09.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:37:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:07:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pablo del Arco <pablodelarco1@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for
 monaco-arduino-monza
Message-ID: <20261009143720.jk3556szgkwt57qe@hu-mojha-hyd.qualcomm.com>
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
X-Proofpoint-GUID: QlVcSl08OlkKXz_3JqKZKJYkG-nxN6dP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX136tva2jXGSM
 qD8oLeR1YcEjUBOhiUWKee9BGKNiqaBmPsvnLv5mOD1xzzp9HbPSXhyIJeKDSQLCIpXX06+KJJ6
 CsJNRZEAN8ooqjeOWPsNqoF1SwpL9iE=
X-Proofpoint-ORIG-GUID: QlVcSl08OlkKXz_3JqKZKJYkG-nxN6dP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX+xb4CDZFWW7m
 lqnopYI9RzS/wrev3HmX1k8vgpEDO/YZpfugfLNzhjSx7aWlru4aIBLRgYAPpW5dng/oY5yylTa
 HbUFLtOWO7pllQZVHZtPNAzQ7JXWoRO0KDDRy6PFwxXEKigtY2Q2T0yCCKq0Sq75sqxS6V5+cEF
 pmOpUEhreoBXu/C9+0tluikKoOm5Re1xHGT4/9r5u41JuInYsb87oURzX93nLArzKqmuhUzfgIG
 R2on0zOsiglOXZYl5GUGpCLMH0VJj+Lrk17bncWHeZK7uPathdcLKgfJSngADul7GtSi+Dgc9qK
 +PITiW62qhNBD/sbGhtMzhYzQ0YOiCk+UJyX6Gc43+hSCMYC9PqBr+Vp7MvG3Rjp9V22ALzCMWm
 LIjbMKWgXta+vyjjMKtD18WSsT8L57DLYXTI+HBgg+hKxST8nXoknsdGfxgGdbJqcU/ZEl45XyL
 Up3MPUNeJpyiapSm7fA==
X-Authority-Analysis: v=2.4 cv=YIUKWhGx c=1 sm=1 tr=0 ts=6ac8fc29 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=05w5BP5Rb16C3YaoyMoA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

On Sun, Oct 04, 2026 at 12:18:49PM +0200, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
