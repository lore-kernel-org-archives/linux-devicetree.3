Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0094431A3E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239831; cv=none; b=h4eTKfjLRsA06+nCmmQLLTWoDS9JYQfvTM//YVwYP067G6MtLpGH3yJnXJR5Fy3wmHjzMiYf/LJPOudh1dxCT+qHoNZVhxCFBpvz+z5nWRR3sOxzy3Ciw6u3/wtrdrmH8oAyM4aRkck4/6XhJ8s981Cddl9MTeh4Eaee1wrvgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239831; c=relaxed/simple;
	bh=hPMLvh4B/qutHl/1Fl4MO4beSnCtt+tFPmWl1Tf0ZII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYJRnIimwMX5xWc0QVOBhSkIHVzOqVGg89s5OGk1DLWyAOeln2TMTUOIXE0BEOg/tKURxo1o1EhxoH/BuxjFpVtWg9K2MgN2MRvTtXHwsq3j52SoU8WlPlZ9XgUXE0tLDVFdkIfvhrNvNMkdBuubikvxLNBJbApdO9kNAU1Iu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHGTMWb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mn+5tXq9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHGTMWb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mn+5tXq9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eArl567589
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azU4cXOkIOMdloNfjSq8Jjao
	n75fPsiVrta7+Ugvieg=; b=XHGTMWb5F8EBM2lbERFdlwJBxN9bhaWMv+yAQKXZ
	SyC+6OBvmo3c76liw7hiNHJKv0pz1IIMRVL4FKsu6QiXv5o27OHE53PrsM1zj9O/
	h8xhzLp9lYc6RokGdgyubh44p20TmeKX/5P2VFHxRcj/ZW/7zs3+QrBcd5DlE7mX
	4w1h2VVhm8S1YVPCNY5yGCN89FeD7HJX9fhfbUG8hcYlyJhSD064xiBqTbEgwqjk
	CDXKsiUEr61CmI34PchFcwDRJfpuF4Xjo7m0NvgdyUKZ0vfIgV7etsUBtTRjxP5w
	Nzf7jpYNThbqZ+1PgMJgP7HXjci5tRWQdJ02EmTlX52laQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh90sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so2167338eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239821; x=1790844621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=Mn+5tXq9RtkIV9AIr0uC4CK3f2dANTZgBRHbVO2ENgErZOGf5hVB4VUeFUuy1Fsu7Y
         gxC8nrvdR0RkdljJmLzYl/fRCFAx+WIiecH/LaAtkPlFUGfEnSFUPGy60qhxke3BQ5np
         hJY5+X06RWKDl0ZS2Wy/gW+DsmUDIhoJTpoR2u3pbdwboaIdJH/OKZeMEOYjkTPQ9v39
         ike/MzYbbRx0x4qpZSvkduMdrx5kvJYBl5waBY7V0wWLqIitMIxrGpUF/pYwPhOMFxfm
         mmvx1oDxVUMc895PpyahyW80F5NkZLwP9s0l8HIlBtJoglx033cbj6pUItClyXq4SFcn
         o0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239821; x=1790844621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=uwhZbd27NdOd3I75gANcIZX9xN7X9EpvVuMFJJu++cBHj6HKCZXgfbc9kbELcf3MtV
         4gxmYXJWgCK7SvQxChQHp54MbGLQbOPaCCRLcC5zBDYLreSzcjYLs0WgFrXcjeIGh2x+
         MaL6hOaI0t0yRcvI/dMF/nyD6GIh2+9xMig050aEEn0IHhij0Ti2wTfAbD4J2qLQ2wGe
         8PLfjGQ9QlJaTOBbufESjijaV8Y9Qn7HhBCmjMUQIJP4Y5VxRis6nG3Hdmxd7OI4Y+gX
         L+vIQMdMMizp+e5WR4NCEhVJ6yTK0ar6N9gB654JR1KjhanFz8NNHUyweqT0iSYmmA6G
         z6Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwvlFh9oXN6GezMBKomu5DRIASr9sHxi10H1Q5+sZFlznufH4C3EyGW3XAq/z0GrM3thgbr/H5xikyv@vger.kernel.org
X-Gm-Message-State: AFuF++kon99gBNuTQEL9+znANQ1liOBH1d9L3jk45Ny05kHCvJFU59a/
	23l72xroWeveJqbQiqXpJ3WVnhB0as9zZm4ChCp0Lv0zFYxM965iOigFL9BR0/bjtIDGb0XQneO
	i+m/DiTTNt5pBEQdqG43zB50zOW0H8qTRSGRLHFYb6AC7GgSIr1mOc07tPZXFimRJ
X-Gm-Gg: AYBFou2kFQzYX9UaxmPiI76YIqdr1YoU6stCrwwbPFLu6kvim07UACEFYOBE8SxPrqV
	HrT2SgVvi/JnYbR6emVqpSJxSoV+MN4H0RVL/N8VjM7dLz1rSLVWLliNMLOtXz3+UhfoaVWMG6b
	bHvIbyaH0YEo9V4u6W1U7jnkfgZnpjQCOLFKbBd5ME4laqjF3TxGLGe/H74+gHPuQBUlOc/1uJ1
	Q6k/eNqpnmKYx7sXqE8jUjvzV+ug0tzSSF7sh5blKHpGnut8EcgHV8KV6nfjr8Ix/RyqY1ABOFM
	ZGM+e0duKl/oqusLMgZAEj6onPOaS+KqyE8UnPr5nbloACWLvOwPcDFHeamzvD01+XY7dL5wKfA
	5K3DjLR7HT+tZWrwQvj4V0efDHyudQv50c+oPV7viog==
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286502c88.1.1790239821386;
        Thu, 24 Sep 2026 01:50:21 -0700 (PDT)
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286485c88.1.1790239820824;
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm11885603c88.9.2026.09.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:50:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Message-ID: <arTkRbBda_yzklux@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4e44e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: fHTWrt03wAkQKKEh-csP05PMFf_CbCbs
X-Proofpoint-ORIG-GUID: fHTWrt03wAkQKKEh-csP05PMFf_CbCbs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX6kq9Dhjc/bbj
 o+i+vVdxPyRrZfD0PKPI+IY3PIDcVfIrrptuZ5WWKk6Fg5aql3MULVbfMJYDsxVo+hXw5BnzE6p
 bPqqkF9RqJXfKgam5z502Y5mz8IWux0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX0f5STgiBvoH/
 rH8KczCWqY8DPlwFYP8gxB/MB45YrW+lay+Wjw7GFtYy2OxTJNgOm2m4gFeTZGiVNHUY2R5qJWV
 Qn+9/epRbYc3p1lNB1JDSMU2LjBViFGzufd9PJYbQcV8Okgrc1I6P4VgfNJU7cckLpIpKwxmNFF
 vK4u4HWMOM/YsbmUPcpEjg/7HjLa7D/lE3ylQGcg81DUDC/z0ZoByvIpIASb7X5s7fs5WR++RvV
 hRlRF0CeKIsFzLZ+aBSaTLHNTvDwrmXg2XyqSjNif7EOjpJKI2+upXg3YMSEd+GexLQby+EMQbO
 EpUJYU4pTYzsjsPJPShEzOq6MRaxm8X3vyrvUZZNekmOo/xKC+zlXPehmf1uTyf6darQMaPD8sj
 vB/0+FEJ8nNJv49pbFvADtGIbiExoWEnjFj8JhhFeeTD0KfDcxMnYXkUiFR6aZNbLCe3GV3g8si
 P+ZFsEhpuGIQ2ApzOjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:31AM +0530, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
