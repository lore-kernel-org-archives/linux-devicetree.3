Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3A54AA58D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440934; cv=none; b=hy0MN1DoVtVMe6g9pCNPak5IB8x0R2AgwFJoJlN9ZMSVb3tydKSf8hd2yis7h4oYL8jLsWLw3MRpENMKb0LAD1zFdnz1BHwQPv+Hs4x9aHr+woy17hPy5uInEV9ovDg55MBDXmMFznaN8BuQrj/zJaozzZVYrtLjKjGhWj2d6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440934; c=relaxed/simple;
	bh=0GNg5kNgdHCE15KqkJAlxX5Kp69YoSsja79z/yO/14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejx3YJ/fg//mqvaVwHm1aY6OIqkTak4uUYq8r+99eCF8f0su3qIRSbfXHw9HtjUBACm43oe6zZ9KPNYobznCVa91s+KBkvn6o3kk2zaD0JJFCu78tjPPJXaJd8rxFRSEr0rNaEA25f9IIFbt/aB1WXbN7kGIZe6U64xN7v/5i/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gk4ZiBiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmWBPbp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gk4ZiBiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmWBPbp8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTP3a210519
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWX3d+A3BnrdLFd0D2QxHQ4n
	ulGF3MsjnE+YJcGXOU8=; b=Gk4ZiBiT9wgXhuMnHb1OgXF57PznehxaD02w1v1A
	XZhjVvCqZZi9B32QdtERlLsOMynKVy34Q5BOeFQvU98Jam8nYOHasklRTojS6KRe
	s1aKyDE1VN/7JhTXTjjNY7nHBBedxJH9DG9hc6k5k4HhpnLH5MU2fWIg4rLRmTOH
	TKyFDBC+GrY7vcu1NhB9p8znn5IyIppldIHA+g0HkUmR2h4ZuceCnTqYVozRacxr
	uBa7afmUaFm8gM/kKj3aQkoL9Gdn+0Dq07bmMl52SCQPOfzIG78HvKgzsiaG+Rx8
	jNt/RXiNsaerQVzI2WcJT6Lq8E4zeiy3GpqCKWXTyXAS6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k8c6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:08:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so441673385a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440922; x=1789045722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=jmWBPbp8iiT1S7kN9NgOFnr9/KzH8WWdXs93eo5wzhHL0bA6awxNJy3gg5EocKKhjE
         seorpy95tD9xUWPhtJGF974UF3l0HlAi+/QTYt7qBWB2vFbCO+Yr7hRRTxF18z5fZg12
         VcV2QilAmhKnolbyOsU02bczHXJuePUPQMfZ/yjGE92LOsP/rYtvXv7HZ48B6ToXH15F
         hMVrV8JzQ+DrcqiyPbbPkUuE6E0RHARJ7ljahxFed/WjSFA6zB5ecEskUoIfQQ2xIehq
         euYLWTVHVI3mauv7Pywm7GhfOmv+s6N4ZSYeAHzgi9adK1LId+pQ5RTc6E6FKnD3l9vZ
         UFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440922; x=1789045722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=d1EH0aqJpjSYjIgKSGaosjLnPfEp3lABJPe1xK9XzVN7kVlAj2bD1hUx6PtU4f/+Tw
         800SENxj+N5cIqx5Y86oVgpvBRCXsAbh173tQ5SuUjUfAlLYgtMGrahpqKO/5mKZRPLP
         ntQTL6/2mkbukWzvNWwdHp7kBYqNcoxBnBb7/SowfgJ/xUNFhB/Xi7dHt5XBcCjI4ZrZ
         UvQRpyBz3ZZHAnUvyY2AY1UDD8ACOMeDESrdRJBA0jeyMvqUL8Q8ZCgpWS92o/7YSbFj
         nGv7/J1cv5DaDC5+TDpdoWXiEpJPYAx9buIACdyYj3LCGzZXoZU3da72MblXP11TLEOr
         SLNg==
