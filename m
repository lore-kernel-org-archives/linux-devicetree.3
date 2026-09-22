Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56853B32D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078325; cv=none; b=W+QntZdQUkTMKrYp8rwBKT+dUhWQBFVhmewDcg5z4s9ckehxg0iAy3A+hMTpAiBw4zom0BqWITY7sk2FquhFrwqz4r589ugmH6j72Ky5Eqw80ULc3dYQyvFhu7qTgBdTBhrW+yOalKtog1mIqiQskNyHPTYp0tpurWQzZ19dRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078325; c=relaxed/simple;
	bh=w0szmDFYAAw/McVgBMAQwonoXjKCLezxEOAl5aSxZYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sY0k8699DZFkduUtMh6tafUVen5wvWDFEWzBXp5h6iiK+ThDDcmgnGi4xOYV6mBy1bJrrCFs892Secrrc/nQTMKWIAqMvW65c2v0waitBpLDgTMRoEaUMHV3McMlU9Pdcw+rBklF8aNW1VSyoyCwr7hzuK8yrzqSFgKk/lDCzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDoGcjox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7hO5lw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDoGcjox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7hO5lw4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPLDO4077771
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6+Qtdb+PnVAFVBQZIIJ5o3YT
	xTJ1ZpFeynW9wYr7IjE=; b=lDoGcjoxYErJjEItZhADTDnb7Jnb6tyj4eNIz+fM
	VIjNvxje/O7btEJoKuk2DtetPoovhBOUkOOgzrwrNVeAeyfJLXtf97h1ZKn8LyPj
	NANALrLSNNvX34y2ex4Vpzbpf/vhn83k6zGlfvDG/n8yxKSoQPdKKak9cTJTrdbj
	bs1vtJ7VLTCFRuLKt04A7u7YK0yEHK8QUWzSjxiYzRe+PYkCmtK+GfAOooPydrgb
	qLvxGpwa+zjBKENBwrHlO1QKeamUPbckebhtjDUK9I3G/aty7IDGqtOmmC1/uPTD
	NIxNOa0sjIJvjpavZ3vopdUsvaokHs56mqWyoHvnwsaeCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgrv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd8920c132so94939095ad.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078322; x=1790683122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=E7hO5lw42Cjk3IkiYGuAnJ1e/kGtTWWpWZZRowOrpAxDkKxYbw0Y+BQcZDeyOAnbRb
         F3wvDmHbjq/q2qDnqGqDdIZuSAhZiJSriuxZEmZWgkzHjBNUmgTM2jgvmnnfz9T2eMSP
         DRujLPAkLoXwiD4MJz6Cf4PTwCvu+4qPaNsy7gZbwHOBFbY4bTHkZp1alOQ0wJ5QPFLu
         /e2LbUi2Cd3o+vRRX45OSOMp+HNWLBowKMypobOJSUQ05ZDfj1jKTMgRQcStriyyHJK/
         wVwGE+Oz0eYBvuybj/ab+4hVFDSA2Wdl9D3D3ggJ135MLndziFriKluDHSO9ElzIZHi0
         59xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078322; x=1790683122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=i69lskO9bSN3RUAbFmOsrh8zsIqyu8GRAOmSE1TqfPe+tKytOUxku8VZQPZhOCv6ZA
         drkoU9YzT7FZF0s+XvMC0zXSEOp4iV3IKkG6AzD3Tu5pceEaClEspxhSKExTlVioU2U9
         Wd8gRaJI6zMmPVLu1gR7tE7bF/l5ebmYJqSl8QNuzAuOuwug0+W/F7Gn3m7nPPXvWwSR
         rEawmHuvtuVJ0lveJuHkvoGeTtmb809McCUT0IPO0QPXu+9b2JlHB5oIpbb3QGDYe8kP
         RqrnPJb5Ga4eGMBbvENKhA11ssdh9TPJPE1hsX9h6VqMtQgv1F4FbWT7RksWJHsH9Xw1
         XcYA==
