Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496013F7882
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109432; cv=none; b=nX07dT4/e67fyDFxP/TSbr3ZQVoc9XnW+zVQsCcB29oN9hIEYdpvriCfe7HNQ1MWa4SQOATKiEiDl6AeUnsGkrW5pr+E3YrI1yc6XJr/534+8OApJV4H91vdMO23YSq23Pfmw53rZ2u+K6/pPAJkkSjR5rCIFIQ5QkCcqogO3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109432; c=relaxed/simple;
	bh=aK++3JbYzV8XbA4SqPzyNT+HdEqpAKIXLsDfXp5lw2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0sJ1F5OaGj871Ynxg59qWgzMQ2Telm9d05RpzYFOVK+LRnL8OgZcdwzljhkQe3PKiafZJCzammt5gOk5GK70+MZTgma9LttobGCD8GMwIvIKZRfdooTL6IfCTjnDoASM8Ydx2DgRjSiq30kd+vcUljPs2lYjg5XE1Oq0jFFbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR0h03wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhLdyqu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR0h03wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhLdyqu/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7QJp900426
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cXyXo8Mcq+VUz2SeeRLSBrOs
	vJpMR+7hdf15S3RqYeo=; b=gR0h03wvvyQo3q6TcL0ZjtimSbeIzENyUxLSv4BG
	xMjb0MN6qBwVymsXhcAGlFstwr5MBzLih1JyeyRh4uGwajk6e6Yc21gSwlDNCX+p
	wVeSBk3lTwKG0CQjlL6datOFsthDKcA/K0Cyb87gf9jPYvD6pCKP7JHcNsGDAgnu
	FDratzjSfvKyP7F9wBnCNEQ7ZFLj4/meOKZiIY7rWdYn5msiXZ1l+3XV92zn1Wdd
	GXs3ujfcITSeOY+9IwZslID0aeUaH4rfgTAQScTFV4Jqq2x5uZRlCGjUUXTR1ERf
	lTLYYOBVvBI30LXH0H1/Xbx9K+ZexCP2GUCw2XDtVPDrVQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyupn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:36:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e768af628so169855241.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109416; x=1790714216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=JhLdyqu/WzTulXreM+9Nwq3DjWPPd51GfyKX7AuLy6TEoyBQN2fOGF4nvqpxcAddNe
         es258lPt7UQM8c78LJosz/ntLEOXCTs6IkggEohClVryVbsSkDJSHL/RYnsvPgpm80lZ
         yK8ehnh1YmeXyf97vDjeAmYcWp+MF0jsAysTlcs0Om7BkdQrERxOqWOU9M8N3U19KjIC
         9Rk4SaEfiwdYCCNoWrA0E0EpwtuickQ8ucvoFnDeq+lFYBLmk1+0tbg+26ipUii2UGiq
         EsqMR18T9bKarQvNbgPfwQj+N4zM6mvBbtidrHThbLPp6FTN79Rs0Q4SrRJLvN2J7Vsd
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109416; x=1790714216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=Mxz00ntoUDv3jfhCC5pOiH9kkm1jFBvCHcqdwF9XRJowX62bgcVH84c23+XlTGBgjf
         FwJXHBMhyr1aUqBIkY1Ej221WPy71TqWTk30OLX4xMLSDzYMQwWsc02yGXy9Z2uLSiO/
         Ce3/shM5/MDiD82HGQDs+bJa1BsHdnoPy3MXZoPDfYn9dRBJMey5n1XQq7W7bzfx00tV
         wLhAP+cITqFuRGGoheLsioigXJ7z6K4R46T8aTfvFVQenaku31ZkwPeKo33z55ycijEw
         fRfkhiZoy0IRDp82xZH4rN1FuI0SR0uKtcwlaS5uNbp4dsvSex9lQWv7KJhg7wfFITjH
         vC+g==
