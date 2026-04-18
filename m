Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB2175A97
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525255; cv=none; b=oE9fJPPNOowcVRZM9edmyG3XXppOz5LRYubpledNfBzvZ+pN9N0aiUlVyrYNZnM34ONWehO7oHm06L9UsLtLgB0Q86ICAYJwLfSIw9oIc/6mRvRiatMArMKNsIPR3+vsLqS21pX1P6TvEJfyPbVSLtk8XNrDv0DIE4DYBQmFXkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525255; c=relaxed/simple;
	bh=204QBBlZ7mJL/vdBS9YjwwPy+5WB5KYa2R+awQTEXag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAVu6X9TKakz26pFd2FWwYZtcWuVtiIarR/YRFq3tz3y26Zj1/kQJjdxACazPkwQF8JIEPMgiPUpz/5aJNQ7xJzyhsFBRwlMlFRCxPnl8UW8Jc1D9jhGGUlNxDz4MYGdcchf4PHWDlqyM+zGQYbs6wGg6EPRrvib7qWVjDyVPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZ6swbil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9jteH87; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZ6swbil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9jteH87"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IC1HxP942487
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGaZcOGTRAX81jTVNqQyBp0w
	ncHbYacT5c9t43/C2w4=; b=GZ6swbiluZmUlFjafY/otNqeKWrIT3koHNOQ6Ex9
	2dFYDhRyVPn7Eq7bX0VIB989lsdMPNd4VpCi5fFhCtoKLB5lZ6eUNByIHnN1rgtq
	jumurd7LMDsY6cHgQDMtQZmVhwq8QC0RH1hnXd9W06ArEJCo+vC2gRR1WhfaVjJo
	lgUDc5dTtX7RCJUOtcZ3eFSuILtJxzU6ORI7beEpCOPsd0L2TWiLFCTOjmL14eBj
	vBs8QLuSoFQQKRgpPcaZzdgZkVTunhVil/D995BwEJ7YClbVEOZeYsb8KvmsuNuR
	p53JB2xr3RXP6X8xQejxZ9CCZ6700NHWYBJD2EsAHMWOjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx12u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a5f6110cadso41100816d6.3
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525253; x=1777130053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGaZcOGTRAX81jTVNqQyBp0wncHbYacT5c9t43/C2w4=;
        b=G9jteH87sO8ZBFCXWGMZfytv7l4lE0a4cxMRqQy9BzKLtXNqR3PmPilQpjPXiqps0I
         26Vaf5hMpI42tJAl7dpfPlW7K5+FQAvDS2Mqa+hBEgO9Uv+K1C9GIz+BxHMYNW3Fdqru
         aqROHfOb8e+SNUBMdXV6dC8ReeBZdi+ZrkI3fjAzJ4cpvIcAah/Lj+oM05dGZW5iak7+
         2ha1GLRswbGfEax7QLFOmN2G2TgOfmIZBmrg8gP5bUcaFfcp9TS30Bd8zuzei29VWRPN
         n4S2FWS6bsjoFZ8JFhGZvqF/ICQgz4woDx8P/gjlekGCzWntZnzWwQszfaNu+vOvnQWk
         ZQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525253; x=1777130053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGaZcOGTRAX81jTVNqQyBp0wncHbYacT5c9t43/C2w4=;
        b=pXY3LvSvjndqMKZAmCO6styjG8BrW8QlUWR6OFOrjT818iTmNc1JXjMpHcSgXFWU2p
         wdjFilbSmedweFhcDfnOt9GusJYMRCRE8QLR+Wks69nDyWrFww10EiKQDsFj1LhFVpBk
         X70gcau+11+kqBOSOcTb+cZHIdDgi4ITTbn2/NtaQWRbn9C+OAWmhlRC1che+oaLyrq7
         E7R6z5AwtevujsXASxqQhS7PuDrbjZDrxGpakxXJJfaK8R0vetHy5F0CwV4YX2ZoiHSQ
         A4dygaZXAwycUJ8CrDxldiNBGfor/rNBOHCEftevNVg78jUyqBaP3YEgFzi/QTjAwxLh
         e9HA==
