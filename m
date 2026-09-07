Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE6347CA81
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788172; cv=none; b=m+sVtq5VNSUMRfnMKwi3ecEDpETqLV063U2OSrmigAYdGWI637i9ZKX1ydDYUXICfpFWEr4ltSLzdSPUF/GZPG4xdZcXRoEEPHl67FZesKupH9BWbkuQ6UZsVYSkbBhFerILwcIH3Ht1sGyKQAyY/h6EPAjPYGnNQlMNnAu9bsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788172; c=relaxed/simple;
	bh=+Yek63hwngBoHzkEu5P22GU6w+61FzkkWtJrWAOnZzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz7OBRNJc7ATWUtan3nWhyGJrb8jdIP47gVXUm1E/DoEJAIRxYB46gnC/p1ZQgP65qFCwzIKLbSEVyjJcJB1vkMgohXZUGz4yB9eg6q1RRGpIOzPkvvWCcwTmcEl1YA0ndNT15vsnwuBolpsP7esOj23fFEVAVo43p7OMH4Tv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH1jhzRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1t7bDuu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH1jhzRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1t7bDuu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amu6J3349019
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nuvly24FDGwG7YRRA/F0rHJ3
	9EVW+7Vo3RK8fyPQ74U=; b=nH1jhzRbtI+Me0pUZo4bAJgTrabfxd4do6hTkdzn
	CNSg6oZ+w3dOACONJ5DLmhE51DKP2wUIjEhZNlHpm1NSCs+5J9UWQuun6gbwcNGC
	SMkjg3E9wSo02jH2lDjrPygg9IHsAjtO2aegPRXTqej/GG6ACyJOm2+jGLm+fu7N
	e513f2BElebzGgcJjS7T7MtvplFbO0lwUtvx1dgGx8lTmf79yfGd9lOFngpWz9ZF
	9sZBtbPwehxNQxBWDoFT9CF34x6kmDLRQrAUKw50RfyKztLG3dSswH5o7c7pkFr3
	cuP9ITJbDDhVeuHXQ7GnPJ451ERS7kkkYsOIR0ESsIdLKQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0yxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:36:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-756261d422dso2629882137.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788170; x=1789392970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nuvly24FDGwG7YRRA/F0rHJ39EVW+7Vo3RK8fyPQ74U=;
        b=C1t7bDuu/jPHKwlM/qiljKRXrNcVQ1ku08EYWs/SqXQdr6Ygq/PymgS2lyU3KJli7u
         w3WHAWbSSBt13VczXDGbapkp3js3QbzGF068c+Kr+GEjV+KL/0EAOlC3xBe91VkEaQi1
         4dEErhQxmn9TOdPjAKHzfZ5QDG4Xx9VLJ+qosPWojBgr7HNMQt4SdEieCcWb36F6DUA7
         epp4VIuDFKSeN957mOY2YI4kLe1keidztqowwhMoGM7NKvFdp2U5ASTZp6PanaAzyG0U
         Oo8cPDUG5g9OX+qTNWQrHVHhl/0uNir4CmMLsmMW2u3jf+8/GvYWGRl3DFk9tzZjU+hD
         7alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788170; x=1789392970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nuvly24FDGwG7YRRA/F0rHJ39EVW+7Vo3RK8fyPQ74U=;
        b=GDMK8KsgJ4BFXfvFR9/ybTwpEttvfaI0b29vHbCUbqVTjpFBCLWBFQ/QKqV5/xF0n3
         qviiID7np0t23y2lQslJZyxt7qLP+89IA+cH4wmwMOdZ0CUHKJYTKZhuEWxUS5LGbPgL
         1ZwS9FDqfE+91zNW2JiVvDaRzTeK1Vb7Ac7tlXTk0VOqsx+0V9mmTTmUV1srSqbp6Ibm
         2uhqOksyI5bSNvJSwGx097W6Dw9ghMOmczuOWOr1d8VpYrpvm9ZHQqY5+85LCRC4GJKY
         O6D2jH9NmCMDSnHKAv4AqpC4+YKAJk7DcALXI5I9gJL+PZFqZrogpr0Sh6Xyas5wWZRX
         XosA==