X-Forwarded-Encrypted: i=1; AKwUvBy9CPNtul+EgWQoRDU6UOz+if2RbVTQOGXiSCcyKjFKpeXGtGOz69T/0mxLL2u5dl5+wVVF40OBsapy@vger.kernel.org
X-Gm-Message-State: AFuF++kQ4XWxMLzK3XhOU6zPuhOu2lVyhUSsTpfy2htMBOTbio+xhMnM
	mIOWggD7w/iplxtblJuZAOdmlOaUEYDdLY32yEIu3Ek+PKCopP0jjKYcf4aNINjQaME+OaVY+KW
	nuDLYLKlPguTnh2p/JRQN3IZfq1TRx6iEVcD+0xFLNmgNtzSUmJd4rqNnTGMbkyND
X-Gm-Gg: AYBFou09AiSwze79F4spkTG+QNEzm1KienMaYLVdZqmGX3sZoFkfI5IURz0TS7ro0It
	sbLWC6AQNJttSSFALlW1JE+Eywy2eAxYwiW/isQJkC2qxPrFIKhn7SuZ4hC/0fatNKoCxDI9D3B
	SxWun9HkcZTGHgXRM5inFiDKqj69R5OjEeNdPXk2t2SZoj0QqbP3elxXAkLg5uD2mOYrvpwXq1x
	F/WOVIJ0BNL/VVgew8Oy4RFepOuabMXx3LJv0lf8374tkvBnPV9hBLi77LLlCxGFbBot/y4Jo36
	pt6m8sjPcxPDnbsADcVZssH1MgQuB+aKr5HOP0STwh8llkulAGEfxpBpqIYsDnE+7SE1ph+wmVr
	ZtXznhYVy4vKeSizkkcknYAmS56U+mePKhbc7znAl3g==
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643805ad.9.1790078321464;
        Tue, 22 Sep 2026 04:58:41 -0700 (PDT)
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643425ad.9.1790078320871;
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129a33esm5665322eec.14.2026.09.22.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:58:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Enable camss
 support
Message-ID: <arJtaiNMPmnNzEhE@QCOM-aGQu4IUr3Y>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
 <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfX9KiPptzCLXIi
 ZtBCkLtmjFcKn1tuHFhO9vrn0bibiuOtiPCb/VVXlJfgXeVPgdLvcnQpuYKHMg7RZqbyTp8aNay
 ZUnDlzTP5eJzO4ZYNFx5K64d/SbqvqmkH5JFPb1a9pGYBTBiGNlpIr2qiuyXtv/eeFhF7vIOYva
 ks9A/JPAety6IzhsP2EigAPktbHWiyjj78LsLL771TqbyxXVqig4CLkw7c1eCFJCmkO+BCesni4
 5PxATPL2U/N/EgO2RQD28HtwyaZes6OjDUIj3/nAg1RhFM7pxcbC/buTi9ePfWPOMH1jgKhmXvc
 lnJsO/e1Rt0hTv+xTirHRSCAVMo4sBT/9hLmHe2eDrOTrsmR+n31m6nRqNOIg9bg0kmImTcdLlh
 YRZVTomI3AIxCrNnvXcXriI7sDsnnCU7DKNKeBJ8l80xdTS89hvWrC8Kwf1eYK4yq3ecbZCTs1I
 Jw2FOLuYnox6AroKjow==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab26d72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E4mMBdOhJyD3lkwEI3YA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hbp1FFXncIykWTSIYTk109AgLD2Y3nlX
X-Proofpoint-GUID: hbp1FFXncIykWTSIYTk109AgLD2Y3nlX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfX5aiqIJoZDaQH
 g1jYMi9HIcYf/PPYrodYDVsAk5NmZuAKDX0kGgMVCy2KEveMjzBX7AYTHs09u+qJuyhE4n3BALT
 JeKsoFTBorwg0TmLisMAz3e3U53KNTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220172

On Sun, Sep 20, 2026 at 05:10:53PM +0800, Shawn Guo wrote:
> Enable camss support on the Nord Ride Embedded board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 09ee525764ef..674e2093f806 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&camss {
> +	status = "okay";
> +};
> +

It breaks alphabetic order. Will send v2.

Shawn

>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  
> -- 
> 2.43.0
> 