X-Forwarded-Encrypted: i=1; AKwUvBxTWkR2iwM587LC1wZQSAeS1xAZosMTWEkl3bG/FQfPZX0TK86Tduha/OBGYFNAgmSW37LLbp4jPf4F@vger.kernel.org
X-Gm-Message-State: AFuF++nQj0UqfxcRlzNHp58E8C5exuGi3ey+I/1fc7ZqRwj8E05prA1Q
	ax5hHOTav/6cSoP5j5DVUbCwje5b/pT6bSejjPBhXfHAXN+ZATfuGBlZvrVg7BZgNd/eFpcWikm
	3xP3dtJwl9O/ahoiY5YnLgE+z3kjwFEfcJEoT52O3Aird0dCw74oytdl/c2+oFxbG
X-Gm-Gg: AYBFou3y8fy3O7eYde/djxZJN5NdL+QdycryFIYjxuqKe2QyPrA6WN5GyczErQNjtZu
	FlhOOTJGi435k0xWti4YWCxQV0yTQHk9yVuBh8AYS0OXoeuFfG7ztI8NvOtcgkxgC6lfOHfFKg7
	SozXR3sQHEwIqxlHwXb3b2BrdGI883iHfR+H61NmQGM/wI660f6UdHhSPevoF45FAT2jISv/WLE
	CVyhShVfWB7NUovVSJQFGLc0n1iSCOceXajw93LrB0bgyWMGJu3RhVrU+yCc/auGNXuVRb3HPO0
	KSfwiPOBCZLpAJvaqpcOMZ8LNDKhF8B5mVEGOvIKOGIeSX+1tIbvk+t1axsXFu4Y8MNnPxeF+1X
	dxRRwFY8PkbjK4g==
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739400137.29.1790109416132;
        Tue, 22 Sep 2026 13:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739375137.29.1790109415566;
        Tue, 22 Sep 2026 13:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3541aesm5332835e9.0.2026.09.22.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:36:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:36:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: qcom: Add support for camera clock
 controller on Maili
Message-ID: <kjj73o2paa2psrd6lsrszmavkog36v5slrxlctr6d7byyyv5xz@6ecvirwrodan>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
 <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
X-Proofpoint-GUID: M8UEW2LNpySJ4epgZdJCMakgKKBaq9n2
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2e6e8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXw1CtsXePKSHV
 FU1c9CTZSp62QFgcfQ36t3KWHYjXtZ03Uy/nwYzQoo5jlShnxGOGxWmRMRQ4cjLTLN+XRogstaP
 w2kzBkhfWix7A4Q7tX1HhjRgUa9y+pXlTC/CemPZM+mt43QjklAY+8xVJRQTBWd7/seJjWtwsym
 fI2+wEkQyYXdPFNhQeWErx0DjUL83KZijWTHe8KYxZXQWwdaMVRujiGc/OWR5bpsdkvTLQ4VFOt
 tW9f9zRPAlnDVsaHKfgmBfWtbcgzhI6KQxWf2Fknk5HmaC1IPa/XyJvp3tFMlzDo5OXuJvCPuBL
 nIjzfCvmz2b+fLiiKMv/+iywwyVL8DfcoZMbx8e+x2GtM41lShImvXKGS7iWVXYM95kf1N+3KbC
 6XX0hLY0Cf2y8/w9+QgthFhdMROMkPgg6iWiWY3w+fmiptCnO+AP8s9dn+z7Gbo/Z2YGsA7abCL
 UcEz+d1zZOCJyYhOgUA==
X-Proofpoint-ORIG-GUID: M8UEW2LNpySJ4epgZdJCMakgKKBaq9n2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX8kB/TT7tTSIC
 PZLk7LziOnECkTmpZqqKEF+Coui3034snA0ph8UPIGNjLHTfIJC7FUrgZntbmEw+9aQjBYIjeHt
 n50NKY12s9GuDqbw68itsnIOOmwGE08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 09:26:38, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