X-Forwarded-Encrypted: i=1; AKwUvBzTidzhj7qAkhNSYeEikANz5DXe1kf+jSOP6kZRYhP5wtc+IXXccnQYuS8fJAXIauFkl1JSy25IDYnE@vger.kernel.org
X-Gm-Message-State: AFuF++lzRQUR99v7H3QvRU2rZdO6YTAxPktjPrfjV7qr+GcJ0gGy71AK
	TJLn2PuQ9i28KwU1MyzLobNLtDgOuzQOnTKb0qjNLx5cmU02saaig9R+rXik1QTdqFfqS97EEGt
	jLQ85NxC+s1+kOlXmR2ZRVOdQ9tHLcwOuMGWRIvjaEq8/EJ939KkkwngGsODXp/pa
X-Gm-Gg: AYBFou2Qeo106h/6ofhfb2bTBo9+1TyYA/GO62ijFNkdzw82JXO8srU/mfkM7odrrj7
	gJG29hTSFi+ir1CbUYmNqZJKPY4O0m/7cJnCcSAlg++/xkblsQWh2HVtgyJkA+5s6jZ8rPV751t
	NHiHWYWaR2H71H6183MIIGB+aXoQrUUJMY0m7fANYRJuof3LuA4B4zw2MdVzHF6N3XqxKWjEVdq
	D1gyCb6dUPq6lDnBDf+wLv9VBLli39erAjCtD9X3NCSxA1FWZvmILoIYleL79fKGL4ayQxDZqzR
	aZADV85prq1ZDFUmmqCQPoRMSzNcgqVOYBBOdXLhvswkLceWz6r4AdkYvzGcts/IAfo3uG9T34R
	suMsfiY7Gtqxj
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725605985a.12.1788440921689;
        Thu, 03 Sep 2026 06:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725576585a.12.1788440920416;
        Thu, 03 Sep 2026 06:08:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm14540106f8f.26.2026.09.03.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:08:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:08:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Message-ID: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: zXgvKqU-1bGWWinBta_m0rxuyJAlj9HI
X-Proofpoint-ORIG-GUID: zXgvKqU-1bGWWinBta_m0rxuyJAlj9HI
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99715a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=g6LbhwNr6PFK3GcEcCIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7VYz1DiT+DUi
 YWDgNyOugvQibXQ2WbHYrcHgCwNy8o88T4dDW7xwuYhgPKHPsgNXyWM0M6dW9Uib1eNJitN0rBp
 6IwvefeY7jGLiuM/lTLkZovgO7dpE9a7wEuCq2xrcxugPh3geV9LY3D6N90d7MMMHtWkxQfq4nE
 Fw3z54/nUA4Utq7BckRmWnfYAT7k2j3n4I5utfqmzm3uhAx9wtmZ1mCS4J6D2MkwDzjWTPz+jjH
 O7Z4b3bLLee367zej80nyILZavDnMWWgVErUSabQA9QUJ3d5p6T18Z1QWKK7ny4oIDpxa/55JCF
 B5XB9Tr+AB2PdAk/i8FLaYGesX0SKovkIKkV77U1jgIJ6X9TMIfFrTv2ePgngQWbJgwTbM504fV
 KZ8u5R5KCKMFWxGaSTyye+F3Fgs69g6bq/DOlnjztb2BjpKU1fCJ3mltZW4ivixaDp4YPINjYLZ
 SPCTkjB8jAw13XSZq3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX2Nt57maqdAtK
 ehgoPX9684UU7lYUIhaeBZmcLH4fmZHjcVCsOxMi2ozwMWEHbOiwgsajPlu2cqZepLDmQDqjovB
 HU8bsaWYONSAenu0S5aYwZrSv7qb/kY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030113

On 26-08-14 05:48:18, Luo Jie wrote:
> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
> provides the raw reference clock to the SoC-integrated Ethernet PHY
> (EPHY), which supports up to 2.5G link speed. The output frequency is
> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
> CMN_PLL_PON_CONFIG register:
> 
> - 0: 125 MHz   - for 1G/100M/10M link speed
> - 1: 312.5 MHz - for 2.5G link speed
> 
> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
> for clock-tree consistency. This is functionally identical: the
> output rate is purely register-bit-selected and never depends on the
> parent rate.

So it is not a slice of the cmn_pll_div2 then. What is the actual source
of it then, in HW?