X-Forwarded-Encrypted: i=1; AFNElJ8TwI8bTAlZB5oNfBvvL+ru0m8SqLahGUpjVAw3Vg2aFtPu6NzI9CcAeaUZl6qD/9fWW2TBF1MUnRgO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+091sgsyosowxckVWov5TawIhWK5lxKLz0ZkdMFi3ndNdpEIy
	vHZlEyUfx0Df5WLjQnBrYhA3jfX8N8QyvjdCG+BFh67OW5CUjcL77sd/rKajN5/yDYLSziQywhA
	AqYYyff63SX/QuuWkT6q8L+UmBVJMury2l2yr0dKfqEOQVPhovfVt/biFAv/bj5xa
X-Gm-Gg: AeBDiesWGYpDVcYoEGWNYZVWA1KvyqCmiIwjBrAj8+PL71PzKrLVys2ZhI21TAnDMUu
	u/hnbNpofRFcdFCjx96ZCt8IJvOyd4G+5MJiXq6+GLys5BQxFc0/ZQmSdRDlKO35g/Avy2b85g1
	p7LeO3qC9nxsIFfkRMOk0zWA/2aOfx6eBEWHyKtNOqHQ/uANqnQKN9yFgCTb+KlQkEHvj+YuiGy
	ZL2tS1pyiNnuJwY1AQcNuquv1COWxcjwm8mSlt1Y7mlX7qfuWC2cVyRiWBTEZnVDkvaRYO+J79Z
	Y7Q4WYOBmdDtD2B8svQlc6V5xDm6YZ1QE5Ag6bZkDhTIVHXJ02xHXaL4P+sfsmcTTEJAOAKqXGj
	7bRuL1op6wZnbj6ienkCwmn3S4LC/VZ7x97jj7ieTmP8NdTtTSnuFDS/rD6lbD92XvB+RkGtUpx
	75tllFIBKLHXTJ4pWVlBquYloroHvpnCObMquPqscPHV1d+A==
X-Received: by 2002:ac8:5a93:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-50e36b55293mr107133531cf.27.1776525252704;
        Sat, 18 Apr 2026 08:14:12 -0700 (PDT)
X-Received: by 2002:ac8:5a93:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-50e36b55293mr107132831cf.27.1776525252243;
        Sat, 18 Apr 2026 08:14:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm1393177e87.49.2026.04.18.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:14:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:14:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <3t2ujr7v24df4o2iplngwlnb242klmr7wkaclfc67ey2taagdt@h4benc7fqesr>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
 <20260418-eliza-imem-v3-3-bfbd499b6e77@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-eliza-imem-v3-3-bfbd499b6e77@pm.me>
X-Proofpoint-ORIG-GUID: pvs6gFIR4-hOAv8jxQ11wnZ3KuLAw2fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfX47JbF+QV8EGf
 7BDcJfUtK2xkErsnsccswavDtxl0IWEh56ncmdV1CLifju3EQn07JaGnwYerlpLfQi7BBENZCXX
 SYp+Nd2Y04k+31hP2OyCmh4C4KsEm08QCNjnSji3nxmoruieRsI62eP56uQCGGVQu9+QvVXxB1+
 vzQQcv+Yx4t9LVD+h/0tp8xP376GXTYtQ5oP+6LpgqdOu0rBI0WsQ6LkTo4lFzz5V6q/V0jTuVx
 uiLcbW3YUMsAZhI3FOC4n3lRCCX8fHo1Ov4HihQMrETYpzIqk+cmQGCf0t8o7gz6jODD9DXMFVq
 NtGYOlHpKEgREY2+TY40Y79JwCiXwIjTwaw38NQoYBIzk1RVhNDPn0lAL0bbyB8/pDaMr2yGmnn
 OFt7IbsmpL8wIUic31VforK4VeyySPYP0oWYCdcGIDThX/bsKKAXeI2Bu4o7FPPV3UBBI3AhQ2V
 7+jyjNddiKlRhszFBEQ==
X-Proofpoint-GUID: pvs6gFIR4-hOAv8jxQ11wnZ3KuLAw2fr
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e39fc5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Dit6OCI-tkvg6Kv7NAsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180151

On Sat, Apr 18, 2026 at 10:40:00AM +0000, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
