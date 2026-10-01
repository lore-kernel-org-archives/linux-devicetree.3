Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE337E5F1
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819847; cv=none; b=Cu86q8hevB8OtxMYAMkwWn/2xhGQtvrGrkGNXhlG/tOayJ95are0N4mMc5jDuODxDEB5iydfSVp/6D+BJNHNxYlCXY9C9jyX8zpDpxJ+O2QPFVYi7DdqyhJHnJiGw/rONEjJP2U5MJqg/2U7IjurxQatZNevR9qFj/ofb3cJL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819847; c=relaxed/simple;
	bh=dc23h0DAzeahU2YQjWsf1UtM8H72KH4uKWQYNEb1GJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKfjk2fqfHTrndV1i++/ZFE+GxzpjR9F8tET4dZs11I0wEApi5dG5JTLt7wl9WGc0UtQyxhB1xrUm8WUEtQIgkhuGVZuu2XBFWn7hXS9s42M1jdrCuSsLIVFz87gFOSPrx3rA/6mz08Pa8o3Qmjt1GI9zA+q1slcrp5dp2bdMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S50noS3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3ugecIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S50noS3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3ugecIW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k5C4495746
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 01:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoVV9AMom/z0Z5MeMxOVZrJn
	fnZMhEF3YGoQPtJPVgc=; b=S50noS3aCk+5o+zo395zaz85DH4dKB/5pNEcwflo
	sOOZu7Jf9Zf4L6f2HIIt2NIOJgaC39THUFZ5YJQLhQ4ZIA/9usI4JfGvnfqc0Asx
	0xG7xi6Lyw8j7eoN2QXXDGurmww8SjMNhIrwf1pzzU6/MY9DDL0mYa/WUwzLZHFG
	g4UtuhHxGQaXLZgYMOuLaVke4M013uQinV4XXShCcGSj49b9X216TkJlJfrLcDEf
	RYCTetkmOpdbhFL5iw41bl7O5SOFH9aLRSRNyUAwQctTN9BoBgAK6UMluDs70FK+
	CdnQXuFv/CLkLPfdszF6bWnckNNhN3iGN6k+73VZ+TnnsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pj9hsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:57:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso77818985a.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819843; x=1791424643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=B3ugecIWfPCyYWci1T30GWIM6J45zSEjj6EFH7hpByKPZ0mpcumVoGHtvzVp1SDNG5
         +nszWC1CNppg8jqGiucCc1tqfiKXVjiS7/nrcJxEnfeeFUHcWXLaQi+K7zrR62J3yuk7
         /Tumm5fF9dglVgzqSKgJaN9P7W3z2ebTt6gcnQ9rbiUJdwEj+8r5d3RRenBBFFQUGyke
         FbyXRQx9t7uMe7zUzY6Mei+GwAVyBNe+ZoFvrbUc6ml32FNVKuV3x3C4O3SqEsnwAVju
         ogXESl00SBq9ItVufo/GXeOpmbtPKL9qT8OFETWH0fn2xutE5cZrmJnlvtpeLY2bTy3A
         gjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819843; x=1791424643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=kkIbxkcwIT38kVNNAQg9sfIX66Tc+YP1wRvSFNCtWWMZcXnD0sZiCLNOtylhoEF8q+
         L1FsdghJlhHS4O5jkVkjH4DaUXLJnBGILECzGNautyk7AxuVEtO8yRQFaUrQi3e5VxOR
         h1xME3VzUvXkK+ZVbtHb/o4Csr1HqIFM1pTCx8FKGY1mBt3QS8+HHeq6cqK/FVnbYaV5
         WUVLbHci174S5jXs5/grb3O0BvLg1mYRzuu1QGhxVVrIPSJBIVuCLpv2WMC09tVez2yE
         hBEzaMt+AYmxAtvPqg1rDmErx/FKcJ4oAbhk22KSPV2v9fw1ECsH2/akSVR7G5bwEM6v
         Q9eg==