X-Forwarded-Encrypted: i=1; AKwUvBz43/EnGjA/M41GKUMaUdk1Nvpj151Ru5RYDBNLaO50n2e4jR8vEiRlp3Ygdhg6Vp9OXZzPvItLKXCp@vger.kernel.org
X-Gm-Message-State: AFuF++mFBCr5xPu/Si5kr5bcPgfcRqx21DWnfGsu2/ND5iFg54HUdP5U
	H3157THKjexrB9VKH9bpTmYokqQqsm0bvE0tR3XNejzVlk8jGmlTno4PDO57K0qUPGsrsa+5FkF
	ezwAfcntUBqhB/stwhQxfRF3KFENOOejlwaRkU5Q/h/7nHwpKCZ5fYQZlvzhfn8cs
X-Gm-Gg: AYBFou1kQPABqtVCuBrhWTF1mCCqulB53Qr/rYN7hNRIfHYG1gCgvBLKkc0Q4vfreba
	8xH+JBvcRWCSXid7A1P5fYxUaregzMa/YGAJSQU0muE/pQM1ahgeFBeod6bm7tBYTr22if47cOJ
	Pj8RuS69J37uhH3InN2epVZUKnJCY/3QyPAPbNe/x+wnCJARh2pLmP7r8hpESWCUjehWFXairZS
	pMsnSYr++GFX7IggsPHwot8lMdWcRVEbk2RmTUDjkhIodaAuFB37akvrfSRbcmdbCNt5wSkTBLN
	YQQR606jbMyWT2LRxu98FLJ9HzDA1OsT7N9hWV//vIcpjHr7wGXzvyOkGf7Qh0Ol0Z3nu8LLN+E
	pW7Gina8wBsE9
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr9600162137.6.1788788169597;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr9600123137.6.1788788169077;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm28060777f8f.32.2026.09.07.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:36:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm: Properly handle msm_ioremap() without
 name
Message-ID: <d256qsfz2rs5rdbfvmrxi5m5oitu4266ybhfx44gd7biuaykxm@tfhjzjxqh644>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-5-b097cf1eac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-5-b097cf1eac77@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9ebdca cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YrmjDuPctlhI2Ist5Y4A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: nzIjDV-fV1vQbUK6vdMomvOrXxXYfb6r
X-Proofpoint-ORIG-GUID: nzIjDV-fV1vQbUK6vdMomvOrXxXYfb6r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXybvtCppgsQwA
 72LAC3a8IdmLB4kcAZV/c/KeePcci/nviLCTW5XZ6cylSW7S04qlUOmNWYZaATweJX8gboMbXGy
 jBZneOm0tcK2MIg/QtNdRoWHLvGRfzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX9Sm09alt0VGI
 BG5j1rK8HZJTWmBi/whNtnrpRP0mgUmHq6jm8seT5xf5WiElJn2/KwJUqxm6JpQ3+ye8gtGxWMU
 hlYF4GDH0CkI6ljBViB2xYreT9zhMNvbF1Kc7kOiK2sQT+hBycDl0XsXz3qMMgImer0fvIk3IgA
 qb0DC1uUv/LXD/4ooTWiE4RuMy++DOuai0UuUBZAO2GR5B5fWWqaBU2XpXBnLWJXzWM0nd0fg0v
 MQYJW7A9Wv5Yxoh89Ke44snqbW3/rbmsbNNOF3szRSRGBdrApvP49U/2Xx77/i05kmxAGq5gth9
 117Bq8bE499UJxTNI27tuDuQ/Mkt0o8LUGAmP8NQM4lEQ1ZcPiAQn3doefQUr5p0/HL22MLS0Nq
 5A8UcmPSj+oaWXxuKBurnkVFFBlYXzpMdjepW2VZ4oJI7tfki778b55X2FVPjDwcP6irNrNQGLg
 ATIzmSmfL9X0GdaPyTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 26-09-07 15:00:19, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