X-Forwarded-Encrypted: i=1; AKwUvByJVIU8eyVYekEJr/qTeMayteSvRm1yqdm5XhYIxsflJdOL4IhcDpn/ZPEztkNiE1E4v2KdkAFb+87J@vger.kernel.org
X-Gm-Message-State: AFuF++kcP+/066yIaWjh3Th2bsWc1/9XM+aA74veVgYVwJB3gY1scMhS
	WLiUoKokCmjF+yhhUtSYWWxmh+BP/8e6XhT/5DDz6gKipkXVyyTQ2nyq/ABIGw2SGB1AVfPHLpO
	D3lBSzDpKgTy254rwaueSUNZQvF9Sjv8gQxQyII+NRIgsjyggQjKgjKgdnPTEJrSd
X-Gm-Gg: AYBFou1kIWxGcu2yJUryHkuBDtwGEYkk4CMvSFv5N8rtDj2bYCvDNVF3yxHZJpYEnrT
	/4SmHBab8/aiW8ct0xttAx7zGiLSLoRW41EAt2Vbl6cyXdYh/ZRY6/u1P6udnAjbTOt4SRmw9iN
	Xpulfw+5hDGfX2ChSVXYp/7C3PeStu5oMZ74v0EkoAll80UpuYv5b9dwnIcKJvDrP214FsHEg1I
	y90etn1s99esNlVqMJGjfvti4v5t49BqW5wcU+czN6noEQGvLBwKNwd4oGom8pRs50QFt+Kb+ZX
	NA6U4Y9IQEBN7TTtfs9afq/Oq2wtvSqmC/z+Xg6/wcvtJUPiUh12NMN1coyITnQsXS6iKUzz5+6
	jt5EWOMK6FiARyzeqXtHnJpLOxvoCr+NDMBxANmYcquz+hvVGyWAu6h6U7nT4U2SC3X7uDAitDw
	rdXjyzT4KXnCNW
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287209985a.28.1790819843409;
        Wed, 30 Sep 2026 18:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287207785a.28.1790819842965;
        Wed, 30 Sep 2026 18:57:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192ee13sm12526111fa.30.2026.09.30.18.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:57:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:57:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 13/19] drm: msm: mdp5: Add MDP5 configuration for
 MSM8952
Message-ID: <diibislcaubtwwazmkjsv4y732har2eskayle5mxpdkr5npana@uckh2yzblzxp>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abdbe04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=YvXxkWmvim7rQlE-Do8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: kuFFi5ZtcMHMDKY___N9J_Bhs8dHEe6s
X-Proofpoint-ORIG-GUID: kuFFi5ZtcMHMDKY___N9J_Bhs8dHEe6s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX9eTHfpp+BNtI
 hpTYmqscM898MZHQdcj1XJQyFdqrNaJM8/609BErIi1Qr6icDgXu666wua897aDc8ICAAv47S0T
 gBe7N8R1QtaTfVLOmOr3v9AXZmQLnow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX1OqCeO7Fcw71
 211UHgX6NyrRezSEMfkbGCLkhBhOB6MeQ/FEggqNKxzDh0Sy/Cf5j0/AmvzBPf7sqNRNeqBg13C
 ZucH3frNjygAIrEiwtNNOCrTXpkd5clk2BH9cAfbMdfRolBXa2COrB5zlbowV3Arj/qWhlYY/Lg
 L/u0McwUV1FHovAXVMP1FfY9eZoBzfKWUXlER4nSehjqK73SrQGleX60VAAbsw+1mdc6pTIiWmT
 vWZWGhyARnEWQXPtPERBF2+R/bWVX1bORQ65HZO/j30oug0Z7rkQpVlTcJbXCl7s+1gS4oY/arX
 xILirdFmMCwSoquCXaYhyeMjDPrFsRklgPBT/BllsuyeMCS1HRROqiVE1WAH8NX12mF9hiph06Q
 nOnmYrZ9K0nQhdM6qhUm/Y/mB9WiwqM3cXPKQZI/W5E2PZWkEtTk4OVJHXHHII3hfbcJEYELqI8
 AajtEflDCYz/3f3PvWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:19:04PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add the mdp5_cfg_hw entry for MDP5 version v1.12 found on MSM8952.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 81 ++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> +	.pipe_cursor = {
> +		.count = 1,
> +		.base = { 0x440DC },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			MDP_PIPE_CAP_CURSOR	|
> +			0,
> +	},

PIPE_CURSOR is invalid and should be dropped. I'll do it while applying.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
